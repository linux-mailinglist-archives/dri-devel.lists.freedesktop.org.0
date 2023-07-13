Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7253C751C85
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A13310E63D;
	Thu, 13 Jul 2023 09:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68ACD10E638
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:02:07 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AC8CD6607057;
 Thu, 13 Jul 2023 10:02:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689238926;
 bh=NUiL26AMB0eJr1HWFXYSANZqHcBDwdZS+nF51oT6vRo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=McFUqvt3BNIanzaeJPu66jVNu2+kAoLmDmmgBjlLVU6cT5RRKrHGu79apoVYiopvS
 Gf2DJqnktBt1HWSqEaq9VfTMSoGPY7PGIIsNQ18ENjHZyTzP7sA2MVTMp4P+/7RD8S
 nsTx+lwYltphdtDWBkwo/WnXA+LtNpAV36ahECutLieAvBDlRy6OzXIdQh4S0VB424
 OyXIMTtN1UKQtWe6PAK394mq3Szf6GbmI5Blv90YlaxHMU/WHlGLqA0YqMkxvL1DR6
 ZZ5NlfcOHTqzfF7P1lsXLCr8i0N4QwtUvpryh8KhkOns9VDOXHpzxnOaTuR5911Vnw
 7B4g+WUsNCnTA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v5 10/10] drm/mediatek: dp: Don't register HPD interrupt
 handler for eDP case
Date: Thu, 13 Jul 2023 11:01:52 +0200
Message-Id: <20230713090152.140060-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
References: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
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
Cc: nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The interrupt handler for HPD is useful only if a display is actually
supposed to be hotpluggable, as that manages the machinery to perform
cable (un)plug detection, debouncing and setup for re-training.

Since eDP panels are not supposed to be hotpluggable we can avoid
using the HPD interrupts altogether and rely on HPD polling only
for the suspend/resume case, saving us some spinlocking action and
the overhead of interrupts firing at every suspend/resume cycle,
achieving a faster (even if just slightly) display resume.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 81 ++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index a00bf6693b28..14eeb4a74191 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2175,9 +2175,11 @@ static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
 
 	mtk_dp->drm_dev = bridge->dev;
 
-	irq_clear_status_flags(mtk_dp->irq, IRQ_NOAUTOEN);
-	enable_irq(mtk_dp->irq);
-	mtk_dp_hwirq_enable(mtk_dp, true);
+	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP) {
+		irq_clear_status_flags(mtk_dp->irq, IRQ_NOAUTOEN);
+		enable_irq(mtk_dp->irq);
+		mtk_dp_hwirq_enable(mtk_dp, true);
+	}
 
 	return 0;
 
@@ -2192,8 +2194,10 @@ static void mtk_dp_bridge_detach(struct drm_bridge *bridge)
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 
-	mtk_dp_hwirq_enable(mtk_dp, false);
-	disable_irq(mtk_dp->irq);
+	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP) {
+		mtk_dp_hwirq_enable(mtk_dp, false);
+		disable_irq(mtk_dp->irq);
+	}
 	mtk_dp->drm_dev = NULL;
 	mtk_dp_poweroff(mtk_dp);
 	drm_dp_aux_unregister(&mtk_dp->aux);
@@ -2567,40 +2571,44 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	mtk_dp->dev = dev;
 	mtk_dp->data = (struct mtk_dp_data *)of_device_get_match_data(dev);
 
