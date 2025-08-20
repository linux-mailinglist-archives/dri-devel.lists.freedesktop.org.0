Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EB8B30822
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 23:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D9410EA30;
	Thu, 21 Aug 2025 21:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FBhq10yC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB7510E35D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 19:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755719001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zZJYFiConab2237y5PJFAkBYUyerhvx6Lw8cD2OhvG8=;
 b=FBhq10yCjT8lcw9g3jSTzcYMk/kMX66Z5H4+18ZkmTOuzsJpFzG+wJQBXL2jZrJ+kmK9JM
 vBGT0p2OeyW4bqX105fgZ0t0wWqxWrpPIn61diLNFPBM31M6V6l+0l/FKJpGjih9nIPKzk
 ktKk69dDAU/Xkg5G3C0ER5joJwPE2xs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-K3BaDtphMyeyR-g6YhI0FA-1; Wed, 20 Aug 2025 15:43:19 -0400
X-MC-Unique: K3BaDtphMyeyR-g6YhI0FA-1
X-Mimecast-MFC-AGG-ID: K3BaDtphMyeyR-g6YhI0FA_1755718999
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3b9edf5b346so165488f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 12:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755718999; x=1756323799;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zZJYFiConab2237y5PJFAkBYUyerhvx6Lw8cD2OhvG8=;
 b=F2iHSyesZcPnHeT2DM77fqIKUh7uwZHKQIbbIjssS9l/Jp3DeB6qbqCqLRDKa/x5uk
 IvcG2G4pwOpfXY2exkyAyGEXtL9tY4mg70L7yX0gZl0rWqNijC469SX/tmvGK+pL/VeD
 qQuSMey5vDwLX+41vQ7iY5UvekFB1w5E40fwrvRfQ7hdLC/A3lngQXedlkEsXm0ZXaYb
 wM3R5adTmKeMxXYbgtEthZBX/809oCivqEtzTA9ErpP46Xqa29IlkwfT8N+EkT5HCx7j
 GaeMyMzVm5LCUQxqpXjRxwlb3iqj01zpfPlTBKodEmWtO+MMM2hm8w72TiQMkdVI7ycG
 Ptaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuY94BABqWc4dgY/Hz4P7pbQQorUTFHeZV/ChbbeBaXJg4RNmRenx11APQjJSuPRtp3UPgGrs0Vy8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEyVThCAQpFMh1ERKHDUrfBDC9hBs/1R2Xi2jPQYQxB2zrzvM/
 m00oXcTEhDP15XfRUEH8n/+RjaZ+t2MbVf54PfkuAcHsYr0VPlghqfMyWBaZv+jHnaztW2DWVal
 QVkZLaeSGasBNPlMZkU/eo7qnZrCZ6ZRMjEhqsHMbpgt2ml0BCeGcTNVCiU8um8OsoR9uQg==
X-Gm-Gg: ASbGnctwZNrUjyDFj0StGXX6vFBdONCcIdV+fmk8x56tqLEdR9vPjBuSCTFtbXz5IZc
 FfTH6RYUszhOA3whSwpsGRp4WBy7Z/lE9+S2kO4BvwfQWkQ+AuiC0BVYttf74mZ19OE2Fmcj53f
 fZhd01XTHKrGwcq6BxbjhYd/wHSpcCsq5w/O7WPRnGdeDGkOlZwQxGVn9wTYNMcAJaStvVQH4uy
 NCDwifpA5bxseDZpvS9gcFg8KElYdSo6KYYLsU9/QLUl4hRUCvq0Ld/tjWNhNQhWj2x3phGBV0Y
 jZbYetpQxUyFj1zWBP3Vu9sovKh7+/5hUk1veSyc6y0/YQ==
X-Received: by 2002:a05:6000:2903:b0:3b9:1c80:e1ce with SMTP id
 ffacd0b85a97d-3c496f92f18mr28871f8f.36.1755718998573; 
 Wed, 20 Aug 2025 12:43:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExjapZVYT/mCqOPrwjrlTiASypnOf82Kro44qoIqB1c4d0IhadYObl/jHMIJstZTwfoZr2gg==
