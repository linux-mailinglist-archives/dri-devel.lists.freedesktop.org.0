Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B815BE4A23
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 18:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7A310EA4D;
	Thu, 16 Oct 2025 16:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f97oov8f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7239510EA4D;
 Thu, 16 Oct 2025 16:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760632805; x=1792168805;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=prjvjz+M/7rr2btEt2k6ouVNhEZHrzAdMAghfFQAIrA=;
 b=f97oov8faKGzD4vnLbwo2fAr6e0PYQRrwpG7xA/F9D5VQQYJ2SvQe9kX
 gHBKejrUKkx5cw1mJ436UJUAilhMyFQERspuLCtPPf+DxyB6MqW/1mpHt
 Y29GhUnCRixG/G9FBCz3SXPRX+vwn4A5gV9Qfel/PJecynLKVmYrlrB9k
 oW/vYZomRk+SLOhqXb12SquWOUWavDTGoOvYqkplnfrvxy3FyTf2sZhBF
 WLpnKmFrmsqBFQ77KrithoSiKK6uoaQkMKQsWQivkHX8hEolZr25COY4b
 ntueaNGZGrskEOrkDFb6qyUIW7lW8QR//3JoxwN/JOUdpsC/OqWp+98UV w==;
X-CSE-ConnectionGUID: iGEYIYvoQQeVJxopFZs71A==
X-CSE-MsgGUID: GyYsde/2QLGdcWY2WqjZVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="74176729"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="74176729"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:40:05 -0700
X-CSE-ConnectionGUID: d6aGCxqXSIuq0+rX+521og==
X-CSE-MsgGUID: O3GEdB1FQsSNk/Pamay9jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="187781454"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.155])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:40:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yaroslav Bolyukin <iam@lach.pw>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Yaroslav
 Bolyukin <iam@lach.pw>
Subject: Re: [PATCH v4 2/2] drm/amd: use fixed dsc bits-per-pixel from edid
In-Reply-To: <20251016001038.13611-6-iam@lach.pw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251016001038.13611-2-iam@lach.pw>
 <20251016001038.13611-6-iam@lach.pw>
Date: Thu, 16 Oct 2025 19:39:57 +0300
Message-ID: <34407e8d423f0d00e949ba8c6b209cb88e8f5414@intel.com>
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

On Thu, 16 Oct 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
> VESA vendor header from DisplayID spec may contain fixed bit per pixel
> rate, it should be respected by drm driver
>
> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 0d03e324d5b9..ebe5bb4eecf8 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6521,6 +6521,11 @@ static void fill_stream_properties_from_drm_display_mode(
>  
>  	stream->output_color_space = get_output_color_space(timing_out, connector_state);
>  	stream->content_type = get_output_content_type(connector_state);
> +
> +	/* DisplayID Type VII pass-through timings. */
> +	if (mode_in->dsc_passthrough_timings_support && info->dp_dsc_bpp != 0) {
> +		stream->timing.dsc_fixed_bits_per_pixel_x16 = info->dp_dsc_bpp;
> +	}

If we had mode->dp_dsc_bpp_x16 directly, or something better named, this
would be simpler. This will eventually be replicated in a bunch of
drivers.

BR,
Jani.

>  }
>  
>  static void fill_audio_info(struct audio_info *audio_info,
> @@ -7067,6 +7072,13 @@ create_stream_for_sink(struct drm_connector *connector,
>  					&mode, preferred_mode, scale);
>  
>  			preferred_refresh = drm_mode_vrefresh(preferred_mode);
> +
> +			/*
> +			 * HACK: In case of multiple supported modes, we should look at the matching mode to decide this flag.
> +			 * But what is matching mode, how should it be decided?
> +			 * Assuming that only preferred mode would have this flag.
> +			 */
> +			mode.dsc_passthrough_timings_support = preferred_mode->dsc_passthrough_timings_support;
>  		}
>  	}
>  
> @@ -7756,7 +7768,7 @@ create_validate_stream_for_sink(struct drm_connector *connector,
>  			drm_dbg_kms(connector->dev, "%s:%d Validation failed with %d, retrying w/ YUV420\n",
>  				    __func__, __LINE__, dc_result);
>  			aconnector->force_yuv420_output = true;
> -		}
> +}
>  		stream = create_validate_stream_for_sink(connector, drm_mode,
>  							 dm_state, old_stream);
>  		aconnector->force_yuv422_output = false;

-- 
Jani Nikula, Intel
