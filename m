Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4755EFD40
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A8710EC05;
	Thu, 29 Sep 2022 18:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2F310E081
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 18:43:25 +0000 (UTC)
Date: Thu, 29 Sep 2022 18:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1664477002; x=1664736202;
 bh=HyhgaGbgtpd/9ok7r5Ipc6M4qVjFa1CtXzLlLcW2INk=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID;
 b=mwAZj239shO3XD/u6vSLPk+B3Thkn7br6y19Mp8ak3N+TqGHEYhyqrrPBXckgw0WJ
 7Mlrz+TQXiGA9LcHuyI3iku+BiTIt2iyQOXNFTkNRBx6Xeq9JGScK+q2xp8nL5Dbr2
 GnV//l6sz7azA85zma89DBtgeFf1g+v4vcuKIRlvyVqXwI035SUFEXZpaCBmbOhiVB
 0T5seqR9/qJ5pZbYg1+gU3icFfKwPgEHZRJSrnljjaGXk+IvLU41oTmfFD6+1jKqTT
 HNM57mU9saz7eK335YDZhvgASkAOFc2MxhEkCBmzN37beoQaaCIqwyQU3yfsCZPgXR
 6sZITYEVwwP4A==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3 0/6] Add support for atomic async page-flips
Message-ID: <20220929184307.258331-1-contact@emersion.fr>
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

This series adds support for DRM_MODE_PAGE_FLIP_ASYNC for atomic
commits, aka. "immediate flip" (which might result in tearing).
The feature was only available via the legacy uAPI, however for
gaming use-cases it may be desirable to enable it via the atomic
uAPI too.

- Patchwork: https://patchwork.freedesktop.org/series/107683/
- User-space patch: https://github.com/Plagman/gamescope/pull/595
- IGT patch: https://patchwork.freedesktop.org/series/107681/

Main changes in v2: add docs, fail atomic commit if async flip isn't
possible.

Changes in v3: add a note in the documentation about Intel hardware,
add R-b tags.

Tested on an AMD Picasso iGPU (Simon) and an AMD Vangogh GPU (Andr=C3=A9).

Simon Ser (6):
  drm: document DRM_MODE_PAGE_FLIP_ASYNC
  amd/display: only accept async flips for fast updates
  drm: introduce drm_mode_config.atomic_async_page_flip_not_supported
  drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
  drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
  amd/display: indicate support for atomic async page-flips on DC

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 10 +++++++
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 28 +++++++++++++++++--
 drivers/gpu/drm/drm_ioctl.c                   |  5 ++++
 drivers/gpu/drm/i915/display/intel_display.c  |  1 +
 drivers/gpu/drm/nouveau/nouveau_display.c     |  1 +
 drivers/gpu/drm/vc4/vc4_kms.c                 |  1 +
 include/drm/drm_mode_config.h                 | 11 ++++++++
 include/uapi/drm/drm.h                        | 10 ++++++-
 include/uapi/drm/drm_mode.h                   | 16 +++++++++++
 11 files changed, 88 insertions(+), 4 deletions(-)

--=20
2.37.3


