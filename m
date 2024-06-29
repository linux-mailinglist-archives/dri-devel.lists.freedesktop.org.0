Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C29691CDD3
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 17:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C62210E05D;
	Sat, 29 Jun 2024 15:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="FgIKxduR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F64B10E027
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1719674538; x=1719933738;
 bh=ZaQhQB+792NPrPd8uwNUfcKNjPfomxO+GXrTpIqDgco=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=FgIKxduRdapOEcFGyMQuJn+ts8oY2DLEx7NJFojsAKmvau4t57huwncLV97+1F50m
 N0hL+0hvw9vJSUcunRRLvF1H1jWcCSU2SUNbmQgLoCSEzY5mIUOa0Tya1sW2pgZlPK
 DtCXWiNIvT3tGH0OaT50RZQ97OrwZM2t9sOzPNo4zuU+NOndsAsqjHOjOcCbUETgur
 xzOCF1s/PVrlc0dk5aKaT+MT+ztQ1P1mPGiBBz2NhyV25BbZ0ZZGC+o+JpJ60yXVNR
 e2S8r9RIbke8SwTfTfYbNE/JRN2/EwvMhZm4rxScYmyq+nhbKQRnPnxkIOzOvc8wlY
 PnYp9bbfggBDQ==
Date: Sat, 29 Jun 2024 15:22:12 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/atomic: allow no-op FB_ID updates for async flips
Message-ID: <20240629152204.666748-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 940e41555372456f3719021107a12b9e71bab594
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
Cc: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Michel D=C3=A4nzer <michel.daenzer@mailbox.org>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c
index 22bbb2d83e30..1764bb0dbbdf 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1070,21 +1070,14 @@ int drm_atomic_set_property(struct drm_atomic_state=
 *state,
 =09=09=09break;
 =09=09}
=20
-=09=09if (async_flip && prop !=3D config->prop_fb_id) {
+=09=09if (async_flip && (prop !=3D config->prop_fb_id ||
+=09=09=09=09   plane_state->plane->type !=3D DRM_PLANE_TYPE_PRIMARY)) {
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
2.45.2


