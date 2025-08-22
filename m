Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E90B3169F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 13:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDF910EACF;
	Fri, 22 Aug 2025 11:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L6bP1S33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5804410E0A4;
 Fri, 22 Aug 2025 11:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755863185; x=1787399185;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DG+Z9zGwVBdw+iNUDM7OJf0FKLNPCYqi43Rw+dTD7y8=;
 b=L6bP1S33pOIXyUa6jPMGf56nlcFPhDz1SyNvgglrdeeylpOrdpKcQTX0
 zP0sQ2BSwbZow1uaopTviGtYmCqKlaXCs58ncNw9DFD9pfuTMj2Wd8R5x
 b6axKKhahWvP4K2iyM6l0BObqMadx+Ly5MPWgaTX4O5U82wYaCunYcvyW
 5NAFTMqK4nyXbw/x21qEffWPwvB5I5q14e3ySU6JGo4baFnZ2CI1HRSh+
 h1qZ0zISUMa0/qRBzn67ZwWNtQSRL/hPMDaUqEBRkJHWw3hoCpDR6WklI
 /mnnyL9Nphrm/PK6asUmezR8O6R2ssTbzVlUbDlg0pxbfux70VwaarxmO g==;
X-CSE-ConnectionGUID: qSdvk0T5ReOIdWw79455iA==
X-CSE-MsgGUID: IN5SpjcHQ7at9kSkWPzg8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58092747"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="58092747"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 04:46:24 -0700
X-CSE-ConnectionGUID: qYIxGarjR/2dHnUjCxVt5A==
X-CSE-MsgGUID: xtX7KW9SQnCZjz8h9u53kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="169051597"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 04:46:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Arun R Murthy
 <arun.r.murthy@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 naveen1.kumar@intel.com, xaver.hugl@kde.org, uma.shankar@intel.com,
 harry.wentland@amd.com
Subject: Re: [PATCH v3 4/4] drm/i915/display: Error codes for async flip
 failures
In-Reply-To: <1043ceb7-8198-48ed-9040-9e5d08a01723@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
 <20250822-atomic-v3-4-13a0e8f2c581@intel.com>
 <1043ceb7-8198-48ed-9040-9e5d08a01723@linux.intel.com>
Date: Fri, 22 Aug 2025 14:46:17 +0300
Message-ID: <b47b8fb423abc20f77dc637afbf2007a124247e1@intel.com>
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

On Fri, 22 Aug 2025, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> Hey,
>
> I'm not entirely sold on the design, it's way more complicated than it
> should be, it should be trivial to add any amount of error messages.

If we add error messages, how do we ensure the error messages themselves
never become part of UAPI? It doesn't take much for someone in userspace
to start doing strcmp on them.

> Replace return -EINVAL; with return drm_atomic_error_einval(state, class, "string");

Yeah, much cleaner. And if we go this route, then maybe make it printf
style to avoid callers having to clumsily fill a buffer first.

> Where class may be an enum, but in a way more generic way than
> currently specified, for example "invalid use of api", "requires
> modeset", "invalid arguments", "driver limitations", "async flip not
> possible".

That's also easier for userspace to deal with than a plethora of
flags. I guess the goals were more ambitious wrt precision/granularity,
but is that achievable?

BR,
Jani.

> The drm_atomic_error_einval() would set class and str as appropriate,
> and then return -EINVAL.
>
> That's probably all we should need here.
>
> Kind regards,
> ~Maarten
>
> Den 2025-08-22 kl. 09:00, skrev Arun R Murthy:
>> For failures in async flip atomic check/commit path return user readable
>> error codes in struct drm_atomic_state.
>> 
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>> index c1a3a95c65f0b66c24ddd64f47dfdc67bbde86c9..5e23f4fc747bd01fa05eba63661bf7279b083317 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -5950,6 +5950,7 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
>>  		drm_dbg_kms(display->drm,
>>  			    "[CRTC:%d:%s] modeset required\n",
>>  			    crtc->base.base.id, crtc->base.name);
>> +		state->base.error_code->failure_flags = DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET;
>>  		return -EINVAL;
>>  	}
>>  
>> @@ -6019,6 +6020,7 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
>>  		drm_dbg_kms(display->drm,
>>  			    "[CRTC:%d:%s] modeset required\n",
>>  			    crtc->base.base.id, crtc->base.name);
>> +		state->base.error_code->failure_flags = DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET;
>>  		return -EINVAL;
>>  	}
>>  
>> @@ -6061,6 +6063,8 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
>>  				    plane->base.base.id, plane->base.name,
>>  				    &new_plane_state->hw.fb->format->format,
>>  				    new_plane_state->hw.fb->modifier);
>> +			state->base.error_code->failure_flags =
>> +				DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED;
>>  			return -EINVAL;
>>  		}
>>  
>> 
>

-- 
Jani Nikula, Intel
