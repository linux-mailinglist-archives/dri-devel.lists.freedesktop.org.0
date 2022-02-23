Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 747A74C1C57
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 20:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B803410E9F5;
	Wed, 23 Feb 2022 19:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A121F10E9EA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 19:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645645069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N/l3oCj67GUwlDfyFRu9RXhbDrMuZBvOYEDah0hu0xk=;
 b=U+m1SAQxRn8JfJrOepr+EQ3iul74SyT9ils6Rc9DVWrQSu6Qp38DuVwlQ/hyKJDlxSBeyA
 mNV37J3Sivx6YvFtk0RjFB3VsGYIz0k4UCoKBMlIfG5tpaR7q7ft10tJ0g88sKijKUNca1
 ZQe4uNqiWhrHXAVjyzrQokM5Giz9Ibo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489--NSvcKo1Ngqyc--PTmlLWw-1; Wed, 23 Feb 2022 14:37:47 -0500
X-MC-Unique: -NSvcKo1Ngqyc--PTmlLWw-1
Received: by mail-wr1-f72.google.com with SMTP id
 c5-20020adffb05000000b001edbbefe96dso852633wrr.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 11:37:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N/l3oCj67GUwlDfyFRu9RXhbDrMuZBvOYEDah0hu0xk=;
 b=wEDTGGWNcvBiVJgbr/DTQWz6tmS7YTSrF7LmF2sItX+sCSIHDsyz79e6x9BB4xHkaq
 9Zul8jD7r++XWqnlmycVIsqK+kA3KgxB7sI4HcVHsJLcBCASJqXGAtdvyBkYBfG9278z
 18AoOP9f/L5symRHn6hovrhXDET1c9aWRLCnmve2PqISMYcAz0+ULBNMplliVZOmX2zn
 9iSVDlMuLe8+4CZp4fKVcfOELWNyILcZrQR4di/5nnbXXP1YwmbkjhOmm9mLgHsxuKuf
 lShbTzBeFvjJ2u/28NimUUkL1t5537XWaDWJg7LL8j2dyk8c1RZTPoOBP1vCe55BazGY
 b5/g==
X-Gm-Message-State: AOAM531Q///xbZC5dd8OaEI8GbfZrERuGAm0fCxUcV1a4n+PS/b0Tvz9
 no5eLTWU+UaSt9VZB/L8ozlFRmsKsoQ/RR+J3FomIb/YZOOh6EMOyAMXMaMdPnvzaTikyKaCV6l
 JSTOcQQTbop2XNJ+cB+ICqp/yaYgF
X-Received: by 2002:a5d:4450:0:b0:1e6:8d72:b88e with SMTP id
 x16-20020a5d4450000000b001e68d72b88emr865450wrr.632.1645645066609; 
 Wed, 23 Feb 2022 11:37:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3dlcQ4rDmWCLTRjmi51tojX5NlBHrp66hbYXNYrBhpSKQ+FebzA6eKdmARYqeDYgmhj79ow==
X-Received: by 2002:a5d:4450:0:b0:1e6:8d72:b88e with SMTP id
 x16-20020a5d4450000000b001e68d72b88emr865433wrr.632.1645645066320; 
 Wed, 23 Feb 2022 11:37:46 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id v9sm511346wrx.27.2022.02.23.11.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:37:45 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/repaper: Use format helper for xrgb8888 to monochrome
 conversion
Date: Wed, 23 Feb 2022 20:37:35 +0100
Message-Id: <20220223193735.213185-1-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is now a drm_fb_xrgb8888_to_mono_reversed() helper function to do
format conversion from XRGB8888 to reversed monochrome.

Use that helper and remove the open coded version in the repaper driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

This was only built tested because I don't have access to the hardware.

 drivers/gpu/drm/tiny/repaper.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 97a775c48cea..5c74e236b16d 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -508,26 +508,6 @@ static void repaper_get_temperature(struct repaper_epd *epd)
 	epd->factored_stage_time = epd->stage_time * factor10x / 10;
 }
 
-static void repaper_gray8_to_mono_reversed(u8 *buf, u32 width, u32 height)
-{
-	u8 *gray8 = buf, *mono = buf;
-	int y, xb, i;
-
-	for (y = 0; y < height; y++)
-		for (xb = 0; xb < width / 8; xb++) {
-			u8 byte = 0x00;
-
-			for (i = 0; i < 8; i++) {
-				int x = xb * 8 + i;
-
-				byte >>= 1;
-				if (gray8[y * width + x] >> 7)
-					byte |= BIT(7);
-			}
-			*mono++ = byte;
-		}
-}
-
 static int repaper_fb_dirty(struct drm_framebuffer *fb)
 {
 	struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
@@ -560,12 +540,10 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
 	if (ret)
 		goto out_free;
 
-	drm_fb_xrgb8888_to_gray8(buf, 0, cma_obj->vaddr, fb, &clip);
+	drm_fb_xrgb8888_to_mono_reversed(buf, 0, cma_obj->vaddr, fb, &clip);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
-	repaper_gray8_to_mono_reversed(buf, fb->width, fb->height);
-
 	if (epd->partial) {
 		repaper_frame_data_repeat(epd, buf, epd->current_frame,
 					  REPAPER_NORMAL);
-- 
2.34.1

