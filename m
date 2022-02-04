Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB144A9A34
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 14:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497CA10E729;
	Fri,  4 Feb 2022 13:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1394310E415
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 13:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643982237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gsCZ0vamCvMedkmFYkO3ZNEjaPZGxukH+BWgq2BQ6do=;
 b=dkSruGhYgcdBaHymlx2kLQcWhVvwlB5BeWbvMn7a6GxsoXdSTj0oOXcHM2w5JsfJ8fD8Yj
 ZTisl7WXQx0ga0UZXXHAnUsU85Ic+cZEHX6M06mADZK58wFb93VlVPkj9GmqDzOSDVnLrH
 OL4DG1b1j/2MsREkCt02Bpb0dY+htbY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-Z3d4KJmdMAWO2luRdsZhew-1; Fri, 04 Feb 2022 08:43:55 -0500
X-MC-Unique: Z3d4KJmdMAWO2luRdsZhew-1
Received: by mail-wr1-f71.google.com with SMTP id
 e2-20020adfa442000000b001e2dd248341so576075wra.20
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 05:43:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gsCZ0vamCvMedkmFYkO3ZNEjaPZGxukH+BWgq2BQ6do=;
 b=dqjdnycYZwNMiBmXD7vJt6FzSXGbbkgWqL0y8nApQZGxp+/gaSTX+ANmRG7zvuwhHL
 jccucR2VxU38GYQ/HnTz2bjzzNB62HT+dIXr9pkdr26k61+Rpc6pHjC78XSjlFNffxgZ
 J66bPINV10bSgseUPZvOp+OXFxFs9LCDNz4g95diwpZJMnzK04Ip4P/LecdYWcoAC7pq
 Su0L8GZqCbuKMQC6QmrqA3Wb+21uAB7382YD0ZVpPqlXgDmgfOrUWcqdBcXvooO6eKiE
 GHQIoCGSEI0f6o97pjymi68poek3IJkHy9Y7cdDiRt7ev6gw8d4hS86E6R22j4D4/pAk
 4maw==
X-Gm-Message-State: AOAM533VrwHU5MkWfkoJZ7cUKl1dCJIs/TCZj+d0Kh8oknm3VVKRNrC/
 021xGIL3NvXLw0leGSUeCV5aXlyJuuvAnnA0WaetRRTp0Auf6D/1M+k+DbgzQgjjXv6wYRlMmvC
 TMIjks/J1jCrMxeWKiX0Yrc5CZaH6
X-Received: by 2002:a5d:64a9:: with SMTP id m9mr2454479wrp.661.1643982234670; 
 Fri, 04 Feb 2022 05:43:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlXexVQP8cfpmjMdMsb00GdG9twKe+Dfe6NJ6PFq21cUefB7/9Y6OdbGzVDbpRhtxvxM4R3Q==
X-Received: by 2002:a5d:64a9:: with SMTP id m9mr2454469wrp.661.1643982234457; 
 Fri, 04 Feb 2022 05:43:54 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id r3sm1871692wrt.102.2022.02.04.05.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 05:43:54 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] drm/format-helper: Add drm_fb_{xrgb8888,
 gray8}_to_mono_reversed()
Date: Fri,  4 Feb 2022 14:43:44 +0100
Message-Id: <20220204134347.1187749-2-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204134347.1187749-1-javierm@redhat.com>
References: <20220204134347.1187749-1-javierm@redhat.com>
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

(no changes since v1)

 drivers/gpu/drm/drm_format_helper.c | 80 +++++++++++++++++++++++++++++
 include/drm/drm_format_helper.h     |  7 +++
 2 files changed, 87 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 0f28dd2bdd72..cdce4b7c25d9 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -584,3 +584,83 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
 	return -EINVAL;
 }
 EXPORT_SYMBOL(drm_fb_blit_toio);
+
+static void drm_fb_gray8_to_mono_reversed_line(u8 *dst, const u8 *src, size_t pixels)
+{
+	unsigned int xb, i;
+
+	for (xb = 0; xb < pixels / 8; xb++) {
+		u8 byte = 0x00;
+
+		for (i = 0; i < 8; i++) {
+			int x = xb * 8 + i;
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
+ * @clip: Clip rectangle area to copy
+ *
+ * DRM doesn't have native monochrome or grayscale support.
+ * Such drivers can announce the commonly supported XR24 format to userspace
+ * and use drm_fb_xrgb8888_to_gray8() to convert to grayscale and then this
+ * helper function to convert to the native format.
+ */
+void drm_fb_gray8_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *src,
+				   const struct drm_rect *clip)
+{
+
+	size_t height = drm_rect_height(clip);
+	size_t width = drm_rect_width(clip);
+	unsigned int y;
+	const u8 *gray8 = src;
+	u8 *mono = dst;
+
+	if (!dst_pitch)
+		dst_pitch = width;
+
+	for (y = 0; y < height; y++) {
+		drm_fb_gray8_to_mono_reversed_line(mono, gray8, dst_pitch);
+		mono += (dst_pitch / 8);
+		gray8 += dst_pitch;
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
+void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *src,
+				      const struct drm_framebuffer *fb,
+				      const struct drm_rect *clip)
+{
+	if (WARN_ON(fb->format->format != DRM_FORMAT_XRGB8888))
+		return;
+
+	if (!dst_pitch)
+		dst_pitch = drm_rect_width(clip);
+
+	drm_fb_xrgb8888_to_gray8(dst, dst_pitch, src, fb, clip);
+	drm_fb_gray8_to_mono_reversed(dst, dst_pitch, dst, fb, clip);
+}
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono_reversed);
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index b30ed5de0a33..85e551a5cbe6 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -43,4 +43,11 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
 		     const void *vmap, const struct drm_framebuffer *fb,
 		     const struct drm_rect *rect);
 
+void drm_fb_gray8_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *src,
+				   const struct drm_rect *clip);
+
+void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *src,
+				      const struct drm_framebuffer *fb,
+				      const struct drm_rect *clip);
+
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */
-- 
2.34.1

