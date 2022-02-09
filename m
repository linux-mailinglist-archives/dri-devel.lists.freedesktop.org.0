Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71444AED80
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 10:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F11D10E5AC;
	Wed,  9 Feb 2022 09:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BC310E38B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 09:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644397412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zdxWJO9LAQS3hXjCTfCOj6rfJd8h7iT29/43rVI8FJc=;
 b=YWSzz1zD/BMykUX16uVI4h7aaQAfq68kAqsY3YfJvf6zbFhqv35Ew9cBSoZeFIFArJcZqs
 v/m1Lc6I99g789KHegmwNT6J80i6wvD37/lexQgeR1TesV6YKS0w5UXmYht6VC/SPtnud6
 RAc6M3o/ZWx93nGOzwxLxEA2UV2ITM0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-IBpmwYZqPkGQ6iDyR-B9Pg-1; Wed, 09 Feb 2022 04:03:29 -0500
X-MC-Unique: IBpmwYZqPkGQ6iDyR-B9Pg-1
Received: by mail-wr1-f72.google.com with SMTP id
 q8-20020adfb188000000b001e33a8cdbf4so826183wra.16
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 01:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zdxWJO9LAQS3hXjCTfCOj6rfJd8h7iT29/43rVI8FJc=;
 b=3dAfU89PbygNkJ+e6LXXPPDeuk0uqdT0ELWU1574hD67wD7/w//cAd0CJZ8xg41QtU
 5GqpEhp7TiYwaqmGoiRIntiqOH+svNOLUrctTKmNMYydzeTHRgbyVX9xbn8k/wIH66OE
 CK3BBwYJub9h0U69vQB6l7KmCZB0hzWCi4LaAwmLjQB4tkcyM4LQOjBQlAIG/NrhEwD7
 HdIn8vJ1vgskHHmEG7WXEFjptSffIMRvEVAWwakSGOXfBFiYlITvICB4f0sceLTeI8Uf
 8CEY/ezWDUbA6GjFXQY3p1sFzsYG1FMlsMTxD64Yde2cksXYxEIpEe8TvU5I0LNsoHfa
 IxIg==
X-Gm-Message-State: AOAM5325BH8XGo3aK+4Vw5KlHzFIKwsUe64auxWbHaD6S+EfxN/dBZ6C
 snUAiwbihsoP5ab0o8zT7iqNne9gw/tUuP4G9PHIYZVntVAjBPnxEW3zxgZCunB1a1G0TYkkwrM
 CZCEKRI7hF24VaALjIYkUCSlabqPZ
X-Received: by 2002:adf:d213:: with SMTP id j19mr1278396wrh.202.1644397407751; 
 Wed, 09 Feb 2022 01:03:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4LX0O5Ay6A6QNCHdwHnoLg8BJ5NtECzXAPXBhnUZbYo9/mfvXWUJmoCBk7U2Ko8fALs42UA==
X-Received: by 2002:adf:d213:: with SMTP id j19mr1278375wrh.202.1644397407504; 
 Wed, 09 Feb 2022 01:03:27 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id z1sm4058866wmk.32.2022.02.09.01.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 01:03:27 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] drm/format-helper: Add drm_fb_{xrgb8888,
 gray8}_to_mono_reversed()
Date: Wed,  9 Feb 2022 10:03:09 +0100
Message-Id: <20220209090314.2511959-3-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209090314.2511959-1-javierm@redhat.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
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

Add support to convert XR24 and 8-bit grayscale to reversed monochrome for
drivers that control monochromatic panels, that only have 1 bit per pixel.

The drm_fb_gray8_to_mono_reversed() helper was based on the function that
does the same in the drivers/gpu/drm/tiny/repaper.c driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v3:
- Also add a drm_fb_xrgb8888_to_mono_reversed() helper (Thomas Zimmermann)
- Split lines copy to drm_fb_gray8_to_mono_reversed_line() (Thomas Zimmermann)
- Handle case where the source buffer is not aligned to 8 (Thomas Zimmermann)

 drivers/gpu/drm/drm_format_helper.c | 157 ++++++++++++++++++++++++++++
 include/drm/drm_format_helper.h     |   8 ++
 2 files changed, 165 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index b981712623d3..19710342c0de 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -591,3 +591,160 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
 	return -EINVAL;
 }
 EXPORT_SYMBOL(drm_fb_blit_toio);
