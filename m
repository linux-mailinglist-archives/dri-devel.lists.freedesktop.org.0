Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6847503BC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5CC10E4C2;
	Wed, 12 Jul 2023 09:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C23510E42F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRE-0001OH-Bs; Wed, 12 Jul 2023 11:47:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-00Dr54-WA; Wed, 12 Jul 2023 11:47:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-004GTY-2w; Wed, 12 Jul 2023 11:47:10 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, Dave Airlie <airlied@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH RFC v1 26/52] drm/nouveau: Use struct drm_crtc::drm_dev
 instead of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:36 +0200
Message-Id: <20230712094702.1770121-27-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=44848;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=DJjeanT5JaYB501/e9K6u91GWRo4FMSn913mGKOrRIM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZ0HJeaRCi9+40j6TF6ciC6HyeFInSepkxeX
 17x+GZvU1+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52dAAKCRCPgPtYfRL+
 TkbdCACh5tuoKNxmlFTcYp92k6aaPM4jBnXuPWUwFJijW5zEj6jf6G+4UzZHOU/8Nh7Y0/WVJj4
 oVgA+hcgZ/QUqOdR/uPZ/2X9E2AqpsFQd3JXLona6ZLChItfRcHw3A/hv+JxIJzCEYgE1T/S6wi
 QQUSH8ylK6rvm6dwEouNYm+eb0VjmKrgHfec1w0ntr0UF+ybm2sEc9GEy//d5VK/9CcTRuCfGue
 Nu8VqsOKoVZeazCMCxG8UxHuBtQgfaOSArltQLylwV31Ck/xMHdnNW7ssaaxrJP8AYRFZRbuymQ
 cFBMVgkPdSbEv6cQGH9Zw7z4dIrt/Q0f4iwjHRZBPr/tLWo1
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
Cc: nouveau@lists.freedesktop.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c     | 58 +++++++++++----------
 drivers/gpu/drm/nouveau/dispnv04/cursor.c   | 10 ++--
 drivers/gpu/drm/nouveau/dispnv50/atom.h     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c      | 30 +++++------
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c  |  6 +--
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c  |  6 +--
 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c  |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  5 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c     |  4 +-
 drivers/gpu/drm/nouveau/dispnv50/head507d.c | 26 ++++-----
 drivers/gpu/drm/nouveau/dispnv50/head827d.c | 10 ++--
 drivers/gpu/drm/nouveau/dispnv50/head907d.c | 26 ++++-----
 drivers/gpu/drm/nouveau/dispnv50/head917d.c |  6 +--
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c | 18 +++----
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c | 10 ++--
 drivers/gpu/drm/nouveau/nouveau_connector.h |  2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c   |  2 +-
 17 files changed, 113 insertions(+), 110 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index a6f2e681bde9..fad5c6dc2cf7 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -56,18 +56,18 @@ nv04_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 static void
 crtc_wr_cio_state(struct drm_crtc *crtc, struct nv04_crtc_reg *crtcstate, int index)
 {
-	NVWriteVgaCrtc(crtc->dev, nouveau_crtc(crtc)->index, index,
+	NVWriteVgaCrtc(crtc->drm_dev, nouveau_crtc(crtc)->index, index,
 		       crtcstate->CRTC[index]);
 }
 
 static void nv_crtc_set_digital_vibrance(struct drm_crtc *crtc, int level)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
 
 	regp->CRTC[NV_CIO_CRE_CSB] = nv_crtc->saturation = level;
-	if (nv_crtc->saturation && nv_gf4_disp_arch(crtc->dev)) {
+	if (nv_crtc->saturation && nv_gf4_disp_arch(crtc->drm_dev)) {
 		regp->CRTC[NV_CIO_CRE_CSB] = 0x80;
 		regp->CRTC[NV_CIO_CRE_5B] = nv_crtc->saturation << 2;
 		crtc_wr_cio_state(crtc, regp, NV_CIO_CRE_5B);
@@ -78,14 +78,15 @@ static void nv_crtc_set_digital_vibrance(struct drm_crtc *crtc, int level)
 static void nv_crtc_set_image_sharpening(struct drm_crtc *crtc, int level)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
 
 	nv_crtc->sharpness = level;
 	if (level < 0)	/* blur is in hw range 0x3f -> 0x20 */
 		level += 0x40;
 	regp->ramdac_634 = level;
-	NVWriteRAMDAC(crtc->dev, nv_crtc->index, NV_PRAMDAC_634, regp->ramdac_634);
+	NVWriteRAMDAC(crtc->drm_dev, nv_crtc->index, NV_PRAMDAC_634,
+		      regp->ramdac_634);
 }
 
 #define PLLSEL_VPLL1_MASK				\
@@ -116,7 +117,7 @@ static void nv_crtc_set_image_sharpening(struct drm_crtc *crtc, int level)
 
 static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mode * mode, int dot_clock)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_bios *bios = nvxx_bios(&drm->client.device);
 	struct nvkm_clk *clk = nvxx_clk(&drm->client.device);
@@ -175,7 +176,7 @@ static void
 nv_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	unsigned char seq1 = 0, crtc17 = 0;
 	unsigned char crtc1A;
@@ -236,7 +237,7 @@ nv_crtc_dpms(struct drm_crtc *crtc, int mode)
 static void
 nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
 	struct drm_framebuffer *fb = crtc->primary->fb;
@@ -460,7 +461,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct drm_display_mode *mode)
 static void
 nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode * mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
