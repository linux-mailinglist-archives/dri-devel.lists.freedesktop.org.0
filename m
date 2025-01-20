Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF0FA16AE8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 11:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13CB10E3A0;
	Mon, 20 Jan 2025 10:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7i3XDt7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F3010E3A0;
 Mon, 20 Jan 2025 10:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737369554; x=1768905554;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Cqe4/QTRTJHwKoNcIYNwAIjWzlkT+v0Bi6Kd7JuMZY4=;
 b=M7i3XDt7uLidRZLlkLFmLCLu1dQ3/4l/c2DqbXiFciU3D6pXGesVnNlG
 geG/VBrvidUvL5x9iKuhkGjhR+tW+BnqnS9ueysf65P4so8v4N2jlLuSw
 IrsZ4/wIZVbW3DFnf9u8C3r4HM9DFB82fwJr55LAv7chyMKqxd8lA6N7g
 RmYDdbevFwUJc0oh0kh0d3K0yVnrW+9+1ZhrP6FaiWbhyOvhJu3JEmQj1
 nYwMPwHkWVyJ5CfTB/zsoyNl6Q259N+rX8KpE1JT8XyD2aCJMdADmQAc8
 u7jsOYwi+143FHgxeU3XJ3j0TJWuvpQ6pDsB2IcoSJlbWnj3lDJZGjQDm A==;
X-CSE-ConnectionGUID: E1uHq+UGSK+OKCoVYPSA1g==
X-CSE-MsgGUID: 1RiD2aFRSI2GzBlM7cAqjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="63117972"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="63117972"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 02:39:06 -0800
X-CSE-ConnectionGUID: ssWcj3P9TiaoMGmekuLiOw==
X-CSE-MsgGUID: f2TgGdh3TNSI9JFwyqInQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110520303"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.106])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 02:39:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lu Yao <yaolu@kylinos.cn>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Lu Yao <yaolu@kylinos.cn>
Subject: Re: [PATCH] drm/i915: Handle null 'fb' in
 'intel_plane_atomic_check_with_state'
In-Reply-To: <20250120053908.94339-1-yaolu@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250120053908.94339-1-yaolu@kylinos.cn>
Date: Mon, 20 Jan 2025 12:39:00 +0200
Message-ID: <87h65trcqj.fsf@intel.com>
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

On Mon, 20 Jan 2025, Lu Yao <yaolu@kylinos.cn> wrote:
> Add null pointer check before use fb.
> Reported by smatch.

If new_plane_state->uapi.visible is true, fb will be non-NULL too, but
smatch is unable to see that.

Adding these checks makes one believe that this is not something you can
rely on.

BR,
Jani.

>
> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> ---
>  drivers/gpu/drm/i915/display/intel_atomic_plane.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index d89630b2d5c1..20bfa9589ee7 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -640,18 +640,18 @@ int intel_plane_atomic_check_with_state(const struct intel_crtc_state *old_crtc_
>  	    intel_plane_is_scaled(new_plane_state))
>  		new_crtc_state->scaled_planes |= BIT(plane->id);
>  
> -	if (new_plane_state->uapi.visible &&
> +	if (fb && new_plane_state->uapi.visible &&
>  	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
>  		new_crtc_state->nv12_planes |= BIT(plane->id);
>  
> -	if (new_plane_state->uapi.visible &&
> +	if (fb && new_plane_state->uapi.visible &&
>  	    fb->format->format == DRM_FORMAT_C8)
>  		new_crtc_state->c8_planes |= BIT(plane->id);
>  
>  	if (new_plane_state->uapi.visible || old_plane_state->uapi.visible)
>  		new_crtc_state->update_planes |= BIT(plane->id);
>  
> -	if (new_plane_state->uapi.visible &&
> +	if (fb && new_plane_state->uapi.visible &&
>  	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier)) {
>  		new_crtc_state->data_rate_y[plane->id] =
>  			intel_plane_data_rate(new_crtc_state, new_plane_state, 0);

-- 
Jani Nikula, Intel
