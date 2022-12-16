Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAA864EAFC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 12:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2DF10E5B7;
	Fri, 16 Dec 2022 11:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF91310E5B6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 11:54:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 81DBC5CD9F;
 Fri, 16 Dec 2022 11:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671191650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fT1+h/RjjKFmlHuwEAaXZZWSMdzEZgaquM7RtXZPVDo=;
 b=JZyR0D9G8wYu/XH2zYFsQBHTqrCdu3X4XvP/dFhmGVqgNRO84zO0uTQWHCfW80j5j5jMzb
 ltl5Najx6Ku7r+8YRcU6N2xKpwGkPXBRLBojfpEK8v0BRgRHnFX7lv5ZZFpUYMxobgFMM5
 8zDQ2FuRBsci5DdhDFcZ1nyd8v1dER0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671191650;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fT1+h/RjjKFmlHuwEAaXZZWSMdzEZgaquM7RtXZPVDo=;
 b=nIWG70RXFvtFnerygyvWBNyHJL4nQLwzkVTcu8vX6gizIaQR03p2MW6/Wvm3TBU3eK2Vvy
 ZDks34NnzqO2lnCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 59839138F0;
 Fri, 16 Dec 2022 11:54:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wBfhFGJcnGOtGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Dec 2022 11:54:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 2/2] fbdev: Don't return value from struct fb_ops.fb_release
Date: Fri, 16 Dec 2022 12:54:04 +0100
Message-Id: <20221216115404.20742-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216115404.20742-1-tzimmermann@suse.de>
References: <20221216115404.20742-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change struct fb_ops.release and its implementations to not return
a value. Returing an error is not necessary and callers of the
function ignore it. It is also good practice to make clean-up code
unable ot fail, as such failure cannot be handled.

In several places drivers tested for the correctness of the internal
reference counting and failed silently if the counter was incorrect.
This would be an error in the implementation, which would require
fixing. So change these tests to return no error, but print a warning.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fbdev_generic.c          |  4 +---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c      |  3 +--
 drivers/gpu/drm/radeon/radeon_fb.c           |  3 +--
 drivers/video/fbdev/arcfb.c                  |  7 +++----
 drivers/video/fbdev/arkfb.c                  |  8 +++-----
 drivers/video/fbdev/aty/atyfb_base.c         | 10 ++++------
 drivers/video/fbdev/cirrusfb.c               |  3 +--
 drivers/video/fbdev/fsl-diu-fb.c             |  3 +--
 drivers/video/fbdev/hgafb.c                  |  3 +--
 drivers/video/fbdev/i740fb.c                 |  6 ++----
 drivers/video/fbdev/i810/i810_main.c         |  8 +++-----
 drivers/video/fbdev/intelfb/intelfbdrv.c     |  6 ++----
 drivers/video/fbdev/matrox/matroxfb_base.c   |  3 +--
 drivers/video/fbdev/matrox/matroxfb_crtc2.c  | 10 ++++------
 drivers/video/fbdev/neofb.c                  |  8 +++-----
 drivers/video/fbdev/nvidia/nvidia.c          | 11 +++--------
 drivers/video/fbdev/omap/omapfb_main.c       |  3 +--
 drivers/video/fbdev/ps3fb.c                  |  3 +--
 drivers/video/fbdev/pxafb.c                  |  3 +--
 drivers/video/fbdev/riva/fbdev.c             |  7 +++----
 drivers/video/fbdev/s3fb.c                   |  8 +++-----
 drivers/video/fbdev/savage/savagefb_driver.c |  3 +--
 drivers/video/fbdev/sh_mobile_lcdcfb.c       |  4 +---
 drivers/video/fbdev/sis/sis_main.c           |  3 +--
 drivers/video/fbdev/skeletonfb.c             |  5 +----
 drivers/video/fbdev/smscufx.c                |  4 +---
 drivers/video/fbdev/udlfb.c                  |  4 +---
 drivers/video/fbdev/uvesafb.c                |  7 +++----
 drivers/video/fbdev/vermilion/vermilion.c    |  4 +---
 drivers/video/fbdev/vga16fb.c                |  8 +++-----
 drivers/video/fbdev/via/viafbdev.c           |  3 +--
 drivers/video/fbdev/vt8623fb.c               |  8 +++-----
 include/linux/fb.h                           |  2 +-
 33 files changed, 61 insertions(+), 114 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 0a4c160e0e58..55123f1b99a6 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -33,14 +33,12 @@ static int drm_fbdev_fb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int drm_fbdev_fb_release(struct fb_info *info, int user)
