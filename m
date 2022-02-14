Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A70A74B51C9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 14:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A5F10E5A2;
	Mon, 14 Feb 2022 13:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A28210E59A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 13:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644845860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=antMq+QI2lYY33VgrrVvP1GCy1SqAtBXkL1zJR3K1Rc=;
 b=Je5fmo5j3qKSbyQMt0PhU+rxXbvRGihzn7X26D8xanV7LOTBwvpTitsP2rX0UNq2NS8nT2
 UKfeOfJYCYt1iw8kutPsZVmof47IHsQtINnwSOuIcfYmHeU0ncBktC2Vo53gTCTdyIMOk0
 YMiAxRhezifgBbI3WZBfNB73PsmFNSU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-6hka7hcqNtyX7rR1uEA8dw-1; Mon, 14 Feb 2022 08:37:37 -0500
X-MC-Unique: 6hka7hcqNtyX7rR1uEA8dw-1
Received: by mail-wm1-f71.google.com with SMTP id
 125-20020a1c0283000000b0037bf720e6a8so7143120wmc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 05:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=antMq+QI2lYY33VgrrVvP1GCy1SqAtBXkL1zJR3K1Rc=;
 b=QluIJTvUc8EqNT4/ZbNZg1xTjTv4ks3T2aEaSErMwpPi7O+R/iQL+Yl6YtgR1XULm/
 iwNpIGe/fkyyWBg7D+GbTu+IxMK/r9D/2K5EfhMQRFcvTNmKShJYdoalB/5L3+f16/zq
 majojuFyRxP57HtgEUNdJ3LSFuH63O9lme6157jbFRgRS3apRuUaeqdcaFFRVfowoWDf
 m9CUegdkZOSZRmZyvgTxzjfyZ+GXK35TS6daXSvDTH1XdNfysNghwGqX7m9NEdv3ypM0
 2BI9NfqO7/gyrjmEZWjAbPrHIAH/oyY1AOGX5ZbiWhSo/0ofvFWq1AuqO+cqm7dULoWA
 xk+A==
X-Gm-Message-State: AOAM530OGXX5eVE+l7jVgA0MEoCbxYTiLpPe+yLG8kEwRIjh/0NTusN3
 yYuoN3zLdVQMYng8fJfUmZeRFdc/cuOLhGcy+llQd9eixjt/YQtKrzPC5P9QDAfBP0wBWGEUJC8
 x41jVh9pciLeF9XmcD4KvTFBXri1P
X-Received: by 2002:a05:600c:1990:: with SMTP id
 t16mr3040407wmq.66.1644845855650; 
 Mon, 14 Feb 2022 05:37:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwquD1QmlltNMuQ3Y9bdmIMSpLDEUSrCUnMUaYlENoLOViQWZy53+PifJ2LVGmTJ3Aay+RwzA==
X-Received: by 2002:a05:600c:1990:: with SMTP id
 t16mr3040384wmq.66.1644845855416; 
 Mon, 14 Feb 2022 05:37:35 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id y6sm3568918wrd.30.2022.02.14.05.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 05:37:35 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_mono_reversed()
Date: Mon, 14 Feb 2022 14:37:06 +0100
Message-Id: <20220214133710.3278506-3-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214133710.3278506-1-javierm@redhat.com>
References: <20220214133710.3278506-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support to convert from XR24 to reversed monochrome for drivers that
control monochromatic display panels, that only have 1 bit per pixel.

The function does a line-by-line conversion doing an intermediate step
first from XR24 to 8-bit grayscale and then to reversed monochrome.

The drm_fb_gray8_to_mono_reversed_line() helper was based on code from
drivers/gpu/drm/tiny/repaper.c driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Changes in v6:
- Add Andy Shevchenko's Reviewed-by to patch #2.

Changes in v5:
- Use drm_WARN_ON* macros instead of deprecated ones (Thomas Zimmermann)

Changes in v4:
- Rename end_offset to end_len (Thomas Zimmermann)
- Warn once if dst_pitch is not a multiple of 8 (Thomas Zimmermann)
- Drop drm_fb_gray8_to_mono_reversed() that's not used (Thomas Zimmermann)
- Allocate single buffer for both copy cma memory and gray8 (Thomas Zimmermann)
- Add Thomas Zimmermann Reviewed-by tag to patch adding XR24 -> mono helper.

Changes in v3:
- Also add a drm_fb_xrgb8888_to_mono_reversed() helper (Thomas Zimmermann)
- Split lines copy to drm_fb_gray8_to_mono_reversed_line() (Thomas Zimmermann)
- Handle case where the source buffer is not aligned to 8 (Thomas Zimmermann)

 drivers/gpu/drm/drm_format_helper.c | 110 ++++++++++++++++++++++++++++
 include/drm/drm_format_helper.h     |   4 +
 2 files changed, 114 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index b981712623d3..bc0f49773868 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -12,9 +12,11 @@
 #include <linux/slab.h>
 #include <linux/io.h>
 
