Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B346378C751
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCB710E336;
	Tue, 29 Aug 2023 14:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A5610E2E1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:21:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A667B1F45F;
 Tue, 29 Aug 2023 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693318889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eJcsh2Kthrk5Kkft8/wacV9F6GXmvdJjfFJXi7mDmcU=;
 b=yJZYJZXaxs6CXjLVBGnej4wphNp2Aalrwgb9pOrQhxYN+w5U01b5JKJeFALXJdgO5MFQcK
 +O100Opx+mJo7DCtBkfnMXfnVrhXH3e6WaQ7sXxuqkAstFMnOietWNjMV+YbfoQ2ll5zR3
 tviEtGj5ZRQX2R5Ns3T40jzPJTa3Nnk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693318889;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eJcsh2Kthrk5Kkft8/wacV9F6GXmvdJjfFJXi7mDmcU=;
 b=fKQDxhet3ukEUBbHkNqE4t9843pr+Bh6gJgMWJPdUdVmsVvjWNFpY8VL0UiQp85EkaPuu0
 gFeqc5Ii+9f8c/CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 696BE138E2;
 Tue, 29 Aug 2023 14:21:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MCnKGOn+7WREewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 29 Aug 2023 14:21:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] fbdev/core: Move logo functions into separate source file
Date: Tue, 29 Aug 2023 16:15:43 +0200
Message-ID: <20230829142109.4521-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829142109.4521-1-tzimmermann@suse.de>
References: <20230829142109.4521-1-tzimmermann@suse.de>
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
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the fbdev function for displaying boot-up logos into their
own file fb_logo.c. The file can later be build depending on the
state of CONFIG_LOGO. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/Makefile      |   1 +
 drivers/video/fbdev/core/fb_internal.h |   6 +
 drivers/video/fbdev/core/fb_logo.c     | 533 +++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c       | 524 ------------------------
 include/linux/fb.h                     |   5 -
 5 files changed, 540 insertions(+), 529 deletions(-)
 create mode 100644 drivers/video/fbdev/core/fb_logo.c

diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index edfde2948e5c..adce31155e92 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
 obj-$(CONFIG_FB_CORE)             += fb.o
 fb-y                              := fb_info.o \
+                                     fb_logo.o \
                                      fbmem.o fbcmap.o \
                                      modedb.o fbcvt.o fb_cmdline.o fb_io_fops.o
 ifdef CONFIG_FB
diff --git a/drivers/video/fbdev/core/fb_internal.h b/drivers/video/fbdev/core/fb_internal.h
index 4c8d509a0026..79e57a5e6e7e 100644
--- a/drivers/video/fbdev/core/fb_internal.h
+++ b/drivers/video/fbdev/core/fb_internal.h
@@ -20,6 +20,12 @@ static inline void fb_unregister_chrdev(void)
 { }
 #endif
 
+/* fb_logo.c */
+extern bool fb_center_logo;
+extern int fb_logo_count;
+int fb_prepare_logo(struct fb_info *fb_info, int rotate);
+int fb_show_logo(struct fb_info *fb_info, int rotate);
+
 /* fbmem.c */
 extern struct class *fb_class;
 extern struct mutex registration_lock;
