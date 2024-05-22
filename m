Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC6C8CBAC5
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 07:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D3C10E6D2;
	Wed, 22 May 2024 05:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAC810E6D2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 05:44:33 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-IruGFEF_N2CsFYYbOeGzOw-1; Wed, 22 May 2024 01:44:30 -0400
X-MC-Unique: IruGFEF_N2CsFYYbOeGzOw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E595E8008A4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 05:44:29 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EDEE200A35C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 05:44:28 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/tests: fix drm_test_fb_xrgb8888_to_xrgb2101010 on big
 endian
Date: Wed, 22 May 2024 15:44:27 +1000
Message-ID: <20240522054427.3393986-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This test is failing for me on s390x and there is a report on the list from=
 ppc64.

This aligns it with the argb test that doesn't fail.

Fixes: 15bda1f8de5d ("drm/tests: Add calls to drm_fb_blit() on supported fo=
rmat conversion tests")
Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/d=
rm/tests/drm_format_helper_test.c
index 08992636ec05..d4ce2d7ced4e 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -991,7 +991,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct =
kunit *test)
 =09=09NULL : &result->dst_pitch;
=20
 =09drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->cli=
p, &fmtcnv_state);
-=09buf =3D le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
+=09buf =3D le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / si=
zeof(u32));
 =09KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
=20
 =09buf =3D dst.vaddr; /* restore original value of buf */
@@ -1002,6 +1002,8 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struc=
t kunit *test)
 =09blit_result =3D drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB2101010, &s=
rc, &fb,
 =09=09=09=09  &params->clip, &fmtcnv_state);
=20
+=09buf =3D le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / si=
zeof(u32));
+
 =09KUNIT_EXPECT_FALSE(test, blit_result);
 =09KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
--=20
2.44.0

