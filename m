Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDB975038E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9A010E3F0;
	Wed, 12 Jul 2023 09:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EC110E3E6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:15 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-0001LD-Uk; Wed, 12 Jul 2023 11:47:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRB-00Dr4U-SI; Wed, 12 Jul 2023 11:47:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRB-004GTC-4a; Wed, 12 Jul 2023 11:47:09 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH RFC v1 21/52] drm/mediatek: Use struct drm_crtc::drm_dev
 instead of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:31 +0200
Message-Id: <20230712094702.1770121-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3873;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=79ACRX0R9Lec0fjgIHdy6tiH/bBcp5AOXWm34rkVVbA=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZu+wrnxS1s5UEkC/zfSPlwpmphujbNssZ/T
 rxARcgVsDuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52bgAKCRCPgPtYfRL+
 TpHRB/9HlxMHFTWmQxshJgY9FoQ1ziJ+kiQFNELkPaAEjzl7o3qJ2+GCPxMJ4pLrB6l5uj9MIrL
 7sTOYrL/oXXMzSugf+FfuLeWgJHgi8qpC3uzH8F7hE8WBb1LCLTULssu411MUwYcXFB1wYMSkb8
 aM5BA+EbWbts91owwP8QHm10R9npGwCvw8QHku8k6QEvmGWGyt6bDuoHTU1c88H5QnUrtvDyc/s
 dTnRU09Dl7UsEJbLZOj+WbdAlBByAsWA6XYAVOAcy1F/dKDDdFx4FEgDPhMynxOhbHqu6AdJfFz
 isTuQ6ivp/vEWNOr/t04mtnOLXIyHerCowggJrcbrNdGMfGJ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index d40142842f85..1a41e49b6848 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -92,11 +92,11 @@ static void mtk_drm_crtc_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	unsigned long flags;
 
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->drm_dev->event_lock, flags);
 	drm_crtc_send_vblank_event(crtc, mtk_crtc->event);
 	drm_crtc_vblank_put(crtc);
 	mtk_crtc->event = NULL;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->drm_dev->event_lock, flags);
 }
 
 static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
@@ -345,11 +345,11 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 	height = crtc->state->adjusted_mode.vdisplay;
 	vrefresh = drm_mode_vrefresh(&crtc->state->adjusted_mode);
 
-	drm_for_each_encoder(encoder, crtc->dev) {
+	drm_for_each_encoder(encoder, crtc->drm_dev) {
 		if (encoder->crtc != crtc)
 			continue;
 
-		drm_connector_list_iter_begin(crtc->dev, &conn_iter);
+		drm_connector_list_iter_begin(crtc->drm_dev, &conn_iter);
 		drm_for_each_connector_iter(connector, &conn_iter) {
 			if (connector->encoder != encoder)
 				continue;
@@ -360,7 +360,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 		drm_connector_list_iter_end(&conn_iter);
 	}
 
-	ret = pm_runtime_resume_and_get(crtc->dev->dev);
+	ret = pm_runtime_resume_and_get(crtc->drm_dev->dev);
 	if (ret < 0) {
 		DRM_ERROR("Failed to enable power domain: %d\n", ret);
 		return ret;
@@ -421,14 +421,14 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 err_mutex_unprepare:
 	mtk_mutex_unprepare(mtk_crtc->mutex);
 err_pm_runtime_put:
-	pm_runtime_put(crtc->dev->dev);
+	pm_runtime_put(crtc->drm_dev->dev);
 	return ret;
 }
 
 static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 {
-	struct drm_device *drm = mtk_crtc->base.dev;
 	struct drm_crtc *crtc = &mtk_crtc->base;
+	struct drm_device *drm = crtc->drm_dev;
 	int i;
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
@@ -460,10 +460,10 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 	pm_runtime_put(drm->dev);
 
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm_dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm_dev->event_lock);
 	}
 }
 
@@ -549,7 +549,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 	struct cmdq_pkt *cmdq_handle = &mtk_crtc->cmdq_handle;
 #endif
 	struct drm_crtc *crtc = &mtk_crtc->base;
-	struct mtk_drm_private *priv = crtc->dev->dev_private;
+	struct mtk_drm_private *priv = crtc->drm_dev->dev_private;
 	unsigned int pending_planes = 0, pending_async_planes = 0;
 	int i;
 
@@ -616,7 +616,7 @@ static void mtk_crtc_ddp_irq(void *data)
 {
 	struct drm_crtc *crtc = data;
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_drm_private *priv = crtc->dev->dev_private;
+	struct mtk_drm_private *priv = crtc->drm_dev->dev_private;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
-- 
2.39.2