X-Received: by 2002:a05:6000:2903:b0:3b9:1c80:e1ce with SMTP id
 ffacd0b85a97d-3c496f92f18mr28829f8f.36.1755718997915; 
 Wed, 20 Aug 2025 12:43:17 -0700 (PDT)
Received: from localhost ([2001:9e8:899d:e200:81f1:3d49:5938:f438])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c077c57aa0sm8794262f8f.66.2025.08.20.12.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Aug 2025 12:43:17 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 20 Aug 2025 21:43:16 +0200
Message-Id: <DC7IFW2G7A8H.3AI37UGHP38EJ@redhat.com>
Cc: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <shashank.sharma@amd.com>, <agoins@nvidia.com>,
 <joshua@froggi.es>, <mdaenzer@redhat.com>, <aleixpol@kde.org>,
 <xaver.hugl@gmail.com>, <victoria@system76.com>, <daniel@ffwll.ch>,
 <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, "Arthur Grillo"
 <arthurgrillo@riseup.net>
Subject: Re: [PATCH V11 00/47] Color Pipeline API w/ VKMS
From: "Sebastian Wick" <sebastian.wick@redhat.com>
To: "Alex Hung" <alex.hung@amd.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20250815035047.3319284-1-alex.hung@amd.com>
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bXinDFigSNibfN9YQWyhnCB8lUFZ-1uW0r14mph6K4c_1755718999
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Thu, 21 Aug 2025 21:16:31 +0000
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


With the small improvements, the core drm parts are

Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>

