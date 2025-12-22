Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4D8CD6695
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 15:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7207910E0F5;
	Mon, 22 Dec 2025 14:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEMG6Izc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D38D10E05D;
 Mon, 22 Dec 2025 14:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766414696; x=1797950696;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zdyK52t++zeXs0qCyraNq1sLq9xvMET/4UU9Mznu2OE=;
 b=nEMG6IzcbGXFhBdx25siUWlJ8om7iELmi7SVt4o3jf7HoGiresXXIVx2
 v2Cxk+Vljhf7VXllWb8QBnkaRDGFGexPUrwA03iELVB2SuG6zTvn43WgJ
 DgpTxa596DBFCgajl7AVb/2xMau670ZuUGe0AUaSYQYpKv++thXoptyf+
 uanvnqLKdbBWOOptRQpBcxS5OPcnSeW5/ArOOdBj0ho0uqotfiayjq1Gi
 Wn11S7QbN/wiVkI4wvrytOTa4BgO7Grcj8+zqPWInX/1txQprHRUByEdg
 0GlcdgrcJjKkN4+eVw7cHb4gNAPGVciryZR3b8W9/pGSFu1OcWnRnfl18 g==;
X-CSE-ConnectionGUID: FHO0RSQZQa2hzJTH0uZRxA==
X-CSE-MsgGUID: 2qoStUK4Rn+MihDzNsWLxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="78588351"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="78588351"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 06:44:56 -0800
X-CSE-ConnectionGUID: 2fTBnh1/SX+kWFJ/1UVDqA==
X-CSE-MsgGUID: pggsNDjPSbKv8fSiK4ll1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="199306877"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.79])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 06:44:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>, Harry
 Wentland <harry.wentland@amd.com>, Daniel Stone <daniels@collabora.com>,
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH v2] drm/atomic: convert
 drm_atomic_get_{old,new}_colorop_state() into proper functions
In-Reply-To: <53746714-c989-4f9a-96a0-f2044705ffb9@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251219114939.1069851-1-jani.nikula@intel.com>
 <53746714-c989-4f9a-96a0-f2044705ffb9@amd.com>
Date: Mon, 22 Dec 2025 16:44:50 +0200
Message-ID: <39b45d9eefcebc2afd47fd2aee6d5f40b6db03e1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 19 Dec 2025, Alex Hung <alex.hung@amd.com> wrote:
> Reviewed-by: Alex Hung <alex.hung@amd.com>

Thanks, pushed to drm-misc-next.

BR,
Jani.c

>
> On 12/19/25 04:49, Jani Nikula wrote:
>> There is no real reason to include drm_colorop.h from drm_atomic.h, as
>> drm_atomic_get_{old,new}_colorop_state() have no real reason to be
>> static inline.
>> 
>> Convert the static inlines to proper functions, and drop the include to
>> reduce the include dependencies and improve data hiding.
>> 
>> v2: Fix vkms build failures (Alex)
>> 
>> Fixes: cfc27680ee20 ("drm/colorop: Introduce new drm_colorop mode object")
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Alex Hung <alex.hung@amd.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Daniel Stone <daniels@collabora.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>> 
>> Including the massive Cc list because I don't want to keep doing this
>> afterwards. This stuff needs to be blocked and fixed during review. Just
>> stop including headers from headers. It's a PITA to clean up.
>> ---
>>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  3 ++
>>   drivers/gpu/drm/drm_atomic.c                  | 32 +++++++++++++++
>>   drivers/gpu/drm/drm_atomic_helper.c           |  1 +
>>   .../drm/i915/display/intel_display_types.h    |  1 +
>>   drivers/gpu/drm/vkms/vkms_composer.c          |  1 +
>>   drivers/gpu/drm/vkms/vkms_drv.c               |  1 +
>>   include/drm/drm_atomic.h                      | 39 ++++---------------
>>   7 files changed, 47 insertions(+), 31 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
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
>> @@ -641,6 +641,38 @@ drm_atomic_get_colorop_state(struct drm_atomic_state *state,
>>   }
>>   EXPORT_SYMBOL(drm_atomic_get_colorop_state);
>>   
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
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
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
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
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
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index 3cf3f26e0d8e..cd85de4ffd03 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -5,6 +5,7 @@
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_blend.h>
>> +#include <drm/drm_colorop.h>
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_fixed.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
>> index dd1402f43773..434c295f44ba 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.c
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
>> @@ -17,6 +17,7 @@
>>   #include <drm/drm_gem.h>
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_colorop.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fbdev_shmem.h>
>>   #include <drm/drm_file.h>
>> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
>> index 74ce26fa8838..178f8f62c80f 100644
>> --- a/include/drm/drm_atomic.h
>> +++ b/include/drm/drm_atomic.h
>> @@ -30,7 +30,6 @@
>>   
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_util.h>
>> -#include <drm/drm_colorop.h>
>>   
>>   /**
>>    * struct drm_crtc_commit - track modeset commits on a CRTC
>> @@ -712,6 +711,14 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
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
>> @@ -808,36 +815,6 @@ drm_atomic_get_new_plane_state(const struct drm_atomic_state *state,
>>   	return state->planes[drm_plane_index(plane)].new_state;
>>   }
>>   
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
>>    * drm_atomic_get_old_connector_state - get connector state, if it exists
>>    * @state: global atomic state object
>

-- 
Jani Nikula, Intel
