Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3BD807137
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 14:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A8810E722;
	Wed,  6 Dec 2023 13:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9FE10E722
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 13:51:57 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6D4D721EBA;
 Wed,  6 Dec 2023 13:51:56 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 2653D13B6E;
 Wed,  6 Dec 2023 13:51:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id kOsNCHx8cGWVBgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Dec 2023 13:51:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, pjones@redhat.com,
 sui.jingfeng@linux.dev
Subject: [PATCH v3 1/4] fbdev/efifb: Replace references to global screen_info
 by local pointer
Date: Wed,  6 Dec 2023 14:50:26 +0100
Message-ID: <20231206135153.2599-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206135153.2599-1-tzimmermann@suse.de>
References: <20231206135153.2599-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6D4D721EBA
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd1
X-Spam-Flag: NO
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

Get the global screen_info's address once and access the data via
this pointer. Limits the use of global state.

v3:
	* use const screen_info in several places (Sui)
	* fix build for deferred takeover (kernel test robot)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/efifb.c | 124 +++++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 60 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index f9b4ddd592ce..6b3b5cca1d41 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -108,7 +108,7 @@ static int efifb_setcolreg(unsigned regno, unsigned red, unsigned green,
  */
 #if defined CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER && \
     defined CONFIG_ACPI_BGRT
-static void efifb_copy_bmp(u8 *src, u32 *dst, int width, struct screen_info *si)
+static void efifb_copy_bmp(u8 *src, u32 *dst, int width, const struct screen_info *si)
 {
 	u8 r, g, b;
 
@@ -130,7 +130,7 @@ static void efifb_copy_bmp(u8 *src, u32 *dst, int width, struct screen_info *si)
  * resolution still fits, it will be displayed very close to the right edge of
  * the display looking quite bad. This function checks for this.
  */
-static bool efifb_bgrt_sanity_check(struct screen_info *si, u32 bmp_width)
+static bool efifb_bgrt_sanity_check(const struct screen_info *si, u32 bmp_width)
 {
 	/*
 	 * All x86 firmwares horizontally center the image (the yoffset
@@ -141,16 +141,15 @@ static bool efifb_bgrt_sanity_check(struct screen_info *si, u32 bmp_width)
 	return bgrt_tab.image_offset_x == expected_xoffset;
 }
 #else
-static bool efifb_bgrt_sanity_check(struct screen_info *si, u32 bmp_width)
+static bool efifb_bgrt_sanity_check(const struct screen_info *si, u32 bmp_width)
 {
 	return true;
 }
 #endif
 
-static void efifb_show_boot_graphics(struct fb_info *info)
+static void efifb_show_boot_graphics(struct fb_info *info, const struct screen_info *si)
 {
 	u32 bmp_width, bmp_height, bmp_pitch, dst_x, y, src_y;
-	struct screen_info *si = &screen_info;
 	struct bmp_file_header *file_header;
 	struct bmp_dib_header *dib_header;
 	void *bgrt_image = NULL;
@@ -247,7 +246,8 @@ static void efifb_show_boot_graphics(struct fb_info *info)
 	pr_warn("efifb: Ignoring BGRT: unexpected or invalid BMP data\n");
 }
 #else
-static inline void efifb_show_boot_graphics(struct fb_info *info) {}
+static inline void efifb_show_boot_graphics(struct fb_info *info, const struct screen_info *si)
+{ }
 #endif
 
 /*
@@ -282,7 +282,7 @@ static const struct fb_ops efifb_ops = {
 	.fb_setcolreg	= efifb_setcolreg,
 };
 
-static int efifb_setup(char *options)
+static int efifb_setup(struct screen_info *si, char *options)
 {
 	char *this_opt;
 
@@ -290,16 +290,16 @@ static int efifb_setup(char *options)
 		while ((this_opt = strsep(&options, ",")) != NULL) {
 			if (!*this_opt) continue;
 
-			efifb_setup_from_dmi(&screen_info, this_opt);
+			efifb_setup_from_dmi(si, this_opt);
 
 			if (!strncmp(this_opt, "base:", 5))
-				screen_info.lfb_base = simple_strtoul(this_opt+5, NULL, 0);
+				si->lfb_base = simple_strtoul(this_opt+5, NULL, 0);
 			else if (!strncmp(this_opt, "stride:", 7))
-				screen_info.lfb_linelength = simple_strtoul(this_opt+7, NULL, 0) * 4;
+				si->lfb_linelength = simple_strtoul(this_opt+7, NULL, 0) * 4;
 			else if (!strncmp(this_opt, "height:", 7))
-				screen_info.lfb_height = simple_strtoul(this_opt+7, NULL, 0);
+				si->lfb_height = simple_strtoul(this_opt+7, NULL, 0);
 			else if (!strncmp(this_opt, "width:", 6))
-				screen_info.lfb_width = simple_strtoul(this_opt+6, NULL, 0);
+				si->lfb_width = simple_strtoul(this_opt+6, NULL, 0);
 			else if (!strcmp(this_opt, "nowc"))
 				mem_flags &= ~EFI_MEMORY_WC;
 			else if (!strcmp(this_opt, "nobgrt"))
@@ -310,15 +310,15 @@ static int efifb_setup(char *options)
 	return 0;
 }
 
-static inline bool fb_base_is_valid(void)
+static inline bool fb_base_is_valid(struct screen_info *si)
 {
-	if (screen_info.lfb_base)
+	if (si->lfb_base)
 		return true;
 
-	if (!(screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE))
+	if (!(si->capabilities & VIDEO_CAPABILITY_64BIT_BASE))
 		return false;
 
-	if (screen_info.ext_lfb_base)
+	if (si->ext_lfb_base)
 		return true;
 
 	return false;
@@ -329,7 +329,10 @@ static ssize_t name##_show(struct device *dev,				\
 			   struct device_attribute *attr,		\
 			   char *buf)					\
 {									\
-	return sprintf(buf, fmt "\n", (screen_info.lfb_##name));	\
+	struct screen_info *si = dev_get_platdata(dev);			\
+	if (!si)							\
+		return -ENODEV;						\
+	return sprintf(buf, fmt "\n", (si->lfb_##name));		\
 }									\
 static DEVICE_ATTR_RO(name)
 
@@ -356,6 +359,7 @@ static u64 bar_offset;
 
 static int efifb_probe(struct platform_device *dev)
 {
+	struct screen_info *si = &screen_info;
 	struct fb_info *info;
 	struct efifb_par *par;
 	int err, orientation;
@@ -365,48 +369,48 @@ static int efifb_probe(struct platform_device *dev)
 	char *option = NULL;
 	efi_memory_desc_t md;
 
-	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI || pci_dev_disabled)
+	if (si->orig_video_isVGA != VIDEO_TYPE_EFI || pci_dev_disabled)
 		return -ENODEV;
 
 	if (fb_get_options("efifb", &option))
 		return -ENODEV;
-	efifb_setup(option);
+	efifb_setup(si, option);
 
 	/* We don't get linelength from UGA Draw Protocol, only from
 	 * EFI Graphics Protocol.  So if it's not in DMI, and it's not
 	 * passed in from the user, we really can't use the framebuffer.
 	 */
-	if (!screen_info.lfb_linelength)
+	if (!si->lfb_linelength)
 		return -ENODEV;
 
-	if (!screen_info.lfb_depth)
-		screen_info.lfb_depth = 32;
-	if (!screen_info.pages)
-		screen_info.pages = 1;
-	if (!fb_base_is_valid()) {
+	if (!si->lfb_depth)
+		si->lfb_depth = 32;
+	if (!si->pages)
+		si->pages = 1;
+	if (!fb_base_is_valid(si)) {
 		printk(KERN_DEBUG "efifb: invalid framebuffer address\n");
 		return -ENODEV;
 	}
 	printk(KERN_INFO "efifb: probing for efifb\n");
 
 	/* just assume they're all unset if any are */
-	if (!screen_info.blue_size) {
-		screen_info.blue_size = 8;
-		screen_info.blue_pos = 0;
-		screen_info.green_size = 8;
-		screen_info.green_pos = 8;
-		screen_info.red_size = 8;
-		screen_info.red_pos = 16;
-		screen_info.rsvd_size = 8;
-		screen_info.rsvd_pos = 24;
+	if (!si->blue_size) {
+		si->blue_size = 8;
+		si->blue_pos = 0;
+		si->green_size = 8;
+		si->green_pos = 8;
+		si->red_size = 8;
+		si->red_pos = 16;
+		si->rsvd_size = 8;
+		si->rsvd_pos = 24;
 	}
 
-	efifb_fix.smem_start = screen_info.lfb_base;
+	efifb_fix.smem_start = si->lfb_base;
 
-	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE) {
+	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE) {
 		u64 ext_lfb_base;
 
-		ext_lfb_base = (u64)(unsigned long)screen_info.ext_lfb_base << 32;
+		ext_lfb_base = (u64)(unsigned long)si->ext_lfb_base << 32;
 		efifb_fix.smem_start |= ext_lfb_base;
 	}
 
@@ -417,10 +421,10 @@ static int efifb_probe(struct platform_device *dev)
 		efifb_fix.smem_start = bar_resource->start + bar_offset;
 	}
 
-	efifb_defined.bits_per_pixel = screen_info.lfb_depth;
-	efifb_defined.xres = screen_info.lfb_width;
-	efifb_defined.yres = screen_info.lfb_height;
-	efifb_fix.line_length = screen_info.lfb_linelength;
+	efifb_defined.bits_per_pixel = si->lfb_depth;
+	efifb_defined.xres = si->lfb_width;
+	efifb_defined.yres = si->lfb_height;
+	efifb_fix.line_length = si->lfb_linelength;
 
 	/*   size_vmode -- that is the amount of memory needed for the
 	 *                 used video mode, i.e. the minimum amount of
@@ -430,7 +434,7 @@ static int efifb_probe(struct platform_device *dev)
 	/*   size_total -- all video memory we have. Used for
 	 *                 entries, ressource allocation and bounds
 	 *                 checking. */
-	size_total = screen_info.lfb_size;
+	size_total = si->lfb_size;
 	if (size_total < size_vmode)
 		size_total = size_vmode;
 
@@ -505,14 +509,14 @@ static int efifb_probe(struct platform_device *dev)
 		goto err_release_fb;
 	}
 
-	efifb_show_boot_graphics(info);
+	efifb_show_boot_graphics(info, si);
 
 	pr_info("efifb: framebuffer at 0x%lx, using %dk, total %dk\n",
 	       efifb_fix.smem_start, size_remap/1024, size_total/1024);
 	pr_info("efifb: mode is %dx%dx%d, linelength=%d, pages=%d\n",
 	       efifb_defined.xres, efifb_defined.yres,
 	       efifb_defined.bits_per_pixel, efifb_fix.line_length,
-	       screen_info.pages);
+	       si->pages);
 
 	efifb_defined.xres_virtual = efifb_defined.xres;
 	efifb_defined.yres_virtual = efifb_fix.smem_len /
@@ -526,26 +530,26 @@ static int efifb_probe(struct platform_device *dev)
 	efifb_defined.left_margin  = (efifb_defined.xres / 8) & 0xf8;
 	efifb_defined.hsync_len    = (efifb_defined.xres / 8) & 0xf8;
 
-	efifb_defined.red.offset    = screen_info.red_pos;
-	efifb_defined.red.length    = screen_info.red_size;
-	efifb_defined.green.offset  = screen_info.green_pos;
-	efifb_defined.green.length  = screen_info.green_size;
-	efifb_defined.blue.offset   = screen_info.blue_pos;
-	efifb_defined.blue.length   = screen_info.blue_size;
-	efifb_defined.transp.offset = screen_info.rsvd_pos;
-	efifb_defined.transp.length = screen_info.rsvd_size;
+	efifb_defined.red.offset    = si->red_pos;
+	efifb_defined.red.length    = si->red_size;
+	efifb_defined.green.offset  = si->green_pos;
+	efifb_defined.green.length  = si->green_size;
+	efifb_defined.blue.offset   = si->blue_pos;
+	efifb_defined.blue.length   = si->blue_size;
+	efifb_defined.transp.offset = si->rsvd_pos;
+	efifb_defined.transp.length = si->rsvd_size;
 
 	pr_info("efifb: %s: "
 	       "size=%d:%d:%d:%d, shift=%d:%d:%d:%d\n",
 	       "Truecolor",
-	       screen_info.rsvd_size,
-	       screen_info.red_size,
-	       screen_info.green_size,
-	       screen_info.blue_size,
-	       screen_info.rsvd_pos,
-	       screen_info.red_pos,
-	       screen_info.green_pos,
-	       screen_info.blue_pos);
+	       si->rsvd_size,
+	       si->red_size,
+	       si->green_size,
+	       si->blue_size,
+	       si->rsvd_pos,
+	       si->red_pos,
+	       si->green_pos,
+	       si->blue_pos);
 
 	efifb_fix.ypanstep  = 0;
 	efifb_fix.ywrapstep = 0;
-- 
2.43.0

