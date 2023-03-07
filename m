Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D7A6AF806
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 22:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA68D10E28C;
	Tue,  7 Mar 2023 21:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4A310E28C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 21:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678225845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YF8J1V/HdyW06qHE0PQyU5JTwvkaiAFhMsVbeRAMzxc=;
 b=EYpqUxU0TuqDv5TqA3HoCfG7UkFvzRDGyyVjCnSYL3/WvSATweSMp3sPwmjqyZpE2jW/jZ
 LpJDW85tLj0bZe58vuxw46nVCQ3EAChqHn7wi6qmnzufuLtftKGIRd5C29nm4dfxfEaYvf
 7Z5ukW9R2t0qFN4rJD0cT8t6gvru5fU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-_JuTbnjMMmGHgPQSpw4S0w-1; Tue, 07 Mar 2023 16:50:44 -0500
X-MC-Unique: _JuTbnjMMmGHgPQSpw4S0w-1
Received: by mail-wm1-f69.google.com with SMTP id
 l20-20020a05600c1d1400b003e10d3e1c23so30022wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 13:50:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678225843;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YF8J1V/HdyW06qHE0PQyU5JTwvkaiAFhMsVbeRAMzxc=;
 b=DFrR/QhzpXw8nKOKyd97L65mlnoihB+T1ez+l1AfFtKXDVX76G48argXhwX7XYBnXM
 9j4HIbueIAOT2NsQHr2CE86XsbiRWREw4bLjMI5DqUs7IyXzC7JQqMxDNzOEbwp/WBSo
 hWjOMNIiGravZsjJbwuvlLgXqmL3+qnXDKOCl200P1GeGbB4hNFs4RxpymCPqKy/uBLm
 yIQH/RUWuAY3BEWQktBJKXmw13iFbe+ddKiNwnYTrG2H254Fogn091bcL5eaXjw+t+rV
 zwo1XJeImabZ2wpLSlMCk011lNksAcZ1O3aagip7erbF6EkW2eK9TAADFJBWLhbm0tC8
 HOxw==
X-Gm-Message-State: AO0yUKVIMHd6xjWlBw5ji56hinsTu0b77q8OATPnANuREV4CZ9bc0Mwj
 cFKGHif2lBAlDrA4Z2VBnIqiNUcx3OkH3OU/hKnA9Nqe9O3qt/u+7bz7X2HsoXZxikweHLm8srG
 JPX0Q7TuinMJL7HMoZhGD+M6GPnn6
X-Received: by 2002:adf:dc90:0:b0:2c5:4c1f:3c9 with SMTP id
 r16-20020adfdc90000000b002c54c1f03c9mr9559842wrj.49.1678225843001; 
 Tue, 07 Mar 2023 13:50:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+uVPmsd4FkYozdPgfD3LO/a/Iz7EnaE1PW2RaXdbG/aTax4E/3JZNF5gCuRxnqwggEuHOsiw==
X-Received: by 2002:adf:dc90:0:b0:2c5:4c1f:3c9 with SMTP id
 r16-20020adfdc90000000b002c54c1f03c9mr9559834wrj.49.1678225842666; 
 Tue, 07 Mar 2023 13:50:42 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j2-20020a5d6042000000b002c70d269b4esm13305988wrt.91.2023.03.07.13.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:50:42 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/format-helper: Make conversion_buf_size() support
 sub-byte pixel fmts
Date: Tue,  7 Mar 2023 22:50:39 +0100
Message-Id: <20230307215039.346863-1-javierm@redhat.com>
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

Instead, calculate it by using the bits per pixel (bpp) and divide it by 8
to account for formats that have sub-byte pixels.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
Tested by making sure that the following command still succeeds:

./tools/testing/kunit/kunit.py run \
--kunitconfig=drivers/gpu/drm/tests/.kunitconfig

Changes in v2:
- Drop an unused variable, that was pointed out by the kernel robot.

 drivers/gpu/drm/tests/drm_format_helper_test.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 9536829c6e3a..84b5cc29c8fc 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -409,12 +409,15 @@ static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
 				  const struct drm_rect *clip)
 {
 	const struct drm_format_info *dst_fi = drm_format_info(dst_format);
+	unsigned int bpp;
 
 	if (!dst_fi)
 		return -EINVAL;
 
-	if (!dst_pitch)
-		dst_pitch = drm_rect_width(clip) * dst_fi->cpp[0];
+	if (!dst_pitch) {
+		bpp = drm_format_info_bpp(dst_fi, 0);
+		dst_pitch = DIV_ROUND_UP(drm_rect_width(clip) * bpp, 8);
+	}
 
 	return dst_pitch * drm_rect_height(clip);
 }
-- 
2.39.2

