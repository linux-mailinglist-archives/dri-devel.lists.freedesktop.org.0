Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE34B27F4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 15:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DAC10EAAC;
	Fri, 11 Feb 2022 14:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966FD10EA7C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 14:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644590050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFaIKzYZq5mwoMCRxFCEVoEkMIRZsF+ixkyzhcwnXVQ=;
 b=DWl1iofngvK7Dx2I/vjKihh1wTrP3/8mYuqfHARIK3GHFUMqhwFQuiwzhtMFzZ2ypw1wFB
 +CE2dWgOTNwAYZPuTVCQdIrYRrMTCPvalYy7zNQrGbQZGWwJapEkp04bhP8Pk88SQDJf8A
 64TJlKvtS3Rylik3d89IQATCYC7L1fI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-qE3cINvaNZ-CtqVA7pu38g-1; Fri, 11 Feb 2022 09:34:07 -0500
X-MC-Unique: qE3cINvaNZ-CtqVA7pu38g-1
Received: by mail-wm1-f72.google.com with SMTP id
 v190-20020a1cacc7000000b0034657bb6a66so868008wme.6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 06:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wFaIKzYZq5mwoMCRxFCEVoEkMIRZsF+ixkyzhcwnXVQ=;
 b=I98fJsjvF+Qudv7fVrMGsPpxtLRVlOtqc0oegguDS2GHF017DKc7tcRhQrXGYSfTJO
 ZoQaMGP3IPd6rjzwTmwBIDKaeAbiD9S2gEeHp2wCSAvZVtjgFrIvB0VqC7PHQVTRTsoG
 aIa0KixTBDZzzmQmDvH+oIZ4+tcJNZHdtNxG8UPC1Bq2N+7MopafIV8xWI15RPv6foXF
 kDZI8x9ZZiL/JwT4H7LYcF6pETO0lTFRbrutRM2NrfvfD3aHgXq54212v22VsuSQ+C/r
 ldEAXhnboOjCRMJsvPbwTURAHTOWOCaQXZ+wcCvyfiT4sL6lqJjKEYsMqURJGn52fs7c
 Zzzg==
X-Gm-Message-State: AOAM533uAabUs+dxAxmifOzxUO1fl4UDWQQSUaxOpSqKv/4dG3J/MNz1
 3ENNUAuIbhmritnP4MsFksGOXsmenGaUKJCWeLFPhFkK+xAJ5Wv9WHOelj9ARc3LqGQQ/WOQX0o
 8QodyB4p9lztiNHqWlzVtt/WE49fM
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr498441wmg.111.1644590046174; 
 Fri, 11 Feb 2022 06:34:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhPexpHfSetxE0S3/Tn4IvNqI07iQUkmyj562tzbxdGmYsFTdsPjtNvRQ7u4RPguUGeK9nwg==
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr498413wmg.111.1644590045932; 
 Fri, 11 Feb 2022 06:34:05 -0800 (PST)
Received: from minerva.redhat.com ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o14sm24616012wry.104.2022.02.11.06.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 06:34:05 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/6] drm/format-helper: Add drm_fb_xrgb8888_to_gray8_line()
Date: Fri, 11 Feb 2022 15:33:53 +0100
Message-Id: <20220211143358.3112958-2-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211143358.3112958-1-javierm@redhat.com>
References: <20220211143358.3112958-1-javierm@redhat.com>
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
---

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

