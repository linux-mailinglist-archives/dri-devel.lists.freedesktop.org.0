Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCAB395991
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 13:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8416E8E6;
	Mon, 31 May 2021 11:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839996E8E3;
 Mon, 31 May 2021 11:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 108073F68D;
 Mon, 31 May 2021 13:19:55 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="E0Qtd880";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.717
X-Spam-Level: 
X-Spam-Status: No, score=-2.717 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.618,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wdTArg-DHVBK; Mon, 31 May 2021 13:19:53 +0200 (CEST)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 167CE3F29C;
 Mon, 31 May 2021 13:19:52 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 83B313600E5;
 Mon, 31 May 2021 13:19:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1622459992; bh=QYIMOTjKRSGFpFks5MLAgWIY0L5P+8zUaL2rYrtpIIs=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=E0Qtd880px3OjbbSCgzhoi1ZENt1aRSJXH6npvz/dfAVWh/A4wT4ll6BlXTJcX5Pk
 ZgmDMb4poGlVRMn6OmSznShnpcWTQDNsoN5UijRjS3IazPYu0DxM1ZuWq5AO9Vx+7g
 h06L5nFUHqOyLCr5vC3SNi9lVGnM86v/LWpHrlXw=
Subject: Re: [PATCH 1/2] drm/ttm: cleanup and add TTM_PL_FLAG_TEMPORARY
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Yu, Lang" <Lang.Yu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20210527013051.4302-1-Lang.Yu@amd.com>
 <DM6PR12MB4250B79297F587313D7645EBFB3F9@DM6PR12MB4250.namprd12.prod.outlook.com>
 <14d7f047-cf6d-c84a-14ff-3f1d833a770b@shipmail.org>
 <883bd629-e3ad-07a2-8952-994f42cb02be@gmail.com>
 <86054733-9b7d-de96-4ab2-21dca85f1e6e@shipmail.org>
 <888c52a5-ec10-0dee-c462-93cef8510e9f@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <6c4c8c57-7cc7-7e24-1d19-b91a312d44a0@shipmail.org>
Date: Mon, 31 May 2021 13:19:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <888c52a5-ec10-0dee-c462-93cef8510e9f@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 5/31/21 12:56 PM, Christian König wrote:
> Am 31.05.21 um 12:46 schrieb Thomas Hellström (Intel):
>>
>> On 5/31/21 12:32 PM, Christian König wrote:
>>> Am 31.05.21 um 11:52 schrieb Thomas Hellström (Intel):
>>>> Hi, Lang,
>>>>
>>>> On 5/31/21 10:19 AM, Yu, Lang wrote:
>>>>> [Public]
>>>>>
>>>>>> Hi,
>>>>>> On 5/27/21 3:30 AM, Lang Yu wrote:
>>>>>>> Make TTM_PL_FLAG_* start from zero and add
>>>>>>> TTM_PL_FLAG_TEMPORARY flag for temporary
>>>>>>> GTT allocation use.
>>>>>> GTT is a driver private acronym, right? And it doesn't look like
>>>>>> TTM_PL_FLAG_TEMPORARY will be used in core TTM, so should we 
>>>>>> instead set
>>>>>> aside a mask in the PL flag for driver-private use?
>>>>> Hi Thomas,
>>>>>
>>>>> Thanks for your comments and advice, GTT means Graphics 
>>>>> Translation Table here, seems
>>>>> a general acronym. TTM_PL_FLAG_TEMPORARY may also be used by other 
>>>>> drives.
>>>>> I have made other patches for this. Please help review.
>>>>>
>>>>> Regards,
>>>>> Lang
>>>>>
>>>> My point was really that the flag naming and documentation should 
>>>> reflect what core ttm is doing with that flag. If there is no 
>>>> specific core TTM usage, IMO we should move it to a driver specific 
>>>> flag to avoid future confusion. In particular a writer of a generic 
>>>> TTM resource manager should be able to know without looking at an 
>>>> old commit message what the placement flag is intended for.
>>>>
>>>> So here we add a flag where core TTM forces a bo move on validate 
>>>> and that's it. And that appears to be how it's used when an amdgpu 
>>>> bo is evicted to GTT, (btw should it be accounted in this situation?)
>>>>
>>>> The other use is to force the amdgpu driver to temporarily accept 
>>>> it into GTT when there is a lack of space, and IMHO that's a driver 
>>>> specific use and we should allocate a mask for driver specific 
>>>> flags for that.
>>>>
>>>> So shouldn't this be two flags, really?
>>>
>>> Well one flag makes sense for the use case at hand that drivers want 
>>> to signal to TTM that an allocation is only temporary and not 
>>> considered valid.
>>>
>>> That we then use this flag to implement temporary GTT allocations to 
>>> avoid problems during eviction is just extending that use case.
>>>
>> OK, but it looked like there were actually two use-cases. One for 
>> possibly long-term VRAM evictions to GTT, the other for the temporary 
>> use-case where the hop resource allocations sometimes failed. Or did 
>> I misunderstand the code?
>
> Ok sounds like we need more documentation here. That's really one use 
> case.
>
> Key point is we need temporary allocation during multihop which should 
> be handled differently to normal allocations.

