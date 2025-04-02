Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1B3A78A15
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 10:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E61510E710;
	Wed,  2 Apr 2025 08:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OutjvLgq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB49E10E70F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 08:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743582999;
 bh=KnBImJ26dd2JIQc1OYOTDcsJmgwUHBRPF7KKs/JDYx8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OutjvLgqV0uIZbn9dZeP66M82vmIXgkeITEHcHFMVHzcoU+K+GsrmljPnGyt4ambM
 V6KyyPipgske00fNUjrqYTM7wVlwtXBxdv9toPFxViEQc0tXe+C3+fyJHJ8rBGB4A1
 2r2GbLJlPkMZOgOtdgLdzjkFiyKXW4vybdvf7pST/gmDalYU7mvcu+mIHHe9YOSQwC
 AjgEMrMMat9YOaLKH1aMQkgROY+/N0EciBDmXl5vuNxbC+2N4VfAsR9m16rxwBqdSq
 mt+7z8AxCzUGKXRACXfCjFWVuhHOtOlBNzlfggS8XG/zKpedxL7SR09FF9Fi+KikeG
 MoUpOea0yyVyA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FE8617E0809;
 Wed,  2 Apr 2025 10:36:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 nancy.lin@mediatek.com, ck.hu@mediatek.com, djkurtz@chromium.org,
 littlecvr@chromium.org, bibby.hsieh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
Subject: [PATCH v1 4/5] drm/mediatek: mtk_disp_ovl: Enable/disable interrupt
 on bind/unbind
Date: Wed,  2 Apr 2025 10:36:27 +0200
Message-ID: <20250402083628.20111-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OVL driver is installing an ISR in the probe function but, if
the component is not bound yet, the interrupt handler may call the
vblank_cb ahead of time (while probing other drivers) or too late
(while removing other drivers), possibly accessing memory that it
should not try to access by reusing stale pointers.

In order to fix this, add a new `irq` member to struct mtk_disp_ovl
and then set the NOAUTOEN flag to the irq before installing the ISR
to manually call enable_irq() and disable_irq() in the bind and
unbind callbacks respectively.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index df82cea4bb79..1bff3a1273f6 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -161,6 +161,7 @@ struct mtk_disp_ovl {
 	struct drm_crtc			*crtc;
 	struct clk			*clk;
 	void __iomem			*regs;
+	int				irq;
 	struct cmdq_client_reg		cmdq_reg;
 	const struct mtk_disp_ovl_data	*data;
 	void				(*vblank_cb)(void *data);
@@ -587,12 +588,18 @@ void mtk_ovl_bgclr_in_off(struct device *dev)
 static int mtk_disp_ovl_bind(struct device *dev, struct device *master,
 			     void *data)
 {
+	struct mtk_disp_ovl *priv = dev_get_drvdata(dev);
+
+	enable_irq(priv->irq);
 	return 0;
 }
 
 static void mtk_disp_ovl_unbind(struct device *dev, struct device *master,
 				void *data)
 {
+	struct mtk_disp_ovl *priv = dev_get_drvdata(dev);
+
+	disable_irq(priv->irq);
 }
 
 static const struct component_ops mtk_disp_ovl_component_ops = {
@@ -605,16 +612,15 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_ovl *priv;
 	struct resource *res;
-	int irq;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return priv->irq;
 
 	priv->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(priv->clk))
@@ -635,10 +641,11 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 	priv->data = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, priv);
 
-	ret = devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
+	irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
+	ret = devm_request_irq(dev, priv->irq, mtk_disp_ovl_irq_handler,
 			       IRQF_TRIGGER_NONE, dev_name(dev), priv);
 	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to request irq %d\n", irq);
+		return dev_err_probe(dev, ret, "Failed to request irq %d\n", priv->irq);
 
 	pm_runtime_enable(dev);
 
-- 
2.48.1

