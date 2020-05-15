Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D77E1D4840
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0646EC18;
	Fri, 15 May 2020 08:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9590C6EC14
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:32:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE91FAFF2;
 Fri, 15 May 2020 08:32:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, john.p.donnelly@oracle.com
Subject: [PATCH v3 02/15] drm/mgag200: Clean up mga_set_start_address()
Date: Fri, 15 May 2020 10:32:20 +0200
Message-Id: <20200515083233.32036-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515083233.32036-1-tzimmermann@suse.de>
References: <20200515083233.32036-1-tzimmermann@suse.de>
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
Cc: John Donnelly <John.p.donnelly@oracle.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All register names and fields are now named according to the
MGA programming manuals. The function doesn't need the CRTC, so
callers pass in the device structure directly. The logging now
uses device-specific macros.

The original implementation busy-waited for the VSYNC flag to go
up, to synchronize the page flip with the display's vblank. This
code has been moved to mga_crtc_mode_set_base(). It's still present
in the non-atomic code paths, but won't be used in atomic commits.
With atomic, we should use interrupts to synchronize with vblanks.

v3:
	* clarify commit message wrt. vblank busy-waiting
v2:
	* use to_mga_device()
	* use MiB instead of MB
	* replace empty while loop with do-while, fixes checkpatch warning
	* replace uint{8,32}_t with u{8,32}

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: John Donnelly <John.p.donnelly@oracle.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  5 ++
 drivers/gpu/drm/mgag200/mgag200_mode.c | 82 +++++++++++++++-----------
 2 files changed, 53 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index bc372c2ec79e9..1963876ef3b8c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -61,6 +61,11 @@
 		WREG8(MGAREG_CRTC_DATA, v);			\
 	} while (0)						\
 
+#define RREG_ECRT(reg, v)					\
+	do {							\
+		WREG8(MGAREG_CRTCEXT_INDEX, reg);		\
+		v = RREG8(MGAREG_CRTCEXT_DATA);			\
+	} while (0)						\
 
 #define WREG_ECRT(reg, v)					\
 	do {							\
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index c68ed8b6faf9b..80a3a805c0c4e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -819,49 +819,53 @@ static void mga_g200wb_commit(struct drm_crtc *crtc)
 }
 
 /*
-   This is how the framebuffer base address is stored in g200 cards:
-   * Assume @offset is the gpu_addr variable of the framebuffer object
-   * Then addr is the number of _pixels_ (not bytes) from the start of
-     VRAM to the first pixel we want to display. (divided by 2 for 32bit
-     framebuffers)
-   * addr is stored in the CRTCEXT0, CRTCC and CRTCD registers
-   addr<20> -> CRTCEXT0<6>
-   addr<19-16> -> CRTCEXT0<3-0>
-   addr<15-8> -> CRTCC<7-0>
-   addr<7-0> -> CRTCD<7-0>
-   CRTCEXT0 has to be programmed last to trigger an update and make the
-   new addr variable take effect.
+ * This is how the framebuffer base address is stored in g200 cards:
+ *   * Assume @offset is the gpu_addr variable of the framebuffer object
+ *   * Then addr is the number of _pixels_ (not bytes) from the start of
+ *     VRAM to the first pixel we want to display. (divided by 2 for 32bit
+ *     framebuffers)
+ *   * addr is stored in the CRTCEXT0, CRTCC and CRTCD registers
+ *      addr<20> -> CRTCEXT0<6>
+ *      addr<19-16> -> CRTCEXT0<3-0>
+ *      addr<15-8> -> CRTCC<7-0>
+ *      addr<7-0> -> CRTCD<7-0>
+ *
+ *  CRTCEXT0 has to be programmed last to trigger an update and make the
+ *  new addr variable take effect.
  */
-static void mga_set_start_address(struct drm_crtc *crtc, unsigned offset)
+static void mgag200_set_startadd(struct mga_device *mdev,
+				 unsigned long offset)
 {
-	struct mga_device *mdev = to_mga_device(crtc->dev);
-	u32 addr;
-	int count;
-	u8 crtcext0;
+	struct drm_device *dev = mdev->dev;
+	u32 startadd;
+	u8 crtcc, crtcd, crtcext0;
 
-	while (RREG8(0x1fda) & 0x08);
-	while (!(RREG8(0x1fda) & 0x08));
+	startadd = offset / 8;
 
-	count = RREG8(MGAREG_VCOUNT) + 2;
-	while (RREG8(MGAREG_VCOUNT) < count);
-
-	WREG8(MGAREG_CRTCEXT_INDEX, 0);
-	crtcext0 = RREG8(MGAREG_CRTCEXT_DATA);
-	crtcext0 &= 0xB0;
-	addr = offset / 8;
-	/* Can't store addresses any higher than that...
-	   but we also don't have more than 16MB of memory, so it should be fine. */
-	WARN_ON(addr > 0x1fffff);
-	crtcext0 |= (!!(addr & (1<<20)))<<6;
-	WREG_CRT(0x0d, (u8)(addr & 0xff));
-	WREG_CRT(0x0c, (u8)(addr >> 8) & 0xff);
-	WREG_ECRT(0x0, ((u8)(addr >> 16) & 0xf) | crtcext0);
+	/*
+	 * Can't store addresses any higher than that, but we also
+	 * don't have more than 16 MiB of memory, so it should be fine.
+	 */
+	drm_WARN_ON(dev, startadd > 0x1fffff);
+
+	RREG_ECRT(0x00, crtcext0);
+
+	crtcc = (startadd >> 8) & 0xff;
+	crtcd = startadd & 0xff;
+	crtcext0 &= 0xb0;
+	crtcext0 |= ((startadd >> 14) & BIT(6)) |
+		    ((startadd >> 16) & 0x0f);
+
+	WREG_CRT(0x0c, crtcc);
+	WREG_CRT(0x0d, crtcd);
+	WREG_ECRT(0x00, crtcext0);
 }
 
 static int mga_crtc_do_set_base(struct drm_crtc *crtc,
 				struct drm_framebuffer *fb,
 				int x, int y, int atomic)
 {
+	struct mga_device *mdev = to_mga_device(crtc->dev);
 	struct drm_gem_vram_object *gbo;
 	int ret;
 	s64 gpu_addr;
@@ -882,7 +886,7 @@ static int mga_crtc_do_set_base(struct drm_crtc *crtc,
 		goto err_drm_gem_vram_unpin;
 	}
 
-	mga_set_start_address(crtc, (u32)gpu_addr);
+	mgag200_set_startadd(mdev, (unsigned long)gpu_addr);
 
 	return 0;
 
@@ -894,6 +898,16 @@ static int mga_crtc_do_set_base(struct drm_crtc *crtc,
 static int mga_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 				  struct drm_framebuffer *old_fb)
 {
+	struct drm_device *dev = crtc->dev;
+	struct mga_device *mdev = dev->dev_private;
+	unsigned int count;
+
+	do { } while (RREG8(0x1fda) & 0x08);
+	do { } while (!(RREG8(0x1fda) & 0x08));
+
+	count = RREG8(MGAREG_VCOUNT) + 2;
+	do { } while (RREG8(MGAREG_VCOUNT) < count);
+
 	return mga_crtc_do_set_base(crtc, old_fb, x, y, 0);
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
