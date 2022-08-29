Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 130E15A4FBC
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 17:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E9910E478;
	Mon, 29 Aug 2022 15:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FAE10E478
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 15:01:27 +0000 (UTC)
Date: Mon, 29 Aug 2022 15:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661785285; x=1662044485;
 bh=qTFKahN7lW/aaijvy88ROdjHIXQQ6fz2C8TM0d8qzdU=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=RRkPuaDVsHt3ERelhvAkeNdeDt4t949z4PW0zOWB3gIsaJ2rvVkZDsVDWrD092Xre
 F/THcDV+xzMqhFxbakM28enOhx7mViRAmCgrFWk3AdTMX7DmJZjE7TB10MPPpsd4gR
 qudpcDrNCjzgFMP1QVtYSRz0WOTM+dNbMUaZHEogDFIh7NfOTJVBI7uMwg/Z0PoIc+
 r08D8f/s33K67CO4dusNCuAp89Awhm501xSiR0FPayFdXvXsUwTdP9CFOIFKstzK1Y
 p3oNWvNqVXK2UI2KK9ATn9bmghGM9VWeixrwyvQtfL0pIWtHXk+IToiiKUfXNyNK0n
 FYGX3m3BDorhQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 2/2] drm/atomic-helper: log EINVAL cause in
 drm_atomic_helper_async_check()
Message-ID: <20220829150040.125800-2-contact@emersion.fr>
In-Reply-To: <20220829150040.125800-1-contact@emersion.fr>
References: <20220829150040.125800-1-contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This can help figure out why the kernel returns EINVAL from
user-space.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 32 +++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atom=
ic_helper.c
index fbdcca3047f2..63a0e1553408 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1796,7 +1796,7 @@ int drm_atomic_helper_async_check(struct drm_device *=
dev,
 =09struct drm_plane_state *old_plane_state =3D NULL;
 =09struct drm_plane_state *new_plane_state =3D NULL;
 =09const struct drm_plane_helper_funcs *funcs;
-=09int i, n_planes =3D 0;
+=09int i, ret, n_planes =3D 0;
=20
 =09for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 =09=09if (drm_atomic_crtc_needs_modeset(crtc_state))
@@ -1807,19 +1807,34 @@ int drm_atomic_helper_async_check(struct drm_device=
 *dev,
 =09=09n_planes++;
=20
 =09/* FIXME: we support only single plane updates for now */
-=09if (n_planes !=3D 1)
+=09if (n_planes !=3D 1) {
+=09=09drm_dbg_atomic(dev,
+=09=09=09       "only single plane async updates are supported\n");
 =09=09return -EINVAL;
+=09}
=20
 =09if (!new_plane_state->crtc ||
-=09    old_plane_state->crtc !=3D new_plane_state->crtc)
+=09    old_plane_state->crtc !=3D new_plane_state->crtc) {
+=09=09drm_dbg_atomic(dev,
+=09=09=09       "[PLANE:%d:%s] async update cannot change CRTC\n",
+=09=09=09       plane->base.id, plane->name);
 =09=09return -EINVAL;
+=09}
=20
 =09funcs =3D plane->helper_private;
-=09if (!funcs->atomic_async_update)
+=09if (!funcs->atomic_async_update) {
+=09=09drm_dbg_atomic(dev,
+=09=09=09       "[PLANE:%d:%s] driver does not support async updates\n",
+=09=09=09       plane->base.id, plane->name);
 =09=09return -EINVAL;
+=09}
=20
-=09if (new_plane_state->fence)
+=09if (new_plane_state->fence) {
+=09=09drm_dbg_atomic(dev,
+=09=09=09       "[PLANE:%d:%s] missing fence for async update\n",
+=09=09=09       plane->base.id, plane->name);
 =09=09return -EINVAL;
+=09}
=20
 =09/*
 =09 * Don't do an async update if there is an outstanding commit modifying
@@ -1834,7 +1849,12 @@ int drm_atomic_helper_async_check(struct drm_device =
*dev,
 =09=09return -EBUSY;
 =09}
=20
-=09return funcs->atomic_async_check(plane, state);
+=09ret =3D funcs->atomic_async_check(plane, state);
+=09if (ret !=3D 0)
+=09=09drm_dbg_atomic(dev,
+=09=09=09       "[PLANE:%d:%s] driver async check failed",
+=09=09=09       plane->base.id, plane->name);
+=09return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_async_check);
=20
--=20
2.37.2


