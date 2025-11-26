Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDACC8A48F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39FB10E636;
	Wed, 26 Nov 2025 14:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=0la.ch header.i=@0la.ch header.b="QDd/fNfn";
	dkim=permerror (0-bit key) header.d=0la.ch header.i=@0la.ch header.b="MZmte5jT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742B310E634;
 Wed, 26 Nov 2025 14:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=0la.ch; c=relaxed/relaxed;
 h=From:To:Subject:Date:Message-ID; t=1764166829; bh=9NPqufXmH+v5no653bp7rtF
 bFJjcd2x8PjDZ4TYoMhY=; b=QDd/fNfn+Ewa3kyiRuJKr9Sc6stQ31nGnRBRnzbKGiMq3WqcU2
 qERpSerJ6b0sn22Ut5GB5CDwhbT/MTtFbG1HwA4mx0sCBqXYjubee/XS3bTt2pcd+fQXZN8ylys
 QiGU59fea2hRixn2cmJRXzDwkJi/HqdCjR+TWG1XDQgw+cAEW8crmU7QBQvGZMtzr+34dTi7UNY
 Rj4zS7kljhwjvroUwSCFdzcyur1GinDScG4K3vDkpsAV9QQuQ8i3q/e78Y5e8SgX6+o0JLZoXgH
 byckx1Roy6UM3pogEol6/amEViHsVbmpQ4NNrNRMVyyhswtBORCBtosHYOFbbw0KQPg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=0la.ch; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1764166829;
 bh=9NPqufXmH+v5no653bp7rtF
 bFJjcd2x8PjDZ4TYoMhY=; b=MZmte5jTfDUtb617XosbOhSOMVVL9TH5UhNqJrbwi5B6ob4Ju0
 6atJtBjzMLqSuUwbZPMIXr0Z7w5Nq76J4gDQ==;
Message-ID: <41fbf5af-559a-4810-82c1-5c2e8a497e5b@0la.ch>
Date: Wed, 26 Nov 2025 15:20:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] drm/edid: prepare for VESA vendor-specific data
 block extension
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
 <20251126065126.54016-3-iam@lach.pw>
 <68c55e772424f8e001898cdd1edcf4856820461e@intel.com>
Content-Language: en-US
From: Yaroslav <iam@0la.ch>
In-Reply-To: <68c55e772424f8e001898cdd1edcf4856820461e@intel.com>
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



On 2025-11-26 10:13, Jani Nikula wrote:
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

Not sure why would we want to backport that if we don't backport the 
other changes, old kernels will just have the broken implementation, 
which in reality affects almost no body, given that there were no bug 
reports
> Cc: stable@vger.kernel.org
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
>> ---
>>   drivers/gpu/drm/drm_edid.c | 28 ++++++++++++----------------
>>   1 file changed, 12 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 64f7a94dd9e4..a52fd6de9327 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -6544,7 +6544,7 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
>>   	if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) != VESA_IEEE_OUI)
>>   		return;
>>   
>> -	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
>> +	if (block->num_bytes < 5) {
>>   		drm_dbg_kms(connector->dev,
>>   			    "[CONNECTOR:%d:%s] Unexpected VESA vendor block size\n",
>>   			    connector->base.id, connector->name);
>> @@ -6567,24 +6567,20 @@ static void drm_parse_vesa_specific_block(struct drm_connector *connector,
>>   		break;
>>   	}
>>   
>> -	if (!info->mso_stream_count) {
>> -		info->mso_pixel_overlap = 0;
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
>>   		drm_dbg_kms(connector->dev,
>> -			    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
>> +			    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
>>   			    connector->base.id, connector->name,
>> -			    info->mso_pixel_overlap);
>> -		info->mso_pixel_overlap = 8;
>> +			    info->mso_stream_count, info->mso_pixel_overlap);
>>   	}
>> -
>> -	drm_dbg_kms(connector->dev,
>> -		    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
>> -		    connector->base.id, connector->name,
>> -		    info->mso_stream_count, info->mso_pixel_overlap);
>>   }
>>   
>>   static void drm_update_vesa_specific_block(struct drm_connector *connector,
> 