+#include <drm/drm_device.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 #include <drm/drm_rect.h>
 
 static unsigned int clip_offset(const struct drm_rect *clip, unsigned int pitch, unsigned int cpp)
@@ -591,3 +593,111 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
 	return -EINVAL;
 }
 EXPORT_SYMBOL(drm_fb_blit_toio);
+
+static void drm_fb_gray8_to_mono_reversed_line(u8 *dst, const u8 *src, unsigned int pixels,
+					       unsigned int start_offset, unsigned int end_len)
+{
+	unsigned int xb, i;
+
+	for (xb = 0; xb < pixels; xb++) {
+		unsigned int start = 0, end = 8;
+		u8 byte = 0x00;
+
+		if (xb == 0 && start_offset)
+			start = start_offset;
+
+		if (xb == pixels - 1 && end_len)
+			end = end_len;
+
+		for (i = start; i < end; i++) {
+			unsigned int x = xb * 8 + i;
+
+			byte >>= 1;
+			if (src[x] >> 7)
+				byte |= BIT(7);
+		}
+		*dst++ = byte;
+	}
+}
+
+/**
+ * drm_fb_xrgb8888_to_mono_reversed - Convert XRGB8888 to reversed monochrome
+ * @dst: reversed monochrome destination buffer
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
+ * @src: XRGB8888 source buffer
+ * @fb: DRM framebuffer
+ * @clip: Clip rectangle area to copy
+ *
+ * DRM doesn't have native monochrome support.
+ * Such drivers can announce the commonly supported XR24 format to userspace
+ * and use this function to convert to the native format.
+ *
+ * This function uses drm_fb_xrgb8888_to_gray8() to convert to grayscale and
+ * then the result is converted from grayscale to reversed monohrome.
+ */
+void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *vaddr,
+				      const struct drm_framebuffer *fb, const struct drm_rect *clip)
+{
+	unsigned int linepixels = drm_rect_width(clip);
+	unsigned int lines = clip->y2 - clip->y1;
+	unsigned int cpp = fb->format->cpp[0];
+	unsigned int len_src32 = linepixels * cpp;
+	struct drm_device *dev = fb->dev;
+	unsigned int start_offset, end_len;
+	unsigned int y;
+	u8 *mono = dst, *gray8;
+	u32 *src32;
+
+	if (drm_WARN_ON(dev, fb->format->format != DRM_FORMAT_XRGB8888))
+		return;
+
+	/*
+	 * The reversed mono destination buffer contains 1 bit per pixel
+	 * and destination scanlines have to be in multiple of 8 pixels.
+	 */
+	if (!dst_pitch)
+		dst_pitch = DIV_ROUND_UP(linepixels, 8);
+
+	drm_WARN_ONCE(dev, dst_pitch % 8 != 0, "dst_pitch is not a multiple of 8\n");
+
+	/*
+	 * The cma memory is write-combined so reads are uncached.
+	 * Speed up by fetching one line at a time.
+	 *
+	 * Also, format conversion from XR24 to reversed monochrome
+	 * are done line-by-line but are converted to 8-bit grayscale
+	 * as an intermediate step.
+	 *
+	 * Allocate a buffer to be used for both copying from the cma
+	 * memory and to store the intermediate grayscale line pixels.
+	 */
+	src32 = kmalloc(len_src32 + linepixels, GFP_KERNEL);
+	if (!src32)
+		return;
+
+	gray8 = (u8 *)src32 + len_src32;
+
+	/*
+	 * For damage handling, it is possible that only parts of the source
+	 * buffer is copied and this could lead to start and end pixels that
+	 * are not aligned to multiple of 8.
+	 *
+	 * Calculate if the start and end pixels are not aligned and set the
+	 * offsets for the reversed mono line conversion function to adjust.
+	 */
+	start_offset = clip->x1 % 8;
+	end_len = clip->x2 % 8;
+
+	vaddr += clip_offset(clip, fb->pitches[0], cpp);
+	for (y = 0; y < lines; y++) {
+		src32 = memcpy(src32, vaddr, len_src32);
+		drm_fb_xrgb8888_to_gray8_line(gray8, src32, linepixels);
+		drm_fb_gray8_to_mono_reversed_line(mono, gray8, dst_pitch,
+						   start_offset, end_len);
+		vaddr += fb->pitches[0];
+		mono += dst_pitch;
+	}
+
+	kfree(src32);
+}
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono_reversed);
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index b30ed5de0a33..0b0937c0b2f6 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -43,4 +43,8 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
 		     const void *vmap, const struct drm_framebuffer *fb,
 		     const struct drm_rect *rect);
 
+void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *src,
+				      const struct drm_framebuffer *fb,
+				      const struct drm_rect *clip);
+
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */
-- 
2.34.1

