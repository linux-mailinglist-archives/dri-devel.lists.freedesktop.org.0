Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5211BA82084
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 10:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8601610E80E;
	Wed,  9 Apr 2025 08:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B5410E782
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 08:50:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E158221168;
 Wed,  9 Apr 2025 08:50:20 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5A0D13A7A;
 Wed,  9 Apr 2025 08:50:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6EoBK8w09mdgZQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Apr 2025 08:50:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/3] drm/sysfb: Share helpers for screen_info validation
Date: Wed,  9 Apr 2025 10:45:38 +0200
Message-ID: <20250409084729.236719-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409084729.236719-1-tzimmermann@suse.de>
References: <20250409084729.236719-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: E158221168
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Share efidrm's and vesadrm's validation of struct screen_info in
shared helpers. Update the drivers.

Most validation helpers test individual values against limits and
can be shared as they are. For color formats, a common helper looks
up the correct DRM format info from a driver-provided list of color
formats.

These screen_info helpers are only available if CONFIG_SCREEN_INFO
has been selected, as done by efidrm and vesadrm.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sysfb/Makefile                |   1 +
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |  34 ++++++
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c | 107 ++++++++++++++++++
 drivers/gpu/drm/sysfb/efidrm.c                | 105 ++---------------
 drivers/gpu/drm/sysfb/vesadrm.c               | 105 ++---------------
 5 files changed, 160 insertions(+), 192 deletions(-)
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c

diff --git a/drivers/gpu/drm/sysfb/Makefile b/drivers/gpu/drm/sysfb/Makefile
index 861b4026f4a6e..a156c496413d3 100644
--- a/drivers/gpu/drm/sysfb/Makefile
+++ b/drivers/gpu/drm/sysfb/Makefile
@@ -3,6 +3,7 @@
 drm_sysfb_helper-y := \
 	drm_sysfb.o \
 	drm_sysfb_modeset.o
+drm_sysfb_helper-$(CONFIG_SCREEN_INFO) += drm_sysfb_screen_info.o
 obj-$(CONFIG_DRM_SYSFB_HELPER)	+= drm_sysfb_helper.o
 
 obj-$(CONFIG_DRM_EFIDRM)	+= efidrm.o
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index 1697cf7ace973..cb08a88242cc1 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -6,12 +6,46 @@
 #include <linux/container_of.h>
 #include <linux/iosys-map.h>
 
+#include <video/pixel_format.h>
+
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_modes.h>
 
 struct drm_format_info;
 struct drm_scanout_buffer;
