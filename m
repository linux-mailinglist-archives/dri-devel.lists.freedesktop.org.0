Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C546D75038D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C0810E3F5;
	Wed, 12 Jul 2023 09:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6632710E3E6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:17 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-0001KG-6e; Wed, 12 Jul 2023 11:47:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRB-00Dr4C-8R; Wed, 12 Jul 2023 11:47:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRA-004GSt-Aq; Wed, 12 Jul 2023 11:47:08 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Marian Cichy <m.cichy@pengutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Dan Carpenter <error27@gmail.com>
Subject: [PATCH RFC v1 16/52] drm/imx: Use struct drm_crtc::drm_dev instead of
 struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:26 +0200
Message-Id: <20230712094702.1770121-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9150;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=O9dlKgfFbfmBpFGaeAv8G2lhCNVcOZ2b+oZYhC48z8Q=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZoL8xgIWjB7C7Ge0vK/1WfgquYjZ7wVlDzy
 w0D9TFUcp2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52aAAKCRCPgPtYfRL+
 Tv88CACwZzg3ypt7HQVGFolgp+ovUhAN2T26qia6SMaLAUKFyEgSpfdh1ogEg72PPfZ27qbTnB1
 jCHVYFKHabiZ0EfFTSdxOBZ2znOCP7W60PKcr6lge2sMasBp0dldPGm/1O5SEsqphHGdGPph114
 pTHLO3Bb3T7r6ksiGU5qmWP9aq9Ym8D/9u+6o2DsNfpBnQlXjmMPFEf8SUC2pgNSVER9QZL7EOD
 bZB/c3FKCCq5N+KW1dj2ml7r9yitezY7f0PbOMinsZgvolOCChDdYhivycIDuN0MUtR2sgqKjr7
 jsnxTUlQrBwEKqDLILquI2kotuRFt87NM51OPuyuLBIhBFPB
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
Cc: dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/imx/dcss/dcss-crtc.c   | 20 ++++++++++----------
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c | 15 ++++++++-------
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c    | 16 ++++++++--------
 3 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-crtc.c b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
