Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A2EAC04EC
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 08:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81FA9B03B;
	Thu, 22 May 2025 06:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3909D9AFB5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 06:55:48 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-FO8RV3zxP3yLzQsnx7yiZA-1; Thu,
 22 May 2025 02:55:44 -0400
X-MC-Unique: FO8RV3zxP3yLzQsnx7yiZA-1
X-Mimecast-MFC-AGG-ID: FO8RV3zxP3yLzQsnx7yiZA_1747896943
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0631E1800368; Thu, 22 May 2025 06:55:43 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 01A721958014; Thu, 22 May 2025 06:55:40 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 7/9] drm: avoid accessing iosys_map internals.
Date: Thu, 22 May 2025 16:52:16 +1000
Message-ID: <20250522065519.318013-8-airlied@gmail.com>
In-Reply-To: <20250522065519.318013-1-airlied@gmail.com>
References: <20250522065519.318013-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hHz6eVH57xk5007Pxodeayf5uOYBln7LqZNWx4hkDDU_1747896943
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
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

This avoids directly accessing the iosys_map internals using new interfaces=
.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/drm_cache.c                   | 28 +++++++++----------
 drivers/gpu/drm/drm_fbdev_shmem.c             |  4 +--
 drivers/gpu/drm/drm_format_helper.c           | 16 +++++------
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c     |  2 +-
 .../gpu/drm/tests/drm_format_helper_test.c    | 26 ++++++++---------
 5 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 7051c9c909c2..8945d32d26d8 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -215,12 +215,12 @@ static void memcpy_fallback(struct iosys_map *dst,
 =09=09=09    const struct iosys_map *src,
 =09=09=09    unsigned long len)
 {
-=09if (!dst->is_iomem && !src->is_iomem) {
-=09=09memcpy(dst->vaddr, src->vaddr, len);
-=09} else if (!src->is_iomem) {
-=09=09iosys_map_memcpy_to(dst, 0, src->vaddr, len);
-=09} else if (!dst->is_iomem) {
-=09=09memcpy_fromio(dst->vaddr, src->vaddr_iomem, len);
+=09if (!iosys_map_is_iomem(dst) && !iosys_map_is_iomem(src)) {
+=09=09memcpy(iosys_map_ptr(dst), iosys_map_ptr(src), len);
+=09} else if (iosys_map_is_iomem(src)) {
+=09=09iosys_map_memcpy_to(dst, 0, iosys_map_ptr(src), len);
+=09} else if (!iosys_map_is_iomem(dst)) {
+=09=09memcpy_fromio(iosys_map_ptr(dst), iosys_map_ioptr(src), len);
 =09} else {
 =09=09/*
 =09=09 * Bounce size is not performance tuned, but using a
@@ -228,8 +228,8 @@ static void memcpy_fallback(struct iosys_map *dst,
 =09=09 * resorting to ioreadxx() + iowritexx().
 =09=09 */
 =09=09char bounce[MEMCPY_BOUNCE_SIZE];
-=09=09void __iomem *_src =3D src->vaddr_iomem;
-=09=09void __iomem *_dst =3D dst->vaddr_iomem;
+=09=09void __iomem *_src =3D iosys_map_ioptr(src);
+=09=09void __iomem *_dst =3D iosys_map_ioptr(dst);
=20
 =09=09while (len >=3D MEMCPY_BOUNCE_SIZE) {
 =09=09=09memcpy_fromio(bounce, _src, MEMCPY_BOUNCE_SIZE);
@@ -312,12 +312,12 @@ void drm_memcpy_from_wc(struct iosys_map *dst,
 =09}
=20
 =09if (static_branch_likely(&has_movntdqa)) {
-=09=09__drm_memcpy_from_wc(dst->is_iomem ?
-=09=09=09=09     (void __force *)dst->vaddr_iomem :
-=09=09=09=09     dst->vaddr,
-=09=09=09=09     src->is_iomem ?
-=09=09=09=09     (void const __force *)src->vaddr_iomem :
-=09=09=09=09     src->vaddr,
+=09=09__drm_memcpy_from_wc(iosys_map_is_iomem(dst) ?
+=09=09=09=09     (void __force *)iosys_map_ioptr(dst) :
+=09=09=09=09     iosys_map_ptr(dst),
+=09=09=09=09     iosys_map_is_iomem(src) ?
+=09=09=09=09     (void const __force *)iosys_map_ioptr(src) :
+=09=09=09=09     iosys_map_ptr(src),
 =09=09=09=09     len);
 =09=09return;
 =09}
diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_=
shmem.c
index f824369baacd..d45b6826138b 100644
--- a/drivers/gpu/drm/drm_fbdev_shmem.c
+++ b/drivers/gpu/drm/drm_fbdev_shmem.c
@@ -159,7 +159,7 @@ int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_he=
lper *fb_helper,
 =09ret =3D drm_client_buffer_vmap(buffer, &map);
 =09if (ret) {
 =09=09goto err_drm_client_buffer_delete;
-=09} else if (drm_WARN_ON(dev, map.is_iomem)) {
+=09} else if (drm_WARN_ON(dev, iosys_map_is_iomem(&map))) {
 =09=09ret =3D -ENODEV; /* I/O memory not supported; use generic emulation =
*/
 =09=09goto err_drm_client_buffer_delete;
 =09}
@@ -183,7 +183,7 @@ int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_he=
lper *fb_helper,
 =09if (!shmem->map_wc)
 =09=09info->flags |=3D FBINFO_READS_FAST; /* signal caching */
 =09info->screen_size =3D sizes->surface_height * fb->pitches[0];
-=09info->screen_buffer =3D map.vaddr;
+=09info->screen_buffer =3D iosys_map_ptr(&map);
 =09info->fix.smem_len =3D info->screen_size;
=20
 =09/* deferred I/O */
diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_form=
at_helper.c
index d36e6cacc575..cccec04bec4e 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -236,13 +236,13 @@ static int drm_fb_xfrm(struct iosys_map *dst,
 =09=09dst_pitch =3D default_dst_pitch;
=20
 =09/* TODO: handle src in I/O memory here */
-=09if (dst[0].is_iomem)
-=09=09return __drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], dst_pixs=
ize[0],
-=09=09=09=09=09  src[0].vaddr, fb, clip, vaddr_cached_hint, state,
+=09if (iosys_map_is_iomem(&dst[0]))
+=09=09return __drm_fb_xfrm_toio(iosys_map_ioptr(&dst[0]), dst_pitch[0], ds=
t_pixsize[0],
+=09=09=09=09=09  iosys_map_ptr(&src[0]), fb, clip, vaddr_cached_hint, stat=
e,
 =09=09=09=09=09  xfrm_line);
 =09else
-=09=09return __drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
-=09=09=09=09     src[0].vaddr, fb, clip, vaddr_cached_hint, state,
+=09=09return __drm_fb_xfrm(iosys_map_ptr(&dst[0]), dst_pitch[0], dst_pixsi=
ze[0],
+=09=09=09=09     iosys_map_ptr(&src[0]), fb, clip, vaddr_cached_hint, stat=
e,
 =09=09=09=09     xfrm_line);
 }
=20
@@ -438,7 +438,7 @@ void drm_fb_memcpy(struct iosys_map *dst, const unsigne=
d int *dst_pitch,
 =09=09iosys_map_incr(&src_i, clip_offset(clip, fb->pitches[i], cpp_i));
 =09=09for (y =3D 0; y < lines; y++) {
 =09=09=09/* TODO: handle src_i in I/O memory here */
-=09=09=09iosys_map_memcpy_to(&dst_i, 0, src_i.vaddr, len_i);
+=09=09=09iosys_map_memcpy_to(&dst_i, 0, iosys_map_ptr(&src_i), len_i);
 =09=09=09iosys_map_incr(&src_i, fb->pitches[i]);
 =09=09=09iosys_map_incr(&dst_i, dst_pitch_i);
 =09=09}
@@ -1204,10 +1204,10 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst,=
 const unsigned int *dst_pitc
 =09unsigned int cpp =3D fb->format->cpp[0];
 =09unsigned int len_src32 =3D linepixels * cpp;
 =09struct drm_device *dev =3D fb->dev;
-=09void *vaddr =3D src[0].vaddr;
+=09void *vaddr =3D iosys_map_ptr(&src[0]);
 =09unsigned int dst_pitch_0;
 =09unsigned int y;
-=09u8 *mono =3D dst[0].vaddr, *gray8;
+=09u8 *mono =3D iosys_map_ptr(&dst[0]), *gray8;
 =09u32 *src32;
=20
 =09if (drm_WARN_ON(dev, fb->format->format !=3D DRM_FORMAT_XRGB8888))
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sy=
sfb/drm_sysfb_modeset.c
index ffaa2522ab96..0e1e1df22426 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
@@ -138,7 +138,7 @@ void drm_sysfb_plane_helper_atomic_disable(struct drm_p=
lane *plane,
 =09struct drm_sysfb_device *sysfb =3D to_drm_sysfb_device(dev);
 =09struct iosys_map dst =3D sysfb->fb_addr;
 =09struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_state(=
state, plane);
-=09void __iomem *dst_vmap =3D dst.vaddr_iomem; /* TODO: Use mapping abstra=
ction */
+=09void __iomem *dst_vmap =3D iosys_map_ioptr(&dst); /* TODO: Use mapping =
abstraction */
 =09unsigned int dst_pitch =3D sysfb->fb_pitch;
 =09const struct drm_format_info *dst_format =3D sysfb->fb_format;
 =09struct drm_rect dst_clip;
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/d=
rm/tests/drm_format_helper_test.c
index 35cd3405d045..c714dc57d216 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -739,13 +739,13 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kun=
it *test)
 =09buf =3D le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / si=
zeof(__le16));
 =09KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
=20
-=09buf =3D dst.vaddr; /* restore original value of buf */
+=09buf =3D iosys_map_ptr(&dst); /* restore original value of buf */
 =09drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params-=
>clip,
 =09=09=09=09  &fmtcnv_state, true);
 =09buf =3D le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / si=
zeof(__le16));
 =09KUNIT_EXPECT_MEMEQ(test, buf, result->expected_swab, dst_size);
=20
-=09buf =3D dst.vaddr;
+=09buf =3D iosys_map_ptr(&dst);
 =09memset(buf, 0, dst_size);
=20
 =09int blit_result =3D 0;
@@ -792,7 +792,7 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kun=
it *test)
 =09buf =3D le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / si=
zeof(__le16));
 =09KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
