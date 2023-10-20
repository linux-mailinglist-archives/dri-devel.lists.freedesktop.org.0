Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DB07D0D01
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 12:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD5010E59C;
	Fri, 20 Oct 2023 10:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8717F10E599
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 10:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1697797203; x=1698056403;
 bh=07rMiRJgi30gk3lUdpCH7G4OVGyCibe+IRGU2+HQHZo=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=B2m0aXBwUNf20+KCAGKRcV+EM0HijNx3A4pP+9m00uAho2fjVuTjNBbpxpAWwR3rc
 oOTY7FLR/5NLEtReNzqlJRC3fc4vNUY+IQ7XgNBW+kOW7vgew+vTogOBUSJ2SWI8tp
 aSo/WTSwrW1nSAjF9OAPkUMQwD1EbaYL6jMDxDDt/yLx5GdorLltGO1PpDSXBDmpVZ
 dta29KH5/jxYpZraOJ6ZAQPzexQzDi3Gx0DFA34HD6PgL0/1EGcL4V7ZBgIBqJyXEr
 pn90op5r0ShpeNqugNicwk0UzARPvBa3DTaXgVTNWKkgwgFjQzd4QhZj81qNGy693q
 uFOxdHaCnohCA==
Date: Fri, 20 Oct 2023 10:19:38 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 1/2] drm: extract closefb logic in separate function
Message-ID: <20231020101926.145327-1-contact@emersion.fr>
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
Cc: Daniel Stone <daniels@collabora.com>, Hans de Goede <hdegoede@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Dennis Filder <d.filder@web.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_mode_rmfb performs two operations: drop the FB from the
file_priv->fbs list, and make sure the FB is no longer used on a
plane.

In the next commit an IOCTL which only does so former will be
introduced, so let's split it into a separate function.

No functional change, only refactoring.

v2: no change

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Dennis Filder <d.filder@web.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Daniel Stone <daniels@collabora.com>
---
 drivers/gpu/drm/drm_framebuffer.c | 51 +++++++++++++++++++------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_frameb=
uffer.c
index d3ba0698b84b..62306196808c 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -394,6 +394,31 @@ static void drm_mode_rmfb_work_fn(struct work_struct *=
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
@@ -411,8 +436,7 @@ int drm_mode_rmfb(struct drm_device *dev, u32 fb_id,
 =09=09  struct drm_file *file_priv)
 {
 =09struct drm_framebuffer *fb =3D NULL;
-=09struct drm_framebuffer *fbl =3D NULL;
-=09int found =3D 0;
+=09int ret;
=20
 =09if (!drm_core_check_feature(dev, DRIVER_MODESET))
 =09=09return -EOPNOTSUPP;
@@ -421,23 +445,14 @@ int drm_mode_rmfb(struct drm_device *dev, u32 fb_id,
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
@@ -457,10 +472,6 @@ int drm_mode_rmfb(struct drm_device *dev, u32 fb_id,
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
2.42.0


