Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2525868D82
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 11:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B15B10F2E3;
	Tue, 27 Feb 2024 10:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=froggi.es header.i=@froggi.es header.b="OLiOQHrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB2110E8D9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 10:26:31 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-33dcad9e3a2so1192151f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 02:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=froggi.es; s=google; t=1709029589; x=1709634389; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Uhi+WrGIQRRJ8lSNfTDvuyNrAsyGAd/wwG+ZXqbxAiY=;
 b=OLiOQHrSZrZ7D8H3Ck0wt4cL1NgvYL5jlxkMOS/j25W5qyFE8nWEtka6tLNRoaoKAJ
 HgmIR4Iq6zT0P1oeplNrVLqd0SjOnNnH7xWAgtUJVGum2Mkj2lgDZjbDAoG4+UDaVpKr
 C3rveJx35ruWvt0fDjbAthki6RSYwnjMvpcijpncWbOSQ0ew7KIrdwMu1CLHhqmyisWm
 VM5sX+1FhoCe3o+LSNadKOCh4bJgAdR4y3G6MOHKF+GWfUDNXg0PzRq+ufG74C2aABiM
 oHg2Jm49cYZz/IghbTfnDh7pmwL8CEg/HGlYlgBVWB9GeQ6rbMCJj07dCEqLp0k+0pkf
 VneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709029589; x=1709634389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uhi+WrGIQRRJ8lSNfTDvuyNrAsyGAd/wwG+ZXqbxAiY=;
 b=ovSa3IyRNm3C+BG6RoFrwVG95UzygemOPjvRPfTCfrKprzTck4YCL6GQJdPhzZIDlX
 RczIfb41A/wpvbwpZ8UKqaukkTeIaNOD1UddKC8/c82hg/Fqa1ghFQIZz4Wc50SS37Aa
 uY0YkYHbsvEcyWHxQC3Rfqlpmg72xHdgNmPf1n7dji5UwaVrzSdf8kz2vqkJ7rSBdmCt
 5v+fLMj7y+Nh5RdccIS5Zs56+5ZDnHY+z50NYKoYex+OKmNE33078W6aRpaX3p532g1K
 4KXzblVdXp4D9ljfGf/t7wCD1PjKPR/JukwnUoOdM3xoGrwX7HVj/A4M3rIteWSlq/Zk
 Gp+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtqOnEuMnm1Gs5X+9NeFcynOVEvUhXHH+fiD5wsuMLViqjsS4YiX255+t3lKF+4awGwwpe3P/8AlRieWHUnMFNfSMKPqJXb8Aj/1myKLaB
X-Gm-Message-State: AOJu0YxA/xDmRRlrUoEcMpRREEnweEVRZUU4FjKAXrQ497HtbaWV4NH3
 SDxKMVk2eZnz1y32ApUnwJZVYaGoQVI7QH94XocuHqQgqS0XwRP4Ae5me4YmPxU=
X-Google-Smtp-Source: AGHT+IFqZH8rmOCDpZ3D4x/lYkOfBXXnFSclNKDnxRlrjGhdDlBXDhTO23kdXm0W/NqSHHSPGYLFqQ==
X-Received: by 2002:a5d:5267:0:b0:33d:5250:71b3 with SMTP id
 l7-20020a5d5267000000b0033d525071b3mr6901307wrc.57.1709029589425; 
 Tue, 27 Feb 2024 02:26:29 -0800 (PST)
Received: from [192.168.0.89]
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 d24-20020adf9b98000000b0033dedaee5d5sm1600842wrc.30.2024.02.27.02.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 02:26:28 -0800 (PST)
Message-ID: <f4839262-493c-495d-9fd0-bb9eb81ac430@froggi.es>
Date: Tue, 27 Feb 2024 10:26:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 00/42] Color Pipeline API w/ VKMS
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Alexander Goins <agoins@nvidia.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Aleix Pol <aleixpol@kde.org>,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Victoria Brekenfeld <victoria@system76.com>, Sima <daniel@ffwll.ch>,
 Uma Shankar <uma.shankar@intel.com>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Hector Martin <marcan@marcan.st>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Sasha McIntosh
 <sashamcintosh@google.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