diff --git a/drivers/video/fbdev/core/fb_logo.c b/drivers/video/fbdev/core/fb_logo.c
new file mode 100644
index 000000000000..76ba5a2bebae
--- /dev/null
+++ b/drivers/video/fbdev/core/fb_logo.c
@@ -0,0 +1,533 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/export.h>
+#include <linux/fb.h>
+#include <linux/linux_logo.h>
+
+bool fb_center_logo __read_mostly;
+int fb_logo_count __read_mostly = -1;
+
+#ifdef CONFIG_LOGO
+static inline unsigned int safe_shift(unsigned int d, int n)
+{
+	return n < 0 ? d >> -n : d << n;
+}
+
+static void fb_set_logocmap(struct fb_info *info,
+				   const struct linux_logo *logo)
+{
+	struct fb_cmap palette_cmap;
+	u16 palette_green[16];
+	u16 palette_blue[16];
+	u16 palette_red[16];
+	int i, j, n;
+	const unsigned char *clut = logo->clut;
+
+	palette_cmap.start = 0;
+	palette_cmap.len = 16;
+	palette_cmap.red = palette_red;
+	palette_cmap.green = palette_green;
+	palette_cmap.blue = palette_blue;
+	palette_cmap.transp = NULL;
+
+	for (i = 0; i < logo->clutsize; i += n) {
+		n = logo->clutsize - i;
+		/* palette_cmap provides space for only 16 colors at once */
+		if (n > 16)
+			n = 16;
+		palette_cmap.start = 32 + i;
+		palette_cmap.len = n;
+		for (j = 0; j < n; ++j) {
+			palette_cmap.red[j] = clut[0] << 8 | clut[0];
+			palette_cmap.green[j] = clut[1] << 8 | clut[1];
+			palette_cmap.blue[j] = clut[2] << 8 | clut[2];
+			clut += 3;
+		}
+		fb_set_cmap(&palette_cmap, info);
+	}
+}
+
+static void  fb_set_logo_truepalette(struct fb_info *info,
+					    const struct linux_logo *logo,
+					    u32 *palette)
+{
+	static const unsigned char mask[] = {
+		0, 0x80, 0xc0, 0xe0, 0xf0, 0xf8, 0xfc, 0xfe, 0xff
+	};
+	unsigned char redmask, greenmask, bluemask;
+	int redshift, greenshift, blueshift;
+	int i;
+	const unsigned char *clut = logo->clut;
+
+	/*
+	 * We have to create a temporary palette since console palette is only
+	 * 16 colors long.
+	 */
+	/* Bug: Doesn't obey msb_right ... (who needs that?) */
+	redmask   = mask[info->var.red.length   < 8 ? info->var.red.length   : 8];
+	greenmask = mask[info->var.green.length < 8 ? info->var.green.length : 8];
+	bluemask  = mask[info->var.blue.length  < 8 ? info->var.blue.length  : 8];
+	redshift   = info->var.red.offset   - (8 - info->var.red.length);
+	greenshift = info->var.green.offset - (8 - info->var.green.length);
+	blueshift  = info->var.blue.offset  - (8 - info->var.blue.length);
+
+	for (i = 0; i < logo->clutsize; i++) {
+		palette[i+32] = (safe_shift((clut[0] & redmask), redshift) |
+				 safe_shift((clut[1] & greenmask), greenshift) |
+				 safe_shift((clut[2] & bluemask), blueshift));
+		clut += 3;
+	}
+}
+
+static void fb_set_logo_directpalette(struct fb_info *info,
+					     const struct linux_logo *logo,
+					     u32 *palette)
+{
+	int redshift, greenshift, blueshift;
+	int i;
+
+	redshift = info->var.red.offset;
+	greenshift = info->var.green.offset;
+	blueshift = info->var.blue.offset;
+
+	for (i = 32; i < 32 + logo->clutsize; i++)
+		palette[i] = i << redshift | i << greenshift | i << blueshift;
+}
+
+static void fb_set_logo(struct fb_info *info,
+			       const struct linux_logo *logo, u8 *dst,
+			       int depth)
+{
+	int i, j, k;
+	const u8 *src = logo->data;
+	u8 xor = (info->fix.visual == FB_VISUAL_MONO01) ? 0xff : 0;
+	u8 fg = 1, d;
+
+	switch (fb_get_color_depth(&info->var, &info->fix)) {
+	case 1:
+		fg = 1;
+		break;
+	case 2:
+		fg = 3;
+		break;
+	default:
+		fg = 7;
+		break;
+	}
+
+	if (info->fix.visual == FB_VISUAL_MONO01 ||
+	    info->fix.visual == FB_VISUAL_MONO10)
+		fg = ~((u8) (0xfff << info->var.green.length));
+
+	switch (depth) {
+	case 4:
+		for (i = 0; i < logo->height; i++)
+			for (j = 0; j < logo->width; src++) {
+				*dst++ = *src >> 4;
+				j++;
+				if (j < logo->width) {
+					*dst++ = *src & 0x0f;
+					j++;
+				}
+			}
+		break;
+	case 1:
+		for (i = 0; i < logo->height; i++) {
+			for (j = 0; j < logo->width; src++) {
+				d = *src ^ xor;
+				for (k = 7; k >= 0 && j < logo->width; k--) {
+					*dst++ = ((d >> k) & 1) ? fg : 0;
+					j++;
+				}
+			}
+		}
+		break;
+	}
+}
+
+/*
+ * Three (3) kinds of logo maps exist.  linux_logo_clut224 (>16 colors),
+ * linux_logo_vga16 (16 colors) and linux_logo_mono (2 colors).  Depending on
+ * the visual format and color depth of the framebuffer, the DAC, the
+ * pseudo_palette, and the logo data will be adjusted accordingly.
+ *
+ * Case 1 - linux_logo_clut224:
+ * Color exceeds the number of console colors (16), thus we set the hardware DAC
+ * using fb_set_cmap() appropriately.  The "needs_cmapreset"  flag will be set.
+ *
+ * For visuals that require color info from the pseudo_palette, we also construct
+ * one for temporary use. The "needs_directpalette" or "needs_truepalette" flags
+ * will be set.
+ *
+ * Case 2 - linux_logo_vga16:
+ * The number of colors just matches the console colors, thus there is no need
+ * to set the DAC or the pseudo_palette.  However, the bitmap is packed, ie,
+ * each byte contains color information for two pixels (upper and lower nibble).
+ * To be consistent with fb_imageblit() usage, we therefore separate the two
+ * nibbles into separate bytes. The "depth" flag will be set to 4.
+ *
+ * Case 3 - linux_logo_mono:
+ * This is similar with Case 2.  Each byte contains information for 8 pixels.
+ * We isolate each bit and expand each into a byte. The "depth" flag will
+ * be set to 1.
+ */
+static struct logo_data {
+	int depth;
+	int needs_directpalette;
+	int needs_truepalette;
+	int needs_cmapreset;
+	const struct linux_logo *logo;
+} fb_logo __read_mostly;
+
+static void fb_rotate_logo_ud(const u8 *in, u8 *out, u32 width, u32 height)
+{
+	u32 size = width * height, i;
+
+	out += size - 1;
+
+	for (i = size; i--; )
+		*out-- = *in++;
+}
+
+static void fb_rotate_logo_cw(const u8 *in, u8 *out, u32 width, u32 height)
+{
+	int i, j, h = height - 1;
+
+	for (i = 0; i < height; i++)
+		for (j = 0; j < width; j++)
+			out[height * j + h - i] = *in++;
+}
+
+static void fb_rotate_logo_ccw(const u8 *in, u8 *out, u32 width, u32 height)
+{
+	int i, j, w = width - 1;
+
+	for (i = 0; i < height; i++)
+		for (j = 0; j < width; j++)
+			out[height * (w - j) + i] = *in++;
+}
+
+static void fb_rotate_logo(struct fb_info *info, u8 *dst,
+			   struct fb_image *image, int rotate)
+{
+	u32 tmp;
+
+	if (rotate == FB_ROTATE_UD) {
+		fb_rotate_logo_ud(image->data, dst, image->width,
+				  image->height);
+		image->dx = info->var.xres - image->width - image->dx;
+		image->dy = info->var.yres - image->height - image->dy;
+	} else if (rotate == FB_ROTATE_CW) {
+		fb_rotate_logo_cw(image->data, dst, image->width,
+				  image->height);
+		swap(image->width, image->height);
+		tmp = image->dy;
+		image->dy = image->dx;
+		image->dx = info->var.xres - image->width - tmp;
+	} else if (rotate == FB_ROTATE_CCW) {
+		fb_rotate_logo_ccw(image->data, dst, image->width,
+				   image->height);
+		swap(image->width, image->height);
+		tmp = image->dx;
+		image->dx = image->dy;
+		image->dy = info->var.yres - image->height - tmp;
+	}
+
+	image->data = dst;
+}
+
+static void fb_do_show_logo(struct fb_info *info, struct fb_image *image,
+			    int rotate, unsigned int num)
+{
+	unsigned int x;
+
+	if (image->width > info->var.xres || image->height > info->var.yres)
+		return;
+
+	if (rotate == FB_ROTATE_UR) {
+		for (x = 0;
+		     x < num && image->dx + image->width <= info->var.xres;
+		     x++) {
+			info->fbops->fb_imageblit(info, image);
+			image->dx += image->width + 8;
+		}
+	} else if (rotate == FB_ROTATE_UD) {
+		u32 dx = image->dx;
+
+		for (x = 0; x < num && image->dx <= dx; x++) {
+			info->fbops->fb_imageblit(info, image);
+			image->dx -= image->width + 8;
+		}
+	} else if (rotate == FB_ROTATE_CW) {
+		for (x = 0;
+		     x < num && image->dy + image->height <= info->var.yres;
+		     x++) {
+			info->fbops->fb_imageblit(info, image);
+			image->dy += image->height + 8;
+		}
+	} else if (rotate == FB_ROTATE_CCW) {
+		u32 dy = image->dy;
+
+		for (x = 0; x < num && image->dy <= dy; x++) {
+			info->fbops->fb_imageblit(info, image);
+			image->dy -= image->height + 8;
+		}
+	}
+}
+
+static int fb_show_logo_line(struct fb_info *info, int rotate,
+			     const struct linux_logo *logo, int y,
+			     unsigned int n)
+{
+	u32 *palette = NULL, *saved_pseudo_palette = NULL;
+	unsigned char *logo_new = NULL, *logo_rotate = NULL;
+	struct fb_image image;
+
+	/* Return if the frame buffer is not mapped or suspended */
+	if (logo == NULL || info->state != FBINFO_STATE_RUNNING ||
+	    info->fbops->owner)
+		return 0;
+
+	image.depth = 8;
+	image.data = logo->data;
+
+	if (fb_logo.needs_cmapreset)
+		fb_set_logocmap(info, logo);
+
+	if (fb_logo.needs_truepalette ||
+	    fb_logo.needs_directpalette) {
+		palette = kmalloc(256 * 4, GFP_KERNEL);
+		if (palette == NULL)
+			return 0;
+
+		if (fb_logo.needs_truepalette)
+			fb_set_logo_truepalette(info, logo, palette);
+		else
+			fb_set_logo_directpalette(info, logo, palette);
+
+		saved_pseudo_palette = info->pseudo_palette;
+		info->pseudo_palette = palette;
+	}
+
+	if (fb_logo.depth <= 4) {
+		logo_new = kmalloc_array(logo->width, logo->height,
+					 GFP_KERNEL);
+		if (logo_new == NULL) {
+			kfree(palette);
+			if (saved_pseudo_palette)
+				info->pseudo_palette = saved_pseudo_palette;
+			return 0;
+		}
+		image.data = logo_new;
+		fb_set_logo(info, logo, logo_new, fb_logo.depth);
+	}
+
+	if (fb_center_logo) {
+		int xres = info->var.xres;
+		int yres = info->var.yres;
+
+		if (rotate == FB_ROTATE_CW || rotate == FB_ROTATE_CCW) {
+			xres = info->var.yres;
+			yres = info->var.xres;
+		}
+
+		while (n && (n * (logo->width + 8) - 8 > xres))
+			--n;
+		image.dx = (xres - (n * (logo->width + 8) - 8)) / 2;
+		image.dy = y ?: (yres - logo->height) / 2;
+	} else {
+		image.dx = 0;
+		image.dy = y;
+	}
+
+	image.width = logo->width;
+	image.height = logo->height;
+
+	if (rotate) {
+		logo_rotate = kmalloc_array(logo->width, logo->height,
+					    GFP_KERNEL);
+		if (logo_rotate)
+			fb_rotate_logo(info, logo_rotate, &image, rotate);
+	}
+
+	fb_do_show_logo(info, &image, rotate, n);
+
+	kfree(palette);
+	if (saved_pseudo_palette != NULL)
+		info->pseudo_palette = saved_pseudo_palette;
+	kfree(logo_new);
+	kfree(logo_rotate);
+	return image.dy + logo->height;
+}
+
+#ifdef CONFIG_FB_LOGO_EXTRA
+
+#define FB_LOGO_EX_NUM_MAX 10
+static struct logo_data_extra {
+	const struct linux_logo *logo;
+	unsigned int n;
+} fb_logo_ex[FB_LOGO_EX_NUM_MAX];
+static unsigned int fb_logo_ex_num;
+
+void fb_append_extra_logo(const struct linux_logo *logo, unsigned int n)
+{
+	if (!n || fb_logo_ex_num == FB_LOGO_EX_NUM_MAX)
+		return;
+
+	fb_logo_ex[fb_logo_ex_num].logo = logo;
+	fb_logo_ex[fb_logo_ex_num].n = n;
+	fb_logo_ex_num++;
+}
+
+static int fb_prepare_extra_logos(struct fb_info *info, unsigned int height,
+				  unsigned int yres)
+{
+	unsigned int i;
+
+	/* FIXME: logo_ex supports only truecolor fb. */
+	if (info->fix.visual != FB_VISUAL_TRUECOLOR)
+		fb_logo_ex_num = 0;
+
+	for (i = 0; i < fb_logo_ex_num; i++) {
+		if (fb_logo_ex[i].logo->type != fb_logo.logo->type) {
+			fb_logo_ex[i].logo = NULL;
+			continue;
+		}
+		height += fb_logo_ex[i].logo->height;
+		if (height > yres) {
+			height -= fb_logo_ex[i].logo->height;
+			fb_logo_ex_num = i;
+			break;
+		}
+	}
+	return height;
+}
+
+static int fb_show_extra_logos(struct fb_info *info, int y, int rotate)
+{
+	unsigned int i;
+
+	for (i = 0; i < fb_logo_ex_num; i++)
+		y = fb_show_logo_line(info, rotate,
+				      fb_logo_ex[i].logo, y, fb_logo_ex[i].n);
+
+	return y;
+}
+
+#else /* !CONFIG_FB_LOGO_EXTRA */
+
+static inline int fb_prepare_extra_logos(struct fb_info *info,
+					 unsigned int height,
+					 unsigned int yres)
+{
+	return height;
+}
+
+static inline int fb_show_extra_logos(struct fb_info *info, int y, int rotate)
+{
+	return y;
+}
+
+#endif /* CONFIG_FB_LOGO_EXTRA */
+
+int fb_prepare_logo(struct fb_info *info, int rotate)
+{
+	int depth = fb_get_color_depth(&info->var, &info->fix);
+	unsigned int yres;
+	int height;
+
+	memset(&fb_logo, 0, sizeof(struct logo_data));
+
+	if (info->flags & FBINFO_MISC_TILEBLITTING ||
+	    info->fbops->owner || !fb_logo_count)
+		return 0;
+
+	if (info->fix.visual == FB_VISUAL_DIRECTCOLOR) {
+		depth = info->var.blue.length;
+		if (info->var.red.length < depth)
+			depth = info->var.red.length;
+		if (info->var.green.length < depth)
+			depth = info->var.green.length;
+	}
+
+	if (info->fix.visual == FB_VISUAL_STATIC_PSEUDOCOLOR && depth > 4) {
+		/* assume console colormap */
+		depth = 4;
+	}
+
+	/* Return if no suitable logo was found */
+	fb_logo.logo = fb_find_logo(depth);
+
+	if (!fb_logo.logo)
+		return 0;
+
+	if (rotate == FB_ROTATE_UR || rotate == FB_ROTATE_UD)
+		yres = info->var.yres;
+	else
+		yres = info->var.xres;
+
+	if (fb_logo.logo->height > yres) {
+		fb_logo.logo = NULL;
+		return 0;
+	}
+
+	/* What depth we asked for might be different from what we get */
+	if (fb_logo.logo->type == LINUX_LOGO_CLUT224)
+		fb_logo.depth = 8;
+	else if (fb_logo.logo->type == LINUX_LOGO_VGA16)
+		fb_logo.depth = 4;
+	else
+		fb_logo.depth = 1;
+
+
+	if (fb_logo.depth > 4 && depth > 4) {
+		switch (info->fix.visual) {
+		case FB_VISUAL_TRUECOLOR:
+			fb_logo.needs_truepalette = 1;
+			break;
+		case FB_VISUAL_DIRECTCOLOR:
+			fb_logo.needs_directpalette = 1;
+			fb_logo.needs_cmapreset = 1;
+			break;
+		case FB_VISUAL_PSEUDOCOLOR:
+			fb_logo.needs_cmapreset = 1;
+			break;
+		}
+	}
+
+	height = fb_logo.logo->height;
+	if (fb_center_logo)
+		height += (yres - fb_logo.logo->height) / 2;
+
+	return fb_prepare_extra_logos(info, height, yres);
+}
+EXPORT_SYMBOL(fb_prepare_logo);
+
+int fb_show_logo(struct fb_info *info, int rotate)
+{
+	unsigned int count;
+	int y;
+
+	if (!fb_logo_count)
+		return 0;
+
+	count = fb_logo_count < 0 ? num_online_cpus() : fb_logo_count;
+	y = fb_show_logo_line(info, rotate, fb_logo.logo, 0, count);
+	y = fb_show_extra_logos(info, y, rotate);
+
+	return y;
+}
+EXPORT_SYMBOL(fb_show_logo);
+#else
+int fb_prepare_logo(struct fb_info *info, int rotate)
+{
+	return 0;
+}
+EXPORT_SYMBOL(fb_prepare_logo);
+
+int fb_show_logo(struct fb_info *info, int rotate)
+{
+	return 0;
+}
+EXPORT_SYMBOL(fb_show_logo);
+#endif /* CONFIG_LOGO */
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 98e1847e4287..1a662a606ba6 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -21,7 +21,6 @@
 #include <linux/mman.h>
 #include <linux/vt.h>
 #include <linux/init.h>
