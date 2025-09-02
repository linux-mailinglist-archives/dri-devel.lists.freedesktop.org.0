Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08000B3FC02
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 12:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26A510E1C8;
	Tue,  2 Sep 2025 10:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2ppawYp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483EA10E1C8;
 Tue,  2 Sep 2025 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756808222; x=1788344222;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Lr7K4DK449w1dY+sX0Z5IZ+NrRdgjSD14ibwnyRHDNA=;
 b=D2ppawYpXpNyKmKmWNjAbx6vK4z+2u6+hYKOJIvnndK2g0lWFeJ8NzMp
 Hk75rn5ADH2vttCtreDIPtgLQhvxTUPJEMzJGwRSE0P6puY3b3RRboOA6
 9yh3UlVJPP+bgw7bUkMwEe7v/WKawU3/zvT1NkGMBuql9G5d/7+E8q3xK
 WXf/4AqDBUjNHdDfW5kjOTkGyw75cXV6IirjUTrR23O+e8kus3TgjJgF3
 vE2lGtrh9wDyY3dZjlaVHvmhPBpXk3rqcJgbVHhpJiDe36IorAzRW0zMT
 Ae3P9Q1TRUmTWbotdbprTbkYUCmaD9Vws4kWxof3nUlHQGSIRRCFOLIpN g==;
X-CSE-ConnectionGUID: RexALSCjS4uNgs2uZurVhA==
X-CSE-MsgGUID: F9BOl/2PQuW3aWJMvNthcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58928267"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="58928267"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 03:17:02 -0700
X-CSE-ConnectionGUID: x6SUXcSjQl6U5jgRqw2jhA==
X-CSE-MsgGUID: NKnrmAJBRZ6TG+Erdy/v9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="202171881"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.193])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 03:16:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, xaver.hugl@kde.org, harry.wentland@amd.com,
 uma.shankar@intel.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH v4 3/4] drm/atomic: Return user readable error in
 atomic_ioctl
In-Reply-To: <20250902-atomic-v4-3-a97b4bed969b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250902-atomic-v4-0-a97b4bed969b@intel.com>
 <20250902-atomic-v4-3-a97b4bed969b@intel.com>
Date: Tue, 02 Sep 2025 13:16:52 +0300
Message-ID: <b7e82c4736145ccb8d9ba0e1381d7d2f89971563@intel.com>
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

