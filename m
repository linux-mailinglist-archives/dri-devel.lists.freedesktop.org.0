Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0046465C1BD
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 15:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E18B10E3E3;
	Tue,  3 Jan 2023 14:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B1D10E3E2;
 Tue,  3 Jan 2023 14:21:48 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B3E646602CDE;
 Tue,  3 Jan 2023 14:21:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672755706;
 bh=MTfHI02UGbWJj+qUOI+EFvE5NKqvAa/kAFhxaiRYjH4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lYtIx67ydvHxQVChMkU77XZFJnrtwn6y1JdQ15j/oKYrtQmYTMUM1P9F+gJ2euGbV
 UIwSqoN6TGfQTviyT/HUIJ+lBY91V5X7306uWQv2o2re/RSY4LMF0ic5+gbnrg9q0P
 YkFynz/HrpG3P7Kp60U+8Z0zerDm5tiN09gmHUxy+KnWuy2e6S/2JeQPuNbrUCxNJM
 xKxf368UxmSULqFaHNXFGrRnlHeDZg5UfcW7l/Lf28Q69nEfjLJLsQbJ5QLhCosmAq
 tC9pZPO8FhDoAQl0AQYc5xCFOxx4gfbobc/pe1uqxzI4E/56vB7BCezV1epMFNoVFa
 NVF5n/UQ/FQWQ==
Date: Tue, 3 Jan 2023 15:21:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler
 to use a work queue rather than kthread
Message-ID: <20230103152143.7ebc5136@collabora.com>
In-Reply-To: <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <20221222222127.34560-5-matthew.brost@intel.com>
 <20221230112042.2ddd1946@collabora.com>
 <20221230125508.57af8a14@collabora.com>
 <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 3 Jan 2023 13:02:15 +0000
Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:

> On 02/01/2023 07:30, Boris Brezillon wrote:
> > On Fri, 30 Dec 2022 12:55:08 +0100
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >   
> >> On Fri, 30 Dec 2022 11:20:42 +0100
> >> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >>  
> >>> Hello Matthew,
> >>>
> >>> On Thu, 22 Dec 2022 14:21:11 -0800
> >>> Matthew Brost <matthew.brost@intel.com> wrote:
> >>>      
> >>>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> >>>> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
> >>>> seems a bit odd but let us explain the reasoning below.
> >>>>
> >>>> 1. In XE the submission order from multiple drm_sched_entity is not
> >>>> guaranteed to be the same completion even if targeting the same hardware
> >>>> engine. This is because in XE we have a firmware scheduler, the GuC,
> >>>> which allowed to reorder, timeslice, and preempt submissions. If a using
> >>>> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
> >>>> apart as the TDR expects submission order == completion order. Using a
> >>>> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.  
> >>>
> >>> Oh, that's interesting. I've been trying to solve the same sort of
> >>> issues to support Arm's new Mali GPU which is relying on a FW-assisted
> >>> scheduling scheme (you give the FW N streams to execute, and it does
> >>> the scheduling between those N command streams, the kernel driver
> >>> does timeslice scheduling to update the command streams passed to the
> >>> FW). I must admit I gave up on using drm_sched at some point, mostly
> >>> because the integration with drm_sched was painful, but also because I
> >>> felt trying to bend drm_sched to make it interact with a
> >>> timeslice-oriented scheduling model wasn't really future proof. Giving
> >>> drm_sched_entity exlusive access to a drm_gpu_scheduler probably might
> >>> help for a few things (didn't think it through yet), but I feel it's
> >>> coming short on other aspects we have to deal with on Arm GPUs.  
> >>
> >> Ok, so I just had a quick look at the Xe driver and how it
> >> instantiates the drm_sched_entity and drm_gpu_scheduler, and I think I
> >> have a better understanding of how you get away with using drm_sched
> >> while still controlling how scheduling is really done. Here
> >> drm_gpu_scheduler is just a dummy abstract that let's you use the
> >> drm_sched job queuing/dep/tracking mechanism. The whole run-queue
> >> selection is dumb because there's only one entity ever bound to the
> >> scheduler (the one that's part of the xe_guc_engine object which also
> >> contains the drm_gpu_scheduler instance). I guess the main issue we'd
> >> have on Arm is the fact that the stream doesn't necessarily get
> >> scheduled when ->run_job() is called, it can be placed in the runnable
> >> queue and be picked later by the kernel-side scheduler when a FW slot
> >> gets released. That can probably be sorted out by manually disabling the
> >> job timer and re-enabling it when the stream gets picked by the
> >> scheduler. But my main concern remains, we're basically abusing
> >> drm_sched here.
> >>
> >> For the Arm driver, that means turning the following sequence
> >>
> >> 1. wait for job deps
> >> 2. queue job to ringbuf and push the stream to the runnable
> >>     queue (if it wasn't queued already). Wakeup the timeslice scheduler
> >>     to re-evaluate (if the stream is not on a FW slot already)
> >> 3. stream gets picked by the timeslice scheduler and sent to the FW for
> >>     execution
> >>
> >> into
> >>
> >> 1. queue job to entity which takes care of waiting for job deps for
> >>     us
> >> 2. schedule a drm_sched_main iteration
> >> 3. the only available entity is picked, and the first job from this
> >>     entity is dequeued. ->run_job() is called: the job is queued to the
> >>     ringbuf and the stream is pushed to the runnable queue (if it wasn't
> >>     queued already). Wakeup the timeslice scheduler to re-evaluate (if
> >>     the stream is not on a FW slot already)
> >> 4. stream gets picked by the timeslice scheduler and sent to the FW for
> >>     execution
> >>
> >> That's one extra step we don't really need. To sum-up, yes, all the
> >> job/entity tracking might be interesting to share/re-use, but I wonder
> >> if we couldn't have that without pulling out the scheduling part of
> >> drm_sched, or maybe I'm missing something, and there's something in
> >> drm_gpu_scheduler you really need.  
> > 
> > On second thought, that's probably an acceptable overhead (not even
> > sure the extra step I was mentioning exists in practice, because dep
> > fence signaled state is checked as part of the drm_sched_main
> > iteration, so that's basically replacing the worker I schedule to
> > check job deps), and I like the idea of being able to re-use drm_sched
> > dep-tracking without resorting to invasive changes to the existing
> > logic, so I'll probably give it a try.  
> 
> I agree with the concerns and think that how Xe proposes to integrate 
> with drm_sched is a problem, or at least significantly inelegant.

Okay, so it looks like I'm not the only one to be bothered by the way Xe
tries to bypass the drm_sched limitations :-).

