Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0821ECA38CA
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 13:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5617D10E931;
	Thu,  4 Dec 2025 12:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OER+xLZS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5956710E8E8;
 Thu,  4 Dec 2025 12:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764850145; x=1796386145;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BdH+TaxM/tdbxB+Q9hmIRNfVhBmoIgivzmmLy+Wwjms=;
 b=OER+xLZS1oB3KZI6NXgE2u/tmelx3NEb6/pIC9+Ocpp31UpgRrwrUaNl
 hGubLdn3ivM7eWcaFqujwEqAhdX20xS9XdhiEpTOxxffP07NCgpWDzRhB
 fk3HSxso29+9eA1ZdTIw9EMITRykDI10QlAEzghdIKYnWEENaCY88dd5I
 h6QoJZ1VoaNYiymifFItpWheLMqwzb9voUAMfCm92kqNS0rinROgkfV1f
 mHarbUC1U174RRk85r2S1W8i1a2Qh6EJCplrHDtfdMXf1fCpeMlDtwIPl
 Od/IAJv0aXtQ7KhxqIpmIX6644ht4JQpRjqLTkqOyreTpUim2wbNE7KdX g==;
X-CSE-ConnectionGUID: 7sn+tsJqSCyEdMIR/KDctw==
X-CSE-MsgGUID: k5KRz1s9QOeBaH0+kbZgQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65863551"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="65863551"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 04:09:04 -0800
X-CSE-ConnectionGUID: DuBYcdonRHKMc1PRIU1pPw==
X-CSE-MsgGUID: VwK5qHRCQE22Fe+S2Uvu7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="225924707"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.11])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 04:08:59 -0800
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
Subject: Re: [PATCH v7 3/7] drm/edid: MSO should only be used for non-eDP
 displays
In-Reply-To: <20251202110218.9212-4-iam@lach.pw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251202110218.9212-1-iam@lach.pw>
 <20251202110218.9212-4-iam@lach.pw>
Date: Thu, 04 Dec 2025 14:08:56 +0200
Message-ID: <3a7a356f73cb135f4c5f82a9c5d237d3be804886@intel.com>
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
> As per DisplayID v2.1a spec:
> If Offset 06h[2:0] is programmed to 001b (External DisplayPort), this
> field shall be cleared to 00b (Not supported).
>
> Link: https://lore.kernel.org/lkml/3abc1087618c822e5676e67a3ec2e64e506dc5ec@intel.com/

The Link: tag is unnecessary. No need to resend for this.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


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
> index a0a6ccf12475..380a9dda275f 100644
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
> +	/* MSO is only supported for eDP */
> +	if (dp_type == DISPLAYID_VESA_DP_TYPE_EDP) {
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