On Tue, 02 Sep 2025, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> Add user readable error codes for failure cases in drm_atomic_ioctl() so
> that user can decode the error code and take corrective measurements.
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic.c      | 23 +++++++----
>  drivers/gpu/drm/drm_atomic_uapi.c | 83 ++++++++++++++++++++++++++++++---------
>  include/drm/drm_atomic.h          | 19 +++++++++
>  3 files changed, 100 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index cd15cf52f0c9144711da5879da57884674aea9e4..4f6c7e659b362f0887ffcc85dade1122fd30df3d 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1463,6 +1463,7 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  	unsigned int requested_crtc = 0;
>  	unsigned int affected_crtc = 0;
>  	int i, ret = 0;
> +	char *err_string;
>  
>  	drm_dbg_atomic(dev, "checking %p\n", state);
>  
> @@ -1511,8 +1512,13 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  	if (!state->allow_modeset) {
>  		for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
>  			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
> -				drm_dbg_atomic(dev, "[CRTC:%d:%s] requires full modeset\n",
> -					       crtc->base.id, crtc->name);
> +				err_string = "requires full modeset";

This points a non-const pointer to const data.

Anyway none of this should require or start a precendent of using local
variables all over the place for the error strings. It's ugly. Ditto
below for all the places.

If all the places calling drm_mode_atomic_add_error_msg() do debug
logging, maybe that's where the debug logging should be?

> +				drm_dbg_atomic(dev, "[CRTC:%d:%s] %s\n",
> +					       crtc->base.id, crtc->name, err_string);
> +				drm_mode_atomic_add_error_msg(state->error_code,
> +							      DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET,
> +							      err_string);

I guess you didn't want to follow what Maarten suggested.

> +
>  				return -EINVAL;

Adding the return is a functional change, and I mentioned it
earlier. Ignoring review is one of the certain ways to stop receiving
review in the future.

>  			}
>  		}
> @@ -1534,11 +1540,14 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  	 * so compositors know what's going on.
>  	 */
>  	if (affected_crtc != requested_crtc) {
> -		drm_dbg_atomic(dev,
> -			       "driver added CRTC to commit: requested 0x%x, affected 0x%0x\n",
> -			       requested_crtc, affected_crtc);
> -		WARN(!state->allow_modeset, "adding CRTC not allowed without modesets: requested 0x%x, affected 0x%0x\n",
> -		     requested_crtc, affected_crtc);
> +		err_string = "adding CRTC not allowed without modesets";
> +		drm_dbg_atomic(dev, "%s: requested 0x%x, affected 0x%0x\n",
> +			       err_string, requested_crtc, affected_crtc);
> +		drm_mode_atomic_add_error_msg(state->error_code,
> +					      DRM_MODE_ATOMIC_NEED_FULL_MODESET,
> +					      err_string);
> +
> +		return -EINVAL;

Adding the return is a functional change, and I mentioned it earlier.

>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 85dbdaa4a2e25878c953b9b41539c8566d55c6d9..60f1b8baebce0db1ce984c8cda56039261b519e8 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1017,6 +1017,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>  	struct drm_mode_object *ref;
>  	u64 old_val;
>  	int ret;
> +	char *err_string;
>  
>  	if (!drm_property_change_valid_get(prop, prop_value, &ref))
>  		return -EINVAL;
> @@ -1058,6 +1059,12 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>  			ret = drm_atomic_crtc_get_property(crtc, crtc_state,
>  							   prop, &old_val);
>  			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
> +			if (ret) {
> +				err_string = "property change not allowed in async flip";
> +				drm_mode_atomic_add_error_msg(state->error_code,
> +							      DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
> +							      err_string);
> +			}
>  			break;
>  		}
>  
> @@ -1096,9 +1103,14 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>  					ret = plane_funcs->atomic_async_check(plane, state, true);
>  
>  				if (ret) {
> +					err_string = "plane does not support async flip";
> +					drm_mode_atomic_add_error_msg(state->error_code,
> +								      DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,
> +								      err_string);
>  					drm_dbg_atomic(prop->dev,
> -						       "[PLANE:%d:%s] does not support async flips\n",
> -						       obj->id, plane->name);
> +							"[PLANE:%d:%s] %s\n",
> +						       obj->id, plane->name,
> +						       err_string);
>  					break;
>  				}
>  			}
> @@ -1390,42 +1402,63 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	uint32_t __user *props_ptr = (uint32_t __user *)(unsigned long)(arg->props_ptr);
>  	uint64_t __user *prop_values_ptr = (uint64_t __user *)(unsigned long)(arg->prop_values_ptr);
>  	unsigned int copied_objs, copied_props;
> -	struct drm_atomic_state *state;
> +	struct drm_atomic_state *state = NULL;

Unrelated change.

