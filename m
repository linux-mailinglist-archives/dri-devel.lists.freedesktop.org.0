Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0EC7503CA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9AC10E4C9;
	Wed, 12 Jul 2023 09:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4454410E3F1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:48:06 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRI-0001gS-M0; Wed, 12 Jul 2023 11:47:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRH-00Dr6p-6a; Wed, 12 Jul 2023 11:47:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRF-004GUY-0s; Wed, 12 Jul 2023 11:47:13 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Emma Anholt <emma@anholt.net>,
 David Lechner <david@lechnology.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH RFC v1 42/52] drm/tiny: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:52 +0200
Message-Id: <20230712094702.1770121-43-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=16277;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=t+qlmMea+ReNqD8nMe/G5L2Z+y8l0SamnVritmvR4GU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnaHYZgv8ifS48N7aebCSRJbU06NK9OjO5Lpo
 nzZuV+przqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52hwAKCRCPgPtYfRL+
 TtWcB/9nTdfpVwx1yT3qIhRDBToySt48VIsnbJLx8nLNfAHEQEoxZWC+qNyuHW3KEzBqjCfaQvm
 b+QhZhg/H/bv1km8aYEQiiaB7d91n49Pk3kVQuxYmFS/Wl3gqYUYWn0hPx7OyKcpoWLAluJIKzo
 xy3n+UnUkel1y7HgeejSZ/cQrma0tcW/wV7zswP1agE5k9UMIAF1CXNn8RRk9lYJV995xpCaCXE
 yiMrT2BbF+YDmvATbYKgLXnfz8cJfiOWbYmFcVY4WMEvmp35vg+PCmn9nmGEYpYdoa7kaWcQyHH
 4bXs774qZNqC7v9yTa5ktpzRO0Ur7DrYvKbI97eQIm9P0qom
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/tiny/bochs.c          | 6 +++---
 drivers/gpu/drm/tiny/cirrus.c         | 2 +-
 drivers/gpu/drm/tiny/gm12u320.c       | 4 ++--
 drivers/gpu/drm/tiny/hx8357d.c        | 4 ++--
 drivers/gpu/drm/tiny/ili9163.c        | 4 ++--
 drivers/gpu/drm/tiny/ili9225.c        | 8 ++++----
 drivers/gpu/drm/tiny/ili9341.c        | 4 ++--
 drivers/gpu/drm/tiny/ili9486.c        | 4 ++--
 drivers/gpu/drm/tiny/mi0283qt.c       | 4 ++--
 drivers/gpu/drm/tiny/ofdrm.c          | 8 ++++----
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 6 +++---
 drivers/gpu/drm/tiny/repaper.c        | 8 ++++----
 drivers/gpu/drm/tiny/simpledrm.c      | 2 +-
 drivers/gpu/drm/tiny/st7586.c         | 6 +++---
 drivers/gpu/drm/tiny/st7735r.c        | 4 ++--
 15 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index d254679a136e..d22c08ba4bd3 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -440,7 +440,7 @@ static void bochs_pipe_enable(struct drm_simple_display_pipe *pipe,
 			      struct drm_crtc_state *crtc_state,
 			      struct drm_plane_state *plane_state)
 {
-	struct bochs_device *bochs = pipe->crtc.dev->dev_private;
+	struct bochs_device *bochs = pipe->crtc.drm_dev->dev_private;
 
 	bochs_hw_setmode(bochs, &crtc_state->mode);
 	bochs_plane_update(bochs, plane_state);
@@ -448,7 +448,7 @@ static void bochs_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 static void bochs_pipe_disable(struct drm_simple_display_pipe *pipe)
 {
-	struct bochs_device *bochs = pipe->crtc.dev->dev_private;
+	struct bochs_device *bochs = pipe->crtc.drm_dev->dev_private;
 
 	bochs_hw_blank(bochs, true);
 }
@@ -456,7 +456,7 @@ static void bochs_pipe_disable(struct drm_simple_display_pipe *pipe)
 static void bochs_pipe_update(struct drm_simple_display_pipe *pipe,
 			      struct drm_plane_state *old_state)
 {
-	struct bochs_device *bochs = pipe->crtc.dev->dev_private;
+	struct bochs_device *bochs = pipe->crtc.drm_dev->dev_private;
 
 	bochs_plane_update(bochs, pipe->plane.state);
 }
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 594bc472862f..efa446041bb1 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -499,7 +499,7 @@ static int cirrus_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_ato
 static void cirrus_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 					     struct drm_atomic_state *state)
 {
-	struct cirrus_device *cirrus = to_cirrus(crtc->dev);
+	struct cirrus_device *cirrus = to_cirrus(crtc->drm_dev);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	int idx;
 
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index c5bb683e440c..d18f7b8223ed 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -554,7 +554,7 @@ static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
 				 struct drm_plane_state *plane_state)
 {
 	struct drm_rect rect = { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT };
-	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
+	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.drm_dev);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 
 	gm12u320->fb_update.draw_status_timeout = FIRST_FRAME_TIMEOUT;
