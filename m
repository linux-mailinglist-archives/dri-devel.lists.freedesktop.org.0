Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B03F7E67EC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 11:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D338310E89F;
	Thu,  9 Nov 2023 10:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDD410E89D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 10:25:53 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 289C766074B0;
 Thu,  9 Nov 2023 10:25:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699525552;
 bh=2GPFBJNW5GRbawHFbqCBL3Rkx8B9UBWyRsGfJmve0+U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UUd9lFROc6P2jd9yR9cBXg5Qok/3p+glg+eiU6FCVEERqbPtX9FhTSbS+U1tT0LB7
 VaoUBkyDKRFo3IV3jCBe24hPg+geJ/rLWK6ZtS9nYSkirtiS1iHH1sMT3lYnIIsKRH
 pFocHO3HRi8vQUwGSo2dZ60g/CwVTs/2nPLB3Hzx2874rlg1TPwLwGJ7npYXqlSw3Z
 y8J8Dy7X+oZoMrFOso34RpmFAM9cmRxM4UmIaRcsSUCVXw/moA60N40hwbgaiQsDCX
 cYuFPX1wHUUyCtXTZIamvsmViWKlHjFD2T5WglwsT/hitW3Htd/ztJJmX4bR6j4EQQ
 KkdnmQQOcQ86g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH v3 3/6] drm/panfrost: Implement ability to turn on/off GPU
 clocks in suspend
Date: Thu,  9 Nov 2023 11:25:40 +0100
Message-ID: <20231109102543.42971-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109102543.42971-1-angelogioacchino.delregno@collabora.com>
References: <20231109102543.42971-1-angelogioacchino.delregno@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, wenst@chromium.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the GPU is being internally powered off for runtime suspend
and turned back on for runtime resume through commands sent to it, but
note that the GPU doesn't need to be clocked during the poweroff state,
hence it is possible to save some power on selected platforms.

Add suspend and resume handlers for full system sleep and then add
a new panfrost_gpu_pm enumeration and a pm_features variable in the
panfrost_compatible structure: BIT(GPU_PM_CLK_DIS) will be used to
enable this power saving technique only on SoCs that are able to
safely use it.

Note that this was implemented only for the system sleep case and not
for runtime PM because testing on one of my MediaTek platforms showed
issues when turning on and off clocks aggressively (in PM runtime)
resulting in a full system lockup.

Doing this only for full system sleep never showed issues during my
testing by suspending and resuming the system continuously for more
than 100 cycles.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 61 ++++++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_device.h | 11 ++++
 2 files changed, 68 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 28f7046e1b1a..b4ddbc3b8069 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -403,7 +403,7 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
 	panfrost_job_enable_interrupts(pfdev);
 }
 
-static int panfrost_device_resume(struct device *dev)
+static int panfrost_device_runtime_resume(struct device *dev)
 {
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 
@@ -413,7 +413,7 @@ static int panfrost_device_resume(struct device *dev)
 	return 0;
 }
 
-static int panfrost_device_suspend(struct device *dev)
+static int panfrost_device_runtime_suspend(struct device *dev)
 {
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 
@@ -426,5 +426,58 @@ static int panfrost_device_suspend(struct device *dev)
 	return 0;
 }
 
-EXPORT_GPL_RUNTIME_DEV_PM_OPS(panfrost_pm_ops, panfrost_device_suspend,
-			      panfrost_device_resume, NULL);
+static int panfrost_device_resume(struct device *dev)
+{
+	struct panfrost_device *pfdev = dev_get_drvdata(dev);
+	int ret;
+
+	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
+		ret = clk_enable(pfdev->clock);
+		if (ret)
+			return ret;
+
+		if (pfdev->bus_clock) {
+			ret = clk_enable(pfdev->bus_clock);
+			if (ret)
+				goto err_bus_clk;
+		}
+	}
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		goto err_resume;
+
+	return 0;
+
+err_resume:
+	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS) && pfdev->bus_clock)
+		clk_disable(pfdev->bus_clock);
+err_bus_clk:
+	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
+		clk_disable(pfdev->clock);
+	return ret;
+}
+
+static int panfrost_device_suspend(struct device *dev)
+{
+	struct panfrost_device *pfdev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		return ret;
+
+	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
+		if (pfdev->bus_clock)
+			clk_disable(pfdev->bus_clock);
+
+		clk_disable(pfdev->clock);
+	}
+
+	return 0;
+}
+
+EXPORT_GPL_DEV_PM_OPS(panfrost_pm_ops) = {
+	RUNTIME_PM_OPS(panfrost_device_runtime_suspend, panfrost_device_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(panfrost_device_suspend, panfrost_device_resume)
+};
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 1ef38f60d5dc..d7f179eb8ea3 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -25,6 +25,14 @@ struct panfrost_perfcnt;
 #define NUM_JOB_SLOTS 3
 #define MAX_PM_DOMAINS 5
 
+/**
+ * enum panfrost_gpu_pm - Supported kernel power management features
+ * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
+ */
+enum panfrost_gpu_pm {
+	GPU_PM_CLK_DIS,
+};
+
 struct panfrost_features {
 	u16 id;
 	u16 revision;
@@ -75,6 +83,9 @@ struct panfrost_compatible {
 
 	/* Vendor implementation quirks callback */
 	void (*vendor_quirk)(struct panfrost_device *pfdev);
+
+	/* Allowed PM features */
+	u8 pm_features;
 };
 
 struct panfrost_device {
-- 
2.42.0

