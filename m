Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A838750387
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C71310E3EB;
	Wed, 12 Jul 2023 09:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CB810E3DE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-0001J9-1L; Wed, 12 Jul 2023 11:47:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRB-00Dr46-24; Wed, 12 Jul 2023 11:47:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR9-004GSa-2k; Wed, 12 Jul 2023 11:47:07 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 11/52] drm/gma500: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:21 +0200
Message-Id: <20230712094702.1770121-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10512;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=srP842sLlvSOQwfjBbs7b2wj7rZXQHA2iuJrkYFRYgo=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhpR1ZckMaeZay2YVN6v80O9JCtgpu7IqVOzQwcnfn7+RO
 mzbvTKhk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFN4eIUgImIZXEwNNq35f5lkTQuS5jX
 Y7E5fdbze0zeFksXvYpZa1QRXeqy3CMuIi9ut3CBQvjWZ0yc0U+kzh6/6XLMzkUnKKjy7y1Zi0Z
 /Pr+91cHVel1vNmUdY7Spapb43B74uGN66YYJKpx3xepMGWfYt/e/WcEf//4gG1frUr/frdk3mi
 e8iIuZs8TJ1una9/NPrmSbzQ7+OzHjU0fLGz7DRymvz8ewb9n5bve+GFYxBZOsNDNJ9it7khyzP
 35Zu+Bqr67KjHqT05nWHz44JU79wzRhcntxwPUbcjv3f70Q8vcNp8KjiENp6UkFHZduJvPVpBgn
 Vs3qnWaY4tG15H8vgxjjxCuliju4Kh/8+VjWtObjPEcA
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/gma500/cdv_intel_display.c |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c      |  2 +-
 drivers/gpu/drm/gma500/gma_display.c       | 20 ++++++++++----------
 drivers/gpu/drm/gma500/oaktrail_crtc.c     |  8 ++++----
 drivers/gpu/drm/gma500/oaktrail_hdmi.c     |  4 ++--
 drivers/gpu/drm/gma500/psb_intel_display.c |  2 +-
 drivers/gpu/drm/gma500/psb_irq.c           |  6 +++---
 7 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
