Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1163EB617
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 15:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4D76E7D2;
	Fri, 13 Aug 2021 13:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1A70B6E7D2;
 Fri, 13 Aug 2021 13:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 22FEE20201C;
 Fri, 13 Aug 2021 15:34:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 0CZXvb9vC-GR; Fri, 13 Aug 2021 15:34:09 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id C573120201B;
 Fri, 13 Aug 2021 15:34:09 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1mEXK4-000DFf-SA; Fri, 13 Aug 2021 15:34:08 +0200
To: "Lazar, Lijo" <lijo.lazar@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210811165211.6811-1-michel@daenzer.net>
 <20210813102920.3458-1-michel@daenzer.net>
 <f26f7350-79d6-e56f-bf69-fb1bf231208c@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
Message-ID: <ff3c9ad3-ba7a-ef7b-d82e-27fa76c33979@daenzer.net>
Date: Fri, 13 Aug 2021 15:34:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <f26f7350-79d6-e56f-bf69-fb1bf231208c@amd.com>
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

On 2021-08-13 1:50 p.m., Lazar, Lijo wrote:
> 
> 
> On 8/13/2021 3:59 PM, Michel Dänzer wrote:
>> From: Michel Dänzer <mdaenzer@redhat.com>
>>
>> schedule_delayed_work does not push back the work if it was already
>> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
>> after the first time GFXOFF was disabled and re-enabled, even if GFXOFF
>> was disabled and re-enabled again during those 100 ms.
>>
>> This resulted in frame drops / stutter with the upcoming mutter 41
>> release on Navi 14, due to constantly enabling GFXOFF in the HW and
>> disabling it again (for getting the GPU clock counter).
>>
>> To fix this, call cancel_delayed_work_sync when GFXOFF transitions from
>> enabled to disabled. This makes sure the delayed work will be scheduled
>> as intended in the reverse case.
>>
>> In order to avoid a deadlock, amdgpu_device_delay_enable_gfx_off needs
>> to use mutex_trylock instead of mutex_lock.
>>
>> v2:
>> * Use cancel_delayed_work_sync & mutex_trylock instead of
>>    mod_delayed_work.
>>
>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 ++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 13 +++++++------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h    |  3 +++
>>   3 files changed, 20 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index f3fd5ec710b6..8b025f70706c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2777,7 +2777,16 @@ static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>>       struct amdgpu_device *adev =
>>           container_of(work, struct amdgpu_device, gfx.gfx_off_delay_work.work);
>>   -    mutex_lock(&adev->gfx.gfx_off_mutex);
>> +    /* mutex_lock could deadlock with cancel_delayed_work_sync in amdgpu_gfx_off_ctrl. */
>> +    if (!mutex_trylock(&adev->gfx.gfx_off_mutex)) {
>> +        /* If there's a bug which causes amdgpu_gfx_off_ctrl to be called with enable=true
>> +         * when adev->gfx.gfx_off_req_count is already 0, we might race with that.
>> +         * Re-schedule to make sure gfx off will be re-enabled in the HW eventually.
>> +         */
>> +        schedule_delayed_work(&adev->gfx.gfx_off_delay_work, AMDGPU_GFX_OFF_DELAY_ENABLE);
>> +        return;
> 
> This is not needed and is just creating another thread to contend for mutex.

Still not sure what you mean by that. What other thread?

> The checks below take care of enabling gfxoff correctly. If it's already in gfx_off state, it doesn't do anything. So I don't see why this change is needed.

mutex_trylock is needed to prevent the deadlock discussed before and below.

schedule_delayed_work is needed due to this scenario hinted at by the comment:

1. amdgpu_gfx_off_ctrl locks mutex, calls schedule_delayed_work
2. amdgpu_device_delay_enable_gfx_off runs, calls mutex_trylock, which fails

GFXOFF would never get re-enabled in HW in this case (until amdgpu_gfx_off_ctrl calls schedule_delayed_work again).

(cancel_delayed_work_sync guarantees there's no pending delayed work when it returns, even if amdgpu_device_delay_enable_gfx_off calls schedule_delayed_work)


> The other problem is amdgpu_get_gfx_off_status() also uses the same mutex.

Not sure what for TBH. AFAICT there's only one implementation of this for Renoir, which just reads a register. (It's only called from debugfs)

> So it won't be knowing which thread it would be contending against and blindly creates more work items. 

There is only ever at most one instance of the delayed work at any time. amdgpu_device_delay_enable_gfx_off doesn't care whether amdgpu_gfx_off_ctrl or amdgpu_get_gfx_off_status is holding the mutex, it just keeps re-scheduling itself 100 ms later until it succeeds.


>> @@ -569,9 +566,13 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>>           adev->gfx.gfx_off_req_count--;
>>         if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>> -        schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
>> -    } else if (!enable && adev->gfx.gfx_off_state) {
>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
>> +        schedule_delayed_work(&adev->gfx.gfx_off_delay_work, AMDGPU_GFX_OFF_DELAY_ENABLE);
>> +    } else if (!enable) {
>> +        if (adev->gfx.gfx_off_req_count == 1 && !adev->gfx.gfx_off_state)
>> +            cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);
> 
> This has the deadlock problem as discussed in the other thread.

It does not. If amdgpu_device_delay_enable_gfx_off runs while amdgpu_gfx_off_ctrl holds the mutex, 
mutex_trylock fails and the former bails.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
