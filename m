Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978EA7B2249
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 18:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C7910E68D;
	Thu, 28 Sep 2023 16:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9539110E68D;
 Thu, 28 Sep 2023 16:27:02 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A668A66071F8;
 Thu, 28 Sep 2023 17:27:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695918421;
 bh=7iFYQrUTq7idgt18OEix94cfK90qh9UDM4zHDUrw1bU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jTfmVn4GINVymXF6QWC/4KNIYnq/Gw84MXNaPWsWD8XltylpTnLga/Kxga61Ho12D
 qs2QDRz2Q8TcHRwArRQiHNFVz3hYpnLaUn5xLmSODbewBK0PAus+wCeizBbE4FALpE
 drrGeK59ad7wG3briZ+C/aXhKrShRsfuKNRU5OZqLe0Vy9pw286QzgRnNJObYP2dj2
 nuA8dGJvv/1hL2YY7etpljqMSvNw9v2yZ1+LN8yNg+b+E9K8G4mrbU4a9uhfHACNqL
 vxffiFHWp7zDw97ZDrW322TjbC2wo6fXbht+G63B6jEWdN/ARngwjwAzaFi7lTyb+L
 d1AQJIvbY6orQ==
Date: Thu, 28 Sep 2023 18:26:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH drm-misc-next 1/3] drm/sched: implement dynamic job flow
 control
Message-ID: <20230928182657.4e663e7c@collabora.com>
In-Reply-To: <1c0b9e1d-c990-437c-a8ba-5bb58e5872a0@amd.com>
References: <20230924224555.15595-1-dakr@redhat.com>
 <20230925145513.49abcc52@collabora.com>
 <c6ec9ab4-d63b-0a72-4abf-682b94739877@amd.com>
 <20230926091129.2d7d7472@collabora.com>
 <390db8af-1510-580b-133c-dacf5adc56d1@amd.com>
 <20230928100209.37df66f3@collabora.com>
 <1c0b9e1d-c990-437c-a8ba-5bb58e5872a0@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: matthew.brost@intel.com, Sarah Walker <sarah.walker@imgtec.com>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 Donald Robson <Donald.Robson@imgtec.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 28 Sep 2023 10:44:47 -0400
Luben Tuikov <luben.tuikov@amd.com> wrote:

> >>
> >> What we can do is the follow:
> >> 1. The scheduler has some initial credits it can use to push jobs.
> >> 2. Each scheduler fence (and *not* the job) has a credits field of how 
> >> much it will use.  
> > 
> > When are the credits assigned to the scheduler fence? As said earlier,
> > on PowerVR, we might start with N credits when the job is queued, and
> > (N - M) when it gets submitted, so we need a hook to force a
> > recalculation every time the scheduler is considering the job for
> > submission.  
> 
> "Credits" is something the firmware/hardware engineers tell you. It's a
> known fixed quantity at ASIC boot. It changes only as you submit jobs
> into the hardware/firmware.
> 
> No hook, but rather a peek. You'd peek at the hardware to figure out
> how many credits you have available to submit new jobs, or you'd keep
> a running count of this quantity--depending on how the ASIC works.

Knowing how many 'credits' are available is not really a problem, and I
don't need a hook for that. I need a hook to know how many 'credits' a
job will consume, because that's the part being dynamic in PowerVR
(signaled fences get evicted from the list of commands to issue when
the job is pushed to the ring buffer).

> 
> When a job completes, you add it's credits to the available credit
> count (or you may ask the hardware how many are available now),
> and add/reset that amount to the available count kept in the scheduler
> struct (for instance).

Again, I have no problem with the available_credits tracking. It's the
'how many credits do I need for this job?' that's dynamic.

> Then, if the next job to be pushed--which has been
> known from the outset as we use a job-FIFO--is using less than or equal
> number of credits than the available ones, then you push the job, and
> subtract from the availability count (or, again, peek at the hardware
> for that count).
> 
> >   
> >> 3. After letting a a job run the credits of it's fence are subtracted 
> >> from the available credits of the scheduler.  
> > 
> > Uh, what happens if the job you picked make the scheduler
> > available credits pass under zero? I guess that's relying on the
> > fact you only expose half of the ring buffer capacity, thus enforcing
> > that a job is never bigger than half the ring buffer. The latter is
> > acceptable, but the fact your utilization is then half the maximum
> > capacity is not great IMHO.  
> 
> The credit count you keep should never go negative from the action of pushing
> jobs to the hardware. If it did, it tells you the software design is not
> consistent.