=20
-=09buf =3D dst.vaddr; /* restore original value of buf */
+=09buf =3D iosys_map_ptr(&dst); /* restore original value of buf */
 =09memset(buf, 0, dst_size);
=20
 =09int blit_result =3D 0;
@@ -839,7 +839,7 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kun=
it *test)
 =09buf =3D le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / si=
zeof(__le16));
 =09KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
=20
-=09buf =3D dst.vaddr; /* restore original value of buf */
+=09buf =3D iosys_map_ptr(&dst); /* restore original value of buf */
 =09memset(buf, 0, dst_size);
=20
 =09int blit_result =3D 0;
@@ -886,7 +886,7 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kun=
it *test)
 =09buf =3D le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / si=
zeof(__le16));
 =09KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
=20
-=09buf =3D dst.vaddr; /* restore original value of buf */
+=09buf =3D iosys_map_ptr(&dst); /* restore original value of buf */
 =09memset(buf, 0, dst_size);
=20
 =09int blit_result =3D 0;
@@ -936,7 +936,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit=
 *test)
 =09drm_fb_xrgb8888_to_rgb888(&dst, dst_pitch, &src, &fb, &params->clip, &f=
mtcnv_state);
 =09KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
=20
-=09buf =3D dst.vaddr; /* restore original value of buf */
+=09buf =3D iosys_map_ptr(&dst); /* restore original value of buf */
 =09memset(buf, 0, dst_size);
