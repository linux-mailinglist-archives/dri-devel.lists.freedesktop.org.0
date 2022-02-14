Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FC44B51C6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 14:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF8210E596;
	Mon, 14 Feb 2022 13:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78AE10E596
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 13:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644845856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMJPygyk+q6IKiko2o+GbGpYNTzAZFXYDjw6FkGxW+0=;
 b=Bn4saIg2+yqpIVVNbya7Cs9RMRUCp87nmXLEPaZM9V5qybQJnCLiVfYUWLuSMRw8xw5JT9
 RBh3+hh2vGVzBtRrAcmhiHigdwevvOdJv7WgxdlG2EqvC+x7QZytD1sx2Tcmo7M38O3gZQ
 o7FEtfNCJ7sIBW48Had3DIcQ6CKA8RU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-ido2jc8oPxmJ5yeEOz34qg-1; Mon, 14 Feb 2022 08:37:35 -0500
X-MC-Unique: ido2jc8oPxmJ5yeEOz34qg-1
Received: by mail-wr1-f71.google.com with SMTP id
 w26-20020adf8bda000000b001e33dbc525cso6880186wra.18
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 05:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PMJPygyk+q6IKiko2o+GbGpYNTzAZFXYDjw6FkGxW+0=;
 b=fR2aXNveDZ/+6yLchSDNNFVRp4pBsvlog6F6hk5hHm+gY0VSW03eU5kcxeKyD1vwoI
 nQ2GfNlwtEcoiLmzd2ykEDiWQx8bcnGKFf2hKeAsLo118j3+wgR0dGCWFNk/6PnqPKvk
 Lr5LEcrCp3+ZzY4TjzOpRVk9ILsuixO9m0/68awahJGY6RwQuFSAGV8szH2FesNXtcWF
 LzBIiHppu/u3b0Wq9XaV6hRB3yS6UDviq1w7xH5rIa1c2OCX3DZkuh2OpSGLYroWplfC
 osPZczFmaCsz4xb3u470UaIEdRhYilRQC8Zgjt7NpLwm0L7dOW4a9uE4y7jD/AXFQrWY
 zfXA==
X-Gm-Message-State: AOAM533sggo/ZGf9f/zFBKqUZ3WZYruSHrVP+wXdlgTj1YHAeCuWuj0K
 NEbvx870xkVQoKcU8/1M6ol8GtLcXqu97O8ok6fgfQxLMbb9LXYXybyGsOzMGpGryp/KBdSxu3v
 RQTAmzDtaSIuz7HHpEb5AmS/EdwnU
X-Received: by 2002:a05:600c:d0:: with SMTP id
 u16mr11405611wmm.102.1644845854447; 
 Mon, 14 Feb 2022 05:37:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWrzaW0LQ9WRQkaVll0CUJhsj6kJUqQPxu24pAAdfApfjJNXNN9XDBh1yuBXccEzAh4eXAIw==
X-Received: by 2002:a05:600c:d0:: with SMTP id
 u16mr11405587wmm.102.1644845854167; 
 Mon, 14 Feb 2022 05:37:34 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id y6sm3568918wrd.30.2022.02.14.05.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 05:37:33 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/6] drm/format-helper: Add drm_fb_xrgb8888_to_gray8_line()
Date: Mon, 14 Feb 2022 14:37:05 +0100
Message-Id: <20220214133710.3278506-2-javierm@redhat.com>
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

Pull the per-line conversion logic into a separate helper function.

This will allow to do line-by-line conversion in other helpers that
convert to a gray8 format.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Changes in v6:
- Add Andy Shevchenko's Reviewed-by to patch #1.

Changes in v5:
- Add Thomas Zimmermann's Reviewed-by to patch #1.

Changes in v3:
- Add a drm_fb_xrgb8888_to_gray8_line() helper function (Thomas Zimmermann)

 drivers/gpu/drm/drm_format_helper.c | 31 ++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 0f28dd2bdd72..b981712623d3 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -464,6 +464,21 @@ void drm_fb_xrgb8888_to_xrgb2101010_toio(void __iomem *dst,
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010_toio);
 
+static void drm_fb_xrgb8888_to_gray8_line(u8 *dst, const u32 *src, unsigned int pixels)
+{
+	unsigned int x;
+
+	for (x = 0; x < pixels; x++) {
+		u8 r = (*src & 0x00ff0000) >> 16;
+		u8 g = (*src & 0x0000ff00) >> 8;
+		u8 b =  *src & 0x000000ff;
+
+		/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
+		*dst++ = (3 * r + 6 * g + b) / 10;
+		src++;
+	}
+}
+
 /**
  * drm_fb_xrgb8888_to_gray8 - Convert XRGB8888 to grayscale
  * @dst: 8-bit grayscale destination buffer
@@ -484,8 +499,9 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010_toio);
 void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vaddr,
 			      const struct drm_framebuffer *fb, const struct drm_rect *clip)
 {
-	unsigned int len = (clip->x2 - clip->x1) * sizeof(u32);
-	unsigned int x, y;
+	unsigned int linepixels = clip->x2 - clip->x1;
+	unsigned int len = linepixels * sizeof(u32);
+	unsigned int y;
 	void *buf;
 	u8 *dst8;
 	u32 *src32;
@@ -508,16 +524,7 @@ void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vad
 	for (y = clip->y1; y < clip->y2; y++) {
 		dst8 = dst;
 		src32 = memcpy(buf, vaddr, len);
-		for (x = clip->x1; x < clip->x2; x++) {
-			u8 r = (*src32 & 0x00ff0000) >> 16;
-			u8 g = (*src32 & 0x0000ff00) >> 8;
-			u8 b =  *src32 & 0x000000ff;
-
-			/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
-			*dst8++ = (3 * r + 6 * g + b) / 10;
-			src32++;
-		}
-
+		drm_fb_xrgb8888_to_gray8_line(dst8, src32, linepixels);
 		vaddr += fb->pitches[0];
 		dst += dst_pitch;
 	}
-- 
2.34.1

