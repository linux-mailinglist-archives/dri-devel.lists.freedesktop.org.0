Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47051AD8653
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 11:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B84510E91F;
	Fri, 13 Jun 2025 09:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="B7SOGyWT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G5UsLMt3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B7SOGyWT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G5UsLMt3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDB610E915
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 09:04:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9882A1F863;
 Fri, 13 Jun 2025 09:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749805477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vrE958rjluy5GI9nSZtajZKau2LVUydgX9T0Pgwru0=;
 b=B7SOGyWTBIJl0U7KAZgyscWeBjgjCMs2Jhf4Aw7cP02t3rVbQFZ5Nx4gtmaw3vKKM3l6pW
 SBiBTnrRIei4pfaHnf5Vu5Gqf1WcyJS3GjiUVnZyhbYSzH85I72hoz7tMFmCNEpPG96br3
 /WvM33n4CDTSCFb89/cFcVR5i0CWDiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749805477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vrE958rjluy5GI9nSZtajZKau2LVUydgX9T0Pgwru0=;
 b=G5UsLMt3A0xlxF+srO3jbYALvYG7FkC1mJSP6zh42VpZ6Az6mzAy/lkhzjhcnNMVHf9H4F
 3ZoR+WZF471tO8DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749805477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vrE958rjluy5GI9nSZtajZKau2LVUydgX9T0Pgwru0=;
 b=B7SOGyWTBIJl0U7KAZgyscWeBjgjCMs2Jhf4Aw7cP02t3rVbQFZ5Nx4gtmaw3vKKM3l6pW
 SBiBTnrRIei4pfaHnf5Vu5Gqf1WcyJS3GjiUVnZyhbYSzH85I72hoz7tMFmCNEpPG96br3
 /WvM33n4CDTSCFb89/cFcVR5i0CWDiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749805477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vrE958rjluy5GI9nSZtajZKau2LVUydgX9T0Pgwru0=;
 b=G5UsLMt3A0xlxF+srO3jbYALvYG7FkC1mJSP6zh42VpZ6Az6mzAy/lkhzjhcnNMVHf9H4F
 3ZoR+WZF471tO8DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12DC4137FE;
 Fri, 13 Jun 2025 09:04:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sND+AqXpS2inNAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 09:04:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
 tomi.valkeinen@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 02/25] drm/dumb-buffers: Provide helper to set pitch and
 size
Date: Fri, 13 Jun 2025 11:00:21 +0200
Message-ID: <20250613090431.127087-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613090431.127087-1-tzimmermann@suse.de>
References: <20250613090431.127087-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -5.30
X-Spamd-Result: default: False [-5.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; SUSPICIOUS_RECIPS(1.50)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_TWELVE(0.00)[21];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,suse.de:mid,suse.de:email];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Add drm_modes_size_dumb(), a helper to calculate the dumb-buffer
scanline pitch and allocation size. Implementations of struct
drm_driver.dumb_create can call the new helper for their size
computations.

There is currently quite a bit of code duplication among DRM's
memory managers. Each calculates scanline pitch and buffer size
from the given arguments, but the implementations are inconsistent
in how they treat alignment and format support. Later patches will
unify this code on top of drm_mode_size_dumb() as much as possible.

drm_mode_size_dumb() uses existing 4CC format helpers to interpret
the given color mode. This makes the dumb-buffer interface behave
similar the kernel's video= parameter. Current per-driver implementations
again likely have subtle differences or bugs in how they support color
modes.

The dumb-buffer UAPI is only specified for known color modes. These
values describe linear, single-plane RGB color formats or legacy index
formats. Other values should not be specified. But some user space
still does. So for unknown color modes, there are a number of known
exceptions for which drm_mode_size_dumb() calculates the pitch from
the bpp value, as before. All other values work the same but print
an error.

