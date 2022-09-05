Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706995AD03A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94A810E28A;
	Mon,  5 Sep 2022 10:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1921E10E28A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:36:16 +0000 (UTC)
Date: Mon, 05 Sep 2022 10:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1662374173; x=1662633373;
 bh=PVoyDaD/9SwhRY/G357uEw53q7d2kShPQEquKt2gO3M=;
 h=Date:To:From:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
 Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=Mw5fEtkrL3EBgbKnncCVDIOJhxKprvG+8K6U/++4I4QthSaR0s6uEsYSZhv+oEwmN
 7rLTMmU6sIfAnJe1dJjF+2xhLpOcBd0Qs4617l44uEhNvV4Pyr+i88mva5lZeBej9E
 K70UL9RRe+VwDQs8qnYvfUP/Bwzi6mbfc4fyO5B8grnvzm0iOdSj8O1N72jcYc/K9o
 TC8D5OqsxA3hnZOtmO0TvFB88WTVantTu1wUw1KXIDvIOpyxKMKe3HwGN8ob3kWwIU
 5asnY4wsEyQ7eH6ArMWJKaB6eGZxVoVyW7XcvANyYWG172ul8BY1Ol2OQXYG6dP1L7
 Gqm39Nn1jHQZw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/framebuffer: convert to drm_dbg_kms()
Message-ID: <20220905103559.118561-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace DRM_DEBUG_KMS() with drm_dbg_kms() which allows specifying
the DRM device to provide more context.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/drm_framebuffer.c | 66 +++++++++++++++----------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_frameb=
uffer.c
index 185b04762e2c..2dd97473ca10 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -87,13 +87,13 @@ int drm_framebuffer_check_src_coords(uint32_t src_x, ui=
nt32_t src_y,
 =09    src_x > fb_width - src_w ||
 =09    src_h > fb_height ||
 =09    src_y > fb_height - src_h) {
-=09=09DRM_DEBUG_KMS("Invalid source coordinates "
-=09=09=09      "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
-=09=09=09      src_w >> 16, ((src_w & 0xffff) * 15625) >> 10,
-=09=09=09      src_h >> 16, ((src_h & 0xffff) * 15625) >> 10,
-=09=09=09      src_x >> 16, ((src_x & 0xffff) * 15625) >> 10,
-=09=09=09      src_y >> 16, ((src_y & 0xffff) * 15625) >> 10,
-=09=09=09      fb->width, fb->height);
+=09=09drm_dbg_kms(fb->dev, "Invalid source coordinates "
+=09=09=09    "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
+=09=09=09    src_w >> 16, ((src_w & 0xffff) * 15625) >> 10,
+=09=09=09    src_h >> 16, ((src_h & 0xffff) * 15625) >> 10,
+=09=09=09    src_x >> 16, ((src_x & 0xffff) * 15625) >> 10,
+=09=09=09    src_y >> 16, ((src_y & 0xffff) * 15625) >> 10,
+=09=09=09    fb->width, fb->height);
 =09=09return -ENOSPC;
 =09}
