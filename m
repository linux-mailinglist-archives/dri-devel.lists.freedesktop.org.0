Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F87798653
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 13:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7249610E88E;
	Fri,  8 Sep 2023 11:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD79410E04B;
 Fri,  8 Sep 2023 11:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694171595; x=1725707595;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=E+1LdFeozyiXYAhXe3o47HXaBVILZFjd6jmd1R3GnyE=;
 b=QL9tB4B4b7Oy6HV0L1pKe1vMkQepyBg/0pgmvLY//QK3RXQ0b/PmKspN
 Bp8G1ffeImmCaXgTlcQmzCuU2GBmbUts4yl+jNUt1qHreJQpqNMRoehBE
 ykv0Tm2PVZKr8wYTc+5PkkSENp9MESRQu1NiAhNyO2Kpl4dcGrwKAiI3u
 QDw5xpW00ZqxnPPYxPLmaImH6TX1AZ9lZkBhuRJUraiOakIseDdlDecVM
 IfpNhd1D4eD8i3QVa5bWOH65kZXqaT4M3rB2jSkmDOLu6TA9h7ZRRD7CU
 gftDTNdeMX6ktRVq1C/4FGlgLEloZa2rjYrIiWEHg47YRNoXA9bz5EDE4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463997583"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="463997583"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 04:13:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="777531976"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="777531976"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO [10.249.254.172])
 ([10.249.254.172])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 04:13:13 -0700
Message-ID: <de7a7309-9c5b-09a7-7557-2d6050838215@linux.intel.com>
Date: Fri, 8 Sep 2023 13:13:10 +0200
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
 <84b2736f-c225-1421-f245-2de042345dea@linux.intel.com>
 <ab9f3c50-8098-bbbf-50e2-a1ba63595a47@amd.com>
 <b831c9f3-97e6-6cbd-0e3c-b1dfc8c71ec1@linux.intel.com>
 <59839d43-c19c-e27a-51e6-fec44ac09936@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <59839d43-c19c-e27a-51e6-fec44ac09936@amd.com>
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


On 9/8/23 11:14, Christian König wrote:
> Am 08.09.23 um 11:04 schrieb Thomas Hellström:
>>
>> On 9/8/23 10:52, Christian König wrote:
>>> Am 08.09.23 um 09:37 schrieb Thomas Hellström:
>>>> Hi,
>>>>
>>>> On 9/7/23 16:49, Christian König wrote:
>>>>> Am 07.09.23 um 16:47 schrieb Thomas Hellström:
>>>>>> Hi,
>>>>>>
>>>>>> On 9/7/23 16:37, Christian König wrote:
>>>>>>> Am 07.09.23 um 15:53 schrieb Thomas Hellström:
>>>>>>>> While trying to replicate a weird drm_exec lock alloc tracking 
>>>>>>>> warning
>>>>>>>> using the drm_exec kunit test, the warning was shadowed by a 
>>>>>>>> UAF warning
>>>>>>>> from KASAN due to a bug in the drm kunit helpers.
>>>>>>>>
>>>>>>>> Patch 1 fixes that drm kunit UAF.
>>>>>>>> Patch 2 introduces a drm_exec kunit subtest that fails if the 
>>>>>>>> conditions
>>>>>>>>        for the weird warning are met.
>>>>>>>>
>>>>>>>> The series previously also had a patch with a drm_exec 
>>>>>>>> workaround for the
>>>>>>>> warning but that patch has already been commited to 
>>>>>>>> drm_misc_next_fixes.
>>>>>>>
>>>>>>> Thinking more about this what happens when somebody calls 
>>>>>>> drm_exec_unlock_obj() on the first locked object?
>>>>>>>
>>>>>> Essentially the same thing. I've been thinking of the best way to 
>>>>>> handle that, but not sure what's the best one.
>>>>>
>>>>> Well what does lockdep store in that object in the first place? 
>>>>> Could we fix that somehow?
>>>>
>>>> Lockdep maintains an array of held locks (lock classes) for each 
>>>> task. Upon freeing, that list is traversed to see if the address 
>>>> matches the stored memory address. This also has the interesting 
>>>> side effect that IICR dma_resv_assert_held() checks if *any* 
>>>> dma_resv is held....
>>>>
>>>> Ideally each object would have its own class instance, but I think 
>>>> some applications would then exhaust the array size.
>>>
>>> IIRC Daniel once explained to me that he designed lockdep for 
>>> ww_mutexes like this for some reason, but I don't remember the 
>>> details any more.
>>>
>>> Maybe lockdep wouldn't otherwise be able to deal with the fact that 
>>> you could lock them in any order or something like that.
>>
>> Oh, that's well handled with the mutex_lock_nest_lock()  type of 
>> annotation that's used for WW mutexes. IIRC the problem is that 
>> lockdep can't really deal with either that vast number of locks 
>> overall or the vast number of held locks per process.
>
> Could we somehow teach lockdep that multiple locks of a lock class can 
> be held at the same time? E.g. like a reference count in the lockclass 
> or something like that?
>
>>
>>>
>>>>
>>>> I'll dig a bit deeper into this.
>>>>
>>>>
>>>> Meanwhile for the unlock problem, looking at how the unlocks are 
>>>> used in i915 it's typically locks that are grabbed during eviction 
>>>> and released again once validation of a single object succeeded. 
>>>> The risk of them ending up at the first lock is small, unless they 
>>>> are prelocked as the contended lock. But for these "temporary" 
>>>> objects, the prelocked lock is immediately dropped after locking 
>>>> and are only used to find something suitable to wait for to relax 
>>>> the ww transaction.
>>>
>>> Yeah, I don't see this as an use case in reality. It's more of a 
>>> "what if?" thing.
>>
>> Oh, it's a real use-case. As soon as you start having sleeping locks 
>> for eviction you hit it, in particular with WW mutex slowpath 
>> debugging. And we will need to work on improving TTM support for that 
>> for xe.
>
> Oh, good point! When we have contention on a lock, rollback and take 
> that lock then first it can be that this lock then needs to be 
> unlocked again. Unlikely, but certainly possible.
>
> Sounds like we really need to fix this in lockdep then.

