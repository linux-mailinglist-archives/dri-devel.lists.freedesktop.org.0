Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40A7CCFA97
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 12:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE9410EF5F;
	Fri, 19 Dec 2025 11:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAj8lwJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682CB10EF5F;
 Fri, 19 Dec 2025 11:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766145022; x=1797681022;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=iqo0pthT9ZTp/rHTrFiXbDfYB6vLiomNLJKBB8x5uFI=;
 b=JAj8lwJqOCG5WaMU1zrL18X29Z4JrphOo3JYBmaXc+Y1y/G9cyV8KpNd
 uOzEJ8EG4Q1KwJXotH6sEr3sAdMxqNiohhy9rmP4JeYzZ3MqoAF2p2mzn
 wkR+S0O8xPQ5VO82sYf/39EiHZELfxNoJkgwOIlrOq4YS8FuPFP6XzqB/
 06kOJpywegZCos+Fxqqu7wYr3PsKNgghPkNZQWFJJdBFPvhv/Ox8IxDnG
 eDAPNRrYvAZAe0OPnwEEzEenpZAUR2zd3yTxetx1wDSErDgTFFigfot0c
 C9j5+TK4AMO2e9L9qrV2ODBJF24PeQOCGbJYP8jUGTa88WTOAPZkyaklr A==;
X-CSE-ConnectionGUID: CBlFuDZsSjuVtYEidBV3/Q==
X-CSE-MsgGUID: uU99u4CaRn+alskafbsXBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="90763289"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="90763289"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:50:21 -0800
X-CSE-ConnectionGUID: 0FlMvEwWRt6A5ClNI1B9sg==
X-CSE-MsgGUID: k4znRoOzS5mfn/HHv+KC5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="199100183"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.34])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:50:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>, Harry
 Wentland <harry.wentland@amd.com>, Daniel Stone <daniels@collabora.com>,
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH] drm/atomic: convert
 drm_atomic_get_{old,new}_colorop_state() into proper functions
In-Reply-To: <befebef3-0870-4c2d-a847-1fe1cc2acd7b@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251218141527.405328-1-jani.nikula@intel.com>
 <befebef3-0870-4c2d-a847-1fe1cc2acd7b@amd.com>
Date: Fri, 19 Dec 2025 13:50:14 +0200
Message-ID: <aaa7bc13a2a34eea7f591ff535c6eef5de5f0f30@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 18 Dec 2025, Alex Hung <alex.hung@amd.com> wrote:
> Hi Jani,
>
> Some compilation errors with this patch:

Thanks a lot, sent v2.

BR,
Jani.


