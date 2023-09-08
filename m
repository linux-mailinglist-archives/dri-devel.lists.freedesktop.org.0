Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FB179834A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 09:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C8210E86D;
	Fri,  8 Sep 2023 07:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A15F10E87A;
 Fri,  8 Sep 2023 07:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694158630; x=1725694630;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=h1iD3La1Zy5IsUwoG0OkAqxhTsPZtm+hFe2wg2/i0cA=;
 b=TjMkMl6que2OdnSYNJ6HtHY5gXkfSdKXWHvzhrayjM2SfVmelS3YPkF7
 sdXuiDppV+s/ES2PVS0qdSMoails/7ER36+RhMVU5Mi3EZXH+/XxhWJqn
 l69Pj48qaDlIGjiFfH/CnqsA+e/dkU80EfVP2jZ8PSpbUKP3f1i4oeqdy
 1uzZCAheeuD9LDELy1vjWmbH29SEPm5K+HDiLccZPcprufMH0Qme+NXZK
 LRHmb9FlQW9vxbihIJR5OX+2OgoPzjwxHYr/XYXM++QnSFK+78zXEQQpZ
 6l5G2lRNLBsiLHABA0aM9KdWvVyncnKuHe6n1feK+4tmcWjYGu0Jzz1Pp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="374966813"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="374966813"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 00:37:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="777480396"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="777480396"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO [10.249.254.172])
 ([10.249.254.172])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 00:37:06 -0700
Message-ID: <84b2736f-c225-1421-f245-2de042345dea@linux.intel.com>
Date: Fri, 8 Sep 2023 09:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 0/2] drm/tests: Fix for UAF and a test for drm_exec
 lock alloc tracking warning
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230907135339.7971-1-thomas.hellstrom@linux.intel.com>
 <b3ab850d-9da2-0b19-2aa1-fa5a2c3dc079@amd.com>
 <2a9310b5-cf08-d4fe-c08e-c3fc9d25653c@linux.intel.com>
 <95610a20-4364-7ba8-88be-3e303018ea79@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <95610a20-4364-7ba8-88be-3e303018ea79@amd.com>
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
Cc: Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/7/23 16:49, Christian König wrote:
> Am 07.09.23 um 16:47 schrieb Thomas Hellström:
>> Hi,
>>
>> On 9/7/23 16:37, Christian König wrote:
>>> Am 07.09.23 um 15:53 schrieb Thomas Hellström:
>>>> While trying to replicate a weird drm_exec lock alloc tracking warning
>>>> using the drm_exec kunit test, the warning was shadowed by a UAF 
>>>> warning
>>>> from KASAN due to a bug in the drm kunit helpers.
>>>>
>>>> Patch 1 fixes that drm kunit UAF.
>>>> Patch 2 introduces a drm_exec kunit subtest that fails if the 
>>>> conditions
>>>>        for the weird warning are met.
>>>>
>>>> The series previously also had a patch with a drm_exec workaround 
>>>> for the
>>>> warning but that patch has already been commited to 
>>>> drm_misc_next_fixes.
>>>
>>> Thinking more about this what happens when somebody calls 
>>> drm_exec_unlock_obj() on the first locked object?
>>>
>> Essentially the same thing. I've been thinking of the best way to 
>> handle that, but not sure what's the best one.
>
> Well what does lockdep store in that object in the first place? Could 
> we fix that somehow?

Lockdep maintains an array of held locks (lock classes) for each task. 
Upon freeing, that list is traversed to see if the address matches the 
stored memory address. This also has the interesting side effect that 
IICR dma_resv_assert_held() checks if *any* dma_resv is held....

Ideally each object would have its own class instance, but I think some 
applications would then exhaust the array size.

I'll dig a bit deeper into this.


Meanwhile for the unlock problem, looking at how the unlocks are used in 
i915 it's typically locks that are grabbed during eviction and released 
again once validation of a single object succeeded. The risk of them 
ending up at the first lock is small, unless they are prelocked as the 
contended lock. But for these "temporary" objects, the prelocked lock is 
immediately dropped after locking and are only used to find something 
suitable to wait for to relax the ww transaction.

If we were to implement something similar in drm_exec, we'd need an 
interface to mark an object as "temporary" when locking, and make sure 
we drop those objects if they end up as "prelocked". Personally I think 
this solution works well and would be my preferred choice.

Yet another alternative would be to keep a reference even of the 
unlocked objects...

But these workarounds ofc only push the problem out of drm_exec. Users 
of raw dma-resv or ww mutexes would still wonder what's going on.

/Thomas



>
> Christian.
>
>>
>> /Thomas
>>
>>
>>> Christian.
>>>
>>>>
>>>> v2:
>>>> - Rewording of commit messages
>>>> - Add some commit message tags
>>>> v3:
>>>> - Remove an already committed patch
>>>> - Rework the test to not require dmesg inspection (Maxime Ripard)
>>>> - Condition the test on CONFIG_LOCK_ALLOC
>>>> - Update code comments and commit messages (Maxime Ripard)
>>>>
>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>
>>>> Thomas Hellström (2):
>>>>    drm/tests: helpers: Avoid a driver uaf
>>>>    drm/tests/drm_exec: Add a test for object freeing within
>>>>      drm_exec_fini()
>>>>
>>>>   drivers/gpu/drm/tests/drm_exec_test.c | 82 
>>>> +++++++++++++++++++++++++++
>>>>   include/drm/drm_kunit_helpers.h       |  4 +-
>>>>   2 files changed, 85 insertions(+), 1 deletion(-)
>>>>
>>>
>