+struct screen_info;
+
+/*
+ * Input parsing
+ */
+
+struct drm_sysfb_format {
+	struct pixel_format pixel;
+	u32 fourcc;
+};
+
+int drm_sysfb_get_validated_int(struct drm_device *dev, const char *name,
+				u64 value, u32 max);
+int drm_sysfb_get_validated_int0(struct drm_device *dev, const char *name,
+				 u64 value, u32 max);
+
+#if defined(CONFIG_SCREEN_INFO)
+int drm_sysfb_get_width_si(struct drm_device *dev, const struct screen_info *si);
+int drm_sysfb_get_height_si(struct drm_device *dev, const struct screen_info *si);
+struct resource *drm_sysfb_get_memory_si(struct drm_device *dev,
+					 const struct screen_info *si,
+					 struct resource *res);
+int drm_sysfb_get_stride_si(struct drm_device *dev, const struct screen_info *si,
+			    const struct drm_format_info *format,
+			    unsigned int width, unsigned int height, u64 size);
+u64 drm_sysfb_get_visible_size_si(struct drm_device *dev, const struct screen_info *si,
+				  unsigned int height, unsigned int stride, u64 size);
+const struct drm_format_info *drm_sysfb_get_format_si(struct drm_device *dev,
+						      const struct drm_sysfb_format *formats,
+						      size_t nformats,
+						      const struct screen_info *si);
+#endif
 
 /*
  * Input parsing
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c b/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c
new file mode 100644
index 0000000000000..0b3fb874a51f2
--- /dev/null
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/export.h>
+#include <linux/limits.h>
+#include <linux/minmax.h>
+#include <linux/screen_info.h>
+
+#include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
+
+#include "drm_sysfb_helper.h"
+
+static s64 drm_sysfb_get_validated_size0(struct drm_device *dev, const char *name,
+					 u64 value, u64 max)
+{
+	if (!value) {
+		drm_warn(dev, "%s of 0 not allowed\n", name);
+		return -EINVAL;
+	} else if (value > min(max, S64_MAX)) {
+		drm_warn(dev, "%s of %llu exceeds maximum of %llu\n", name, value, max);
+		return -EINVAL;
+	}
+	return value;
+}
+
+int drm_sysfb_get_width_si(struct drm_device *dev, const struct screen_info *si)
+{
+	return drm_sysfb_get_validated_int0(dev, "width", si->lfb_width, U16_MAX);
+}
+EXPORT_SYMBOL(drm_sysfb_get_width_si);
+
+int drm_sysfb_get_height_si(struct drm_device *dev, const struct screen_info *si)
+{
+	return drm_sysfb_get_validated_int0(dev, "height", si->lfb_height, U16_MAX);
+}
+EXPORT_SYMBOL(drm_sysfb_get_height_si);
+
+struct resource *drm_sysfb_get_memory_si(struct drm_device *dev,
+					 const struct screen_info *si,
+					 struct resource *res)
+{
+	ssize_t	num;
+
+	num = screen_info_resources(si, res, 1);
+	if (!num) {
+		drm_warn(dev, "memory resource not found\n");
+		return NULL;
+	}
+
+	return res;
+}
+EXPORT_SYMBOL(drm_sysfb_get_memory_si);
+
+int drm_sysfb_get_stride_si(struct drm_device *dev, const struct screen_info *si,
+			    const struct drm_format_info *format,
+			    unsigned int width, unsigned int height, u64 size)
+{
+	u64 lfb_linelength = si->lfb_linelength;
+
+	if (!lfb_linelength)
+		lfb_linelength = drm_format_info_min_pitch(format, 0, width);
+
+	return drm_sysfb_get_validated_int0(dev, "stride", lfb_linelength, div64_u64(size, height));
+}
+EXPORT_SYMBOL(drm_sysfb_get_stride_si);
+
+u64 drm_sysfb_get_visible_size_si(struct drm_device *dev, const struct screen_info *si,
+				  unsigned int height, unsigned int stride, u64 size)
+{
+	u64 vsize = PAGE_ALIGN(height * stride);
+
+	return drm_sysfb_get_validated_size0(dev, "visible size", vsize, size);
+}
+EXPORT_SYMBOL(drm_sysfb_get_visible_size_si);
+
+const struct drm_format_info *drm_sysfb_get_format_si(struct drm_device *dev,
+						      const struct drm_sysfb_format *formats,
+						      size_t nformats,
+						      const struct screen_info *si)
+{
+	const struct drm_format_info *format = NULL;
+	u32 bits_per_pixel;
+	size_t i;
+
+	bits_per_pixel = __screen_info_lfb_bits_per_pixel(si);
+
+	for (i = 0; i < nformats; ++i) {
+		const struct pixel_format *f = &formats[i].pixel;
+
+		if (bits_per_pixel == f->bits_per_pixel &&
+		    si->red_size == f->red.length &&
+		    si->red_pos == f->red.offset &&
+		    si->green_size == f->green.length &&
+		    si->green_pos == f->green.offset &&
+		    si->blue_size == f->blue.length &&
+		    si->blue_pos == f->blue.offset) {
+			format = drm_format_info(formats[i].fourcc);
+			break;
+		}
+	}
+
+	if (!format)
+		drm_warn(dev, "No compatible color format found\n");
+
+	return format;
+}
+EXPORT_SYMBOL(drm_sysfb_get_format_si);
diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
index a77ea5285cc1d..07eb494203a25 100644
--- a/drivers/gpu/drm/sysfb/efidrm.c
+++ b/drivers/gpu/drm/sysfb/efidrm.c
@@ -33,72 +33,10 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
-static s64 efidrm_get_validated_size0(struct drm_device *dev, const char *name,
-				      u64 value, u64 max)
-{
-	if (!value) {
-		drm_err(dev, "%s of 0 not allowed\n", name);
-		return -EINVAL;
-	} else if (value > max) {
-		drm_err(dev, "%s of %llu exceeds maximum of %llu\n", name, value, max);
-		return -EINVAL;
-	}
-	return value;
-}
-
-static int efidrm_get_width_si(struct drm_device *dev, const struct screen_info *si)
-{
-	return drm_sysfb_get_validated_int0(dev, "width", si->lfb_width, U16_MAX);
-}
-
-static int efidrm_get_height_si(struct drm_device *dev, const struct screen_info *si)
-{
-	return drm_sysfb_get_validated_int0(dev, "height", si->lfb_height, U16_MAX);
-}
-
-static struct resource *efidrm_get_memory_si(struct drm_device *dev,
-					     const struct screen_info *si,
-					     struct resource *res)
-{
-	ssize_t	num;
-
-	num = screen_info_resources(si, res, 1);
-	if (!num) {
-		drm_err(dev, "memory resource not found\n");
-		return NULL;
-	}
-
-	return res;
-}
-
-static int efidrm_get_stride_si(struct drm_device *dev, const struct screen_info *si,
-				const struct drm_format_info *format,
-				unsigned int width, unsigned int height, u64 size)
-{
-	u64 lfb_linelength = si->lfb_linelength;
-
-	if (!lfb_linelength)
-		lfb_linelength = drm_format_info_min_pitch(format, 0, width);
-
-	return drm_sysfb_get_validated_int0(dev, "stride", lfb_linelength,
-					    div64_u64(size, height));
-}
-
-static u64 efidrm_get_visible_size_si(struct drm_device *dev, const struct screen_info *si,
-				      unsigned int height, unsigned int stride, u64 size)
-{
-	u64 vsize = PAGE_ALIGN(height * stride);
-
-	return efidrm_get_validated_size0(dev, "visible size", vsize, size);
-}
-
 static const struct drm_format_info *efidrm_get_format_si(struct drm_device *dev,
 							  const struct screen_info *si)
 {
-	static const struct {
-		struct pixel_format pixel;
-		u32 fourcc;
-	} efi_formats[] = {
+	static const struct drm_sysfb_format formats[] = {
 		{ PIXEL_FORMAT_XRGB1555, DRM_FORMAT_XRGB1555, },
 		{ PIXEL_FORMAT_RGB565, DRM_FORMAT_RGB565, },
 		{ PIXEL_FORMAT_RGB888, DRM_FORMAT_RGB888, },
@@ -106,33 +44,8 @@ static const struct drm_format_info *efidrm_get_format_si(struct drm_device *dev
 		{ PIXEL_FORMAT_XBGR8888, DRM_FORMAT_XBGR8888, },
 		{ PIXEL_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, },
 	};
-	const struct drm_format_info *format = NULL;
-	u32 bits_per_pixel;
-	size_t i;
-
-	bits_per_pixel = __screen_info_lfb_bits_per_pixel(si);
-
-	for (i = 0; i < ARRAY_SIZE(efi_formats); ++i) {
-		const struct pixel_format *f = &efi_formats[i].pixel;
-
-		if (bits_per_pixel == f->bits_per_pixel &&
-		    si->red_size == f->red.length &&
-		    si->red_pos == f->red.offset &&
-		    si->green_size == f->green.length &&
-		    si->green_pos == f->green.offset &&
-		    si->blue_size == f->blue.length &&
-		    si->blue_pos == f->blue.offset) {
-			format = drm_format_info(efi_formats[i].fourcc);
-			break;
-		}
-	}
-
-	if (!format)
-		return ERR_PTR(-EINVAL);
-	if (format->is_color_indexed)
-		return ERR_PTR(-EINVAL);
 
-	return format;
+	return drm_sysfb_get_format_si(dev, formats, ARRAY_SIZE(formats), si);
 }
 
 static u64 efidrm_get_mem_flags(struct drm_device *dev, resource_size_t start,
@@ -268,21 +181,21 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
 	 */
 
 	format = efidrm_get_format_si(dev, si);
