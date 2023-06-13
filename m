Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DACAB72F5FB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 09:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8F010E260;
	Wed, 14 Jun 2023 07:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AC010E3BA;
 Tue, 13 Jun 2023 15:44:00 +0000 (UTC)
Received: from ideasonboard.com (unknown
 [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F67AE4;
 Tue, 13 Jun 2023 17:43:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686671008;
 bh=69Y8mbPkcrpHvAWJab0wmj4G9uavhZYYSLIf/HtXip4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q9qJOZXuM0Md7IFQuErNgFFt28HvD+xzojk0IbacpF5xYQGEoHbpl316yTQ40J/z/
 HpUskdMcYa/UJj6UD98ac03OnavF2UYQCjUCovoVjmThU3DUb3r6tGNCNGtaJM6a6h
 KXuqUbIJhKMIuAmogfHIo2+tVUK0WRHyPRYEzMQg=
Date: Tue, 13 Jun 2023 17:43:55 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface
Message-ID: <yevhvooznvpqbuybp7tmbo6qgrbxzqrs4y2k4onrjnfbcz42et@hmiwqw74dhgc>
References: <20230109143846.1966301-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230109143846.1966301-1-mwen@igalia.com>
X-Mailman-Approved-At: Wed, 14 Jun 2023 07:20:34 +0000
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
Cc: dri-devel@lists.freedesktop.org, laurent.pinchart+renesas@ideasonboard.com,
 Shashank Sharma <shashank.sharma@amd.com>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, alex.hung@amd.com, tzimmermann@suse.de,
 sunpeng.li@amd.com, mripard@kernel.org, ppaalanen@gmail.com,
 seanpaul@chromium.org, bhawanpreet.lakha@amd.com, sungjoon.kim@amd.com,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 kernel-dev@igalia.com, alexander.deucher@amd.com, nicholas.kazlauskas@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello

   I'm completing the support for 3D LUT on R-Car DU peripheral
and I have used this series as a base.

I'm wondering, since quite some time has passed without any update if
this series is still a thing and it makes any sense for me to try to
bring it forward.

I'm asking as I've noticed:
"[PATCH 00/36] drm/amd/display: add AMD driver-specific properties for color mgmt"

which seems to supersede this proposal with driver-specific
properties.

I asked Melissa privately but I wasn't able to get an hold of her, so
if anyone has any clue feel free to reply :)

Thanks
  j

On Mon, Jan 09, 2023 at 01:38:28PM -0100, Melissa Wen wrote:
> Hi,
>
> After collecting comments in different places, here is a second version
> of the work on adding DRM CRTC 3D LUT support to the current DRM color
> mgmt interface. In comparison to previous proposals [1][2][3], here we
> add 3D LUT before gamma 1D LUT, but also a shaper 1D LUT before 3D LUT,
> that means the following DRM CRTC color correction pipeline:
>
> Blend -> Degamma 1D LUT -> CTM -> Shaper 1D LUT -> 3D LUT -> Gamma 1D LUT
>
> and we also add a DRM CRTC LUT3D_MODE property, based on Alex Hung
> proposal for pre-blending 3D LUT [4] (Thanks!), instead of just a
> LUT3D_SIZE, that allows userspace to use different supported settings of
> 3D LUT, fitting VA-API and new color API better. In this sense, I
> adjusted the pre-blending proposal for post-blending usage.
>
> Patches 1-6 targets the addition of shaper LUT and 3D LUT properties to
> the current DRM CRTC color mgmt pipeline. Patch 6 can be considered an
> extra/optional patch to define a default value for LUT3D_MODE, inspired
> by what we do for the plane blend mode property (pre-multiplied).
>
> Patches 7-18 targets AMD display code to enable shaper and 3D LUT usage
> on DCN 301 (our HW case). Patches 7-9 performs code cleanups on current
> AMD DM colors code, patch 10 updates AMD stream in case of user 3D LUT
> changes, patch 11/12 rework AMD MPC 3D LUT resource handling by context
> for DCN 301 (easily extendible to other DCN families). Finally, from
> 13-18, we wire up SHAPER LUT, LUT3D and LUT3D MODE to AMD display
> driver, exposing modes supported by HW and programming user shaper and
> 3D LUT accordingly.
>
> Our target userspace is Gamescope/SteamOS.
>
> Basic IGT tests were based on [5][6] and are available here (in-progress):
> https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commits/crtc-lut3d-api
>
> [1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com/
> [2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f30f9e5bdc17cbb4656fe23e69
> [3] https://lore.kernel.org/amd-gfx/20220619223104.667413-1-mwen@igalia.com/
> [4] https://lore.kernel.org/dri-devel/20221004211451.1475215-1-alex.hung@amd.com/
> [5] https://patchwork.freedesktop.org/series/90165/
> [6] https://patchwork.freedesktop.org/series/109402/
> [VA_API] http://intel.github.io/libva/structVAProcFilterParameterBuffer3DLUT.html
> [KMS_pipe_API] https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11
>
> Let me know your thoughts.
>
> Thanks,
>
> Melissa
>
> Alex Hung (2):
>   drm: Add 3D LUT mode and its attributes
>   drm/amd/display: Define 3D LUT struct for HDR planes
>
> Melissa Wen (16):
>   drm/drm_color_mgmt: add shaper LUT to color mgmt properties
>   drm/drm_color_mgmt: add 3D LUT props to DRM color mgmt
>   drm/drm_color_mgmt: add function to create 3D LUT modes supported
>   drm/drm_color_mgmt: add function to attach 3D LUT props
>   drm/drm_color_mgmt: set first lut3d mode as default
>   drm/amd/display: remove unused regamma condition
>   drm/amd/display: add comments to describe DM crtc color mgmt behavior
>   drm/amd/display: encapsulate atomic regamma operation
>   drm/amd/display: update lut3d and shaper lut to stream
>   drm/amd/display: handle MPC 3D LUT resources for a given context
>   drm/amd/display: acquire/release 3D LUT resources for ctx on DCN301
>   drm/amd/display: expand array of supported 3D LUT modes
>   drm/amd/display: enable 3D-LUT DRM properties if supported
>   drm/amd/display: add user 3D LUT support to the amdgpu_dm color
>     pipeline
>   drm/amd/display: decouple steps to reuse in shaper LUT support
>   drm/amd/display: add user shaper LUT support to amdgpu_dm color
>     pipeline
>
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   6 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   3 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 370 ++++++++++++++++--
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   2 +
>  drivers/gpu/drm/amd/display/dc/core/dc.c      |  49 ++-
>  drivers/gpu/drm/amd/display/dc/dc.h           |   8 +
>  .../amd/display/dc/dcn301/dcn301_resource.c   |  47 ++-
>  .../amd/display/modules/color/color_gamma.h   |  43 ++
>  drivers/gpu/drm/drm_atomic_state_helper.c     |   7 +
>  drivers/gpu/drm/drm_atomic_uapi.c             |  24 ++
>  drivers/gpu/drm/drm_color_mgmt.c              | 127 ++++++
>  drivers/gpu/drm/drm_fb_helper.c               |   5 +
>  drivers/gpu/drm/drm_mode_config.c             |  21 +
>  include/drm/drm_color_mgmt.h                  |   8 +
>  include/drm/drm_crtc.h                        |  32 +-
>  include/drm/drm_mode_config.h                 |  25 ++
>  include/drm/drm_mode_object.h                 |   2 +-
>  include/uapi/drm/drm_mode.h                   |  17 +
>  18 files changed, 757 insertions(+), 39 deletions(-)
>
> --
> 2.35.1
>
