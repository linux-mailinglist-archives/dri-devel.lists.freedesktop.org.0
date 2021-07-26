Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8845F3D549A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 09:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F896E038;
	Mon, 26 Jul 2021 07:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96BB6E038
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 07:49:15 +0000 (UTC)
Date: Mon, 26 Jul 2021 07:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1627285752;
 bh=5CER2qxtsgvukgDtiyEMB9HliqXlv4tNN5jhBGwNTOU=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=THnFonXX/0Pc3icODIToL6rhoYxW126awMU+UnfNUmfYn7PG/OBd2ZSCMvUP3AWGi
 4zW0mrI07xbF6Yy7JyCByGb3oto7rbO0x5LK+MNa0WBbEQe3YNQGX/d89qxstjz5mK
 5uf1QxofxfX9ahan0Xje5XUL3fxudK0HGs50CEZP5Bc8eIbvIlNgpTMtXdxQh9d5N6
 HxWZ9vmRcq55bAH3gt75XyfSRSJqyiDq0N84u8mE0F5QQuK/ygOIDyZFqJ4rwaK7tQ
 EEBDjgdjwpdVf8syoSqdH7wrEOr9pTtkC+uHhFD6Y+39iIPaf32uXSVlWz+KFwrHjv
 DQSiMNmhz228g==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2] drm: add logging for RMFB ioctl
Message-ID: <EghsoRDcn1SJV0nxVqRCisPd7v0627yLZbBjn4A8Yg@cp3-web-048.plabs.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We already have logging for ADDFB2. Add some logging for RMFB as
well.

This can be handy when trying to find out why a CRTC gets magically
disabled.

v2: make log message more explicit, add log messages to
drm_framebuffer_remove (Daniel)

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_framebuffer.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_frameb=
uffer.c
index 4d01464b6f95..d3d09aba9833 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -404,6 +404,9 @@ static void drm_mode_rmfb_work_fn(struct work_struct *w=
)
 =09=09struct drm_framebuffer *fb =3D
 =09=09=09list_first_entry(&arg->fbs, typeof(*fb), filp_head);
=20
+=09=09drm_dbg_kms(fb->dev,
+=09=09=09    "Removing [FB:%d] from all active usage due to RMFB ioctl\n",
+=09=09=09    fb->base.id);
 =09=09list_del_init(&fb->filp_head);
 =09=09drm_framebuffer_remove(fb);
 =09}
@@ -981,6 +984,10 @@ static int atomic_remove_fb(struct drm_framebuffer *fb=
)
 =09=09if (plane->state->fb !=3D fb)
 =09=09=09continue;
=20
+=09=09drm_dbg_kms(dev,
+=09=09=09    "Disabling [PLANE:%d:%s] because [FB:%d] is removed\n",
+=09=09=09    plane->base.id, plane->name, fb->base.id);
+
 =09=09plane_state =3D drm_atomic_get_plane_state(state, plane);
 =09=09if (IS_ERR(plane_state)) {
 =09=09=09ret =3D PTR_ERR(plane_state);
@@ -990,6 +997,11 @@ static int atomic_remove_fb(struct drm_framebuffer *fb=
)
 =09=09if (disable_crtcs && plane_state->crtc->primary =3D=3D plane) {
 =09=09=09struct drm_crtc_state *crtc_state;
=20
+=09=09=09drm_dbg_kms(dev,
+=09=09=09=09    "Disabling [CRTC:%d:%s] because [FB:%d] is removed\n",
+=09=09=09=09    plane_state->crtc->base.id,
+=09=09=09=09    plane_state->crtc->name, fb->base.id);
+
 =09=09=09crtc_state =3D drm_atomic_get_existing_crtc_state(state, plane_st=
ate->crtc);
=20
 =09=09=09ret =3D drm_atomic_add_affected_connectors(state, plane_state->cr=
tc);
@@ -1052,6 +1064,10 @@ static void legacy_remove_fb(struct drm_framebuffer =
*fb)
 =09/* remove from any CRTC */
 =09drm_for_each_crtc(crtc, dev) {
 =09=09if (crtc->primary->fb =3D=3D fb) {
+=09=09=09drm_dbg_kms(dev,
+=09=09=09=09    "Disabling [CRTC:%d:%s] because [FB:%d] is removed\n",
+=09=09=09=09    crtc->base.id, crtc->name, fb->base.id);
+
 =09=09=09/* should turn off the crtc */
 =09=09=09if (drm_crtc_force_disable(crtc))
 =09=09=09=09DRM_ERROR("failed to reset crtc %p when fb was deleted\n", crt=
c);
@@ -1059,8 +1075,12 @@ static void legacy_remove_fb(struct drm_framebuffer =
*fb)
 =09}
=20
 =09drm_for_each_plane(plane, dev) {
-=09=09if (plane->fb =3D=3D fb)
+=09=09if (plane->fb =3D=3D fb) {
+=09=09=09drm_dbg_kms(dev,
+=09=09=09=09    "Disabling [PLANE:%d:%s] because [FB:%d] is removed\n",
+=09=09=09=09    plane->base.id, plane->name, fb->base.id);
 =09=09=09drm_plane_force_disable(plane);
+=09=09}
 =09}
 =09drm_modeset_unlock_all(dev);
 }
--=20
2.32.0


