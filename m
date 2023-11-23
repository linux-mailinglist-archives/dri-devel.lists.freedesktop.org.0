Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D3F7F5BB7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F285F10E70A;
	Thu, 23 Nov 2023 09:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E9D10E70A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:53:30 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5021B660738E;
 Thu, 23 Nov 2023 09:53:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700733209;
 bh=k3gN0gbB+ea9yFutFJ3y87YFsrQs3o+6XZD5fLVLNC0=;
 h=From:To:Cc:Subject:Date:From;
 b=DDYOCei4fZHIyWAyWinX4g96UyEqnboU9bMRIZsgKsjqhRK88sRASURjfZ7UJApkx
 MLAr5a7rIyxlU8pmSb41pqFKUSD7OBZyyXwIH8bPurFwNLBMHfprXb+y2tQxcI8+/a
 T6QIMAQWqbQ7wb9Rq2w5O5oaQN+xXhdYX4x65MlvgDuWVT2p6/W6QO96Uz52z3dtNC
 35JSL5sgTvYxeXqAzrZ9ooZ6FjMDMiCPG7QDnkuaUnG+IkAJQqgMpTxuAC83dTgV6y
 CuGimgECmdNn74FCdPQW5H2EmnWja6LSmX2CdXJOO2CkCvbVy3Y2ZRbQJKOQdW9zus
 vpJSCD8iB7ftg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: steven.price@arm.com
Subject: [PATCH] drm/panfrost: Ignore core_mask for poweroff and sync
 interrupts
Date: Thu, 23 Nov 2023 10:53:20 +0100
Message-ID: <20231123095320.41433-1-angelogioacchino.delregno@collabora.com>
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
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, kernel@collabora.com,
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

Finally, solve this by changing the power off flow to
 1. Mask and clear all interrupts: we don't need nor want any, as
    we are polling PWRTRANS anyway;
 2. Call synchronize_irq() after that to make sure that any pending
    ISR is executed before powering off the GPU Shaders/Tilers/L2
    hence avoiding unpowered registers R/W; and
 3. Ignore the core_mask and ask the GPU to poweroff both core groups

Of course it was also necessary to add a `irq` variable to `struct
panfrost_device` as we need to get that in panfrost_gpu_power_off()
for calling synchronize_irq() on it.

Fixes: 123b431f8a5c ("drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()")
[Regression detected on Odroid HC1, Exynos 5422, Mali-T628 MP6]
Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 26 +++++++++++++++-------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 0fc558db6bfd..b4feaa99e34f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -94,6 +94,7 @@ struct panfrost_device {
 	struct device *dev;
 	struct drm_device *ddev;
 	struct platform_device *pdev;
+	int irq;
 
 	void __iomem *iomem;
 	struct clk *clock;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 1cc55fb9c45b..30b395125155 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -425,11 +425,21 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 
 void panfrost_gpu_power_off(struct panfrost_device *pfdev)
 {
-	u64 core_mask = panfrost_get_core_mask(pfdev);
 	int ret;
 	u32 val;
 
-	gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present & core_mask);
+	/* We are polling PWRTRANS and we don't need nor want interrupts */
+	gpu_write(pfdev, GPU_INT_MASK, 0);
+	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
+
+	/*
+	 * Make sure that we don't have pending ISRs, otherwise we'll be
+	 * reading and/or writing registers while the GPU is powered off
+	 */
+	synchronize_irq(pfdev->irq);
+
+	/* Now it's safe to request poweroff for Shaders, Tilers and L2 */
+	gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
 					 val, !val, 1, 1000);
 	if (ret)
@@ -441,7 +451,7 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
 	if (ret)
 		dev_err(pfdev->dev, "tiler power transition timeout");
 
-	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present & core_mask);
+	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present);
 	ret = readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_LO,
 					 val, !val, 0, 1000);
 	if (ret)
@@ -451,7 +461,7 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
 
 int panfrost_gpu_init(struct panfrost_device *pfdev)
 {
-	int err, irq;
+	int err;
 
 	err = panfrost_gpu_soft_reset(pfdev);
 	if (err)
@@ -466,11 +476,11 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
 
 	dma_set_max_seg_size(pfdev->dev, UINT_MAX);
 
-	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
-	if (irq < 0)
-		return irq;
+	pfdev->irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
+	if (pfdev->irq < 0)
+		return pfdev->irq;
 
-	err = devm_request_irq(pfdev->dev, irq, panfrost_gpu_irq_handler,
+	err = devm_request_irq(pfdev->dev, pfdev->irq, panfrost_gpu_irq_handler,
 			       IRQF_SHARED, KBUILD_MODNAME "-gpu", pfdev);
 	if (err) {
 		dev_err(pfdev->dev, "failed to request gpu irq");
-- 
2.42.0

