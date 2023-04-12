Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD176DEB6E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 07:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A9310E1D1;
	Wed, 12 Apr 2023 05:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0485C10E1D1;
 Wed, 12 Apr 2023 05:48:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 03EC5425B7;
 Wed, 12 Apr 2023 05:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1681278477;
 bh=/eKgnATeDneTIdgH/47UivD6xvCPEAzKUQwBvfhAnZE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=CTUm9qsNudnlqgvl9tN1U9zQoaM8RIrfB8hWOgoxWs7cpbJadYEPaU/o1TpYO2R3f
 zjQV8RRc5/4xjAcCSaBws2weyzvo3h9tZo4K7x+xC7IfkCEpy2CQ1DDwgkoCpepWot
 FisdmV7Z4MGgvAXtd9AQNhE7CcudXNtgs2P9dcMbpFWuiU8cU0g2kucDtkskeB7SPC
 QFfo8nNonlAoGhoaWkA0d1AImnsgIvenzJySMUdoOWDNT8gF+F4ZlpQy8KsfI5OG3p
 TMnIF2wSXBdD40UGTJfrn5K01gNvWUk5/u8IpYRsSybKZYHdDxdpRTx5TbpZbwlkwR
 942bhGRE5G2+w==
Message-ID: <f92f205e-18b3-c264-6db6-3392ae027b04@asahilina.net>
Date: Wed, 12 Apr 2023 14:47:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <50fff1d4-9982-d60d-23e0-66c2020af5bf@asahilina.net>
 <ZCuEP2NnOich9kuI@DUT025-TGLU.fm.intel.com>
 <b15831b9-7bca-7e78-7abc-bc06e99b7699@asahilina.net>
 <ZDVpmpDHKx5KyD2M@phenom.ffwll.local>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <ZDVpmpDHKx5KyD2M@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Matthew Brost <matthew.brost@intel.com>, thomas.hellstrom@linux.intel.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, robdclark@chromium.org,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/04/2023 23.07, Daniel Vetter wrote:
> On Sat, Apr 08, 2023 at 04:05:20PM +0900, Asahi Lina wrote:
>> On 04/04/2023 10.58, Matthew Brost wrote:
>>> On Tue, Apr 04, 2023 at 10:07:48AM +0900, Asahi Lina wrote:
>>>> Hi, thanks for the Cc!
>>>>
>>>
>>> No problem.
>>>
>>>> On 04/04/2023 09.22, Matthew Brost wrote:
>>>>> Hello,
>>>>>
>>>>> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
>>>>> have been asked to merge our common DRM scheduler patches first as well
>>>>> as develop a common solution for long running workloads with the DRM
>>>>> scheduler. This RFC series is our first attempt at doing this. We
>>>>> welcome any and all feedback.
>>>>>
>>>>> This can we thought of as 4 parts detailed below.
>>>>>
>>>>> - DRM scheduler changes for 1 to 1 relationship between scheduler and
>>>>> entity (patches 1-3)
>>>>>
>>>>> In Xe all of the scheduling of jobs is done by a firmware scheduler (the
>>>>> GuC) which is a new paradigm WRT to the DRM scheduler and presents
>>>>> severals problems as the DRM was originally designed to schedule jobs on
>>>>> hardware queues. The main problem being that DRM scheduler expects the
>>>>> submission order of jobs to be the completion order of jobs even across
>>>>> multiple entities. This assumption falls apart with a firmware scheduler
>>>>> as a firmware scheduler has no concept of jobs and jobs can complete out
>>>>> of order. A novel solution for was originally thought of by Faith during
>>>>> the initial prototype of Xe, create a 1 to 1 relationship between scheduler
>>>>> and entity. I believe the AGX driver [3] is using this approach and
>>>>> Boris may use approach as well for the Mali driver [4].
>>>>>
>>>>> To support a 1 to 1 relationship we move the main execution function
>>>>> from a kthread to a work queue and add a new scheduling mode which
>>>>> bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
>>>>> The new scheduling mode should unify all drivers usage with a 1 to 1
>>>>> relationship and can be thought of as using scheduler as a dependency /
>>>>> infligt job tracker rather than a true scheduler.
>>>>
>>>> Yup, we're in the exact same situation with drm/asahi, so this is very
>>>> welcome! We've been using the existing scheduler as-is, but this should help
>>>> remove some unneeded complexity in this use case.
>>>>
>>>
>>> That's the idea.
>>>
>>>> Do you want me to pull in this series into our tree and make sure this all
>>>> works out for us?
>>>>
>>>
>>> We tested this in Xe and it definitely works for us but the more testing
>>> the better.
>>>
>>
>> I haven't gotten around to testing this series yet, but after more debugging
>> of drm_sched issues I want to hear more about how Xe uses the scheduler.
>>
>>  From what I can tell, and from what Christian says, drm_sched has the hidden
>> requirement that all job objects outlive the scheduler. I've run into
>> several UAF bugs due to this. Not only that, it also currently has the
>> requirement that all drm_sched fences outlive the scheduler object.
>>
>> These requirements are subtle and only manifest as kernel oopses in rare
>> corner cases, so it wasn't at all obvious to me that this was somehow a
>> fundamental design assumption when I started using it.
>>
>> As far as I can tell, this design is going to work in 99% of cases for
>> global-schedulers-per-GPU models, where those corner cases would have to be
>> hit on top of a GPU removal scenario (and GPU remove is... well, not the
>> most tested/exercised use case). When the scheduler basically lives forever,
>> none of this really matters.
>>
>> But with a one-scheduler-per-queue model, how do you deal with this when the
>> queue goes away? So far, without any of the partial bugfixes I have sent so
>> far (which Christian objected to):
>>
>> - If you try to tear down a scheduler with any jobs currently scheduled at
>> the hardware, drm_sched will oops when those jobs complete and the hw fences
>> signal.
>> - If you try to tear down an entity (which should cancel all its pending
>> jobs) and then the scheduler it was attached to without actually waiting for
>> all the free_job() callbacks to be called on every job that ever existed for
>> that entity, you can oops (entity cleanup is asynchronous in some cases like
>> killed processes, so it will return before all jobs are freed and then that
>> asynchronous process will crash and burn if the scheduler goes away out from
>> under its feet). Waiting for job completion fences is not enough for this,
>> you have to wait until free_job() has actually been called for all jobs.
>> - Even if you actually wait for all jobs to be truly gone and then tear down
>> the scheduler, if any scheduler job fences remain alive, that will then oops
>> if you try to call the debug functions on them (like cat
>> /sys/kernel/debug/dma_buf/bufinfo).
>>
>> I tried to fix these things, but Christian objected implying it was the
>> driver's job to keep a reference from jobs and hw fences to the scheduler.
>> But I find that completely broken, because besides the extra memory/resource
>> usage keeping the scheduler alive when you're trying to free resources as
>> fast as possible when a process goes away, you can't even use normal
>> reference counting for that: if you try to drop the last drm_sched reference
>> from within a free_job() callback, the whole thing deadlocks since that will
>> be running in the scheduler's thread/workqueue context, which can't free
>> itself. So now you both reference count the scheduler from jobs and fences,
>> and on top of that you need to outsource drm_sched freeing to a workqueue in
>> the driver to make sure you don't deadlock.
>>
>> For job fences this is particularly broken, because those fences can live
>> forever signaled and attached to shared buffers and there is no guarantee
>> that they will be freed in any kind of reasonable time frame. If they have
>> to keep the scheduler that created them alive, that creates a lot of dead
>> object junk we have to drag around just because a signaled fence exists
>> somewhere.
>>
>> For a Rust abstraction we have to do all that tracking and refcounting in
>> the abstraction itself to make it safe, which is starting to sound like
>> reimplementing half of the job tracking drm_sched itself does just to fix
>> the lifetime issues, which really tells me the existing design is not sound
>> nor easy to use correctly in general.
>>
>> How does Xe deal with this (does it deal with it at all)? What happens when
>> you kill -9 a process using the GPU? Does freeing all of this wait for all
>> jobs to complete *and be freed* with free_job()? What about exported
>> dma_bufs with fences attached from that scheduler? Do you keep the scheduler
>> alive for those?
>>
>> Personally, after running into all this, and after seeing Christian's
>> reaction to me trying to improve the state of things, I'm starting to doubt
>> that drm_sched is the right solution at all for firmware-scheduling drivers.
> 
> Bit a wash-up reply on the more fundamental thing here:
>   
> For the current scheduler the issues you've found are indeed all driver
> bugs (or most I think at least).