Yes, that part is clear from the patches. The part that I can't fit into 
that pattern is why the evict flags when evicting from visible VRAM to 
GTT or ordinary VRAM is marked with TTM_PL_FLAG_TEMPORARY. Wouldn't 
those remain evicted in that placement until re-validated to visible 
VRAM at an unknown future time?

Patch 3/3:

  			amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_GTT);
			abo->placements[0].flags |= TTM_PL_FLAG_TEMPORARY;



>
> Christian.
>
>>
>> /Thomas
>>
>>
>>> Christian.
>>>
>>>>
>>>> TTM_PL_FLAG_FORCE_MOVE
>>>>
>>>> and
>>>>
>>>> AMDGPU_PL_FLAG_TEMPORARY
>>>>
>>>> Thanks,
>>>>
>>>> /Thomas
>>>>
>>>>>> Thomas
>>>>>> -----Original Message-----
>>>>>> From: Yu, Lang <Lang.Yu@amd.com>
>>>>>> Sent: Thursday, May 27, 2021 9:31 AM
>>>>>> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>>>>> Cc: Koenig, Christian <Christian.Koenig@amd.com>; Huang, Ray
>>>>>> <Ray.Huang@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>;
>>>>>> Yu, Lang <Lang.Yu@amd.com>
>>>>>> Subject: [PATCH 1/2] drm/ttm: cleanup and add TTM_PL_FLAG_TEMPORARY
>>>>>>
>>>>>> Make TTM_PL_FLAG_* start from zero and add TTM_PL_FLAG_TEMPORARY 
>>>>>> flag
>>>>>> for temporary GTT allocation use.
>>>>>>
>>>>>> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
>>>>>> ---
>>>>>> include/drm/ttm/ttm_placement.h | 5 +++--
>>>>>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/include/drm/ttm/ttm_placement.h
>>>>>> b/include/drm/ttm/ttm_placement.h index 
>>>>>> aa6ba4d0cf78..9f5cfc7c2d5a 100644
>>>>>> --- a/include/drm/ttm/ttm_placement.h
>>>>>> +++ b/include/drm/ttm/ttm_placement.h
>>>>>> @@ -47,8 +47,9 @@
>>>>>>   * top of the memory area, instead of the bottom.
>>>>>>   */
>>>>>>
>>>>>> -#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
>>>>>> -#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
>>>>>> +#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
>>>>>> +#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
>>>>>> +#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>>>>>>
>>>>>> /**
>>>>>>   * struct ttm_place
>>>>>> -- 
>>>>>> 2.25.1
>>>> _______________________________________________
>>>> amd-gfx mailing list
>>>> amd-gfx@lists.freedesktop.org
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C3868af2bd5d94aeda94b08d924215b3a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637580547980190391%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=C7b5wz8Kph5bM8fkFVyXKwSNkSj3lDaxGUnww4jY%2FeM%3D&amp;reserved=0 
>>>>
