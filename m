Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 443EA6EBFDF
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC8710E205;
	Sun, 23 Apr 2023 14:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389E810E128;
 Sun, 23 Apr 2023 14:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wW8cHrcAdLnS/PDlwOJdcqPUxh8bdVCQ3SzRIGLCfxs=; b=XAz/jF73XU1SqBH9nVYLpcd1w6
 sDoQnFPuY/ozTMClZRmakVgFYAHyMDT3lcBD9OJjkY5lhKRxfPWjuAjJ+esMgX39XDayHmcDIFUzZ
 UvaFr2nXy6IAKmfPR4XP5nWzuYwmOp7YQJB3mg967JQPIq6PEu6KRXs+ngn8bxkiD0KV8RBb8yrX7
 rzygo1fUVSoSE5zUaABbCe+MpFyVm9yNBev9YZEZ7H2lWeph70jmNuAXlkEn4r3YkBET62LC8OLQP
 gXHRA9ZEWhCroTF9vN3pPOB2dgs+k6bIA375afBZRAci9VzKrn8yNX/2XLcqUyTiIf/CxN/Wkf2dm
 1F9AwkDg==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaRO-00ANVs-Gp; Sun, 23 Apr 2023 16:11:46 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 Xinhui.Pan@amd.com
Subject: [RFC PATCH 00/40] drm/amd/display: add AMD driver-specific properties
 for color mgmt
Date: Sun, 23 Apr 2023 13:10:12 -0100
Message-Id: <20230423141051.702990-1-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Joshua Ashton and I (with the great collaboration of Harry Wentland -
thanks) have been working on KMS color pipeline enhancement for Steam
Deck/SteamOS by exposing the large set of color caps available in AMD
display HW.

This patchset results from this full-stack work, including pre-blending
and post-blending new color properties. The first two patches fix
quantization issues on shaper LUT programming. Just after, we have one
patch that adds a config option to restrict AMD colo feature usage. The
following 13 patches implement AMD driver-private color properties
(pending detachment of property counter and plane color_mgmt_changed
from DRM). Finally, the last 24 patches rework the AMD display manager
and color management to support the properties exposed.

In short, for pre-blending, we added the following:
- plane degamma LUT and predefined transfer function;
- plane HDR multiplier
- plane shaper LUT/transfer function;
- plane 3D LUT; and finally,
- plane blend LUT/transfer function, just before blending.

After blending, we already have DRM CRTC degamma/gamma LUTs and CTM,
therefore, we extend CRTC color pipeline with the following:
- CRTC shaper LUT/transfer function;
- CRTC 3D LUT; and
- CRTC gamma transfer function.

You can already find the AMD color capabilities and color management
pipeline documented here:
https://dri.freedesktop.org/docs/drm/gpu/amdgpu/display/display-manager.html#color-management-properties

In previous iterations, we tried to provide a generic solution for
post-blending shaper and 3D LUT [1][2][3], and also Alex Hung worked on
a pre-blending 3D LUT solution[4] extending plane color mgmt proposal
from Uma Shankar [5]. However, we identified during our work [6] that
AMD provides many other valuable capabilities that we don't find in
other vendors, so we started to work on AMD driver-private color
properties that better describe its color pipeline, enabling us to
expose full AMD color capabilities on Deck HW.

Our primary purpose is to avoid usage limitations of color calibration
features provided by HW just because we don't have an interface for
that. At the same time, a generic solution doesn't fit well since some
of these capabilities seem AMD HW specific, such as hardcoded
curve/predefined transfer function and shaper 1D LUTs sandwiching 3D
LUT.

So far, we keep these properties' usage under an AMD display config
option (STEAM_DECK). However, we are fine with having them fully
available to other DCN HW generations. In the current proposal, we are
already checking ASICs before exposing a color feature. We can work on
3D LUT resource acquisition details to fit them to DCN 3+ families that
support them. Indeed, before moving to these config boundaries, we
started working on an open solution for any AMD HW [7].

The userspace case here is Gamescope which is the compositor for
SteamOS. It's already using all of this functionality (although with a
VALVE1_ prefix instead of AMD) to implement its color management
pipeline right now:
https://github.com/ValveSoftware/gamescope

We are planning on shipping our color management support with gamut
mapping, HDR, SDR on HDR, HDR on SDR, and much more in Steam OS 3.5. A
brief overview of our color pipeline can be found here:
https://github.com/ValveSoftware/gamescope/blob/master/src/docs/Steam%20Deck%20Display%20Pipeline.png

We have also had some other userspace interests from Xaver Hugl (KDE) in
experimenting with these properties for their HDR/color bring-up before
a generic interface is settled on also.

