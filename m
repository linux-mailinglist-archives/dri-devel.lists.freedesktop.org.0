Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0195842714
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 15:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098D310ED44;
	Tue, 30 Jan 2024 14:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF60210E69A;
 Tue, 30 Jan 2024 14:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706625734; x=1738161734;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iNdRExXJLM8h5BjFuMI6znqjmEa9eZ2bafY1jn7N9Kw=;
 b=TwNSJoRFkb1iLn8fRvQnJdSMAKOLTrmR/R82XYPSvLVIG+miF6hK2AAz
 40nVmT1bMiNLZ5qg6OTxfzNff1n4LFRfgl/7chtiYZmnWv/kRhFE/oPqI
 MbSO5szb7rDPsNXlONHPfKHHHG+0DTrcUeOeYgVm83f0cSC0zg/GOrTkH
 j8AJXl1FZRd9WOTiNo6AEsJKKMHgK50tLl1D8r+ZS79W4KRtRPU81fHNY
 PZjIkdOfA93Kfz7fEQ0VddaATfg1ND/0nV7rCwPw2FANE2AF+fXYwTtNe
 T4n3DI5bkOqNN/HS8GongKSZryT7raO4EuLsCP3Tq07N7V2YEXFajG4kF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="2233214"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="2233214"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 06:42:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3778429"
Received: from skofoed-mobl.ger.corp.intel.com (HELO [10.249.254.21])
 ([10.249.254.21])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 06:42:11 -0800
Message-ID: <69d83bad-0e63-4d9f-9638-578f99e1fa7f@linux.intel.com>
Date: Tue, 30 Jan 2024 15:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix a build error
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Oak Zeng <oak.zeng@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20240127155327.423294-1-oak.zeng@intel.com>
 <21f2b595-0690-4372-bd81-86d23ac7498b@gmail.com>
 <0d1e2c15-c951-4c97-b242-a1231ae4f608@linux.intel.com>
 <26bde5f6-62a5-494c-b59f-b330eb85f4bb@gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <26bde5f6-62a5-494c-b59f-b330eb85f4bb@gmail.com>
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
Cc: Amaranath.Somalapuram@amd.com, lucas.demarchi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/30/24 15:31, Christian König wrote:
> Am 29.01.24 um 21:25 schrieb Thomas Hellström:
>> Hi,
>>
>> On 1/29/24 17:48, Christian König wrote:
>>> Am 27.01.24 um 16:53 schrieb Oak Zeng:
>>>> This fixes a build failure on drm-tip. This issue was introduced 
>>>> during
>>>> merge of "drm/ttm: replace busy placement with flags v6". For some
>>>> reason, the xe_bo.c part of above change is not merged. Manually merge
>>>> the missing part to drm_tip
>>>
>>> Mhm, I provided this as manual fixup for drm-tip in this rerere commit:
>>>
>>> commit afc5797e8c03bed3ec47a34f2bc3cf03fce24411
>>> Author: Christian König <christian.koenig@amd.com>
>>> Date:   Thu Jan 25 10:44:54 2024 +0100
>>>
>>>     2024y-01m-25d-09h-44m-07s UTC: drm-tip rerere cache update
>>>
>>>     git version 2.34.1
>>>
>>>
>>> And for me compiling xe in drm-tip worked fine after that. No idea 
>>> why that didn't work for you.
>>>
>>> Anyway feel free to add my rb to this patch here if it helps in any 
>>> way.
>>>
>>> Regards,
>>> Christian.
>>
>> I reverted that rerere cache update and added another one, so now it 
>> works. Not sure exactly what the difference was, but the resulting 
>> patch was for the drm-misc-next merge in my case, and It was for 
>> drm-xe-something in your case.
>
> Yeah, I've noticed that this was applied to the drm-xe-something 
> branch as well. That's why I reverted and re-applied the patch but dim 
> still ended up applying it to drm-xe-something instead of 
> drm-misc-next so I thought that this was intentional.
>
> It would be rather nice if somebody can tell me what the heck went 
> wrong here so that I don't repeat this mistake.

