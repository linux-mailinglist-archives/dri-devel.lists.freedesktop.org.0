Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0E4905C61
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 21:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5862D10E8F9;
	Wed, 12 Jun 2024 19:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/L/Jspj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAB110E8F7;
 Wed, 12 Jun 2024 19:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718222109; x=1749758109;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lAiuT2H0ZpL6CYGuPE2qv6qz9QdBfxioDaU4gY9nmiE=;
 b=a/L/Jspj6ULPUm0nMp5vWPOB0pJ5On/a3NRuJhyTv4+qkrJ+i4kUnzLt
 Ya+HMCHn0dsctPY2YKXHCmSJcLSFJ9H1XmB22Pen1AuGBBMz31BJJ0vNW
 wpmHTKwcJ/QquMJkP3t2o0nITDllDno8Ihlj5oMwmb+iUiGiaKCCw7VS7
 H4lkqfo01EBE1V8kut1fgxQRFXT/eck60ZvDrKg/t11a+s2nfAkcphGfB
 MeCOSrdX6/Wtri0DW1Md2YTXQW+fpzOWp8coKLcTLxjKDjdtw15EdKklB
 uhaAcgppXahWUs++tioaCXg4yLiToGrv546d+BiVEY0V/iyhqH/+mNktI g==;
X-CSE-ConnectionGUID: bJF5lFUPSmy5rP5sVRNYyw==
X-CSE-MsgGUID: kXY7+Zi3TMCGbRA1ofcoXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="40415417"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40415417"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 12:55:06 -0700
X-CSE-ConnectionGUID: HMUvc0fjSMur9HBLGzBIug==
X-CSE-MsgGUID: PPNktQK9SR6WqHxi1uZyLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="39845552"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Jun 2024 12:55:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Jun 2024 22:55:01 +0300
Date: Wed, 12 Jun 2024 22:55:01 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <ppaalanen@gmail.com>, daniel@ffwll.ch,
 Daniel Stone <daniel@fooishbar.org>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Subject: Re: [PATCH v5 2/3] drm: Allow drivers to choose plane types to async
 flip
Message-ID: <Zmn9FdyMh-tyGTQg@intel.com>
References: <20240612193713.167448-1-andrealmeid@igalia.com>
 <20240612193713.167448-3-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240612193713.167448-3-andrealmeid@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 12, 2024 at 04:37:12PM -0300, André Almeida wrote:
> Different planes may have different capabilities of doing async flips,
> so create a field to let drivers allow async flip per plane type.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 4 ++--
>  drivers/gpu/drm/drm_plane.c       | 3 +++
>  include/drm/drm_plane.h           | 5 +++++
>  3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 2e1d9391febe..dd4b1578f141 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1079,9 +1079,9 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>  			break;
>  		}
>  
> -		if (async_flip && plane_state->plane->type != DRM_PLANE_TYPE_PRIMARY) {
> +		if (async_flip && !plane_state->plane->async_flip) {

You alreayd have 'plane', no need to dog it out again.

>  			drm_dbg_atomic(prop->dev,
> -				       "[OBJECT:%d] Only primary planes can be changed during async flip\n",
> +				       "[OBJECT:%d] This type of plane cannot be changed during async flip\n",
>  				       obj->id);

"[PLANE:%d:%s] does not support async flips"
or something like it would make more sense to me.

>  			ret = -EINVAL;
>  			break;
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 57662a1fd345..bbcec3940636 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -385,6 +385,9 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>  
>  	drm_modeset_lock_init(&plane->mutex);
>  
> +	if (type == DRM_PLANE_TYPE_PRIMARY)
> +		plane->async_flip = true;

Setting that would be the job of the driver.

You could probably just nuke mode_config.async_page_flip
and replace it fully with plane.async_flip checks.

> +
>  	plane->base.properties = &plane->properties;
>  	plane->dev = dev;
>  	plane->funcs = funcs;
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 9507542121fa..0bebc72af5c3 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -786,6 +786,11 @@ struct drm_plane {
>  	 * @kmsg_panic: Used to register a panic notifier for this plane
>  	 */
>  	struct kmsg_dumper kmsg_panic;
> +
> +	/**
> +	 * @async_flip: indicates if a plane can do async flips
> +	 */
> +	bool async_flip;
>  };
>  
>  #define obj_to_plane(x) container_of(x, struct drm_plane, base)
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
