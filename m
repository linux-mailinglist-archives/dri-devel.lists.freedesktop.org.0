Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7166759FDE5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 17:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D3B10EF0A;
	Wed, 24 Aug 2022 15:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A1A10FAF4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 15:08:47 +0000 (UTC)
Date: Wed, 24 Aug 2022 15:08:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661353725; x=1661612925;
 bh=A0SWNvFzOlK+TEU6XC3JudoCYjpD6SMN2Q/eWRklDZI=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=cv301t1BDXON6cMUJvNHSVicm2KZQatSV4CjD+j+gqeqpcDHicZqzud8DKwteHAE+
 lPd8FL4CtXF792soSZXKLfnru9MDjTnJ6LqGFXvEqNohAOLiRY7jmflhawiIplATbF
 opWtLLFMwuaXuwVy5SNNS2gZYnR7xq9JU1pe8QRsiz4BUwkQ36ZKv9ZuFYU4bvBpUV
 +WiN76fdO1Ubhj9djKb8kmUxKb5lLZQ3W/Kae260HMu2/eUXseeU7ZIF1KTyELutdf
 dfd5MHOmlqPHOshB69kI+nle2sUblaSHElsbawQ1o4ICqbdzqRIoCejkZK9l8b8ykU
 q2ytCkpXscQKw==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 0/4] Add support for atomic async page-flips
Message-ID: <20220824150834.427572-1-contact@emersion.fr>
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

This series adds support for DRM_MODE_PAGE_FLIP_ASYNC for atomic
commits, aka. "immediate flip" (which might result in tearing).
The feature was only available via the legacy uAPI, however for
gaming use-cases it may be desirable to enable it via the atomic
uAPI too.

User-space patch:
https://github.com/Plagman/gamescope/pull/595

IGT patch:
https://patchwork.freedesktop.org/series/107681/

Tested on an AMD Picasso iGPU.

Simon Ser (4):
  drm: introduce drm_mode_config.atomic_async_page_flip_not_supported
  drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
  drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
  amd/display: indicate support for atomic async page-flips on DCN

 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c       |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c       |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c        |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c        |  1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c            | 28 +++++++++++++++++---
 drivers/gpu/drm/drm_ioctl.c                  |  5 ++++
 drivers/gpu/drm/i915/display/intel_display.c |  1 +
 drivers/gpu/drm/nouveau/nouveau_display.c    |  1 +
 drivers/gpu/drm/radeon/radeon_display.c      |  1 +
 drivers/gpu/drm/vc4/vc4_kms.c                |  1 +
 include/drm/drm_mode_config.h                | 11 ++++++++
 include/uapi/drm/drm.h                       | 10 ++++++-
 13 files changed, 59 insertions(+), 4 deletions(-)

--=20
2.37.2


