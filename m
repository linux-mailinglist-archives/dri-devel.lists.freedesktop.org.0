Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CBA3ED979
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 17:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6275989F49;
	Mon, 16 Aug 2021 15:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2310789EB4;
 Mon, 16 Aug 2021 15:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 306A920201B;
 Mon, 16 Aug 2021 17:07:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id ij8GSkRRAnIs; Mon, 16 Aug 2021 17:06:58 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 29DBF20201A;
 Mon, 16 Aug 2021 17:06:58 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1mFeCW-000cmn-W7; Mon, 16 Aug 2021 17:06:56 +0200
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Lazar, Lijo" <lijo.lazar@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210813102920.3458-1-michel@daenzer.net>
 <20210816103506.2671-1-michel@daenzer.net>
 <cc08735b-df2f-e8a6-a1b0-22e1dba02757@amd.com>
 <ec4d551f-f1ca-3ccf-9b36-6522d529d128@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH v3] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
Message-ID: <d69ae1de-c47d-3831-7bf0-1e2606445f68@daenzer.net>
Date: Mon, 16 Aug 2021 17:06:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <ec4d551f-f1ca-3ccf-9b36-6522d529d128@gmail.com>
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

On 2021-08-16 2:06 p.m., Christian König wrote:
> Am 16.08.21 um 13:33 schrieb Lazar, Lijo:
>> On 8/16/2021 4:05 PM, Michel Dänzer wrote:
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
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 22 +++++++++++++++++-----
>>>   2 files changed, 22 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index f3fd5ec710b6..f944ed858f3e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -2777,12 +2777,11 @@ static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>>>       struct amdgpu_device *adev =
>>>           container_of(work, struct amdgpu_device, gfx.gfx_off_delay_work.work);
>>>   -    mutex_lock(&adev->gfx.gfx_off_mutex);
>>> -    if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
>>> -            adev->gfx.gfx_off_state = true;
>>> -    }
>>> -    mutex_unlock(&adev->gfx.gfx_off_mutex);
>>> +    WARN_ON_ONCE(adev->gfx.gfx_off_state);
>>
>> Don't see any case for this. It's not expected to be scheduled in this case, right?
>>
>>> + WARN_ON_ONCE(adev->gfx.gfx_off_req_count);
>>> +
>>
>> Thinking about ON_ONCE here - this may happen more than once if it's completed as part of cancel_ call. Is the warning needed?
> 
> WARN_ON_ONCE() is usually used to prevent spamming the system log with warnings. E.g. the warning is only printed once indicating a driver bug and that's it.

Right, these WARN_ONs are like assert()s in user-space code, documenting the pre-conditions and checking them at runtime. And I use _ONCE so that if a pre-condition is ever violated for some reason, dmesg isn't spammed with multiple warnings.


>> Anyway,
>>     Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
> 
> Acked-by: Christian König <christian.koenig@amd.com>

Thanks guys!


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
