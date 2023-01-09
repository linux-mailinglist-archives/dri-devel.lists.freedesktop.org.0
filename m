Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940A06628BB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E976D10E0A7;
	Mon,  9 Jan 2023 14:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D14C10E0A7;
 Mon,  9 Jan 2023 14:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d8WDzN1sPI7Yo9TbrkKJVaN1hyvZR2akXJ2pfczfTE8=; b=hTAdZjrI/aOh34LmKzXARSWZWe
 8/q6V6zyFHLlU5sFinbN1j2Gx0LuJC1KRFznCSB8bELo68h1s96DfsRaEpgf80VMVcHepe/ay3IAh
 mhVnlqq4tnm0hNuyrmmPr1T6gLOUbwmxOrAbh0wgtp+EU/BcaUk6wnb7363aUetEOLkYkCqkvqX/R
 SyN/S66ygNwCjo8aFZZsge8bBYfqQXQKjq42uGLSIkd5XlKXsdjL5H2oXr89+g7gECwhjtVPXiFnM
 RrDLSQxd/3a1pZc4KlOnBL4q7xWuOLjXGOUaUBarecfZgOb+ZgxFkZS425N48tFC3hn7MqXMJulnS
 KFTzkTbg==;
Received: from [41.74.137.107] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEtNH-003TyM-6i; Mon, 09 Jan 2023 15:43:43 +0100
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, harry.wentland@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com,
 tzimmermann@suse.de, Xinhui.Pan@amd.com
Subject: [RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface
Date: Mon,  9 Jan 2023 13:38:28 -0100
Message-Id: <20230109143846.1966301-1-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: laurent.pinchart+renesas@ideasonboard.com,
 Shashank Sharma <shashank.sharma@amd.com>, alex.hung@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 seanpaul@chromium.org, kernel-dev@igalia.com, bhawanpreet.lakha@amd.com,
 nicholas.kazlauskas@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

After collecting comments in different places, here is a second version
of the work on adding DRM CRTC 3D LUT support to the current DRM color
mgmt interface. In comparison to previous proposals [1][2][3], here we
add 3D LUT before gamma 1D LUT, but also a shaper 1D LUT before 3D LUT,
that means the following DRM CRTC color correction pipeline:

Blend -> Degamma 1D LUT -> CTM -> Shaper 1D LUT -> 3D LUT -> Gamma 1D LUT

and we also add a DRM CRTC LUT3D_MODE property, based on Alex Hung
proposal for pre-blending 3D LUT [4] (Thanks!), instead of just a
LUT3D_SIZE, that allows userspace to use different supported settings of
3D LUT, fitting VA-API and new color API better. In this sense, I
adjusted the pre-blending proposal for post-blending usage.

Patches 1-6 targets the addition of shaper LUT and 3D LUT properties to
the current DRM CRTC color mgmt pipeline. Patch 6 can be considered an
extra/optional patch to define a default value for LUT3D_MODE, inspired
by what we do for the plane blend mode property (pre-multiplied).

Patches 7-18 targets AMD display code to enable shaper and 3D LUT usage
on DCN 301 (our HW case). Patches 7-9 performs code cleanups on current
AMD DM colors code, patch 10 updates AMD stream in case of user 3D LUT
changes, patch 11/12 rework AMD MPC 3D LUT resource handling by context
for DCN 301 (easily extendible to other DCN families). Finally, from
13-18, we wire up SHAPER LUT, LUT3D and LUT3D MODE to AMD display
driver, exposing modes supported by HW and programming user shaper and
3D LUT accordingly.

Our target userspace is Gamescope/SteamOS.

Basic IGT tests were based on [5][6] and are available here (in-progress):
https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commits/crtc-lut3d-api

[1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com/
[2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f30f9e5bdc17cbb4656fe23e69
[3] https://lore.kernel.org/amd-gfx/20220619223104.667413-1-mwen@igalia.com/
[4] https://lore.kernel.org/dri-devel/20221004211451.1475215-1-alex.hung@amd.com/
[5] https://patchwork.freedesktop.org/series/90165/
[6] https://patchwork.freedesktop.org/series/109402/
[VA_API] http://intel.github.io/libva/structVAProcFilterParameterBuffer3DLUT.html
[KMS_pipe_API] https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11

Let me know your thoughts.

Thanks,

Melissa

Alex Hung (2):
  drm: Add 3D LUT mode and its attributes
  drm/amd/display: Define 3D LUT struct for HDR planes

Melissa Wen (16):
  drm/drm_color_mgmt: add shaper LUT to color mgmt properties
  drm/drm_color_mgmt: add 3D LUT props to DRM color mgmt
  drm/drm_color_mgmt: add function to create 3D LUT modes supported
  drm/drm_color_mgmt: add function to attach 3D LUT props
  drm/drm_color_mgmt: set first lut3d mode as default
  drm/amd/display: remove unused regamma condition
  drm/amd/display: add comments to describe DM crtc color mgmt behavior
  drm/amd/display: encapsulate atomic regamma operation
  drm/amd/display: update lut3d and shaper lut to stream
  drm/amd/display: handle MPC 3D LUT resources for a given context
  drm/amd/display: acquire/release 3D LUT resources for ctx on DCN301
  drm/amd/display: expand array of supported 3D LUT modes
  drm/amd/display: enable 3D-LUT DRM properties if supported
  drm/amd/display: add user 3D LUT support to the amdgpu_dm color
    pipeline
  drm/amd/display: decouple steps to reuse in shaper LUT support
  drm/amd/display: add user shaper LUT support to amdgpu_dm color
    pipeline

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   6 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   3 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 370 ++++++++++++++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   2 +
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  49 ++-
 drivers/gpu/drm/amd/display/dc/dc.h           |   8 +
 .../amd/display/dc/dcn301/dcn301_resource.c   |  47 ++-
 .../amd/display/modules/color/color_gamma.h   |  43 ++
 drivers/gpu/drm/drm_atomic_state_helper.c     |   7 +
 drivers/gpu/drm/drm_atomic_uapi.c             |  24 ++
 drivers/gpu/drm/drm_color_mgmt.c              | 127 ++++++
 drivers/gpu/drm/drm_fb_helper.c               |   5 +
 drivers/gpu/drm/drm_mode_config.c             |  21 +
 include/drm/drm_color_mgmt.h                  |   8 +
 include/drm/drm_crtc.h                        |  32 +-
 include/drm/drm_mode_config.h                 |  25 ++
 include/drm/drm_mode_object.h                 |   2 +-
 include/uapi/drm/drm_mode.h                   |  17 +
 18 files changed, 757 insertions(+), 39 deletions(-)

-- 
2.35.1