@@ -563,7 +563,7 @@ static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 static void gm12u320_pipe_disable(struct drm_simple_display_pipe *pipe)
 {
-	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
+	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.drm_dev);
 
 	gm12u320_stop_fb_update(gm12u320);
 }
diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
index cdc4486e059b..640a279980f2 100644
--- a/drivers/gpu/drm/tiny/hx8357d.c
+++ b/drivers/gpu/drm/tiny/hx8357d.c
@@ -48,12 +48,12 @@ static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
 			     struct drm_crtc_state *crtc_state,
 			     struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm_dev);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	u8 addr_mode;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm_dev, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
index bc4384d410fc..b7b8e20fba31 100644
--- a/drivers/gpu/drm/tiny/ili9163.c
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -37,12 +37,12 @@ static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
 			     struct drm_crtc_state *crtc_state,
 			     struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm_dev);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	u8 addr_mode;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm_dev, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index 077c6ff5a2e1..8e1f381b208d 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -180,10 +180,10 @@ static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
 				struct drm_crtc_state *crtc_state,
 				struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm_dev);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
-	struct device *dev = pipe->crtc.dev->dev;
+	struct device *dev = pipe->crtc.drm_dev->dev;
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	struct drm_rect rect = {
 		.x1 = 0,
@@ -194,7 +194,7 @@ static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
 	int ret, idx;
 	u8 am_id;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm_dev, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
@@ -289,7 +289,7 @@ static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 static void ili9225_pipe_disable(struct drm_simple_display_pipe *pipe)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm_dev);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 
 	DRM_DEBUG_KMS("\n");
diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
index 47b61c3bf145..1fb2882a8df7 100644
--- a/drivers/gpu/drm/tiny/ili9341.c
+++ b/drivers/gpu/drm/tiny/ili9341.c
@@ -54,12 +54,12 @@ static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
 			     struct drm_crtc_state *crtc_state,
 			     struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm_dev);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	u8 addr_mode;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm_dev, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 02265c898816..4d456364ab40 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -92,12 +92,12 @@ static void waveshare_enable(struct drm_simple_display_pipe *pipe,
 			     struct drm_crtc_state *crtc_state,
 			     struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm_dev);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	u8 addr_mode;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm_dev, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index 01ff43c8ac3f..0af687ea55e3 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -52,12 +52,12 @@ static void mi0283qt_enable(struct drm_simple_display_pipe *pipe,
 			    struct drm_crtc_state *crtc_state,
 			    struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm_dev);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	u8 addr_mode;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm_dev, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 76cd7f515bab..cd05bc4d5488 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -876,7 +876,7 @@ static const struct drm_plane_funcs ofdrm_primary_plane_funcs = {
 static enum drm_mode_status ofdrm_crtc_helper_mode_valid(struct drm_crtc *crtc,
 							 const struct drm_display_mode *mode)
 {
-	struct ofdrm_device *odev = ofdrm_device_of_dev(crtc->dev);
+	struct ofdrm_device *odev = ofdrm_device_of_dev(crtc->drm_dev);
 
 	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &odev->mode);
 }
