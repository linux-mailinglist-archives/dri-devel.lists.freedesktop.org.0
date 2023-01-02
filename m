Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A347665ADB6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 08:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF9E10E0CC;
	Mon,  2 Jan 2023 07:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BACA10E0CC;
 Mon,  2 Jan 2023 07:30:24 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 66AE56602CC0;
 Mon,  2 Jan 2023 07:30:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672644622;
 bh=nZ1tiiKOV6PR1uS9qRcTHIV9dyzlwjFIHSSkrVZ8yC4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XG3D+CQiQmsN0ML2WTNyWCeX105+p+Ti/x87rl55aF8mIgt0l3uyvcaS787/9r95F
 fObcDjCpHaZJiYEccrqIvETIKffiHax/+gtABruHJZFKKN5yjrQKI5FUgGfA73zt7u
 RiB6mjRefdlkCxeztEbNjsyH5DNdFSXorWKKjF+mFrnYS7JF0CMPal0S8oAlhw5Rj/
 S1mewS1ub8ifxOUPPKIox+FW8ZXmEsGdsbzMNCLag/3iLu/S+OsJ1Uj20xEGkFf8lx
 cHK/RtXxmtMLeaiWUmnBkvLVcj4tVBjo5PJGQ/smDLyBQ+Gpmzhkz57GaBTNu/ZNQA
 VQuMDkX1WB1Nw==
Date: Mon, 2 Jan 2023 08:30:19 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC PATCH 04/20] drm/sched: Convert drm scheduler to use a
 work queue rather than kthread
Message-ID: <20230102083019.24b99647@collabora.com>
In-Reply-To: <20221230125508.57af8a14@collabora.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <20221222222127.34560-5-matthew.brost@intel.com>
 <20221230112042.2ddd1946@collabora.com>
 <20221230125508.57af8a14@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 30 Dec 2022 12:55:08 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Fri, 30 Dec 2022 11:20:42 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > Hello Matthew,
> > 
> > On Thu, 22 Dec 2022 14:21:11 -0800
> > Matthew Brost <matthew.brost@intel.com> wrote:
> >   
> > > In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> > > mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
> > > seems a bit odd but let us explain the reasoning below.
> > > 
> > > 1. In XE the submission order from multiple drm_sched_entity is not
> > > guaranteed to be the same completion even if targeting the same hardware
> > > engine. This is because in XE we have a firmware scheduler, the GuC,
> > > which allowed to reorder, timeslice, and preempt submissions. If a using
> > > shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
> > > apart as the TDR expects submission order == completion order. Using a
> > > dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.    
> > 
> > Oh, that's interesting. I've been trying to solve the same sort of
> > issues to support Arm's new Mali GPU which is relying on a FW-assisted
> > scheduling scheme (you give the FW N streams to execute, and it does
> > the scheduling between those N command streams, the kernel driver
> > does timeslice scheduling to update the command streams passed to the
> > FW). I must admit I gave up on using drm_sched at some point, mostly
> > because the integration with drm_sched was painful, but also because I
> > felt trying to bend drm_sched to make it interact with a
> > timeslice-oriented scheduling model wasn't really future proof. Giving
> > drm_sched_entity exlusive access to a drm_gpu_scheduler probably might
> > help for a few things (didn't think it through yet), but I feel it's
> > coming short on other aspects we have to deal with on Arm GPUs.  
> 
> Ok, so I just had a quick look at the Xe driver and how it
> instantiates the drm_sched_entity and drm_gpu_scheduler, and I think I
> have a better understanding of how you get away with using drm_sched
> while still controlling how scheduling is really done. Here
> drm_gpu_scheduler is just a dummy abstract that let's you use the
> drm_sched job queuing/dep/tracking mechanism. The whole run-queue
> selection is dumb because there's only one entity ever bound to the
> scheduler (the one that's part of the xe_guc_engine object which also
> contains the drm_gpu_scheduler instance). I guess the main issue we'd
> have on Arm is the fact that the stream doesn't necessarily get
> scheduled when ->run_job() is called, it can be placed in the runnable
> queue and be picked later by the kernel-side scheduler when a FW slot
> gets released. That can probably be sorted out by manually disabling the
> job timer and re-enabling it when the stream gets picked by the
> scheduler. But my main concern remains, we're basically abusing
> drm_sched here.
> 
> For the Arm driver, that means turning the following sequence
> 
> 1. wait for job deps
> 2. queue job to ringbuf and push the stream to the runnable
>    queue (if it wasn't queued already). Wakeup the timeslice scheduler
>    to re-evaluate (if the stream is not on a FW slot already)
> 3. stream gets picked by the timeslice scheduler and sent to the FW for
>    execution
> 
> into
> 
> 1. queue job to entity which takes care of waiting for job deps for
>    us
> 2. schedule a drm_sched_main iteration
> 3. the only available entity is picked, and the first job from this
>    entity is dequeued. ->run_job() is called: the job is queued to the
>    ringbuf and the stream is pushed to the runnable queue (if it wasn't
>    queued already). Wakeup the timeslice scheduler to re-evaluate (if
>    the stream is not on a FW slot already)
> 4. stream gets picked by the timeslice scheduler and sent to the FW for
>    execution
> 
> That's one extra step we don't really need. To sum-up, yes, all the
> job/entity tracking might be interesting to share/re-use, but I wonder
> if we couldn't have that without pulling out the scheduling part of
> drm_sched, or maybe I'm missing something, and there's something in
> drm_gpu_scheduler you really need.

On second thought, that's probably an acceptable overhead (not even
sure the extra step I was mentioning exists in practice, because dep
fence signaled state is checked as part of the drm_sched_main
iteration, so that's basically replacing the worker I schedule to
check job deps), and I like the idea of being able to re-use drm_sched
dep-tracking without resorting to invasive changes to the existing
logic, so I'll probably give it a try.