-	mtk_dp->irq = platform_get_irq(pdev, 0);
-	if (mtk_dp->irq < 0)
-		return dev_err_probe(dev, mtk_dp->irq,
-				     "failed to request dp irq resource\n");
-
-	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
-	if (IS_ERR(mtk_dp->next_bridge) &&
-	    PTR_ERR(mtk_dp->next_bridge) == -ENODEV)
-		mtk_dp->next_bridge = NULL;
-	else if (IS_ERR(mtk_dp->next_bridge))
-		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge),
-				     "Failed to get bridge\n");
-
 	ret = mtk_dp_dt_parse(mtk_dp, pdev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to parse dt\n");
 
+	/*
+	 * Request the interrupt and install service routine only if we are
+	 * on full DisplayPort.
+	 * For eDP, polling the HPD instead is more convenient because we
+	 * don't expect any (un)plug events during runtime, hence we can
+	 * avoid some locking.
+	 */
+	if (mtk_dp->data->bridge_type != DRM_MODE_CONNECTOR_eDP) {
+		mtk_dp->irq = platform_get_irq(pdev, 0);
+		if (mtk_dp->irq < 0)
+			return dev_err_probe(dev, mtk_dp->irq,
+					     "failed to request dp irq resource\n");
+
+		spin_lock_init(&mtk_dp->irq_thread_lock);
+
+		irq_set_status_flags(mtk_dp->irq, IRQ_NOAUTOEN);
+		ret = devm_request_threaded_irq(dev, mtk_dp->irq, mtk_dp_hpd_event,
+						mtk_dp_hpd_event_thread,
+						IRQ_TYPE_LEVEL_HIGH, dev_name(dev),
+						mtk_dp);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to request mediatek dptx irq\n");
+
+		mtk_dp->need_debounce = true;
+		timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
+	}
+
 	mtk_dp->aux.name = "aux_mtk_dp";
 	mtk_dp->aux.dev = dev;
 	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
 	mtk_dp->aux.wait_hpd_asserted = mtk_dp_wait_hpd_asserted;
 	drm_dp_aux_init(&mtk_dp->aux);
 
-	spin_lock_init(&mtk_dp->irq_thread_lock);
-
-	irq_set_status_flags(mtk_dp->irq, IRQ_NOAUTOEN);
-	ret = devm_request_threaded_irq(dev, mtk_dp->irq, mtk_dp_hpd_event,
-					mtk_dp_hpd_event_thread,
-					IRQ_TYPE_LEVEL_HIGH, dev_name(dev),
-					mtk_dp);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to request mediatek dptx irq\n");
-
 	platform_set_drvdata(pdev, mtk_dp);
 
 	if (mtk_dp->data->audio_supported) {
@@ -2628,9 +2636,6 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	devm_drm_bridge_add(dev, &mtk_dp->bridge);
 
-	mtk_dp->need_debounce = true;
-	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
-
 	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
 		/*
 		 * Set the data lanes to idle in case the bootloader didn't
@@ -2641,6 +2646,9 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		mtk_dp_initialize_aux_settings(mtk_dp);
 		mtk_dp_power_enable(mtk_dp);
 
+		/* Disable HW interrupts: we don't need any for eDP */
+		mtk_dp_hwirq_enable(mtk_dp, false);
+
 		/*
 		 * Power on the AUX to allow reading the EDID from aux-bus:
 		 * please note that it is necessary to call power off in the
@@ -2680,7 +2688,8 @@ static int mtk_dp_remove(struct platform_device *pdev)
 
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	del_timer_sync(&mtk_dp->debounce_timer);
+	if (mtk_dp->data->bridge_type != DRM_MODE_CONNECTOR_eDP)
+		del_timer_sync(&mtk_dp->debounce_timer);
 	drm_bridge_remove(&mtk_dp->bridge);
 	platform_device_unregister(mtk_dp->phy_dev);
 	if (mtk_dp->audio_pdev)
@@ -2695,7 +2704,8 @@ static int mtk_dp_suspend(struct device *dev)
 	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
 
 	mtk_dp_power_disable(mtk_dp);
-	mtk_dp_hwirq_enable(mtk_dp, false);
+	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP)
+		mtk_dp_hwirq_enable(mtk_dp, false);
 	pm_runtime_put_sync(dev);
 
 	return 0;
@@ -2707,7 +2717,8 @@ static int mtk_dp_resume(struct device *dev)
 
 	pm_runtime_get_sync(dev);
 	mtk_dp_init_port(mtk_dp);
-	mtk_dp_hwirq_enable(mtk_dp, true);
+	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP)
+		mtk_dp_hwirq_enable(mtk_dp, true);
 	mtk_dp_power_enable(mtk_dp);
 
 	return 0;
-- 
2.40.1