On Fri Aug 15, 2025 at 5:49 AM CEST, Alex Hung wrote:
> This is an RFC set for a color pipeline API, along with implementations
> in VKMS and amdgpu. It is tested with a set of IGT tests that can be
> found at [1]. The IGT tests run a pixel-by-pixel comparison with an
> allowable delta variation as the goal for these transformations is
> perceptual correctness, not complete pixel accuracy.
>
> v5 of this patchset fleshed out documentation for colorops and the
> various defines that are being introduced.
>
> v6 addresses a few comments from various reviewers.
>
> v7 simplifies 3D LUT and addresses more comments from various reviewers.
>
> v8 fixes typo and errors and address comments from reviewers.
>
> v9 refactors cleanup functions, fixes typo and errors, and addresses
>    comments from reviewers.
>
> v10 add 32BIT RGB (drm_color_lut_32) to 1D & 3D LUTs, addresses comments
>     from reviewers, and fixes typo and errors.
>
> v11 change names from *_lut_32_* to *_lut32_* and fix RGB 32bit
>     extractions.
>
> VKMS supports two named transfer function colorops and two matrix
> colorops.
>
> Amdgpu advertises the following pipeline for GPUs with DCN 3 or newer:
>
> 1. 1D Curve EOTF
> 2. 3x4 CTM
> 3. Multiplier
> 4. 1D Curve Inverse EOTF
> 5. 1D LUT
> 6. 3D LUT
> 7. 1D Curve EOTF
> 8. 1D LUT
>
> The supported curves for the 1D Curve type are:
> - sRGB EOTF and its inverse
> - PQ EOTF, scaled to [0.0, 125.0] and its inverse
> - BT.2020/BT.709 OETF and its inverse
>
> Note that the 1st and 5th colorops take the EOTF or Inverse
> OETF while the 3rd colorop takes the Inverse EOTF or OETF.
>
> The 3D LUT is a 17^3 tetrahedrally interpolated LUT but the mechanism
> exists for other drivers to describe their own 3D LUT capability.
>
> This mirrors the color pipeline used by gamescope and presented by
> Melissa Wen, with the exception of the DEGAM LUT, which is not currently
> used. See [1]
> https://indico.freedesktop.org/event/4/contributions/186/attachments/138/=
218/xdc2023-TheRainbowTreasureMap-MelissaWen.pdf
>
> At this point we're hoping to see gamescope, kwin and weston implementati=
ons
> take shape. The existing pipeline should be enough to satisfy the
> gamescope use-cases on the drm_plane.
>
> In order to support YUV we'll need to add COLOR_ENCODING and COLOR_RANGE
> support to the color pipeline. I have sketched these out already but
> don't have it all hooked up yet. This should not hinder adoption of this
> API for gaming use-cases.
>
> We'll also want to advertise IN_FORMATS on a color pipeline as some
> color pipelines won't be able to work for all IN_FORMATS on a plane.
> Again, I have a sketch but no full implementation yet. This is not
> currently required by the AMD color pipeline and could be added after
> the merge of this set.
>
> VKMS patches could still be improved in a few ways, though the
> payoff might be limited and I would rather focus on other work
> at the moment. The most obvious thing to improve would be to
> eliminate the hard-coded LUTs for identity, and sRGB, and replace
> them with fixed-point math instead.
>
> There are plenty of things that I would like to see, but they could
> be added after the merge of this patchset:
>  - COLOR_ENCODING and COLOR_RANGE
>  - IN_FORMATS for a color pipeline
>  - Is it possible to support HW which can't bypass entire pipeline?
>  - Can we do a LOAD / COMMIT model for LUTs (and other properties)?
>  - read-only scaling colorop which defines scaling taps and position
>  - named matrices, for things like converting YUV to RGB
>  - Add custom LUT colorops to VKMS
>
> IGT tests can be found at [1] or on the igt-dev mailing list. There
> have been no updates since v5 and rebase on latest main is straight-
> forward.
>
> A kernel branch can be found at [2].
>
> [1] https://gitlab.freedesktop.org/alex.hung/igt-gpu-tools/-/tree/amd-col=
or-pipeline-v10
> [2] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipel=
ine-v11
>
> v11:
>  - Refactor vkms_color_test_lerp() to parametized tests (Ma=C3=ADra Canal=
)
>  - Sort include file alphabetically (Ma=C3=ADra Canal)
>  - Skip color_encoding/range_property in drm_mode_object_get_properties
>    when plane_color_pipeline is present (Harry Wentland)
>  - destroy function takes drm_device *dev instead of drm_plane *plane
>    (N=C3=ADcolas Prado)
>  - Fix undefined errors by EXPORT_SYMBOL symbols (kernel test robot)
>  - Fix comments to "2nd op 3x4 matrix" (N=C3=ADcolas Prado)
>  - Update outdated "drm_rect_test_suite" to "drm_fixp_test_suite" (Ma=C3=
=ADra
>    Canal)
>  - Update outdated MODULE_LICENSE to Dual MIT/GPL (Ma=C3=ADra Canal)
>  - Create color pipeline on supported hardware only (Melissa Wen)
>  - Update names from *_lut_32_* to *_lut32_* (Simon Ser)
>  - Include help function drm_color_lut32_extract (Uma Shankar)
>  - Remove redundant is_legacy from __drm_lut_32_to_dc_gamma (kernel bot)
>  - Fix RGB 32bit extraction from LUT (Xaver Hugl)
>  - Handle errors in __set_colorop_3dlut (N=C3=ADcolas Prado)
>  - Merged enable condition for drm_crtc_enable_color_mgmt (Melissa Wen)
>
> v10:
>  - remove duplicated "is useful" in comments (Melissa Wen)
>  - guard "dm_plane_init_colorops" function when !AMD_PRIVATE_COLOR (Melis=
sa Wen)
>  - Replace DRM_ERROR by drm_err
>  - Creaet color pipeline when >=3D DCN_VERSION_3_0 (Melissa Wen)
>  - Relocate amdgpu_dm_supported_*_tfs check (Melissa Wen)
>  - Support 32BIT RGB for 1D LUTs (Uma Shankar)
>  - Support 32BIT RGB for 3D LUTs (Harry Wentland)
>  - Fix typo mutliplier to multiplier in subject (Melissa Wen)
>  - 1D & 3D LUTs are no longer immutable ((Xaver Hugl)
>  - Fix 3D LUT kernel doc (Leandro Ribeiro)
>  - Check dpp.hw_3d_lut before creating shaper tf/lut and 3dlut colorops (=
Melissa Wen)
>  - Disable CRTC degamma when color pipeline is enabled (Melissa Wen)
>
> v9:
>  - Update RFC documents for 3DLUT and fallback behaviours (Simon Ser)
>  - Specify colorop function names by _plane_ (Chaitanya Kumar Borah)
>  - Remove redundant comments (Simon Ser)
>  - Fix typo in commit description (Shengyu Qu)
>  - Move destroy and cleanup functions earlier (Simon Ser)
>  - Move DRM_COLOROP_1D_CURVE_BT2020_* from middle to end (Simon Ser)
>  - Chagne "bool allow_bypass" to "uint32_t flags" for better extensibilit=
y (Simon Ser)
>  - Return a value in __set_dm_plane_colorop_3dlut
>
> v8:
>  - Change VKMS config names (Louis Chauvet)
>  - Remove deprecated function "drm_atomic_get_existing_colorop_state" (Lo=
uis Chauvet)
>  - Remove null check in drm_colorop_set_next_property (Simon Ser)
>  - Remove MAX_COLOR_PIPELINES in drm (Simon Ser)
>  - Update kernel docs and documents for DRM_COLOROP_3D_LUT (Simon Ser)
>  - Add comments for dmr_color_lut (Louis Chauvet)
>  - Fix typos and replace DRM_ERROR and DRM_WARN_ONCE by drm_err drm_WARN_=
ONCE (Louis Chauvet)
>  - Fix incorrect conditions in __set_colorop_in_tf_1d_curve (Leo Li)
>  - Add DRM_MODE_PROP_ATOMIC to drm_property_create_range (Simon Ser)
>  - Change "1D Curve Custom LUT" to "1D LUT" (Simon Ser)
>  - Return error when __set_output_tf fails (Leo Li)
>  - Return -EINVAL when drm_color_ctm_3x4's size mismatches (Leo Li)
>  - Set initialized to 0 and return when drm_lut3d_size is 0 (Harry Wentla=
nd)
>  - Rework tf->type =3D TF_TYPE_BYPASS for shaper (Harry Wentland & Leo Li=
)
>
> v7:
>  - Simplify 3D LUT by removing lut_3d_modes and update doc accordingly (S=
imon Ser)
>  - Add destroy / cleanup functions when color pipeline initialization
>    fails (Louis Chauvet)
>  - Fix checkpatch errors and warning (spaces, long lines, {}, and etc)
>  - Change lut's size from drm_colorop_state->size to drm_colorop->lut_siz=
e
>    and from size_property to lut_size_property
>  - Update some kernel updates and commit messagesa (Louis Chauvet)
>  - Squash "drm/colorop: Add atomic state print for drm_colorop" and
>    "drm/colorop: Add NEXT to colorop state print" (Simon Ser)
>  - Add missing MODULE_DESCRIPTION (Jeff Johnson)
>
> v6:
>  - Eliminate need to include test as .c file (Louis Chauvet)
>  - some doc updates
>  - cleanup if colorop alloc or init fails in VKMS and amdgpu (Louis Chauv=
et)
>  - couple other small improvements in VKMS, such as rounding (Louis Chauv=
et)
>  - take ref for DATA blob in duplicate_state func & fix refcount issues (=
Xaver Hugl)
>
> v5:
>  - amdgpu 3D LUT
>  - Don't require BYPASS
>  - update RFC docs and add to TOC tree
>  - add drm_colorop and COLOR_PIPELINE kernel docs (non-RFC)
>  - add amdgpu color pipeline doc
>  - define SIZE property similar to drm_crtc's GAMMA_SIZE
>  - various minor fixes and cleanups
>
> v4:
>  - Add amdgpu color pipeline (WIP)
>  - Don't block setting of deprecated properties, instead pass client cap
>    to atomic check so drivers can ignore these props
>  - Drop IOCTL definitions (Pekka)
>  - Use enum property for colorop TYPE (Pekka)
>  - A few cleanups to the docs (Pekka)
>  - Rework the TYPE enum to name relation to avoid code duplication (Pekka=
)
>  - Add missing function declarations (Chaitanya Kumar Borah)
>  - Allow setting of NEXT property to NULL in _set_ function (Chaitanya Ku=
mar Borah)
>  - Add helper for creation of pipeline drm_plane property (Pekka)
>  - Always create Bypass pipeline (Pekka)
>  - A bunch of changes to VKMS kunit tests (Pekka)
>  - Fix index in CTM doc (Pekka)
>
> v3:
>  - Abandon IOCTLs and discover colorops as clients iterate the pipeline
>  - Remove need for libdrm
>  - Add color_pipeline client cap and make mutually exclusive with
>    COLOR_RANGE and COLOR_ENCODING properties
>  - add CTM colorop to VKMS
>  - Use include way for kunit testing static functions (Arthur)
>  - Make TYPE a range property
>  - Move enum drm_colorop_type to uapi header
>  - and a bunch of smaller bits that are highlighted in the relevant commi=
t
>    description
>
> v2:
>  - Rebased on drm-misc-next
>  - Introduce a VKMS Kunit so we can test LUT functionality in vkms_compos=
er
>  - Incorporate feedback in color_pipeline.rst doc
>  - Add support for sRGB inverse EOTF
>  - Add 2nd enumerated TF colorop to VKMS
>  - Fix LUTs and some issues with applying LUTs in VKMS
>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Jonas =C3=85dahl <jadahl@redhat.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Alexander Goins <agoins@nvidia.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Michel D=C3=A4nzer <mdaenzer@redhat.com>
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
> Alex Hung (16):
>   drm/colorop: Add destroy functions for color pipeline
>   drm/colorop: define a new macro for_each_new_colorop_in_state
>   drm/amd/display: Skip color pipeline initialization for cursor plane
>   drm/amd/display: Add support for sRGB EOTF in DEGAM block
>   drm/amd/display: Add support for sRGB Inverse EOTF in SHAPER block
>   drm/amd/display: Add support for sRGB EOTF in BLND block
>   drm/colorop: Add 1D Curve Custom LUT type
>   drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT
>   drm/amd/display: add 3x4 matrix colorop
>   drm/colorop: Add multiplier type
>   drm/amd/display: add multiplier colorop
>   drm/amd/display: Swap matrix and multiplier
>   drm/colorop: Add 3D LUT support to color pipeline
>   drm/amd/display: add 3D LUT colorop
>   drm/amd/display: Ensure 3D LUT for color pipeline
>   drm/amd/display: Disable CRTC degamma when color pipeline is enabled
>
> Chaitanya Kumar Borah (1):
>   drm: Add helper to extract lut from struct drm_color_lut32
>
> Harry Wentland (29):
>   drm: Add helper for conversion from signed-magnitude
>   drm/vkms: Add kunit tests for VKMS LUT handling
>   drm/doc/rfc: Describe why prescriptive color pipeline is needed
>   drm/colorop: Introduce new drm_colorop mode object
>   drm/colorop: Add TYPE property
>   drm/colorop: Add 1D Curve subtype
>   drm/colorop: Add BYPASS property
>   drm/colorop: Add NEXT property
>   drm/colorop: Add atomic state print for drm_colorop
>   drm/plane: Add COLOR PIPELINE property
>   drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>   Documentation/gpu: document drm_colorop
>   drm/vkms: Add enumerated 1D curve colorop
>   drm/vkms: Add kunit tests for linear and sRGB LUTs
>   drm/colorop: Add 3x4 CTM type
>   drm/vkms: Use s32 for internal color pipeline precision
>   drm/vkms: add 3x4 matrix in color pipeline
>   drm/tests: Add a few tests around drm_fixed.h
>   drm/vkms: Add tests for CTM handling
>   drm/colorop: pass plane_color_pipeline client cap to atomic check
>   drm/amd/display: Ignore deprecated props when plane_color_pipeline set
>   drm/amd/display: Add bypass COLOR PIPELINE
>   drm/colorop: Add PQ 125 EOTF and its inverse
>   drm/amd/display: Enable support for PQ 125 EOTF and Inverse
>   drm/colorop: add BT2020/BT709 OETF and Inverse OETF
>   drm/amd/display: Add support for BT.709 and BT.2020 TFs
>   drm/colorop: Define LUT_1D interpolation
>   drm/colorop: allow non-bypass colorops
>   drm/amd/display: Add AMD color pipeline doc
>
> Uma Shankar (1):
>   drm: Add Enhanced LUT precision structure
>
>  Documentation/gpu/drm-kms.rst                 |  15 +
>  Documentation/gpu/rfc/color_pipeline.rst      | 378 ++++++++
>  Documentation/gpu/rfc/index.rst               |   3 +
>  drivers/gpu/drm/Makefile                      |   1 +
>  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 765 ++++++++++++++++-
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 205 +++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  26 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  39 +
>  drivers/gpu/drm/drm_atomic.c                  | 170 +++-
>  drivers/gpu/drm/drm_atomic_helper.c           |  12 +
>  drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
>  drivers/gpu/drm/drm_atomic_uapi.c             | 159 ++++
>  drivers/gpu/drm/drm_color_mgmt.c              |  43 +
>  drivers/gpu/drm/drm_colorop.c                 | 597 +++++++++++++
>  drivers/gpu/drm/drm_connector.c               |   1 +
>  drivers/gpu/drm/drm_crtc_internal.h           |   1 +
>  drivers/gpu/drm/drm_ioctl.c                   |   7 +
>  drivers/gpu/drm/drm_mode_config.c             |   7 +
>  drivers/gpu/drm/drm_mode_object.c             |  18 +
>  drivers/gpu/drm/drm_plane.c                   |  59 ++
>  drivers/gpu/drm/tests/Makefile                |   3 +-
>  drivers/gpu/drm/tests/drm_fixp_test.c         |  71 ++
>  drivers/gpu/drm/vkms/Makefile                 |   4 +-
>  drivers/gpu/drm/vkms/tests/Makefile           |   2 +-
>  drivers/gpu/drm/vkms/tests/vkms_color_test.c  | 417 +++++++++
>  drivers/gpu/drm/vkms/vkms_colorop.c           | 115 +++
>  drivers/gpu/drm/vkms/vkms_composer.c          | 134 ++-
>  drivers/gpu/drm/vkms/vkms_composer.h          |  27 +
>  drivers/gpu/drm/vkms/vkms_drv.h               |   7 +
>  drivers/gpu/drm/vkms/vkms_luts.c              | 811 ++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
>  drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
>  include/drm/drm_atomic.h                      | 111 +++
>  include/drm/drm_atomic_uapi.h                 |   3 +
>  include/drm/drm_color_mgmt.h                  |  29 +
>  include/drm/drm_colorop.h                     | 442 ++++++++++
>  include/drm/drm_file.h                        |   7 +
>  include/drm/drm_fixed.h                       |  18 +
>  include/drm/drm_mode_config.h                 |  18 +
>  include/drm/drm_plane.h                       |  19 +
>  include/uapi/drm/amdgpu_drm.h                 |   9 -
>  include/uapi/drm/drm.h                        |  15 +
>  include/uapi/drm/drm_mode.h                   | 134 +++
>  46 files changed, 4900 insertions(+), 64 deletions(-)
>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color=
op.c
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color=
op.h
>  create mode 100644 drivers/gpu/drm/drm_colorop.c
>  create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
>  create mode 100644 include/drm/drm_colorop.h