+
+static void drm_fb_gray8_to_mono_reversed_line(u8 *dst, const u8 *src, unsigned int pixels,
+					       unsigned int start_offset, unsigned int end_offset)
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
+		if (xb == pixels - 1 && end_offset)
+			end = end_offset;
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
+ * drm_fb_gray8_to_mono_reversed - Convert grayscale to reversed monochrome
+ * @dst: reversed monochrome destination buffer
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
+ * @src: 8-bit grayscale source buffer
+ * @fb: DRM framebuffer
+ * @clip: Clip rectangle area to copy
+ *
+ * DRM doesn't have native monochrome or grayscale support.
+ * Such drivers can announce the commonly supported XR24 format to userspace
+ * and use drm_fb_xrgb8888_to_gray8() to convert to grayscale and then this
+ * helper function to convert to the native format.
+ */
+void drm_fb_gray8_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *vaddr,
+				   const struct drm_framebuffer *fb,
+				   const struct drm_rect *clip)
+{
+
+	unsigned int linepixels = drm_rect_width(clip);
+	unsigned int lines = drm_rect_height(clip);
+	unsigned int start_offset, end_offset;
+	unsigned int y;
+	const u8 *gray8 = vaddr;
+	u8 *mono = dst;
+
+	/*
+	 * The reversed mono destination buffer contains 1 bit per pixel
+	 * and destination scanlines have to be in multiple of 8 pixels.
+	 */
+	if (!dst_pitch)
+		dst_pitch = DIV_ROUND_UP(linepixels, 8);
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
+	end_offset = clip->x2 % 8;
+
+	for (y = 0; y < lines; y++) {
+		drm_fb_gray8_to_mono_reversed_line(mono, gray8, dst_pitch,
+						   start_offset, end_offset);
+		gray8 += fb->pitches[0];
+		mono += dst_pitch;
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
+	unsigned int start_offset, end_offset;
+	unsigned int y;
+	u8 *mono = dst, *gray8;
+	u32 *src32;
+
+	if (WARN_ON(fb->format->format != DRM_FORMAT_XRGB8888))
+		return;
+
+	/*
+	 * The reversed mono destination buffer contains 1 bit per pixel
+	 * and destination scanlines have to be in multiple of 8 pixels.
+	 */
+	if (!dst_pitch)
+		dst_pitch = DIV_ROUND_UP(linepixels, 8);
+
+	/*
+	 * The cma memory is write-combined so reads are uncached.
+	 * Speed up by fetching one line at a time.
+	 */
+	src32 = kmalloc(len_src32, GFP_KERNEL);
+	if (!src32)
+		return;
+
+	/*
+	 * Copies are done line-by-line, allocate an intermediate
+	 * buffer to copy the gray8 lines and then convert to mono.
+	 */
+	gray8 = kmalloc(linepixels, GFP_KERNEL);
+	if (!gray8)
+		goto free_src32;
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
+	end_offset = clip->x2 % 8;
+
+	vaddr += clip_offset(clip, fb->pitches[0], cpp);
+	for (y = 0; y < lines; y++) {
+		src32 = memcpy(src32, vaddr, len_src32);
+		drm_fb_xrgb8888_to_gray8_line(gray8, src32, linepixels);
+		drm_fb_gray8_to_mono_reversed_line(mono, gray8, dst_pitch,
+						   start_offset, end_offset);
+		vaddr += fb->pitches[0];
+		mono += dst_pitch;
+	}
+
+	kfree(gray8);
+free_src32:
+	kfree(src32);
+}
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono_reversed);
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index b30ed5de0a33..6638da9e9774 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -43,4 +43,12 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
 		     const void *vmap, const struct drm_framebuffer *fb,
 		     const struct drm_rect *rect);
 
+void drm_fb_gray8_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *src,
+				   const struct drm_framebuffer *fb,
+				   const struct drm_rect *clip);
+
+void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *src,
+				      const struct drm_framebuffer *fb,
+				      const struct drm_rect *clip);
+
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */
-- 
2.34.1

