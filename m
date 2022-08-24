Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C6A59FDEB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 17:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27442B361;
	Wed, 24 Aug 2022 15:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1698110EF0A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 15:08:53 +0000 (UTC)
Date: Wed, 24 Aug 2022 15:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661353731; x=1661612931;
 bh=YmZkaiAfyRui5unallseix2QKJw8gLO2SIAnWMdd3cQ=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=bAwvFcLWDaktlYuFnuPyAY7YtAbZQxg3cgJkWjJuTLGbxVD/ntnUjd/6TMKmm7PzU
 k/WPPNbVwwbFOgjidWw8ffBzlJKMrzaAEsmhunpPJWlMraVC2+YN1oP/G49/h9UHl+
 xgBNVbOR3UN9OBc6dHhBnOTDzEBOhrF8JmbpuRQpypLTUOFK/deTr2YFX178poyf12
 MNC3HcShl0Dk014NDsz5HMz60SMcmIlHYkD+t7Tbug0TojcvFPWi+99fPTZTdZfStn
 e1ci0ZQUXcnA38VnMQ6FhShCeLfGBjG2FT30g5ZjCqtea3fDHW9VkPWdNcdUoDjAq0
 f7lHAxEAigeqQ==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 1/4] drm: introduce
 drm_mode_config.atomic_async_page_flip_not_supported
Message-ID: <20220824150834.427572-2-contact@emersion.fr>
In-Reply-To: <20220824150834.427572-1-contact@emersion.fr>
References: <20220824150834.427572-1-contact@emersion.fr>
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
Cc: daniel.vetter@ffwll.ch, mwen@igalia.com, alexander.deucher@amd.com,
 hwentlan@amd.com, nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This new field indicates whether the driver has the necessary logic
to support async page-flips via the atomic uAPI. This is leveraged by
the next commit to allow user-space to use this functionality.

All drivers setting drm_mode_config.async_page_flip are updated to
also set drm_mode_config.atomic_async_page_flip_not_supported. We
will gradually check and update these drivers to properly handle
drm_crtc_state.async_flip in their atomic logic.

The goal of this negative flag is the same as
fb_modifiers_not_supported: we want to eventually get rid of all
drivers missing atomic support for async flips. New drivers should not
set this flag, instead they should support atomic async flips (if
they support async flips at all). IOW, we don't want more drivers
with async flip support for legacy but not atomic.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             |  1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c      |  1 +
 drivers/gpu/drm/i915/display/intel_display.c      |  1 +
 drivers/gpu/drm/nouveau/nouveau_display.c         |  1 +
 drivers/gpu/drm/radeon/radeon_display.c           |  1 +
 drivers/gpu/drm/vc4/vc4_kms.c                     |  1 +
 include/drm/drm_mode_config.h                     | 11 +++++++++++
 11 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/dce_v10_0.c
index 9c964cd3b5d4..76ccd57e3663 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -2791,6 +2791,7 @@ static int dce_v10_0_sw_init(void *handle)
 =09adev_to_drm(adev)->mode_config.funcs =3D &amdgpu_mode_funcs;
=20
 =09adev_to_drm(adev)->mode_config.async_page_flip =3D true;
+=09adev_to_drm(adev)->mode_config.atomic_async_page_flip_not_supported =3D=
 true;
=20
 =09adev_to_drm(adev)->mode_config.max_width =3D 16384;
 =09adev_to_drm(adev)->mode_config.max_height =3D 16384;
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/a=
mdgpu/dce_v11_0.c
index e0ad9f27dc3f..c7702c5bfbd0 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -2909,6 +2909,7 @@ static int dce_v11_0_sw_init(void *handle)
 =09adev_to_drm(adev)->mode_config.funcs =3D &amdgpu_mode_funcs;
=20
 =09adev_to_drm(adev)->mode_config.async_page_flip =3D true;
+=09adev_to_drm(adev)->mode_config.atomic_async_page_flip_not_supported =3D=
 true;
=20
 =09adev_to_drm(adev)->mode_config.max_width =3D 16384;
 =09adev_to_drm(adev)->mode_config.max_height =3D 16384;
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/am=
dgpu/dce_v6_0.c
index 77f5e998a120..c9a2372f8ea2 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -2670,6 +2670,7 @@ static int dce_v6_0_sw_init(void *handle)
=20
 =09adev_to_drm(adev)->mode_config.funcs =3D &amdgpu_mode_funcs;
 =09adev_to_drm(adev)->mode_config.async_page_flip =3D true;
+=09adev_to_drm(adev)->mode_config.atomic_async_page_flip_not_supported =3D=
 true;
 =09adev_to_drm(adev)->mode_config.max_width =3D 16384;
 =09adev_to_drm(adev)->mode_config.max_height =3D 16384;
 =09adev_to_drm(adev)->mode_config.preferred_depth =3D 24;
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/am=
dgpu/dce_v8_0.c
index 802e5c753271..09c07820d494 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2688,6 +2688,7 @@ static int dce_v8_0_sw_init(void *handle)
 =09adev_to_drm(adev)->mode_config.funcs =3D &amdgpu_mode_funcs;
=20
 =09adev_to_drm(adev)->mode_config.async_page_flip =3D true;
+=09adev_to_drm(adev)->mode_config.atomic_async_page_flip_not_supported =3D=
 true;
=20
 =09adev_to_drm(adev)->mode_config.max_width =3D 16384;
 =09adev_to_drm(adev)->mode_config.max_height =3D 16384;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 9ab01c58bedb..ef816bf295eb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3804,6 +3804,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_d=
evice *adev)
 =09adev_to_drm(adev)->mode_config.prefer_shadow =3D 0;
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
index 2a45a25e42fb..265492e6c135 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8622,6 +8622,7 @@ static void intel_mode_config_init(struct drm_i915_pr=
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
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/rade=
on/radeon_display.c
index ca5598ae8bfc..cdfe3220db6b 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1587,6 +1587,7 @@ int radeon_modeset_init(struct radeon_device *rdev)
=20
 =09if (radeon_use_pflipirq =3D=3D 2 && rdev->family >=3D CHIP_R600)
 =09=09rdev->ddev->mode_config.async_page_flip =3D true;
+=09rdev->ddev->mode_config.atomic_async_page_flip_not_supported =3D true;
=20
 =09if (ASIC_IS_DCE5(rdev)) {
 =09=09rdev->ddev->mode_config.max_width =3D 16384;
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
2.37.2


