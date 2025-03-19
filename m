Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E371A686EE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 09:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4EF10E339;
	Wed, 19 Mar 2025 08:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3394A10E2F5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 08:34:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8B045219D8;
 Wed, 19 Mar 2025 08:33:59 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5585E13A2C;
 Wed, 19 Mar 2025 08:33:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oBqbE3eB2mc+OQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Mar 2025 08:33:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 18/18] drm/sysfb: vesadrm: Add gamma correction
Date: Wed, 19 Mar 2025 08:45:17 +0100
Message-ID: <20250319083021.6472-19-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319083021.6472-1-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 8B045219D8
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Add palette support and export GAMMA properties via sysfs. User-space
compositors can use this interface for programming gamma ramps or night
mode.

Vesadrm supports palette updates via VGA DAC registers or VESA palette
calls. Up to 256 palette entries are available. Userspace always supplies
gamma ramps of 256 entries. If the native color format does not match
this because pixel component have less then 8 bits, vesadrm interpolates
among the palette entries.

The code uses CamelCase style in a few places to match the VESA manuals.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sysfb/vesadrm.c | 204 ++++++++++++++++++++++++++++++++
 include/linux/screen_info.h     |   7 ++
 2 files changed, 211 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index 07f59880ce0f..20cf867ad500 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -25,6 +25,7 @@
 
 #include <video/edid.h>
 #include <video/pixel_format.h>
+#include <video/vga.h>
 
 #include "drm_sysfb_helper.h"
 
