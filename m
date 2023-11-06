Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6297E2CE8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 20:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F3A10E3EA;
	Mon,  6 Nov 2023 19:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999C510E3E9;
 Mon,  6 Nov 2023 19:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OVVOlTIarNX7e6zMEZmJVvGlQRSRufjZRH7oNdzWmmc=; b=rxr8KNHd9z1rYs+McTOREX3GMf
 HgdNuuqUWPJJHqLjOY3iwLLEYBvzU884vwlb9KnaTUcR7efnIvMEpJ/s3jzmJDxcSvyQg/OiweAcH
 14yYVjkhY9sMAXV2wDT+X9CD6SIBqSUxodMUZbTND3Q5s2BUvMHXADvouaSNvhGgo1IL1uIB2ulWO
 gaPuzZMKRiVonqN6JVCqfHezELz/ZXpiAT1XJv5HBlxhVBA+RCJbrT27M+cn0OYopxnKWl7tVR9Ml
 LaxBjtovuDZZaM5CIWDmGJ215LKc+GQyRGm8NvN+uzKSha9tiPsuAD/m7YqQ0vkstnP0JZ6tVLYAD
 iM2ByOzg==;
Received: from [102.213.205.115] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r05MQ-0008JT-Fb; Mon, 06 Nov 2023 20:34:10 +0100
Date: Mon, 6 Nov 2023 18:33:54 -0100
From: Melissa Wen <mwen@igalia.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH v4 00/32] drm/amd/display: add AMD driver-specific
 properties for color mgmt
Message-ID: <20231106193354.ce4vi4p6zgol5f4y@mail.igalia.com>
References: <20231005171527.203657-1-mwen@igalia.com>
 <20231006092825.GB400742@toolbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006092825.GB400742@toolbox>
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
Cc: liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 Shashank Sharma <Shashank.Sharma@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>, kernel-dev@igalia.com, sunpeng.li@amd.com,
 mripard@kernel.org, sungjoon.kim@amd.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Xinhui.Pan@amd.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, tzimmermann@suse.de,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/06, Sebastian Wick wrote:
> On Thu, Oct 05, 2023 at 04:14:55PM -0100, Melissa Wen wrote:
> > Hello,
> > 
> > Just another iteration for AMD driver-specific color properties.
> > Basically, addressing comments from the previous version.
> > 
> > Recap: this series extends the current KMS color management API with AMD
> > driver-specific properties to enhance the color management support on
> > AMD Steam Deck. The key additions to the color pipeline include:
> 
> Did you talk with the maintainers about this already? The last few times
> driver specific properties, and even kind of generic plane properties
> with a fixed position in the pipeline were proposed they were all
> NAKed. Just putting them behind a define doesn't sound great and I don't
> think there is any precedence for allowing this in. This is basically
> just more burden for upstream without any benefits for upstream.

Hi Sebastian,

Sorry for delaying. I believe it was already answered during the XDC KMS
color workshop, but: yes, I've talked with them and they are fine with
the cflags approach. Remember that we are not using here kconfig anymore.
The driver-specific properties (creation and attachment) are guarded by
cflags, not a kernel building option. We changed to cflags after Harry's
suggestion in the first version.

I think the main point for upstream it now is that we can actually
exercise the plane color properties and all machinery around new color
elements (as 3D LUT) with a userspace that cares about it (Gamescope).
Worth mentioning that I removed CRTC shaper/3D LUT support from previous
version, because, even with the internal implementation, we don't have
how to exercise these CRTC properties right now.

Finally, the main goal is ofc attaching it to the generic API from
Harry's series. We are all in the same page about it.

BR,

Melissa

