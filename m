Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 666463ED232
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 12:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1429C89DC0;
	Mon, 16 Aug 2021 10:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BB2989DF7;
 Mon, 16 Aug 2021 10:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id A01B420201B;
 Mon, 16 Aug 2021 12:45:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id n-8WcqCXr1I3; Mon, 16 Aug 2021 12:45:37 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id EC72520201A;
 Mon, 16 Aug 2021 12:45:36 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1mFa7b-000bDq-1X; Mon, 16 Aug 2021 12:45:35 +0200
To: "Lazar, Lijo" <lijo.lazar@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210811165211.6811-1-michel@daenzer.net>
 <20210813102920.3458-1-michel@daenzer.net>
 <f26f7350-79d6-e56f-bf69-fb1bf231208c@amd.com>
 <ff3c9ad3-ba7a-ef7b-d82e-27fa76c33979@daenzer.net>
 <9ec17598-0b51-014c-c633-2e4e74c863e9@amd.com>
 <31c9a190-8329-383e-bbea-3520add4d16a@daenzer.net>
 <3ab84437-d4f6-c979-ef7f-d29dcf35eedb@amd.com>
 <faf05193-c33a-167d-c727-280686dd7dae@daenzer.net>
 <1074e0bc-7b7d-ffdc-749f-b650148f4614@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
Message-ID: <31276321-bfc8-3dbc-e036-1e50d31d95c6@daenzer.net>
Date: Mon, 16 Aug 2021 12:45:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1074e0bc-7b7d-ffdc-749f-b650148f4614@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
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

