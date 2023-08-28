Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B9F78B97A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 22:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3E110E34F;
	Mon, 28 Aug 2023 20:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370BB10E348;
 Mon, 28 Aug 2023 20:22:34 +0000 (UTC)
Received: from [192.168.100.156] (unknown [187.106.34.125])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C157866003B0;
 Mon, 28 Aug 2023 21:22:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693254152;
 bh=UsSSwRh76deZ9yEMUCPBsw5h1Rkm6TKJmIKyc4Pjt+4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q+S8OZUoVSuLe0zV6vaLbJAxsnQ2H6Uk6ZSOS/ILslAUGqRbsiDMinfTpyQHYn6x0
 TzreBPMqbY6B5uuYgXSmaWPlpvf2Nec0pOl94TF5ULy3xXjmbEgkFD+aBzQCGvbwCH
 QBEgb7uqX7J108ht/AoOLK3IqZGY4RAKl6v3ciEMo+5WvxjAMAdWKYEsILx7dAdLZw
 XwuYXgFNInOghCbPMxMHF/opO2SszqGZy5Lhb3n+z7QuG0dB2Qv1vJ/D15dnM3+gLW
 2dqan/2uzcgfhyCJ1NDWCRpJsVsUhNkt0+vKsXJHL16sF+a4h6xFvGoljUic4+Go1T
 0Eiu5vXT7FeWw==
Message-ID: <49e88fe4-1d79-5664-d278-425826bf8647@collabora.com>
Date: Mon, 28 Aug 2023 17:22:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 0/7] GPU workload hints for better performance
Content-Language: en-US
To: "Yadav, Arvind" <arvyadav@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>
References: <7d09-64ecc080-1-3ebc5780@85497443>
 <b9452015-0284-3ede-973c-ced26ef18d2a@amd.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <b9452015-0284-3ede-973c-ced26ef18d2a@amd.com>
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
Cc: shashank.sharma@amd.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28/08/2023 17:14, Yadav, Arvind wrote:
> 
> On 8/28/2023 9:13 PM, Helen Mae Koike Fornazier wrote:
>> On Monday, August 28, 2023 09:26 -03, Arvind Yadav 
>> <Arvind.Yadav@amd.com> wrote:
>>
>>> AMDGPU SOCs supports dynamic workload based power profiles, which can
>>> provide fine-tuned performance for a particular type of workload.
>>> This patch series adds an interface to set/reset these power profiles
>>> based on the submitted job. The driver can dynamically switch
>>> the power profiles based on submitted job. This can optimize the power
>>> performance when the particular workload is on.
>> Hi Arvind,
>>
>> Would you mind to test your patchset with drm-ci ? There is a amdgpu
>> test there and I would love to get your feedback of the ci.
>>
>> You basically just need to apply the ci patch which is available on
>> https://cgit.freedesktop.org/drm/drm/log/?h=topic/drm-ci
>>
>> There are instruction on the docs, but in short: to configure it, you 
>> push
>> your branch to gitlab.freedesktop.org, go to the settings and change the
>> CI/CD configuration file from .gitlab-ci.yml to 
>> drivers/gpu/drm/ci/gitlab-ci.yml,
>> and you can trigger a pipeline on your branch to get tests running.
>>
>> (by the time of this writing, gitlab.fdo is under maintenance but should
>> be up soonish).
> 
> Hi Helen,
> 
> I tried the steps as mentioned by you but looks like something is 
> missing and build itself is failing.
> 
> https://gitlab.freedesktop.org/ArvindYadav/drm-next/-/commits/smu_workload

Thanks for your feedback!

You need to apply this patch 
https://gitlab.freedesktop.org/ArvindYadav/drm-next/-/commit/cc6dcff192d07f9fe82645fbc4213c97e872156b

This patch adds the file drivers/gpu/drm/ci/gitlab-ci.yml for you.

And you can drop the patch where gitlab added the ci template.

I replied here too 
https://gitlab.freedesktop.org/ArvindYadav/drm-next/-/commit/cc6dcff192d07f9fe82645fbc4213c97e872156b

Could you try again with that patch?

Thanks a lot!
Helen


> 
> Regards,
> ~Arvind
> 
>> Thank you!
>> Helen
>>
>>> v2:
>>> - Splitting workload_profile_set and workload_profile_put
>>>    into two separate patches.
>>> - Addressed review comment.
>>> - Added new suspend function.
>>> - Added patch to switches the GPU workload mode for KFD.
>>>
>>> v3:
>>> - Addressed all review comment.
>>> - Changed the function name from *_set() to *_get().
>>> - Now clearing all the profile in work handler.
>>> - Added *_clear_all function to clear all the power profile.
>>>
>>>
>>> Arvind Yadav (7):
>>>    drm/amdgpu: Added init/fini functions for workload
>>>    drm/amdgpu: Add new function to set GPU power profile
>>>    drm/amdgpu: Add new function to put GPU power profile
>>>    drm/amdgpu: Add suspend function to clear the GPU power profile.
>>>    drm/amdgpu: Set/Reset GPU workload profile
>>>    drm/amdgpu: switch workload context to/from compute
>>>    Revert "drm/amd/amdgpu: switch on/off vcn power profile mode"
>>>
>>>   drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   8 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   6 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   5 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |  14 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 226 ++++++++++++++++++
>>>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  61 +++++
>>>   8 files changed, 309 insertions(+), 16 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>>   create mode 100644 drivers/gpu/drm/amd/include/amdgpu_workload.h
>>>
>>> -- 
>>> 2.34.1
>>>