v5:
- check for overflows with check_mul_overflow() (Tomi)
v4:
- use %u conversion specifier (Geert)
- list DRM_FORMAT_Dn in UAPI docs (Geert)
- avoid dmesg spamming with drm_warn_once() (Sima)
- add more information about bpp special case (Sima)
- clarify parameters for hardware alignment
- add a TODO item for DUMB_CREATE2
v3:
- document the UAPI semantics
- compute scanline pitch from for unknown color modes (Andy, Tomi)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/gpu/todo.rst         |  27 ++++++
 drivers/gpu/drm/drm_dumb_buffers.c | 130 +++++++++++++++++++++++++++++
 include/drm/drm_dumb_buffers.h     |  14 ++++
 include/uapi/drm/drm_mode.h        |  50 ++++++++++-
 4 files changed, 220 insertions(+), 1 deletion(-)
 create mode 100644 include/drm/drm_dumb_buffers.h

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index be8637da3fe9..f7312afa87b5 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -648,6 +648,33 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter
 
 Level: Advanced
 
+Implement a new DUMB_CREATE2 ioctl
+----------------------------------
+
+The current DUMB_CREATE ioctl is not well defined. Instead of a pixel and
+framebuffer format, it only accepts a color mode of vague semantics. Assuming
+a linear framebuffer, the color mode gives and idea of the supported pixel
+format. But userspace effectively has to guess the correct values. It really
+only works reliable with framebuffers in XRGB8888. Userspace has begun to
+workaround these limitations by computing arbitrary format's buffer sizes and
+calculating their sizes in terms of XRGB8888 pixels.
+
+One possible solution is a new ioctl DUMB_CREATE2. It should accept a DRM
+format and a format modifier to resolve the color mode's ambiguity. As
+framebuffers can be multi-planar, the new ioctl has to return the buffer size,
+pitch and GEM handle for each individual color plane.
+
+In the first step, the new ioctl can be limited to the current features of
+the existing DUMB_CREATE. Individual drivers can then be extended to support
+multi-planar formats. Rockchip might require this and would be a good candidate.
+
+In addition to the kernel implementation, there must be user-space support
+for the new ioctl. There's code in Mesa that might be able to use the new
+call.
+
+Contact: Thomas Zimmermann <tzimmermann@suse.de>
+
+Level: Advanced
 
 Better Testing
 ==============
diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index 9916aaf5b3f2..e9eed9a5b760 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -25,6 +25,8 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_mode.h>
 
@@ -57,6 +59,134 @@
  * a hardware-specific ioctl to allocate suitable buffer objects.
  */
 
