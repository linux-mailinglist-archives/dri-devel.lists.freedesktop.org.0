Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BEC2235B5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798246ED1B;
	Fri, 17 Jul 2020 07:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D696E2E4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1594917540; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+JSwbGIod25QvEeCWSV2Y9jtnfEA3truTTb/dSDItw=;
 b=SV8TRDJC39yBkOq71pqi+n/prrDmF67WSy1QOwDnbe9RJ1RVROU81IxKsSVW/T2CC8rRTi
 qcChQZq2dNMSlr5oaWksdjmTFp0MoMTFP1lgGWD7nXQKijQbWyVA2w5Z3rz47vLsHKBYHc
 DA5sx8ac6+DZ+1FNQbaQ3fO5g5IUxnw=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 08/12] drm/ingenic: Use dmam_alloc_coherent()
Date: Thu, 16 Jul 2020 18:38:42 +0200
Message-Id: <20200716163846.174790-8-paul@crapouillou.net>
In-Reply-To: <20200716163846.174790-1-paul@crapouillou.net>
References: <20200716163846.174790-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use dmam_alloc_coherent() instead of dma_alloc_coherent(). Then we don't
need to register a custom cleanup handler.

v3: New patch

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index d9cd74d70a61..9cc785776594 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -459,14 +459,6 @@ static const struct drm_mode_config_funcs ingenic_drm_mode_config_funcs = {
 	.atomic_commit		= drm_atomic_helper_commit,
 };
 
-static void ingenic_drm_free_dma_hwdesc(void *d)
-{
-	struct ingenic_drm *priv = d;
-
-	dma_free_coherent(priv->dev, sizeof(*priv->dma_hwdesc),
-			  priv->dma_hwdesc, priv->dma_hwdesc_phys);
-}
-
 static int ingenic_drm_probe(struct platform_device *pdev)
 {
 	const struct jz_soc_info *soc_info;
@@ -549,16 +541,12 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 		bridge = devm_drm_panel_bridge_add_typed(dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
 
-	priv->dma_hwdesc = dma_alloc_coherent(dev, sizeof(*priv->dma_hwdesc),
-					      &priv->dma_hwdesc_phys,
-					      GFP_KERNEL);
+	priv->dma_hwdesc = dmam_alloc_coherent(dev, sizeof(*priv->dma_hwdesc),
+					       &priv->dma_hwdesc_phys,
+					       GFP_KERNEL);
 	if (!priv->dma_hwdesc)
 		return -ENOMEM;
 
-	ret = devm_add_action_or_reset(dev, ingenic_drm_free_dma_hwdesc, priv);
-	if (ret)
-		return ret;
-
 	priv->dma_hwdesc->next = priv->dma_hwdesc_phys;
 	priv->dma_hwdesc->id = 0xdeafbead;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
