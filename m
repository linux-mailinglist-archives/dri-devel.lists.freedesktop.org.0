Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 382F14A4FEC
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 21:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4A010E17E;
	Mon, 31 Jan 2022 20:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0317510E135
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 20:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643659963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vM3bdlw6HomnmKXTkmUtit4bHCKLqTmZACNhurI9HbE=;
 b=VUNuxTvhFzl9zHl/1Gv3Ne4sB+rVI8hxfT4Bhsg4DXjDcJe18KbnZL7hIwQDRKBLAo9v5g
 NgFRKIJ92idZLx5qaSzaxro/2kaW+MTymNOb9D96MM1KGHrWRWTzl7kLLMp8OEAY9SZ4Jm
 v+1bfUzkLAmQoAhcSPj6B5uC68P6Cjw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-CpqQFl1qMn27a16StqwktQ-1; Mon, 31 Jan 2022 15:12:42 -0500
X-MC-Unique: CpqQFl1qMn27a16StqwktQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l16-20020a1c7910000000b0034e4206ecb7so80241wme.7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 12:12:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vM3bdlw6HomnmKXTkmUtit4bHCKLqTmZACNhurI9HbE=;
 b=51yIHiPkzaY7XmUGX1Vuk3oZOQ1XCXtIKPhX36YqFZvAUPJGx9bOnpDMYko1OVrIc1
 3+oetzX1kB0fdlfQae23zc/dyQCcd6Mwm3yt1shoHdfhhMHyB58B2z69G8i+8UCmpyVG
 zZJVatA52RMW61hEUpfiubh/JxNHjsXr7DtFwEqBl9CcLNdX9ppWv0AtbE3TGmzu1yao
 PeA1IrkFyQVQtqg+i/UIELlfDkIehLbYf+6E5dC5zePgaADsfl5mwEyjgOJgpy2RJ0cC
 wGRpioQ89O44mWhYRoxzrumX4q9f4EdrKBLvuhFqK5rcPtaQK3hU6rgwVcwDAxSCHxhZ
 mKOw==
X-Gm-Message-State: AOAM531NZs2dM+qWNXjRxaGfwmPYZE3dzy9XsQPzW3yORVloOPm86QTi
 FyO5/raXiA2S4YV3Ya+MSRMV+hcZasT3eFGxlINwh1KYMD5dUiJUwaiwt9yAEFxb3zDoLCfvsay
 F7IRmChLDXhdVoqUKjHZiUYWgWo/v
X-Received: by 2002:adf:f784:: with SMTP id q4mr19229425wrp.59.1643659960635; 
 Mon, 31 Jan 2022 12:12:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3Q9aJyDDEzKcgl6ZRCOab6CbkULBPR+XNfldCqUZBAmgsUN/1rCzA6CjueKUxmVTW7C4q8w==
X-Received: by 2002:adf:f784:: with SMTP id q4mr19229412wrp.59.1643659960459; 
 Mon, 31 Jan 2022 12:12:40 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id i9sm15124660wry.32.2022.01.31.12.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 12:12:40 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] drm/format-helper: Add drm_fb_gray8_to_mono_reversed()
Date: Mon, 31 Jan 2022 21:12:22 +0100
Message-Id: <20220131201225.2324984-3-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131201225.2324984-1-javierm@redhat.com>
References: <20220131201225.2324984-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support to convert 8-bit grayscale to reversed monochrome for drivers
that control monochromatic displays, that only have 1 bit per pixel depth.

This helper function was based on repaper_gray8_to_mono_reversed() from
the drivers/gpu/drm/tiny/repaper.c driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/drm_format_helper.c | 35 +++++++++++++++++++++++++++++
 include/drm/drm_format_helper.h     |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 0f28dd2bdd72..bf477c136082 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -584,3 +584,38 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
 	return -EINVAL;
 }
 EXPORT_SYMBOL(drm_fb_blit_toio);
+
+/**
+ * drm_fb_gray8_to_mono_reversed - Convert grayscale to reversed monochrome
+ * @dst: reversed monochrome destination buffer
+ * @src: 8-bit grayscale source buffer
+ * @clip: Clip rectangle area to copy
+ *
+ * DRM doesn't have native monochrome or grayscale support.
+ * Such drivers can announce the commonly supported XR24 format to userspace
+ * and use drm_fb_xrgb8888_to_gray8() to convert to grayscale and then this
+ * helper function to convert to the native format.
+ */
+void drm_fb_gray8_to_mono_reversed(void *dst, void *src, const struct drm_rect *clip)
+{
+	size_t width = drm_rect_width(clip);
+	size_t height = drm_rect_width(clip);
+
+	u8 *mono = dst, *gray8 = src;
+	unsigned int y, xb, i;
+
+	for (y = 0; y < height; y++)
+		for (xb = 0; xb < width / 8; xb++) {
+			u8 byte = 0x00;
+
+			for (i = 0; i < 8; i++) {
+				int x = xb * 8 + i;
+
+				byte >>= 1;
+				if (gray8[y * width + x] >> 7)
+					byte |= BIT(7);
+			}
+			*mono++ = byte;
+		}
+}
+EXPORT_SYMBOL(drm_fb_gray8_to_mono_reversed);
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index b30ed5de0a33..cd4c8b7c78de 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -43,4 +43,6 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
 		     const void *vmap, const struct drm_framebuffer *fb,
 		     const struct drm_rect *rect);
 
+void drm_fb_gray8_to_mono_reversed(void *dst, void *vaddr, const struct drm_rect *clip);
+
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */
-- 
2.34.1