+static int drm_mode_align_dumb(struct drm_mode_create_dumb *args,
+			       unsigned long hw_pitch_align,
+			       unsigned long hw_size_align)
+{
+	u32 pitch = args->pitch;
+	u32 size;
+
+	if (!pitch)
+		return -EINVAL;
+
+	if (hw_pitch_align)
+		pitch = roundup(pitch, hw_pitch_align);
+
+	if (!hw_size_align)
+		hw_size_align = PAGE_SIZE;
+	else if (!IS_ALIGNED(hw_size_align, PAGE_SIZE))
+		return -EINVAL; /* TODO: handle this if necessary */
+
+	if (check_mul_overflow(args->height, pitch, &size))
+		return -EINVAL;
+	size = ALIGN(size, hw_size_align);
+	if (!size)
+		return -EINVAL;
+
+	args->pitch = pitch;
+	args->size = size;
+
+	return 0;
+}
+
+/**
+ * drm_mode_size_dumb - Calculates the scanline and buffer sizes for dumb buffers
+ * @dev: DRM device
+ * @args: Parameters for the dumb buffer
+ * @hw_pitch_align: Hardware scanline alignment in bytes
+ * @hw_size_align: Hardware buffer-size alignment in bytes
+ *
+ * The helper drm_mode_size_dumb() calculates the size of the buffer
+ * allocation and the scanline size for a dumb buffer. Callers have to
+ * set the buffers width, height and color mode in the argument @arg.
+ * The helper validates the correctness of the input and tests for
+ * possible overflows. If successful, it returns the dumb buffer's
+ * required scanline pitch and size in &args.
+ *
+ * The parameter @hw_pitch_align allows the driver to specifies an
+ * alignment for the scanline pitch, if the hardware requires any. The
+ * calculated pitch will be a multiple of the alignment. The parameter
+ * @hw_size_align allows to specify an alignment for buffer sizes. The
+ * provided alignment should represent requirements of the graphics
+ * hardware. drm_mode_size_dumb() handles GEM-related constraints
+ * automatically across all drivers and hardware. For example, the
+ * returned buffer size is always a multiple of PAGE_SIZE, which is
+ * required by mmap().
+ *
+ * Returns:
+ * Zero on success, or a negative error code otherwise.
+ */
+int drm_mode_size_dumb(struct drm_device *dev,
+		       struct drm_mode_create_dumb *args,
+		       unsigned long hw_pitch_align,
+		       unsigned long hw_size_align)
+{
+	u64 pitch = 0;
+	u32 fourcc;
+
+	/*
+	 * The scanline pitch depends on the buffer width and the color
+	 * format. The latter is specified as a color-mode constant for
+	 * which we first have to find the corresponding color format.
+	 *
+	 * Different color formats can have the same color-mode constant.
+	 * For example XRGB8888 and BGRX8888 both have a color mode of 32.
+	 * It is possible to use different formats for dumb-buffer allocation
+	 * and rendering as long as all involved formats share the same
+	 * color-mode constant.
+	 */
+	fourcc = drm_driver_color_mode_format(dev, args->bpp);
+	if (fourcc != DRM_FORMAT_INVALID) {
+		const struct drm_format_info *info = drm_format_info(fourcc);
+
+		if (!info)
+			return -EINVAL;
+		pitch = drm_format_info_min_pitch(info, 0, args->width);
+	} else if (args->bpp) {
+		/*
+		 * Some userspace throws in arbitrary values for bpp and
+		 * relies on the kernel to figure it out. In this case we
+		 * fall back to the old method of using bpp directly. The
+		 * over-commitment of memory from the rounding is acceptable
+		 * for compatibility with legacy userspace. We have a number
+		 * of deprecated legacy values that are explicitly supported.
+		 */
+		switch (args->bpp) {
+		default:
+			drm_warn_once(dev,
+				      "Unknown color mode %u; guessing buffer size.\n",
+				      args->bpp);
+			fallthrough;
+		/*
+		 * These constants represent various YUV formats supported by
+		 * drm_gem_afbc_get_bpp().
+		 */
+		case 12: // DRM_FORMAT_YUV420_8BIT
+		case 15: // DRM_FORMAT_YUV420_10BIT
+		case 30: // DRM_FORMAT_VUY101010
+			fallthrough;
+		/*
+		 * Used by Mesa and Gstreamer to allocate NV formats and others
+		 * as RGB buffers. Technically, XRGB16161616F formats are RGB,
+		 * but the dumb buffers are not supposed to be used for anything
+		 * beyond 32 bits per pixels.
+		 */
+		case 10: // DRM_FORMAT_NV{15,20,30}, DRM_FORMAT_P010
+		case 64: // DRM_FORMAT_{XRGB,XBGR,ARGB,ABGR}16161616F
+			pitch = args->width * DIV_ROUND_UP(args->bpp, SZ_8);
+			break;
+		}
+	}
+
+	if (!pitch || pitch > U32_MAX)
+		return -EINVAL;
+
+	args->pitch = pitch;
+
+	return drm_mode_align_dumb(args, hw_pitch_align, hw_size_align);
+}
+EXPORT_SYMBOL(drm_mode_size_dumb);
+
 int drm_mode_create_dumb(struct drm_device *dev,
 			 struct drm_mode_create_dumb *args,
 			 struct drm_file *file_priv)
diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
new file mode 100644
index 000000000000..1f3a8236fb3d
--- /dev/null
+++ b/include/drm/drm_dumb_buffers.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __DRM_DUMB_BUFFERS_H__
+#define __DRM_DUMB_BUFFERS_H__
+
+struct drm_device;
+struct drm_mode_create_dumb;
+
+int drm_mode_size_dumb(struct drm_device *dev,
+		       struct drm_mode_create_dumb *args,
+		       unsigned long hw_pitch_align,
+		       unsigned long hw_size_align);
+
+#endif
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c082810c08a8..efe8f5ad35ee 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1058,7 +1058,7 @@ struct drm_mode_crtc_page_flip_target {
  * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
  * @height: buffer height in pixels
  * @width: buffer width in pixels
- * @bpp: bits per pixel
+ * @bpp: color mode
  * @flags: must be zero
  * @handle: buffer object handle
  * @pitch: number of bytes between two consecutive lines
@@ -1066,6 +1066,54 @@ struct drm_mode_crtc_page_flip_target {
  *
  * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
  * the kernel fills @handle, @pitch and @size.
+ *
+ * The value of @bpp is a color-mode number describing a specific format
+ * or a variant thereof. The value often corresponds to the number of bits
+ * per pixel for most modes, although there are exceptions. Each color mode
+ * maps to a DRM format plus a number of modes with similar pixel layout.
+ * Framebuffer layout is always linear.
+ *
+ * Support for all modes and formats is optional. Even if dumb-buffer
+ * creation with a certain color mode succeeds, it is not guaranteed that
+ * the DRM driver supports any of the related formats. Most drivers support
+ * a color mode of 32 with a format of DRM_FORMAT_XRGB8888 on their primary
+ * plane.
+ *
+ * +------------+------------------------+------------------------+
+ * | Color mode | Framebuffer format     | Compatible formats     |
+ * +============+========================+========================+
+ * |     32     |  * DRM_FORMAT_XRGB8888 |  * DRM_FORMAT_BGRX8888 |
+ * |            |                        |  * DRM_FORMAT_RGBX8888 |
+ * |            |                        |  * DRM_FORMAT_XBGR8888 |
+ * +------------+------------------------+------------------------+
+ * |     24     |  * DRM_FORMAT_RGB888   |  * DRM_FORMAT_BGR888   |
+ * +------------+------------------------+------------------------+
+ * |     16     |  * DRM_FORMAT_RGB565   |  * DRM_FORMAT_BGR565   |
+ * +------------+------------------------+------------------------+
+ * |     15     |  * DRM_FORMAT_XRGB1555 |  * DRM_FORMAT_BGRX1555 |
+ * |            |                        |  * DRM_FORMAT_RGBX1555 |
+ * |            |                        |  * DRM_FORMAT_XBGR1555 |
+ * +------------+------------------------+------------------------+
+ * |      8     |  * DRM_FORMAT_C8       |  * DRM_FORMAT_D8       |
+ * |            |                        |  * DRM_FORMAT_R8       |
+ * +------------+------------------------+------------------------+
+ * |      4     |  * DRM_FORMAT_C4       |  * DRM_FORMAT_D4       |
+ * |            |                        |  * DRM_FORMAT_R4       |
+ * +------------+------------------------+------------------------+
+ * |      2     |  * DRM_FORMAT_C2       |  * DRM_FORMAT_D2       |
+ * |            |                        |  * DRM_FORMAT_R2       |
+ * +------------+------------------------+------------------------+
+ * |      1     |  * DRM_FORMAT_C1       |  * DRM_FORMAT_D1       |
+ * |            |                        |  * DRM_FORMAT_R1       |
+ * +------------+------------------------+------------------------+
+ *
+ * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
+ * legacy user space. Please don't use them in new code. Other modes
+ * are not support.
+ *
+ * Do not attempt to allocate anything but linear framebuffer memory
+ * with single-plane RGB data. Allocation of other framebuffer
+ * layouts requires dedicated ioctls in the respective DRM driver.
  */
 struct drm_mode_create_dumb {
 	__u32 height;
-- 
2.49.0

