Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D4F76816C
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 21:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF3410E21B;
	Sat, 29 Jul 2023 19:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A91210E21A
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 19:32:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2D53B1FE9D;
 Sat, 29 Jul 2023 19:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690659120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JG7MtmMnubOK74rFNLA5VmTIeSqmRlnKvRn2ut3IGA4=;
 b=eLEUNuAr0yktf/WsMDzhnnD5lbOlGve3WOZSmrq3QC3sV1SdLSgouNEos7KXZEYV9ZOHYl
 Rur1VXmYB2DgXLnKEAJhtHBsZa9os/X0bhNQGk8kKNW79iP5TKN7YHbYZaVsIxTMHBxWll
 8xkC3y0Zfu4PR4Z/UQKp7aElUUOZouc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690659120;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JG7MtmMnubOK74rFNLA5VmTIeSqmRlnKvRn2ut3IGA4=;
 b=ntdgsbpbt+m3GW7RWUNVTft3q8D13Jcspmcpu5J5SHkkf24jzrTZleZB82yqMAAoRO9fAN
 CDnrleZ2oxlZKqDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 07A7E13596;
 Sat, 29 Jul 2023 19:32:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uDQIATBpxWSGGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sat, 29 Jul 2023 19:32:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	sam@ravnborg.org,
	javierm@redhat.com
Subject: [PATCH 4/4] fbdev: Align deferred I/O with naming of helpers
Date: Sat, 29 Jul 2023 21:26:49 +0200
Message-ID: <20230729193157.15446-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230729193157.15446-1-tzimmermann@suse.de>
References: <20230729193157.15446-1-tzimmermann@suse.de>
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

Deferred-I/O generator macros generate callbacks for struct fb_ops
that operate on memory ranges in I/O address space or system address
space. Rename the macros to use the _IOMEM_ and _SYSMEM_ infixes of
their underlying helpers. Adapt all users. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fbdev_generic.c        | 6 +++---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 6 +++---
 drivers/gpu/drm/msm/msm_fbdev.c            | 6 +++---
 drivers/video/fbdev/broadsheetfb.c         | 6 +++---
 drivers/video/fbdev/hecubafb.c             | 6 +++---
 drivers/video/fbdev/metronomefb.c          | 6 +++---
 drivers/video/fbdev/ssd1307fb.c            | 6 +++---
 drivers/video/fbdev/xen-fbfront.c          | 6 +++---
 include/linux/fb.h                         | 4 ++--
 9 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index a0ea042b1526..d647d89764cb 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -34,9 +34,9 @@ static int drm_fbdev_generic_fb_release(struct fb_info *info, int user)
 	return 0;
 }
 
-FB_GEN_DEFAULT_DEFERRED_SYS_OPS(drm_fbdev_generic,
-				drm_fb_helper_damage_range,
-				drm_fb_helper_damage_area);
+FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(drm_fbdev_generic,
+				   drm_fb_helper_damage_range,
+				   drm_fb_helper_damage_area);
 
 static void drm_fbdev_generic_fb_destroy(struct fb_info *info)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index e75852f13930..31d0d695d567 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -85,9 +85,9 @@ static void intel_fbdev_invalidate(struct intel_fbdev *ifbdev)
 	intel_frontbuffer_invalidate(to_frontbuffer(ifbdev), ORIGIN_CPU);
 }
 
