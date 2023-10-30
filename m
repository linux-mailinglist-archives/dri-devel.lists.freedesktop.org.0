Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7B87DBA9B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 14:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90F510E2BE;
	Mon, 30 Oct 2023 13:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC3010E0D7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 13:23:08 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CC49E6607388;
 Mon, 30 Oct 2023 13:23:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698672187;
 bh=3dUd841wLvR/syQt4DasoXOByTVGgSmSqikDkfeYRv4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ayouEfh8u3VjZQoJfUNqaL1sbnU0XUvwScA51bRYXidoKUIU/WrrDyTxp2rZzk/LP
 Lz6bliSbO/x++VGiLXTCQ6ZzPXf3YDlOvkarhJwtIUppx4ey32GL7oOqNi1TOMzNXD
 xdnxo2z4Eufu3n2Vcn8p63HOxr1zZPjlw6FbbLFRgPQno90w/DyNpCW2rTf5mBCj6p
 8jRURbNTgJPcaYq7LiGcCknoQgGcfBP5X46xsGHN32maWsaCVY03uaeyKsHbG/vaRu
 B3u2Kt3FUjSW/1Bt6Ab9yNw984J1Psqv1J9ea8BC6R50iiYkFSkgYFaKqef0zf1OWs
 IUzLvoG0fQ7Rg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH 3/4] drm/panfrost: Implement ability to turn on/off regulators
 in suspend
Date: Mon, 30 Oct 2023 14:22:56 +0100
Message-ID: <20231030132257.85379-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030132257.85379-1-angelogioacchino.delregno@collabora.com>
References: <20231030132257.85379-1-angelogioacchino.delregno@collabora.com>
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