>
> drivers/gpu/drm/vkms/vkms_drv.c: In function =E2=80=98vkms_destroy=E2=80=
=99:
> drivers/gpu/drm/vkms/vkms_drv.c:261:9: error: implicit declaration of=20
> function =E2=80=98drm_colorop_pipeline_destroy=E2=80=99=20
> [-Werror=3Dimplicit-function-declaration]
>    261 |         drm_colorop_pipeline_destroy(&config->dev->drm);
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[9]: *** [scripts/Makefile.build:287:=20
> drivers/gpu/drm/vkms/vkms_drv.o] Error 1
> make[9]: *** Waiting for unfinished jobs....
> drivers/gpu/drm/vkms/vkms_composer.c: In function =E2=80=98apply_colorop=
=E2=80=99:
> drivers/gpu/drm/vkms/vkms_composer.c:164:58: error: invalid use of=20
> undefined type =E2=80=98struct drm_colorop=E2=80=99
>    164 |         struct drm_colorop_state *colorop_state =3D colorop->sta=
te;
>        |                                                          ^~
> drivers/gpu/drm/vkms/vkms_composer.c:165:41: error: invalid use of=20
> undefined type =E2=80=98struct drm_colorop=E2=80=99
>    165 |         struct drm_device *dev =3D colorop->dev;
>        |                                         ^~
> drivers/gpu/drm/vkms/vkms_composer.c:167:20: error: invalid use of=20
> undefined type =E2=80=98struct drm_colorop=E2=80=99
>    167 |         if (colorop->type =3D=3D DRM_COLOROP_1D_CURVE) {
>        |                    ^~
> drivers/gpu/drm/vkms/vkms_composer.c:168:38: error: invalid use of=20
> undefined type =E2=80=98struct drm_colorop_state=E2=80=99
>    168 |                 switch (colorop_state->curve_1d_type) {
>        |                                      ^~
> drivers/gpu/drm/vkms/vkms_composer.c:169:22: error:=20
> =E2=80=98DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF=E2=80=99 undeclared (first us=
e in this function)
>    169 |                 case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
>        |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/vkms/vkms_composer.c:169:22: note: each undeclared=20
> identifier is reported only once for each function it appears in
> drivers/gpu/drm/vkms/vkms_composer.c:174:22: error:=20
> =E2=80=98DRM_COLOROP_1D_CURVE_SRGB_EOTF=E2=80=99 undeclared (first use in=
 this=20
> function); did you mean =E2=80=98DRM_COLOROP_1D_CURVE=E2=80=99?
>    174 |                 case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
> ...
>
>
> Including the drm_colorop.h in vkms_composer.c and vkms_drv.c fixes them:
>
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c=20
> b/drivers/gpu/drm/vkms/vkms_composer.c
> index 3cf3f26e0d8e..cd85de4ffd03 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -5,6 +5,7 @@
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_blend.h>
> +#include <drm/drm_colorop.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_fixed.h>
>   #include <drm/drm_gem_framebuffer_helper.h>
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c=20
> b/drivers/gpu/drm/vkms/vkms_drv.c
> index dd1402f43773..434c295f44ba 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -17,6 +17,7 @@
>   #include <drm/drm_gem.h>
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_colorop.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fbdev_shmem.h>
>   #include <drm/drm_file.h>
>
>
> Alex
>
> On 12/18/25 07:15, Jani Nikula wrote:
>> There is no real reason to include drm_colorop.h from drm_atomic.h, as
>> drm_atomic_get_{old,new}_colorop_state() have no real reason to be
>> static inline.
>>=20
>> Convert the static inlines to proper functions, and drop the include to
>> reduce the include dependencies and improve data hiding.
>>=20
>> Fixes: cfc27680ee20 ("drm/colorop: Introduce new drm_colorop mode object=
")
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Alex Hung <alex.hung@amd.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Daniel Stone <daniels@collabora.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>=20
>> ---
>>=20
>> Including the massive Cc list because I don't want to keep doing this
>> afterwards. This stuff needs to be blocked and fixed during review. Just
>> stop including headers from headers. It's a PITA to clean up.
>> ---
>>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  3 ++
>>   drivers/gpu/drm/drm_atomic.c                  | 32 +++++++++++++++
>>   drivers/gpu/drm/drm_atomic_helper.c           |  1 +
>>   .../drm/i915/display/intel_display_types.h    |  1 +
>>   include/drm/drm_atomic.h                      | 39 ++++---------------
>>   5 files changed, 45 insertions(+), 31 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> index 1dcc79b35225..20a76d81d532 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> @@ -23,6 +23,9 @@
>>    * Authors: AMD
>>    *
>>    */
>> +
>> +#include <drm/drm_colorop.h>
>> +
>>   #include "amdgpu.h"
>>   #include "amdgpu_mode.h"
>>   #include "amdgpu_dm.h"
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>> index 6d3ea8056b60..52738b80ddbe 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -641,6 +641,38 @@ drm_atomic_get_colorop_state(struct drm_atomic_stat=
e *state,
>>   }
>>   EXPORT_SYMBOL(drm_atomic_get_colorop_state);
>>=20=20=20
>> +/**
>> + * drm_atomic_get_old_colorop_state - get colorop state, if it exists
>> + * @state: global atomic state object
>> + * @colorop: colorop to grab
>> + *
>> + * This function returns the old colorop state for the given colorop, or
>> + * NULL if the colorop is not part of the global atomic state.
>> + */
>> +struct drm_colorop_state *
>> +drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
>> +				 struct drm_colorop *colorop)
>> +{
>> +	return state->colorops[drm_colorop_index(colorop)].old_state;
>> +}
>> +EXPORT_SYMBOL(drm_atomic_get_old_colorop_state);
>> +
>> +/**
>> + * drm_atomic_get_new_colorop_state - get colorop state, if it exists
>> + * @state: global atomic state object
>> + * @colorop: colorop to grab
>> + *
>> + * This function returns the new colorop state for the given colorop, or
>> + * NULL if the colorop is not part of the global atomic state.
>> + */
>> +struct drm_colorop_state *
>> +drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
>> +				 struct drm_colorop *colorop)
>> +{
>> +	return state->colorops[drm_colorop_index(colorop)].new_state;
>> +}
>> +EXPORT_SYMBOL(drm_atomic_get_new_colorop_state);
>> +
>>   static bool
>>   plane_switching_crtc(const struct drm_plane_state *old_plane_state,
>>   		     const struct drm_plane_state *new_plane_state)
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_a=
tomic_helper.c
>> index 10adac9397cf..5840e9cc6f66 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -34,6 +34,7 @@
>>   #include <drm/drm_atomic_uapi.h>
>>   #include <drm/drm_blend.h>
>>   #include <drm/drm_bridge.h>
>> +#include <drm/drm_colorop.h>
>>   #include <drm/drm_damage_helper.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_drv.h>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/driver=
s/gpu/drm/i915/display/intel_display_types.h
>> index 6ff53cd58052..eb2e3f1e83c9 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -34,6 +34,7 @@
>>   #include <drm/display/drm_dp_tunnel.h>
>>   #include <drm/display/drm_dsc.h>
>>   #include <drm/drm_atomic.h>
>> +#include <drm/drm_colorop.h>
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_encoder.h>
>>   #include <drm/drm_framebuffer.h>
>> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
>> index 74ce26fa8838..178f8f62c80f 100644
>> --- a/include/drm/drm_atomic.h
>> +++ b/include/drm/drm_atomic.h
>> @@ -30,7 +30,6 @@
>>=20=20=20
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_util.h>
>> -#include <drm/drm_colorop.h>
>>=20=20=20
>>   /**
>>    * struct drm_crtc_commit - track modeset commits on a CRTC
>> @@ -712,6 +711,14 @@ drm_atomic_get_plane_state(struct drm_atomic_state =
*state,
>>   struct drm_colorop_state *
>>   drm_atomic_get_colorop_state(struct drm_atomic_state *state,
>>   			     struct drm_colorop *colorop);
>> +
>> +struct drm_colorop_state *
>> +drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
>> +				 struct drm_colorop *colorop);
>> +struct drm_colorop_state *
>> +drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
>> +				 struct drm_colorop *colorop);
>> +
>>   struct drm_connector_state * __must_check
>>   drm_atomic_get_connector_state(struct drm_atomic_state *state,
>>   			       struct drm_connector *connector);
>> @@ -808,36 +815,6 @@ drm_atomic_get_new_plane_state(const struct drm_ato=
mic_state *state,
>>   	return state->planes[drm_plane_index(plane)].new_state;
>>   }
>>=20=20=20
>> -/**
>> - * drm_atomic_get_old_colorop_state - get colorop state, if it exists
>> - * @state: global atomic state object
>> - * @colorop: colorop to grab
>> - *
>> - * This function returns the old colorop state for the given colorop, or
>> - * NULL if the colorop is not part of the global atomic state.
>> - */
>> -static inline struct drm_colorop_state *
>> -drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
>> -				 struct drm_colorop *colorop)
>> -{
>> -	return state->colorops[drm_colorop_index(colorop)].old_state;
>> -}
>> -
>> -/**
>> - * drm_atomic_get_new_colorop_state - get colorop state, if it exists
>> - * @state: global atomic state object
>> - * @colorop: colorop to grab
>> - *
>> - * This function returns the new colorop state for the given colorop, or
>> - * NULL if the colorop is not part of the global atomic state.
>> - */
>> -static inline struct drm_colorop_state *
>> -drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
>> -				 struct drm_colorop *colorop)
>> -{
>> -	return state->colorops[drm_colorop_index(colorop)].new_state;
>> -}
>> -
>>   /**
>>    * drm_atomic_get_old_connector_state - get connector state, if it exi=
sts
>>    * @state: global atomic state object
>

--=20
Jani Nikula, Intel