From: Joshua Ashton <joshua@froggi.es>
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/26/24 21:10, Harry Wentland wrote:
> This is an RFC set for a color pipeline API, along with a sample
> implementation in VKMS. All the key API bits are here. VKMS now
> supports two named transfer function colorops and two matrix
> colorops. We have IGT tests that check all four of these colorops
> with a pixel-by-pixel comparison that checks that these colorops
> do what we expect them to do with a +/- 1 8 bpc code point margin.
> 
> The big new change with v4 is the addition of an amdgpu color
> pipeline, for all AMD GPUs with DCN 3 and newer. Amdgpu now support
> the following:
> 
> 1. 1D Curve EOTF
> 2. 3x4 CTM
> 3. Multiplier
> 4. 1D Curve Inverse EOTF
> 5. 1D LUT
> 6. 1D Curve EOTF
> 7. 1D LUT
> 
> The supported curves for the 1D Curve type are:
> - sRGB EOTF and its inverse
> - PQ EOTF, scaled to [0.0, 125.0] and its inverse
> - BT.2020/BT.709 OETF and its inverse
> 
> Note that the 1st and 5th colorops take the EOTF or Inverse
> OETF while the 3rd colorop takes the Inverse EOTF or OETF.
> 
> We are working on two more ops for amdgpu, the HDR multiplier
> and the 3DLUT, which will give us this:
> 
> 1. 1D Curve EOTF
> 2. 3x4 CTM
> 3. HDR Multiplier
> 4. 1D Curve Inverse EOTF
> 5. 1D LUT
> 6. 3D LUT
> 7. 1D Curve EOTF
> 8. 1D LUT
> 
> This, essentially mirrors the color pipeline used by gamescope
> and presented by Melissa Wen, with the exception of the DEGAM
> LUT, which is not currently used. See
> [1] https://indico.freedesktop.org/event/4/contributions/186/attachments/138/218/xdc2023-TheRainbowTreasureMap-MelissaWen.pdf
> 
> After this we'd like to also add the following ops:
> - Scaler (Informational only)

Why informational only? Having NEAREST and in general custom taps should 
be possible on AMDGPU right?

We don't have to solve this now, but I just want to make sure that we 
aren't locking this to info only.

Thanks

- Joshie 🐸✨

