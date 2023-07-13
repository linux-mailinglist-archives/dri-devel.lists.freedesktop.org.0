Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66EE751C6A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E7410E0B5;
	Thu, 13 Jul 2023 08:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E38D10E632
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689238766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vnxC9yGQS3oyHtrj9CFhBKbzf8XATjvmszGm7K4qRhU=;
 b=PqT8+lqFHyQSs5qNSZzJsAovqAmIYC+267q8Q7n/Vt3KZ87WSnEGDy8Rv85YNPFGUgLvv5
 YXTF9t+bn4tj4Gy4fsi/S5aBKwID/YFXa2+rdwe31HyPnQwokk+FHFaK/N8AW1o5m+w5DU
 H813or5xJUHvehM12R6b9wwW2xRRc9c=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-0TDqdBBWP1ynBFXg4a1pFg-1; Thu, 13 Jul 2023 04:59:25 -0400
X-MC-Unique: 0TDqdBBWP1ynBFXg4a1pFg-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b6cf671d94so4302361fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 01:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689238764; x=1691830764;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vnxC9yGQS3oyHtrj9CFhBKbzf8XATjvmszGm7K4qRhU=;
 b=EjdwhemHMeJH0FZNH2EweVu4E5n9w1S6S/8pQlZxGcIUg5u4GEiaPm9KgRfhYMKQr0
 FDH0OQgXkM4/IJf3brZNTOIt9Jf4OvC/blVtHmXg4y3C3Lzxg+IIW3Zhwt6NxjShJhkY
 piJWL1tVN88rWwuPt2wZaVCsPioJzcX80cFXBIWbBnaDYONW7llWlD+pGSg/QEV2OOa3
 1OIx4+6wDTDkKdUKre4gUk9KxcTGGypPV7X7dMI9Ru7E+VtQZquX2mtdi6vmoeDYy9aa
 474wvpqSbqPPyY8xX+z6D6URS1XRcI1gxRA6SrLCstVCmq0enAvLzhj5t37QZkFwYaEU
 fssA==
X-Gm-Message-State: ABy/qLbtp+j6qR0mUEdi7qstEjbb5spQzADBLzjgiHozJgpud1KHr1x1
 y/jBqbF83L5nkCOtAMO/TsZOQjG6jo39nxvCyOQOwDxTMa+YJ3WVZgUSRjih3fR/r4yt1LrX+o8
 6VrBFWosgDhzDe0Hnt8aaDwdkptcX
X-Received: by 2002:ac2:4d0a:0:b0:4fb:61ea:95dc with SMTP id
 r10-20020ac24d0a000000b004fb61ea95dcmr668297lfi.7.1689238763854; 
 Thu, 13 Jul 2023 01:59:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGc5HFE7WCmY1lT5YS/h/GV1g02JYORqPk5tgrQ7etZG94Yv7rrcroiXJTHdwIkOtIEUGSKDA==
X-Received: by 2002:ac2:4d0a:0:b0:4fb:61ea:95dc with SMTP id
 r10-20020ac24d0a000000b004fb61ea95dcmr668279lfi.7.1689238763561; 
 Thu, 13 Jul 2023 01:59:23 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a4-20020adfeec4000000b0030c4d8930b1sm7356588wrp.91.2023.07.13.01.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 01:59:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ssd130x: Change pixel format used to compute the buffer
 size
Date: Thu, 13 Jul 2023 10:58:07 +0200
Message-ID: <20230713085859.907127-1-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
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
Cc: dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit e254b584dbc0 ("drm/ssd130x: Remove hardcoded bits-per-pixel in
ssd130x_buf_alloc()") used a pixel format info instead of a hardcoded bpp
to calculate the size of the buffer allocated to store the native pixels.

But that wrongly used the DRM_FORMAT_C1 fourcc pixel format, which is for
color-indexed frame buffer formats. While the ssd103x controllers don't
support different single-channel colors nor a Color Lookup Table (CLUT).

Both formats use eight pixels/byte, so in practice there is no functional
changes in this patch. But still the correct pixel format should be used.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index b3dc1ca9dc10..afb08a8aa9fc 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -153,7 +153,7 @@ static int ssd130x_buf_alloc(struct ssd130x_device *ssd130x)
 	const struct drm_format_info *fi;
 	unsigned int pitch;
 
-	fi = drm_format_info(DRM_FORMAT_C1);
+	fi = drm_format_info(DRM_FORMAT_R1);
 	if (!fi)
 		return -EINVAL;
 
-- 
2.41.0

