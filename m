Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D182B7DF4EF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 15:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D77910E8D1;
	Thu,  2 Nov 2023 14:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4CD10E8CC
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 14:26:57 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A047166071A9;
 Thu,  2 Nov 2023 14:26:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698935216;
 bh=3dUd841wLvR/syQt4DasoXOByTVGgSmSqikDkfeYRv4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QgYvBWJLWs05RlEnORo1TJ541DBm/lIqdxky3UZXiB9beCz2/sWxF13bVJfF3MvYq
 SL4CGRyEoNLaTatGFsB+XbB/uvbO5wU0sXuwk/apYugYXba0sVlY1bGk/vhObyZWMr
 kXK2pgQ7m+NQ8TeGJgmYkj4noIZuN70fD8wfsHwmT/fOoZb5pDkm7vMm6lysznLZQ2
 UE5sAIOPMPF5EABsVG1K0e7940ME9TSoIzHdcOpMWvOiT8kg9BQRwAtnAnEQEnz+of
 5MCwKqnAEp/K/+k63jVOpIcQCZ+w41qBIuJjyGjbbRn/C/MQZTAUsJMTWyQp/FxQST
 LaOzlGkwrC1Ug==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH v2 5/6] drm/panfrost: Implement ability to turn on/off
 regulators in suspend
Date: Thu,  2 Nov 2023 15:26:42 +0100
Message-ID: <20231102142643.75288-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102142643.75288-1-angelogioacchino.delregno@collabora.com>
References: <20231102142643.75288-1-angelogioacchino.delregno@collabora.com>
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

Some platforms/SoCs can power off the GPU entirely by completely cutting
off power, greatly enhancing battery time during system suspend: add a
new pm_feature GPU_PM_VREG_OFF to allow turning off the GPU regulators
during full suspend only on selected platforms.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 19 ++++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_device.h |  2 ++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 2022ed76a620..51b22eb0971d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -431,10 +431,21 @@ static int panfrost_device_resume(struct device *dev)
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 	int ret;
 
+	if (pfdev->comp->pm_features & BIT(GPU_PM_VREG_OFF)) {
+		unsigned long freq = pfdev->pfdevfreq.fast_rate;
+		struct dev_pm_opp *opp;
+
+		opp = dev_pm_opp_find_freq_ceil(dev, &freq);
+		if (IS_ERR(opp))
+			return PTR_ERR(opp);
+		dev_pm_opp_put(opp);
+		dev_pm_opp_set_opp(dev, opp);
+	}
+
 	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
 		ret = clk_enable(pfdev->clock);
 		if (ret)
-			return ret;
+			goto err_clk;
 
 		if (pfdev->bus_clock) {
 			ret = clk_enable(pfdev->bus_clock);
@@ -455,6 +466,9 @@ static int panfrost_device_resume(struct device *dev)
 err_bus_clk:
 	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
 		clk_disable(pfdev->clock);
+err_clk:
+	if (pfdev->comp->pm_features & BIT(GPU_PM_VREG_OFF))
+		dev_pm_opp_set_opp(dev, NULL);
 	return ret;
 }
 
@@ -474,6 +488,9 @@ static int panfrost_device_suspend(struct device *dev)
 			clk_disable(pfdev->bus_clock);
 	}
 
+	if (pfdev->comp->pm_features & BIT(GPU_PM_VREG_OFF))
+		dev_pm_opp_set_opp(dev, NULL);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index d7f179eb8ea3..0fc558db6bfd 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -28,9 +28,11 @@ struct panfrost_perfcnt;
 /**
  * enum panfrost_gpu_pm - Supported kernel power management features
  * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
+ * @GPU_PM_VREG_OFF: Allow turning off regulators during system suspend
  */
 enum panfrost_gpu_pm {
 	GPU_PM_CLK_DIS,
+	GPU_PM_VREG_OFF,
 };
 
 struct panfrost_features {
-- 
2.42.0