-	if (IS_ERR(format))
-		return ERR_CAST(format);
-	width = efidrm_get_width_si(dev, si);
+	if (!format)
+		return ERR_PTR(-EINVAL);
+	width = drm_sysfb_get_width_si(dev, si);
 	if (width < 0)
 		return ERR_PTR(width);
-	height = efidrm_get_height_si(dev, si);
+	height = drm_sysfb_get_height_si(dev, si);
 	if (height < 0)
 		return ERR_PTR(height);
-	res = efidrm_get_memory_si(dev, si, &resbuf);
+	res = drm_sysfb_get_memory_si(dev, si, &resbuf);
 	if (!res)
 		return ERR_PTR(-EINVAL);
-	stride = efidrm_get_stride_si(dev, si, format, width, height, resource_size(res));
+	stride = drm_sysfb_get_stride_si(dev, si, format, width, height, resource_size(res));
 	if (stride < 0)
 		return ERR_PTR(stride);
-	vsize = efidrm_get_visible_size_si(dev, si, height, stride, resource_size(res));
+	vsize = drm_sysfb_get_visible_size_si(dev, si, height, stride, resource_size(res));
 	if (!vsize)
 		return ERR_PTR(-EINVAL);
 
diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index d87ff77be20de..4d62c78e7d1e0 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -36,105 +36,18 @@
 
 #define VESADRM_GAMMA_LUT_SIZE 256
 
