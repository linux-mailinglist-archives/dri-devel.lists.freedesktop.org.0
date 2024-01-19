Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C03832EE9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 19:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD4210E1DA;
	Fri, 19 Jan 2024 18:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E7D10E1DA;
 Fri, 19 Jan 2024 18:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705688769; x=1737224769;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yOxHF7ZU+mK9du0Tdf/ZFieHEX1hu7B8QVkJ8YihwNk=;
 b=cZzpSbroM2aeG7DfA+x/j/EqzBV9I4GBW3ADPFbSWPnPM47H4AchMnaz
 42LsmewJqK/MijstFqUb7CVwGLknivjbrNXKJaAJOptcZpqwButc58Q5H
 dWI2GALPHAWLXUL6tIaxwb7ucmj+u62bgmfj8/Js451+DeTPmE1/U1E5C
 z1fVGx3xts34UsmeFW/Od4rHTHnIm8865Ok+FFyk8T6K5Jvbhq5QGgDRQ
 ZX5lvQWRa7SG6v9Di/SxMB+9Sygmruhryj3Ey6OQbLzUxoyqsohQDLDEt
 N+H3eXASF695ZNR//bDr0qZBkMPgt89bbT41aw4PFcmfyoH8Nzm8KAzv1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="14330733"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="14330733"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 10:25:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="778039172"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="778039172"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 19 Jan 2024 10:25:52 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 19 Jan 2024 20:25:51 +0200
Date: Fri, 19 Jan 2024 20:25:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v2 2/2] drm/amdgpu: Implement check_async_props for planes
Message-ID: <Zaq-r7UZpEy7_Rrn@intel.com>
References: <20240119181235.255060-1-andrealmeid@igalia.com>
 <20240119181235.255060-3-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240119181235.255060-3-andrealmeid@igalia.com>
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
Cc: daniel@ffwll.ch, 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Dave Airlie <airlied@gmail.com>,
 christian.koenig@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 19, 2024 at 03:12:35PM -0300, André Almeida wrote:
> AMD GPUs can do async flips with changes on more properties than just
> the FB ID, so implement a custom check_async_props for AMD planes.
> 
> Allow amdgpu to do async flips with IN_FENCE_ID and FB_DAMAGE_CLIPS
> properties. For userspace to check if a driver support this two
> properties, the strategy for now is to use TEST_ONLY commits.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v2: Drop overlay plane option for now
> 
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 116121e647ca..7afe8c1b62d4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -25,6 +25,7 @@
>   */
>  
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_blend.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_plane_helper.h>
> @@ -1430,6 +1431,33 @@ static void amdgpu_dm_plane_drm_plane_destroy_state(struct drm_plane *plane,
>  	drm_atomic_helper_plane_destroy_state(plane, state);
>  }
>  
> +static int amdgpu_dm_plane_check_async_props(struct drm_property *prop,
> +					  struct drm_plane *plane,
> +					  struct drm_plane_state *plane_state,
> +					  struct drm_mode_object *obj,
> +					  u64 prop_value, u64 old_val)
> +{
> +	struct drm_mode_config *config = &plane->dev->mode_config;
> +	int ret;
> +
> +	if (prop != config->prop_fb_id &&
> +	    prop != config->prop_in_fence_fd &&

IN_FENCE should just be allowed always.

> +	    prop != config->prop_fb_damage_clips) {

This seems a bit dubious to me. How is amdgpu using the damage
information during async flips?

> +		ret = drm_atomic_plane_get_property(plane, plane_state,
> +						    prop, &old_val);
> +		return drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
> +	}
> +
> +	if (plane_state->plane->type != DRM_PLANE_TYPE_PRIMARY) {
> +		drm_dbg_atomic(prop->dev,
> +			       "[OBJECT:%d] Only primary planes can be changed during async flip\n",
> +			       obj->id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct drm_plane_funcs dm_plane_funcs = {
>  	.update_plane	= drm_atomic_helper_update_plane,
>  	.disable_plane	= drm_atomic_helper_disable_plane,
> @@ -1438,6 +1466,7 @@ static const struct drm_plane_funcs dm_plane_funcs = {
>  	.atomic_duplicate_state = amdgpu_dm_plane_drm_plane_duplicate_state,
>  	.atomic_destroy_state = amdgpu_dm_plane_drm_plane_destroy_state,
>  	.format_mod_supported = amdgpu_dm_plane_format_mod_supported,
> +	.check_async_props = amdgpu_dm_plane_check_async_props,
>  };
>  
>  int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
