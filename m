Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B81B2D518
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 09:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0057810E243;
	Wed, 20 Aug 2025 07:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="rAX0BG3v";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="zm8Xthxv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332B210E243;
 Wed, 20 Aug 2025 07:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1755675773;
 bh=w9SlD7ICoHxzqoTlV8Z7Rg/
 8uwfey5HI6LYxS9+8BWE=; b=rAX0BG3v0QpJZ3qELpbEuE1Gnf64gsxn3p30lNCslrTapWnxa0
 96q75Ty6EAUb+vhLw4Mp5Zycd4zEolapYeyBfWPx+FHf0ZddnV27HcZ8oGslepQMi+5ZpU8Psud
 RQRl8letQVMEeo8/nuV2Lmh9gWWzPFDdQ42OqUC+iOcVwEZPttvpiG5rtW2gQFVFO+Id2Tn4mTS
 gAkfv0mNwsRDHr+2XCxjfJKMljocgMF3yowrbrdQpfS79UL20TlwK94ceXuxEZOnWYUn+ZFou2E
 +J1U+NA9X289Bq2EYkM1P17dj2PwwgUJGEuReHgXS9NBZMk3bJqeJgbpraMly5Ebrlw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1755675773; bh=w9SlD7ICoHxzqoTlV8Z7Rg/
 8uwfey5HI6LYxS9+8BWE=; b=zm8XthxvusftN8sHmI0QViGO57N+qOWk3A0FtE0PtJhy6ni+vY
 WW35Mb0I3jwxH/MeRss7mfEzj5j9AH+Q/ACQ==;
Message-ID: <fb30efd4-1950-4b76-89fc-51c089319950@damsy.net>
Date: Wed, 20 Aug 2025 09:42:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/6] amdgpu: Avoid powering on the dGPU on
 vkEnumeratePhysicalDevices()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Philipp Zabel <philipp.zabel@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
 <601a40fd-e508-4e9d-8dd3-14329f3a637b@amd.com>
 <41b37595c42e4f492704a31970936d52b96dae97.camel@pengutronix.de>
 <ce732501-131d-420d-ad75-61ae987f51d0@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <ce732501-131d-420d-ad75-61ae987f51d0@amd.com>
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

[resend because the previous email didn't make it to most recipients]

Hi,

Le 06/08/2025 à 15:17, Christian König a écrit :
> On 06.08.25 12:15, Philipp Zabel wrote:
>> On Mi, 2025-08-06 at 10:58 +0200, Christian König wrote:
>>> On 31.07.25 07:36, Philipp Zabel wrote:
>>>> This is an attempt at fixing amd#2295 [1]:
>>>>
>>>>    On an AMD Rembrandt laptop with 680M iGPU and 6700S dGPU, calling
>>>>    vkEnumeratePhysicalDevices() wakes up the sleeping dGPU, even if all
>>>>    the application wants is to find and use the iGPU. This causes a delay
>>>>    of about 2 seconds on this system, followed by a few seconds of
>>>>    increased power draw until runtime PM turns the dGPU back off again.
>>>>
>>>> [1] https://gitlab.freedesktop.org/drm/amd/-/issues/2295
>>>>
>>>> Patch 1 avoids power up on some ioctls that don't need it.
>>>> Patch 2 avoids power up on open() by postponing fpriv initialization to
>>>> the first ioctl() that wakes up the dGPU.
>>>> Patches 3 and 4 add AMDGPU_INFO to the list of non-waking ioctls,
>>>> returning cached values for some queries.
>>>> Patch 5 works around an explicit register access from libdrm.
>>>> Patch 6 shorts out the syncobj ioctls while fpriv is still
>>>> uninitialized. This avoids waking up the dGPU during Vulkan syncobj
>>>> feature detection.
>>>
>>> This idea came up multiple times now but was never completed.
>>>
>>> IIRC Pierre-Eric last worked on it, it would probably be a good idea to dig up his patches from the mailing list.
>>
>> Thank you, I wasn't aware of those patches [1]. Pierre-Eric did mention
>> them in https://gitlab.freedesktop.org/mesa/mesa/-/issues/13001, but I
>> didn't pick up on that back then.
>>
>> [1] https://lore.kernel.org/all/20240618153003.146168-1-pierre-eric.pelloux-prayer@amd.com/
>>
>> Is that the latest version?
> 
> I honestly don't know. @Pierre-Eric?


https://lore.kernel.org/all/ZnvJHwnNAvDrRMVG@phenom.ffwll.local/ killed the approach taken by this 
patchset.

After that I've reworked the series, and sent 
https://lists.freedesktop.org/archives/amd-gfx/2024-September/114417.html to do fine grain runtime 
pm in drm/amd/pm as a first step.

I also have a local branch that I never sent that implements Sima's suggestion: pushing rpm handling 
down into the ioctl implementation.

I'll try to rebase it and push it out on gitlab soon.

Pierre-Eric


> 
>> It looks to me like the review stalled out
>> on a disagreement whether the GB_ADDR_CONFIG query should be a separate
>> ioctl or whether it should be added to drm_amdgpu_info_device. The
>> discussion was later continued at
>> https://gitlab.freedesktop.org/mesa/libdrm/-/merge_requests/368,
>> seemingly coming to the conclusion that keeping the register read (but
>> cached) is the way to go? I didn't find a newer series with that
>> implemented.
> 
> Could be that Pierre-Eric dropped the work after that.
> 
> But IIRC we already use a cached value for GB_ADDR_CONFIG because of GFXOFF.
> 
> Regards,
> Christian.
> 
>>
>>>>
>>>> regards
>>>> Philipp
>>>>
>>>> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>>>> ---
>>>> Alex Deucher (1):
>>>>        drm/amdgpu: don't wake up the GPU for some IOCTLs
>>>>
>>>> Philipp Zabel (5):
>>>>        drm/amdgpu: don't wake up the GPU when opening the device
>>>>        drm/amdgpu: don't query xclk in AMDGPU_INFO_DEV_INFO
>>>>        drm/amdgpu: don't wake up the GPU for some AMDGPU_INFO queries
>>>>        drm/amdgpu: don't wake up the GPU for mmGB_ADDR_CONFIG register read
>>>
>>> That is both unnecessary an insufficient. Unnecessary because we already have a mechanism to cache register values and insufficient because IIRC you need to add a bunch of more registers to the cached list.
>>
>> This series was (just barely) sufficient for my purpose, which was only
>> to make vkEnumeratePhysicalDevices() not wake the dGPU on my Laptop.
>> I didn't realize there already was a caching mechanism in the lower
>> layers.
>>
>>> See Pierre-Erics latest patch set, I think we already solved that but I'm not 100% sure.
>>
>> If I found the correct version, it seems Sima's suggestion of pushing
>> runtime pm handling down from amdgpu_drm_ioctl into the amdgpu ioctl
>> callbacks [2] would be the best first next step?
>>
>> [2] https://lore.kernel.org/amd-gfx/ZnvJHwnNAvDrRMVG@phenom.ffwll.local/
>>
>> regards
>> Philipp