-static s64 vesadrm_get_validated_size0(struct drm_device *dev, const char *name,
-				       u64 value, u64 max)
-{
-	if (!value) {
-		drm_err(dev, "vesadrm: %s of 0 not allowed\n", name);
-		return -EINVAL;
-	} else if (value > max) {
-		drm_err(dev, "vesadrm: %s of %llu exceeds maximum of %llu\n", name, value, max);
-		return -EINVAL;
-	}
-	return value;
-}
-
-static int vesadrm_get_width_si(struct drm_device *dev, const struct screen_info *si)
-{
-	return drm_sysfb_get_validated_int0(dev, "width", si->lfb_width, U16_MAX);
-}
-
-static int vesadrm_get_height_si(struct drm_device *dev, const struct screen_info *si)
-{
-	return drm_sysfb_get_validated_int0(dev, "height", si->lfb_height, U16_MAX);
-}
-
-static struct resource *vesadrm_get_memory_si(struct drm_device *dev,
-					      const struct screen_info *si,
-					      struct resource *res)
-{
-	ssize_t	num;
-
-	num = screen_info_resources(si, res, 1);
-	if (!num) {
-		drm_err(dev, "vesadrm: memory resource not found\n");
-		return NULL;
-	}
-
-	return res;
-}
-
-static int vesadrm_get_stride_si(struct drm_device *dev, const struct screen_info *si,
-				 const struct drm_format_info *format,
-				 unsigned int width, unsigned int height, u64 size)
-{
-	u64 lfb_linelength = si->lfb_linelength;
-
-	if (!lfb_linelength)
-		lfb_linelength = drm_format_info_min_pitch(format, 0, width);
-
-	return drm_sysfb_get_validated_int0(dev, "stride", lfb_linelength,
-					    div64_u64(size, height));
-}
-
-static u64 vesadrm_get_visible_size_si(struct drm_device *dev, const struct screen_info *si,
-				       unsigned int height, unsigned int stride, u64 size)
-{
-	u64 vsize = PAGE_ALIGN(height * stride);
-
-	return vesadrm_get_validated_size0(dev, "visible size", vsize, size);
-}
-
 static const struct drm_format_info *vesadrm_get_format_si(struct drm_device *dev,
 							   const struct screen_info *si)
 {
-	static const struct {
-		struct pixel_format pixel;
-		u32 fourcc;
-	} vesa_formats[] = {
+	static const struct drm_sysfb_format formats[] = {
 		{ PIXEL_FORMAT_XRGB1555, DRM_FORMAT_XRGB1555, },
 		{ PIXEL_FORMAT_RGB565, DRM_FORMAT_RGB565, },
 		{ PIXEL_FORMAT_RGB888, DRM_FORMAT_RGB888, },
 		{ PIXEL_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, },
 		{ PIXEL_FORMAT_XBGR8888, DRM_FORMAT_XBGR8888, },
 	};
-	const struct drm_format_info *format = NULL;
-	u32 bits_per_pixel;
-	size_t i;
-
-	bits_per_pixel = __screen_info_lfb_bits_per_pixel(si);
-
-	for (i = 0; i < ARRAY_SIZE(vesa_formats); ++i) {
-		const struct pixel_format *f = &vesa_formats[i].pixel;
 
-		if (bits_per_pixel == f->bits_per_pixel &&
-		    si->red_size == f->red.length &&
-		    si->red_pos == f->red.offset &&
-		    si->green_size == f->green.length &&
-		    si->green_pos == f->green.offset &&
-		    si->blue_size == f->blue.length &&
-		    si->blue_pos == f->blue.offset) {
-			format = drm_format_info(vesa_formats[i].fourcc);
-			break;
-		}
-	}
-
-	if (!format)
-		return ERR_PTR(-EINVAL);
-	if (format->is_color_indexed)
-		return ERR_PTR(-EINVAL);
-
-	return format;
+	return drm_sysfb_get_format_si(dev, formats, ARRAY_SIZE(formats), si);
 }
 
 /*
@@ -426,21 +339,21 @@ static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
 	 */
 
 	format = vesadrm_get_format_si(dev, si);
-	if (IS_ERR(format))
-		return ERR_CAST(format);
-	width = vesadrm_get_width_si(dev, si);
+	if (!format)
+		return ERR_PTR(-EINVAL);
+	width = drm_sysfb_get_width_si(dev, si);
 	if (width < 0)
 		return ERR_PTR(width);
-	height = vesadrm_get_height_si(dev, si);
+	height = drm_sysfb_get_height_si(dev, si);
 	if (height < 0)
 		return ERR_PTR(height);
-	res = vesadrm_get_memory_si(dev, si, &resbuf);
+	res = drm_sysfb_get_memory_si(dev, si, &resbuf);
 	if (!res)
 		return ERR_PTR(-EINVAL);
-	stride = vesadrm_get_stride_si(dev, si, format, width, height, resource_size(res));
+	stride = drm_sysfb_get_stride_si(dev, si, format, width, height, resource_size(res));
 	if (stride < 0)
 		return ERR_PTR(stride);
-	vsize = vesadrm_get_visible_size_si(dev, si, height, stride, resource_size(res));
+	vsize = drm_sysfb_get_visible_size_si(dev, si, height, stride, resource_size(res));
 	if (!vsize)
 		return ERR_PTR(-EINVAL);
 
-- 
2.49.0

