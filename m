Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70D6777D33
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BCB10E56A;
	Thu, 10 Aug 2023 16:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4591110E563;
 Thu, 10 Aug 2023 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OtEX00Zz86ZdotII/QVp6fdEQKAfqBlaMcy6m5VgsMI=; b=fDSz/VVOxqter06/jIssmOeO+H
 fVJK10sgVPQYSKS/UHFrFjwTfMMutnUjGojo3TqDt6iYEPh0/nHvt4jUlHGsWwn8l1aDA30ZCHQ16
 IAgdhZphuWCmjqv0AumUWHWdgTmEed1UbADxpdPhr6QwVdK4aOC6+WDYcUEScCwvcAFRP1s/bcsd4
 1my7pL6/TVPNRfVPFVKV+hqwQLYTkmg4v6mByAqJDnXmY+2ejUjbr8ChHlWq+oPVC0rmyJUsFg6Gf
 U7kTnwZGn19p6jlFof77AG0gTuHPFSlffJ0nGduv40ssDpnBR67zjHLEL+F4OnUHB6AwJgQCEYBI5
 QLEbJjRA==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qU885-00GjYD-Ll; Thu, 10 Aug 2023 18:03:17 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, brian.starkey@arm.com, christian.koenig@amd.com,
 daniel@ffwll.ch, liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, Xinhui.Pan@amd.com
Subject: [PATCH v2 00/34] drm/amd/display: add AMD driver-specific properties
 for color mgmt
Date: Thu, 10 Aug 2023 15:02:40 -0100
Message-Id: <20230810160314.48225-1-mwen@igalia.com>
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
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Here is the next version of our work to enable AMD driver-specific color
management properties [1][2]. This series is a collection of
contributions from Joshua, Harry, and me to enhance the AMD KMS color
pipeline for Steam Deck/SteamOS by exposing additional pre-blending and
post-blending color capabilities from those available in the current DRM
KMS API[3].

The userspace case here is Gamescope which is the compositor for
SteamOS. Gamescope is already using these features to implement its
color management pipeline [4].

In this version, I try to address all concerns shared in the previous
one, i.e.:
- Replace DRM_ by AMDGPU_ prefix for transfer function enumeration; 
- Explicitly define EOTFs and inverse EOTFs and set props accordingly;
- Document pre-defined transfer functions;
- Remove misleading comments;
- Remove post-blending/MPC shaper and 3D LUT support;
- Move driver-specific property operations from amdgpu_display.c to
  amdgpu_dm_color.c;
- Reset planes if any color props change;
- Nits/small fixes;

Bearing in mind the complexity of color concepts, I believe there is a
high chance of some misunderstanding from my side when defining EOTFs
and documenting pre-defined TFs. So, reviews are very important and
welcome (thanks in advance). FWIW, I added Harry as a co-developer of
this TF documentation since I based on his description of EOTF/inv_EOTF
and previous documentation work [5]. Let me know if there is a better
way for credits.

Two DC patches were already applied and, therefore, removed from the
series. I added r-b according to previous feedback. We also add plane
CTM to driver-specific properties. As a result, this is the updated list
of all driver-specific color properties exposed by this series:

- plane degamma LUT and pre-defined TF;
- plane HDR multiplier;
- plane CTM 3x4;
- plane shaper LUT and pre-defined TF;
- plane 3D LUT;
- plane blend LUT and pre-defined TF;
- CRTC gamma pre-defined TF;

Remember you can find the AMD HW color capabilities documented here:
https://dri.freedesktop.org/docs/drm/gpu/amdgpu/display/display-manager.html#color-management-properties

Worth mentioning that the pre-blending degamma block can use ROM curves
for some pre-defined TFs, but the other blocks use the AMD color module
to calculate this curve considering pre-defined coefficients.

We need changes on DC gamut remap matrix to support the plane and CRTC
CTM on drivers that support both. I've sent a previous patch to apply
these changes to all DCN3+ families [6]. Here I use the same changes but
limited to DCN301. Just let me know if you prefer the previous/expanded
version.

Finally, this is the Linux/AMD color management API before and after
blending with the driver-specific properties:

+----------------------+
|   PLANE              |
|                      |
|  +----------------+  |
|  | AMD Degamma    |  |
|  |                |  |
|  | EOTF | 1D LUT  |  |
|  +--------+-------+  |
|           |          |
|  +--------v-------+  |
|  |    AMD HDR     |  |
|  |    Multiply    |  |
|  +--------+-------+  |
|           |          |
|  +--------v-------+  |
|  |  AMD CTM (3x4) |  |
|  +--------+-------+  |
|           |          |
|  +--------v-------+  |
|  | AMD Shaper     |  |
|  |                |  |
|  | inv_EOTF |     |  |
|  | Custom 1D LUT  |  |
|  +--------+-------+  |
|           |          |
|  +--------v-------+  |
|  |   AMD 3D LUT   |  |
|  |   17^3/12-bit  |  |
|  +--------+-------+  |
|           |          |
|  +--------v-------+  |
|  | AMD Blend      |  |
|  |                |  |
|  | EOTF | 1D LUT  |  |
|  +--------+-------+  |
|           |          |
++----------v---------++
||      Blending      ||
++----------+---------++
|    CRTC   |          |
|           |          |
|   +-------v-------+  |
|   | DRM Degamma   |  |
|   |               |  |
|   | Custom 1D LUT |  |
|   +-------+-------+  |
|           |          |
|   +-------v-------+  |
|   | DRM CTM (3x3) |  |
|   +-------+-------+  |
|           |          |
|   +-------v-------+  |
|   | DRM Gamma     |  |
|   |               |  |
|   | Custom 1D LUT |  |
|   +---------------+  |
|   | *AMD Gamma    |  |
|   |   inv_EOTF    |  |
|   +---------------+  |
|                      |
+----------------------+

Let me know your thoughts.

Best Regards,

Melissa Wen

[1] https://lore.kernel.org/dri-devel/20230423141051.702990-1-mwen@igalia.com
[2] https://lore.kernel.org/dri-devel/20230523221520.3115570-1-mwen@igalia.com
[3] https://github.com/ValveSoftware/gamescope/blob/master/src/docs/Steam%20Deck%20Display%20Pipeline.png
[4] https://github.com/ValveSoftware/gamescope
[5] https://lore.kernel.org/dri-devel/20210730204134.21769-1-harry.wentland@amd.com
[6] https://lore.kernel.org/dri-devel/20230721132431.692158-1-mwen@igalia.com


Harry Wentland (1):
  drm/amd/display: fix segment distribution for linear LUTs

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
  drm/amd/display: Use 3x4 CTM for plane CTM

Melissa Wen (19):
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
  drm/amd/display: set stream gamut remap matrix to MPC for DCN301
  drm/amd/display: add plane CTM driver-specific property
  drm/amd/display: add plane CTM support

 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  71 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  34 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 101 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 805 ++++++++++++++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  72 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 224 ++++-
 .../amd/display/dc/dcn10/dcn10_cm_common.c    |  93 +-
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |  37 +
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |   3 +
 .../drm/amd/display/dc/dcn301/dcn301_init.c   |   2 +-
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
 20 files changed, 1446 insertions(+), 127 deletions(-)

-- 
2.40.1