>  	struct drm_modeset_acquire_ctx ctx;
>  	struct drm_out_fence_state *fence_state;
> +	struct drm_mode_atomic_err_code error_code;
> +	struct drm_mode_atomic_err_code __user *error_code_ptr;
>  	int ret = 0;
>  	unsigned int i, j, num_fences;
>  	bool async_flip = false;
> +	char *err_string;
>  
>  	/* disallow for drivers not supporting atomic: */
>  	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
>  		return -EOPNOTSUPP;
>  
> +	if (!arg->reserved)
> +		drm_err(dev, "memory not allocated for drm_atomic error reporting\n");
> +	else
> +		/* update the error code if any error to allow user handling it */
> +		error_code_ptr = (struct drm_mode_atomic_err_code __user *)
> +				 (unsigned long)arg->reserved;
> +
> +	memset(&error_code, 0, sizeof(struct drm_mode_atomic_err_code));
> +
>  	/* disallow for userspace that has not enabled atomic cap (even
>  	 * though this may be a bit overkill, since legacy userspace
>  	 * wouldn't know how to call this ioctl)
>  	 */
>  	if (!file_priv->atomic) {
> +		err_string = "DRM_ATOMIC capability not enabled";

Yeah, just repeating, don't start using this err_string local variable
idea.

>  		drm_dbg_atomic(dev,
> -			       "commit failed: atomic cap not enabled\n");
> -		return -EINVAL;
> +			       "commit failed: %s\n", err_string);
> +		drm_mode_atomic_add_error_msg(&error_code,
> +					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
> +					      err_string);
> +		ret = -EINVAL;
> +		goto out;
>  	}
>  
>  	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS) {
> -		drm_dbg_atomic(dev, "commit failed: invalid flag\n");
> -		return -EINVAL;
> -	}
> -
> -	if (arg->reserved) {
> -		drm_dbg_atomic(dev, "commit failed: reserved field set\n");
> -		return -EINVAL;
> +		err_string = "invalid flag";
> +		drm_dbg_atomic(dev, "commit failed: %s\n", err_string);
> +		drm_mode_atomic_add_error_msg(&error_code,
> +					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
> +					      err_string);
> +		ret = -EINVAL;
> +		goto out;
>  	}
>  
>  	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
>  		if (!dev->mode_config.async_page_flip) {
> -			drm_dbg_atomic(dev,
> -				       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported\n");
> -			return -EINVAL;
> +			err_string = "DRM_MODE_PAGE_FLIP_ASYNC not supported with ATOMIC ioctl";
> +			drm_dbg_atomic(dev, "commit failed: %s\n", err_string);
> +			drm_mode_atomic_add_error_msg(&error_code,
> +						      DRM_MODE_ATOMIC_INVALID_API_USAGE,
> +						      err_string);
> +			ret = -EINVAL;
> +			goto out;
>  		}
>  
>  		async_flip = true;
> @@ -1434,9 +1467,13 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	/* can't test and expect an event at the same time. */
>  	if ((arg->flags & DRM_MODE_ATOMIC_TEST_ONLY) &&
>  			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
> -		drm_dbg_atomic(dev,
> -			       "commit failed: page-flip event requested with test-only commit\n");
> -		return -EINVAL;
> +		err_string = "page-flip event requested with test-only commit";
> +		drm_dbg_atomic(dev, "commit failed: %s\n", err_string);
> +		drm_mode_atomic_add_error_msg(&error_code,
> +					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
> +					      err_string);
> +		ret = -EINVAL;
> +		goto out;
>  	}
>  
>  	state = drm_atomic_state_alloc(dev);
> @@ -1447,6 +1484,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	state->acquire_ctx = &ctx;
>  	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
>  
> +	state->error_code = &error_code;
> +
>  retry:
>  	copied_objs = 0;
>  	copied_props = 0;
> @@ -1543,6 +1582,14 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	}
>  
>  out:
> +	/* update the error code if any error to allow user handling it */
> +	if (ret < 0 && arg->reserved)
> +		if (copy_to_user(error_code_ptr, &error_code, sizeof(error_code)))
> +			return -EFAULT;
> +
> +	if (!state)
> +		return ret;
> +
>  	complete_signaling(dev, state, fence_state, num_fences, !ret);
>  
>  	if (ret == -EDEADLK) {
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index d380001b24b4223baa54dae6c3c43e19dfb1958d..8956b175795128422eefc2bc047b320b80aedc3f 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -1255,4 +1255,23 @@ struct drm_bridge_state *
>  drm_atomic_get_new_bridge_state(const struct drm_atomic_state *state,
>  				struct drm_bridge *bridge);
>  
> +/**
> + * drm_mode_atomic_add_error_msg - function to add error code and error string
> + *
> + * @err_code: pointer to struct drm_mode_atomic_err_code that stores the failure
> + *	      reason
> + * @failure_code: failure code in enum drm_mode_atomic_failure_codes
> + * @failure_string: failure reason string message
> + *
> + * Returns: void
> + */
> +static inline void drm_mode_atomic_add_error_msg(struct drm_mode_atomic_err_code *err_code,
> +						 __u64 failure_code,
> +						 char *failure_string)

So this should be "const char *format, ..." with printf format, with
printf format annotation, to help callers pass in other stuff than just
fixed strings.

This should be a proper function instead of static inline.

> +{
> +	err_code->failure_code = failure_code;
> +	strscpy_pad(err_code->failure_string, failure_string,
> +		    strlen(err_code->failure_string));

If the size is fixed, why do we just silently truncate the string? If
the message is for the user, it'll be ugly to emit truncated strings.

> +}
> +
>  #endif /* DRM_ATOMIC_H_ */

-- 
Jani Nikula, Intel
