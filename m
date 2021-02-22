Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231A2321211
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 09:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5E36E4CD;
	Mon, 22 Feb 2021 08:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399A76E4CD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 08:34:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 75C7A1F44E7B;
 Mon, 22 Feb 2021 08:34:47 +0000 (GMT)
Date: Mon, 22 Feb 2021 09:34:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/shmem-helper: Don't remove the offset in
 vm_area_struct pgoff
Message-ID: <20210222093443.50a54863@collabora.com>
In-Reply-To: <CAKMK7uGy9ha=L_wavp+aPGbLDki7BiJmmH5q=TPSc+CU6+8Xbw@mail.gmail.com>
References: <20210217165910.3820374-1-nroberts@igalia.com>
 <7f80b184-7277-0f6c-1108-cf41189626df@arm.com>
 <CAKMK7uHPk1G-S6EMRZ8grZU8W6iij_DJR+V2eBGP+79Te6k76A@mail.gmail.com>
 <20210218154538.GA1483@kevin>
 <bddce2d0-8f93-9263-0185-97fc848ddda6@arm.com>
 <CAL_JsqJ1Q+yRTY7+RduWSK4ZWO4v8Dq02xwNdNpNY0uD402M-g@mail.gmail.com>
 <456aaf72-50ed-f482-d6e1-e131143aa835@arm.com>
 <CAL_Jsq+aYmmz6+RHzSNmaMQqJgkBGk6+7SyrnHQ9uASdcEU3uA@mail.gmail.com>
 <CAKMK7uF_qAL4fhuz-_itvS6BY2ziOnjkyjc-hrXKWmK7Q9ZE6w@mail.gmail.com>
 <76d68de3-d097-117a-ae9d-6771b106e16f@arm.com>
 <YC/VtqBVVN3XTuPF@phenom.ffwll.local>
 <a4546f4e-5c2f-158b-2e30-777569c06aea@arm.com>
 <CAKMK7uGy9ha=L_wavp+aPGbLDki7BiJmmH5q=TPSc+CU6+8Xbw@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Neil Roberts <nroberts@igalia.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Fri, 19 Feb 2021 18:45:00 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Fri, Feb 19, 2021 at 5:17 PM Steven Price <steven.price@arm.com> wrote:
