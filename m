Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C55C8A323
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F35610E62D;
	Wed, 26 Nov 2025 14:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSz0k17e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3C210E63B;
 Wed, 26 Nov 2025 14:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764166250; x=1795702250;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Asm1GznwhdVlsrqK/wFWsxglofT/i1OMsFr8cBgK0EA=;
 b=fSz0k17e2omuuziciUv2krr48V4eJpJq6TZYBPUuxeFGu481OLAhV9mV
 Zr8er/iMRT0mXHKvCl0KGBKgAKVncYv1wFUX3fs7pp+RCAiGYayiKVJ8S
 GqWHejg/BBPqtDF2KFMfeMGiF+NloJmR6RFtIAWEEB9g8v5eK3OsF3WMZ
 EXX3uGD372TCGtvtW0p5myzubBQZ460kx/5/9f5BZu/61klE4NBp3E78f
 8S0FtAdNjSA3q8Nz8sK1HQNY/AFpGkoJLr43beENgeWU+exprbLFP7o0q
 XJk+8WGrZQ2amZ2Tba5VS/JTVkuhBwpb5oPuj2TNJHlDBNKsOkmOQfi5C w==;
X-CSE-ConnectionGUID: SLIO4fXkSwGoPFm1KEg/jw==
X-CSE-MsgGUID: Ksjx1Ec4QIyPCd+XUtEPFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66161648"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66161648"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:10:49 -0800
X-CSE-ConnectionGUID: /trZjtZET7S4p6h7tjLDaQ==
X-CSE-MsgGUID: yStiTBEASl+QDOxHp2Wp0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="193379508"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.1])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:10:37 -0800
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
Subject: Re: [PATCH v6 3/7] drm/edid: MSO should only be used for non-eDP
 displays
In-Reply-To: <20251126065126.54016-4-iam@lach.pw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251126065126.54016-1-iam@lach.pw>
 <20251126065126.54016-4-iam@lach.pw>
Date: Wed, 26 Nov 2025 16:10:34 +0200
Message-ID: <5be6faede273533b88e592bd25776b639d2eeb9f@intel.com>
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

On Wed, 26 Nov 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
> As per DisplayID v2.1a spec:
> If Offset 06h[2:0] is programmed to 001b (External DisplayPort), this
> field shall be cleared to 00b (Not supported).
>
> Link: https://lore.kernel.org/lkml/3abc1087618c822e5676e67a3ec2e64e506dc5ec@intel.com/
> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
> ---
>  drivers/gpu/drm/drm_displayid_internal.h |  4 +++
>  drivers/gpu/drm/drm_edid.c               | 36 +++++++++++++++---------
>  2 files changed, 27 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
> index 5b1b32f73516..72f107ae832f 100644
> --- a/drivers/gpu/drm/drm_displayid_internal.h
> +++ b/drivers/gpu/drm/drm_displayid_internal.h
> @@ -142,9 +142,13 @@ struct displayid_formula_timing_block {
>  	struct displayid_formula_timings_9 timings[];
>  } __packed;
>  
> +#define DISPLAYID_VESA_DP_TYPE		GENMASK(2, 0)
>  #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
>  #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
>  
> +#define DISPLAYID_VESA_DP_TYPE_EDP	0
> +#define DISPLAYID_VESA_DP_TYPE_DP	1
> +
>  struct displayid_vesa_vendor_specific_block {
>  	struct displayid_block base;
>  	u8 oui[3];
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index a52fd6de9327..348aa31aea1b 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6533,6 +6533,7 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
>  	struct displayid_vesa_vendor_specific_block *vesa =
>  		(struct displayid_vesa_vendor_specific_block *)block;
>  	struct drm_display_info *info = &connector->display_info;
> +	int dp_type;
>  
>  	if (block->num_bytes < 3) {
>  		drm_dbg_kms(connector->dev,
> @@ -6551,20 +6552,29 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
>  		return;
>  	}
>  
> -	switch (FIELD_GET(DISPLAYID_VESA_MSO_MODE, vesa->mso)) {
> -	default:
> -		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Reserved MSO mode value\n",
> +	dp_type = FIELD_GET(DISPLAYID_VESA_DP_TYPE, vesa->data_structure_type);
> +	if (dp_type > 1) {
> +		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Reserved dp type value\n",
>  			    connector->base.id, connector->name);
> -		fallthrough;
> -	case 0:
> -		info->mso_stream_count = 0;
> -		break;
> -	case 1:
> -		info->mso_stream_count = 2; /* 2 or 4 links */
> -		break;
> -	case 2:
> -		info->mso_stream_count = 4; /* 4 links */
> -		break;
> +	}
> +
> +	/* MSO is not supported for eDP */
> +	if (dp_type != DISPLAYID_VESA_DP_TYPE_EDP) {

MSO is *only* supported on eDP, not the other way round!

BR,
Jani.

> +		switch (FIELD_GET(DISPLAYID_VESA_MSO_MODE, vesa->mso)) {
> +		default:
> +			drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Reserved MSO mode value\n",
> +				    connector->base.id, connector->name);
> +			fallthrough;
> +		case 0:
> +			info->mso_stream_count = 0;
> +			break;
> +		case 1:
> +			info->mso_stream_count = 2; /* 2 or 4 links */
> +			break;
> +		case 2:
> +			info->mso_stream_count = 4; /* 4 links */
> +			break;
> +		}
>  	}
>  
>  	if (info->mso_stream_count) {

-- 
Jani Nikula, Intel
