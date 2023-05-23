Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBD370E8B6
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD9210E4F5;
	Tue, 23 May 2023 22:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D8810E136;
 Tue, 23 May 2023 22:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IIR+jE2XxI6RVO6j5cNTOytAj3YHvL4mnBn4IIcwdpE=; b=SCQuR7ABAdXp4wOblUyhXjUsSG
 d+75OfnvkDylIHHe+IfLNTjJ4+LdI9QJSLi4KVPf0FAaXKr8r2Vofo8dndNno5pTPRy28twyDRZX9
 gCr4CUHrhBywbIt05Mq8SfBxMfhcaak8/rXHNlqtcIZ/kJedFFD9j5f4OZZa80HTPQ21XQmevuFn6
 xFqQ1WbycxrtJTAEArdnFkauBGrDLFWO/pG+1JfRO2gprrrUN/0tTduwikbJULbulCjNst7x+dTOm
 +WMEbAtBR9BdAkKLog6IILKcM+9AdZBrn/knTInSx3n9aXZYbeI/S32eG0eYYfdJSoCe3eTZcemJ7
 nXApQoGQ==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aHq-00HEOv-KQ; Wed, 24 May 2023 00:15:22 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, brian.starkey@arm.com, christian.koenig@amd.com,
 daniel@ffwll.ch, liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, Xinhui.Pan@amd.com
Subject: [PATCH 00/36] drm/amd/display: add AMD driver-specific properties for
 color mgmt
Date: Tue, 23 May 2023 21:14:44 -0100
Message-Id: <20230523221520.3115570-1-mwen@igalia.com>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is a refined version of our RFC [1] for AMD driver-specific
color management properties. It is a collection of contributions from
Joshua, Harry and I to enhance AMD KMS color pipeline for Steam
Deck/SteamOS by exposing the large set of color caps available in AMD
display HW.

Considering RFC feedback, this patchset differs from the previous one by
removing the KConfig option and just guarding driver-specific properties
with `AMD_PRIVATE_COLOR` - but we also removed the guards from internal
elements and operations. We stopped to advertise CRTC shaper and 3D LUTs
properties since they aren't in use in the Steam Deck color pipeline[2].
On the other hand, we keep mapping CRTC shaper and 3D LUTs (DM) to DC
MPC setup. We also improved curve calculations to take into account HW
color caps.

In short, for pre-blending, we added the following properties:
- plane degamma LUT and predefined transfer function;
- plane HDR multiplier
- plane shaper LUT/transfer function;
- plane 3D LUT; and finally,
- plane blend LUT/transfer function, just before blending.

After blending, we already have DRM CRTC degamma/gamma LUTs and CTM,
therefore, we extend post-blending color pipeline with CRTC gamma
transfer function.

The first three patches are on DRM KMS side. We expose DRM property
helper for blob lookup and replacement so that we can use it for
managing driver-specific properties. We add a tracked for plane color
mgmt changes and increase the maximum number of properties to
accommodate this expansion.

The userspace case here is Gamescope which is the compositor for
SteamOS. It's already using all of this functionality to implement its
color management pipeline right now [3].

Current IGT tests kms_color and amdgpu/amd_color on DCN301 and DCN21 HW
preserve the same results with and without the guard. 

Finally, I may have missed something, please let me know if that's the
case.

Best Regards,

Melissa Wen

[1] https://lore.kernel.org/dri-devel/20230423141051.702990-1-mwen@igalia.com
[2] https://github.com/ValveSoftware/gamescope/blob/master/src/docs/Steam%20Deck%20Display%20Pipeline.png
[3] https://github.com/ValveSoftware/gamescope


Harry Wentland (2):
  drm/amd/display: fix segment distribution for linear LUTs
  drm/amd/display: fix the delta clamping for shaper LUT

Joshua Ashton (13):
  drm/amd/display: add plane degamma TF driver-specific property
  drm/amd/display: add plane HDR multiplier driver-specific property
  drm/amd/display: add plane blend LUT and TF driver-specific properties
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

Melissa Wen (21):
  drm/drm_mode_object: increase max objects to accommodate new color
    props
  drm/drm_property: make replace_property_blob_from_id a DRM helper
  drm/drm_plane: track color mgmt changes per plane
  drm/amd/display: add CRTC driver-specific property for gamma TF
  drm/amd/display: add plane driver-specific properties for degamma LUT
  drm/amd/display: add plane 3D LUT driver-specific properties
  drm/amd/display: add plane shaper LUT driver-specific properties
  drm/amd/display: add plane shaper TF driver-private property
  drm/amd/display: add comments to describe DM crtc color mgmt behavior
  drm/amd/display: encapsulate atomic regamma operation
  drm/amd/display: update lut3d and shaper lut to stream
  drm/amd/display: allow BYPASS 3D LUT but keep shaper LUT settings
  drm/amd/display: handle MPC 3D LUT resources for a given context
  drm/amd/display: add CRTC 3D LUT support
  drm/amd/display: add CRTC shaper LUT support
  drm/amd/display: add CRTC shaper TF support
  drm/amd/display: mark plane as needing reset if plane color mgmt
    changes
  drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
  drm/amd/display: reject atomic commit if setting both plane and CRTC
    degamma
  drm/amd/display: program DPP shaper and 3D LUT if updated
  drm/amd/display: add plane shaper/3D LUT and shaper TF support

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 125 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  69 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  28 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 110 +++-
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 612 ++++++++++++++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  72 ++-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 213 +++++-
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  49 +-
 drivers/gpu/drm/amd/display/dc/dc.h           |   8 +
 .../amd/display/dc/dcn10/dcn10_cm_common.c    | 107 ++-
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |   5 +-
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |   9 +-
 .../amd/display/dc/dcn301/dcn301_resource.c   |  26 +-
 .../gpu/drm/amd/display/include/fixed31_32.h  |  12 +
 drivers/gpu/drm/arm/malidp_crtc.c             |   2 +-
 drivers/gpu/drm/drm_atomic.c                  |   1 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   1 +
 drivers/gpu/drm/drm_atomic_uapi.c             |  43 +-
 drivers/gpu/drm/drm_property.c                |  49 ++
 include/drm/drm_mode_object.h                 |   2 +-
 include/drm/drm_plane.h                       |   7 +
 include/drm/drm_property.h                    |   6 +
 22 files changed, 1416 insertions(+), 140 deletions(-)

-- 
2.39.2

