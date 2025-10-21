Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E511DBF6FFC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 16:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6366F10E5FC;
	Tue, 21 Oct 2025 14:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZPmSSNnL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAA410E5F7;
 Tue, 21 Oct 2025 14:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761056007;
 bh=OUNt515k947NUUgOEPQcDgyTR6oy4aUK4SYeKt//dvU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ZPmSSNnLZ1Aff9mNSDZRTJrMZ4Wkfz/Pjs3t6yj3UJjFlQG4M1GGMj72VOYKB5Hn1
 Ia6b48F0agaIOJG5Jf520FZhjOD270rJdk/NJcFbFlEstXwDd2tGD9EGyk5ME1YNrt
 FDfVVAQ0GdsfoKOFSCgJy149Nni9NznkNNwXbdT2w5KswJ5PiBlxe/0z4LEHph5f0/
 GjKvlKh/Krkbi0WglBdZJL7kq/lziOtSQU++Suc59w/WanJKnFL1oy7f1BHLgxcNnx
 AVDNupPTUnQYxrl3qIxO0pk3NSqZX288bL+yE0fx2ywP+ZQts/mcwVtR3tQ+qs/KZB
 SOiGIeLl/ab6w==
Received: from [192.168.100.50] (unknown [144.48.130.189])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: usama.anjum)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E129E17E081A;
 Tue, 21 Oct 2025 16:13:07 +0200 (CEST)
Message-ID: <977cbbea-60b9-4d08-83e6-9ef1653f3857@collabora.com>
Date: Tue, 21 Oct 2025 19:12:29 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@collabora.com, mario.limonciello@amd.com, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, dakr@kernel.org,
 gregkh@linuxfoundation.org, lenb@kernel.org, pavel@kernel.org,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [RFC 3/3] drm/amd: Return -EBUSY for amdgpu_pmops_thaw() on
 success
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20251020165317.3992933-1-superm1@kernel.org>
 <20251020165317.3992933-4-superm1@kernel.org>
 <CAJZ5v0gsdmfXUJuLW8Ogt2jKDunx4g51LqCfSVMWQ6WHXBw_zg@mail.gmail.com>
 <85c039ef-e189-48c1-8bf7-50ac0c2484e2@kernel.org>
 <CAJZ5v0gT9BG5QPcwg6jJ1Jghny2YxC9_HY542LTBy-aVc_2T_w@mail.gmail.com>
 <aec8fc6c-3f9f-4ec1-a929-7a0be6026a3d@kernel.org>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <aec8fc6c-3f9f-4ec1-a929-7a0be6026a3d@kernel.org>
Content-Type: text/plain; charset=UTF-8
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

On 10/20/25 11:32 PM, Mario Limonciello (AMD) (kernel.org) wrote:
> 
> 
> On 10/20/2025 12:39 PM, Rafael J. Wysocki wrote:
>> On Mon, Oct 20, 2025 at 7:28 PM Mario Limonciello (AMD) (kernel.org)
>> <superm1@kernel.org> wrote:
>>>
>>>
>>>
>>> On 10/20/2025 12:21 PM, Rafael J. Wysocki wrote:
>>>> On Mon, Oct 20, 2025 at 6:53 PM Mario Limonciello (AMD)
>>>> <superm1@kernel.org> wrote:
>>>>>
>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>>
>>>>> The PM core should be notified that thaw was skipped for the device
>>>>> so that if it's tried to be resumed (such as an aborted hibernate)
>>>>> that it gets another chance to resume.
>>>>>
>>>>> Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>> index 61268aa82df4d..d40af069f24dd 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>> @@ -2681,7 +2681,7 @@ static int amdgpu_pmops_thaw(struct device *dev)
>>>>>
>>>>>           /* do not resume device if it's normal hibernation */
>>>>>           if (!pm_hibernate_is_recovering() && !pm_hibernation_mode_is_suspend())
>>>>> -               return 0;
>>>>> +               return -EBUSY;
>>>>
>>>> So that's why you need the special handling of -EBUSY in the previous patch.
>>>
>>> Yup.
>>>
>>>>
>>>> I think that you need to save some state in this driver and then use
>>>> it in subsequent callbacks instead of hacking the core to do what you
>>>> want.
>>>>
>>>
>>> The problem is the core decides "what" to call and more importantly
>>> "when" to call it.
>>>
>>> IE if the core thinks that something is thawed it will never call
>>> resume, and that's why you end up in a bad place with Muhammad's
>>> cancellation series and why I proposed this one to discuss.
>>>
>>> We could obviously go back to dropping this case entirely:
>>>
>>> if (!pm_hibernate_is_recovering() && !pm_hibernation_mode_is_suspend())
>>>
>>> But then the display turns on at thaw(), you do an unnecessary resource
>>> eviction, it takes a lot longer if you have a ton of VRAM etc.
>>
>> The cancellation series is at odds with this code path AFAICS because
>> what if hibernation is canceled after the entire thaw transition?
> 
> Muhammad - did you test that specific timing of cancelling the hibernate?
Yes, I've tested the cancellations before and after the thaw both.

>>
>> Some cleanup would need to be done before thawing user space I suppose.
> 
> I agree; I think that series would need changes for it.
> 
> But if you put that series aside, I think this one still has some merit on it's own.  If another driver aborted the hibernate, I think the same thing could happen if it happened to run before amdgpu's device thaw().
> 
> That series just exposed a very "easy" way to reproduce this issue.


-- 
---
Thanks,
Usama
