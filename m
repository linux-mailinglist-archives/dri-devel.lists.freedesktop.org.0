Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 360B16AF5C5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 20:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C6810E142;
	Tue,  7 Mar 2023 19:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D3310E142
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 19:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678217718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KYmc83GBs2GOcntamM7m0RX9zUZjNNeykOZSju7+M+k=;
 b=SmmRW+1aKtTRub5R1du4wLsUmnyZsV6Wf1GmjMxQV9mRd+ugLXkleNZ9gq++n9/Sf5R3h9
 MwTs7VAZ0HYUrNmj6WqOscvFwK/AagfMNfX+GzfGhBZZko4edWzCNdWIatxnI5C5v9mt/y
 ckZe/SZC9Oy+CH+w3TfRvjIb+10yGHw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-PSCkgv_1M9ef-NsUT6uWJQ-1; Tue, 07 Mar 2023 14:35:17 -0500
X-MC-Unique: PSCkgv_1M9ef-NsUT6uWJQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so5166036wms.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 11:35:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678217716;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KYmc83GBs2GOcntamM7m0RX9zUZjNNeykOZSju7+M+k=;
 b=vk3bVo04+cbD3il/08D38Dxid2Y5ADcTSG0yRDj6umXnclTgYXuQQ+WqkubsSEFkYR
 td0uoBtWkntum8kLcN57IGXTKpoqHnhto/MszUAxGK1M5cq/BrwBshBhwVssMT+Temwp
 tkdkZLCVEiwx+8hELdUgQsgqeIIYdJ/6ZdpOwR2w/dJ/Ll2AjKumfmtWAfaY7R2GOVfl
 NH7RT4PuFPCTSqX6FQ8w+aAFQy8p0kavf7XVi1+NOUQx9nNDM54bcwCshCeU6yf0m7fR
 1xrTu9y3pOUQqtoQQ8ANBrDDTyS3jjEliFxWSJ2qT0yy0puHy/23d7EcjqVGsQUQFjrs
 a1yA==
X-Gm-Message-State: AO0yUKWCeZp9jj9MYcLtXuL859Or2p8GOzQhD6OsdhqTnBkKuZeMs8qo
 /Gts2iwt3iIg9w7YjLTCTytChYeTEzv7neiiAE8Y+zzH4P/wlgjJhWGq5KShLOupH+c8wys3dBQ
 g9GGegUqA5dwTQiygkJ7Njgfw76zx
X-Received: by 2002:a05:600c:468b:b0:3df:fcbd:3159 with SMTP id
 p11-20020a05600c468b00b003dffcbd3159mr10930177wmo.3.1678217716325; 
 Tue, 07 Mar 2023 11:35:16 -0800 (PST)
X-Google-Smtp-Source: AK7set9EF/utzGu8fX4TGyh6OXkCzZGiyskAxyksONYkz/GnN0X7MyJNW1dFFpEng/Xh1ROJ6z3ctw==
X-Received: by 2002:a05:600c:468b:b0:3df:fcbd:3159 with SMTP id
 p11-20020a05600c468b00b003dffcbd3159mr10930163wmo.3.1678217716056; 
 Tue, 07 Mar 2023 11:35:16 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b5-20020a05600c150500b003e91b9a92c9sm13617137wmg.24.2023.03.07.11.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 11:35:15 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/format-helper: Make conversion_buf_size() support
 sub-byte pixel fmts
Date: Tue,  7 Mar 2023 20:34:57 +0100
Message-Id: <20230307193457.331360-1-javierm@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Maxime Ripard <maxime@cerno.tech>, David Gow <davidgow@google.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are DRM fourcc formats that have pixels smaller than a byte, but the
conversion_buf_size() function assumes that pixels are a multiple of bytes
and use the struct drm_format_info .cpp field to calculate the dst_pitch.

Instead, calculate it by using the bits per pixel (bpp) and char per pixel
(cpp) to account for formats that have sub-byte pixels.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
Tested by making sure that the following command still succeeds:

./tools/testing/kunit/kunit.py run \
--kunitconfig=drivers/gpu/drm/tests/.kunitconfig

 drivers/gpu/drm/tests/drm_format_helper_test.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 9536829c6e3a..f200347a1db7 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -409,12 +409,16 @@ static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
 				  const struct drm_rect *clip)
 {
 	const struct drm_format_info *dst_fi = drm_format_info(dst_format);
+	unsigned int bpp, cpp;
 
 	if (!dst_fi)
 		return -EINVAL;
 
-	if (!dst_pitch)
-		dst_pitch = drm_rect_width(clip) * dst_fi->cpp[0];
+	if (!dst_pitch) {
+		bpp = drm_format_info_bpp(dst_fi, 0);
+		cpp = DIV_ROUND_UP(bpp, 8);
+		dst_pitch = DIV_ROUND_UP(drm_rect_width(clip) * bpp, 8);
+	}
 
 	return dst_pitch * drm_rect_height(clip);
 }
-- 
2.39.2

