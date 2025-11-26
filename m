Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9646EC8A7EA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8CA10E656;
	Wed, 26 Nov 2025 14:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="faKXWirS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA90E10E655;
 Wed, 26 Nov 2025 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764169159; x=1795705159;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EUsE7HanB/IF3owzNiV6pzvWBpJcSGGz5FAt6sVdwho=;
 b=faKXWirSlQ8XfI2P2biCb2D93EPGi4xRD/jRHP3Lmqdpc/BZlElW4Zcm
 UUC5t6127dU+nLxSsMpIqKVGxH4lSIxyOWRvyrF8g3xVWEH2WG23dWDpU
 bqvWAxRK3jh7pm4YxyRfyxpoMep68YQMuVKdTZqDF0X65iIvM2R/4t5VX
 pcn1BkTxYd8BB+ARRaOBXe4q+JtXaCCfUajqJtqUwHOKhxsKcXDysjAv1
 g2mpGstBTHqf6RinoGbkvUHbJLETBIq12a69lpoFaHwF5GOH9nrk4c45D
 5jAEmNocPSbXoB6N888li3aRAhwxgMFrZavwx38MGWhMedMwKlVlgY7Wm Q==;
X-CSE-ConnectionGUID: TOETHGlMQLq5ZMkb7BXH6A==
X-CSE-MsgGUID: fZQCpnKeTp2IS8utOPgpvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66283747"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66283747"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:59:18 -0800
X-CSE-ConnectionGUID: If63QEkzQTKFCSO7Wwhb3A==
X-CSE-MsgGUID: bTOq7xCSRDyH6m2kiS3Pww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="197450191"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.1])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:59:13 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yaroslav <iam@0la.ch>, Yaroslav Bolyukin <iam@lach.pw>, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 2/7] drm/edid: prepare for VESA vendor-specific data
 block extension
In-Reply-To: <ebd974b5-88f4-4fb3-a135-bad3bf7d9b4d@0la.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251126065126.54016-1-iam@lach.pw>
 <20251126065126.54016-3-iam@lach.pw>
 <68c55e772424f8e001898cdd1edcf4856820461e@intel.com>
 <b7191ab7c3030a8be0b149d28ae6fa032b64a4d8@intel.com>
 <ebd974b5-88f4-4fb3-a135-bad3bf7d9b4d@0la.ch>
Date: Wed, 26 Nov 2025 16:59:09 +0200
Message-ID: <61a482c23a81dc29f1fb793064c7238a98cf0143@intel.com>
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

On Wed, 26 Nov 2025, Yaroslav <iam@0la.ch> wrote:
> On 2025-11-26 15:08, Jani Nikula wrote:
>> On Wed, 26 Nov 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>> On Wed, 26 Nov 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
>>>> Current VESA vendor-specific block parsing expects real block size to be
>>>> the same as the defined struct size, use real offsets in conditionals
>>>> instead to add struct fields in future commits.
>>>>
>>>> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
>>>
>>> I think this is something we want to backport, since MSO would break
>>> with bigger vendor-specific blocks, and that leads to black screens on
>>> MSO displays.
>>>
>>> Cc: stable@vger.kernel.org
>>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> Oops, I'll take that back.
>> 
>>>
>>>> ---
>>>>   drivers/gpu/drm/drm_edid.c | 28 ++++++++++++----------------
>>>>   1 file changed, 12 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>>> index 64f7a94dd9e4..a52fd6de9327 100644
>>>> --- a/drivers/gpu/drm/drm_edid.c
>>>> +++ b/drivers/gpu/drm/drm_edid.c
>>>> @@ -6544,7 +6544,7 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
>>>>   	if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) != VESA_IEEE_OUI)
>>>>   		return;
>>>>   
>>>> -	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
>>>> +	if (block->num_bytes < 5) {
>>>>   		drm_dbg_kms(connector->dev,
>>>>   			    "[CONNECTOR:%d:%s] Unexpected VESA vendor block size\n",
>>>>   			    connector->base.id, connector->name);
>>>> @@ -6567,24 +6567,20 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
>>>>   		break;
>>>>   	}
>>>>   
>>>> -	if (!info->mso_stream_count) {
>>>> -		info->mso_pixel_overlap = 0;
>> 
>> This is no longer cleared for !info->mso_stream_count.
>> 
>> Perhaps the code could be reorganized to handle it better.
>
> It defaults to zero due to drm_reset_display_info()

Yes, and the code above the context initializes it from the vendor
block.


>
>>>> -		return;
>>>> -	}
>>>> -
>>>> -	info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
>>>> -	if (info->mso_pixel_overlap > 8) {
>>>> +	if (info->mso_stream_count) {
>>>> +		info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
>>>> +		if (info->mso_pixel_overlap > 8) {
>>>> +			drm_dbg_kms(connector->dev,
>>>> +				    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
>>>> +				    connector->base.id, connector->name,
>>>> +				    info->mso_pixel_overlap);
>>>> +			info->mso_pixel_overlap = 8;
>>>> +		}
>>>>   		drm_dbg_kms(connector->dev,
>>>> -			    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
>>>> +			    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
>>>>   			    connector->base.id, connector->name,
>>>> -			    info->mso_pixel_overlap);
>>>> -		info->mso_pixel_overlap = 8;
>>>> +			    info->mso_stream_count, info->mso_pixel_overlap);
>>>>   	}
>>>> -
>>>> -	drm_dbg_kms(connector->dev,
>>>> -		    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
>>>> -		    connector->base.id, connector->name,
>>>> -		    info->mso_stream_count, info->mso_pixel_overlap);
>>>>   }
>>>>   
>>>>   static void drm_update_vesa_specific_block(struct drm_connector *connector,
>> 
>

-- 
Jani Nikula, Intel
