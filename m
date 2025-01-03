Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD08A008FF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 13:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C1910E895;
	Fri,  3 Jan 2025 12:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gH+6dpUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CDD10E895
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 12:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bcLaS9vXV1t2kCF2fSqboVMpfetoXWeXW+n2nhCiDQM=; b=gH+6dpUDzV/uo69ZqqxkWkd2bo
 QcuqELLf6V+Zt4pRiwHLLnjL4X/aHKTNfixgDp/3iU+w6MeO5z9XoOiBttnBbdO7riq0zfCvrrH+5
 mtiqg1TFVcs1ce3rtGXm/yrRW3T5FwQKCYp/ZipfTx3QK46MzDcTSafDp1xCeD6savAKPXXPuh67S
 CQcewcblXiuyKh0kFSKS54FMKgnCKnpRjwEuqvmPz1jrnTrGRo+IHiqChvU8FN5sTcZ7/luF/3FTZ
 hRQ3TwRQl4vlbf6QYRRcyBCSEaV7MaE8SsBp/X2ZE0fp/1OuAyLFp4rWuapASwu9JRVin/XMXSKD1
 YCh3ri/Q==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tTgOD-00BD73-Ri; Fri, 03 Jan 2025 13:02:53 +0100
Message-ID: <99c7ccf4-a85f-4a11-912f-78f8d5a57516@igalia.com>
Date: Fri, 3 Jan 2025 12:02:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/14] Deadline scheduler and other ideas
To: Philipp Stanner <pstanner@redhat.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <31842e821032305e5be7a8dcc3e13593fd09da20.camel@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <31842e821032305e5be7a8dcc3e13593fd09da20.camel@redhat.com>
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



On 02/01/2025 13:09, Philipp Stanner wrote:
> On Mon, 2024-12-30 at 16:52 +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> <tldr>
>> Replacing FIFO with a flavour of deadline driven scheduling and
>> removing round-
>> robin. Connecting the scheduler with dma-fence deadlines. First draft
>> and
>> testing by different drivers and feedback would be nice. I was only
>> able to test
>> it with amdgpu. Other drivers may not even compile.
> 
> (on my machine I could build them all)

Kernel test robot reported that pvr does not build. I have fixed that 
locally. (Matter of adding a proper interface for peeking into 
job->dependencies.)

> 
>> </tldr>
>>
>> If I remember correctly Christian mentioned recently (give or take)
>> that maybe
>> round-robin could be removed. That got me thinking how and what could
>> be
>> improved and simplified. So I played a bit in the scheduler code and
>> came up
>> with something which appears to not crash at least. Whether or not
>> there are
>> significant advantages apart from maybe code consolidation and
>> reduction is the
>> main thing to be determined.
> 
> Hi,
> 
> so first of all: Happy new year and thx for putting in all that effort
> :)
> 
> I gave the series a first look; Since this is an RFC, let's abstain
> from doing deeper reviews of the exact code for now.

Ditto and thank you for taking a look!

