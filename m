Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC505A6A67
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E603B10E2CD;
	Tue, 30 Aug 2022 17:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898A710E2CE;
 Tue, 30 Aug 2022 17:29:12 +0000 (UTC)
Date: Tue, 30 Aug 2022 17:29:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661880550; x=1662139750;
 bh=NOspkeCyisteflDWfgfPp47h9Zxnl1e89Ifouu8WMi0=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=NOjN1q7uC7m/78qMhm81hkpiwHEVcL+zEsQ7VxcgaTtA64I+Yu6CLtXyNX1gJYVBE
 wgp07kwjkcBUHNCv1XWxPTcgxmUp4Y2Auvem4jSz+BvEZotSWV0/hBMUIJF4GT7n/a
 9/q95fEtcSnas4PYrbscDAhg/m+SfEc8YK6Tcpb1dVBsI65F1444tcZi4Ouf1dOWRW
 DvGNMKfHrmj8lr8PfK/EEYc1Jhbgs6GqR37Iplef2bIjYrspQZU6IXuHRUQwnFfPw0
 GZPbua7fHMjVZCXNJLBeUZ7gYrcAXNDwu+UarIXr4rkPUI7q1s7eU1eZam+ZmIFa3j
 KWw9yEzL1nmHg==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 0/6] Add support for atomic async page-flips
Message-ID: <20220830172851.269402-1-contact@emersion.fr>
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

This series adds support for DRM_MODE_PAGE_FLIP_ASYNC for atomic
commits, aka. "immediate flip" (which might result in tearing).
The feature was only available via the legacy uAPI, however for
gaming use-cases it may be desirable to enable it via the atomic
uAPI too.

- v1: https://patchwork.freedesktop.org/series/107683/
- User-space patch: https://github.com/Plagman/gamescope/pull/595
- IGT patch: https://patchwork.freedesktop.org/series/107681/

Main changes in v2: add docs, fail atomic commit if async flip isn't
possible.

Tested on an AMD Picasso iGPU.

Simon Ser (6):
  amd/display: only accept async flips for fast updates
  drm: document DRM_MODE_PAGE_FLIP_ASYNC
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
 include/uapi/drm/drm_mode.h                   | 11 ++++++++
 11 files changed, 83 insertions(+), 4 deletions(-)

--=20
2.37.2