On 2021-08-16 6:13 a.m., Lazar, Lijo wrote:
> On 8/13/2021 9:30 PM, Michel Dänzer wrote:
>> On 2021-08-13 5:07 p.m., Lazar, Lijo wrote:
>>> On 8/13/2021 8:10 PM, Michel Dänzer wrote:
>>>> On 2021-08-13 4:14 p.m., Lazar, Lijo wrote:
>>>>> On 8/13/2021 7:04 PM, Michel Dänzer wrote:
>>>>>> On 2021-08-13 1:50 p.m., Lazar, Lijo wrote:
>>>>>>> On 8/13/2021 3:59 PM, Michel Dänzer wrote:
>>>>>>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>>>>>>
>>>>>>>> schedule_delayed_work does not push back the work if it was already
>>>>>>>> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
>>>>>>>> after the first time GFXOFF was disabled and re-enabled, even if GFXOFF
>>>>>>>> was disabled and re-enabled again during those 100 ms.
>>>>>>>>
>>>>>>>> This resulted in frame drops / stutter with the upcoming mutter 41
>>>>>>>> release on Navi 14, due to constantly enabling GFXOFF in the HW and
>>>>>>>> disabling it again (for getting the GPU clock counter).
>>>>>>>>
>>>>>>>> To fix this, call cancel_delayed_work_sync when GFXOFF transitions from
>>>>>>>> enabled to disabled. This makes sure the delayed work will be scheduled
>>>>>>>> as intended in the reverse case.
>>>>>>>>
>>>>>>>> In order to avoid a deadlock, amdgpu_device_delay_enable_gfx_off needs
>>>>>>>> to use mutex_trylock instead of mutex_lock.
>>>>>>>>
>>>>>>>> v2:
>>>>>>>> * Use cancel_delayed_work_sync & mutex_trylock instead of
>>>>>>>>       mod_delayed_work.
>>>>>>>>
>>>>>>>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 ++++++++++-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 13 +++++++------
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h    |  3 +++
>>>>>>>>      3 files changed, 20 insertions(+), 7 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>> index f3fd5ec710b6..8b025f70706c 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>> @@ -2777,7 +2777,16 @@ static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>>>>>>>>          struct amdgpu_device *adev =
>>>>>>>>              container_of(work, struct amdgpu_device, gfx.gfx_off_delay_work.work);
>>>>>>>>      -    mutex_lock(&adev->gfx.gfx_off_mutex);
>>>>>>>> +    /* mutex_lock could deadlock with cancel_delayed_work_sync in amdgpu_gfx_off_ctrl. */
>>>>>>>> +    if (!mutex_trylock(&adev->gfx.gfx_off_mutex)) {
>>>>>>>> +        /* If there's a bug which causes amdgpu_gfx_off_ctrl to be called with enable=true
>>>>>>>> +         * when adev->gfx.gfx_off_req_count is already 0, we might race with that.
>>>>>>>> +         * Re-schedule to make sure gfx off will be re-enabled in the HW eventually.
>>>>>>>> +         */
>>>>>>>> +        schedule_delayed_work(&adev->gfx.gfx_off_delay_work, AMDGPU_GFX_OFF_DELAY_ENABLE);
>>>>>>>> +        return;
>>>>>>>
>>>>>>> This is not needed and is just creating another thread to contend for mutex.
>>>>>>
>>>>>> Still not sure what you mean by that. What other thread?
>>>>>
>>>>> Sorry, I meant it schedules another workitem and delays GFXOFF enablement further. For ex: if it was another function like gfx_off_status holding the lock at the time of check.
>>>>>
>>>>>>
>>>>>>> The checks below take care of enabling gfxoff correctly. If it's already in gfx_off state, it doesn't do anything. So I don't see why this change is needed.
>>>>>>
>>>>>> mutex_trylock is needed to prevent the deadlock discussed before and below.
>>>>>>
>>>>>> schedule_delayed_work is needed due to this scenario hinted at by the comment:
>>>>>>
>>>>>> 1. amdgpu_gfx_off_ctrl locks mutex, calls schedule_delayed_work
>>>>>> 2. amdgpu_device_delay_enable_gfx_off runs, calls mutex_trylock, which fails
>>>>>>
>>>>>> GFXOFF would never get re-enabled in HW in this case (until amdgpu_gfx_off_ctrl calls schedule_delayed_work again).
>>>>>>
>>>>>> (cancel_delayed_work_sync guarantees there's no pending delayed work when it returns, even if amdgpu_device_delay_enable_gfx_off calls schedule_delayed_work)
>>>>>>
>>>>>
>>>>> I think we need to explain based on the original code before. There is an asssumption here that the only other contention of this mutex is with the gfx_off_ctrl function.
>>>>
>>>> Not really.
>>>>
>>>>
>>>>> As far as I understand if the work has already started running when schedule_delayed_work is called, it will insert another in the work queue after delay. Based on that understanding I didn't find a problem with the original code.
>>>>
>>>> Original code as in without this patch or the mod_delayed_work patch? If so, the problem is not when the work has already started running. It's that when it hasn't started running yet, schedule_delayed_work doesn't change the timeout for the already scheduled work, so it ends up enabling GFXOFF earlier than intended (and thus at all in scenarios when it's not supposed to).
>>>>
>>>
>>> I meant the original implementation of amdgpu_device_delay_enable_gfx_off().
>>>
>>>
>>> If you indeed want to use _sync, there is a small problem with this implementation also which is roughly equivalent to the original problem you faced.
>>>
>>> amdgpu_gfx_off_ctrl(disable) locks mutex
>>> calls cancel_delayed_work_sync
>>> amdgpu_device_delay_enable_gfx_off already started running
>>>      mutex_trylock fails and schedules another one
>>> amdgpu_gfx_off_ctrl(enable)
>>>      schedules_delayed_work() - Delay is not extended, it's the same as when it's rearmed from work item.
>>
>>
>> This cannot happen. When cancel_delayed_work_sync returns, it guarantees that the delayed work is not scheduled
>> , even if amdgpu_device_delay_enable_gfx_off called schedule_delayed_work. In other words, it cancels that as well.
>>
> 
> Ah, thanks! Didn't know that it will cancel out re-queued work also. In that case, may be reduce the delay for re-queuing it - say 50% or 25% of AMDGPU_GFX_OFF_DELAY_ENABLE. Instead of delaying GFXOFF further, it's better to enable it faster as it's losing out to another enable or some other function.
> 
>>> Probably, overthinking about the solution. Looking back, mod_ version is simpler :). May be just delay it further everytime there is a call with enable instead of doing it only for req_cnt==0?
>>
>> That has some issues as well:
>>
>> * Still prone to the "amdgpu_device_delay_enable_gfx_off re-enables GFXOFF immediately after amdgpu_gfx_off_ctrl dropped req_count to 0" race if the former starts running between when the latter locks the mutex and calls mod_delayed_work.
>> * If the work is not scheduled yet, mod_delayed_work would schedule it, even if req_count > 0, in which case it couldn't actually enable GFXOFF.
>>
>> Conceptually, making sure the work is never scheduled while req_count > 0 seems cleaner to me. It's the same principle as in the JPEG/UVD/VCE/VCN ring functions (which are presumably hotter paths than these amdgpu_gfx_off functions) I needlessly modified in patch 2.
>>
>> (It also means amdgpu_device_delay_enable_gfx_off technically no longer needs to test req_count or gfx_off_state; I can spin a v3 for that if desired)
>>
> 
> Would still keep the "gfx_off_state check" to avoid executing the sequence due to buggy enable calls coming when it's already in gfxoff (if at all that happens).

The v3 patch addresses all of these issues.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
