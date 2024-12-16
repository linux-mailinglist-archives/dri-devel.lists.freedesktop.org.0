Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C20E9F3156
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 14:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9BE10E2E5;
	Mon, 16 Dec 2024 13:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cn57FJ3s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC9210E2E5;
 Mon, 16 Dec 2024 13:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PA5qK1Y5qawnNblg9rcx1vkSoH/ji+aiw7dwYyTmfVE=; b=cn57FJ3ssHtcSwjQ/Nd6k6282V
 gKAyeSWP2C1C5DH2v8TjWnJElbS4+9w1nIsNFWGAEDGDTBXqCuF571okxSLxWdyVo5tAnxLLbJTvc
 KtPFu8MZxn0flrPOkjRAG2cJz7WKDlNrvTVTW3wP31fh+iIqaQBy7N4EKW0hZHgeHaK93plDjdSBu
 lSI0cvinyZKdhiH/Du5XXEhNqvPTlfBsTvIwZjgr0JUrrYRkOfVh0a/ikDT25IpLQqV/FJzZX2Oip
 O1MWojXwS9YD6nHRnmC9Mm1haoyQT+gFjbUuKJ+Vfsxcl7FXra/9YsKg3kUxzzvgzcOrjcEo6PNwV
 PAthqoNQ==;
Received: from [179.193.1.214] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tNAwE-003n5j-I0; Mon, 16 Dec 2024 14:15:06 +0100
Message-ID: <8d6395fc-8143-4099-a9d6-b13d450d7fd7@igalia.com>
Date: Mon, 16 Dec 2024 10:15:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amdgpu: Use device wedged event
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212190909.28559-1-andrealmeid@igalia.com>
 <20241212190909.28559-2-andrealmeid@igalia.com>
 <d9f2583d-da79-4532-90fc-85028e977ceb@amd.com>
 <c7c498f0-2ee3-42f5-9b45-c87e52ffc3e4@igalia.com>
 <Z1xGe1X_XzB00J1Q@black.fi.intel.com>
 <ed83b0a1-62d1-48e5-ac7b-478be3043733@igalia.com>
 <28d7dcd8-ed3f-4e52-b7fa-c348a827085d@amd.com>
 <7c64746a-c1f6-46c6-a97f-cfd87e9ec3b7@amd.com>
 <5f7dd8ac-e8cc-4a40-b636-9917d82e27f5@igalia.com>
 <84b6dc5b-8c97-4c8d-8995-78cf88b883fc@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <84b6dc5b-8c97-4c8d-8995-78cf88b883fc@amd.com>
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



Em 16/12/2024 10:10, Christian König escreveu:
> Am 16.12.24 um 14:04 schrieb André Almeida:
>> Em 16/12/2024 07:38, Lazar, Lijo escreveu:
>>>
>>>
>>> On 12/16/2024 3:48 PM, Christian König wrote:
>>>> Am 13.12.24 um 16:56 schrieb André Almeida:
>>>>> Em 13/12/2024 11:36, Raag Jadav escreveu:
>>>>>> On Fri, Dec 13, 2024 at 11:15:31AM -0300, André Almeida wrote:
>>>>>>> Hi Christian,
>>>>>>>
>>>>>>> Em 13/12/2024 04:34, Christian König escreveu:
>>>>>>>> Am 12.12.24 um 20:09 schrieb André Almeida:
>>>>>>>>> Use DRM's device wedged event to notify userspace that a reset had
>>>>>>>>> happened. For now, only use `none` method meant for telemetry
>>>>>>>>> capture.
>>>>>>>>>
>>>>>>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>>>>>>> ---
>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
>>>>>>>>>     1 file changed, 3 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>>> b/drivers/gpu/ drm/amd/amdgpu/amdgpu_device.c
>>>>>>>>> index 96316111300a..19e1a5493778 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>>> @@ -6057,6 +6057,9 @@ int amdgpu_device_gpu_recover(struct
>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>             dev_info(adev->dev, "GPU reset end with ret = 
>>>>>>>>> %d\n", r);
>>>>>>>>> atomic_set(&adev->reset_domain->reset_res, r);
>>>>>>>>> +
>>>>>>>>> +    drm_dev_wedged_event(adev_to_drm(adev),
>>>>>>>>> DRM_WEDGE_RECOVERY_NONE);
>>>>>>>>
>>>>>>>> That looks really good in general. I would just make the
>>>>>>>> DRM_WEDGE_RECOVERY_NONE depend on the value of "r".
>>>>>>>>
>>>>>>>
>>>>>>> Why depend or `r`? A reset was triggered anyway, regardless of the
>>>>>>> success
>>>>>>> of it, shouldn't we tell userspace?
>>>>>>
>>>>>> A failed reset would perhaps result in wedging, atleast that's how 
>>>>>> i915
>>>>>> is handling it.
>>>>>>
>>>>>
>>>>> Right, and I think this raises the question of what wedge recovery
>>>>> method should I add for amdgpu... Christian?
>>>>>
>>>>
>>>> In theory a rebind should be enough to get the device going again, our
>>>> BOCO does a bus reset on driver load anyway.
>>>>
>>>
>>> The behavior varies between SOCs. In certain ones, if driver reset
>>> fails, that means it's really in a bad state and it would need system
>>> reboot.
>>>
>>
>> Is this documented somewhere? Then I could even add a 
>> DRM_WEDGE_RECOVERY_REBOOT so we can cover every scenario.
> 
> Not publicly as far as I know. But indeed a driver reset has basically 
> the same chance of succeeding than a driver reload.
> 
> I think the use case we have here is more that the administrator 
> intentionally disabled the reset to allow HW investigation.
> 
> So far we did that with a rather broken we don't do anything at all 
> approach.

OK.

> 
>>> I had asked earlier about the utility of this one here. If this is just
>>> to inform userspace that driver has done a reset and recovered, it would
>>> need some additional context also. We have a mechanism in KFD which
>>> sends the context in which a reset has to be done. Currently, that's
>>> restricted to compute applications, but if this is in a similar line, we
>>> would like to pass some additional info like job timeout, RAS error etc.
>>>
>>
>> DRM_WEDGE_RECOVERY_NONE is to inform userspace that driver has done a 
>> reset and recovered, but additional data about like which job timeout, 
>> RAS error and such belong to devcoredump I guess, where all data is 
>> gathered and collected later.
> 
> I think somebody else mentioned it as well that the source of the issue, 
> e.g. the PID of the submitting process would be helpful as well for 
> supervising daemons which need to restart processes when they caused 
> some issue.
> 

It was me :) we have a use case that we would need the PID for the 
daemon indeed, but the daemon doesn't need to know what's the RAS error 
or the job name that timeouted, there's no immediate action to be taken 
with this information, contrary to the PID that we need to know.

> We just postponed adding that till later.
> 
> Regards,
> Christian.
> 
>>
>>> Thanks,
>>> Lijo
>>>
>>>> Regards,
>>>> Christian.
>>>
>>
> 