TBH I'm not completely sure. Sometimes those fixups are not recognized 
and applied, which seems to be have been the case here.

But it appears to be important to break the interactive rebuild-tip just 
after the merge that brings in the silent conflict. In this case it was 
drm-misc-next. Sometimes it might also help to hold off commiting until 
drm-misc-next backmerges the recent release series and thus contain all 
code that the commit touches.

/Thomas

>
> Thanks,
> Christian.
>
>>
>> /Thomas
>>
>>
>>>
>>>>
>>>> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_bo.c | 33 +++++++++++++++------------------
>>>>   1 file changed, 15 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>> index 686d716c5581..d6a193060cc0 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>> @@ -38,22 +38,26 @@ static const struct ttm_place 
>>>> sys_placement_flags = {
>>>>   static struct ttm_placement sys_placement = {
>>>>       .num_placement = 1,
>>>>       .placement = &sys_placement_flags,
>>>> -    .num_busy_placement = 1,
>>>> -    .busy_placement = &sys_placement_flags,
>>>>   };
>>>>   -static const struct ttm_place tt_placement_flags = {
>>>> -    .fpfn = 0,
>>>> -    .lpfn = 0,
>>>> -    .mem_type = XE_PL_TT,
>>>> -    .flags = 0,
>>>> +static const struct ttm_place tt_placement_flags[] = {
>>>> +    {
>>>> +        .fpfn = 0,
>>>> +        .lpfn = 0,
>>>> +        .mem_type = XE_PL_TT,
>>>> +        .flags = TTM_PL_FLAG_DESIRED,
>>>> +    },
>>>> +    {
>>>> +        .fpfn = 0,
>>>> +        .lpfn = 0,
>>>> +        .mem_type = XE_PL_SYSTEM,
>>>> +        .flags = TTM_PL_FLAG_FALLBACK,
>>>> +    }
>>>>   };
>>>>     static struct ttm_placement tt_placement = {
>>>> -    .num_placement = 1,
>>>> -    .placement = &tt_placement_flags,
>>>> -    .num_busy_placement = 1,
>>>> -    .busy_placement = &sys_placement_flags,
>>>> +    .num_placement = 2,
>>>> +    .placement = tt_placement_flags,
>>>>   };
>>>>     bool mem_type_is_vram(u32 mem_type)
>>>> @@ -230,8 +234,6 @@ static int __xe_bo_placement_for_flags(struct 
>>>> xe_device *xe, struct xe_bo *bo,
>>>>       bo->placement = (struct ttm_placement) {
>>>>           .num_placement = c,
>>>>           .placement = bo->placements,
>>>> -        .num_busy_placement = c,
>>>> -        .busy_placement = bo->placements,
>>>>       };
>>>>         return 0;
>>>> @@ -251,7 +253,6 @@ static void xe_evict_flags(struct 
>>>> ttm_buffer_object *tbo,
>>>>           /* Don't handle scatter gather BOs */
>>>>           if (tbo->type == ttm_bo_type_sg) {
>>>>               placement->num_placement = 0;
>>>> -            placement->num_busy_placement = 0;
>>>>               return;
>>>>           }
>>>>   @@ -1391,8 +1392,6 @@ static int __xe_bo_fixed_placement(struct 
>>>> xe_device *xe,
>>>>       bo->placement = (struct ttm_placement) {
>>>>           .num_placement = 1,
>>>>           .placement = place,
>>>> -        .num_busy_placement = 1,
>>>> -        .busy_placement = place,
>>>>       };
>>>>         return 0;
>>>> @@ -2150,9 +2149,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 
>>>> mem_type)
>>>>         xe_place_from_ttm_type(mem_type, &requested);
>>>>       placement.num_placement = 1;
>>>> -    placement.num_busy_placement = 1;
>>>>       placement.placement = &requested;
>>>> -    placement.busy_placement = &requested;
>>>>         /*
>>>>        * Stolen needs to be handled like below VRAM handling if we 
>>>> ever need
>>>
>
