Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3D64B2171
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 10:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240EE10EA39;
	Fri, 11 Feb 2022 09:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A26510EA39
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 09:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644571181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WfmTkAo8MbPeTvx/t6/qV64gOBcJ/r5gHdJT18TRKbc=;
 b=OpfNR6+ZrvxnmI9HBhOPzAXLzm14eYKU/eLhUJKCnSysqzaZ7TrpfNrTbhiJFk6y0YzpVc
 cJiu9ffPj4r0tfhh49ZWWIzI3RjDSfFBPVnn4kgY1hd8F8a6X/mXNY4Ho5gafAXbs0f7EW
 kE+5JIzPKi519ezrCW5X5gWpObLkqcw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-YPnX_lvtMPmWK7hFPxc2zQ-1; Fri, 11 Feb 2022 04:19:38 -0500
X-MC-Unique: YPnX_lvtMPmWK7hFPxc2zQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 q8-20020adfb188000000b001e33a8cdbf4so3614679wra.16
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 01:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WfmTkAo8MbPeTvx/t6/qV64gOBcJ/r5gHdJT18TRKbc=;
 b=XByFXtZ+iggt5cLL4OlI7zKwWSmKuMoQnfsizx2OVN9Xm5JL7Wh8xHA9Dp+pzYmZu3
 RC5ef1LsR8JBh+Dp6i9AphBKvlLmdl4wEQz8H+VSPKkP90I8i1maWfodbwvlQ2KxqTB8
 hDEx+FF5ZVycUdItnSRnjG4A4nLF5ZewOhsgZFuESC0GqluvWkS9Lc4SIZngqUS46oim
 56+D6uMDvIKGyF/R5TBM0+IZgwbGdAJoADuoXBy2dMhy+3JkmCIa4JRpYqjTzc6VPteQ
 oCgnp0m36vAgAWZj0YWA/VbZwIMBQON4POq9qzIey8/nNBmwkQ3wCTBiWZ0mZN5XrsCK
 +TLA==
X-Gm-Message-State: AOAM530diCTxpuR/fn+ef9yp5JsmuV0+NansduaOH2bECBMjV2lqQuGT
 Kfnp7C0OJuLSiMThU5LqbNtKoB3JwFPZOxPmWYfDezQ7g6tTezYWfVuY4ftabnzHTzAE08/rXN6
 4lw4RrcNcMxI/jDkeh2X7Jq0Ve3uk
X-Received: by 2002:a05:600c:3514:: with SMTP id
 h20mr1321462wmq.164.1644571177310; 
 Fri, 11 Feb 2022 01:19:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpzAJ0rd4SzIQHbw8fvUDCZMIVgg7JkfatOvaBwjk1xAO33C05HSaBy6MnqF2Asz4c1X6vpw==
X-Received: by 2002:a05:600c:3514:: with SMTP id
 h20mr1321436wmq.164.1644571177101; 
 Fri, 11 Feb 2022 01:19:37 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id r17sm3805578wmq.33.2022.02.11.01.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 01:19:36 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/6] drm/format-helper: Add drm_fb_xrgb8888_to_gray8_line()
Date: Fri, 11 Feb 2022 10:19:22 +0100
Message-Id: <20220211091927.2988283-2-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211091927.2988283-1-javierm@redhat.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
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
---

(no changes since v3)

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