> >
> > On 19/02/2021 15:13, Daniel Vetter wrote:  
> > > On Fri, Feb 19, 2021 at 01:36:06PM +0000, Steven Price wrote:  
> > >> On 18/02/2021 18:20, Daniel Vetter wrote:  
> > >>> On Thu, Feb 18, 2021 at 6:16 PM Rob Herring <robh+dt@kernel.org> wrote:  
> > >>>>
> > >>>> On Thu, Feb 18, 2021 at 10:51 AM Steven Price <steven.price@arm.com> wrote:  
> > >>>>>
> > >>>>> On 18/02/2021 16:38, Rob Herring wrote:  
> > >>>>>> On Thu, Feb 18, 2021 at 10:15 AM Steven Price <steven.price@arm.com> wrote:  
> > >>>>>>>
> > >>>>>>> On 18/02/2021 15:45, Alyssa Rosenzweig wrote:  
> > >>>>>>>>> Yeah plus Cc: stable for backporting and I think an igt or similar for
> > >>>>>>>>> panfrost to check this works correctly would be pretty good too. Since
> > >>>>>>>>> if it took us over 1 year to notice this bug it's pretty clear that
> > >>>>>>>>> normal testing doesn't catch this. So very likely we'll break this
> > >>>>>>>>> again.  
> > >>>>>>>>
> > >>>>>>>> Unfortunately there are a lot of kernel bugs which are noticed during actual
> > >>>>>>>> use (but not CI runs), some of which have never been fixed. I do know
> > >>>>>>>> the shrinker impl is buggy for us, if this is the fix I'm very happy.  
> > >>>>>>>
> > >>>>>>> I doubt this will actually "fix" anything - if I understand correctly
> > >>>>>>> then the sequence which is broken is:
> > >>>>>>>
> > >>>>>>>      * allocate BO, mmap to CPU
> > >>>>>>>      * madvise(DONTNEED)
> > >>>>>>>      * trigger purge
> > >>>>>>>      * try to access the BO memory
> > >>>>>>>
> > >>>>>>> which is an invalid sequence for user space - the attempt to access
> > >>>>>>> memory should cause a SIGSEGV. However because drm_vma_node_unmap() is
> > >>>>>>> unable to find the mappings there may still be page table entries
> > >>>>>>> present which would provide access to memory the kernel has freed. Which
> > >>>>>>> is of course a big security hole and so this fix is needed.
> > >>>>>>>
> > >>>>>>> In what way do you find the shrinker impl buggy? I'm aware there's some
> > >>>>>>> dodgy locking (although I haven't worked out how to fix it) - but AFAICT
> > >>>>>>> it's more deadlock territory rather than lacking in locks. Are there
> > >>>>>>> correctness issues?  
> > >>>>>>
> > >>>>>> What's there was largely a result of getting lockdep happy.
> > >>>>>>  
> > >>>>>>>>> btw for testing shrinkers recommended way is to have a debugfs file
> > >>>>>>>>> that just force-shrinks everything. That way you avoid all the trouble
> > >>>>>>>>> that tend to happen when you drive a system close to OOM on linux, and
> > >>>>>>>>> it's also much faster.  
> > >>>>>>>>
> > >>>>>>>> 2nding this as a good idea.
> > >>>>>>>>  
> > >>>>>>>
> > >>>>>>> Sounds like a good idea to me too. But equally I'm wondering whether the
> > >>>>>>> best (short term) solution is to actually disable the shrinker. I'm
> > >>>>>>> somewhat surprised that nobody has got fed up with the "Purging xxx
> > >>>>>>> bytes" message spam - which makes me think that most people are not
> > >>>>>>> hitting memory pressure to trigger the shrinker.  
> > >>>>>>
> > >>>>>> If the shrinker is dodgy, then it's probably good to have the messages
> > >>>>>> to know if it ran.
> > >>>>>>  
> > >>>>>>> The shrinker on kbase caused a lot of grief - and the only way I managed
> > >>>>>>> to get that under control was by writing a static analysis tool for the
> > >>>>>>> locking, and by upsetting people by enforcing the (rather dumb) rules of
> > >>>>>>> the tool on the code base. I've been meaning to look at whether sparse
> > >>>>>>> can do a similar check of locks.  
> > >>>>>>
> > >>>>>> Lockdep doesn't cover it?  
> > >>>>>
> > >>>>> Short answer: no ;)  
> > >>>
> > >>> It's pretty good actually, if you correctly annotate things up.  
> > >>
> > >> I agree - it's pretty good, the problem is you need reasonable test
> > >> coverage, and getting good test coverage of shrinkers is hard.
> > >>  
> > >>>>> The problem with lockdep is that you have to trigger the locking
> > >>>>> scenario to get a warning out of it. For example you obviously won't get
> > >>>>> any warnings about the shrinker without triggering the shrinker (which
> > >>>>> means memory pressure since we don't have the debugfs file to trigger it).  
> > >>>>
> > >>>> Actually, you don't need debugfs. Writing to /proc/sys/vm/drop_caches
> > >>>> will do it. Though maybe there's other code path scenarios that
> > >>>> wouldn't cover.  
> > >>>
> > >>> Huh didn't know, but it's a bit a shotgun, plus it doesn't use
> > >>> fs_reclaim shrinker annotations, which means you don't have lockdep
> > >>> checks. I think at least, would need some deadlock and testing.  
> > >>
> > >> The big problem with this sort of method for triggering the shrinkers is
> > >> that they are called without (many) locks held. Whereas it's entirely
> > >> possible for a shrinker to be called at (almost) any allocation in the
> > >> kernel.
> > >>
> > >> Admittedly the Panfrost shrinkers are fairly safe - because most things are
> > >> xxx_trylock(). kbase avoids trylock which makes reclaim more reliable, but
> > >> means deadlocks are much easier.  
> > >
> > > This is why you need the fs_reclaim annotation. With that lockdep can
> > > connect the dots. See also might_alloc() annotations I've added in 5.11 or
> > > so.
> > >
> > > Validating shrinkers for deadlocks is actually not that hard, you just
> > > need the debugfs interface to run your shrinker at will under the
> > > fs_reclaim_acquire/release annotations. You do _not_ need to hit the full
> > > combinatorial test matrix of making sure that your shrinker is called in
> > > any possible place where memory is allocated.  
> >
> > Cool - I hadn't looked at that code before, but it does look like it
> > should pick up the problem cases. I wish that had existed back when I
> > was dealing with kbase! :)
> >  
> > >>>>> I have to admit I'm not 100% sure I've seen any lockdep warnings based
> > >>>>> on buffer objects recently. I can trigger them based on jobs:
> > >>>>>  
> > >> [snip]  
> > >>>>>
> > >>>>> Certainly here the mutex causing the problem is the shrinker_lock!
> > >>>>>
> > >>>>> The above is triggered by chucking a whole ton of jobs which
> > >>>>> fault at the GPU.
> > >>>>>
> > >>>>> Sadly I haven't found time to work out how to untangle the locks.  
> > >>>>
> > >>>> They are tricky because pretty much any memory allocation can trigger
> > >>>> things as I recall.  
> > >>>
> > >>> The above should only be possible with my dma_fence annotations, and
> > >>> yes the point to bugs in the drm/scheduler. They shouldn't matter for
> > >>> panfrost, and those patches aren't in upstream yet.  
> > >>
> > >> Yes that's on a (random version of) drm-misc - just what I happened to have
> > >> built recently. Good news if that's not actually Panfrost's bug. I haven't
> > >> had the time to track down what's going on yet.  
> > >
> > > Are you sure this is really drm-misc? The patch should never have been
> > > there which adds these annotations.  
> >
> > Well drm-misc-next. It's based on commit e4abd7ad2b77 with some pending
> > Panfrost fixes on top.
> >  
> > > Also help for fixing common code is appreciated :-)  
> >
> > Indeed - I have put it on my todo list, but I'm not sure when I'll be
> > able to spend time on it.  
> 
> Oh there's indeed panfrost annotations in panfrost_reset(), but I
> guess that stuff just wasn't ever really tested when it landed?
> 
> commit 5bc5cc2819c2c0adb644919e3e790b504ea47e0a
> Author: Boris Brezillon <boris.brezillon@collabora.com>
> Date:   Thu Nov 5 16:17:04 2020 +0100
> 
>    drm/panfrost: Move the GPU reset bits outside the timeout handler
> 
> Adding Boris, since my idea wasn't to just add more lockdep splats to
> panfrost, but help make sure the reset code works correctly.

Okay, I'm a bit tired of this "oh, this is not really what I asked"
reply I got when you realize the code you acked/reviewed is not what
you expected. The dmafence annotation stuff is far from trivial, and I
remember asking for help when I submitted the version adding those
annotations in the reset path. Note that I didn't intend to spend days
on that stuff since all I was trying to do with this patch was to fix a
deadlock we had in the reset path, deadlock that was not related to dma
fence signaling at all. So yes, it was not thoroughly tested
(especially the fence signaling stuff), but enough to validate the
workloads that triggered the deadlock I was trying to fix no longer
caused this deadlock.

Don't get me wrong, I'm all for improving the DRM subsystem, and this
fencing annotation is probably a great thing, but you can't expect
people to take on those complex tasks without a bit of supervision.

Regards,

Boris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
