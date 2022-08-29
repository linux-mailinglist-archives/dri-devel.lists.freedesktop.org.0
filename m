Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 365285A4FF9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 17:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1808510F3B7;
	Mon, 29 Aug 2022 15:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1183410F391
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 15:15:11 +0000 (UTC)
Date: Mon, 29 Aug 2022 15:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661786108; x=1662045308;
 bh=8M/nzKdEyABlpDRuxr/NSz0hrQDY0sdw/OAw7Rma17M=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=N4/8WbZYJa+sIHY19Am5RdnLF2sHb+mVR0IKoVNJggYfwjjfTyA7CyIm5CDqkTk7U
 fBji0aIBNQ9RFOctPXaAxoL+2m4TW4TqWWK6b6VZJ23VaS4rOG7LPJ9Cn+FOj6pe2/
 HznArkmMn1HiabNOBKkN6pDhTdR4s56p6BrUEI29AJBKqSheYwyeIOuGrf44xFVFwb
 zwSIBitSTR1BoB/ZNVIwJ3RY5Mu8leIbWcDWV1l0QS2MSMzwnX+ger0h0P/aPaRKk4
 ysJlKLolvft4RAKvx9L6Asql12SzRbIlVaO2hS2W1bFr7pZ6C7hLlnO/e6PlOBn95R
 HCTRsqmfMOrWQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 2/3] drm/atomic-helper: log EINVAL cause in
 drm_atomic_helper_async_check()
Message-ID: <20220829151451.152114-2-contact@emersion.fr>
In-Reply-To: <20220829151451.152114-1-contact@emersion.fr>
References: <20220829151451.152114-1-contact@emersion.fr>
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

v2: add missing newlines

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 32 +++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atom=
ic_helper.c
index 4aa05b626b57..d36720f419f7 100644
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
+=09=09=09       "[PLANE:%d:%s] driver async check failed\n",
+=09=09=09       plane->base.id, plane->name);
+=09return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_async_check);
=20
--=20
2.37.2


