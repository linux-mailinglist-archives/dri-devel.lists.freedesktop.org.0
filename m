Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242643EE9B1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 11:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEA6898EA;
	Tue, 17 Aug 2021 09:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7D27B8989C;
 Tue, 17 Aug 2021 09:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id AA2BD20201B;
 Tue, 17 Aug 2021 11:26:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id OMy0Z1-jP6-n; Tue, 17 Aug 2021 11:26:04 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id AFA1A20201A;
 Tue, 17 Aug 2021 11:26:04 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1mFvMB-000jO0-QA; Tue, 17 Aug 2021 11:26:03 +0200
To: "Lazar, Lijo" <lijo.lazar@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210816103506.2671-1-michel@daenzer.net>
 <20210817082325.2579-1-michel@daenzer.net>
 <ceaa02c9-26ef-e1e5-3f35-3cc202961670@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
Message-ID: <8461fba5-662e-85f7-b712-472232ed12ba@daenzer.net>
Date: Tue, 17 Aug 2021 11:26:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <ceaa02c9-26ef-e1e5-3f35-3cc202961670@amd.com>
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

On 2021-08-17 11:12 a.m., Lazar, Lijo wrote:
> 
> 
> On 8/17/2021 1:53 PM, Michel Dänzer wrote:
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
>> To fix this, call cancel_delayed_work_sync when the disable count
>> transitions from 0 to 1, and only schedule the delayed work on the
>> reverse transition, not if the disable count was already 0. This makes
>> sure the delayed work doesn't run at unexpected times, and allows it to
>> be lock-free.
>>
>> v2:
>> * Use cancel_delayed_work_sync & mutex_trylock instead of
>>    mod_delayed_work.
>> v3:
>> * Make amdgpu_device_delay_enable_gfx_off lock-free (Christian König)
>> v4:
>> * Fix race condition between amdgpu_gfx_off_ctrl incrementing
>>    adev->gfx.gfx_off_req_count and amdgpu_device_delay_enable_gfx_off
>>    checking for it to be 0 (Evan Quan)
>>
>> Cc: stable@vger.kernel.org
>> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com> # v3
>> Acked-by: Christian König <christian.koenig@amd.com> # v3
>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>> ---
>>
>> Alex, probably best to wait a bit longer before picking this up. :)
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 +++----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 36 +++++++++++++++-------
>>   2 files changed, 30 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index f3fd5ec710b6..f944ed858f3e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2777,12 +2777,11 @@ static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>>       struct amdgpu_device *adev =
>>           container_of(work, struct amdgpu_device, gfx.gfx_off_delay_work.work);
>>   -    mutex_lock(&adev->gfx.gfx_off_mutex);
>> -    if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
>> -            adev->gfx.gfx_off_state = true;
>> -    }
>> -    mutex_unlock(&adev->gfx.gfx_off_mutex);
>> +    WARN_ON_ONCE(adev->gfx.gfx_off_state);
>> +    WARN_ON_ONCE(adev->gfx.gfx_off_req_count);
>> +
>> +    if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
>> +        adev->gfx.gfx_off_state = true;
>>   }
>>     /**
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> index a0be0772c8b3..b4ced45301be 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> @@ -563,24 +563,38 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>>         mutex_lock(&adev->gfx.gfx_off_mutex);
>>   -    if (!enable)
>> -        adev->gfx.gfx_off_req_count++;
>> -    else if (adev->gfx.gfx_off_req_count > 0)
>> +    if (enable) {
>> +        /* If the count is already 0, it means there's an imbalance bug somewhere.
>> +         * Note that the bug may be in a different caller than the one which triggers the
>> +         * WARN_ON_ONCE.
>> +         */
>> +        if (WARN_ON_ONCE(adev->gfx.gfx_off_req_count == 0))
>> +            goto unlock;
>> +
>>           adev->gfx.gfx_off_req_count--;
>>   -    if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>> -        schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
>> -    } else if (!enable && adev->gfx.gfx_off_state) {
>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
>> -            adev->gfx.gfx_off_state = false;
>> +        if (adev->gfx.gfx_off_req_count == 0 && !adev->gfx.gfx_off_state)
>> +            schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
>> +    } else {
>> +        if (adev->gfx.gfx_off_req_count == 0) {
>> +            cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);
>> +
>> +            if (adev->gfx.gfx_off_state &&
> 
> More of a question which I didn't check last time - Is this expected to be true when the disable call comes in first?

My assumption is that cancel_delayed_work_sync guarantees amdgpu_device_delay_enable_gfx_off's assignment is visible here.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