> 
> Maybe you can separate the uAPI changes from the internal improvements
> to land at least parts of this faster.
> 
> > - plane degamma LUT and pre-defined TF;
> > - plane HDR multiplier;
> > - plane CTM 3x4;
> > - plane shaper LUT and pre-defined TF;
> > - plane 3D LUT;
> > - plane blend LUT and pre-defined TF;
> > - CRTC gamma pre-defined TF;
> > 
> > You can find the AMD HW color capabilities documented here:
> > https://dri.freedesktop.org/docs/drm/gpu/amdgpu/display/display-manager.html#color-management-properties
> > 
> > The userspace case is Gamescope[1], the compositor for SteamOS.
> > Gamescope has already adopted AMD driver-specific properties to
> > implement comprehensive color management support, including gamut
> > mapping, HDR rendering, SDR on HDR, HDR on SDR. Using these features in
> > the SteamOS 3.5[2] users can expect a significantly enhanced visual
> > experience. 
> > 
> > You can find a brief overview of the Steam Deck color pipeline here:
> > https://github.com/ValveSoftware/gamescope/blob/master/src/docs/Steam%20Deck%20Display%20Pipeline.png
> > 
> > Changes from:
> > 
> > [RFC] https://lore.kernel.org/dri-devel/20230423141051.702990-1-mwen@igalia.com
> > - Remove KConfig and guard properties with `AMD_PRIVATE_COLOR`;
> > - Remove properties for post-blending/CRTC shaper TF+LUT and 3D LUT;
> > - Use color caps to improve the support of pre-defined curve;
> > 
> > [v1] https://lore.kernel.org/dri-devel/20230523221520.3115570-1-mwen@igalia.com
> > - Replace DRM_ by AMDGPU_ prefix for transfer function (TF) enum; 
> > - Explicitly define EOTFs and inverse EOTFs and set props accordingly;
> > - Document pre-defined transfer functions;
> > - Remove HLG transfer function from supported TFs;
> > - Remove misleading comments;
> > - Remove post-blending shaper TF+LUT and 3D LUT support;
> > - Move driver-specific property operations from amdgpu_display.c to
> >   amdgpu_dm_color.c;
> > - Reset planes if any color props change;
> > - Add plane CTM 3x4 support;
> > - Removed two DC fixes already applied upstream;
> > 
> > [v2] https://lore.kernel.org/dri-devel/20230810160314.48225-1-mwen@igalia.com
> > - Many documentation fixes: BT.709 OETF, description of sRGB and pure
> >   power functions, TF+1D LUT behavior;
> > - Rename CTM2 to CTM 3x4 and fix misleading comment about DC gamut remap;
> > - Squash `Linear` and `Unity` TF in `Identity`;
> > - Remove the `MPC gamut remap` patch already applied upstream[3];
> > - Remove outdated delta segmentation fix;
> > - Nits/small fixes;
> > 
> > [v3] https://lore.kernel.org/amd-gfx/20230925194932.1329483-1-mwen@igalia.com
> > - Add table to describe value range in linear and non-linear forms
> > - Comment the PQ TF need after HDR multiplier
> > - Advertise the 3D LUT size as the size of a single-dimension (read-only)
> > - remove function to check expected size from 3DLUT caps
> > - cleanup comments
> > 
> > It's worth noting that driver-specific properties are guarded by
> > `AMD_PRIVATE_COLOR`. So, finally, this is the color management API when
> > driver-specific properties are enabled:
> > 
> > +----------------------+
> > |   PLANE              |
> > |                      |
> > |  +----------------+  |
> > |  | AMD Degamma    |  |
> > |  |                |  |
> > |  | EOTF | 1D LUT  |  |
> > |  +--------+-------+  |
> > |           |          |
> > |  +--------v-------+  |
> > |  |    AMD HDR     |  |
> > |  |    Multiply    |  |
> > |  +--------+-------+  |
> > |           |          |
> > |  +--------v-------+  |
> > |  |  AMD CTM (3x4) |  |
> > |  +--------+-------+  |
> > |           |          |
> > |  +--------v-------+  |
> > |  | AMD Shaper     |  |
> > |  |                |  |
> > |  | inv_EOTF |     |  |
> > |  | Custom 1D LUT  |  |
> > |  +--------+-------+  |
> > |           |          |
> > |  +--------v-------+  |
> > |  |   AMD 3D LUT   |  |
> > |  |   17^3/12-bit  |  |
> > |  +--------+-------+  |
> > |           |          |
> > |  +--------v-------+  |
> > |  | AMD Blend      |  |
> > |  |                |  |
> > |  | EOTF | 1D LUT  |  |
> > |  +--------+-------+  |
> > |           |          |
> > ++----------v---------++
> > ||      Blending      ||
> > ++----------+---------++
> > |    CRTC   |          |
> > |           |          |
> > |   +-------v-------+  |
> > |   | DRM Degamma   |  |
> > |   |               |  |
> > |   | Custom 1D LUT |  |
> > |   +-------+-------+  |
> > |           |          |
> > |   +-------v-------+  |
> > |   | DRM CTM (3x3) |  |
> > |   +-------+-------+  |
> > |           |          |
> > |   +-------v-------+  |
> > |   | DRM Gamma     |  |
> > |   |               |  |
> > |   | Custom 1D LUT |  |
> > |   +---------------+  |
> > |   | *AMD Gamma    |  |
> > |   |   inv_EOTF    |  |
> > |   +---------------+  |
> > |                      |
> > +----------------------+
> > 
> > Please, let us know your thoughts.
> > 
> > Best Regards,
> > 
> > Melissa Wen
> > 
> > [1] https://github.com/ValveSoftware/gamescope
> > [2] https://store.steampowered.com/news/app/1675200/view/3686804163591367815
> > [3] https://lore.kernel.org/dri-devel/20230721132431.692158-1-mwen@igalia.com
> > 
> > Joshua Ashton (14):
> >   drm/amd/display: add plane degamma TF driver-specific property
> >   drm/amd/display: add plane HDR multiplier driver-specific property
> >   drm/amd/display: add plane blend LUT and TF driver-specific properties
> >   drm/amd/display: add CRTC gamma TF support
> >   drm/amd/display: set sdr_ref_white_level to 80 for out_transfer_func
> >   drm/amd/display: mark plane as needing reset if color props change
> >   drm/amd/display: add plane degamma TF and LUT support
> >   drm/amd/display: add dc_fixpt_from_s3132 helper
> >   drm/amd/display: add HDR multiplier support
> >   drm/amd/display: handle empty LUTs in __set_input_tf
> >   drm/amd/display: add plane blend LUT and TF support
> >   drm/amd/display: allow newer DC hardware to use degamma ROM for PQ/HLG
> >   drm/amd/display: copy 3D LUT settings from crtc state to stream_update
> >   drm/amd/display: Add 3x4 CTM support for plane CTM
> > 
> > Melissa Wen (18):
> >   drm/drm_mode_object: increase max objects to accommodate new color
> >     props
> >   drm/drm_property: make replace_property_blob_from_id a DRM helper
> >   drm/drm_plane: track color mgmt changes per plane
> >   drm/amd/display: add driver-specific property for plane degamma LUT
> >   drm/amd/display: explicitly define EOTF and inverse EOTF
> >   drm/amd/display: document AMDGPU pre-defined transfer functions
> >   drm/amd/display: add plane 3D LUT driver-specific properties
> >   drm/amd/display: add plane shaper LUT and TF driver-specific
> >     properties
> >   drm/amd/display: add CRTC gamma TF driver-specific property
> >   drm/amd/display: add comments to describe DM crtc color mgmt behavior
> >   drm/amd/display: encapsulate atomic regamma operation
> >   drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
> >   drm/amd/display: reject atomic commit if setting both plane and CRTC
> >     degamma
> >   drm/amd/display: add plane shaper LUT support
> >   drm/amd/display: add plane shaper TF support
> >   drm/amd/display: add plane 3D LUT support
> >   drm/amd/display: add plane CTM driver-specific property
> >   drm/amd/display: add plane CTM support
> > 
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  90 ++
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  34 +-
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 108 +++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 821 ++++++++++++++++--
> >  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  72 ++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 224 ++++-
> >  .../gpu/drm/amd/display/include/fixed31_32.h  |  12 +
> >  drivers/gpu/drm/arm/malidp_crtc.c             |   2 +-
> >  drivers/gpu/drm/drm_atomic.c                  |   1 +
> >  drivers/gpu/drm/drm_atomic_state_helper.c     |   1 +
> >  drivers/gpu/drm/drm_atomic_uapi.c             |  43 +-
> >  drivers/gpu/drm/drm_property.c                |  49 ++
> >  include/drm/drm_mode_object.h                 |   2 +-
> >  include/drm/drm_plane.h                       |   7 +
> >  include/drm/drm_property.h                    |   6 +
> >  include/uapi/drm/drm_mode.h                   |   8 +
> >  16 files changed, 1371 insertions(+), 109 deletions(-)
> > 
> > -- 
> > 2.40.1
> > 
> 
