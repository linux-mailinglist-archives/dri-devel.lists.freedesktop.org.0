Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF6FC8A4DA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28DF10E634;
	Wed, 26 Nov 2025 14:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=0la.ch header.i=@0la.ch header.b="j9ZdxPzb";
	dkim=permerror (0-bit key) header.d=0la.ch header.i=@0la.ch header.b="40tjysnj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338E410E638;
 Wed, 26 Nov 2025 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=0la.ch; c=relaxed/relaxed;
 h=From:To:Subject:Date:Message-ID; t=1764166955; bh=qzZi8Zl7w7hJ8UjBr4t5gMo
 sY5NWA7XOv6/9K3vMpFc=; b=j9ZdxPzblw5PSJR00nSTBdeKLRPa02vNo9pfaptUBm58VFbc+K
 CzgJ+yrOH4EGP7cq9GTFRhczxb6JAqeSMfZ9/+9oTG90br/Yk6vRxiSbLRbxGgCa76Sxz2RYTfk
 Xu3Z5vhSw2y5zSKZuUULjn/gvDuVsrGzsh+3102dO4317WfEJcA1R+aMNRknW3gKdKxTDRWXPcR
 iwVg/J06/c7ki6tcOZ+1hjVoR5JyjPIe+27JBf7VVdyTHqYSh7o5BVHjFbrIUgny5rktJ30Qbos
 4kNrZ/w8ml7PN3qQFjD597P4mqbtz2FaK2UekF/rquCg3otOpsjcNweCZ+578kJN5Uw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=0la.ch; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1764166955;
 bh=qzZi8Zl7w7hJ8UjBr4t5gMo
 sY5NWA7XOv6/9K3vMpFc=; b=40tjysnjgfuzo92hWADmIBdACEOCZ+iQRECy9WjsAym0q+6gLj
 +/7btkBTY/2kqShcf1W50yf7qFfuPwco8rCw==;
Message-ID: <1f671fbb-233d-45e5-80f5-bb66049cadf6@0la.ch>
Date: Wed, 26 Nov 2025 15:22:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] drm/edid: MSO should only be used for non-eDP
 displays
To: Jani Nikula <jani.nikula@linux.intel.com>, Yaroslav Bolyukin
 <iam@lach.pw>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251126065126.54016-1-iam@lach.pw>
 <20251126065126.54016-4-iam@lach.pw>
 <5be6faede273533b88e592bd25776b639d2eeb9f@intel.com>
Content-Language: en-US
From: Yaroslav <iam@0la.ch>
In-Reply-To: <5be6faede273533b88e592bd25776b639d2eeb9f@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 2025-11-26 15:10, Jani Nikula wrote:
> On Wed, 26 Nov 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
>> As per DisplayID v2.1a spec:
>> If Offset 06h[2:0] is programmed to 001b (External DisplayPort), this
>> field shall be cleared to 00b (Not supported).
>>
>> Link: https://lore.kernel.org/lkml/3abc1087618c822e5676e67a3ec2e64e506dc5ec@intel.com/
>> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
>> ---
>>   drivers/gpu/drm/drm_displayid_internal.h |  4 +++
>>   drivers/gpu/drm/drm_edid.c               | 36 +++++++++++++++---------
>>   2 files changed, 27 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
>> index 5b1b32f73516..72f107ae832f 100644
>> --- a/drivers/gpu/drm/drm_displayid_internal.h
>> +++ b/drivers/gpu/drm/drm_displayid_internal.h
>> @@ -142,9 +142,13 @@ struct displayid_formula_timing_block {
>>   	struct displayid_formula_timings_9 timings[];
>>   } __packed;
>>   
>> +#define DISPLAYID_VESA_DP_TYPE		GENMASK(2, 0)
>>   #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
>>   #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
>>   
>> +#define DISPLAYID_VESA_DP_TYPE_EDP	0
>> +#define DISPLAYID_VESA_DP_TYPE_DP	1
>> +
>>   struct displayid_vesa_vendor_specific_block {
>>   	struct displayid_block base;
>>   	u8 oui[3];
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index a52fd6de9327..348aa31aea1b 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -6533,6 +6533,7 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
>>   	struct displayid_vesa_vendor_specific_block *vesa =
>>   		(struct displayid_vesa_vendor_specific_block *)block;
>>   	struct drm_display_info *info = &connector->display_info;
>> +	int dp_type;
>>   
>>   	if (block->num_bytes < 3) {
>>   		drm_dbg_kms(connector->dev,
>> @@ -6551,20 +6552,29 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
>>   		return;
>>   	}
>>   
>> -	switch (FIELD_GET(DISPLAYID_VESA_MSO_MODE, vesa->mso)) {
>> -	default:
>> -		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Reserved MSO mode value\n",
>> +	dp_type = FIELD_GET(DISPLAYID_VESA_DP_TYPE, vesa->data_structure_type);
>> +	if (dp_type > 1) {
>> +		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Reserved dp type value\n",
>>   			    connector->base.id, connector->name);
>> -		fallthrough;
>> -	case 0:
>> -		info->mso_stream_count = 0;
>> -		break;
>> -	case 1:
>> -		info->mso_stream_count = 2; /* 2 or 4 links */
>> -		break;
>> -	case 2:
>> -		info->mso_stream_count = 4; /* 4 links */
>> -		break;
>> +	}
>> +
>> +	/* MSO is not supported for eDP */
>> +	if (dp_type != DISPLAYID_VESA_DP_TYPE_EDP) {
> 
> MSO is *only* supported on eDP, not the other way round!
> 
> BR,
> Jani.
> 

Oh, yes. For some reason I thought that MSO == MST, and it made no sense 
for me why would MST be only supported on eDP, I see now that this is a 
separate thing. I should probably don't include this patch in the 
patchset, since this is the only part that I don't have hardware to test

>> +		switch (FIELD_GET(DISPLAYID_VESA_MSO_MODE, vesa->mso)) {
>> +		default:
>> +			drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Reserved MSO mode value\n",
>> +				    connector->base.id, connector->name);
>> +			fallthrough;
>> +		case 0:
>> +			info->mso_stream_count = 0;
>> +			break;
>> +		case 1:
>> +			info->mso_stream_count = 2; /* 2 or 4 links */
>> +			break;
>> +		case 2:
>> +			info->mso_stream_count = 4; /* 4 links */
>> +			break;
>> +		}
>>   	}
>>   
>>   	if (info->mso_stream_count) {
> 
