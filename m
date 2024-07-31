Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C9C943610
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 21:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6C610E6B9;
	Wed, 31 Jul 2024 19:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="lXDMqR8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEE510E6B9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 19:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1722453027; x=1722712227;
 bh=eCpNChI+KuE5oDd2sSaMRGXR9eveNhpe5ODTDylH2Ec=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=lXDMqR8KoorB9D0tGrCNsHu662sLUzq85FvRIKvcYsc5aaiWzEMu3ol2f7gU7Ue1n
 qWkp6CFO75miz4qUyfX499YKZizhpUWGFNuT2fYHLPq+ydrUuVff9t1bFJNOsP4Jnp
 cGuWvphDJ55IsnnbMf0va13+8a4zvfV+u2+pvOGy/fwFYkrQMtzgwYLu2xrzL1nsav
 89WrEs2xZqB2Aywnw7hYna9IfdDLZibQp0xRXjdsmSVx5Fa2qSgMBxcp/J2JlwQ1Yu
 qB4G3+6K0yLmi19ROGLNopSiE/yu6OUpzhN8A1LccbjK8ZGNk4CXDe4OzbP2BiCESP
 L9sPBxZvg9I3g==
Date: Wed, 31 Jul 2024 19:10:20 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Xaver Hugl <xaver.hugl@kde.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2] drm/atomic: allow no-op FB_ID updates for async flips
Message-ID: <20240731191014.878320-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 69b5f55c97e03c9f3202fa35f871f58410e63ef5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

User-space is allowed to submit any property in an async flip as
long as the value doesn't change. However we missed one case:
as things stand, the kernel rejects no-op FB_ID changes on
non-primary planes. Fix this by changing the conditional and
skipping drm_atomic_check_prop_changes() only for FB_ID on the
primary plane (instead of skipping for FB_ID on any plane).

Fixes: 0e26cc72c71c ("drm: Refuse to async flip with atomic prop changes")
Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Tested-by: Xaver Hugl <xaver.hugl@kde.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Michel D=C3=A4nzer <michel.daenzer@mailbox.org>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
---

Andr=C3=A9, can you confirm that the R-b still holds?

 drivers/gpu/drm/drm_atomic_uapi.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c
index 7609c798d73d..7936c2023955 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1071,23 +1071,16 @@ int drm_atomic_set_property(struct drm_atomic_state=
 *state,
 =09=09}
=20
 =09=09if (async_flip &&
-=09=09    prop !=3D config->prop_fb_id &&
-=09=09    prop !=3D config->prop_in_fence_fd &&
-=09=09    prop !=3D config->prop_fb_damage_clips) {
+=09=09    (plane_state->plane->type !=3D DRM_PLANE_TYPE_PRIMARY ||
+=09=09     (prop !=3D config->prop_fb_id &&
+=09=09      prop !=3D config->prop_in_fence_fd &&
+=09=09      prop !=3D config->prop_fb_damage_clips))) {
 =09=09=09ret =3D drm_atomic_plane_get_property(plane, plane_state,
 =09=09=09=09=09=09=09    prop, &old_val);
 =09=09=09ret =3D drm_atomic_check_prop_changes(ret, old_val, prop_value, p=
rop);
 =09=09=09break;
 =09=09}
=20
-=09=09if (async_flip && plane_state->plane->type !=3D DRM_PLANE_TYPE_PRIMA=
RY) {
-=09=09=09drm_dbg_atomic(prop->dev,
-=09=09=09=09       "[OBJECT:%d] Only primary planes can be changed during =
async flip\n",
-=09=09=09=09       obj->id);
-=09=09=09ret =3D -EINVAL;
-=09=09=09break;
-=09=09}
-
 =09=09ret =3D drm_atomic_plane_set_property(plane,
 =09=09=09=09plane_state, file_priv,
 =09=09=09=09prop, prop_value);
--=20
2.46.0