Even the last one with the fences? I can't see how that could be 
implemented correctly today by any driver, short of having the driver 
live until any buffers it has touched and installed a fence into go 
away, which doesn't sound right, since that would block cleanup (and 
module unloading) possibly forever, and that itself sounds like a bug...

This is why I'm a bit disappointed here, because even that one got me a 
"you're doing it wrong" response from Christian... but if scheduler 
fences are supposed to be outlived by the driver and its fences, what is 
even the point of having separate fences?

> 
> Which is why I think we shouldn't just try to shoehorn fundamentally new
> semantics without updating the driver interfaces (the drm_sched split into
> the driver interface part and the internal scheduler part). Once we have
> that, including kerneldoc update and what the rules are, then all the
> various uaf you've discovered become real bugs and I don't see any issue
> merging all the fixes.
> 
> Without that we do have a chicken/egg problem between:
> 
> "here's a bunch of hacks to make the problems disappear I've hit in my
> reuse of drm/sched for fw schedulers"
> 
> vs.
> 
> "this makes no sense for the current drm/sched interfaces and how current
> upstream drivers use it"
> 
> I don't think there's a lot needed in terms of drm/sched driver api
> rework, but I think it's also pretty clearly not ever going to get
> anywhere with just nothing at all. Writing an entire new scheduler lib
> instead of at least trying what minimal semantic changes (instead of just
> a pile of hacks without even doc changes for the new rules) does not sound
> like a good idea to me :-)

I wish I knew what the old rules were, since they're still not documented...

It's frustrating following what few rules are written down, running into 
a bug, writing a patch to fix it, and being told "no, you're just not 
following the unwritten rules"... several times now.

> 
>> If you want a workload to try to see if you run into any of these things,
>> running and killing lots of things in parallel is a good thing to try (mess
>> with the numbers and let it run for a while to see if you can hit any corner
>> cases):
>>
>> while true; do for i in $(seq 1 10); do timeout -k 0.01 0.05 glxgears &
>> done; sleep 0.1; done
> 
> Maybe xe gets away with this due to synchronously killing everything
> related to a ctx, but yeah I'd expect this to go boom in fun ways.

It'd have to explicitly refcount all the jobs and block killing the ctx 
until all jobs are freed (not just signaled) for that not to go boom 
right now, but even then you'd still have the issue with dangling fences 
in buffers making `cat /sys/kernel/debug/dma_buf/bufinfo` oops... and 
you can't synchronously kill those as far as I know.

~~ Lina

