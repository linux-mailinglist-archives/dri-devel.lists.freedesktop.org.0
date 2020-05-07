Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8721C854B
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 11:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87226E958;
	Thu,  7 May 2020 09:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730A36E0D3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 09:03:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8205FADC2;
 Thu,  7 May 2020 09:03:21 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, john.p.donnelly@oracle.com
Subject: [PATCH v2 1/6] drm/mgag200: Convert struct drm_device to struct
 mga_device with helper
Date: Thu,  7 May 2020 11:03:10 +0200
Message-Id: <20200507090315.21274-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200507090315.21274-1-tzimmermann@suse.de>
References: <20200507090315.21274-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mgag200 uses dev_private to look up struct mga_device for instances
of struct drm_device. Use of dev_private is deprecated, so hide it in
the helper function to_mga_device().

v2:
	* make to_mga_device() a function (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_cursor.c |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_drv.c    |  2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  5 +++++
 drivers/gpu/drm/mgag200/mgag200_i2c.c    | 10 +++++-----
 drivers/gpu/drm/mgag200/mgag200_main.c   |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_mode.c   | 18 +++++++++---------
 6 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index d491edd317ff3..aebc9ce43d551 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -260,7 +260,7 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 			    uint32_t handle, uint32_t width, uint32_t height)
 {
 	struct drm_device *dev = crtc->dev;
-	struct mga_device *mdev = (struct mga_device *)dev->dev_private;
+	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_gem_object *obj;
 	struct drm_gem_vram_object *gbo = NULL;
 	int ret;
@@ -307,7 +307,7 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 
 int mgag200_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 {
-	struct mga_device *mdev = (struct mga_device *)crtc->dev->dev_private;
+	struct mga_device *mdev = to_mga_device(crtc->dev);
 
 	/* Our origin is at (64,64) */
 	x += 64;
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 3298b7ef18b03..c2f0e4b40b052 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -120,7 +120,7 @@ int mgag200_driver_dumb_create(struct drm_file *file,
 			       struct drm_device *dev,
 			       struct drm_mode_create_dumb *args)
 {
-	struct mga_device *mdev = dev->dev_private;
+	struct mga_device *mdev = to_mga_device(dev);
 	unsigned long pg_align;
 
 	if (WARN_ONCE(!dev->vram_mm, "VRAM MM not initialized"))
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 9691252d6233f..93e2d232931af 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -182,6 +182,11 @@ struct mga_device {
 	struct drm_encoder encoder;
 };
 
+static inline struct mga_device *to_mga_device(struct drm_device *dev)
+{
+	return dev->dev_private;
+}
+
 static inline enum mga_type
 mgag200_type_from_driver_data(kernel_ulong_t driver_data)
 {
diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_i2c.c
index 9f4635916d322..09731e614e46d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
+++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
@@ -61,34 +61,34 @@ static inline void mga_i2c_set(struct mga_device *mdev, int mask, int state)
 static void mga_gpio_setsda(void *data, int state)
 {
 	struct mga_i2c_chan *i2c = data;
-	struct mga_device *mdev = i2c->dev->dev_private;
+	struct mga_device *mdev = to_mga_device(i2c->dev);
 	mga_i2c_set(mdev, i2c->data, state);
 }
 
 static void mga_gpio_setscl(void *data, int state)
 {
 	struct mga_i2c_chan *i2c = data;
-	struct mga_device *mdev = i2c->dev->dev_private;
+	struct mga_device *mdev = to_mga_device(i2c->dev);
 	mga_i2c_set(mdev, i2c->clock, state);
 }
 
 static int mga_gpio_getsda(void *data)
 {
 	struct mga_i2c_chan *i2c = data;
-	struct mga_device *mdev = i2c->dev->dev_private;
+	struct mga_device *mdev = to_mga_device(i2c->dev);
 	return (mga_i2c_read_gpio(mdev) & i2c->data) ? 1 : 0;
 }
 
 static int mga_gpio_getscl(void *data)
 {
 	struct mga_i2c_chan *i2c = data;
-	struct mga_device *mdev = i2c->dev->dev_private;
+	struct mga_device *mdev = to_mga_device(i2c->dev);
 	return (mga_i2c_read_gpio(mdev) & i2c->clock) ? 1 : 0;
 }
 
 struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev)
 {
-	struct mga_device *mdev = dev->dev_private;
+	struct mga_device *mdev = to_mga_device(dev);
 	struct mga_i2c_chan *i2c;
 	int ret;
 	int data, clock;
diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index b680cf47cbb94..b705b7776d2fc 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -92,7 +92,7 @@ static int mga_vram_init(struct mga_device *mdev)
 static int mgag200_device_init(struct drm_device *dev,
 			       uint32_t flags)
 {
-	struct mga_device *mdev = dev->dev_private;
+	struct mga_device *mdev = to_mga_device(dev);
 	int ret, option;
 
 	mdev->flags = mgag200_flags_from_driver_data(flags);
@@ -195,7 +195,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 
 void mgag200_driver_unload(struct drm_device *dev)
 {
-	struct mga_device *mdev = dev->dev_private;
+	struct mga_device *mdev = to_mga_device(dev);
 
 	if (mdev == NULL)
 		return;
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index d90e83959fca1..fa91869c0db52 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -28,7 +28,7 @@
 static void mga_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct mga_device *mdev = dev->dev_private;
+	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_framebuffer *fb = crtc->primary->fb;
 	u16 *r_ptr, *g_ptr, *b_ptr;
 	int i;
@@ -728,7 +728,7 @@ static int mga_crtc_set_plls(struct mga_device *mdev, long clock)
 
 static void mga_g200wb_prepare(struct drm_crtc *crtc)
 {
-	struct mga_device *mdev = crtc->dev->dev_private;
+	struct mga_device *mdev = to_mga_device(crtc->dev);
 	u8 tmp;
 	int iter_max;
 
@@ -783,7 +783,7 @@ static void mga_g200wb_prepare(struct drm_crtc *crtc)
 static void mga_g200wb_commit(struct drm_crtc *crtc)
 {
 	u8 tmp;
-	struct mga_device *mdev = crtc->dev->dev_private;
+	struct mga_device *mdev = to_mga_device(crtc->dev);
 
 	/* 1- The first step is to ensure that the vrsten and hrsten are set */
 	WREG8(MGAREG_CRTCEXT_INDEX, 1);
@@ -833,7 +833,7 @@ static void mga_g200wb_commit(struct drm_crtc *crtc)
  */
 static void mga_set_start_address(struct drm_crtc *crtc, unsigned offset)
 {
-	struct mga_device *mdev = crtc->dev->dev_private;
+	struct mga_device *mdev = to_mga_device(crtc->dev);
 	u32 addr;
 	int count;
 	u8 crtcext0;
@@ -902,7 +902,7 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 				int x, int y, struct drm_framebuffer *old_fb)
 {
 	struct drm_device *dev = crtc->dev;
-	struct mga_device *mdev = dev->dev_private;
+	struct mga_device *mdev = to_mga_device(dev);
 	const struct drm_framebuffer *fb = crtc->primary->fb;
 	int hdisplay, hsyncstart, hsyncend, htotal;
 	int vdisplay, vsyncstart, vsyncend, vtotal;
@@ -1263,7 +1263,7 @@ static int mga_resume(struct drm_crtc *crtc)
 static void mga_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct drm_device *dev = crtc->dev;
-	struct mga_device *mdev = dev->dev_private;
+	struct mga_device *mdev = to_mga_device(dev);
 	u8 seq1 = 0, crtcext1 = 0;
 
 	switch (mode) {
@@ -1317,7 +1317,7 @@ static void mga_crtc_dpms(struct drm_crtc *crtc, int mode)
 static void mga_crtc_prepare(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct mga_device *mdev = dev->dev_private;
+	struct mga_device *mdev = to_mga_device(dev);
 	u8 tmp;
 
 	/*	mga_resume(crtc);*/
@@ -1353,7 +1353,7 @@ static void mga_crtc_prepare(struct drm_crtc *crtc)
 static void mga_crtc_commit(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct mga_device *mdev = dev->dev_private;
+	struct mga_device *mdev = to_mga_device(dev);
 	const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
 	u8 tmp;
 
@@ -1495,7 +1495,7 @@ static enum drm_mode_status mga_vga_mode_valid(struct drm_connector *connector,
 				 struct drm_display_mode *mode)
 {
 	struct drm_device *dev = connector->dev;
-	struct mga_device *mdev = (struct mga_device*)dev->dev_private;
+	struct mga_device *mdev = to_mga_device(dev);
 	int bpp = 32;
 
 	if (IS_G200_SE(mdev)) {
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
