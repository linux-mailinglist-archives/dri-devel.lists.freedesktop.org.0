Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE59C5EFD4D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE1A10EC18;
	Thu, 29 Sep 2022 18:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A2D10EC15
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 18:43:47 +0000 (UTC)
Date: Thu, 29 Sep 2022 18:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1664477025; x=1664736225;
 bh=33SKfVErq6gR+NEOdkFJJrpXSp8ZP9J8+NxOHFpZ7r0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=jvRLoaazJ22W0ax+1nYdQQzxd2ypmA7i7TAjNgh/Q9xruMSWrbArfNjwdrnPLhQA4
 2/1f6NHKDz0ATF3lSaH7P3TKOpg0btLNlBNTpFL7kjN5uAyxIw6O8RzrA08/lQeQ3b
 za4wsG9UMxvS9fcwPXtdq3pKcakDjZQB4MlGp0ehuZVwkz0EFZtXN14RzZN2Wdx7pl
 FaJtU83HZ1qLaKAUVhyY+j3Uzzou2ku63lYtFCHRn5RIhMivmmxfS+PmxF9YMViMqN
 J61TuIj9eFu+YBWlgEovL+9NJLOm+hsCf2pMhJqTtivADElpvohy3zbUFJ2UWytIfh
 WVi060xdT4h0Q==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3 2/6] amd/display: only accept async flips for fast updates
Message-ID: <20220929184307.258331-3-contact@emersion.fr>
In-Reply-To: <20220929184307.258331-1-contact@emersion.fr>
References: <20220929184307.258331-1-contact@emersion.fr>
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
Cc: andrealmeid@igalia.com, daniel.vetter@ffwll.ch, mwen@igalia.com,
 alexander.deucher@amd.com, hwentlan@amd.com, nicholas.kazlauskas@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Up until now, amdgpu was silently degrading to vsync when
user-space requested an async flip but the hardware didn't support
it.

The hardware doesn't support immediate flips when the update changes
the FB pitch, the DCC state, the rotation, enables or disables CRTCs
or planes, etc. This is reflected in the dm_crtc_state.update_type
field: UPDATE_TYPE_FAST means that immediate flip is supported.

Silently degrading async flips to vsync is not the expected behavior
from a uAPI point-of-view. Xorg expects async flips to fail if
unsupported, to be able to fall back to a blit. i915 already behaves
this way.

This patch aligns amdgpu with uAPI expectations and returns a failure
when an async flip is not possible.

v2: new patch

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c      |  8 ++++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7b19f444624c..44235345fd57 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7629,7 +7629,15 @@ static void amdgpu_dm_commit_planes(struct drm_atomi=
c_state *state,
 =09=09/*
 =09=09 * Only allow immediate flips for fast updates that don't
 =09=09 * change FB pitch, DCC state, rotation or mirroing.
+=09=09 *
+=09=09 * dm_crtc_helper_atomic_check() only accepts async flips with
+=09=09 * fast updates.
 =09=09 */
+=09=09if (crtc->state->async_flip &&
+=09=09    acrtc_state->update_type !=3D UPDATE_TYPE_FAST)
+=09=09=09drm_warn_once(state->dev,
+=09=09=09=09      "[PLANE:%d:%s] async flip with non-fast update\n",
+=09=09=09=09      plane->base.id, plane->name);
 =09=09bundle->flip_addrs[planes_count].flip_immediate =3D
 =09=09=09crtc->state->async_flip &&
 =09=09=09acrtc_state->update_type =3D=3D UPDATE_TYPE_FAST;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drive=
rs/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 594fe8a4d02b..97ead857f507 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -388,6 +388,16 @@ static int dm_crtc_helper_atomic_check(struct drm_crtc=
 *crtc,
 =09=09return -EINVAL;
 =09}
=20
+=09/* Only allow async flips for fast updates that don't change the FB
+=09 * pitch, the DCC state, rotation, etc. */
+=09if (crtc_state->async_flip &&
+=09    dm_crtc_state->update_type !=3D UPDATE_TYPE_FAST) {
+=09=09drm_dbg_atomic(crtc->dev,
+=09=09=09       "[CRTC:%d:%s] async flips are only supported for fast upda=
tes\n",
+=09=09=09       crtc->base.id, crtc->name);
+=09=09return -EINVAL;
+=09}
+
 =09/* In some use cases, like reset, no stream is attached */
 =09if (!dm_crtc_state->stream)
 =09=09return 0;
--=20
2.37.3