>> One big question is whether round-robin can really be removed. Does
>> anyone use
>> it, rely on it, or what are even use cases where it is much better
>> than FIFO.
> 
> So AFAICS Round Robin is not used anymore by anyone. And my
> understanding indeed is, too, that there is not really any use-case
> where one would like anything except for FIFO.
> 
> Looking at 977d97f18b5b ("drm/scheduler: Set the FIFO scheduling policy
> as the default"), it seems to me that RR just was easy to implement and
> it had the disadvantage of systems under high load cause the oldest job
> to be starved to death, which is why FIFO was introduced.
> 
> So my guess would be that RR just is a relict.
> 
> If we agree on that, then we could remove RR in any case, and the
> subsequent question would be whether FIFO should be replaced with
> deadline (or: if there should be FIFO *and* deadline?), wouldn't it?

I am unsure about RR but I agree what is the second part of the question.

There may be nuances with different drivers depending on how much they 
can queue to the hardware/firmware at once. Modern drivers which use 1:1 
sched:entity I don't expect care about DRM scheduler scheduling mode. 
The fewer jobs driver can queue to the backend the more it cares. 
Question is FIFO ever better. Keeping in mind that for same priority 
this deadline and FIFO are actually identical.

>> See "drm/sched: Add deadline policy" commit message for a short
>> description on
>> what flavour of deadline scheduling it is. But in essence it should a
>> more fair
>> FIFO where higher priority can not forever starve lower priorities.
> 
> See my answer on that patch.
> 
> As you can imagine I'm wondering if that "better FIFO" would be worth
> it considering that we are running into a certain risk of regressing
> stuff through this rework.

I will reply to that part there then.
>> "drm/sched: Connect with dma-fence deadlines" wires up dma-fence
>> deadlines to
>> the scheduler because it is easy and makes logical sense with this.
>> And I
>> noticed userspace already uses it so why not wire it up fully.
> 
> Userspace uses the dma-fence deadlines you mean? Do you have a pointer
> for us?

I've noticed it empirically and the one I could fine is this:

https://invent.kde.org/plasma/kwin/-/commit/4ad5670ddfcd7400c8b84c12cbf8bd97a0590f43

>> Otherwise the series is a bit of progression from consolidating RR
>> into FIFO
>> code paths and going from there to deadline and then to a change in
>> how
>> dependencies are handled. And code simplification to 1:1 run queue to
>> scheduler
>> relationship, because deadline does not need per priority run queues.
>>
>> There is quite a bit of code to go throught here so I think it could
>> be even
>> better if other drivers could give it a spin as is and see if some
>> improvements
>> can be detected. Or at least no regressions.
> 
> I hope I can dive deeper into the Nouveau side soon.

Fantastic!
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>>
>> Tvrtko Ursulin (14):
>>    drm/sched: Delete unused update_job_credits
>>    drm/sched: Remove idle entity from tree
>>    drm/sched: Implement RR via FIFO
>>    drm/sched: Consolidate entity run queue management
>>    drm/sched: Move run queue related code into a separate file
>>    drm/sched: Ignore own fence earlier
>>    drm/sched: Resolve same scheduler dependencies earlier
>>    drm/sched: Add deadline policy
>>    drm/sched: Remove FIFO and RR and simplify to a single run queue
>>    drm/sched: Queue all free credits in one worker invocation
>>    drm/sched: Connect with dma-fence deadlines
>>    drm/sched: Embed run queue singleton into the scheduler
>>    dma-fence: Add helper for custom fence context when merging fences
>>    drm/sched: Resolve all job dependencies in one go
> 
> It seems to me that this series is a "port RR and FIFO to deadline"-
> series with some additional patches that could be branched out and be
> reviewed through a separate series?
> 
> Patch 1 ("Delete unused...") for example. Other candidates are Patch 5
> ("Move run queue related..."), 13 ("Add helper for...").
> 
> A few patches might be mergeable even if the main idea with deadline
> doesn't get approved, that's why I'm suggesting that.

Yes some of those could be possible and I am happy to extract and rebase 
in principle. But not yet I think. If and when something gets a positive 
nod.

Regards,

Tvrtko

>>
>>   drivers/dma-buf/dma-fence-unwrap.c          |   8 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |   6 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  27 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     |   5 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h   |   8 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |   8 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c     |   8 +-
>>   drivers/gpu/drm/scheduler/Makefile          |   2 +-
>>   drivers/gpu/drm/scheduler/sched_entity.c    | 316 ++++++-----
>>   drivers/gpu/drm/scheduler/sched_fence.c     |   5 +-
>>   drivers/gpu/drm/scheduler/sched_main.c      | 587 +++++-------------
>> --
>>   drivers/gpu/drm/scheduler/sched_rq.c        | 199 +++++++
>>   include/drm/gpu_scheduler.h                 |  74 ++-
>>   include/linux/dma-fence-unwrap.h            |  31 +-
>>   14 files changed, 606 insertions(+), 678 deletions(-)
>>   create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
>>
> 
