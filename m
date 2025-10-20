Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8BEBF3A81
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 23:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE9D10E515;
	Mon, 20 Oct 2025 21:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NdOZS6fA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC2510E515;
 Mon, 20 Oct 2025 21:09:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0B26743FD3;
 Mon, 20 Oct 2025 21:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A01C113D0;
 Mon, 20 Oct 2025 21:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760994554;
 bh=2OWfnrw6R79/W6QhBeXTqM5HVJZw23+arXPfbfHvRhc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NdOZS6fAa5DYVHLmuV/KArrNGY3K1x6yY+4ZLmkmUc0oGPZgPT8GFTPpijsqPtqw+
 WMiIyHyZZ1+xWdayItALA+eEXXWD6sn/CyQBMDMp0vZ/Rv6tOBBpBvbGcj+KtSOGeQ
 6qLFebTMbDIXj+od08BC/qrHW3BVwxdNEfVtJwoOcOqH6aDBuCZcLFjQjGd4AUeLti
 2zHDGRQYBh/9qVk8GUM5T1CWHJsgVx7thcfyJdWBwz5p/ay+vzeWVlv2P92Ey9Qssf
 5X7vh2o0Ut0T6W1JRP0NEB5ezdWDzZzglyOpUPYeJ1SFToQ1jy/3qHsorpbuQ2r1nr
 gYf0u9sxl8RiQ==
Message-ID: <1b86e583-1f3a-4192-8864-d2a60a8787e1@kernel.org>
Date: Mon, 20 Oct 2025 16:09:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/3] drm/amd: Return -EBUSY for amdgpu_pmops_thaw() on
 success
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: mario.limonciello@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, dakr@kernel.org, gregkh@linuxfoundation.org,
 lenb@kernel.org, pavel@kernel.org, simona@ffwll.ch,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
References: <20251020165317.3992933-1-superm1@kernel.org>
 <20251020165317.3992933-4-superm1@kernel.org>
 <CAJZ5v0gsdmfXUJuLW8Ogt2jKDunx4g51LqCfSVMWQ6WHXBw_zg@mail.gmail.com>
 <85c039ef-e189-48c1-8bf7-50ac0c2484e2@kernel.org>
 <CAJZ5v0gT9BG5QPcwg6jJ1Jghny2YxC9_HY542LTBy-aVc_2T_w@mail.gmail.com>
 <aec8fc6c-3f9f-4ec1-a929-7a0be6026a3d@kernel.org>
 <CAJZ5v0gMf-qMGa6iBL2NdRXd-Mt5cpsoVQ90y+rSyK5xoYEf8A@mail.gmail.com>
 <aa04dea5-d35b-46c9-9501-0a2e79ecbd79@kernel.org>
 <CAJZ5v0j=sw9X3mV2ddOD_-qJwxveXQ1faD6HWtStLo9xOpwYKA@mail.gmail.com>
 <57f073e8-f600-4bdf-b3b9-a34df882cbdb@kernel.org>
 <CAJZ5v0jWou0vxNZhe-pU-wQyWxhikaDkF+ZO0rsUieXs_nYjjQ@mail.gmail.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <CAJZ5v0jWou0vxNZhe-pU-wQyWxhikaDkF+ZO0rsUieXs_nYjjQ@mail.gmail.com>
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



