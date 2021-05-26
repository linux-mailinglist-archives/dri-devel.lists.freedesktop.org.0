Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D89C391994
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 16:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A176ED20;
	Wed, 26 May 2021 14:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269F06ED11;
 Wed, 26 May 2021 14:11:20 +0000 (UTC)
IronPort-SDR: HBBLbvmwrA2u7qw8XOIAyvM6kiGMXgwOBakl38lGxAVjCWWdzBJ0NdpDepkh/t+W7kI2hU12H8
 ufUmLe5CJrTA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="189594214"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="189594214"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:11:20 -0700
IronPort-SDR: YGQcQQpKO7wRIz9pi2v+6NyTf2m8ZEQ7cB5hK1UjgwHoPGhSp/YzARokPx6bf3AjMRFNvmdTP/
 BR+8lxodKsaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="444063474"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 26 May 2021 07:11:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 26 May 2021 17:11:16 +0300
Date: Wed, 26 May 2021 17:11:16 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915/params: Align visibility of device level and
 global modparams
Message-ID: <YK5XBAR5QeCvDOw8@intel.com>
References: <20210526100006.2205062-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210526100006.2205062-1-tvrtko.ursulin@linux.intel.com>
X-Patchwork-Hint: comment
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 11:00:06AM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> We have a few modparams which get conditionaly exposed based on a Kconfig
> options and in most cases this also means portions of the driver
> implementing the respective feature are also left out.
> 
> Align the visibility of device level and global modparams to make them
> consistent in this respect.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_params.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
> index 14cd64cc61d0..dee1db50c31a 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -71,18 +71,18 @@ struct drm_printer;
>  	param(int, fastboot, -1, 0600) \
>  	param(int, enable_dpcd_backlight, -1, 0600) \
>  	param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE, 0400) \
> -	param(unsigned long, fake_lmem_start, 0, 0400) \
> -	param(unsigned int, request_timeout_ms, CONFIG_DRM_I915_REQUEST_TIMEOUT, 0600) \
> +	param(unsigned long, fake_lmem_start, 0, IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM ? 0400 : 0)) \

misplaced parens

> +	param(unsigned int, request_timeout_ms, CONFIG_DRM_I915_REQUEST_TIMEOUT, CONFIG_DRM_I915_REQUEST_TIMEOUT ? 0600 : 0) \
>  	/* leave bools at the end to not create holes */ \
>  	param(bool, enable_hangcheck, true, 0600) \
>  	param(bool, load_detect_test, false, 0600) \
>  	param(bool, force_reset_modeset_test, false, 0600) \
> -	param(bool, error_capture, true, 0600) \
> +	param(bool, error_capture, true, IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR) ? 0600 : 0) \
>  	param(bool, disable_display, false, 0400) \
>  	param(bool, verbose_state_checks, true, 0) \
>  	param(bool, nuclear_pageflip, false, 0400) \
>  	param(bool, enable_dp_mst, true, 0600) \
> -	param(bool, enable_gvt, false, 0400)
> +	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 : 0)
>  
>  #define MEMBER(T, member, ...) T member;
>  struct i915_params {
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
