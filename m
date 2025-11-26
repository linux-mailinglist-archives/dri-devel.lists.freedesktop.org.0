Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B554C8A9FC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 16:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439C610E659;
	Wed, 26 Nov 2025 15:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=0la.ch header.i=@0la.ch header.b="rXpHz/K3";
	dkim=permerror (0-bit key) header.d=0la.ch header.i=@0la.ch header.b="2zoAr/Yz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE9410E659;
 Wed, 26 Nov 2025 15:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=0la.ch; c=relaxed/relaxed;
 h=To:From:Subject:Date:Message-ID; t=1764170790; bh=64ozxP/kjMeyOucPSYF6M+7
 k+Qu9IVuCXgtDB+3GKow=; b=rXpHz/K3ONO02PfTTS9NE1Oa6YIvGEflxaCwnpIX1vwVBfvVSO
 Tu/Ts4dvMBEw0z12AMmdeHfORGNUT0Hlhc7OjLMED6KASdRe/DuyOCMQWwkfwlbMP75nJSjcDgd
 4Fa9fG7kWS1chUVuJ4kjdhq+DtrgAInlzX5bjZSbbvCjprDmlrlTQacxRM1nxIcvbQ+KL2NjwGE
 UPRLophNWF9gEKmcRjiv0z9FkZJqirB12UnjDtiOcbjGtkwRXEUsbDJ17BLTLl9nvp7z3Mawvo/
 xFfRp55yeD3nTy5mhdbiyx0D6h37zJQnr+Bey+TKpnECqnN0wTxzwjm+0WE82BBfwVQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=0la.ch; c=relaxed/relaxed; 
 h=To:From:Subject:Date:Message-ID; t=1764170790;
 bh=64ozxP/kjMeyOucPSYF6M+7
 k+Qu9IVuCXgtDB+3GKow=; b=2zoAr/Yzj/LiR4sPfA8P0HumrWrmQJwf83/YQBd3xVKtC4JYPH
 mQl2G3cfpqmsYoJbHW26agcWjcwcjTuoOTAA==;
Message-ID: <8a940fa4-ac9a-44b6-9d4a-e5394b0d6bf7@0la.ch>
Date: Wed, 26 Nov 2025 16:26:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] drm/edid: prepare for VESA vendor-specific data
 block extension
From: Yaroslav <iam@0la.ch>
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
 <b7191ab7c3030a8be0b149d28ae6fa032b64a4d8@intel.com>
 <ebd974b5-88f4-4fb3-a135-bad3bf7d9b4d@0la.ch>
 <61a482c23a81dc29f1fb793064c7238a98cf0143@intel.com>
 <8455fd94-d95c-4b15-8351-fc1971018e58@0la.ch>
