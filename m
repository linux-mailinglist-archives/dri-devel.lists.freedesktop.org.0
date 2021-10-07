Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5374253DE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 15:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BED46F474;
	Thu,  7 Oct 2021 13:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33F16F474
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 13:15:36 +0000 (UTC)
Date: Thu, 07 Oct 2021 13:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1633612534;
 bh=rxEmWpYLcvAIw8O1G2R9Z9GrIirKJgiKi8fPXVaP4Ek=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=pgkLoIVCGAEgV7phRLWD/F3Jkmp47QuOTYcQoVf05q5MDyJcYUfVaTxqT+6QVnfjd
 y0BbbOZB3DniznrsKYPYTHMX0QyOIOr+F/kK6qXIaGUEmqm3613p234EGxqit08i9F
 M2yZdfSdNPJ75c6GoFIqV6aTaF7L6H4gCRfDztQlz2kREfc+FdBOAlic5pFtYiVl6s
 ZvOYegsm9DOZErxIUoNKhAakslsYoyD0eAdyZC5arXxbKhsSy96HUeqqTaGbMEWYXU
 O/upGyDpWkpx56eMHA+9zwCE+V4eUwDPenxkBp4uSBphFFmyIACRTZImLggy22DSQo
 yPS3AA/y0Ns/g==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Hans de Goede <hdegoede@redhat.com>, Dennis Filder <d.filder@web.de>,
 Daniel Vetter <daniel@ffwll.ch>, Pekka Paalanen <ppaalanen@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH RFC 1/2] drm: extract closefb logic in separate function
Message-ID: <20211007131507.149734-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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

drm_mode_rmfb performs two operations: drop the FB from the
file_priv->fbs list, and make sure the FB is no longer used on a
plane.

In the next commit an IOCTL which only does so former will be
introduced, so let's split it into a separate function.

No functional change, only refactoring.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Dennis Filder <d.filder@web.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_framebuffer.c | 51 +++++++++++++++++++------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_frameb=
uffer.c
index 07f5abc875e9..2352972ba6ac 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -412,6 +412,31 @@ static void drm_mode_rmfb_work_fn(struct work_struct *=
w)
 =09}
 }
=20
+static int drm_mode_closefb(struct drm_framebuffer *fb,
+=09=09=09    struct drm_file *file_priv)
+{
+=09struct drm_framebuffer *fbl =3D NULL;
+=09bool found =3D false;
+
+=09mutex_lock(&file_priv->fbs_lock);
+=09list_for_each_entry(fbl, &file_priv->fbs, filp_head)
+=09=09if (fb =3D=3D fbl)
+=09=09=09found =3D true;
+
+=09if (!found) {
+=09=09mutex_unlock(&file_priv->fbs_lock);
+=09=09return -ENOENT;
+=09}
+
+=09list_del_init(&fb->filp_head);
+=09mutex_unlock(&file_priv->fbs_lock);
+
+=09/* Drop the reference that was stored in the fbs list */
+=09drm_framebuffer_put(fb);
+
+=09return 0;
+}
+
 /**
  * drm_mode_rmfb - remove an FB from the configuration
  * @dev: drm device
@@ -429,8 +454,7 @@ int drm_mode_rmfb(struct drm_device *dev, u32 fb_id,
 =09=09  struct drm_file *file_priv)
 {
 =09struct drm_framebuffer *fb =3D NULL;
-=09struct drm_framebuffer *fbl =3D NULL;
-=09int found =3D 0;
+=09int ret;
=20
 =09if (!drm_core_check_feature(dev, DRIVER_MODESET))
 =09=09return -EOPNOTSUPP;
@@ -439,23 +463,14 @@ int drm_mode_rmfb(struct drm_device *dev, u32 fb_id,
 =09if (!fb)
 =09=09return -ENOENT;
=20
-=09mutex_lock(&file_priv->fbs_lock);
-=09list_for_each_entry(fbl, &file_priv->fbs, filp_head)
-=09=09if (fb =3D=3D fbl)
-=09=09=09found =3D 1;
-=09if (!found) {
-=09=09mutex_unlock(&file_priv->fbs_lock);
-=09=09goto fail_unref;
+=09ret =3D drm_mode_closefb(fb, file_priv);
+=09if (ret !=3D 0) {
+=09=09drm_framebuffer_put(fb);
+=09=09return ret;
 =09}
=20
-=09list_del_init(&fb->filp_head);
-=09mutex_unlock(&file_priv->fbs_lock);
-
-=09/* drop the reference we picked up in framebuffer lookup */
-=09drm_framebuffer_put(fb);
-
 =09/*
-=09 * we now own the reference that was stored in the fbs list
+=09 * We now own the reference we picked up in drm_framebuffer_lookup.
 =09 *
 =09 * drm_framebuffer_remove may fail with -EINTR on pending signals,
 =09 * so run this in a separate stack as there's no way to correctly
@@ -475,10 +490,6 @@ int drm_mode_rmfb(struct drm_device *dev, u32 fb_id,
 =09=09drm_framebuffer_put(fb);
=20
 =09return 0;
-
-fail_unref:
-=09drm_framebuffer_put(fb);
-=09return -ENOENT;
 }
=20
 int drm_mode_rmfb_ioctl(struct drm_device *dev,
--=20
2.33.0