index 31267c00782f..e85ceceb8ca4 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-crtc.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
@@ -16,7 +16,7 @@ static int dcss_enable_vblank(struct drm_crtc *crtc)
 {
 	struct dcss_crtc *dcss_crtc = container_of(crtc, struct dcss_crtc,
 						   base);
-	struct dcss_dev *dcss = crtc->dev->dev_private;
+	struct dcss_dev *dcss = crtc->drm_dev->dev_private;
 
 	dcss_dtg_vblank_irq_enable(dcss->dtg, true);
 
@@ -31,7 +31,7 @@ static void dcss_disable_vblank(struct drm_crtc *crtc)
 {
 	struct dcss_crtc *dcss_crtc = container_of(crtc, struct dcss_crtc,
 						   base);
-	struct dcss_dev *dcss = dcss_crtc->base.dev->dev_private;
+	struct dcss_dev *dcss = dcss_crtc->base.drm_dev->dev_private;
 
 	disable_irq_nosync(dcss_crtc->irq);
 
@@ -63,15 +63,15 @@ static void dcss_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	struct dcss_crtc *dcss_crtc = container_of(crtc, struct dcss_crtc,
 						   base);
-	struct dcss_dev *dcss = dcss_crtc->base.dev->dev_private;
+	struct dcss_dev *dcss = dcss_crtc->base.drm_dev->dev_private;
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 	if (crtc->state->event) {
 		WARN_ON(drm_crtc_vblank_get(crtc));
 		drm_crtc_arm_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 
 	if (dcss_dtg_is_enabled(dcss->dtg))
 		dcss_ctxld_enable(dcss->ctxld);
@@ -84,7 +84,7 @@ static void dcss_crtc_atomic_enable(struct drm_crtc *crtc,
 									      crtc);
 	struct dcss_crtc *dcss_crtc = container_of(crtc, struct dcss_crtc,
 						   base);
-	struct dcss_dev *dcss = dcss_crtc->base.dev->dev_private;
+	struct dcss_dev *dcss = dcss_crtc->base.drm_dev->dev_private;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct drm_display_mode *old_mode = &old_crtc_state->adjusted_mode;
 	struct videomode vm;
@@ -120,18 +120,18 @@ static void dcss_crtc_atomic_disable(struct drm_crtc *crtc,
 									      crtc);
 	struct dcss_crtc *dcss_crtc = container_of(crtc, struct dcss_crtc,
 						   base);
-	struct dcss_dev *dcss = dcss_crtc->base.dev->dev_private;
+	struct dcss_dev *dcss = dcss_crtc->base.drm_dev->dev_private;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct drm_display_mode *old_mode = &old_crtc_state->adjusted_mode;
 
 	drm_atomic_helper_disable_planes_on_crtc(old_crtc_state, false);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 	if (crtc->state->event) {
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 
 	dcss_dtg_ctxld_kick_irq_enable(dcss->dtg, true);
 
@@ -168,7 +168,7 @@ static const struct drm_crtc_helper_funcs dcss_helper_funcs = {
 static irqreturn_t dcss_crtc_irq_handler(int irq, void *dev_id)
 {
 	struct dcss_crtc *dcss_crtc = dev_id;
-	struct dcss_dev *dcss = dcss_crtc->base.dev->dev_private;
+	struct dcss_dev *dcss = dcss_crtc->base.drm_dev->dev_private;
 
 	if (!dcss_dtg_vblank_irq_valid(dcss->dtg))
 		return IRQ_NONE;
diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
index 5f26090b0c98..7ef9ff303e0b 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
@@ -99,12 +99,12 @@ static void ipu_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	drm_crtc_vblank_off(crtc);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 	if (crtc->state->event && !crtc->state->active) {
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 }
 
 static void imx_drm_crtc_reset(struct drm_crtc *crtc)
@@ -192,11 +192,12 @@ static irqreturn_t ipu_irq_handler(int irq, void *dev_id)
 		}
 
 		if (i == ARRAY_SIZE(ipu_crtc->plane)) {
-			spin_lock_irqsave(&crtc->dev->event_lock, flags);
+			spin_lock_irqsave(&crtc->drm_dev->event_lock, flags);
 			drm_crtc_send_vblank_event(crtc, ipu_crtc->event);
 			ipu_crtc->event = NULL;
 			drm_crtc_vblank_put(crtc);
-			spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+			spin_unlock_irqrestore(&crtc->drm_dev->event_lock,
+					       flags);
 		}
 	}
 
@@ -247,7 +248,7 @@ static void ipu_crtc_atomic_begin(struct drm_crtc *crtc,
 static void ipu_crtc_atomic_flush(struct drm_crtc *crtc,
 				  struct drm_atomic_state *state)
 {
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 	if (crtc->state->event) {
 		struct ipu_crtc *ipu_crtc = to_ipu_crtc(crtc);
 
@@ -255,12 +256,12 @@ static void ipu_crtc_atomic_flush(struct drm_crtc *crtc,
 		ipu_crtc->event = crtc->state->event;
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 }
 
 static void ipu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_encoder *encoder;
 	struct ipu_crtc *ipu_crtc = to_ipu_crtc(crtc);
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index 277ead6a459a..71c82df2d994 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -140,7 +140,7 @@ static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_plane_state *new_state = pipe->plane.state;
 	struct drm_framebuffer *fb = new_state->fb;
-	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
+	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.drm_dev);
 	u32 lpcr, lvcr, lhcr;
 	u32 framesize;
 	dma_addr_t addr;
@@ -193,7 +193,7 @@ static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
 	int ret;
 	int clk_div;
 	int bpp;
-	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
+	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.drm_dev);
 	struct drm_display_mode *mode = &pipe->crtc.mode;
 	struct drm_display_info *disp_info = &lcdc->connector->display_info;
 	const int hsync_pol = (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0 : 1;
@@ -229,12 +229,12 @@ static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	ret = clk_prepare_enable(lcdc->clk_ipg);
 	if (ret) {
-		dev_err(pipe->crtc.dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PTR(ret));
+		dev_err(pipe->crtc.drm_dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PTR(ret));
 		return;
 	}
 	ret = clk_prepare_enable(lcdc->clk_ahb);
 	if (ret) {
-		dev_err(pipe->crtc.dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PTR(ret));
+		dev_err(pipe->crtc.drm_dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PTR(ret));
 
 		clk_disable_unprepare(lcdc->clk_ipg);
 
@@ -249,7 +249,7 @@ static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
 {
-	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
+	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.drm_dev);
 	struct drm_crtc *crtc = &lcdc->pipe.crtc;
 	struct drm_pending_vblank_event *event;
 
@@ -281,7 +281,7 @@ static int imx_lcdc_pipe_check(struct drm_simple_display_pipe *pipe,
 	if (mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES ||
 	    mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES ||
 	    mode->hdisplay % 0x10) { /* must be multiple of 16 */
-		drm_err(pipe->crtc.dev, "unsupported display mode (%u x %u)\n",
+		drm_err(pipe->crtc.drm_dev, "unsupported display mode (%u x %u)\n",
 			mode->hdisplay, mode->vdisplay);
 		return -EINVAL;
 	}
@@ -314,14 +314,14 @@ static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm_dev->event_lock);
 
 		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
 
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm_dev->event_lock);
 	}
 }
 
-- 
2.39.2