-FB_GEN_DEFAULT_DEFERRED_IO_OPS(intel_fbdev,
-			       drm_fb_helper_damage_range,
-			       drm_fb_helper_damage_area)
+FB_GEN_DEFAULT_DEFERRED_IOMEM_OPS(intel_fbdev,
+				  drm_fb_helper_damage_range,
+				  drm_fb_helper_damage_area)
 
 static int intel_fbdev_set_par(struct fb_info *info)
 {
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index bf1e17dc4550..030bedac632d 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -25,9 +25,9 @@ module_param(fbdev, bool, 0600);
  * fbdev funcs, to implement legacy fbdev interface on top of drm driver
  */
 
-FB_GEN_DEFAULT_DEFERRED_SYS_OPS(msm_fbdev,
-				drm_fb_helper_damage_range,
-				drm_fb_helper_damage_area)
+FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(msm_fbdev,
+				   drm_fb_helper_damage_range,
+				   drm_fb_helper_damage_area)
 
 static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index bace1f04fc8e..e857b15e9f5d 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -985,9 +985,9 @@ static void broadsheetfb_defio_damage_area(struct fb_info *info, u32 x, u32 y,
 	broadsheetfb_dpy_update(par);
 }
 
-FB_GEN_DEFAULT_DEFERRED_SYS_OPS(broadsheetfb,
-				broadsheetfb_defio_damage_range,
-				broadsheetfb_defio_damage_area)
+FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(broadsheetfb,
+				   broadsheetfb_defio_damage_range,
+				   broadsheetfb_defio_damage_area)
 
 static const struct fb_ops broadsheetfb_ops = {
 	.owner	= THIS_MODULE,
diff --git a/drivers/video/fbdev/hecubafb.c b/drivers/video/fbdev/hecubafb.c
index c4938554ea45..ef526ed4a2d9 100644
--- a/drivers/video/fbdev/hecubafb.c
+++ b/drivers/video/fbdev/hecubafb.c
@@ -135,9 +135,9 @@ static void hecubafb_defio_damage_area(struct fb_info *info, u32 x, u32 y,
 	hecubafb_dpy_update(par);
 }
 
-FB_GEN_DEFAULT_DEFERRED_SYS_OPS(hecubafb,
-				hecubafb_defio_damage_range,
-				hecubafb_defio_damage_area)
+FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(hecubafb,
+				   hecubafb_defio_damage_range,
+				   hecubafb_defio_damage_area)
 
 static const struct fb_ops hecubafb_ops = {
 	.owner	= THIS_MODULE,
diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index eb15b9dbdec8..130394616a7c 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -498,9 +498,9 @@ static void metronomefb_defio_damage_area(struct fb_info *info, u32 x, u32 y,
 	metronomefb_dpy_update(par);
 }
 
-FB_GEN_DEFAULT_DEFERRED_SYS_OPS(metronomefb,
-				metronomefb_defio_damage_range,
-				metronomefb_defio_damage_area)
+FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(metronomefb,
+				   metronomefb_defio_damage_range,
+				   metronomefb_defio_damage_area)
 
 static const struct fb_ops metronomefb_ops = {
 	.owner	= THIS_MODULE,
diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index a2b939342a4f..5aee62434443 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -317,9 +317,9 @@ static void ssd1307fb_defio_damage_area(struct fb_info *info, u32 x, u32 y,
 	ssd1307fb_update_rect(par, x, y, width, height);
 }
 
-FB_GEN_DEFAULT_DEFERRED_SYS_OPS(ssd1307fb,
-				ssd1307fb_defio_damage_range,
-				ssd1307fb_defio_damage_area)
+FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(ssd1307fb,
+				   ssd1307fb_defio_damage_range,
+				   ssd1307fb_defio_damage_area)
 
 static const struct fb_ops ssd1307fb_ops = {
 	.owner		= THIS_MODULE,
diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index 9a4c29cb1a80..66d4628a96ae 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -306,9 +306,9 @@ static void xenfb_defio_damage_area(struct fb_info *info, u32 x, u32 y,
 	xenfb_refresh(xenfb_info, x, y, width, height);
 }
 
-FB_GEN_DEFAULT_DEFERRED_SYS_OPS(xenfb,
-				xenfb_defio_damage_range,
-				xenfb_defio_damage_area)
+FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(xenfb,
+				   xenfb_defio_damage_range,
+				   xenfb_defio_damage_area)
 
 static const struct fb_ops xenfb_fb_ops = {
 	.owner		= THIS_MODULE,
diff --git a/include/linux/fb.h b/include/linux/fb.h
index d255263c2d1d..16c3e6d6c55d 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -682,11 +682,11 @@ extern int fb_deferred_io_fsync(struct file *file, loff_t start,
 		__damage_area(info, image->dx, image->dy, image->width, image->height); \
 	}
 
-#define FB_GEN_DEFAULT_DEFERRED_IO_OPS(__prefix, __damage_range, __damage_area) \
+#define FB_GEN_DEFAULT_DEFERRED_IOMEM_OPS(__prefix, __damage_range, __damage_area) \
 	__FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, io) \
 	__FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, cfb)
 
-#define FB_GEN_DEFAULT_DEFERRED_SYS_OPS(__prefix, __damage_range, __damage_area) \
+#define FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(__prefix, __damage_range, __damage_area) \
 	__FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, sys) \
 	__FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, sys)
 
-- 
2.41.0