index bbd0abdd8382..ee4f7c7ded0a 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_display.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
@@ -574,7 +574,7 @@ static int cdv_intel_crtc_mode_set(struct drm_crtc *crtc,
 			       int x, int y,
 			       struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	int pipe = gma_crtc->pipe;
diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 8992a95076f2..bdf5b81be380 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -983,7 +983,7 @@ void
 cdv_intel_dp_set_m_n(struct drm_crtc *crtc, struct drm_display_mode *mode,
 		 struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct drm_mode_config *mode_config = &dev->mode_config;
 	struct drm_encoder *encoder;
diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index f65e90d890f4..42db792307ff 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -29,7 +29,7 @@
  */
 bool gma_pipe_has_type(struct drm_crtc *crtc, int type)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector;
 
@@ -58,7 +58,7 @@ void gma_wait_for_vblank(struct drm_device *dev)
 int gma_pipe_set_base(struct drm_crtc *crtc, int x, int y,
 		      struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	struct drm_framebuffer *fb = crtc->primary->fb;
@@ -143,7 +143,7 @@ int gma_pipe_set_base(struct drm_crtc *crtc, int x, int y,
 /* Loads the palette/gamma unit for the CRTC with the prepared values */
 void gma_crtc_load_lut(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	const struct psb_offset *map = &dev_priv->regmap[gma_crtc->pipe];
@@ -196,7 +196,7 @@ static int gma_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *green,
  */
 void gma_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	int pipe = gma_crtc->pipe;
@@ -330,7 +330,7 @@ static int gma_crtc_cursor_set(struct drm_crtc *crtc,
 			       struct drm_file *file_priv, uint32_t handle,
 			       uint32_t width, uint32_t height)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	int pipe = gma_crtc->pipe;
@@ -443,7 +443,7 @@ static int gma_crtc_cursor_set(struct drm_crtc *crtc,
 
 static int gma_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	int pipe = gma_crtc->pipe;
 	uint32_t temp = 0;
@@ -518,7 +518,7 @@ int gma_crtc_page_flip(struct drm_crtc *crtc,
 	struct drm_framebuffer *current_fb = crtc->primary->fb;
 	struct drm_framebuffer *old_fb = crtc->primary->old_fb;
 	const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned long flags;
 	int ret;
 
@@ -574,7 +574,7 @@ const struct drm_crtc_funcs gma_crtc_funcs = {
  */
 void gma_crtc_save(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	struct psb_intel_crtc_state *crtc_state = gma_crtc->crtc_state;
@@ -617,7 +617,7 @@ void gma_crtc_save(struct drm_crtc *crtc)
  */
 void gma_crtc_restore(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc =  to_gma_crtc(crtc);
 	struct psb_intel_crtc_state *crtc_state = gma_crtc->crtc_state;
@@ -751,7 +751,7 @@ bool gma_find_best_pll(const struct gma_limit_t *limit,
 		       struct drm_crtc *crtc, int target, int refclk,
 		       struct gma_clock_t *best_clock)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	const struct gma_clock_funcs *clock_funcs =
 						to_gma_crtc(crtc)->clock_funcs;
 	struct gma_clock_t clock;
diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
index de8ccfe9890f..5660affe38eb 100644
--- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
+++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
@@ -84,7 +84,7 @@ static const struct gma_limit_t *mrst_limit(struct drm_crtc *crtc,
 					    int refclk)
 {
 	const struct gma_limit_t *limit = NULL;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 
 	if (gma_pipe_has_type(crtc, INTEL_OUTPUT_LVDS)
@@ -216,7 +216,7 @@ static bool mrst_lvds_find_best_pll(const struct gma_limit_t *limit,
  */
 static void oaktrail_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	int pipe = gma_crtc->pipe;
@@ -362,7 +362,7 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *crtc,
 			      int x, int y,
 			      struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	int pipe = gma_crtc->pipe;
@@ -592,7 +592,7 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *crtc,
 static int oaktrail_pipe_set_base(struct drm_crtc *crtc,
 			    int x, int y, struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	struct drm_framebuffer *fb = crtc->primary->fb;
diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
index ed8626c73541..17ccf6995960 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
@@ -266,7 +266,7 @@ int oaktrail_crtc_hdmi_mode_set(struct drm_crtc *crtc,
 			    int x, int y,
 			    struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct oaktrail_hdmi_dev *hdmi_dev = dev_priv->hdmi_priv;
 	int pipe = 1;
@@ -382,7 +382,7 @@ int oaktrail_crtc_hdmi_mode_set(struct drm_crtc *crtc,
 
 void oaktrail_crtc_hdmi_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	u32 temp;
 
 	DRM_DEBUG_KMS("%s %d\n", __func__, mode);
diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index ff46e88c4768..9b44dc6c2c9e 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -96,7 +96,7 @@ static int psb_intel_crtc_mode_set(struct drm_crtc *crtc,
 			       int x, int y,
 			       struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index 343c51250207..e228d3a717bb 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -370,7 +370,7 @@ void gma_irq_uninstall(struct drm_device *dev)
 
 int gma_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	unsigned long irqflags;
@@ -403,7 +403,7 @@ int gma_crtc_enable_vblank(struct drm_crtc *crtc)
 
 void gma_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	unsigned long irqflags;
@@ -427,7 +427,7 @@ void gma_crtc_disable_vblank(struct drm_crtc *crtc)
  */
 u32 gma_crtc_get_vblank_counter(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 	uint32_t high_frame = PIPEAFRAMEHIGH;
 	uint32_t low_frame = PIPEAFRAMEPIXEL;
-- 
2.39.2

