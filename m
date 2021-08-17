Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C623EE8DF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 10:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B80388830;
	Tue, 17 Aug 2021 08:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 92FE28825E;
 Tue, 17 Aug 2021 08:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 25E9F20201B;
 Tue, 17 Aug 2021 10:35:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 8o6w-qOk4zR4; Tue, 17 Aug 2021 10:35:37 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id DE2DA20201A;
 Tue, 17 Aug 2021 10:35:36 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1mFuZM-000j4v-3R; Tue, 17 Aug 2021 10:35:36 +0200
To: "Lazar, Lijo" <lijo.lazar@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: "Liu, Leo" <Leo.Liu@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210813102920.3458-1-michel@daenzer.net>
 <20210816103506.2671-1-michel@daenzer.net>
 <DM6PR12MB26191A1092AA54AA6405F0DAE4FE9@DM6PR12MB2619.namprd12.prod.outlook.com>
 <2edaef45-504a-b1c7-28e4-adc0d030715a@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH v3] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
Message-ID: <8512eefd-5322-ac89-43ad-9985b30b3da6@daenzer.net>
Date: Tue, 17 Aug 2021 10:35:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <2edaef45-504a-b1c7-28e4-adc0d030715a@amd.com>
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

On 2021-08-17 10:17 a.m., Lazar, Lijo wrote:
> On 8/17/2021 1:21 PM, Quan, Evan wrote:
>>> -----Original Message-----
>>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
>>> Michel Dänzer
>>> Sent: Monday, August 16, 2021 6:35 PM
>>> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>>> <Christian.Koenig@amd.com>
>>> Cc: Liu, Leo <Leo.Liu@amd.com>; Zhu, James <James.Zhu@amd.com>; amd-
>>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>> Subject: [PATCH v3] drm/amdgpu: Cancel delayed work when GFXOFF is
>>> disabled
>>>
>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>
>>> schedule_delayed_work does not push back the work if it was already
>>> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
>>> after the first time GFXOFF was disabled and re-enabled, even if GFXOFF
>>> was disabled and re-enabled again during those 100 ms.
>>>
>>> This resulted in frame drops / stutter with the upcoming mutter 41
>>> release on Navi 14, due to constantly enabling GFXOFF in the HW and
>>> disabling it again (for getting the GPU clock counter).
>>>
>>> To fix this, call cancel_delayed_work_sync when the disable count
>>> transitions from 0 to 1, and only schedule the delayed work on the
>>> reverse transition, not if the disable count was already 0. This makes
>>> sure the delayed work doesn't run at unexpected times, and allows it to
>>> be lock-free.
>>>
>>> v2:
>>> * Use cancel_delayed_work_sync & mutex_trylock instead of
>>>    mod_delayed_work.
>>> v3:
>>> * Make amdgpu_device_delay_enable_gfx_off lock-free (Christian König)
>>>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 +++++------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 22 +++++++++++++++++-
>>> ----
>>>   2 files changed, 22 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index f3fd5ec710b6..f944ed858f3e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -2777,12 +2777,11 @@ static void
>>> amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>>>       struct amdgpu_device *adev =
>>>           container_of(work, struct amdgpu_device,
>>> gfx.gfx_off_delay_work.work);
>>>
>>> -    mutex_lock(&adev->gfx.gfx_off_mutex);
>>> -    if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev,
>>> AMD_IP_BLOCK_TYPE_GFX, true))
>>> -            adev->gfx.gfx_off_state = true;
>>> -    }
>>> -    mutex_unlock(&adev->gfx.gfx_off_mutex);
>>> +    WARN_ON_ONCE(adev->gfx.gfx_off_state);
>>> +    WARN_ON_ONCE(adev->gfx.gfx_off_req_count);
>>> +
>>> +    if (!amdgpu_dpm_set_powergating_by_smu(adev,
>>> AMD_IP_BLOCK_TYPE_GFX, true))
>>> +        adev->gfx.gfx_off_state = true;
>>>   }
>>>
>>>   /**
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>> index a0be0772c8b3..ca91aafcb32b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>> @@ -563,15 +563,26 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device
>>> *adev, bool enable)
>>>
>>>       mutex_lock(&adev->gfx.gfx_off_mutex);
>>>
>>> -    if (!enable)
>>> -        adev->gfx.gfx_off_req_count++;
>>> -    else if (adev->gfx.gfx_off_req_count > 0)
>>> +    if (enable) {
>>> +        /* If the count is already 0, it means there's an imbalance bug
>>> somewhere.
>>> +         * Note that the bug may be in a different caller than the one
>>> which triggers the
>>> +         * WARN_ON_ONCE.
>>> +         */
>>> +        if (WARN_ON_ONCE(adev->gfx.gfx_off_req_count == 0))
>>> +            goto unlock;
>>> +
>>>           adev->gfx.gfx_off_req_count--;
>>> +    } else {
>>> +        adev->gfx.gfx_off_req_count++;
>>> +    }
>>>
>>>       if (enable && !adev->gfx.gfx_off_state && !adev-
>>>> gfx.gfx_off_req_count) {
>>>           schedule_delayed_work(&adev->gfx.gfx_off_delay_work,
>>> GFX_OFF_DELAY_ENABLE);
>>> -    } else if (!enable && adev->gfx.gfx_off_state) {
>>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev,
>>> AMD_IP_BLOCK_TYPE_GFX, false)) {
>>> +    } else if (!enable && adev->gfx.gfx_off_req_count == 1) {
>> [Quan, Evan] It seems here will leave a small time window for race condition. If amdgpu_device_delay_enable_gfx_off() happens to occur here, it will "WARN_ON_ONCE(adev->gfx.gfx_off_req_count);". How about something as below?
>> @@ -573,13 +573,11 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>>                          goto unlock;
>>
>>                  adev->gfx.gfx_off_req_count--;
>> -       } else {
>> -               adev->gfx.gfx_off_req_count++;
>>          }
>>
>>          if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>>                  schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
>> -       } else if (!enable && adev->gfx.gfx_off_req_count == 1) {
>> +       } else if (!enable && adev->gfx.gfx_off_req_count == 0) {
>>                  cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);
>>
>>                  if (adev->gfx.gfx_off_state &&
>> @@ -593,6 +591,9 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>>                  }
>>          }
>>
>> +       if (!enable)
>> +               adev->gfx.gfx_off_req_count++;
>> +
>>   unlock:
>>
> 
> Hi Evan,
> 
> It's not a race per se, it is just an undesirable condition of Enable Gfxoff immediately followed by a Disable GfxOff. The purpose of the WARN is to intimate the user about it.

What Evan pointed out (good catch, thanks!) is technically a race condition WRT adev->gfx.gfx_off_req_count, even though in this case it would have only triggered the sanity checks in place to catch bugs like it, it wouldn't otherwise have affected the correctness of the code.

Fixed in v4.


> There are other cases - for ex: if amdgpu_device_delay_enable_gfx_off() called amdgpu_dpm_set_powergating_by_smu() already at the same place you pointed out.

That OTOH is indeed not a race condition, just unlucky timing.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
