Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5D6C8A28A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34C610E61A;
	Wed, 26 Nov 2025 14:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HF4kTSjG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5693410E614;
 Wed, 26 Nov 2025 14:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764166110; x=1795702110;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=AmaT3Gb9NOlj1cOluwUUUjqyOU1ZdDgY/WGIcTaKdAQ=;
 b=HF4kTSjGCaDiaCQmUiAlb4Z/szon4D7ImXm/tFJC2KMMkO7CWV7uIj0o
 MwUwTcviTAc+kTfBrxUk1F0GCq9p1CuG5MWjaLsfcVWelSA3vHPht6qqj
 4qZjBeuNoicfZ0T0mf98oVDwUD9ucLbLo5VIoRBV1FZssjG3pPwSap2xS
 6r6SJFc+hYrYBr4sy/SX2BD7goVNJvEf6hfMgz0+Vkg6DSr/njqtyNjK3
 UcRNvnHr+OPqYNGLudXDk58581KH5zOq7yNFUktqW++e65gpwNLLbbyeu
 DpI/Q6//sN8FTmkwD0E+9tD47bLLOCbaj/nd1l/TJwmAO7S2ceuaapEyp Q==;
X-CSE-ConnectionGUID: b0RHSUCST9632Ro38eW+0A==
X-CSE-MsgGUID: VSAc7X+GTpapjEPQwQRAGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="88850605"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="88850605"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:08:29 -0800
X-CSE-ConnectionGUID: mpe+xcdkTSaPTfAYWHmupg==
X-CSE-MsgGUID: irjUSLqXTRqR24NpdsZHuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192967334"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.1])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:08:24 -0800
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
Subject: Re: [PATCH v6 2/7] drm/edid: prepare for VESA vendor-specific data
 block extension
In-Reply-To: <68c55e772424f8e001898cdd1edcf4856820461e@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251126065126.54016-1-iam@lach.pw>
 <20251126065126.54016-3-iam@lach.pw>
 <68c55e772424f8e001898cdd1edcf4856820461e@intel.com>
Date: Wed, 26 Nov 2025 16:08:20 +0200
Message-ID: <b7191ab7c3030a8be0b149d28ae6fa032b64a4d8@intel.com>
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

On Wed, 26 Nov 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 26 Nov 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
>> Current VESA vendor-specific block parsing expects real block size to be
>> the same as the defined struct size, use real offsets in conditionals
>> instead to add struct fields in future commits.
>>
>> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
>
> I think this is something we want to backport, since MSO would break
> with bigger vendor-specific blocks, and that leads to black screens on
> MSO displays.
>
> Cc: stable@vger.kernel.org
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Oops, I'll take that back.

>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 28 ++++++++++++----------------
>>  1 file changed, 12 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 64f7a94dd9e4..a52fd6de9327 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -6544,7 +6544,7 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
>>  	if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) != VESA_IEEE_OUI)
>>  		return;
>>  
>> -	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
>> +	if (block->num_bytes < 5) {
>>  		drm_dbg_kms(connector->dev,
>>  			    "[CONNECTOR:%d:%s] Unexpected VESA vendor block size\n",
>>  			    connector->base.id, connector->name);
>> @@ -6567,24 +6567,20 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
>>  		break;
>>  	}
>>  
>> -	if (!info->mso_stream_count) {
>> -		info->mso_pixel_overlap = 0;

This is no longer cleared for !info->mso_stream_count.

Perhaps the code could be reorganized to handle it better.

>> -		return;
>> -	}
>> -
>> -	info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
>> -	if (info->mso_pixel_overlap > 8) {
>> +	if (info->mso_stream_count) {
>> +		info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
>> +		if (info->mso_pixel_overlap > 8) {
>> +			drm_dbg_kms(connector->dev,
>> +				    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
>> +				    connector->base.id, connector->name,
>> +				    info->mso_pixel_overlap);
>> +			info->mso_pixel_overlap = 8;
>> +		}
>>  		drm_dbg_kms(connector->dev,
>> -			    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
>> +			    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
>>  			    connector->base.id, connector->name,
>> -			    info->mso_pixel_overlap);
>> -		info->mso_pixel_overlap = 8;
>> +			    info->mso_stream_count, info->mso_pixel_overlap);
>>  	}
>> -
>> -	drm_dbg_kms(connector->dev,
>> -		    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
>> -		    connector->base.id, connector->name,
>> -		    info->mso_stream_count, info->mso_pixel_overlap);
>>  }
>>  
>>  static void drm_update_vesa_specific_block(struct drm_connector *connector,

-- 
Jani Nikula, Intel
