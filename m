Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61885EFD4A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB8F10EC21;
	Thu, 29 Sep 2022 18:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D225110EC0D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 18:43:48 +0000 (UTC)
Date: Thu, 29 Sep 2022 18:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1664477026; x=1664736226;
 bh=9VuS75mT9/1t8oW1/2UtDHHfEEI4XHYKT40zfkkaSY8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=BHkDEe4VIJFXCAh6Agv6t+ytN1UxOExd5CSnpT8D69TUviDYxH74LxHlChfQSGJWn
 6iCPgF1lJPVdtf89KOhZUMDedTi/kKHuaYXAHNczNFfODA0fUEpUTHFSPvqFDtu77L
 pupGJBalqhSY0zoe0BvYbHIMtVNgCDW+xelc2txMzJL32UGULZOu/Dij9bXAAuVlsH
 fzGBQO2x4plxGNmuXItmEINFi1BUtmmWtPWnJ0lr93BiOHGfQqw3LuXIbV35iSlERX
 p61DmsotPku67YktZHy92x3Y+ESl2t0rCwaAb2DJGCNF4qi4fpOMaKvQ5RTFmSYxcL
 cLqanEoWDeb7g==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3 3/6] drm: introduce
 drm_mode_config.atomic_async_page_flip_not_supported
Message-ID: <20220929184307.258331-4-contact@emersion.fr>
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

This new field indicates whether the driver has the necessary logic
to support async page-flips via the atomic uAPI. This is leveraged by
the next commit to allow user-space to use this functionality.

All atomic drivers setting drm_mode_config.async_page_flip are updated
to also set drm_mode_config.atomic_async_page_flip_not_supported. We
will gradually check and update these drivers to properly handle
drm_crtc_state.async_flip in their atomic logic.

The goal of this negative flag is the same as
fb_modifiers_not_supported: we want to eventually get rid of all
drivers missing atomic support for async flips. New drivers should not
set this flag, instead they should support atomic async flips (if
they support async flips at all). IOW, we don't want more drivers
with async flip support for legacy but not atomic.

v2: only set the flag on atomic drivers (remove it on amdgpu DCE and
on radeon)

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c      |  1 +
 drivers/gpu/drm/i915/display/intel_display.c      |  1 +
 drivers/gpu/drm/nouveau/nouveau_display.c         |  1 +
 drivers/gpu/drm/vc4/vc4_kms.c                     |  1 +
 include/drm/drm_mode_config.h                     | 11 +++++++++++
 6 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 44235345fd57..7500e82cf06a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3808,6 +3808,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_d=
evice *adev)
 =09=09adev_to_drm(adev)->mode_config.prefer_shadow =3D 1;
 =09/* indicates support for immediate flip */
 =09adev_to_drm(adev)->mode_config.async_page_flip =3D true;
+=09adev_to_drm(adev)->mode_config.atomic_async_page_flip_not_supported =3D=
 true;
=20
 =09adev_to_drm(adev)->mode_config.fb_base =3D adev->gmc.aper_base;
=20
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm=
/atmel-hlcdc/atmel_hlcdc_dc.c
index f7e7f4e919c7..ffb3a2fa797f 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -639,6 +639,7 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_devic=
e *dev)
 =09dev->mode_config.max_height =3D dc->desc->max_height;
 =09dev->mode_config.funcs =3D &mode_config_funcs;
 =09dev->mode_config.async_page_flip =3D true;
+=09dev->mode_config.atomic_async_page_flip_not_supported =3D true;
=20
 =09return 0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm=
/i915/display/intel_display.c
index 40fbf8a296e2..e025b3499c9d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8621,6 +8621,7 @@ static void intel_mode_config_init(struct drm_i915_pr=
ivate *i915)
 =09mode_config->helper_private =3D &intel_mode_config_funcs;
=20
 =09mode_config->async_page_flip =3D HAS_ASYNC_FLIPS(i915);
+=09mode_config->atomic_async_page_flip_not_supported =3D true;
=20
 =09/*
 =09 * Maximum framebuffer dimensions, chosen to match
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/no=
uveau/nouveau_display.c
index a2f5df568ca5..2b5c4f24aedd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -699,6 +699,7 @@ nouveau_display_create(struct drm_device *dev)
 =09=09dev->mode_config.async_page_flip =3D false;
 =09else
 =09=09dev->mode_config.async_page_flip =3D true;
+=09dev->mode_config.atomic_async_page_flip_not_supported =3D true;
=20
 =09drm_kms_helper_poll_init(dev);
 =09drm_kms_helper_poll_disable(dev);
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 4419e810103d..3fe59c6b2cf0 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -1047,6 +1047,7 @@ int vc4_kms_load(struct drm_device *dev)
 =09dev->mode_config.helper_private =3D &vc4_mode_config_helpers;
 =09dev->mode_config.preferred_depth =3D 24;
 =09dev->mode_config.async_page_flip =3D true;
+=09dev->mode_config.atomic_async_page_flip_not_supported =3D true;
=20
 =09ret =3D vc4_ctm_obj_init(vc4);
 =09if (ret)
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 6b5e01295348..1b535d94f2f4 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -917,6 +917,17 @@ struct drm_mode_config {
 =09 */
 =09bool async_page_flip;
=20
+=09/**
+=09 * @atomic_async_page_flip_not_supported:
+=09 *
+=09 * If true, the driver does not support async page-flips with the
+=09 * atomic uAPI. This is only used by old drivers which haven't yet
+=09 * accomodated for &drm_crtc_state.async_flip in their atomic logic,
+=09 * even if they have &drm_mode_config.async_page_flip set to true.
+=09 * New drivers shall not set this flag.
+=09 */
+=09bool atomic_async_page_flip_not_supported;
+
 =09/**
 =09 * @fb_modifiers_not_supported:
 =09 *
--=20
2.37.3


