Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55C66BDBBE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 23:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6B210E331;
	Thu, 16 Mar 2023 22:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B1310E331
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 22:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679006063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cQjcHnFhhGHZA5Yk3fgjjkY+JL6ce3oLWezSsu1quCk=;
 b=bXpDKPQbgzEzHWH5+AYEPm8P2z0YxMTg7QPZi415H+uFTZcZv2WtolWXQKJnTI0aMwsVsW
 BhKKIMrL8KxLcBJCb/h0wNRygZ4KPKFpgIM3IxrICfl4UaJoasAuOZysCR4PWk3bCYlWqn
 u6x4TH0HxCOYTqf4OYNXej5g6+UYOUQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-ZhWsSzf-O-eoPRfR6qpfXA-1; Thu, 16 Mar 2023 18:34:19 -0400
X-MC-Unique: ZhWsSzf-O-eoPRfR6qpfXA-1
Received: by mail-wm1-f71.google.com with SMTP id
 p21-20020a05600c1d9500b003ed34032a01so1354337wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 15:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679006058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cQjcHnFhhGHZA5Yk3fgjjkY+JL6ce3oLWezSsu1quCk=;
 b=z/ySL8oYakzf5L3jg6SR9tV+DB5QLnIaEe6XwN2zRguIC07wvgbvnGkTgVmTBbjL9j
 oRY0woUXKq+coTPul2GXZs5yEsylGJ+FT4qBb2C9y2iYnSkPBIHI4GyVY2VsnGr9M9f1
 YKpccFpY9dKomid161JDIOY9Fyzd6RhXY1em+aqhGa/da3s80mWj/YaJVxRVI/YPSFYL
 olYiFdk8Dn+HTjY5yNr0UHqeA+uTb4h2fy0Hldukg2MDF5w8LR97WKNeaKKR4cZ6Bk6D
 WNgULfoKEu/uY8D49GCjGGsCHcMFSLZ1ZVqC4ooL/B5C8wh7UzbthDwT3EwyexI7CMuD
 CMDw==
X-Gm-Message-State: AO0yUKWtyTjoo1ZUNq1mGsZLXodH8wrPdIC8tXWSJC7bdwSqjfmdq9+F
 FDaubLnXfBuIkjCr/2JFnqZgL/pvoi761+ICa0luuRSwoSZzkxIOedJz8jNs1gZJnbzpO41e7tK
 QI1yq+SjjVheyUc+73+xbDCv0H8YQ
X-Received: by 2002:a5d:4d10:0:b0:2d1:7ade:aad with SMTP id
 z16-20020a5d4d10000000b002d17ade0aadmr4193282wrt.31.1679006058644; 
 Thu, 16 Mar 2023 15:34:18 -0700 (PDT)
X-Google-Smtp-Source: AK7set9v6p8hdWcWbe8F7o80naCh5TQbXl2/qaDD1HpV78Lc0LMQy8kTM9oet4mKKOKDXFt7Ra0tdw==
X-Received: by 2002:a5d:4d10:0:b0:2d1:7ade:aad with SMTP id
 z16-20020a5d4d10000000b002d17ade0aadmr4193267wrt.31.1679006058328; 
 Thu, 16 Mar 2023 15:34:18 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t11-20020a05600001cb00b002c54241b4fesm452499wrx.80.2023.03.16.15.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 15:34:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/format-helper: Use drm_format_info_min_pitch() in tests
 helper
Date: Thu, 16 Mar 2023 23:34:04 +0100
Message-Id: <20230316223404.102806-1-javierm@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, David Gow <davidgow@google.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's a nice macro to calculate the destination pitch that already takes
into account sub-byte pixel formats. Use that instead of open coding it.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/tests/drm_format_helper_test.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index bfa47f8ffd09..474bb7a1c4ee 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -440,15 +440,12 @@ static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
 				  const struct drm_rect *clip)
 {
 	const struct drm_format_info *dst_fi = drm_format_info(dst_format);
-	unsigned int bpp;
 
 	if (!dst_fi)
 		return -EINVAL;
 
-	if (!dst_pitch) {
-		bpp = drm_format_info_bpp(dst_fi, 0);
-		dst_pitch = DIV_ROUND_UP(drm_rect_width(clip) * bpp, 8);
-	}
+	if (!dst_pitch)
+		dst_pitch = drm_format_info_min_pitch(dst_fi, 0, drm_rect_width(clip));
 
 	return dst_pitch * drm_rect_height(clip);
 }

base-commit: 165d5133731a2e045abdd6d9d3c9221fdc2a556e
-- 
2.39.2

