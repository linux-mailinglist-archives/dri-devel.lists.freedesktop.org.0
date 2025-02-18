Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75089A39ECE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 15:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AD110E6DC;
	Tue, 18 Feb 2025 14:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GQC13qEO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qzCgCjW7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GQC13qEO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qzCgCjW7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200CA10E6D2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 14:25:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3B16A1F399;
 Tue, 18 Feb 2025 14:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739888748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGIMQMFvGDqhekDOJbKD/3/M+uHo2tviFLdA9FEHq0E=;
 b=GQC13qEOCSPJYFYxeIOYGGZH5xIu/0+p/0Hp66H02OQw7PB2JKw8PYFXtxkyuO5ubYuudM
 +aDjIzz2MUSYAOqF/qqQAhhUcHvnrOFaNNvxBma93tAzC6553zHxTJe8rvIMUcxHQL1UD2
 yb0Aj+TSZhFUfhVFKtAEHKjuHknDCZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739888748;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGIMQMFvGDqhekDOJbKD/3/M+uHo2tviFLdA9FEHq0E=;
 b=qzCgCjW7Ssd83WRulXPpivDHiDk5DJLJ0B1J7rC4QorY+Hqn1+5Ok+Yrh/qWpyX+NCUt4E
 HFGRqoKly4JyW1CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739888748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGIMQMFvGDqhekDOJbKD/3/M+uHo2tviFLdA9FEHq0E=;
 b=GQC13qEOCSPJYFYxeIOYGGZH5xIu/0+p/0Hp66H02OQw7PB2JKw8PYFXtxkyuO5ubYuudM
 +aDjIzz2MUSYAOqF/qqQAhhUcHvnrOFaNNvxBma93tAzC6553zHxTJe8rvIMUcxHQL1UD2
 yb0Aj+TSZhFUfhVFKtAEHKjuHknDCZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739888748;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGIMQMFvGDqhekDOJbKD/3/M+uHo2tviFLdA9FEHq0E=;
 b=qzCgCjW7Ssd83WRulXPpivDHiDk5DJLJ0B1J7rC4QorY+Hqn1+5Ok+Yrh/qWpyX+NCUt4E
 HFGRqoKly4JyW1CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8F9B132C7;
 Tue, 18 Feb 2025 14:25:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EAriK2uYtGdXYQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 18 Feb 2025 14:25:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch and
 size
Date: Tue, 18 Feb 2025 15:23:25 +0100
Message-ID: <20250218142542.438557-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218142542.438557-1-tzimmermann@suse.de>
References: <20250218142542.438557-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[19]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
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

v3:
- document the UAPI semantics
- compute scanline pitch from for unknown color modes (Andy, Tomi)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_dumb_buffers.c | 116 +++++++++++++++++++++++++++++
 include/drm/drm_dumb_buffers.h     |  14 ++++
 include/uapi/drm/drm_mode.h        |  46 +++++++++++-
 3 files changed, 175 insertions(+), 1 deletion(-)
 create mode 100644 include/drm/drm_dumb_buffers.h

diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index 9916aaf5b3f2..600ab281712b 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -25,6 +25,8 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_mode.h>
 
@@ -57,6 +59,120 @@
  * a hardware-specific ioctl to allocate suitable buffer objects.
  */
 
+static int drm_mode_align_dumb(struct drm_mode_create_dumb *args,
+			       unsigned long pitch_align,
+			       unsigned long size_align)
+{
+	u32 pitch = args->pitch;
+	u32 size;
+
+	if (!pitch)
+		return -EINVAL;
+
+	if (pitch_align)
+		pitch = roundup(pitch, pitch_align);
+
+	/* overflow checks for 32bit size calculations */
+	if (args->height > U32_MAX / pitch)
+		return -EINVAL;
+
+	if (!size_align)
+		size_align = PAGE_SIZE;
+	else if (!IS_ALIGNED(size_align, PAGE_SIZE))
+		return -EINVAL;
+
+	size = ALIGN(args->height * pitch, size_align);
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
+ * @pitch_align: Scanline alignment in bytes
+ * @size_align: Buffer-size alignment in bytes
+ *
+ * The helper drm_mode_size_dumb() calculates the size of the buffer
+ * allocation and the scanline size for a dumb buffer. Callers have to
+ * set the buffers width, height and color mode in the argument @arg.
+ * The helper validates the correctness of the input and tests for
+ * possible overflows. If successful, it returns the dumb buffer's
+ * required scanline pitch and size in &args.
+ *
+ * The parameter @pitch_align allows the driver to specifies an
+ * alignment for the scanline pitch, if the hardware requires any. The
+ * calculated pitch will be a multiple of the alignment. The parameter
+ * @size_align allows to specify an alignment for buffer sizes. The
+ * returned size is always a multiple of PAGE_SIZE.
+ *
+ * Returns:
+ * Zero on success, or a negative error code otherwise.
+ */
+int drm_mode_size_dumb(struct drm_device *dev,
+		       struct drm_mode_create_dumb *args,
+		       unsigned long pitch_align,
+		       unsigned long size_align)
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
+			drm_warn(dev, "Unknown color mode %d; guessing buffer size.\n",
+				 args->bpp);
+			fallthrough;
+		case 12:
+		case 15:
+		case 30: /* see drm_gem_afbc_get_bpp() */
+		case 10:
+		case 64: /* used by Mesa */
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
+	return drm_mode_align_dumb(args, pitch_align, size_align);
+}
+EXPORT_SYMBOL(drm_mode_size_dumb);
+
 int drm_mode_create_dumb(struct drm_device *dev,
 			 struct drm_mode_create_dumb *args,
 			 struct drm_file *file_priv)
diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
new file mode 100644
index 000000000000..6fe36004b19d
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
+		       unsigned long pitch_align,
+		       unsigned long size_align);
+
+#endif
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c082810c08a8..eea09103b1a6 100644
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
@@ -1066,6 +1066,50 @@ struct drm_mode_crtc_page_flip_target {
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
+ * | Color mode | Framebuffer format     | Compatibles            |
+ * +============+========================+========================+
+ * |     32     |  * DRM_FORMAT_XRGB8888 |  * DRM_FORMAT_XBGR8888 |
+ * |            |                        |  * DRM_FORMAT_RGBX8888 |
+ * |            |                        |  * DRM_FORMAT_BGRX8888 |
+ * +------------+------------------------+------------------------+
+ * |     24     |  * DRM_FORMAT_RGB888   |  * DRM_FORMAT_BGR888   |
+ * +------------+------------------------+------------------------+
+ * |     16     |  * DRM_FORMAT_RGB565   |  * DRM_FORMAT_BGR565   |
+ * +------------+------------------------+------------------------+
+ * |     15     |  * DRM_FORMAT_XRGB1555 |  * DRM_FORMAT_XBGR1555 |
+ * |            |                        |  * DRM_FORMAT_RGBX1555 |
+ * |            |                        |  * DRM_FORMAT_BGRX1555 |
+ * +------------+------------------------+------------------------+
+ * |      8     |  * DRM_FORMAT_C8       |  * DRM_FORMAT_R8       |
+ * +------------+------------------------+------------------------+
+ * |      4     |  * DRM_FORMAT_C4       |  * DRM_FORMAT_R4       |
+ * +------------+------------------------+------------------------+
+ * |      2     |  * DRM_FORMAT_C2       |  * DRM_FORMAT_R2       |
+ * +------------+------------------------+------------------------+
+ * |      1     |  * DRM_FORMAT_C1       |  * DRM_FORMAT_R1       |
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
2.48.1

