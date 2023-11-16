Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618B07EE7C1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9BD10E697;
	Thu, 16 Nov 2023 19:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB59710E693;
 Thu, 16 Nov 2023 19:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+DxgjsvuCtkCiraJPkDyhj201h2ysE/rDnknD0WVBLg=; b=dtl4HgHQoHN0b9IgX8yWpNBGp3
 +lt0oaOXLnrpghuF2hWQDVcDT0R0MIODYqFLYh3X1+XWuLIwIljBHbtCcG2iVldBWD1EEsGA8LBIx
 6n7UrOFL3yZUhk+dWnXQxdAEcoorQEzRT992gbNQzPhPQAFr/aVhrOzv5r0AkaMM3Eizkam9jswrH
 WJ/C5fro46jej0ETPpZ+H7TemEt8xtLbTpTZuz678JgqaU/b+aTzDlc0rwBz5pXx3663ZqqYSxtA/
 xNMUQS9hXJHo9SLcQXIBQHY76Eddkb6kvjKeX3GZ5/+cwvRrSPvVtaoWF2wCoFK6/Vn4Ne2uB/IUu
 /XzCNHJw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r3iVE-0048Yy-3A; Thu, 16 Nov 2023 20:58:16 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, brian.starkey@arm.com, christian.koenig@amd.com,
 daniel@ffwll.ch, liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, Xinhui.Pan@amd.com
Subject: [PATCH v5 00/32] drm/amd/display: add AMD driver-specific properties
 for color mgmt
Date: Thu, 16 Nov 2023 18:57:40 -0100
Message-Id: <20231116195812.906115-1-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series extends the current KMS color management API with AMD
driver-specific properties to enhance the color management support on
AMD Steam Deck. The key additions to the color pipeline include:

- plane degamma LUT and pre-defined TF;
- plane HDR multiplier;
- plane CTM 3x4;
- plane shaper LUT and pre-defined TF;
- plane 3D LUT;
- plane blend LUT and pre-defined TF;
- CRTC gamma pre-defined TF;

You can find the AMD HW color capabilities documented here:
https://dri.freedesktop.org/docs/drm/gpu/amdgpu/display/display-manager.html#color-management-properties

The userspace case is Gamescope[1], the compositor for SteamOS.
Gamescope has already adopted AMD driver-specific properties to
implement comprehensive color management support, including gamut
mapping, HDR rendering, SDR on HDR, HDR on SDR. Using these features in
the SteamOS 3.5[2] users can expect a significantly enhanced visual
experience. 

You can find a brief overview of the Steam Deck color pipeline here:
https://github.com/ValveSoftware/gamescope/blob/master/src/docs/Steam%20Deck%20Display%20Pipeline.png

This version (v5) includes the fixes for documentation (Sebastian),
suspend/resume and color management setup (Joshua) suggested in the
previous version. It also includes Harry's reviewed-by.

Thank you everyone for reviews and feedback.

Changes since:

[RFC] https://lore.kernel.org/dri-devel/20230423141051.702990-1-mwen@igalia.com
- Remove KConfig and guard properties with `AMD_PRIVATE_COLOR`;
- Remove properties for post-blending/CRTC shaper TF+LUT and 3D LUT;
- Use color caps to improve the support of pre-defined curve;

[v1] https://lore.kernel.org/dri-devel/20230523221520.3115570-1-mwen@igalia.com
- Replace DRM_ by AMDGPU_ prefix for transfer function (TF) enum; 
- Explicitly define EOTFs and inverse EOTFs and set props accordingly;
- Document pre-defined transfer functions;
- Remove HLG transfer function from supported TFs;
- Remove misleading comments;
- Remove post-blending shaper TF+LUT and 3D LUT support;
- Move driver-specific property operations from amdgpu_display.c to
  amdgpu_dm_color.c;
- Reset planes if any color props change;
- Add plane CTM 3x4 support;
- Removed two DC fixes already applied upstream;

[v2] https://lore.kernel.org/dri-devel/20230810160314.48225-1-mwen@igalia.com
- Many documentation fixes: BT.709 OETF, description of sRGB and pure
  power functions, TF+1D LUT behavior;