=20
@@ -125,7 +125,7 @@ int drm_mode_addfb(struct drm_device *dev, struct drm_m=
ode_fb_cmd *or,
=20
 =09r.pixel_format =3D drm_driver_legacy_fb_format(dev, or->bpp, or->depth)=
;
 =09if (r.pixel_format =3D=3D DRM_FORMAT_INVALID) {
-=09=09DRM_DEBUG("bad {bpp:%d, depth:%d}\n", or->bpp, or->depth);
+=09=09drm_dbg_kms(dev, "bad {bpp:%d, depth:%d}\n", or->bpp, or->depth);
 =09=09return -EINVAL;
 =09}
=20
@@ -177,18 +177,18 @@ static int framebuffer_check(struct drm_device *dev,
=20
 =09/* check if the format is supported at all */
 =09if (!__drm_format_info(r->pixel_format)) {
-=09=09DRM_DEBUG_KMS("bad framebuffer format %p4cc\n",
-=09=09=09      &r->pixel_format);
+=09=09drm_dbg_kms(dev, "bad framebuffer format %p4cc\n",
+=09=09=09    &r->pixel_format);
 =09=09return -EINVAL;
 =09}
=20
 =09if (r->width =3D=3D 0) {
-=09=09DRM_DEBUG_KMS("bad framebuffer width %u\n", r->width);
+=09=09drm_dbg_kms(dev, "bad framebuffer width %u\n", r->width);
 =09=09return -EINVAL;
 =09}
=20
 =09if (r->height =3D=3D 0) {
-=09=09DRM_DEBUG_KMS("bad framebuffer height %u\n", r->height);
+=09=09drm_dbg_kms(dev, "bad framebuffer height %u\n", r->height);
 =09=09return -EINVAL;
 =09}
=20
@@ -202,12 +202,12 @@ static int framebuffer_check(struct drm_device *dev,
 =09=09u64 min_pitch =3D drm_format_info_min_pitch(info, i, width);
=20
 =09=09if (!block_size && (r->modifier[i] =3D=3D DRM_FORMAT_MOD_LINEAR)) {
-=09=09=09DRM_DEBUG_KMS("Format requires non-linear modifier for plane %d\n=
", i);
+=09=09=09drm_dbg_kms(dev, "Format requires non-linear modifier for plane %=
d\n", i);
 =09=09=09return -EINVAL;
 =09=09}
=20
 =09=09if (!r->handles[i]) {
-=09=09=09DRM_DEBUG_KMS("no buffer object handle for plane %d\n", i);
+=09=09=09drm_dbg_kms(dev, "no buffer object handle for plane %d\n", i);
 =09=09=09return -EINVAL;
 =09=09}
=20
@@ -218,20 +218,20 @@ static int framebuffer_check(struct drm_device *dev,
 =09=09=09return -ERANGE;
=20
 =09=09if (block_size && r->pitches[i] < min_pitch) {
-=09=09=09DRM_DEBUG_KMS("bad pitch %u for plane %d\n", r->pitches[i], i);
+=09=09=09drm_dbg_kms(dev, "bad pitch %u for plane %d\n", r->pitches[i], i)=
;
 =09=09=09return -EINVAL;
 =09=09}
=20
 =09=09if (r->modifier[i] && !(r->flags & DRM_MODE_FB_MODIFIERS)) {
-=09=09=09DRM_DEBUG_KMS("bad fb modifier %llu for plane %d\n",
-=09=09=09=09      r->modifier[i], i);
+=09=09=09drm_dbg_kms(dev, "bad fb modifier %llu for plane %d\n",
+=09=09=09=09    r->modifier[i], i);
 =09=09=09return -EINVAL;
 =09=09}
=20
 =09=09if (r->flags & DRM_MODE_FB_MODIFIERS &&
 =09=09    r->modifier[i] !=3D r->modifier[0]) {
-=09=09=09DRM_DEBUG_KMS("bad fb modifier %llu for plane %d\n",
-=09=09=09=09      r->modifier[i], i);
+=09=09=09drm_dbg_kms(dev, "bad fb modifier %llu for plane %d\n",
+=09=09=09=09    r->modifier[i], i);
 =09=09=09return -EINVAL;
 =09=09}
=20
@@ -244,7 +244,7 @@ static int framebuffer_check(struct drm_device *dev,
 =09=09=09if (r->pixel_format !=3D DRM_FORMAT_NV12 ||
 =09=09=09=09=09width % 128 || height % 32 ||
 =09=09=09=09=09r->pitches[i] % 128) {
-=09=09=09=09DRM_DEBUG_KMS("bad modifier data for plane %d\n", i);
+=09=09=09=09drm_dbg_kms(dev, "bad modifier data for plane %d\n", i);
 =09=09=09=09return -EINVAL;
 =09=09=09}
 =09=09=09break;
@@ -256,7 +256,7 @@ static int framebuffer_check(struct drm_device *dev,
=20
 =09for (i =3D info->num_planes; i < 4; i++) {
 =09=09if (r->modifier[i]) {
-=09=09=09DRM_DEBUG_KMS("non-zero modifier for unused plane %d\n", i);
+=09=09=09drm_dbg_kms(dev, "non-zero modifier for unused plane %d\n", i);
 =09=09=09return -EINVAL;
 =09=09}
=20
@@ -265,17 +265,17 @@ static int framebuffer_check(struct drm_device *dev,
 =09=09=09continue;
=20
 =09=09if (r->handles[i]) {
-=09=09=09DRM_DEBUG_KMS("buffer object handle for unused plane %d\n", i);
+=09=09=09drm_dbg_kms(dev, "buffer object handle for unused plane %d\n", i)=
;
 =09=09=09return -EINVAL;
 =09=09}
=20
 =09=09if (r->pitches[i]) {
-=09=09=09DRM_DEBUG_KMS("non-zero pitch for unused plane %d\n", i);
+=09=09=09drm_dbg_kms(dev, "non-zero pitch for unused plane %d\n", i);
 =09=09=09return -EINVAL;
 =09=09}
=20
 =09=09if (r->offsets[i]) {
-=09=09=09DRM_DEBUG_KMS("non-zero offset for unused plane %d\n", i);
+=09=09=09drm_dbg_kms(dev, "non-zero offset for unused plane %d\n", i);
 =09=09=09return -EINVAL;
 =09=09}
 =09}
@@ -293,24 +293,24 @@ drm_internal_framebuffer_create(struct drm_device *de=
v,
 =09int ret;
=20
 =09if (r->flags & ~(DRM_MODE_FB_INTERLACED | DRM_MODE_FB_MODIFIERS)) {
-=09=09DRM_DEBUG_KMS("bad framebuffer flags 0x%08x\n", r->flags);
+=09=09drm_dbg_kms(dev, "bad framebuffer flags 0x%08x\n", r->flags);
 =09=09return ERR_PTR(-EINVAL);
 =09}
=20
 =09if ((config->min_width > r->width) || (r->width > config->max_width)) {
-=09=09DRM_DEBUG_KMS("bad framebuffer width %d, should be >=3D %d && <=3D %=
d\n",
-=09=09=09  r->width, config->min_width, config->max_width);
+=09=09drm_dbg_kms(dev, "bad framebuffer width %d, should be >=3D %d && <=
=3D %d\n",
+=09=09=09    r->width, config->min_width, config->max_width);
 =09=09return ERR_PTR(-EINVAL);
 =09}
 =09if ((config->min_height > r->height) || (r->height > config->max_height=
)) {
-=09=09DRM_DEBUG_KMS("bad framebuffer height %d, should be >=3D %d && <=3D =
%d\n",
-=09=09=09  r->height, config->min_height, config->max_height);
+=09=09drm_dbg_kms(dev, "bad framebuffer height %d, should be >=3D %d && <=
=3D %d\n",
+=09=09=09    r->height, config->min_height, config->max_height);
 =09=09return ERR_PTR(-EINVAL);
 =09}
=20
 =09if (r->flags & DRM_MODE_FB_MODIFIERS &&
 =09    dev->mode_config.fb_modifiers_not_supported) {
-=09=09DRM_DEBUG_KMS("driver does not support fb modifiers\n");
+=09=09drm_dbg_kms(dev, "driver does not support fb modifiers\n");
 =09=09return ERR_PTR(-EINVAL);
 =09}
=20
@@ -320,7 +320,7 @@ drm_internal_framebuffer_create(struct drm_device *dev,
=20
 =09fb =3D dev->mode_config.funcs->fb_create(dev, file_priv, r);
 =09if (IS_ERR(fb)) {
-=09=09DRM_DEBUG_KMS("could not create framebuffer\n");
+=09=09drm_dbg_kms(dev, "could not create framebuffer\n");
 =09=09return fb;
 =09}
=20
@@ -356,7 +356,7 @@ int drm_mode_addfb2(struct drm_device *dev,
 =09if (IS_ERR(fb))
 =09=09return PTR_ERR(fb);
=20
-=09DRM_DEBUG_KMS("[FB:%d]\n", fb->base.id);
+=09drm_dbg_kms(dev, "[FB:%d]\n", fb->base.id);
 =09r->fb_id =3D fb->base.id;
=20
 =09/* Transfer ownership to the filp for reaping on close */
@@ -384,7 +384,7 @@ int drm_mode_addfb2_ioctl(struct drm_device *dev,
 =09=09 * then.  So block it to make userspace fallback to
 =09=09 * ADDFB.
 =09=09 */
-=09=09DRM_DEBUG_KMS("addfb2 broken on bigendian");
+=09=09drm_dbg_kms(dev, "addfb2 broken on bigendian");
 =09=09return -EOPNOTSUPP;
 =09}
 #endif
--=20
2.37.3