-#include <linux/linux_logo.h>
 #include <linux/platform_device.h>
 #include <linux/console.h>
 #include <linux/kmod.h>
@@ -53,10 +52,6 @@ int num_registered_fb __read_mostly;
 	for (i = 0; i < FB_MAX; i++)		\
 		if (!registered_fb[i]) {} else
 
-bool fb_center_logo __read_mostly;
-
-int fb_logo_count __read_mostly = -1;
-
 struct fb_info *get_fb_info(unsigned int idx)
 {
 	struct fb_info *fb_info;
@@ -184,525 +179,6 @@ char* fb_get_buffer_offset(struct fb_info *info, struct fb_pixmap *buf, u32 size
 }
 EXPORT_SYMBOL(fb_get_buffer_offset);
 
-#ifdef CONFIG_LOGO
-
-static inline unsigned int safe_shift(unsigned int d, int n)
-{
-	return n < 0 ? d >> -n : d << n;
-}
-
-static void fb_set_logocmap(struct fb_info *info,
-				   const struct linux_logo *logo)
-{
-	struct fb_cmap palette_cmap;
-	u16 palette_green[16];
-	u16 palette_blue[16];
-	u16 palette_red[16];
-	int i, j, n;
-	const unsigned char *clut = logo->clut;
-
-	palette_cmap.start = 0;
-	palette_cmap.len = 16;
-	palette_cmap.red = palette_red;
-	palette_cmap.green = palette_green;
-	palette_cmap.blue = palette_blue;
-	palette_cmap.transp = NULL;
-
-	for (i = 0; i < logo->clutsize; i += n) {
-		n = logo->clutsize - i;
-		/* palette_cmap provides space for only 16 colors at once */
-		if (n > 16)
-			n = 16;
-		palette_cmap.start = 32 + i;
-		palette_cmap.len = n;
-		for (j = 0; j < n; ++j) {
-			palette_cmap.red[j] = clut[0] << 8 | clut[0];
-			palette_cmap.green[j] = clut[1] << 8 | clut[1];
-			palette_cmap.blue[j] = clut[2] << 8 | clut[2];
-			clut += 3;
-		}
-		fb_set_cmap(&palette_cmap, info);
-	}
-}
-
-static void  fb_set_logo_truepalette(struct fb_info *info,
-					    const struct linux_logo *logo,
-					    u32 *palette)
-{
-	static const unsigned char mask[] = {
-		0, 0x80, 0xc0, 0xe0, 0xf0, 0xf8, 0xfc, 0xfe, 0xff
-	};
-	unsigned char redmask, greenmask, bluemask;
-	int redshift, greenshift, blueshift;
-	int i;
-	const unsigned char *clut = logo->clut;
-
-	/*
-	 * We have to create a temporary palette since console palette is only
-	 * 16 colors long.
-	 */
-	/* Bug: Doesn't obey msb_right ... (who needs that?) */
-	redmask   = mask[info->var.red.length   < 8 ? info->var.red.length   : 8];
-	greenmask = mask[info->var.green.length < 8 ? info->var.green.length : 8];
-	bluemask  = mask[info->var.blue.length  < 8 ? info->var.blue.length  : 8];
-	redshift   = info->var.red.offset   - (8 - info->var.red.length);
-	greenshift = info->var.green.offset - (8 - info->var.green.length);
-	blueshift  = info->var.blue.offset  - (8 - info->var.blue.length);
-
-	for (i = 0; i < logo->clutsize; i++) {
-		palette[i+32] = (safe_shift((clut[0] & redmask), redshift) |
-				 safe_shift((clut[1] & greenmask), greenshift) |
-				 safe_shift((clut[2] & bluemask), blueshift));
-		clut += 3;
-	}
-}
-
-static void fb_set_logo_directpalette(struct fb_info *info,
-					     const struct linux_logo *logo,
-					     u32 *palette)
-{
-	int redshift, greenshift, blueshift;
-	int i;
-
-	redshift = info->var.red.offset;
-	greenshift = info->var.green.offset;
-	blueshift = info->var.blue.offset;
-
-	for (i = 32; i < 32 + logo->clutsize; i++)
-		palette[i] = i << redshift | i << greenshift | i << blueshift;
-}
-
-static void fb_set_logo(struct fb_info *info,
-			       const struct linux_logo *logo, u8 *dst,
-			       int depth)
-{
-	int i, j, k;
-	const u8 *src = logo->data;
-	u8 xor = (info->fix.visual == FB_VISUAL_MONO01) ? 0xff : 0;
-	u8 fg = 1, d;
-
-	switch (fb_get_color_depth(&info->var, &info->fix)) {
-	case 1:
-		fg = 1;
-		break;
-	case 2:
-		fg = 3;
-		break;
-	default:
-		fg = 7;
-		break;
-	}
-
-	if (info->fix.visual == FB_VISUAL_MONO01 ||
-	    info->fix.visual == FB_VISUAL_MONO10)
-		fg = ~((u8) (0xfff << info->var.green.length));
-
-	switch (depth) {
-	case 4:
-		for (i = 0; i < logo->height; i++)
-			for (j = 0; j < logo->width; src++) {
-				*dst++ = *src >> 4;
-				j++;
-				if (j < logo->width) {
-					*dst++ = *src & 0x0f;
-					j++;
-				}
-			}
-		break;
-	case 1:
-		for (i = 0; i < logo->height; i++) {
-			for (j = 0; j < logo->width; src++) {
-				d = *src ^ xor;
-				for (k = 7; k >= 0 && j < logo->width; k--) {
-					*dst++ = ((d >> k) & 1) ? fg : 0;
-					j++;
-				}
-			}
-		}
-		break;
-	}
-}
-
-/*
- * Three (3) kinds of logo maps exist.  linux_logo_clut224 (>16 colors),
- * linux_logo_vga16 (16 colors) and linux_logo_mono (2 colors).  Depending on
- * the visual format and color depth of the framebuffer, the DAC, the
- * pseudo_palette, and the logo data will be adjusted accordingly.
- *
- * Case 1 - linux_logo_clut224:
- * Color exceeds the number of console colors (16), thus we set the hardware DAC
- * using fb_set_cmap() appropriately.  The "needs_cmapreset"  flag will be set.
- *
- * For visuals that require color info from the pseudo_palette, we also construct
- * one for temporary use. The "needs_directpalette" or "needs_truepalette" flags
- * will be set.
- *
- * Case 2 - linux_logo_vga16:
- * The number of colors just matches the console colors, thus there is no need
- * to set the DAC or the pseudo_palette.  However, the bitmap is packed, ie,
- * each byte contains color information for two pixels (upper and lower nibble).
- * To be consistent with fb_imageblit() usage, we therefore separate the two
- * nibbles into separate bytes. The "depth" flag will be set to 4.
- *
- * Case 3 - linux_logo_mono:
- * This is similar with Case 2.  Each byte contains information for 8 pixels.
- * We isolate each bit and expand each into a byte. The "depth" flag will
- * be set to 1.
- */
-static struct logo_data {
-	int depth;
-	int needs_directpalette;
-	int needs_truepalette;
-	int needs_cmapreset;
-	const struct linux_logo *logo;
-} fb_logo __read_mostly;
-
-static void fb_rotate_logo_ud(const u8 *in, u8 *out, u32 width, u32 height)
-{
-	u32 size = width * height, i;
-
-	out += size - 1;
-
-	for (i = size; i--; )
-		*out-- = *in++;
-}
-
-static void fb_rotate_logo_cw(const u8 *in, u8 *out, u32 width, u32 height)
-{
-	int i, j, h = height - 1;
-
-	for (i = 0; i < height; i++)
-		for (j = 0; j < width; j++)
-			out[height * j + h - i] = *in++;
-}
-
-static void fb_rotate_logo_ccw(const u8 *in, u8 *out, u32 width, u32 height)
-{
-	int i, j, w = width - 1;
-
-	for (i = 0; i < height; i++)
-		for (j = 0; j < width; j++)
-			out[height * (w - j) + i] = *in++;
-}
-
-static void fb_rotate_logo(struct fb_info *info, u8 *dst,
-			   struct fb_image *image, int rotate)
-{
-	u32 tmp;
-
-	if (rotate == FB_ROTATE_UD) {
-		fb_rotate_logo_ud(image->data, dst, image->width,
-				  image->height);
-		image->dx = info->var.xres - image->width - image->dx;
-		image->dy = info->var.yres - image->height - image->dy;
-	} else if (rotate == FB_ROTATE_CW) {
-		fb_rotate_logo_cw(image->data, dst, image->width,
-				  image->height);
-		swap(image->width, image->height);
-		tmp = image->dy;
-		image->dy = image->dx;
-		image->dx = info->var.xres - image->width - tmp;
-	} else if (rotate == FB_ROTATE_CCW) {
-		fb_rotate_logo_ccw(image->data, dst, image->width,
-				   image->height);
-		swap(image->width, image->height);
-		tmp = image->dx;
-		image->dx = image->dy;
-		image->dy = info->var.yres - image->height - tmp;
-	}
-
-	image->data = dst;
-}
-
-static void fb_do_show_logo(struct fb_info *info, struct fb_image *image,
-			    int rotate, unsigned int num)
-{
-	unsigned int x;
-
-	if (image->width > info->var.xres || image->height > info->var.yres)
-		return;
-
-	if (rotate == FB_ROTATE_UR) {
-		for (x = 0;
-		     x < num && image->dx + image->width <= info->var.xres;
-		     x++) {
-			info->fbops->fb_imageblit(info, image);
-			image->dx += image->width + 8;
-		}
-	} else if (rotate == FB_ROTATE_UD) {
-		u32 dx = image->dx;
-
-		for (x = 0; x < num && image->dx <= dx; x++) {
-			info->fbops->fb_imageblit(info, image);
-			image->dx -= image->width + 8;
-		}
-	} else if (rotate == FB_ROTATE_CW) {
-		for (x = 0;
-		     x < num && image->dy + image->height <= info->var.yres;
-		     x++) {
-			info->fbops->fb_imageblit(info, image);
-			image->dy += image->height + 8;
-		}
-	} else if (rotate == FB_ROTATE_CCW) {
-		u32 dy = image->dy;
-
-		for (x = 0; x < num && image->dy <= dy; x++) {
-			info->fbops->fb_imageblit(info, image);
-			image->dy -= image->height + 8;
-		}
-	}
-}
-
-static int fb_show_logo_line(struct fb_info *info, int rotate,
-			     const struct linux_logo *logo, int y,
-			     unsigned int n)
-{
-	u32 *palette = NULL, *saved_pseudo_palette = NULL;
-	unsigned char *logo_new = NULL, *logo_rotate = NULL;
-	struct fb_image image;
-
-	/* Return if the frame buffer is not mapped or suspended */
-	if (logo == NULL || info->state != FBINFO_STATE_RUNNING ||
-	    info->fbops->owner)
-		return 0;
-
-	image.depth = 8;
-	image.data = logo->data;
-
-	if (fb_logo.needs_cmapreset)
-		fb_set_logocmap(info, logo);
-
-	if (fb_logo.needs_truepalette ||
-	    fb_logo.needs_directpalette) {
-		palette = kmalloc(256 * 4, GFP_KERNEL);
-		if (palette == NULL)
-			return 0;
-
-		if (fb_logo.needs_truepalette)
-			fb_set_logo_truepalette(info, logo, palette);
-		else
-			fb_set_logo_directpalette(info, logo, palette);
-
-		saved_pseudo_palette = info->pseudo_palette;
-		info->pseudo_palette = palette;
-	}
-
-	if (fb_logo.depth <= 4) {
-		logo_new = kmalloc_array(logo->width, logo->height,
-					 GFP_KERNEL);
-		if (logo_new == NULL) {
-			kfree(palette);
-			if (saved_pseudo_palette)
-				info->pseudo_palette = saved_pseudo_palette;
-			return 0;
-		}
-		image.data = logo_new;
-		fb_set_logo(info, logo, logo_new, fb_logo.depth);
-	}
-
-	if (fb_center_logo) {
-		int xres = info->var.xres;
-		int yres = info->var.yres;
-
-		if (rotate == FB_ROTATE_CW || rotate == FB_ROTATE_CCW) {
-			xres = info->var.yres;
-			yres = info->var.xres;
-		}
-
-		while (n && (n * (logo->width + 8) - 8 > xres))
-			--n;
-		image.dx = (xres - (n * (logo->width + 8) - 8)) / 2;
-		image.dy = y ?: (yres - logo->height) / 2;
-	} else {
-		image.dx = 0;
-		image.dy = y;
-	}
-
-	image.width = logo->width;
-	image.height = logo->height;
-
-	if (rotate) {
-		logo_rotate = kmalloc_array(logo->width, logo->height,
-					    GFP_KERNEL);
-		if (logo_rotate)
-			fb_rotate_logo(info, logo_rotate, &image, rotate);
-	}
-
-	fb_do_show_logo(info, &image, rotate, n);
-
-	kfree(palette);
-	if (saved_pseudo_palette != NULL)
-		info->pseudo_palette = saved_pseudo_palette;
-	kfree(logo_new);
-	kfree(logo_rotate);
-	return image.dy + logo->height;
-}
-
-
-#ifdef CONFIG_FB_LOGO_EXTRA
-
-#define FB_LOGO_EX_NUM_MAX 10
-static struct logo_data_extra {
-	const struct linux_logo *logo;
-	unsigned int n;
-} fb_logo_ex[FB_LOGO_EX_NUM_MAX];
-static unsigned int fb_logo_ex_num;
-
-void fb_append_extra_logo(const struct linux_logo *logo, unsigned int n)
-{
-	if (!n || fb_logo_ex_num == FB_LOGO_EX_NUM_MAX)
-		return;
-
-	fb_logo_ex[fb_logo_ex_num].logo = logo;
-	fb_logo_ex[fb_logo_ex_num].n = n;
-	fb_logo_ex_num++;
-}
-
-static int fb_prepare_extra_logos(struct fb_info *info, unsigned int height,
-				  unsigned int yres)
-{
-	unsigned int i;
-
-	/* FIXME: logo_ex supports only truecolor fb. */
-	if (info->fix.visual != FB_VISUAL_TRUECOLOR)
-		fb_logo_ex_num = 0;
-
-	for (i = 0; i < fb_logo_ex_num; i++) {
-		if (fb_logo_ex[i].logo->type != fb_logo.logo->type) {
-			fb_logo_ex[i].logo = NULL;
-			continue;
-		}
-		height += fb_logo_ex[i].logo->height;
-		if (height > yres) {
-			height -= fb_logo_ex[i].logo->height;
-			fb_logo_ex_num = i;
-			break;
-		}
-	}
-	return height;
-}
-
-static int fb_show_extra_logos(struct fb_info *info, int y, int rotate)
-{
-	unsigned int i;
-
-	for (i = 0; i < fb_logo_ex_num; i++)
-		y = fb_show_logo_line(info, rotate,
-				      fb_logo_ex[i].logo, y, fb_logo_ex[i].n);
-
-	return y;
-}
-
-#else /* !CONFIG_FB_LOGO_EXTRA */
-
-static inline int fb_prepare_extra_logos(struct fb_info *info,
-					 unsigned int height,
-					 unsigned int yres)
-{
-	return height;
-}
-
-static inline int fb_show_extra_logos(struct fb_info *info, int y, int rotate)
-{
-	return y;
-}
-
-#endif /* CONFIG_FB_LOGO_EXTRA */
-
-
-int fb_prepare_logo(struct fb_info *info, int rotate)
-{
-	int depth = fb_get_color_depth(&info->var, &info->fix);
-	unsigned int yres;
-	int height;
-
-	memset(&fb_logo, 0, sizeof(struct logo_data));
-
-	if (info->flags & FBINFO_MISC_TILEBLITTING ||
-	    info->fbops->owner || !fb_logo_count)
-		return 0;
-
-	if (info->fix.visual == FB_VISUAL_DIRECTCOLOR) {
-		depth = info->var.blue.length;
-		if (info->var.red.length < depth)
-			depth = info->var.red.length;
-		if (info->var.green.length < depth)
-			depth = info->var.green.length;
-	}
-
-	if (info->fix.visual == FB_VISUAL_STATIC_PSEUDOCOLOR && depth > 4) {
-		/* assume console colormap */
-		depth = 4;
-	}
-
-	/* Return if no suitable logo was found */
-	fb_logo.logo = fb_find_logo(depth);
-
-	if (!fb_logo.logo)
-		return 0;
-
-	if (rotate == FB_ROTATE_UR || rotate == FB_ROTATE_UD)
-		yres = info->var.yres;
-	else
-		yres = info->var.xres;
-
-	if (fb_logo.logo->height > yres) {
-		fb_logo.logo = NULL;
-		return 0;
-	}
-
-	/* What depth we asked for might be different from what we get */
-	if (fb_logo.logo->type == LINUX_LOGO_CLUT224)
-		fb_logo.depth = 8;
-	else if (fb_logo.logo->type == LINUX_LOGO_VGA16)
-		fb_logo.depth = 4;
-	else
-		fb_logo.depth = 1;
-
-
-	if (fb_logo.depth > 4 && depth > 4) {
-		switch (info->fix.visual) {
-		case FB_VISUAL_TRUECOLOR:
-			fb_logo.needs_truepalette = 1;
-			break;
-		case FB_VISUAL_DIRECTCOLOR:
-			fb_logo.needs_directpalette = 1;
-			fb_logo.needs_cmapreset = 1;
-			break;
-		case FB_VISUAL_PSEUDOCOLOR:
-			fb_logo.needs_cmapreset = 1;
-			break;
-		}
-	}
-
-	height = fb_logo.logo->height;
-	if (fb_center_logo)
-		height += (yres - fb_logo.logo->height) / 2;
-
-	return fb_prepare_extra_logos(info, height, yres);
-}
-
-int fb_show_logo(struct fb_info *info, int rotate)
-{
-	unsigned int count;
-	int y;
-
-	if (!fb_logo_count)
-		return 0;
-
-	count = fb_logo_count < 0 ? num_online_cpus() : fb_logo_count;
-	y = fb_show_logo_line(info, rotate, fb_logo.logo, 0, count);
-	y = fb_show_extra_logos(info, y, rotate);
-
-	return y;
-}
-#else
-int fb_prepare_logo(struct fb_info *info, int rotate) { return 0; }
-int fb_show_logo(struct fb_info *info, int rotate) { return 0; }
-#endif /* CONFIG_LOGO */
-EXPORT_SYMBOL(fb_prepare_logo);
-EXPORT_SYMBOL(fb_show_logo);
-
 int
 fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var)
 {
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 16c3e6d6c55d..d110676c9c83 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -591,8 +591,6 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 /* drivers/video/fbmem.c */
 extern int register_framebuffer(struct fb_info *fb_info);
 extern void unregister_framebuffer(struct fb_info *fb_info);
-extern int fb_prepare_logo(struct fb_info *fb_info, int rotate);
-extern int fb_show_logo(struct fb_info *fb_info, int rotate);
 extern char* fb_get_buffer_offset(struct fb_info *info, struct fb_pixmap *buf, u32 size);
 extern void fb_pad_unaligned_buffer(u8 *dst, u32 d_pitch, u8 *src, u32 idx,
 				u32 height, u32 shift_high, u32 shift_low, u32 mod);
@@ -603,9 +601,6 @@ extern int fb_get_color_depth(struct fb_var_screeninfo *var,
 extern int fb_get_options(const char *name, char **option);
 extern int fb_new_modelist(struct fb_info *info);
 
-extern bool fb_center_logo;
-extern int fb_logo_count;
-
 static inline void lock_fb_info(struct fb_info *info)
 {
 	mutex_lock(&info->lock);
-- 
2.41.0

