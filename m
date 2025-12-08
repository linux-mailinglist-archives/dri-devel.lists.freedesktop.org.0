Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2C4CAE6F8
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 00:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A3710E458;
	Mon,  8 Dec 2025 23:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZxzPafM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A9B10E458;
 Mon,  8 Dec 2025 23:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Wbc28+RvWPSimvpHz5NahJv+Q+C6g4H+2Yt0LGQx9Q=; b=ZxzPafM9LPGEdLgwd8P6el3q9C
 ggXT5B4SwqucmGDDiJFto2OsotWORuJisoOZRhjRsh2sF8MsvjExhPwKtTkxQbg+Oncoz1098bl6W
 iUHLm2SqP164w2ErZ9okN66E9MUENZn+olDIalUNTF82rcXy+RHZBVkJSFhcY2nGhRxBux+emwrOH
 7nmEpKY8Lvysh7BBE+WXPKMpWc89ZI8hrn2OGZYD0D3qUPpDTMW34MueUwyJXMU3gpigyDZBQeYLH
 wBR8NsggUhZIkDK6pxbQRGoZ260QaGrptxD+Q1cOlTJDcVeJLYEFQT6zoEbD4707Tkj2T0twsydcK
 6EnudrWA==;
Received: from [186.208.73.250] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vSl8F-00AH3w-UU; Tue, 09 Dec 2025 00:59:08 +0100
Message-ID: <7ad74d3d-5a63-462b-8243-f8f26441b04b@igalia.com>
Date: Mon, 8 Dec 2025 20:59:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: use DCN10 CM helper for plane shaper
 func translation in DCN32
To: Harry Wentland <harry.wentland@amd.com>, sunpeng.li@amd.com,
 siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20251126005608.37513-1-mwen@igalia.com>
 <2a918940-700d-4b24-90ae-4d9d4f9b457d@amd.com>
 <f832ec8c-cce1-45e0-975b-ed7000bed891@igalia.com>
 <2ddb06d0-70e5-4a1f-850d-3753f9fb3d0a@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <2ddb06d0-70e5-4a1f-850d-3753f9fb3d0a@amd.com>
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