@@ -886,7 +886,7 @@ static int ofdrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 {
 	static const size_t gamma_lut_length = OFDRM_GAMMA_LUT_SIZE * sizeof(struct drm_color_lut);
 
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
 	int ret;
 
@@ -911,7 +911,7 @@ static int ofdrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 
 static void ofdrm_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
-	struct ofdrm_device *odev = ofdrm_device_of_dev(crtc->dev);
+	struct ofdrm_device *odev = ofdrm_device_of_dev(crtc->drm_dev);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct ofdrm_crtc_state *ofdrm_crtc_state = to_ofdrm_crtc_state(crtc_state);
 
@@ -952,7 +952,7 @@ static void ofdrm_crtc_reset(struct drm_crtc *crtc)
 
 static struct drm_crtc_state *ofdrm_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct ofdrm_crtc_state *new_ofdrm_crtc_state;
 	struct ofdrm_crtc_state *ofdrm_crtc_state;
diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index eb9f13f18a02..8478a2cfa14b 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -191,14 +191,14 @@ static void panel_mipi_dbi_enable(struct drm_simple_display_pipe *pipe,
 				  struct drm_crtc_state *crtc_state,
 				  struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm_dev);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm_dev, &idx))
 		return;
 
-	drm_dbg(pipe->crtc.dev, "\n");
+	drm_dbg(pipe->crtc.drm_dev, "\n");
 
 	ret = mipi_dbi_poweron_conditional_reset(dbidev);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index c2677d081a7b..9c66a139a112 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -625,7 +625,7 @@ static enum drm_mode_status repaper_pipe_mode_valid(struct drm_simple_display_pi
 						    const struct drm_display_mode *mode)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct repaper_epd *epd = drm_to_epd(crtc->dev);
+	struct repaper_epd *epd = drm_to_epd(crtc->drm_dev);
 
 	return drm_crtc_helper_mode_valid_fixed(crtc, mode, epd->mode);
 }
@@ -634,13 +634,13 @@ static void repaper_pipe_enable(struct drm_simple_display_pipe *pipe,
 				struct drm_crtc_state *crtc_state,
 				struct drm_plane_state *plane_state)
 {
-	struct repaper_epd *epd = drm_to_epd(pipe->crtc.dev);
+	struct repaper_epd *epd = drm_to_epd(pipe->crtc.drm_dev);
 	struct spi_device *spi = epd->spi;
 	struct device *dev = &spi->dev;
 	bool dc_ok = false;
 	int i, ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm_dev, &idx))
 		return;
 
 	DRM_DEBUG_DRIVER("\n");
@@ -772,7 +772,7 @@ static void repaper_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 static void repaper_pipe_disable(struct drm_simple_display_pipe *pipe)
 {
-	struct repaper_epd *epd = drm_to_epd(pipe->crtc.dev);
+	struct repaper_epd *epd = drm_to_epd(pipe->crtc.drm_dev);
 	struct spi_device *spi = epd->spi;
 	unsigned int line;
 
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 25e11ef11c4c..5f14a8832f5a 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -548,7 +548,7 @@ static const struct drm_plane_funcs simpledrm_primary_plane_funcs = {
 static enum drm_mode_status simpledrm_crtc_helper_mode_valid(struct drm_crtc *crtc,
 							     const struct drm_display_mode *mode)
 {
-	struct simpledrm_device *sdev = simpledrm_device_of_dev(crtc->dev);
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(crtc->drm_dev);
 
 	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &sdev->mode);
 }
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 3cf4eec16a81..9e918dd5391c 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -169,7 +169,7 @@ static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
 			       struct drm_crtc_state *crtc_state,
 			       struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm_dev);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct mipi_dbi *dbi = &dbidev->dbi;
@@ -182,7 +182,7 @@ static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
 	int idx, ret;
 	u8 addr_mode;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm_dev, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
@@ -247,7 +247,7 @@ static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 static void st7586_pipe_disable(struct drm_simple_display_pipe *pipe)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm_dev);
 
 	/*
 	 * This callback is not protected by drm_dev_enter/exit since we want to
diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index 477eb36fbb70..01244afd03e3 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -59,14 +59,14 @@ static void st7735r_pipe_enable(struct drm_simple_display_pipe *pipe,
 				struct drm_crtc_state *crtc_state,
 				struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm_dev);
 	struct st7735r_priv *priv = container_of(dbidev, struct st7735r_priv,
 						 dbidev);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	int ret, idx;
 	u8 addr_mode;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm_dev, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
-- 
2.39.2