=20
 =09int blit_result =3D 0;
@@ -982,7 +982,7 @@ static void drm_test_fb_xrgb8888_to_bgr888(struct kunit=
 *test)
 =09=09=09=09  &fmtcnv_state);
 =09KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
=20
-=09buf =3D dst.vaddr; /* restore original value of buf */
+=09buf =3D iosys_map_ptr(&dst); /* restore original value of buf */
 =09memset(buf, 0, dst_size);
=20
 =09int blit_result =3D 0;
@@ -1027,7 +1027,7 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct k=
unit *test)
 =09buf =3D le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / si=
zeof(u32));
 =09KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
=20
-=09buf =3D dst.vaddr; /* restore original value of buf */
+=09buf =3D iosys_map_ptr(&dst); /* restore original value of buf */
 =09memset(buf, 0, dst_size);
=20
 =09int blit_result =3D 0;
@@ -1074,7 +1074,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struc=
t kunit *test)
 =09buf =3D le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
 =09KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
=20
-=09buf =3D dst.vaddr; /* restore original value of buf */
+=09buf =3D iosys_map_ptr(&dst); /* restore original value of buf */
 =09memset(buf, 0, dst_size);
=20
 =09int blit_result =3D 0;
@@ -1119,7 +1119,7 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struc=
t kunit *test)
 =09buf =3D le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / si=
zeof(u32));
 =09KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
=20
-=09buf =3D dst.vaddr; /* restore original value of buf */
+=09buf =3D iosys_map_ptr(&dst); /* restore original value of buf */
 =09memset(buf, 0, dst_size);
=20
 =09int blit_result =3D 0;
@@ -1199,7 +1199,7 @@ static void drm_test_fb_swab(struct kunit *test)
 =09buf =3D le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / si=
zeof(u32));
 =09KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
=20
-=09buf =3D dst.vaddr; /* restore original value of buf */
+=09buf =3D iosys_map_ptr(&dst); /* restore original value of buf */
 =09memset(buf, 0, dst_size);
=20
 =09int blit_result;
@@ -1211,7 +1211,7 @@ static void drm_test_fb_swab(struct kunit *test)
 =09KUNIT_EXPECT_FALSE(test, blit_result);
 =09KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
=20
-=09buf =3D dst.vaddr;
+=09buf =3D iosys_map_ptr(&dst);
 =09memset(buf, 0, dst_size);
=20
 =09blit_result =3D drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_BGRX8888, &src,=
 &fb, &params->clip,
@@ -1221,7 +1221,7 @@ static void drm_test_fb_swab(struct kunit *test)
 =09KUNIT_EXPECT_FALSE(test, blit_result);
 =09KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
=20
-=09buf =3D dst.vaddr;
+=09buf =3D iosys_map_ptr(&dst);
 =09memset(buf, 0, dst_size);
=20
 =09struct drm_format_info mock_format =3D *fb.format;
--=20
2.49.0