It still needs AMD-specific IGT tests; we are working on documentation
and adding plane CTM support too. 

We decided first to share our work to collect thoughts and open for
discussion, even with missing refinements, since driver-private
properties are not the usual DMR/KMS color management approach.

Please, let us know your thoughts.

Best Regards,

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen<mwen@igalia.com>

[1] https://lore.kernel.org/dri-devel/20220619223104.667413-1-mwen@igalia.com/
[2] https://lore.kernel.org/amd-gfx/20220906164628.2361811-1-mwen@igalia.com/
[3] https://lore.kernel.org/dri-devel/20230109143846.1966301-1-mwen@igalia.com/
[4] https://lore.kernel.org/dri-devel/20221004211451.1475215-1-alex.hung@amd.com/
[5] https://lore.kernel.org/dri-devel/20210906213904.27918-1-uma.shankar@intel.com/
[6] https://gitlab.freedesktop.org/mwen/linux-amd/-/commits/amd-color-mgmt
[7] https://gitlab.freedesktop.org/mwen/linux-amd/-/commits/amd-private-color-mgmt

Harry Wentland (2):
  drm/amd/display: fix segment distribution for linear LUTs
  drm/amd/display: fix the delta clamping for shaper LUT

Joshua Ashton (15):
  drm/amd/display: add CRTC gamma TF to driver-private props
  drm/amd/display: add plane degamma LUT driver-private props
  drm/amd/display: add plane degamma TF driver-private property
  drm/amd/display: add plane HDR multiplier driver-private property
  drm/amd/display: add plane blend LUT and TF driver-private properties
  drm/amd/display: copy 3D LUT settings from crtc state to stream_update
  drm/amd/display: dynamically acquire 3DLUT resources for color changes
  drm/amd/display: add CRTC regamma TF support
  drm/amd/display: set sdr_ref_white_level to 80 for out_transfer_func
  drm/amd/display: add support for plane degamma TF and LUT properties
  drm/amd/display: add dc_fixpt_from_s3132 helper
  drm/adm/display: add HDR multiplier support
  drm/amd/display: handle empty LUTs in __set_input_tf
  drm/amd/display: add DRM plane blend LUT and TF support
  drm/amd/display: allow newer DC hardware to use degamma ROM for PQ/HLG

Melissa Wen (23):
  drm/amd/display: introduce Steam Deck color features to AMD display
    driver
  drm/drm_mode_object: increase max objects to accommodate new color
    props
  drm/amd/display: add shaper LUT driver-private props
  drm/amd/display: add 3D LUT driver-private props
  drm/drm_plane: track color mgmt changes per plane
  drm/amd/display: move replace blob func to dm plane
  drm/amd/display: add plane 3D LUT driver-private properties
  drm/amd/display: add plane shaper LUT driver-private properties
  drm/amd/display: add plane shaper TF driver-private property
  drm/amd/display: add comments to describe DM crtc color mgmt behavior
  drm/amd/display: encapsulate atomic regamma operation
  drm/amd/display: update lut3d and shaper lut to stream
  drm/amd/display: allow BYPASS 3D LUT but keep shaper LUT settings
  drm/amd/display: handle MPC 3D LUT resources for a given context
  drm/amd/display: add CRTC 3D LUT support to amd color pipeline
  drm/amd/display: decouple steps to reuse in CRTC shaper LUT support
  drm/amd/display: add CRTC shaper LUT support to amd color pipeline
  drm/amd/display: add CRTC shaper TF support
  drm/amd/display: mark plane as needing reset if plane color mgmt
    changes
  drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
  drm/amd/display: reject atomic commit if setting both plane and CRTC
    degamma
  drm/amd/display: add plane shaper/3D LUT and shaper TF support
  drm/amd/display: copy dc_plane color settings to surface_updates

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 153 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  92 +++
 drivers/gpu/drm/amd/display/Kconfig           |   6 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  31 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 120 +++-
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 613 ++++++++++++++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 124 +++-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 238 +++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.h   |   7 +
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  49 +-
 drivers/gpu/drm/amd/display/dc/dc.h           |   8 +
 .../amd/display/dc/dcn10/dcn10_cm_common.c    | 109 +++-
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |   5 +-
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |   9 +-
 .../amd/display/dc/dcn301/dcn301_resource.c   |  26 +-
 .../gpu/drm/amd/display/include/fixed31_32.h  |  12 +
 drivers/gpu/drm/drm_atomic.c                  |   1 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   1 +
 include/drm/drm_mode_object.h                 |   2 +-
 include/drm/drm_plane.h                       |   7 +
 20 files changed, 1509 insertions(+), 104 deletions(-)

-- 
2.39.2