On 28/11/2025 18:36, Harry Wentland wrote:
>
> On 2025-11-28 14:09, Melissa Wen wrote:
>>
>> On 27/11/2025 17:39, Harry Wentland wrote:
>>> On 2025-11-25 19:45, Melissa Wen wrote:
>>>> The usage of DCN30 CM helper creates some unexpected shimmer points on
>>>> PQ shaper TF in the steamOS HDR color pipeline. Fix it by using the same
>>>> DCN10 color mgmt helper of previous hw versions to translate plane
>>>> shaper func to hw format in DCN32 hw family.
>>>>
>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>> ---
>>>>
>>>> Hi,
>>>>
>>>> Commit a953cd8cac6b ("drm/amd/display: Fix MPCC 1DLUT programming")
>>>> mentions some visible artifacts when using DCN10 CM helper on DCN32
>>>> shaper and blend LUTs. On the other hand, using DCN30 CM helper creates
>>>> some shimmer points on steamOS HDR pipeline. We didn't noticed any
>>>> visible artifacts so far, but I'd like to know more about what kind of
>>>> artifacts were visible at the time this helper for shaper func was
>>>> switched in the afore-mentioned commit for further investigation.
>>>>
>>> Thanks for the debug.
>>>
>>> Do you have more info on the unexpected shimmer points with SteamOS?
>>> Ideally a video and a description on what to look for and why it's
>>> wrong, or a comparison to a GFX-transformed example that shows the
>>> correct visuals?
>> Hi Harry,
>>
>> I took some pictures of clear unexpected scenes in HDR games.
>>
>> 1. https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-split-fiction-game-black-loading-bkg.jpg
>>
>> Just loading Split Fiction after having turning on HDR in this game options (Options > Graphics > HDR).
>> We expected a black background with the Loading <icon> in the bottom right, this background is full of bright spots.
>> Friend pass is enough to reproduce the issue without having the game.
>>
>> 2. https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-god-of-war-ragnarok-menu.jpg
>>
>> Colorful-bright points around the margin/corner of the God of War Ragnarok game menu.
>>
>> 3. God of War Ragnarok game intro:
>>
>> - https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-god-of-war-ragnarok-intro1.jpg
>> - https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-god-of-war-ragnarok-intro2.jpg
>> - https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-god-of-war-ragnarok-intro3.jpg
>> - https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-god-of-war-ragnarok-PS-logo.jpg
>>
>> Same random shimmer distortions.
>> I think those images are good examples, but still pending screenshot/GFX examples for comparison.
>> I'll take it and reply here later.
>>
> Thanks, that would still be helpful, but even as-is these images
> quite highlight the issue. It's more severe than I expected.
>
>>> Obviously we don't want to simply switch back to DCN10 helpers
>>> without understand why, and potentially regressing other use-cases.
>>> At least we should look at what the differences are between the
>>> two versions of that function, and which part of the curve programming
>>> causes the undesirable results.
>>>
>>> The original bug that was solved by that commit was a regression that
>>> sent bright values in an HDR video to black or red, so basically
>>> something really messed up bright PQ values. At least I suspect
>>> it was a PQ HDR video. The ticket doesn't state that.
>> I see. Looks like now we have somehow the same problem but in reverse (?) like black values mapped into bright values (?)
> Yeah, if I understand your screenshots the issue seems to happen
> (mainly) with dark values?
>
>>> When looking at the diff between the two functions I notice that
>>> the cm3_ version is missing the dc_fixpt_clamp_u0d10 for the
>>> delta_<color>_reg assignments, toward the bottom of the function.
>>> I remember I had to add that to the cm_ version since it caused
>>> issues with SteamOS HDR. Can we try that on the cm3_ function?
>> Yes, I remember this issue.
>>
>> I've already tried the same changes from this commit (https://gitlab.freedesktop.org/agd5f/linux/-/commit/27fc10d1095f) to cm3_helper, but it doesn't help... probably because the commit was addressing a different behaviors.
>>
>> I also noticed on cm3_ they consider a different range of hw points, as in this comment:
>> "
>>      // DCN3+ have 257 pts in lieu of no separate slope registers
>>      // Prior HW had 256 base+slope pairs
>> "
>>
>> Can it be related to this problem?
>>
> Possibly. The point distribution is one potential culprit.
>
> How I would debug this is to look at the diff between the two
> functions and try each diff one at a time to see whether one
> (or two) small changes fixes this. Then look at what that change
> was and what it does. That can then give us a guide on how to
> properly fix it without affecting other use-cases.

Hi Harry,

Sorry for the delay. I got swamped with another debugging.

I identified to different problems on plane shaper LUT when using the 
cm3 helper: those dark values wrong mapping and banding on some light 
values.
I followed your suggestion and found the necessary changes to address 
both issues, I just sent two RFC patches , so we can discuss it better 
there.

https://lore.kernel.org/amd-gfx/20251208234741.293037-1-mwen@igalia.com/

I still see a gradient banding on the game menu of Ori, but it's present 
with the DCN10 CM helper too.

Thanks for taking a look at these problems.

Melissa
>
> The other thing to understand is why we didn't see issues with
> the Color Pipeline API tests in IGT.
>
> Harry
>
>> Thanks,
>>
>> Melissa
>>
>>> Cheers,
>>> Harry
>>>
>>>> Thanks in advance,
>>>>
>>>> Melissa
>>>>
>>>>
>>>>    drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
>>>> index bf19ba65d09a..a28560caa1c0 100644
>>>> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
>>>> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
>>>> @@ -501,9 +501,9 @@ bool dcn32_set_mcm_luts(
>>>>            lut_params = &plane_state->in_shaper_func.pwl;
>>>>        else if (plane_state->in_shaper_func.type == TF_TYPE_DISTRIBUTED_POINTS) {
>>>>            // TODO: dpp_base replace
>>>> -        ASSERT(false);
>>>> -        cm3_helper_translate_curve_to_hw_format(&plane_state->in_shaper_func,
>>>> -                &dpp_base->shaper_params, true);
>>>> +        cm_helper_translate_curve_to_hw_format(plane_state->ctx,
>>>> +                               &plane_state->in_shaper_func,
>>>> +                               &dpp_base->shaper_params, true);
>>>>            lut_params = &dpp_base->shaper_params;
>>>>        }
>>>>    

