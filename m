Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8907F5EB5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 13:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E8810E728;
	Thu, 23 Nov 2023 12:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699A810E722
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 12:05:29 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F99C66073A3;
 Thu, 23 Nov 2023 12:05:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700741128;
 bh=Ztfry6hm4G915tlRPUEks10lc95x+AKs0SuSoQiVF5k=;
 h=From:To:Cc:Subject:Date:From;
 b=cuv31xir6qEzG+dcpVpNptwAd8CvR8n/kBjMtbxbF/dCfBbE+WMF5zKg+SA3Hom5L
 bGCyRvTP5bNi437ZiWmV1GPM8NyaCsIRZI0uvk2L1b6NVRfhkzjHcVIZej6wiuISjw
 rNejLv+l0SIbpsFrT2j473fXlc/5zEMgkOqeIboler5LkRdicW56NE4TJKo8cP4+F0
 Qx20DR0DwnCd+Qc/KDtCDY2kit5BARlRsN7NplGWogLfOqcr082sjq5Ue19xTSw0Bp
 U07uGp2fxmG221ZB6jp2kbW4ngL2KlppSH0Zju6iPKxRR4tGDTfyUb6iQxkjldZZwx
 MxEPt/7/fpKdg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: steven.price@arm.com
Subject: [PATCH v3] drm/panfrost: Ignore core_mask for poweroff and sync
 interrupts
Date: Thu, 23 Nov 2023 13:05:21 +0100
Message-ID: <20231123120521.147695-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org,
 krzysztof.kozlowski@linaro.org, boris.brezillon@collabora.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some SoCs may be equipped with a GPU containing two core groups
and this is exactly the case of Samsung's Exynos 5422 featuring
an ARM Mali-T628 MP6 GPU: the support for this GPU in Panfrost
is partial, as this driver currently supports using only one
core group and that's reflected on all parts of it, including
the power on (and power off, previously to this patch) function.

The issue with this is that even though executing the soft reset
operation should power off all cores unconditionally, on at least
one platform we're seeing a crash that seems to be happening due
to an interrupt firing which may be because we are calling power
transition only on the first core group, leaving the second one
unchanged, or because ISR execution was pending before entering
the panfrost_gpu_power_off() function and executed after powering
off the GPU cores, or all of the above.

Finally, solve this by introducing a new panfrost_gpu_suspend_irq()
helper function and changing the panfrost_device_suspend() flow to
 1. Mask and clear all interrupts: we don't need nor want any, as
    for power_off() we are polling PWRTRANS, but we anyway don't
    want GPU IRQs to fire while it is suspended/powered off;
 2. Call synchronize_irq() after that to make sure that any pending
    ISR is executed before powering off the GPU Shaders/Tilers/L2
    hence avoiding unpowered registers R/W; and
 3. Ignore the core_mask and ask the GPU to poweroff both core groups

Of course it was also necessary to add a `irq` variable to `struct
panfrost_device` as we need to get that in panfrost_gpu_power_off()
for calling synchronize_irq() on it.

Fixes: 22aa1a209018 ("drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()")
[Regression detected on Odroid HC1, Exynos5422, Mali-T628 MP6]
Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Changes in v3:
 - Fix compile issue

Changes in v2:
 - Fixed the commit hash of "Really power off [...]"
 - Actually based on a clean next-20231121
 - Renamed "irq" to "gpu_irq" as per Boris' suggestion
 - Moved the IRQ mask/clear/sync to a helper function and added
   a call to that in panfrost_device.c instead of doing that in
   panfrost_gpu_power_off().

NOTE: I didn't split 1+2 from 3 as suggested by Boris, and I'm sending
this one without waiting for feedback on my reasons for that which I
explained as a reply to v1 because the former couldn't be applied to
linux-next, and I want to unblock Krzysztof ASAP to get this tested.

 drivers/gpu/drm/panfrost/panfrost_device.c |  1 +
 drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 28 +++++++++++++++-------
 drivers/gpu/drm/panfrost/panfrost_gpu.h    |  1 +
 4 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index c90ad5ee34e7..b0a4f3e513f4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -421,6 +421,7 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 		return -EBUSY;
 
 	panfrost_devfreq_suspend(pfdev);
+	panfrost_gpu_suspend_irq(pfdev);
 	panfrost_gpu_power_off(pfdev);
 
 	return 0;
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 0fc558db6bfd..f2b1d4afb9e9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -94,6 +94,7 @@ struct panfrost_device {
 	struct device *dev;
 	struct drm_device *ddev;
 	struct platform_device *pdev;
+	int gpu_irq;
 
 	void __iomem *iomem;
 	struct clk *clock;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 09f5e1563ebd..2c09aede0945 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -425,11 +425,10 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 
 void panfrost_gpu_power_off(struct panfrost_device *pfdev)
 {
-	u64 core_mask = panfrost_get_core_mask(pfdev);
 	int ret;
 	u32 val;
 
-	gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present & core_mask);
+	gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
 					 val, !val, 1, 1000);
 	if (ret)
@@ -441,16 +440,29 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
 	if (ret)
 		dev_err(pfdev->dev, "tiler power transition timeout");
 
-	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present & core_mask);
+	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present);
 	ret = readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_LO,
 				 val, !val, 0, 1000);
 	if (ret)
 		dev_err(pfdev->dev, "l2 power transition timeout");
 }
 
+void panfrost_gpu_suspend_irq(struct panfrost_device *pfdev)
+{
+	/* Disable all interrupts before suspending the GPU */
+	gpu_write(pfdev, GPU_INT_MASK, 0);
+	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
+
+	/*
+	 * Make sure that we don't have pending ISRs, otherwise we'll be
+	 * reading and/or writing registers while the GPU is powered off
+	 */
+	synchronize_irq(pfdev->gpu_irq);
+}
+
 int panfrost_gpu_init(struct panfrost_device *pfdev)
 {
-	int err, irq;
+	int err;
 
 	err = panfrost_gpu_soft_reset(pfdev);
 	if (err)
@@ -465,11 +477,11 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
 
 	dma_set_max_seg_size(pfdev->dev, UINT_MAX);
 
-	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
-	if (irq < 0)
-		return irq;
+	pfdev->gpu_irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
+	if (pfdev->gpu_irq < 0)
+		return pfdev->gpu_irq;
 
-	err = devm_request_irq(pfdev->dev, irq, panfrost_gpu_irq_handler,
+	err = devm_request_irq(pfdev->dev, pfdev->gpu_irq, panfrost_gpu_irq_handler,
 			       IRQF_SHARED, KBUILD_MODNAME "-gpu", pfdev);
 	if (err) {
 		dev_err(pfdev->dev, "failed to request gpu irq");
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
index 876fdad9f721..d841b86504ea 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
@@ -15,6 +15,7 @@ u32 panfrost_gpu_get_latest_flush_id(struct panfrost_device *pfdev);
 int panfrost_gpu_soft_reset(struct panfrost_device *pfdev);
 void panfrost_gpu_power_on(struct panfrost_device *pfdev);
 void panfrost_gpu_power_off(struct panfrost_device *pfdev);
+void panfrost_gpu_suspend_irq(struct panfrost_device *pfdev);
 
 void panfrost_cycle_counter_get(struct panfrost_device *pfdev);
 void panfrost_cycle_counter_put(struct panfrost_device *pfdev);
-- 
2.42.0