Content-Language: en-US
In-Reply-To: <8455fd94-d95c-4b15-8351-fc1971018e58@0la.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 2025-11-26 16:06, Yaroslav wrote:
> 
> 
> On 2025-11-26 15:59, Jani Nikula wrote:
>> On Wed, 26 Nov 2025, Yaroslav <iam@0la.ch> wrote:
>>> On 2025-11-26 15:08, Jani Nikula wrote:
>>>> On Wed, 26 Nov 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>>>> On Wed, 26 Nov 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
>>>>>> Current VESA vendor-specific block parsing expects real block size 
>>>>>> to be
>>>>>> the same as the defined struct size, use real offsets in conditionals
>>>>>> instead to add struct fields in future commits.
>>>>>>
>>>>>> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
>>>>>
>>>>> I think this is something we want to backport, since MSO would break
>>>>> with bigger vendor-specific blocks, and that leads to black screens on
>>>>> MSO displays.
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>>>
>>>> Oops, I'll take that back.
>>>>
>>>>>
>>>>>> ---
>>>>>>    drivers/gpu/drm/drm_edid.c | 28 ++++++++++++----------------
>>>>>>    1 file changed, 12 insertions(+), 16 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>>>>> index 64f7a94dd9e4..a52fd6de9327 100644
>>>>>> --- a/drivers/gpu/drm/drm_edid.c
>>>>>> +++ b/drivers/gpu/drm/drm_edid.c
>>>>>> @@ -6544,7 +6544,7 @@ static void 
>>>>>> drm_parse_vesa_specific_block(struct drm_connector *connector,
>>>>>>        if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) != 
>>>>>> VESA_IEEE_OUI)
>>>>>>            return;
>>>>>> -    if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
>>>>>> +    if (block->num_bytes < 5) {
>>>>>>            drm_dbg_kms(connector->dev,
>>>>>>                    "[CONNECTOR:%d:%s] Unexpected VESA vendor block 
>>>>>> size\n",
>>>>>>                    connector->base.id, connector->name);
>>>>>> @@ -6567,24 +6567,20 @@ static void 
>>>>>> drm_parse_vesa_specific_block(struct drm_connector *connector,
>>>>>>            break;
>>>>>>        }
>>>>>> -    if (!info->mso_stream_count) {
>>>>>> -        info->mso_pixel_overlap = 0;
>>>>
>>>> This is no longer cleared for !info->mso_stream_count.
>>>>
>>>> Perhaps the code could be reorganized to handle it better.
>>>
>>> It defaults to zero due to drm_reset_display_info()
>>
>> Yes, and the code above the context initializes it from the vendor
>> block.
>>
> 
> It is wrapped in `if (info->mso_stream_count)` so we get
> 
> /* From drm_reset_display_info */
> info->mso_pixel_overlap = 0;
> 
> /* This part was removed, as we don't want the early return here anymore 
> due to extended structure length checks
> if (!info->mso_stream_count) {
>    info->mso_pixel_overlap = 0;
>    return;
> } */
> 
> 
> /* This code is right below your comment */
> if (info->mso_stream_count) {
>    info->mso_pixel_overlap = ...;
>    ...
> }
> 
> /* I can reinsert the value reset explicitly here, if that's what you 
> suggesting to do:
> 
> else {
>    info->mso_pixel_overlap = 0;
> }*/
> 
> 

For reference, repository state at the point after this patch:

https://github.com/CertainLach/linux-1/blob/01b0097171ebe85ae124a7b535dce0b46a1dd8e2/drivers/gpu/drm/drm_edid.c#L6561-L6593

Commit: 
https://github.com/CertainLach/linux-1/commit/01b0097171ebe85ae124a7b535dce0b46a1dd8e2

(Note that the fix for DP/EDP mistake is already here, but nothing else 
was changed in the github version of this patch)

> 
>>
>>>
>>>>>> -        return;
>>>>>> -    }
>>>>>> -
>>>>>> -    info->mso_pixel_overlap = 
>>>>>> FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
>>>>>> -    if (info->mso_pixel_overlap > 8) {
>>>>>> +    if (info->mso_stream_count) {
>>>>>> +        info->mso_pixel_overlap = 
>>>>>> FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
>>>>>> +        if (info->mso_pixel_overlap > 8) {
>>>>>> +            drm_dbg_kms(connector->dev,
>>>>>> +                    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap 
>>>>>> value %u\n",
>>>>>> +                    connector->base.id, connector->name,
>>>>>> +                    info->mso_pixel_overlap);
>>>>>> +            info->mso_pixel_overlap = 8;
>>>>>> +        }
>>>>>>            drm_dbg_kms(connector->dev,
>>>>>> -                "[CONNECTOR:%d:%s] Reserved MSO pixel overlap 
>>>>>> value %u\n",
>>>>>> +                "[CONNECTOR:%d:%s] MSO stream count %u, pixel 
>>>>>> overlap %u\n",
>>>>>>                    connector->base.id, connector->name,
>>>>>> -                info->mso_pixel_overlap);
>>>>>> -        info->mso_pixel_overlap = 8;
>>>>>> +                info->mso_stream_count, info->mso_pixel_overlap);
>>>>>>        }
>>>>>> -
>>>>>> -    drm_dbg_kms(connector->dev,
>>>>>> -            "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap 
>>>>>> %u\n",
>>>>>> -            connector->base.id, connector->name,
>>>>>> -            info->mso_stream_count, info->mso_pixel_overlap);
>>>>>>    }
>>>>>>    static void drm_update_vesa_specific_block(struct drm_connector 
>>>>>> *connector,
>>>>
>>>
>>