AFAICT, that's what Christian suggested: exposing half the ring buffer
capacity so that any job can be queued even it means making the
sched->available_credits value negative. In order to submit new jobs, we
need to wait for sched->available_credits to become positive again.

> 
> Hardware/firmware engineers will not appreciate the fact that only 1/2 credits
> are being exposed due to poor software design principles, nor would
> the sales team.

Exactly, and again, that's not something I suggested doing, I was
replying to Christian's suggestion. Maybe I just misunderstood what he
was suggesting.

> 
> (See also message-id: 61c0d884-b8d4-4109-be75-23927b61cb52@amd.com.)
> 
> >   
> >> 4. The scheduler can keep running jobs as long as it has a positive 
> >> credit count.  
> > 
> > Why not just check that 'next_job_credits < available_credits', and  
> 
> Yes, see message-id: 61c0d884-b8d4-4109-be75-23927b61cb52@amd.com.
> 
> > force the scheduler to go to sleep if that's not the case. When it's
> > woken up because the parent fence of some previous job is signaled, we  
> 
> "pending job"
> 
> > re-evaluate the condition, and go back to sleep if we still don't have
> > enough credits. In the PowerVR case, I'd need a wait to recalculate the
> > number of credits every time the condition is re-evaluated, but that's
> > just a matter of adding an optional hook to force the re-calculation.  
> 
> Right.
> 
> >   
> >> 5. When the credit count becomes negative it goes to sleep until a 
> >> scheduler fence signals and the count becomes positive again.
> >>
> >> This way jobs are handled equally, you can still push jobs up to at 
> >> least halve your ring buffer size  
> > 
> > I think that's the aspect I'm not fond of. I don't see why we'd want to
> > keep half of the ring buffer unused. I mean, there might be good  
> 
> We don't. We absolutely don't. Hardware engineers would absolutely
> not appreciate this, and you shouldn't write the code to do that.

Again, that's my understanding of Christian's suggestion.

> 
> > reasons to do so, if, for instance, the same ring buffer is used for
> > some high-priority commands sent by the kernel or something like that.  
> 
> Ideally, you'd want a separate ring with its own credits for high-priority
> jobs, since a high-priority job can be as large as the credit capacity,
> which would force the code to insert it at the head of the FIFO. Anyway,
> I digress. 

Exactly.

> 
> > But it looks like a driver-specific decision to not fully use the ring
> > buffer.  
> 
> The full potential of the hardware should be utilized at any point in time.
> 
> >   
> >> and you should be able to handle your 
> >> PowerVR case by calculating the credits you actually used in your 
> >> run_job() callback.  
> > 
> > Hm, ideally the credits adjustment should happen every time the
> > scheduler is considering a job for submission (every time it got
> > unblocked because available credits got increased), otherwise you might
> > wait longer than strictly needed if some native fences got signaled in
> > the meantime.  
> 
> Ideally, at the time you're considering whether you can push a job to the hardware,
> you should have the credit capacity ready

I'm not after recalculating sched->available_credits here, but rather
job->required_credits.

I could recalculate job->required_credits when ->prepare_job() is
called (AKA, your job is almost ready for submission), but this value
might be slightly bigger than what needed when the job finally gets
submitted (see below).


> --i.e. you should just read it
> off a variable/register/etc., possibly atomically. "Calculating" anything
> might induce delays, and future temptation to add more code to do more things
> there, thus degrading design.

Evicting signaled fences is not something we can do without a trigger,
so reading a variable won't help. I can recalculate the number of
credits needed for a job in the ->prepare_job() hook, but that means
credits will only be recalculated the first time the job is considered
for submission, not when the scheduler is woken up to re-evaluate
jobs waiting for ringbuf space. Given we're adding new infra to support
dynamic job sizes, I thought it'd okay to add an optional hook to query
the job required_credits value (the only overhead for other drivers is
the 'if (hook_present)' test).