- Rename CTM2 to CTM 3x4 and fix misleading comment about DC gamut remap;
- Squash `Linear` and `Unity` TF in `Identity`;
- Remove the `MPC gamut remap` patch already applied upstream[3];
- Remove outdated delta segmentation fix;
- Nits/small fixes;

[v3] https://lore.kernel.org/amd-gfx/20230925194932.1329483-1-mwen@igalia.com
- Add table to describe value range in linear and non-linear forms;
- Comment the PQ TF need after HDR multiplier;
- Advertise the 3D LUT size as the size of a single-dimension (read-only);
- remove function to check expected size from 3DLUT caps;
- cleanup comments.

[v4] https://lore.kernel.org/amd-gfx/20231005171527.203657-1-mwen@igalia.com
- Fix documentation about 3D LUT size;
- Correctly getting LUT blobs;
- Always set plane color properties, regardless plane->color_mgmt_changed.

It's worth noting that driver-specific properties are guarded by
cflags `AMD_PRIVATE_COLOR`.

Best Regards,

Melissa Wen

[1] https://github.com/ValveSoftware/gamescope
[2] https://store.steampowered.com/news/app/1675200/view/3686804163591367815
[3] https://lore.kernel.org/dri-devel/20230721132431.692158-1-mwen@igalia.com

Joshua Ashton (14):
  drm/amd/display: add plane degamma TF driver-specific property
  drm/amd/display: add plane HDR multiplier driver-specific property
  drm/amd/display: add plane blend LUT and TF driver-specific properties
  drm/amd/display: add CRTC gamma TF support
  drm/amd/display: set sdr_ref_white_level to 80 for out_transfer_func
  drm/amd/display: mark plane as needing reset if color props change
  drm/amd/display: add plane degamma TF and LUT support
  drm/amd/display: add dc_fixpt_from_s3132 helper
  drm/amd/display: add HDR multiplier support
  drm/amd/display: handle empty LUTs in __set_input_tf
  drm/amd/display: add plane blend LUT and TF support
  drm/amd/display: allow newer DC hardware to use degamma ROM for PQ/HLG
  drm/amd/display: copy 3D LUT settings from crtc state to stream_update
  drm/amd/display: Add 3x4 CTM support for plane CTM

Melissa Wen (18):
  drm/drm_mode_object: increase max objects to accommodate new color
    props
  drm/drm_property: make replace_property_blob_from_id a DRM helper
  drm/drm_plane: track color mgmt changes per plane
  drm/amd/display: add driver-specific property for plane degamma LUT
  drm/amd/display: explicitly define EOTF and inverse EOTF
  drm/amd/display: document AMDGPU pre-defined transfer functions
  drm/amd/display: add plane 3D LUT driver-specific properties
  drm/amd/display: add plane shaper LUT and TF driver-specific
    properties
  drm/amd/display: add CRTC gamma TF driver-specific property
  drm/amd/display: add comments to describe DM crtc color mgmt behavior
  drm/amd/display: encapsulate atomic regamma operation
  drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
  drm/amd/display: reject atomic commit if setting both plane and CRTC
    degamma
  drm/amd/display: add plane shaper LUT support
  drm/amd/display: add plane shaper TF support
  drm/amd/display: add plane 3D LUT support
  drm/amd/display: add plane CTM driver-specific property
  drm/amd/display: add plane CTM support

 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  91 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  34 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 108 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 818 ++++++++++++++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  72 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 232 ++++-
 .../gpu/drm/amd/display/include/fixed31_32.h  |  12 +
 drivers/gpu/drm/arm/malidp_crtc.c             |   2 +-
 drivers/gpu/drm/drm_atomic.c                  |   1 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   1 +
 drivers/gpu/drm/drm_atomic_uapi.c             |  43 +-
 drivers/gpu/drm/drm_property.c                |  49 ++
 include/drm/drm_mode_object.h                 |   2 +-
 include/drm/drm_plane.h                       |   7 +
 include/drm/drm_property.h                    |   6 +
 include/uapi/drm/drm_mode.h                   |   8 +
 16 files changed, 1377 insertions(+), 109 deletions(-)

-- 
2.40.1