> 
> AFAICT it proposes to have 1:1 between *userspace* created contexts (per 
> context _and_ engine) and drm_sched. I am not sure avoiding invasive 
> changes to the shared code is in the spirit of the overall idea and 
> instead opportunity should be used to look at way to refactor/improve 
> drm_sched.
> 
> Even on the low level, the idea to replace drm_sched threads with 
> workers has a few problems.
> 
> To start with, the pattern of:
> 
>    while (not_stopped) {
> 	keep picking jobs
>    }
> 
> Feels fundamentally in disagreement with workers (while obviously fits 
> perfectly with the current kthread design).
> 
> Secondly, it probably demands separate workers (not optional), otherwise 
> behaviour of shared workqueues has either the potential to explode 
> number kernel threads anyway, or add latency.
> 
> What would be interesting to learn is whether the option of refactoring 
> drm_sched to deal with out of order completion was considered and what 
> were the conclusions.

I might be wrong, but I don't think the fundamental issue here is the
out-of-order completion thing that's mentioned in the commit message.
It just feels like this is a symptom of the impedance mismatch we
have between priority+FIFO-based job scheduling and
priority+timeslice-based queue scheduling (a queue being represented by
a drm_sched_entity in drm_sched).

> 
> Second option perhaps to split out the drm_sched code into parts which 
> would lend themselves more to "pick and choose" of its functionalities. 
> Specifically, Xe wants frontend dependency tracking, but not any 
> scheduling really (neither least busy drm_sched, neither FIFO/RQ entity 
> picking), so even having all these data structures in memory is a waste.

Same thing for the panfrost+CSF driver I was mentioning in my previous
emails.

> 
> With the first option then the end result could be drm_sched per engine 
> class (hardware view), which I think fits with the GuC model. Give all 
> schedulable contexts (entities) to the GuC and then mostly forget about 
> them. Timeslicing and re-ordering and all happens transparently to the 
> kernel from that point until completion.

Yep, that would work. I guess it would mean creating an intermediate
abstract/interface to schedule entities and then implement this
interface for the simple HW-engine+job-scheduling case, so that
existing drm_sched users don't see a difference, and new drivers that
need to interface with FW-assisted schedulers can implement the
higher-lever entity scheduling interface. Don't know what this
interface would look like though.

> 
> Or with the second option you would build on some smaller refactored 
> sub-components of drm_sched, by maybe splitting the dependency tracking 
> from scheduling (RR/FIFO entity picking code).

What I've done so far is duplicate the dep-tracking logic in the
driver. It's not that much code, but it would be nice to not have to
duplicate it in the first place...

Regards,

Boris

