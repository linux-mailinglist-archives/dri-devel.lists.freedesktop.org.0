Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C585A6A6E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2F710E2D2;
	Tue, 30 Aug 2022 17:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1330A10E2D5;
 Tue, 30 Aug 2022 17:29:21 +0000 (UTC)
Date: Tue, 30 Aug 2022 17:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661880559; x=1662139759;
 bh=QybztqqzZ9KjWXjEk2ogkfvfJoSMXPwmtjjt64VUG+4=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=IIMGPCUpxOFiCL4YDDinVVwFp4nU5vSWYktnrPk69KojJ6KLDWtwRMfzrTuF9hgu0
 NUcOvs25sJgGrWaNkVHsu8WHcGubsuca4EA5hRjIikFdLyFJGfBH52uWZsvmO5FXIV
 NEe5SA20h9hPsFiIe/L6j5hmJZOEUcTW2mxWtU7XT1y+RpHPDiL3N2EC9VPBUJVkd0
 gDSxOXctMo5OVF3i5l28gprdRe8TVTMtOQ8O7R/zDVJNvmYQPnOUahA3tU70qMwYxt
 6dg0gSowzGzuGCVv1yKrGkXnvH5frJzmwDc5bJspL5Xiw/ix7rD2GjLSSfuJIx8xCf
 PVgAPi6iWLpOw==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 1/6] amd/display: only accept async flips for fast updates
Message-ID: <20220830172851.269402-2-contact@emersion.fr>
In-Reply-To: <20220830172851.269402-1-contact@emersion.fr>
References: <20220830172851.269402-1-contact@emersion.fr>
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
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c      |  8 ++++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 9ab01c58bedb..7f96d81f4e0d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7613,7 +7613,15 @@ static void amdgpu_dm_commit_planes(struct drm_atomi=
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
2.37.2