@@ -33,6 +34,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+#define VESADRM_GAMMA_LUT_SIZE 256
+
 static int vesadrm_get_validated_int(struct drm_device *dev, const char *name,
 				     u64 value, u32 max)
 {
@@ -162,6 +165,14 @@ static const struct drm_format_info *vesadrm_get_format_si(struct drm_device *de
 struct vesadrm_device {
 	struct drm_sysfb_device sysfb;
 
+	/* VESA Protected Mode interface */
+	struct {
+		const u8 *PrimaryPalette;
+	} pmi;
+
+	void (*cmap_write)(struct vesadrm_device *vesa, unsigned int index,
+			   u16 red, u16 green, u16 blue);
+
 	/* modesetting */
 	u32 formats[DRM_SYSFB_PLANE_NFORMATS(1)];
 	struct drm_plane primary_plane;
@@ -170,6 +181,151 @@ struct vesadrm_device {
 	struct drm_connector connector;
 };
 
+static struct vesadrm_device *to_vesadrm_device(struct drm_device *dev)
+{
+	return container_of(to_drm_sysfb_device(dev), struct vesadrm_device, sysfb);
+}
+
+/*
+ * Palette
+ */
+
+static void vesadrm_vga_cmap_write(struct vesadrm_device *vesa, unsigned int index,
+				   u16 red, u16 green, u16 blue)
+{
+	u8 i8, r8, g8, b8;
+
+	if (index > 255)
+		return;
+
+	i8 = index;
+	r8 = red >> 8;
+	g8 = green >> 8;
+	b8 = blue >> 8;
+
+	outb_p(i8, VGA_PEL_IW);
+	outb_p(r8, VGA_PEL_D);
+	outb_p(g8, VGA_PEL_D);
+	outb_p(b8, VGA_PEL_D);
+}
+
+#ifdef __i386__
+static void vesadrm_pmi_cmap_write(struct vesadrm_device *vesa, unsigned int index,
+				   u16 red, u16 green, u16 blue)
+{
+	u32 i32 = index;
+	struct {
+		u8 b8;
+		u8 g8;
+		u8 r8;
+		u8 x8;
+	} PaletteEntry = {
+		blue >> 8,
+		green >> 8,
+		red >> 8,
+		0x00,
+	};
+
+	if (index > 255)
+		return;
+
+	__asm__ __volatile__(
+		"call *(%%esi)"
+		: /* no return value */
+		: "a" (0x4f09),
+		  "b" (0),
+		  "c" (1),
+		  "d" (i32),
+		  "D" (&PaletteEntry),
+		  "S" (&vesa->pmi.PrimaryPalette));
+}
+#endif
+
+static void vesadrm_set_gamma_linear(struct vesadrm_device *vesa,
+				     const struct drm_format_info *format)
+{
+	struct drm_device *dev = &vesa->sysfb.dev;
+	size_t i;
+	u16 r16, g16, b16;
+
+	switch (format->format) {
+	case DRM_FORMAT_XRGB1555:
+		for (i = 0; i < 32; ++i) {
+			r16 = i * 8 + i / 4;
+			r16 |= (r16 << 8) | r16;
+			vesa->cmap_write(vesa, i, r16, r16, r16);
+		}
+		break;
+	case DRM_FORMAT_RGB565:
+		for (i = 0; i < 32; ++i) {
+			r16 = i * 8 + i / 4;
+			r16 |= (r16 << 8) | r16;
+			g16 = i * 4 + i / 16;
+			g16 |= (g16 << 8) | g16;
+			b16 = r16;
+			vesa->cmap_write(vesa, i, r16, g16, b16);
+		}
+		for (i = 32; i < 64; ++i) {
+			g16 = i * 4 + i / 16;
+			g16 |= (g16 << 8) | g16;
+			vesa->cmap_write(vesa, i, 0, g16, 0);
+		}
+		break;
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_BGRX8888:
+		for (i = 0; i < 256; ++i) {
+			r16 = (i << 8) | i;
+			vesa->cmap_write(vesa, i, r16, r16, r16);
+		}
+		break;
+	default:
+		drm_warn_once(dev, "Unsupported format %p4cc for gamma correction\n",
+			      &format->format);
+		break;
+	}
+}
+
+static void vesadrm_set_gamma_lut(struct vesadrm_device *vesa,
+				  const struct drm_format_info *format,
+				  struct drm_color_lut *lut)
+{
+	struct drm_device *dev = &vesa->sysfb.dev;
+	size_t i;
+	u16 r16, g16, b16;
+
+	switch (format->format) {
+	case DRM_FORMAT_XRGB1555:
+		for (i = 0; i < 32; ++i) {
+			r16 = lut[i * 8 + i / 4].red;
+			g16 = lut[i * 8 + i / 4].green;
+			b16 = lut[i * 8 + i / 4].blue;
+			vesa->cmap_write(vesa, i, r16, g16, b16);
+		}
+		break;
+	case DRM_FORMAT_RGB565:
+		for (i = 0; i < 32; ++i) {
+			r16 = lut[i * 8 + i / 4].red;
+			g16 = lut[i * 4 + i / 16].green;
+			b16 = lut[i * 8 + i / 4].blue;
+			vesa->cmap_write(vesa, i, r16, g16, b16);
+		}
+		for (i = 32; i < 64; ++i)
+			vesa->cmap_write(vesa, i, 0, lut[i * 4 + i / 16].green, 0);
+		break;
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_BGRX8888:
+		for (i = 0; i < 256; ++i)
+			vesa->cmap_write(vesa, i, lut[i].red, lut[i].green, lut[i].blue);
+		break;
+	default:
+		drm_warn_once(dev, "Unsupported format %p4cc for gamma correction\n",
+			      &format->format);
+		break;
+	}
+}
+
 /*
  * Modesetting
  */
@@ -187,8 +343,36 @@ static const struct drm_plane_funcs vesadrm_primary_plane_funcs = {
 	.destroy = drm_plane_cleanup,
 };
 
+static void vesadrm_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+					     struct drm_atomic_state *state)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
+	struct vesadrm_device *vesa = to_vesadrm_device(dev);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_sysfb_crtc_state *sysfb_crtc_state = to_drm_sysfb_crtc_state(crtc_state);
+
+	/*
+	 * The gamma LUT has to be reloaded after changing the primary
+	 * plane's color format.
+	 */
+	if (crtc_state->enable && crtc_state->color_mgmt_changed) {
+		if (sysfb_crtc_state->format == sysfb->fb_format) {
+			if (crtc_state->gamma_lut)
+				vesadrm_set_gamma_lut(vesa,
+						      sysfb_crtc_state->format,
+						      crtc_state->gamma_lut->data);
+			else
+				vesadrm_set_gamma_linear(vesa, sysfb_crtc_state->format);
+		} else {
+			vesadrm_set_gamma_linear(vesa, sysfb_crtc_state->format);
+		}
+	}
+}
+
 static const struct drm_crtc_helper_funcs vesadrm_crtc_helper_funcs = {
 	DRM_SYSFB_CRTC_HELPER_FUNCS,
+	.atomic_flush = vesadrm_crtc_helper_atomic_flush,
 };
 
 static const struct drm_crtc_funcs vesadrm_crtc_funcs = {
@@ -282,6 +466,18 @@ static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
 	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d bytes\n",
 		&format->format, width, height, stride);
 
+	if (!__screen_info_vbe_mode_nonvga(si)) {
+		vesa->cmap_write = vesadrm_vga_cmap_write;
+#ifdef __i386__
+	} else {
+		phys_addr_t pmi_base = __screen_info_vesapm_info_base(si);
+		const u16 *pmi_addr = phys_to_virt(pmi_base);
+
+		vesa->pmi.PrimaryPalette = (u8 *)pmi_addr + pmi_addr[2];
+		vesa->cmap_write = vesadrm_pmi_cmap_write;
+#endif
+	}
+
 #ifdef CONFIG_X86
 	if (drm_edid_header_is_valid(edid_info.dummy) == 8)
 		sysfb->edid = edid_info.dummy;
@@ -289,6 +485,8 @@ static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
 	sysfb->fb_mode = drm_sysfb_mode(width, height, 0, 0);
 	sysfb->fb_format = format;
 	sysfb->fb_pitch = stride;
+	if (vesa->cmap_write)
+		sysfb->fb_gamma_lut_size = VESADRM_GAMMA_LUT_SIZE;
 
 	/*
 	 * Memory management
@@ -360,6 +558,12 @@ static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
 		return ERR_PTR(ret);
 	drm_crtc_helper_add(crtc, &vesadrm_crtc_helper_funcs);
 
+	if (sysfb->fb_gamma_lut_size) {
+		ret = drm_mode_crtc_set_gamma_size(crtc, sysfb->fb_gamma_lut_size);
+		if (!ret)
+			drm_crtc_enable_color_mgmt(crtc, 0, false, sysfb->fb_gamma_lut_size);
+	}
+
 	/* Encoder */
 
 	encoder = &vesa->encoder;
diff --git a/include/linux/screen_info.h b/include/linux/screen_info.h
index ab3cffbb58b7..923d68e07679 100644
--- a/include/linux/screen_info.h
+++ b/include/linux/screen_info.h
@@ -126,6 +126,13 @@ static inline unsigned int screen_info_video_type(const struct screen_info *si)
 	return VIDEO_TYPE_CGA;
 }
 
+static inline u32 __screen_info_vesapm_info_base(const struct screen_info *si)
+{
+	if (si->vesapm_seg < 0xc000)
+		return 0;
+	return (si->vesapm_seg << 4) + si->vesapm_off;
+}
+
 ssize_t screen_info_resources(const struct screen_info *si, struct resource *r, size_t num);
 
 u32 __screen_info_lfb_bits_per_pixel(const struct screen_info *si);
-- 
2.48.1