@@ -609,7 +610,7 @@ nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode * mode)
 static int
 nv_crtc_swap_fbs(struct drm_crtc *crtc, struct drm_framebuffer *old_fb)
 {
-	struct nv04_display *disp = nv04_display(crtc->dev);
+	struct nv04_display *disp = nv04_display(crtc->drm_dev);
 	struct drm_framebuffer *fb = crtc->primary->fb;
 	struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
@@ -638,7 +639,7 @@ nv_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 		 struct drm_display_mode *adjusted_mode,
 		 int x, int y, struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	int ret;
@@ -665,16 +666,16 @@ nv_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 static void nv_crtc_save(struct drm_crtc *crtc)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct nv04_mode_state *state = &nv04_display(dev)->mode_reg;
 	struct nv04_crtc_reg *crtc_state = &state->crtc_reg[nv_crtc->index];
 	struct nv04_mode_state *saved = &nv04_display(dev)->saved_reg;
 	struct nv04_crtc_reg *crtc_saved = &saved->crtc_reg[nv_crtc->index];
 
-	if (nv_two_heads(crtc->dev))
-		NVSetOwner(crtc->dev, nv_crtc->index);
+	if (nv_two_heads(crtc->drm_dev))
+		NVSetOwner(crtc->drm_dev, nv_crtc->index);
 
-	nouveau_hw_save_state(crtc->dev, nv_crtc->index, saved);
+	nouveau_hw_save_state(crtc->drm_dev, nv_crtc->index, saved);
 
 	/* init some state to saved value */
 	state->sel_clk = saved->sel_clk & ~(0x5 << 16);
@@ -686,22 +687,23 @@ static void nv_crtc_save(struct drm_crtc *crtc)
 static void nv_crtc_restore(struct drm_crtc *crtc)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	int head = nv_crtc->index;
 	uint8_t saved_cr21 = nv04_display(dev)->saved_reg.crtc_reg[head].CRTC[NV_CIO_CRE_21];
 
-	if (nv_two_heads(crtc->dev))
-		NVSetOwner(crtc->dev, head);
+	if (nv_two_heads(crtc->drm_dev))
+		NVSetOwner(crtc->drm_dev, head);
 
-	nouveau_hw_load_state(crtc->dev, head, &nv04_display(dev)->saved_reg);
-	nv_lock_vga_crtc_shadow(crtc->dev, head, saved_cr21);
+	nouveau_hw_load_state(crtc->drm_dev, head,
+			      &nv04_display(dev)->saved_reg);
+	nv_lock_vga_crtc_shadow(crtc->drm_dev, head, saved_cr21);
 
 	nv_crtc->last_dpms = NV_DPMS_CLEARED;
 }
 
 static void nv_crtc_prepare(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	const struct drm_crtc_helper_funcs *funcs = crtc->helper_private;
@@ -724,7 +726,7 @@ static void nv_crtc_prepare(struct drm_crtc *crtc)
 
 static void nv_crtc_commit(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	const struct drm_crtc_helper_funcs *funcs = crtc->helper_private;
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 
@@ -746,7 +748,7 @@ static void nv_crtc_commit(struct drm_crtc *crtc)
 
 static void nv_crtc_destroy(struct drm_crtc *crtc)
 {
-	struct nv04_display *disp = nv04_display(crtc->dev);
+	struct nv04_display *disp = nv04_display(crtc->drm_dev);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 
 	if (!nv_crtc)
@@ -770,7 +772,7 @@ static void
 nv_crtc_gamma_load(struct drm_crtc *crtc)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	struct drm_device *dev = nv_crtc->base.dev;
+	struct drm_device *dev = nv_crtc->base.drm_dev;
 	struct rgb { uint8_t r, g, b; } __attribute__((packed)) *rgbs;
 	u16 *r, *g, *b;
 	int i;
@@ -792,7 +794,7 @@ nv_crtc_gamma_load(struct drm_crtc *crtc)
 static void
 nv_crtc_disable(struct drm_crtc *crtc)
 {
-	struct nv04_display *disp = nv04_display(crtc->dev);
+	struct nv04_display *disp = nv04_display(crtc->drm_dev);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	if (disp->image[nv_crtc->index])
 		nouveau_bo_unpin(disp->image[nv_crtc->index]);
@@ -827,7 +829,7 @@ nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
 			   int x, int y, bool atomic)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
 	struct nouveau_bo *nvbo;
@@ -982,7 +984,7 @@ static int
 nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 		     uint32_t buffer_handle, uint32_t width, uint32_t height)
 {
-	struct nouveau_drm *drm = nouveau_drm(crtc->dev);
+	struct nouveau_drm *drm = nouveau_drm(crtc->drm_dev);
 	struct drm_device *dev = drm->dev;
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nouveau_bo *cursor = NULL;
@@ -1140,7 +1142,7 @@ nv04_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 		    struct drm_modeset_acquire_ctx *ctx)
 {
 	const int swap_interval = (flags & DRM_MODE_PAGE_FLIP_ASYNC) ? 0 : 1;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct drm_framebuffer *old_fb = crtc->primary->fb;
 	struct nouveau_bo *old_bo = nouveau_gem_object(old_fb->obj[0]);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/cursor.c b/drivers/gpu/drm/nouveau/dispnv04/cursor.c
index 4c6440d29c3f..d7dbe411525b 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/cursor.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/cursor.c
@@ -8,20 +8,20 @@
 static void
 nv04_cursor_show(struct nouveau_crtc *nv_crtc, bool update)
 {
-	nv_show_cursor(nv_crtc->base.dev, nv_crtc->index, true);
+	nv_show_cursor(nv_crtc->base.drm_dev, nv_crtc->index, true);
 }
 
 static void
 nv04_cursor_hide(struct nouveau_crtc *nv_crtc, bool update)
 {
-	nv_show_cursor(nv_crtc->base.dev, nv_crtc->index, false);
+	nv_show_cursor(nv_crtc->base.drm_dev, nv_crtc->index, false);
 }
 
 static void
 nv04_cursor_set_pos(struct nouveau_crtc *nv_crtc, int x, int y)
 {
 	nv_crtc->cursor_saved_x = x; nv_crtc->cursor_saved_y = y;
-	NVWriteRAMDAC(nv_crtc->base.dev, nv_crtc->index,
+	NVWriteRAMDAC(nv_crtc->base.drm_dev, nv_crtc->index,
 		      NV_PRAMDAC_CU_START_POS,
 		      XLATE(y, 0, NV_PRAMDAC_CU_START_POS_Y) |
 		      XLATE(x, 0, NV_PRAMDAC_CU_START_POS_X));
@@ -30,14 +30,14 @@ nv04_cursor_set_pos(struct nouveau_crtc *nv_crtc, int x, int y)
 static void
 crtc_wr_cio_state(struct drm_crtc *crtc, struct nv04_crtc_reg *crtcstate, int index)
 {
-	NVWriteVgaCrtc(crtc->dev, nouveau_crtc(crtc)->index, index,
+	NVWriteVgaCrtc(crtc->drm_dev, nouveau_crtc(crtc)->index, index,
 		       crtcstate->CRTC[index]);
 }
 
 static void
 nv04_cursor_set_offset(struct nouveau_crtc *nv_crtc, uint32_t offset)
 {
-	struct drm_device *dev = nv_crtc->base.dev;
+	struct drm_device *dev = nv_crtc->base.drm_dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
 	struct drm_crtc *crtc = &nv_crtc->base;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/atom.h b/drivers/gpu/drm/nouveau/dispnv50/atom.h
index 93f8f4f64578..27804c0bbc42 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/atom.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/atom.h
@@ -163,7 +163,7 @@ nv50_head_atom_get_encoder(struct nv50_head_atom *atom)
 	struct drm_encoder *encoder;
 
 	/* We only ever have a single encoder */
-	drm_for_each_encoder_mask(encoder, atom->state.crtc->dev,
+	drm_for_each_encoder_mask(encoder, atom->state.crtc->drm_dev,
 				  atom->state.encoder_mask)
 		return encoder;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index 9c942fbd836d..308bf99e2a44 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -48,7 +48,7 @@ int
 nv50_crc_verify_source(struct drm_crtc *crtc, const char *source_name,
 		       size_t *values_cnt)
 {
-	struct nouveau_drm *drm = nouveau_drm(crtc->dev);
+	struct nouveau_drm *drm = nouveau_drm(crtc->drm_dev);
 	enum nv50_crc_source source;
 
 	if (nv50_crc_parse_source(source_name, &source) < 0) {
@@ -70,7 +70,7 @@ static void
 nv50_crc_program_ctx(struct nv50_head *head,
 		     struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nv50_disp *disp = nv50_disp(head->base.base.dev);
+	struct nv50_disp *disp = nv50_disp(head->base.base.drm_dev);
 	struct nv50_core *core = disp->core;
 	u32 interlock[NV50_DISP_INTERLOCK__SIZE] = { 0 };
 
@@ -84,7 +84,7 @@ static void nv50_crc_ctx_flip_work(struct kthread_work *base)
 	struct nv50_crc *crc = container_of(work, struct nv50_crc, flip_work);
 	struct nv50_head *head = container_of(crc, struct nv50_head, crc);
 	struct drm_crtc *crtc = &head->base.base;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct nv50_disp *disp = nv50_disp(dev);
 	const uint64_t start_vbl = drm_crtc_vblank_count(crtc);
 	uint64_t end_vbl;
@@ -154,7 +154,7 @@ void nv50_crc_handle_vblank(struct nv50_head *head)
 	struct drm_crtc *crtc = &head->base.base;
 	struct nv50_crc *crc = &head->crc;
 	const struct nv50_crc_func *func =
-		nv50_disp(head->base.base.dev)->core->func->crc;
+		nv50_disp(head->base.base.drm_dev)->core->func->crc;
 	struct nv50_crc_notifier_ctx *ctx;
 	bool need_reschedule = false;
 
@@ -193,7 +193,7 @@ void nv50_crc_handle_vblank(struct nv50_head *head)
 		 * updates back-to-back without waiting, we'll just be
 		 * optimistic and assume we always miss exactly one frame.
 		 */
-		drm_dbg_kms(head->base.base.dev,
+		drm_dbg_kms(head->base.base.drm_dev,
 			    "Notifier ctx flip for head-%d finished, lost CRC for frame %llu\n",
 			    head->base.index, crc->frame);
 		crc->frame++;
@@ -219,7 +219,7 @@ static void nv50_crc_wait_ctx_finished(struct nv50_head *head,
 				       const struct nv50_crc_func *func,
 				       struct nv50_crc_notifier_ctx *ctx)
 {
-	struct drm_device *dev = head->base.base.dev;
+	struct drm_device *dev = head->base.base.drm_dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	s64 ret;
 
@@ -256,7 +256,7 @@ void nv50_crc_atomic_stop_reporting(struct drm_atomic_state *state)
 		drm_crtc_vblank_put(crtc);
 		drm_vblank_work_cancel_sync(&crc->flip_work);
 
-		NV_ATOMIC(nouveau_drm(crtc->dev),
+		NV_ATOMIC(nouveau_drm(crtc->drm_dev),
 			  "CRC reporting on vblank for head-%d disabled\n",
 			  head->base.index);
 
@@ -340,7 +340,7 @@ void nv50_crc_atomic_start_reporting(struct drm_atomic_state *state)
 					 true);
 		spin_unlock_irq(&crc->lock);
 
-		NV_ATOMIC(nouveau_drm(crtc->dev),
+		NV_ATOMIC(nouveau_drm(crtc->drm_dev),
 			  "CRC reporting on vblank for head-%d enabled\n",
 			  head->base.index);
 	}
@@ -449,7 +449,7 @@ void nv50_crc_atomic_set(struct nv50_head *head,
 			 struct nv50_head_atom *asyh)
 {
 	struct drm_crtc *crtc = &head->base.base;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct nv50_crc *crc = &head->crc;
 	const struct nv50_crc_func *func = nv50_disp(dev)->core->func->crc;
 	struct nouveau_encoder *outp;
@@ -470,7 +470,7 @@ void nv50_crc_atomic_set(struct nv50_head *head,
 void nv50_crc_atomic_clr(struct nv50_head *head)
 {
 	const struct nv50_crc_func *func =
-		nv50_disp(head->base.base.dev)->core->func->crc;
+		nv50_disp(head->base.base.drm_dev)->core->func->crc;
 
 	func->set_src(head, 0, NV50_CRC_SOURCE_TYPE_NONE, NULL);
 }
@@ -500,7 +500,7 @@ static inline int
 nv50_crc_ctx_init(struct nv50_head *head, struct nvif_mmu *mmu,
 		  struct nv50_crc_notifier_ctx *ctx, size_t len, int idx)
 {
-	struct nv50_core *core = nv50_disp(head->base.base.dev)->core;
+	struct nv50_core *core = nv50_disp(head->base.base.drm_dev)->core;
 	int ret;
 
 	ret = nvif_mem_ctor_map(mmu, "kmsCrcNtfy", NVIF_MEM_VRAM, len, &ctx->mem);
@@ -537,7 +537,7 @@ nv50_crc_ctx_fini(struct nv50_crc_notifier_ctx *ctx)
 
 int nv50_crc_set_source(struct drm_crtc *crtc, const char *source_str)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_atomic_state *state;
 	struct drm_modeset_acquire_ctx ctx;
 	struct nv50_head *head = nv50_head(crtc);
@@ -656,10 +656,10 @@ nv50_crc_debugfs_flip_threshold_set(struct file *file,
 	struct nv50_head *head = m->private;
 	struct nv50_head_atom *armh;
 	struct drm_crtc *crtc = &head->base.base;
-	struct nouveau_drm *drm = nouveau_drm(crtc->dev);
+	struct nouveau_drm *drm = nouveau_drm(crtc->drm_dev);
 	struct nv50_crc *crc = &head->crc;
 	const struct nv50_crc_func *func =
-		nv50_disp(crtc->dev)->core->func->crc;
+		nv50_disp(crtc->drm_dev)->core->func->crc;
 	int value, ret;
 
 	ret = kstrtoint_from_user(ubuf, len, 10, &value);
@@ -706,7 +706,7 @@ int nv50_head_crc_late_register(struct nv50_head *head)
 {
 	struct drm_crtc *crtc = &head->base.base;
 	const struct nv50_crc_func *func =
-		nv50_disp(crtc->dev)->core->func->crc;
+		nv50_disp(crtc->drm_dev)->core->func->crc;
 	struct dentry *root;
 
 	if (!func || !crtc->debugfs_entry)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc907d.c b/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
index f9ad641555b7..1cd83c4dca10 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
@@ -26,7 +26,7 @@ static int
 crc907d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source,
 		struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	u32 crc_args = NVDEF(NV907D, HEAD_SET_CRC_CONTROL, CONTROLLING_CHANNEL, CORE) |
 		       NVDEF(NV907D, HEAD_SET_CRC_CONTROL, EXPECT_BUFFER_COLLAPSE, FALSE) |
@@ -74,7 +74,7 @@ crc907d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source
 static int
 crc907d_set_ctx(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -97,7 +97,7 @@ static u32 crc907d_get_entry(struct nv50_head *head,
 static bool crc907d_ctx_finished(struct nv50_head *head,
 				 struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nouveau_drm *drm = nouveau_drm(head->base.base.dev);
+	struct nouveau_drm *drm = nouveau_drm(head->base.base.drm_dev);
 	struct crc907d_notifier __iomem *notifier = ctx->mem.object.map.ptr;
 	const u32 status = ioread32_native(&notifier->status);
 	const u32 overflow = status & 0x0000003e;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
index f10f6c484408..dee8c99a6a13 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
@@ -15,7 +15,7 @@ static int
 crcc37d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source,
 		struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	u32 crc_args = NVVAL(NVC37D, HEAD_SET_CRC_CONTROL, CONTROLLING_CHANNEL, i * 4) |
 		       NVDEF(NVC37D, HEAD_SET_CRC_CONTROL, EXPECT_BUFFER_COLLAPSE, FALSE) |
@@ -53,7 +53,7 @@ crcc37d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source
 
 int crcc37d_set_ctx(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -81,7 +81,7 @@ u32 crcc37d_get_entry(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx,
 
 bool crcc37d_ctx_finished(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nouveau_drm *drm = nouveau_drm(head->base.base.dev);
+	struct nouveau_drm *drm = nouveau_drm(head->base.base.drm_dev);
 	struct crcc37d_notifier __iomem *notifier = ctx->mem.object.map.ptr;
 	const u32 status = ioread32_native(&notifier->status);
 	const u32 overflow = status & 0x0000007e;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c b/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
index cc0130e3d496..b37fb18fd286 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
@@ -13,7 +13,7 @@
 static int crcc57d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source,
 			   struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	u32 crc_args = NVDEF(NVC57D, HEAD_SET_CRC_CONTROL, CONTROLLING_CHANNEL, CORE) |
 		       NVDEF(NVC57D, HEAD_SET_CRC_CONTROL, EXPECT_BUFFER_COLLAPSE, FALSE) |
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 42e1665ba11a..ecf0c1b972c1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2213,9 +2213,10 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 			/* Get correct count/ts if racing with vblank irq */
 			if (new_crtc_state->active)
 				drm_crtc_accurate_vblank_count(crtc);
-			spin_lock_irqsave(&crtc->dev->event_lock, flags);
+			spin_lock_irqsave(&crtc->drm_dev->event_lock, flags);
 			drm_crtc_send_vblank_event(crtc, new_crtc_state->event);
-			spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+			spin_unlock_irqrestore(&crtc->drm_dev->event_lock,
+					       flags);
 
 			new_crtc_state->event = NULL;
 			if (new_crtc_state->active)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 5f490fbf1877..6d40bb470110 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -225,7 +225,7 @@ static int
 nv50_head_atomic_check_lut(struct nv50_head *head,
 			   struct nv50_head_atom *asyh)
 {
-	struct drm_device *dev = head->base.base.dev;
+	struct drm_device *dev = head->base.base.drm_dev;
 	struct drm_crtc *crtc = &head->base.base;
 	struct nv50_disp *disp = nv50_disp(dev);
 	struct nouveau_drm *drm = nouveau_drm(dev);
@@ -336,7 +336,7 @@ nv50_head_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 									      crtc);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
-	struct nouveau_drm *drm = nouveau_drm(crtc->dev);
+	struct nouveau_drm *drm = nouveau_drm(crtc->drm_dev);
 	struct nv50_head *head = nv50_head(crtc);
 	struct nv50_head_atom *armh = nv50_head_atom(old_crtc_state);
 	struct nv50_head_atom *asyh = nv50_head_atom(crtc_state);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head507d.c b/drivers/gpu/drm/nouveau/dispnv50/head507d.c
index 0edd4e520c8e..fd499a530724 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head507d.c
@@ -29,7 +29,7 @@
 int
 head507d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -48,7 +48,7 @@ head507d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head507d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -66,7 +66,7 @@ head507d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head507d_ovly(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	u32 bounds = 0;
 	int ret;
@@ -94,7 +94,7 @@ head507d_ovly(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head507d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	u32 bounds = 0;
 	int ret;
@@ -122,7 +122,7 @@ head507d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head507d_curs_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -139,7 +139,7 @@ head507d_curs_clr(struct nv50_head *head)
 static int
 head507d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -188,7 +188,7 @@ head507d_curs_layout(struct nv50_head *head, struct nv50_wndw_atom *asyw,
 int
 head507d_core_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -202,7 +202,7 @@ head507d_core_clr(struct nv50_head *head)
 static int
 head507d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -246,7 +246,7 @@ head507d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 void
 head507d_core_calc(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nv50_disp *disp = nv50_disp(head->base.base.dev);
+	struct nv50_disp *disp = nv50_disp(head->base.base.drm_dev);
 	if ((asyh->core.visible = (asyh->base.cpp != 0))) {
 		asyh->core.x = asyh->base.x;
 		asyh->core.y = asyh->base.y;
@@ -278,7 +278,7 @@ head507d_core_calc(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head507d_olut_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -293,7 +293,7 @@ head507d_olut_clr(struct nv50_head *head)
 static int
 head507d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -345,7 +345,7 @@ head507d_olut(struct nv50_head *head, struct nv50_head_atom *asyh, int size)
 int
 head507d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	struct nv50_head_mode *m = &asyh->mode;
 	const int i = head->base.index;
 	int ret;
@@ -400,7 +400,7 @@ head507d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head507d_view(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head827d.c b/drivers/gpu/drm/nouveau/dispnv50/head827d.c
index 194d1771c481..1a9cbeaf0713 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head827d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head827d.c
@@ -29,7 +29,7 @@
 static int
 head827d_curs_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -48,7 +48,7 @@ head827d_curs_clr(struct nv50_head *head)
 static int
 head827d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -73,7 +73,7 @@ head827d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head827d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -110,7 +110,7 @@ head827d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head827d_olut_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -127,7 +127,7 @@ head827d_olut_clr(struct nv50_head *head)
 static int
 head827d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head907d.c b/drivers/gpu/drm/nouveau/dispnv50/head907d.c
index 18fe4c1e2d6a..d09206cfc3f7 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head907d.c
@@ -36,7 +36,7 @@
 int
 head907d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -57,7 +57,7 @@ head907d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -77,7 +77,7 @@ head907d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head907d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -95,7 +95,7 @@ head907d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_ovly(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	u32 bounds = 0;
 	int ret;
@@ -124,7 +124,7 @@ head907d_ovly(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head907d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	u32 bounds = 0;
 	int ret;
@@ -152,7 +152,7 @@ head907d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_curs_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -171,7 +171,7 @@ head907d_curs_clr(struct nv50_head *head)
 int
 head907d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -195,7 +195,7 @@ head907d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_core_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -209,7 +209,7 @@ head907d_core_clr(struct nv50_head *head)
 int
 head907d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -246,7 +246,7 @@ head907d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_olut_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -263,7 +263,7 @@ head907d_olut_clr(struct nv50_head *head)
 int
 head907d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -322,7 +322,7 @@ bool head907d_ilut_check(int size)
 int
 head907d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	struct nv50_head_mode *m = &asyh->mode;
 	const int i = head->base.index;
 	int ret;
@@ -378,7 +378,7 @@ head907d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_view(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head917d.c b/drivers/gpu/drm/nouveau/dispnv50/head917d.c
index 4ce47b55f72c..17234667771d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head917d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head917d.c
@@ -30,7 +30,7 @@
 static int
 head917d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -48,7 +48,7 @@ head917d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head917d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	u32 bounds = 0;
 	int ret;
@@ -77,7 +77,7 @@ head917d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head917d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
index a4a3b78ea42c..3adc33279315 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
@@ -30,7 +30,7 @@
 static int
 headc37d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	u8 depth;
 	int ret;
@@ -64,7 +64,7 @@ headc37d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 headc37d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -85,7 +85,7 @@ headc37d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 headc37d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -104,7 +104,7 @@ headc37d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 headc37d_curs_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -122,7 +122,7 @@ headc37d_curs_clr(struct nv50_head *head)
 int
 headc37d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -161,7 +161,7 @@ headc37d_curs_format(struct nv50_head *head, struct nv50_wndw_atom *asyw,
 static int
 headc37d_olut_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -175,7 +175,7 @@ headc37d_olut_clr(struct nv50_head *head)
 static int
 headc37d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -209,7 +209,7 @@ headc37d_olut(struct nv50_head *head, struct nv50_head_atom *asyh, int size)
 static int
 headc37d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	struct nv50_head_mode *m = &asyh->mode;
 	const int i = head->base.index;
 	int ret;
@@ -254,7 +254,7 @@ headc37d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 headc37d_view(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
index 543f08ceaad6..08b7dded554f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -30,7 +30,7 @@
 static int
 headc57d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	u8 depth;
 	int ret;
@@ -65,7 +65,7 @@ headc57d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 headc57d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -83,7 +83,7 @@ headc57d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 headc57d_olut_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -97,7 +97,7 @@ headc57d_olut_clr(struct nv50_head *head)
 static int
 headc57d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -188,7 +188,7 @@ headc57d_olut(struct nv50_head *head, struct nv50_head_atom *asyh, int size)
 static int
 headc57d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm_dev)->core->chan.push;
 	struct nv50_head_mode *m = &asyh->mode;
 	const int i = head->base.index;
 	int ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index 35bcb541722b..26bb8b162235 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -181,7 +181,7 @@ nouveau_connector_is_mst(struct drm_connector *connector)
 static inline struct nouveau_connector *
 nouveau_crtc_connector_get(struct nouveau_crtc *nv_crtc)
 {
-	struct drm_device *dev = nv_crtc->base.dev;
+	struct drm_device *dev = nv_crtc->base.drm_dev;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 	struct nouveau_connector *nv_connector = NULL;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index ec3ffff487fc..2301db014be3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -83,7 +83,7 @@ static bool
 nouveau_display_scanoutpos_head(struct drm_crtc *crtc, int *vpos, int *hpos,
 				ktime_t *stime, ktime_t *etime)
 {
-	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[drm_crtc_index(crtc)];
+	struct drm_vblank_crtc *vblank = &crtc->drm_dev->vblank[drm_crtc_index(crtc)];
 	struct nvif_head *head = &nouveau_crtc(crtc)->head;
 	struct nvif_head_scanoutpos_v0 args;
 	int retry = 20;
-- 
2.39.2