> - Color Encoding, to replace drm_plane's COLOR_ENCODING
> - Color Range, to replace drm_plane's COLOR_RANGE
> 
> This patchset is grouped as follows:
>   - Patches 1-3: couple general patches/fixes
>   - Patches 4-7: introduce kunit to VKMS
>   - Patch 7: description of motivation and details behind the
>              Color Pipeline API. If you're reading nothing else
>              but are interested in the topic I highly recommend
>              you take a look at this.
>   - Patches 7-27: DRM core and VKMS changes for color pipeline API
>   - Patches 28-40: DRM core and amdgpu changes for color pipeline API
> 
> VKMS patches could still be improved in a few ways, though the
> payoff might be limited and I would rather focus on other work
> at the moment. The most obvious thing to improve would be to
> eliminate the hard-coded LUTs for identity, and sRGB, and replace
> them with fixed-point math instead.
> 
> There are plenty of things that I would like to see here but
> haven't had a chance to look at. These will (hopefully) be
> addressed in future iterations, either in VKMS or amdgpu:
>   - Clear documentation for each drm_colorop_type
>   - Add custom LUT colorops to VKMS
>   - Add pre-blending 3DLUT
>   - How to support HW which can't bypass entire pipeline?
>   - Add ability to create colorops that don't have BYPASS
>   - Can we do a LOAD / COMMIT model for LUTs (and other properties)?
>   - read-only scaling colorop which defines scaling taps and position
>   - read-only color format colorop to define supported color formats
>     for a pipeline
>   - named matrices, for things like converting YUV to RGB
> 
> IGT tests can be found at
> https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/merge_requests/1
> 
> IGT patches are also being sent to the igt-dev mailing list.
> 
> If you prefer a gitlab MR for review you can find it at
> https://gitlab.freedesktop.org/hwentland/linux/-/merge_requests/5
> 
> v4:
>   - Add amdgpu color pipeline (WIP)
>   - Don't block setting of deprecated properties, instead pass client cap
>     to atomic check so drivers can ignore these props
>   - Drop IOCTL definitions (Pekka)
>   - Use enum property for colorop TYPE (Pekka)
>   - A few cleanups to the docs (Pekka)
>   - Rework the TYPE enum to name relation to avoid code duplication (Pekka)
>   - Add missing function declarations (Chaitanya Kumar Borah)
>   - Allow setting of NEXT property to NULL in _set_ function (Chaitanya Kumar Borah)
>   - Add helper for creation of pipeline drm_plane property (Pekka)
>   - Always create Bypass pipeline (Pekka)
>   - A bunch of changes to VKMS kunit tests (Pekka)
>   - Fix index in CTM doc (Pekka)
> 
> v3:
>   - Abandon IOCTLs and discover colorops as clients iterate the pipeline
>   - Remove need for libdrm
>   - Add color_pipeline client cap and make mutually exclusive with
>     COLOR_RANGE and COLOR_ENCODING properties
>   - add CTM colorop to VKMS
>   - Use include way for kunit testing static functions (Arthur)
>   - Make TYPE a range property
>   - Move enum drm_colorop_type to uapi header
>   - and a bunch of smaller bits that are highlighted in the relevant commit
>     description
> 
> v2:
>   - Rebased on drm-misc-next
>   - Introduce a VKMS Kunit so we can test LUT functionality in vkms_composer
>   - Incorporate feedback in color_pipeline.rst doc
>   - Add support for sRGB inverse EOTF
>   - Add 2nd enumerated TF colorop to VKMS
>   - Fix LUTs and some issues with applying LUTs in VKMS
> 
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Alexander Goins <agoins@nvidia.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Michel Dänzer <mdaenzer@redhat.com>
> Cc: Aleix Pol <aleixpol@kde.org>
> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> Cc: Victoria Brekenfeld <victoria@system76.com>
> Cc: Sima <daniel@ffwll.ch>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> Cc: Christopher Braga <quic_cbraga@quicinc.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
> Cc: Sasha McIntosh <sashamcintosh@google.com>
> Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> 
> Alex Hung (10):
>    drm/colorop: define a new macro for_each_new_colorop_in_state
>    drm/amd/display: Skip color pipeline initialization for cursor plane
>    drm/amd/display: Add support for sRGB EOTF in DEGAM block
>    drm/amd/display: Add support for sRGB Inverse EOTF in SHAPER block
>    drm/amd/display: Add support for sRGB EOTF in BLND block
>    drm/colorop: Add 1D Curve Custom LUT type
>    drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT
>    drm/amd/display: add 3x4 matrix colorop
>    drm/colorop: Add mutliplier type
>    drm/amd/display: add multiplier colorop
> 
> Harry Wentland (32):
>    drm: Don't treat 0 as -1 in drm_fixp2int_ceil
>    drm: Add helper for conversion from signed-magnitude
>    drm: Correctly round for fixp2int_round
>    drm/vkms: Round fixp2int conversion in lerp_u16
>    drm/vkms: Create separate Kconfig file for VKMS
>    drm/vkms: Add kunit tests for VKMS LUT handling
>    drm/vkms: Avoid reading beyond LUT array
>    drm/doc/rfc: Describe why prescriptive color pipeline is needed
>    drm/colorop: Introduce new drm_colorop mode object
>    drm/colorop: Add TYPE property
>    drm/colorop: Add 1D Curve subtype
>    drm/colorop: Add BYPASS property
>    drm/colorop: Add NEXT property
>    drm/colorop: Add atomic state print for drm_colorop
>    drm/plane: Add COLOR PIPELINE property
>    drm/colorop: Add NEXT to colorop state print
>    drm/vkms: Add enumerated 1D curve colorop
>    drm/vkms: Add kunit tests for linear and sRGB LUTs
>    drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>    drm/colorop: Add 3x4 CTM type
>    drm/vkms: Pull apply_colorop out of pre_blend_color_transform
>    drm/vkms: Use s32 for internal color pipeline precision
>    drm/vkms: add 3x4 matrix in color pipeline
>    drm/tests: Add a few tests around drm_fixed.h
>    drm/vkms: Add tests for CTM handling
>    drm/colorop: pass plane_color_pipeline client cap to atomic check
>    drm/amd/display: Ignore deprecated props when plane_color_pipeline set
>    drm/amd/display: Add bypass COLOR PIPELINE
>    drm/colorop: Add PQ 125 EOTF and its inverse
>    drm/amd/display: Enable support for PQ 125 EOTF and Inverse
>    drm/colorop: add BT2020/BT709 OETF and Inverse OETF
>    drm/amd/display: Add support for BT.709 and BT.2020 TFs
> 
>   Documentation/gpu/rfc/color_pipeline.rst      | 360 ++++++++
>   drivers/gpu/drm/Kconfig                       |  14 +-
>   drivers/gpu/drm/Makefile                      |   1 +
>   .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 352 ++++++++
>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 160 ++++
>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  32 +
>   drivers/gpu/drm/drm_atomic.c                  | 161 +++-
>   drivers/gpu/drm/drm_atomic_helper.c           |  12 +
>   drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
>   drivers/gpu/drm/drm_atomic_uapi.c             | 158 ++++
>   drivers/gpu/drm/drm_colorop.c                 | 411 +++++++++
>   drivers/gpu/drm/drm_ioctl.c                   |   7 +
>   drivers/gpu/drm/drm_mode_config.c             |   7 +
>   drivers/gpu/drm/drm_plane.c                   |  52 ++
>   drivers/gpu/drm/tests/Makefile                |   3 +-
>   drivers/gpu/drm/tests/drm_fixp_test.c         |  69 ++
>   drivers/gpu/drm/vkms/Kconfig                  |  20 +
>   drivers/gpu/drm/vkms/Makefile                 |   4 +-
>   drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>   drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 449 ++++++++++
>   drivers/gpu/drm/vkms/vkms_colorop.c           | 100 +++
>   drivers/gpu/drm/vkms/vkms_composer.c          | 135 ++-
>   drivers/gpu/drm/vkms/vkms_drv.h               |   8 +
>   drivers/gpu/drm/vkms/vkms_luts.c              | 802 ++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
>   drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
>   include/drm/drm_atomic.h                      | 122 +++
>   include/drm/drm_atomic_uapi.h                 |   3 +
>   include/drm/drm_colorop.h                     | 301 +++++++
>   include/drm/drm_file.h                        |   7 +
>   include/drm/drm_fixed.h                       |  35 +-
>   include/drm/drm_mode_config.h                 |  18 +
>   include/drm/drm_plane.h                       |  13 +
>   include/uapi/drm/drm.h                        |  16 +
>   include/uapi/drm/drm_mode.h                   |  14 +
>   38 files changed, 3882 insertions(+), 30 deletions(-)
>   create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
>   create mode 100644 drivers/gpu/drm/drm_colorop.c
>   create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
>   create mode 100644 drivers/gpu/drm/vkms/Kconfig
>   create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>   create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>   create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>   create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>   create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
>   create mode 100644 include/drm/drm_colorop.h
> 
> --
> 2.44.0
> 