+static void drm_fbdev_fb_release(struct fb_info *info, int user)
 {
 	struct drm_fb_helper *fb_helper = info->par;
 
 	if (user)
 		module_put(fb_helper->dev->driver->fops->owner);
-
-	return 0;
 }
 
 static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index e87de7906f78..9eafc83e0645 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -197,13 +197,12 @@ nouveau_fbcon_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int
+static void
 nouveau_fbcon_release(struct fb_info *info, int user)
 {
 	struct nouveau_fbdev *fbcon = info->par;
 	struct nouveau_drm *drm = nouveau_drm(fbcon->helper.dev);
 	pm_runtime_put(drm->dev->dev);
-	return 0;
 }
 
 static const struct fb_ops nouveau_fbcon_ops = {
diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index c1710ed1cab8..56b9c2465df7 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -64,7 +64,7 @@ radeonfb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int
+static void
 radeonfb_release(struct fb_info *info, int user)
 {
 	struct radeon_fbdev *rfbdev = info->par;
@@ -72,7 +72,6 @@ radeonfb_release(struct fb_info *info, int user)
 
 	pm_runtime_mark_last_busy(rdev->ddev->dev);
 	pm_runtime_put_autosuspend(rdev->ddev->dev);
-	return 0;
 }
 
 static const struct fb_ops radeonfb_ops = {
diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index 45e64016db32..dd6f53263383 100644
--- a/drivers/video/fbdev/arcfb.c
+++ b/drivers/video/fbdev/arcfb.c
@@ -187,15 +187,14 @@ static int arcfb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int arcfb_release(struct fb_info *info, int user)
+static void arcfb_release(struct fb_info *info, int user)
 {
 	struct arcfb_par *par = info->par;
 	int count = atomic_read(&par->ref_count);
 
-	if (!count)
-		return -EINVAL;
+	if (WARN_ON(!count))
+		return;
 	atomic_dec(&par->ref_count);
-	return 0;
 }
 
 static int arcfb_pan_display(struct fb_var_screeninfo *var,
diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index 60a96fdb5dd8..58a26afedf86 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -532,14 +532,14 @@ static int arkfb_open(struct fb_info *info, int user)
 
 /* Close framebuffer */
 
-static int arkfb_release(struct fb_info *info, int user)
+static void arkfb_release(struct fb_info *info, int user)
 {
 	struct arkfb_info *par = info->par;
 
 	mutex_lock(&(par->open_lock));
-	if (par->ref_count == 0) {
+	if (WARN_ON(par->ref_count == 0)) {
 		mutex_unlock(&(par->open_lock));
-		return -EINVAL;
+		return;
 	}
 
 	if (par->ref_count == 1) {
@@ -549,8 +549,6 @@ static int arkfb_release(struct fb_info *info, int user)
 
 	par->ref_count--;
 	mutex_unlock(&(par->open_lock));
-
-	return 0;
 }
 
 /* Validate passed in var */
diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index 0ccf5d401ecb..a5fd3bcd148f 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -235,7 +235,7 @@ static const struct fb_fix_screeninfo atyfb_fix = {
  */
 
 static int atyfb_open(struct fb_info *info, int user);
-static int atyfb_release(struct fb_info *info, int user);
+static void atyfb_release(struct fb_info *info, int user);
 static int atyfb_check_var(struct fb_var_screeninfo *var,
 			   struct fb_info *info);
 static int atyfb_set_par(struct fb_info *info);
@@ -1677,7 +1677,7 @@ static int aty_disable_irq(struct atyfb_par *par)
 	return 0;
 }
 
-static int atyfb_release(struct fb_info *info, int user)
+static void atyfb_release(struct fb_info *info, int user)
 {
 	struct atyfb_par *par = (struct atyfb_par *) info->par;
 #ifdef __sparc__
@@ -1685,14 +1685,14 @@ static int atyfb_release(struct fb_info *info, int user)
 #endif
 
 	if (!user)
-		return 0;
+		return;
 
 	par->open--;
 	mdelay(1);
 	wait_for_idle(par);
 
 	if (par->open)
-		return 0;
+		return;
 
 #ifdef __sparc__
 	was_mmaped = par->mmaped;
@@ -1724,8 +1724,6 @@ static int atyfb_release(struct fb_info *info, int user)
 	}
 #endif
 	aty_disable_irq(par);
-
-	return 0;
 }
 
 /*
diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index ba45e2147c52..5bb733e859c3 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -434,11 +434,10 @@ static int cirrusfb_open(struct fb_info *info, int user)
 }
 
 /*--- Close /dev/fbx --------------------------------------------------------*/
-static int cirrusfb_release(struct fb_info *info, int user)
+static void cirrusfb_release(struct fb_info *info, int user)
 {
 	if (--opencount == 0)
 		switch_monitor(info->par, 0);
-	return 0;
 }
 
 /**** END   Interface used by the World *************************************/
diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-diu-fb.c
index e332017c6af6..0f9e5357d80c 100644
--- a/drivers/video/fbdev/fsl-diu-fb.c
+++ b/drivers/video/fbdev/fsl-diu-fb.c
@@ -1422,7 +1422,7 @@ static int fsl_diu_open(struct fb_info *info, int user)
 
 /* turn off fb if count == 0
  */
-static int fsl_diu_release(struct fb_info *info, int user)
+static void fsl_diu_release(struct fb_info *info, int user)
 {
 	struct mfb_info *mfbi = info->par;
 
@@ -1446,7 +1446,6 @@ static int fsl_diu_release(struct fb_info *info, int user)
 	}
 
 	spin_unlock(&diu_lock);
-	return 0;
 }
 
 static const struct fb_ops fsl_diu_ops = {
diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
index 40879d9facdf..3e6b0e0459de 100644
--- a/drivers/video/fbdev/hgafb.c
+++ b/drivers/video/fbdev/hgafb.c
@@ -380,11 +380,10 @@ static int hgafb_open(struct fb_info *info, int init)
  *	@init: open by console system or userland.
  */
 
-static int hgafb_release(struct fb_info *info, int init)
+static void hgafb_release(struct fb_info *info, int init)
 {
 	hga_txt_mode();
 	hga_clear_screen();
-	return 0;
 }
 
 /**
diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index 3860b137b86a..a1b6e032cef2 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -190,7 +190,7 @@ static int i740fb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int i740fb_release(struct fb_info *info, int user)
+static void i740fb_release(struct fb_info *info, int user)
 {
 	struct i740fb_par *par = info->par;
 
@@ -198,13 +198,11 @@ static int i740fb_release(struct fb_info *info, int user)
 	if (par->ref_count == 0) {
 		fb_err(info, "release called with zero refcount\n");
 		mutex_unlock(&(par->open_lock));
-		return -EINVAL;
+		return;
 	}
 
 	par->ref_count--;
 	mutex_unlock(&(par->open_lock));
-
-	return 0;
 }
 
 static u32 i740_calc_fifo(struct i740fb_par *par, u32 freq, int bpp)
diff --git a/drivers/video/fbdev/i810/i810_main.c b/drivers/video/fbdev/i810/i810_main.c
index 85abb65f07d7..d8cf105897b8 100644
--- a/drivers/video/fbdev/i810/i810_main.c
+++ b/drivers/video/fbdev/i810/i810_main.c
@@ -1257,14 +1257,14 @@ static int i810fb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int i810fb_release(struct fb_info *info, int user)
+static void i810fb_release(struct fb_info *info, int user)
 {
 	struct i810fb_par *par = info->par;
 
 	mutex_lock(&par->open_lock);
-	if (par->use_count == 0) {
+	if (WARN_ON(par->use_count == 0)) {
 		mutex_unlock(&par->open_lock);
-		return -EINVAL;
+		return;
 	}
 
 	if (par->use_count == 1) {
@@ -1274,8 +1274,6 @@ static int i810fb_release(struct fb_info *info, int user)
 
 	par->use_count--;
 	mutex_unlock(&par->open_lock);
-
-	return 0;
 }
 
 
diff --git a/drivers/video/fbdev/intelfb/intelfbdrv.c b/drivers/video/fbdev/intelfb/intelfbdrv.c
index 0a9e5067b201..efa535996567 100644
--- a/drivers/video/fbdev/intelfb/intelfbdrv.c
+++ b/drivers/video/fbdev/intelfb/intelfbdrv.c
@@ -133,7 +133,7 @@ static void get_initial_mode(struct intelfb_info *dinfo);
 static void update_dinfo(struct intelfb_info *dinfo,
 			 struct fb_var_screeninfo *var);
 static int intelfb_open(struct fb_info *info, int user);
-static int intelfb_release(struct fb_info *info, int user);
+static void intelfb_release(struct fb_info *info, int user);
 static int intelfb_check_var(struct fb_var_screeninfo *var,
 			     struct fb_info *info);
 static int intelfb_set_par(struct fb_info *info);
@@ -1187,7 +1187,7 @@ static int intelfb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int intelfb_release(struct fb_info *info, int user)
+static void intelfb_release(struct fb_info *info, int user)
 {
 	struct intelfb_info *dinfo = GET_DINFO(info);
 
@@ -1197,8 +1197,6 @@ static int intelfb_release(struct fb_info *info, int user)
 		if (!dinfo->open)
 			intelfbhw_disable_irq(dinfo);
 	}
-
-	return 0;
 }
 
 static int intelfb_check_var(struct fb_var_screeninfo *var,
diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/fbdev/matrox/matroxfb_base.c
index 0d3cee7ae726..e03da1af71fa 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.c
+++ b/drivers/video/fbdev/matrox/matroxfb_base.c
@@ -400,7 +400,7 @@ static int matroxfb_open(struct fb_info *info, int user)
 	return(0);
 }
 
-static int matroxfb_release(struct fb_info *info, int user)
+static void matroxfb_release(struct fb_info *info, int user)
 {
 	struct matrox_fb_info *minfo = info2minfo(info);
 
@@ -414,7 +414,6 @@ static int matroxfb_release(struct fb_info *info, int user)
 	if (!(--minfo->usecount) && minfo->dead) {
 		matroxfb_remove(minfo, 0);
 	}
-	return(0);
 }
 
 static int matroxfb_pan_display(struct fb_var_screeninfo *var,
diff --git a/drivers/video/fbdev/matrox/matroxfb_crtc2.c b/drivers/video/fbdev/matrox/matroxfb_crtc2.c
index 7655afa3fd50..c6f69a0992b4 100644
--- a/drivers/video/fbdev/matrox/matroxfb_crtc2.c
+++ b/drivers/video/fbdev/matrox/matroxfb_crtc2.c
@@ -279,15 +279,13 @@ static int matroxfb_dh_open(struct fb_info* info, int user) {
 #undef m2info
 }
 
-static int matroxfb_dh_release(struct fb_info* info, int user) {
+static void matroxfb_dh_release(struct fb_info *info, int user)
+{
 #define m2info (container_of(info, struct matroxfb_dh_fb_info, fbcon))
-	int err = 0;
 	struct matrox_fb_info *minfo = m2info->primary_dev;
 
-	if (minfo) {
-		err = minfo->fbops.fb_release(&minfo->fbcon, user);
-	}
-	return err;
+	if (minfo)
+		minfo->fbops.fb_release(&minfo->fbcon, user);
 #undef m2info
 }
 
diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index 39d8cdef5c97..187cec01526d 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -561,20 +561,18 @@ neofb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int
+static void
 neofb_release(struct fb_info *info, int user)
 {
 	struct neofb_par *par = info->par;
 
-	if (!par->ref_count)
-		return -EINVAL;
+	if (WARN_ON(!par->ref_count))
+		return;
 
 	if (par->ref_count == 1) {
 		restore_vga(&par->state);
 	}
 	par->ref_count--;
-
-	return 0;
 }
 
 static int
diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index 1960916098d4..46894c28f148 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -1002,15 +1002,12 @@ static int nvidiafb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int nvidiafb_release(struct fb_info *info, int user)
+static void nvidiafb_release(struct fb_info *info, int user)
 {
 	struct nvidia_par *par = info->par;
-	int err = 0;
 
-	if (!par->open_count) {
-		err = -EINVAL;
-		goto done;
-	}
+	if (WARN_ON(!par->open_count))
+		return;
 
 	if (par->open_count == 1) {
 		nvidia_write_regs(par, &par->initial_state);
@@ -1018,8 +1015,6 @@ static int nvidiafb_release(struct fb_info *info, int user)
 	}
 
 	par->open_count--;
-done:
-	return err;
 }
 
 static struct fb_ops nvidia_fb_ops = {
diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 17cda5765683..d5c3c52927a2 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -222,10 +222,9 @@ static void omapfb_sync(struct fb_info *info);
 
 /* Called when the omapfb device is closed. We make sure that any pending
  * gfx DMA operations are ended, before we return. */
-static int omapfb_release(struct fb_info *info, int user)
+static void omapfb_release(struct fb_info *info, int user)
 {
 	omapfb_sync(info);
-	return 0;
 }
 
 /* Store a single color palette entry into a pseudo palette or the hardware
diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
index 2fe08b67eda7..0536ad5185db 100644
--- a/drivers/video/fbdev/ps3fb.c
+++ b/drivers/video/fbdev/ps3fb.c
@@ -508,7 +508,7 @@ static int ps3fb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int ps3fb_release(struct fb_info *info, int user)
+static void ps3fb_release(struct fb_info *info, int user)
 {
 	if (atomic_dec_and_test(&ps3fb.f_count)) {
 		if (atomic_read(&ps3fb.ext_flip)) {
@@ -519,7 +519,6 @@ static int ps3fb_release(struct fb_info *info, int user)
 			}
 		}
 	}
-	return 0;
 }
 
     /*
diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index 696ac5431180..b894230a49db 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -745,7 +745,7 @@ static int overlayfb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int overlayfb_release(struct fb_info *info, int user)
+static void overlayfb_release(struct fb_info *info, int user)
 {
 	struct pxafb_layer *ofb = container_of(info, struct pxafb_layer, fb);
 
@@ -758,7 +758,6 @@ static int overlayfb_release(struct fb_info *info, int user)
 
 		ofb->usage--;
 	}
-	return 0;
 }
 
 static int overlayfb_check_var(struct fb_var_screeninfo *var,
diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index 644278146d3b..d4ad224b429c 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -1052,15 +1052,15 @@ static int rivafb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int rivafb_release(struct fb_info *info, int user)
+static void rivafb_release(struct fb_info *info, int user)
 {
 	struct riva_par *par = info->par;
 
 	NVTRACE_ENTER();
 	mutex_lock(&par->open_lock);
-	if (!par->ref_count) {
+	if (WARN_ON(!par->ref_count)) {
 		mutex_unlock(&par->open_lock);
-		return -EINVAL;
+		return;
 	}
 	if (par->ref_count == 1) {
 		par->riva.LockUnlock(&par->riva, 0);
@@ -1074,7 +1074,6 @@ static int rivafb_release(struct fb_info *info, int user)
 	par->ref_count--;
 	mutex_unlock(&par->open_lock);
 	NVTRACE_LEAVE();
-	return 0;
 }
 
 static int rivafb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
index 7d257489edcc..7ad4a43e504a 100644
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -523,14 +523,14 @@ static int s3fb_open(struct fb_info *info, int user)
 
 /* Close framebuffer */
 
-static int s3fb_release(struct fb_info *info, int user)
+static void s3fb_release(struct fb_info *info, int user)
 {
 	struct s3fb_info *par = info->par;
 
 	mutex_lock(&(par->open_lock));
-	if (par->ref_count == 0) {
+	if (WARN_ON(par->ref_count == 0)) {
 		mutex_unlock(&(par->open_lock));
-		return -EINVAL;
+		return;
 	}
 
 	if (par->ref_count == 1)
@@ -538,8 +538,6 @@ static int s3fb_release(struct fb_info *info, int user)
 
 	par->ref_count--;
 	mutex_unlock(&(par->open_lock));
-
-	return 0;
 }
 
 /* Validate passed in var */
diff --git a/drivers/video/fbdev/savage/savagefb_driver.c b/drivers/video/fbdev/savage/savagefb_driver.c
index 4a27b68798bf..e15fb8733c10 100644
--- a/drivers/video/fbdev/savage/savagefb_driver.c
+++ b/drivers/video/fbdev/savage/savagefb_driver.c
@@ -1621,7 +1621,7 @@ static int savagefb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int savagefb_release(struct fb_info *info, int user)
+static void savagefb_release(struct fb_info *info, int user)
 {
 	struct savagefb_par *par = info->par;
 
@@ -1634,7 +1634,6 @@ static int savagefb_release(struct fb_info *info, int user)
 
 	par->open_count--;
 	mutex_unlock(&par->open_lock);
-	return 0;
 }
 
 static const struct fb_ops savagefb_ops = {
diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index 6d00893d41f4..b11a79dee6ae 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1781,7 +1781,7 @@ static void sh_mobile_fb_reconfig(struct fb_info *info)
  * Locking: both .fb_release() and .fb_open() are called with info->lock held if
  * user == 1, or with console sem held, if user == 0.
  */
-static int sh_mobile_lcdc_release(struct fb_info *info, int user)
+static void sh_mobile_lcdc_release(struct fb_info *info, int user)
 {
 	struct sh_mobile_lcdc_chan *ch = info->par;
 
@@ -1798,8 +1798,6 @@ static int sh_mobile_lcdc_release(struct fb_info *info, int user)
 	}
 
 	mutex_unlock(&ch->open_lock);
-
-	return 0;
 }
 
 static int sh_mobile_lcdc_open(struct fb_info *info, int user)
diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index cfba776afcea..c1fe7a099575 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -1396,10 +1396,9 @@ sisfb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int
+static void
 sisfb_release(struct fb_info *info, int user)
 {
-	return 0;
 }
 
 static int
diff --git a/drivers/video/fbdev/skeletonfb.c b/drivers/video/fbdev/skeletonfb.c
index 40c130ab6b38..783f0205c513 100644
--- a/drivers/video/fbdev/skeletonfb.c
+++ b/drivers/video/fbdev/skeletonfb.c
@@ -162,12 +162,9 @@ static int xxxfb_open(struct fb_info *info, int user)
  *	console system is released. Usually you don't need this function.
  *	The case where it is usually used is to go from a graphics state
  *	to a text mode state.
- *
- *	Returns negative errno on error, or zero on success.
  */
-static int xxxfb_release(struct fb_info *info, int user)
+static void xxxfb_release(struct fb_info *info, int user)
 {
-    return 0;
 }
 
 /**
diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index 9343b7a4ac89..39b45a0b61f0 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -1163,7 +1163,7 @@ static void ufx_free_framebuffer(struct ufx_data *dev)
 /*
  * Assumes caller is holding info->lock mutex (for open and release at least)
  */
-static int ufx_ops_release(struct fb_info *info, int user)
+static void ufx_ops_release(struct fb_info *info, int user)
 {
 	struct ufx_data *dev = info->par;
 
@@ -1187,8 +1187,6 @@ static int ufx_ops_release(struct fb_info *info, int user)
 	kref_put(&dev->kref, ufx_free);
 
 	mutex_unlock(&disconnect_mutex);
-
-	return 0;
 }
 
 /* Check whether a video mode is supported by the chip
diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index 216d49c9d47e..5349b7f4a2bc 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -1029,7 +1029,7 @@ static void dlfb_ops_destroy(struct fb_info *info)
 /*
  * Assumes caller is holding info->lock mutex (for open and release at least)
  */
-static int dlfb_ops_release(struct fb_info *info, int user)
+static void dlfb_ops_release(struct fb_info *info, int user)
 {
 	struct dlfb_data *dlfb = info->par;
 
@@ -1042,8 +1042,6 @@ static int dlfb_ops_release(struct fb_info *info, int user)
 	}
 
 	dev_dbg(info->dev, "release, user=%d count=%d\n", user, dlfb->fb_count);
-
-	return 0;
 }
 
 /*
diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index 00d789b6c0fa..a2d30c45b36a 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1182,14 +1182,14 @@ static int uvesafb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int uvesafb_release(struct fb_info *info, int user)
+static void uvesafb_release(struct fb_info *info, int user)
 {
 	struct uvesafb_ktask *task = NULL;
 	struct uvesafb_par *par = info->par;
 	int cnt = atomic_read(&par->ref_count);
 
-	if (!cnt)
-		return -EINVAL;
+	if (WARN_ON(!cnt))
+		return;
 
 	if (cnt != 1)
 		goto out;
@@ -1210,7 +1210,6 @@ static int uvesafb_release(struct fb_info *info, int user)
 out:
 	atomic_dec(&par->ref_count);
 	uvesafb_free(task);
-	return 0;
 }
 
 static int uvesafb_set_par(struct fb_info *info)
diff --git a/drivers/video/fbdev/vermilion/vermilion.c b/drivers/video/fbdev/vermilion/vermilion.c
index 1465fb7b619e..b6e7b2b2fe85 100644
--- a/drivers/video/fbdev/vermilion/vermilion.c
+++ b/drivers/video/fbdev/vermilion/vermilion.c
@@ -554,13 +554,11 @@ static int vmlfb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int vmlfb_release(struct fb_info *info, int user)
+static void vmlfb_release(struct fb_info *info, int user)
 {
 	/*
 	 * Restore registers here.
 	 */
-
-	return 0;
 }
 
 static int vml_nearest_clock(int clock)
diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index af47f8217095..b1810690112e 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -311,18 +311,16 @@ static int vga16fb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int vga16fb_release(struct fb_info *info, int user)
+static void vga16fb_release(struct fb_info *info, int user)
 {
 	struct vga16fb_par *par = info->par;
 
-	if (!par->ref_count)
-		return -EINVAL;
+	if (WARN_ON(!par->ref_count))
+		return;
 
 	if (par->ref_count == 1)
 		restore_vga(&par->state);
 	par->ref_count--;
-
-	return 0;
 }
 
 static int vga16fb_check_var(struct fb_var_screeninfo *var,
diff --git a/drivers/video/fbdev/via/viafbdev.c b/drivers/video/fbdev/via/viafbdev.c
index 2d67c92c5774..d376cc717b62 100644
--- a/drivers/video/fbdev/via/viafbdev.c
+++ b/drivers/video/fbdev/via/viafbdev.c
@@ -165,10 +165,9 @@ static int viafb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int viafb_release(struct fb_info *info, int user)
+static void viafb_release(struct fb_info *info, int user)
 {
 	DEBUG_MSG(KERN_INFO "viafb_release!\n");
-	return 0;
 }
 
 static inline int get_var_refresh(struct fb_var_screeninfo *var)
diff --git a/drivers/video/fbdev/vt8623fb.c b/drivers/video/fbdev/vt8623fb.c
index 034333ee6e45..f1e54baf0414 100644
--- a/drivers/video/fbdev/vt8623fb.c
+++ b/drivers/video/fbdev/vt8623fb.c
@@ -299,14 +299,14 @@ static int vt8623fb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int vt8623fb_release(struct fb_info *info, int user)
+static void vt8623fb_release(struct fb_info *info, int user)
 {
 	struct vt8623fb_info *par = info->par;
 
 	mutex_lock(&(par->open_lock));
-	if (par->ref_count == 0) {
+	if (WARN_ON(par->ref_count == 0)) {
 		mutex_unlock(&(par->open_lock));
-		return -EINVAL;
+		return;
 	}
 
 	if (par->ref_count == 1)
@@ -314,8 +314,6 @@ static int vt8623fb_release(struct fb_info *info, int user)
 
 	par->ref_count--;
 	mutex_unlock(&(par->open_lock));
-
-	return 0;
 }
 
 static int vt8623fb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 96b96323e9cb..eb687a46760b 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -238,7 +238,7 @@ struct fb_ops {
 	/* open/release and usage marking */
 	struct module *owner;
 	int (*fb_open)(struct fb_info *info, int user);
-	int (*fb_release)(struct fb_info *info, int user);
+	void (*fb_release)(struct fb_info *info, int user);
 
 	/* For framebuffers with strange non linear layouts or that do not
 	 * work with normal memory mapped access
-- 
2.38.1