On 10/20/2025 2:55 PM, Rafael J. Wysocki wrote:
> On Mon, Oct 20, 2025 at 9:34 PM Mario Limonciello (AMD) (kernel.org)
> <superm1@kernel.org> wrote:
>>
>>
>>
>> On 10/20/2025 2:18 PM, Rafael J. Wysocki wrote:
>>> On Mon, Oct 20, 2025 at 9:14 PM Mario Limonciello (AMD) (kernel.org)
>>> <superm1@kernel.org> wrote:
>>>>
>>>>
>>>>
>>>> On 10/20/2025 1:50 PM, Rafael J. Wysocki wrote:
>>>>> On Mon, Oct 20, 2025 at 8:32 PM Mario Limonciello (AMD) (kernel.org)
>>>>> <superm1@kernel.org> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 10/20/2025 12:39 PM, Rafael J. Wysocki wrote:
>>>>>>> On Mon, Oct 20, 2025 at 7:28 PM Mario Limonciello (AMD) (kernel.org)
>>>>>>> <superm1@kernel.org> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> On 10/20/2025 12:21 PM, Rafael J. Wysocki wrote:
>>>>>>>>> On Mon, Oct 20, 2025 at 6:53 PM Mario Limonciello (AMD)
>>>>>>>>> <superm1@kernel.org> wrote:
>>>>>>>>>>
>>>>>>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>>>>>
>>>>>>>>>> The PM core should be notified that thaw was skipped for the device
>>>>>>>>>> so that if it's tried to be resumed (such as an aborted hibernate)
>>>>>>>>>> that it gets another chance to resume.
>>>>>>>>>>
>>>>>>>>>> Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>>>>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>>>>> ---
>>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
>>>>>>>>>>       1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>>>> index 61268aa82df4d..d40af069f24dd 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>>>> @@ -2681,7 +2681,7 @@ static int amdgpu_pmops_thaw(struct device *dev)
>>>>>>>>>>
>>>>>>>>>>              /* do not resume device if it's normal hibernation */
>>>>>>>>>>              if (!pm_hibernate_is_recovering() && !pm_hibernation_mode_is_suspend())
>>>>>>>>>> -               return 0;
>>>>>>>>>> +               return -EBUSY;
>>>>>>>>>
>>>>>>>>> So that's why you need the special handling of -EBUSY in the previous patch.
>>>>>>>>
>>>>>>>> Yup.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> I think that you need to save some state in this driver and then use
>>>>>>>>> it in subsequent callbacks instead of hacking the core to do what you
>>>>>>>>> want.
>>>>>>>>>
>>>>>>>>
>>>>>>>> The problem is the core decides "what" to call and more importantly
>>>>>>>> "when" to call it.
>>>>>>>>
>>>>>>>> IE if the core thinks that something is thawed it will never call
>>>>>>>> resume, and that's why you end up in a bad place with Muhammad's
>>>>>>>> cancellation series and why I proposed this one to discuss.
>>>>>>>>
>>>>>>>> We could obviously go back to dropping this case entirely:
>>>>>>>>
>>>>>>>> if (!pm_hibernate_is_recovering() && !pm_hibernation_mode_is_suspend())
>>>>>>>>
>>>>>>>> But then the display turns on at thaw(), you do an unnecessary resource
>>>>>>>> eviction, it takes a lot longer if you have a ton of VRAM etc.
>>>>>>>
>>>>>>> The cancellation series is at odds with this code path AFAICS because
>>>>>>> what if hibernation is canceled after the entire thaw transition?
>>>>>>
>>>>>> Muhammad - did you test that specific timing of cancelling the hibernate?
>>>>>>>
>>>>>>> Some cleanup would need to be done before thawing user space I suppose.
>>>>>>
>>>>>> I agree; I think that series would need changes for it.
>>>>>>
>>>>>> But if you put that series aside, I think this one still has some merit
>>>>>> on it's own.  If another driver aborted the hibernate, I think the same
>>>>>> thing could happen if it happened to run before amdgpu's device thaw().
>>>>>>
>>>>>> That series just exposed a very "easy" way to reproduce this issue.
>>>>>
>>>>> Device thaw errors don't abort anything AFAICS.
>>>>>
>>>>
>>>> You're right; it doesn't abort, it just is saved to the logs.
>>>> The state is also not maintained.
>>>>> What can happen though is that another device may abort the final
>>>>> "power off" transition, which is one of the reasons why I think that
>>>>> rolling it back is generally hard.
>>>>
>>>> That's exactly the reason for the first patch in this series.  The state
>>>> of whether it succeeded isn't recorded.  So if thaw non-fatally fails
>>>> and you've saved state to indicate this then any of the other calls that
>>>> run can try again.
>>>
>>> So long as they are called.
>>>
>>> But as I said before, I would save the state in the driver thaw
>>> callback and then clear it in the driver poweroff callback and look at
>>> it in the driver restore callback.  If it is there at that point,
>>> poweroff has not run and hibernation is rolling back, so you need to
>>> do a "thaw".
>>
>> Are you suggesting that the device driver should directly manipulate
>> dev->power.is_suspended?
> 
> No, it needs to have its own state for that.  power.is_suspended
> should not be manipulated by drivers (or anything other than the core
> for that matter).

That's what I originally thought which is why this series looks like it 
does.

> 
>> I'll do some testing but; I suppose that would work as well without
>> needing to make core changes if you don't see a need for other devices
>> to do this.
> 
> So long as they don't try to skip the "thaw" actions, I don't.
> 
> If there are more drivers wanting to do it, I guess it would be good
> to have a common approach although at this point I'm not sure how much
> in common there would be.

But so if the state is maintained in the driver dev->power.is_suspended 
will be FALSE at the end of thaw().  That means that restore() is never 
called for a cancellation/abort.

So I think the only place to do the cleanup would be in the complete() 
callback.  Do you think that's the best place for this based upon that 
internal driver state variable?

