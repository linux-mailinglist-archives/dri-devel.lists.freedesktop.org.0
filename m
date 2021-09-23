Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B5F416246
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 17:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2746E101;
	Thu, 23 Sep 2021 15:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDFA6E0FD;
 Thu, 23 Sep 2021 15:43:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="309431122"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="309431122"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 08:43:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="474886314"
Received: from djustese-mobl.ger.corp.intel.com (HELO [10.249.254.57])
 ([10.249.254.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 08:43:36 -0700
Subject: Re: [Intel-gfx] [PATCH v6 3/9] drm/i915/gt: Increase suspend timeout
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
References: <20210922062527.865433-1-thomas.hellstrom@linux.intel.com>
 <20210922062527.865433-4-thomas.hellstrom@linux.intel.com>
 <f276fe3d-5ed8-7ac9-440d-3703f6f0e5e5@linux.intel.com>
 <0f1050c9-b9fe-b587-2aac-cceae4032638@linux.intel.com>
 <061617be-9bf4-7853-a34d-7501f6b3179f@linux.intel.com>
 <199e2c25-8133-360e-4b85-18485522c2be@linux.intel.com>
 <a3b8aa87-1276-7dd7-611b-b2aaf758860a@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <0f9a84e6-06fa-1d11-a020-b73c9f81e51c@linux.intel.com>
Date: Thu, 23 Sep 2021 17:43:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a3b8aa87-1276-7dd7-611b-b2aaf758860a@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 9/23/21 4:33 PM, Tvrtko Ursulin wrote:
>
> On 23/09/2021 14:19, Thomas Hellström wrote:
>>
>> On 9/23/21 2:59 PM, Tvrtko Ursulin wrote:
>>>
>>> On 23/09/2021 12:47, Thomas Hellström wrote:
>>>> Hi, Tvrtko,
>>>>
>>>> On 9/23/21 12:13 PM, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 22/09/2021 07:25, Thomas Hellström wrote:
>>>>>> With GuC submission on DG1, the execution of the requests times out
>>>>>> for the gem_exec_suspend igt test case after executing around 
>>>>>> 800-900
>>>>>> of 1000 submitted requests.
>>>>>>
>>>>>> Given the time we allow elsewhere for fences to signal (in the 
>>>>>> order of
>>>>>> seconds), increase the timeout before we mark the gt wedged and 
>>>>>> proceed.
>>>>>
>>>>> I suspect it is not about requests not retiring in time but about 
>>>>> the intel_guc_wait_for_idle part of intel_gt_wait_for_idle. 
>>>>> Although I don't know which G2H message is the code waiting for at 
>>>>> suspend time so perhaps something to run past the GuC experts.
>>>>
>>>> So what's happening here is that the tests submits 1000 requests, 
>>>> each writing a value to an object, and then that object content is 
>>>> checked after resume. With GuC it turns out that only 800-900 or so 
>>>> values are actually written before we time out, and the test 
>>>> (basic-S3) fails, but not on every run.
>>>
>>> Yes and that did not make sense to me. It is a single context even 
>>> so I did not come up with an explanation why would GuC be slower.
>>>
>>> Unless it somehow manages to not even update the ring tail in time 
>>> and requests are still only stuck in the software queue? Perhaps you 
>>> can see that from context tail and head when it happens.
>>>
>>>> This is a bit interesting in itself, because I never saw the 
>>>> hang-S3 test fail, which from what I can tell basically is an 
>>>> identical test but with a spinner submitted after the 1000th 
>>>> request. Could be that the suspend backup code ends up waiting for 
>>>> something before we end up in intel_gt_wait_for_idle, giving more 
>>>> requests time to execute.
>>>
>>> No idea, I don't know the suspend paths that well. For instance 
>>> before looking at the code I thought we would preempt what's 
>>> executing and not wait for everything that has been submitted to 
>>> finish. :)
>>>
>>>>> Anyway, if that turns out to be correct then perhaps it would be 
>>>>> better to split the two timeouts (like if required GuC timeout is 
>>>>> perhaps fundamentally independent) so it's clear who needs how 
>>>>> much time. Adding Matt and John to comment.
>>>>
>>>> You mean we have separate timeouts depending on whether we're using 
>>>> GuC or execlists submission?
>>>
>>> No, I don't know yet. First I think we need to figure out what 
>>> exactly is happening.
>>
>> Well then TBH I will need to file a separate Jira about that. There 
>> might be various things going on here like swiching between the 
>> migrate context for eviction of unrelated LMEM buffers and the 
>> context used by gem_exec_suspend. The gem_exec_suspend failures are 
>> blocking DG1 BAT so it's pretty urgent to get this series merged. If 
>> you insist I can leave this patch out for now, but rather I'd commit 
>> it as is and File a Jira instead.
>
> I see now how you have i915_gem_suspend() in between two 
> lmem_suspend() calls in this series. So first call has the potential 
> of creating a lot of requests and that you think interferes? Sounds 
> plausible but implies GuC timeslicing is less efficient if I follow?

Yes, I guess so. Not sure exactly what is not performing so well with 
the GuC but some tests really take a big performance hit, like 
gem_lmem_swapping and gem_exec_whisper, but those may trigger entirely 
different situations than what we have here.

>
> IMO it is okay to leave for follow up work but strictly speaking, 
> unless I am missing something, the approach of bumping the timeout 
> does not sound valid if the copying is done async.

Not async ATM. In any case It will probably make sense to sync before we 
start the GT timeout, so that remaining work can be done undisturbed by 
the copying. That way copying will always succeed, but depending on how 
much and what type of work user-space has queued up, it might be terminated.

>
> Because the timeout is then mandated not only as function of GPU 
> activity (lets say user controlled), but also the amount of 
> unpinned/idle buffers which happen to be laying around (which is more 
> i915 controlled, or mixed at least).
>
> So question is, with enough data to copy, any timeout could be too low 
> and then how long do we want to wait before failing suspend? Is this 
> an argument to have a separate timeout specifically addressing the 
> suspend path or not I am not sure. Perhaps there is no choice and 
> simply wait until buffers are swapped out otherwise nothing will work.
>
> Regards,
>
> Tvrtko

Thanks,

Thomas.


