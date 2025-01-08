Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD2FA05FB7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 16:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4975F10EBDF;
	Wed,  8 Jan 2025 15:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="L/x8mZ2K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BCC10EBDF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 15:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pBzo1TvpNt3AjrefG8ia5SfN9nohYkjkzJhiz+1Z1s4=; b=L/x8mZ2Khgnv9LRKzCcrhyG8JE
 IRmpmMj5PlCCq3NZAMeceHu0nKRsv1lMKpExh9geh/y4tWUn0f91lNp+txJ1wVYBwr05kNr4tG+n3
 pmH7LvdRh3lHvum5ABRmpzPM3tmRknNKiasZ8BgM9xMUSruJHBbol43iHUSMpMG1t4yOYp3SzJadi
 k7PGQawZXUv3ge0Kqytcrw2AoTNMzN0c3Bvtwmm/xbCCgJMsx5cz73wtkrIW/ZP7UIgZrVRSQ6V14
 uYWmDyw0LijVffETeP8iPGDnsbSExIzlG5DWLTJn0FYBJ7oFjR17EbM5zF15TXZMEWNcgScrq1mKQ
 q6Ti4Bzg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tVXka-00DB2g-8v; Wed, 08 Jan 2025 16:13:40 +0100
Message-ID: <f7c333dd-6c6e-43ad-8879-8e9ccc374f5c@igalia.com>
Date: Wed, 8 Jan 2025 15:13:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/14] Deadline scheduler and other ideas
To: Danilo Krummrich <dakr@redhat.com>, Tvrtko Ursulin <tursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <Z3433G3-_aIMqJbt@pollux>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <Z3433G3-_aIMqJbt@pollux>
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


On 08/01/2025 08:31, Danilo Krummrich wrote:
> On Mon, Dec 30, 2024 at 04:52:45PM +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> "Deadline scheduler and other ideas"
> 
> There's a few patches that could be sent outside the scope of this series, e.g.
> the first one.
> 
> I think it would make sense to do so.

For now I'll keep them at the head of this RFC and as they get acked or 
r-b-ed I can easily send them standalone or re-ordered. Until then 
having the series separate would make the RFC not standalone.

>> <tldr>
>> Replacing FIFO with a flavour of deadline driven scheduling and removing round-
>> robin. Connecting the scheduler with dma-fence deadlines. First draft and
>> testing by different drivers and feedback would be nice. I was only able to test
>> it with amdgpu. Other drivers may not even compile.
> 
> What are the results from your tests with amdgpu? Do you have some measurements?

We already covered this in the thread with Philipp to a degree. Tl;dr; 
the main idea is whether we simplify the code and at least not regress.

I don't expect improvements on the amdgpu side with the workloads like 
games and benchmarks. I did not measure anything significant apart that 
priorities seem to work with the run queues removed.

Where something could show is if someone is aware of a workload where 
normal prio starves low. Since one part of the idea is that with the 
"deadline" scheme those should work a little bit more balanced.

Also again, feedback (including testing feedback from other drivers) 
would be great, and ideas of which workloads to test.

Btw I will send a respin in a day or so which will clean up some things 
and adds some more tiny bits.

Regards,

Tvrtko

>> </tldr>
>>
>> If I remember correctly Christian mentioned recently (give or take) that maybe
>> round-robin could be removed. That got me thinking how and what could be
>> improved and simplified. So I played a bit in the scheduler code and came up
>> with something which appears to not crash at least. Whether or not there are
>> significant advantages apart from maybe code consolidation and reduction is the
>> main thing to be determined.
>>
>> One big question is whether round-robin can really be removed. Does anyone use
>> it, rely on it, or what are even use cases where it is much better than FIFO.
>>
>> See "drm/sched: Add deadline policy" commit message for a short description on
>> what flavour of deadline scheduling it is. But in essence it should a more fair
>> FIFO where higher priority can not forever starve lower priorities.
>>
>> "drm/sched: Connect with dma-fence deadlines" wires up dma-fence deadlines to
>> the scheduler because it is easy and makes logical sense with this. And I
>> noticed userspace already uses it so why not wire it up fully.
>>
>> Otherwise the series is a bit of progression from consolidating RR into FIFO
>> code paths and going from there to deadline and then to a change in how
>> dependencies are handled. And code simplification to 1:1 run queue to scheduler
>> relationship, because deadline does not need per priority run queues.
>>
>> There is quite a bit of code to go throught here so I think it could be even
>> better if other drivers could give it a spin as is and see if some improvements
>> can be detected. Or at least no regressions.
> 
> Are there improvements with amdgpu?
> 
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>>
>> Tvrtko Ursulin (14):
>>    drm/sched: Delete unused update_job_credits
>>    drm/sched: Remove idle entity from tree
>>    drm/sched: Implement RR via FIFO
>>    drm/sched: Consolidate entity run queue management
>>    drm/sched: Move run queue related code into a separate file
>>    drm/sched: Ignore own fence earlier
>>    drm/sched: Resolve same scheduler dependencies earlier
>>    drm/sched: Add deadline policy
>>    drm/sched: Remove FIFO and RR and simplify to a single run queue
>>    drm/sched: Queue all free credits in one worker invocation
>>    drm/sched: Connect with dma-fence deadlines
>>    drm/sched: Embed run queue singleton into the scheduler
>>    dma-fence: Add helper for custom fence context when merging fences
>>    drm/sched: Resolve all job dependencies in one go
>>
>>   drivers/dma-buf/dma-fence-unwrap.c          |   8 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |   6 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  27 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     |   5 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h   |   8 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |   8 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c     |   8 +-
>>   drivers/gpu/drm/scheduler/Makefile          |   2 +-
>>   drivers/gpu/drm/scheduler/sched_entity.c    | 316 ++++++-----
>>   drivers/gpu/drm/scheduler/sched_fence.c     |   5 +-
>>   drivers/gpu/drm/scheduler/sched_main.c      | 587 +++++---------------
>>   drivers/gpu/drm/scheduler/sched_rq.c        | 199 +++++++
>>   include/drm/gpu_scheduler.h                 |  74 ++-
>>   include/linux/dma-fence-unwrap.h            |  31 +-
>>   14 files changed, 606 insertions(+), 678 deletions(-)
>>   create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
>>
>> -- 
>> 2.47.1
>>
> 
