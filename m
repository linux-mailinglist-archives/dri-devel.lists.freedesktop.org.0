Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28016D6B4A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 20:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3712510E739;
	Tue,  4 Apr 2023 18:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF03110E2D6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 18:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 2B53E3F5BC;
 Tue,  4 Apr 2023 20:14:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -4.469
X-Spam-Level: 
X-Spam-Status: No, score=-4.469 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M02u18zcmix6; Tue,  4 Apr 2023 20:14:05 +0200 (CEST)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 5EFC43F5AE;
 Tue,  4 Apr 2023 20:14:02 +0200 (CEST)
Received: from [192.168.1.39] (unknown [100.127.125.111])
 by mail1.shipmail.org (Postfix) with ESMTPSA id BCDAE3632EB;
 Tue,  4 Apr 2023 20:14:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1680632041; bh=W6p8xAGICZzjya8XsNCJRQwtmOwC9+CVzj4nFw/DWug=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=i1n6H2FgDOHyYHXgdVgujHbOM98t8U7JfA2R0WZItfay2bdxCFktVqGw928YtunyY
 wj/ebNd2HuSB9KrwawDLeJpzpF0W/CbnBCvwT7f2NpN6RG9I3jNRZdXmWxxl6ti4kA
 syCwTUASdlNav6bHimAXto0yhNzQ4U6VNL8sRMq8=
Message-ID: <16a3a3fd-47c7-d74d-4835-9438ef8d2635@shipmail.org>
Date: Tue, 4 Apr 2023 20:14:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
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
Cc: robdclark@chromium.org, airlied@linux.ie, boris.brezillon@collabora.com,
 faith.ekstrand@collabora.com, lina@asahilina.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/4/23 15:10, Christian König wrote:
> Am 04.04.23 um 14:54 schrieb Thomas Hellström:
>> Hi, Christian,
>>
>> On 4/4/23 11:09, Christian König wrote:
>>> Am 04.04.23 um 02:22 schrieb Matthew Brost:
>>>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>
>>>> For long-running workloads, drivers either need to open-code 
>>>> completion
>>>> waits, invent their own synchronization primitives or internally use
>>>> dma-fences that do not obey the cross-driver dma-fence protocol, but
>>>> without any lockdep annotation all these approaches are error prone.
>>>>
>>>> So since for example the drm scheduler uses dma-fences it is 
>>>> desirable for
>>>> a driver to be able to use it for throttling and error handling 
>>>> also with
>>>> internal dma-fences tha do not obey the cros-driver dma-fence 
>>>> protocol.
>>>>
>>>> Introduce long-running completion fences in form of dma-fences, and 
>>>> add
>>>> lockdep annotation for them. In particular:
>>>>
>>>> * Do not allow waiting under any memory management locks.
>>>> * Do not allow to attach them to a dma-resv object.
>>>> * Introduce a new interface for adding callbacks making the helper 
>>>> adding
>>>>    a callback sign off on that it is aware that the dma-fence may not
>>>>    complete anytime soon. Typically this will be the scheduler 
>>>> chaining
>>>>    a new long-running fence on another one.
>>>
>>> Well that's pretty much what I tried before: 
>>> https://lwn.net/Articles/893704/
>>>
>>> And the reasons why it was rejected haven't changed.
>>>
>>> Regards,
>>> Christian.
>>>
>> Yes, TBH this was mostly to get discussion going how we'd best tackle 
>> this problem while being able to reuse the scheduler for long-running 
>> workloads.
>>
>> I couldn't see any clear decision on your series, though, but one 
>> main difference I see is that this is intended for driver-internal 
>> use only. (I'm counting using the drm_scheduler as a helper for 
>> driver-private use). This is by no means a way to try tackle the 
>> indefinite fence problem.
>
> Well this was just my latest try to tackle this, but essentially the 
> problems are the same as with your approach: When we express such 
> operations as dma_fence there is always the change that we leak that 
> somewhere.
>
> My approach of adding a flag noting that this operation is dangerous 
> and can't be synced with something memory management depends on tried 
> to contain this as much as possible, but Daniel still pretty clearly 
> rejected it (for good reasons I think).
>
>>
>> We could ofc invent a completely different data-type that abstracts 
>> the synchronization the scheduler needs in the long-running case, or 
>> each driver could hack something up, like sleeping in the 
>> prepare_job() or run_job() callback for throttling, but those waits 
>> should still be annotated in one way or annotated one way or another 
>> (and probably in a similar way across drivers) to make sure we don't 
>> do anything bad.
>>
>>  So any suggestions as to what would be the better solution here 
>> would be appreciated.
>
> Mhm, do we really the the GPU scheduler for that?
>
> I mean in the 1 to 1 case  you basically just need a component which 
> collects the dependencies as dma_fence and if all of them are 
> fulfilled schedules a work item.
>
> As long as the work item itself doesn't produce a dma_fence it can 
> then still just wait for other none dma_fence dependencies.
>
> Then the work function could submit the work and wait for the result.
>
> The work item would then pretty much represent what you want, you can 
> wait for it to finish and pass it along as long running dependency.
>
> Maybe give it a funky name and wrap it up in a structure, but that's 
> basically it.
>
This very much sounds like a i915_sw_fence for the dependency tracking 
and dma_fence_work for the actual work although it's completion fence is 
a dma_fence.

Although that goes against the whole idea of a condition for merging the 
xe driver would be that we implement some sort of minimal scaffolding 
for long-running workloads in the drm scheduler, and the thinking behind 
that is to avoid implementing intel-specific solutions like those...

Thanks,

Thomas



> Regards,
> Christian.
>
>>
>> Thanks,
>>
>> Thomas
>>
>>
>>
>>
>>