So it seems lockdep *does* reference counting in this case, but stores 
the address of the first locked lockdep map, and then subsequently uses 
it for various things. In short freeing the first lock isn't something 
lockdep thinks you should do. Ever.

The good thing about this is that this refcounting appears only done on 
nest locks, that is, when we have a ww context AFAICT. That means we can 
probably store a fake ww_mutex lockdep map with the ww acquire context 
and lock it when we initialize the context and unlock it on 
ww_acquire_fini().

Should take care of the problem I think, although the problem of 
lockdep_assert() and lock freeing granularity will remain. It looks like 
there is a comparison function one can optionally set to make different 
objects look separate to lockdep. Probably something to think of for 
enhanced debugging with a limited set of locked objects.

Need to also check what happens if we do a sequence of successful trylocks.

/Thomas

>
> Christian.
>
>>
>>>
>>>>
>>>> If we were to implement something similar in drm_exec, we'd need an 
>>>> interface to mark an object as "temporary" when locking, and make 
>>>> sure we drop those objects if they end up as "prelocked". 
>>>> Personally I think this solution works well and would be my 
>>>> preferred choice.
>>>>
>>>> Yet another alternative would be to keep a reference even of the 
>>>> unlocked objects...
>>>>
>>>> But these workarounds ofc only push the problem out of drm_exec. 
>>>> Users of raw dma-resv or ww mutexes would still wonder what's going 
>>>> on.
>>>
>>> Agree, completely. This is really a bug in lockdep or rather how we 
>>> designed to implement ww_mutexes in lockdep and should therefore be 
>>> fixed there I think.
>>
>>
>>>
>>> Christian.
>>>
>>>>
>>>> /Thomas
>>>>
>>>>
>>>>
>>>>>
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> /Thomas
>>>>>>
>>>>>>
>>>>>>> Christian.
>>>>>>>
>>>>>>>>
>>>>>>>> v2:
>>>>>>>> - Rewording of commit messages
>>>>>>>> - Add some commit message tags
>>>>>>>> v3:
>>>>>>>> - Remove an already committed patch
>>>>>>>> - Rework the test to not require dmesg inspection (Maxime Ripard)
>>>>>>>> - Condition the test on CONFIG_LOCK_ALLOC
>>>>>>>> - Update code comments and commit messages (Maxime Ripard)
>>>>>>>>
>>>>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>>
>>>>>>>> Thomas Hellström (2):
>>>>>>>>    drm/tests: helpers: Avoid a driver uaf
>>>>>>>>    drm/tests/drm_exec: Add a test for object freeing within
>>>>>>>>      drm_exec_fini()
>>>>>>>>
>>>>>>>>   drivers/gpu/drm/tests/drm_exec_test.c | 82 
>>>>>>>> +++++++++++++++++++++++++++
>>>>>>>>   include/drm/drm_kunit_helpers.h       |  4 +-
>>>>>>>>   2 files changed, 85 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>
>>>>>
>>>
>
