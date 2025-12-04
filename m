Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BEBCA3915
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 13:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED09910E95B;
	Thu,  4 Dec 2025 12:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFHyZRom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7A310E94D;
 Thu,  4 Dec 2025 12:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764850342; x=1796386342;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MuqajGwfhj3xCGfoQBWQRUMFLnPMA7ZJP0BEJMHlEgs=;
 b=mFHyZRoms4z+hhRJ9eRMa9rUhVrO9NX3annS981lmoRBBkfYAY4BMvVM
 aEYWi7wjscqUDiR/XT2QUpckeOLy4bovTAwfzmNGsQ8wq9UHbhINVYIQy
 OKUIfl/D2k0c4azT0tHsyBtveWnFDT9/kv3liv7qt/LsJF42O7sadgQed
 mJjvQ+IZq0b+Ibb0q5EWEcsVPmuZfa9kcKwU8zlxfSOB66woapxZRDHL6
 Zpg5SuluTkCJVjpYhifDpVIDZybCLJRcoaCLvjvaClVfPgitM5v+tYtgs
 VdVVvB7dXU31rMsScRnqLbppYAdzLCBwUliAKSkr2GkQny2z2yJLtPDm8 A==;
X-CSE-ConnectionGUID: 7VXuqHfYS6m/WWbrzRTMEA==
X-CSE-MsgGUID: IJxTcL6GTlywLGp2D29cxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77547485"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="77547485"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 04:12:22 -0800
X-CSE-ConnectionGUID: mah35uXRTZuwN87oCwh9mw==
X-CSE-MsgGUID: AvrZViaOTk+vFXc36Jwmsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="200097039"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.11])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 04:12:16 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yaroslav Bolyukin <iam@lach.pw>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Maarten Lankhorst
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
Subject: Re: [PATCH v7 6/7] drm/edid: parse DRM VESA dsc bpp target
In-Reply-To: <20251202110218.9212-7-iam@lach.pw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251202110218.9212-1-iam@lach.pw>
 <20251202110218.9212-7-iam@lach.pw>
Date: Thu, 04 Dec 2025 14:12:12 +0200
Message-ID: <22d49b0cd8b52f485c51af530f49cd8771b2634c@intel.com>
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

On Tue, 02 Dec 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
> As per DisplayID v2.1a spec "DSC pass-through timing support",
> VESA vendor-specific data block may contain target DSC bits per pixel
> fields, that should be always used for the VII modes that declare they
> only support working with this value (Pass-through Timing Support for
> Target DSC Bits per Pixel).
>
> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
>
> fixup parse DRM vesa dsc bpp target

Needs to be removed while applying, no need to resend for this.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/drm_displayid_internal.h |  4 ++++
>  drivers/gpu/drm/drm_edid.c               | 17 +++++++++++++++++
>  include/drm/drm_connector.h              |  6 ++++++
>  3 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
> index 55f972d32847..8f1a2f33ca1a 100644
> --- a/drivers/gpu/drm/drm_displayid_internal.h
> +++ b/drivers/gpu/drm/drm_displayid_internal.h
> @@ -148,6 +148,8 @@ struct displayid_formula_timing_block {
>  #define DISPLAYID_VESA_DP_TYPE		GENMASK(2, 0)
>  #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
>  #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
> +#define DISPLAYID_VESA_DSC_BPP_INT	GENMASK(5, 0)
> +#define DISPLAYID_VESA_DSC_BPP_FRACT	GENMASK(3, 0)
>  
>  #define DISPLAYID_VESA_DP_TYPE_EDP	0
>  #define DISPLAYID_VESA_DP_TYPE_DP	1
> @@ -157,6 +159,8 @@ struct displayid_vesa_vendor_specific_block {
>  	u8 oui[3];
>  	u8 data_structure_type;
>  	u8 mso;
> +	u8 dsc_bpp_int;
> +	u8 dsc_bpp_fract;
>  } __packed;
>  
>  /*
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index be8715632b91..8273920f5ba4 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -45,6 +45,7 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_eld.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_fixed.h>
>  #include <drm/drm_print.h>
>  
>  #include "drm_crtc_internal.h"
> @@ -6593,6 +6594,21 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
>  	} else {
>  		info->mso_pixel_overlap = 0;
>  	}
> +
> +	if (block->num_bytes < 7) {
> +		/* DSC bpp is optional */
> +		return;
> +	}
> +
> +	info->dp_dsc_bpp_x16 = FIELD_GET(DISPLAYID_VESA_DSC_BPP_INT, vesa->dsc_bpp_int) << 4 |
> +			       FIELD_GET(DISPLAYID_VESA_DSC_BPP_FRACT, vesa->dsc_bpp_fract);
> +
> +	if (info->dp_dsc_bpp_x16 > 0) {
> +		drm_dbg_kms(connector->dev,
> +			    "[CONNECTOR:%d:%s] DSC bits per pixel " FXP_Q4_FMT "\n",
> +			    connector->base.id, connector->name,
> +			    FXP_Q4_ARGS(info->dp_dsc_bpp_x16));
> +	}
>  }
>  
>  static void drm_update_vesa_specific_block(struct drm_connector *connector,
> @@ -6641,6 +6657,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
>  	info->mso_stream_count = 0;
>  	info->mso_pixel_overlap = 0;
>  	info->max_dsc_bpp = 0;
> +	info->dp_dsc_bpp_x16 = 0;
>  
>  	kfree(info->vics);
>  	info->vics = NULL;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d..7decfc288aa3 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -837,6 +837,12 @@ struct drm_display_info {
>  	 */
>  	u32 max_dsc_bpp;
>  
> +	/**
> +	 * @dp_dsc_bpp: DP Display-Stream-Compression (DSC) timing's target
> +	 * DSC bits per pixel in 6.4 fixed point format. 0 means undefined.
> +	 */
> +	u16 dp_dsc_bpp_x16;
> +
>  	/**
>  	 * @vics: Array of vics_len VICs. Internal to EDID parsing.
>  	 */

-- 
Jani Nikula, Intel
