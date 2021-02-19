Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0523231FBC1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 16:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C726EB53;
	Fri, 19 Feb 2021 15:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CF06EB53
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 15:14:01 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r21so9007942wrr.9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 07:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7oj24wPbexy6ztCShLpzyRS2gtqDCVlF1vqyxIO6hWQ=;
 b=JhbwcwqolnWI1P7v6iaDbUipsBKn/+8NknHt+jhpN0VnSaWxGZkZdeUZy8K4N9Bo59
 jb+mjWzRNM6oe038MEKLbGLlPwcA8JRkMs0cQMDYUA6tKYQurzLUHB9emPiq8AJU5Pd9
 PLmOGWHMRDVQZ4gq28DeNHlXJqoTR93YnKZ24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7oj24wPbexy6ztCShLpzyRS2gtqDCVlF1vqyxIO6hWQ=;
 b=atEmWpGo9zHo4e7Q5aH8QAIXRRPha1D6inYa1GekmHoZDuhz95aOWxkdRi+0CC8g5N
 wCFRPZBLl5CXznxMaA1erWCQzrj7R5wUW5AJlHf0dzFk82EFiKSGQVbB3YbKhgqWb5cf
 B0FQ/Nwk8UzoA8teiKh8h6uZ4NjtukvBcri9nZxO7wMrKm9LrzYAKB9xm/VPufci6+Cb
 ce7bBMBWDbOTAdvbNb0m5cco2hlDrKtdwq/n2OhNXuIcSuxSxlv1IoyWOd9Vyo8e3Dya
 wEYyMX1uu7zBkKyhGImEjOqL2t6pDvmVXT0J/iidqPmHuu6eBYnyZhZDI8PROsL1zxx4
 +xKQ==
X-Gm-Message-State: AOAM530gHFbVsuk88gZCSx5zOinIMhL7w9GMh1OWoo1gDMObJX5RSXC2
 gSHxNF6lFEPo/wxxm7pEXOy+Pg==
X-Google-Smtp-Source: ABdhPJwe+o6vjKsyPH9IXeSWy21fepdmqjfDUk42CccJhGG861jD5qd1IYvf7T6FwZFirSmuMp+wvg==
X-Received: by 2002:a5d:430a:: with SMTP id h10mr9904658wrq.162.1613747640650; 
 Fri, 19 Feb 2021 07:14:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w25sm11785354wmc.42.2021.02.19.07.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 07:14:00 -0800 (PST)
Date: Fri, 19 Feb 2021 16:13:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/shmem-helper: Don't remove the offset in
 vm_area_struct pgoff
Message-ID: <YC/VtqBVVN3XTuPF@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <76d68de3-d097-117a-ae9d-6771b106e16f@arm.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Roberts <nroberts@igalia.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 19, 2021 at 01:36:06PM +0000, Steven Price wrote:
> On 18/02/2021 18:20, Daniel Vetter wrote:
> > On Thu, Feb 18, 2021 at 6:16 PM Rob Herring <robh+dt@kernel.org> wrote:
> > > 
> > > On Thu, Feb 18, 2021 at 10:51 AM Steven Price <steven.price@arm.com> wrote:
> > > > 
> > > > On 18/02/2021 16:38, Rob Herring wrote:
> > > > > On Thu, Feb 18, 2021 at 10:15 AM Steven Price <steven.price@arm.com> wrote:
> > > > > > 
> > > > > > On 18/02/2021 15:45, Alyssa Rosenzweig wrote:
> > > > > > > > Yeah plus Cc: stable for backporting and I think an igt or similar for
> > > > > > > > panfrost to check this works correctly would be pretty good too. Since
> > > > > > > > if it took us over 1 year to notice this bug it's pretty clear that
> > > > > > > > normal testing doesn't catch this. So very likely we'll break this
> > > > > > > > again.
> > > > > > > 
> > > > > > > Unfortunately there are a lot of kernel bugs which are noticed during actual
> > > > > > > use (but not CI runs), some of which have never been fixed. I do know
> > > > > > > the shrinker impl is buggy for us, if this is the fix I'm very happy.
> > > > > > 
> > > > > > I doubt this will actually "fix" anything - if I understand correctly
> > > > > > then the sequence which is broken is:
> > > > > > 
> > > > > >     * allocate BO, mmap to CPU
> > > > > >     * madvise(DONTNEED)
> > > > > >     * trigger purge
> > > > > >     * try to access the BO memory
> > > > > > 
> > > > > > which is an invalid sequence for user space - the attempt to access
> > > > > > memory should cause a SIGSEGV. However because drm_vma_node_unmap() is
> > > > > > unable to find the mappings there may still be page table entries
> > > > > > present which would provide access to memory the kernel has freed. Which
> > > > > > is of course a big security hole and so this fix is needed.
> > > > > > 
> > > > > > In what way do you find the shrinker impl buggy? I'm aware there's some
> > > > > > dodgy locking (although I haven't worked out how to fix it) - but AFAICT
> > > > > > it's more deadlock territory rather than lacking in locks. Are there
> > > > > > correctness issues?
> > > > > 
> > > > > What's there was largely a result of getting lockdep happy.
> > > > > 
> > > > > > > > btw for testing shrinkers recommended way is to have a debugfs file
> > > > > > > > that just force-shrinks everything. That way you avoid all the trouble
> > > > > > > > that tend to happen when you drive a system close to OOM on linux, and
> > > > > > > > it's also much faster.
> > > > > > > 
> > > > > > > 2nding this as a good idea.
> > > > > > > 
> > > > > > 
> > > > > > Sounds like a good idea to me too. But equally I'm wondering whether the
> > > > > > best (short term) solution is to actually disable the shrinker. I'm
> > > > > > somewhat surprised that nobody has got fed up with the "Purging xxx
> > > > > > bytes" message spam - which makes me think that most people are not
> > > > > > hitting memory pressure to trigger the shrinker.
> > > > > 
> > > > > If the shrinker is dodgy, then it's probably good to have the messages
> > > > > to know if it ran.
> > > > > 
> > > > > > The shrinker on kbase caused a lot of grief - and the only way I managed
> > > > > > to get that under control was by writing a static analysis tool for the
> > > > > > locking, and by upsetting people by enforcing the (rather dumb) rules of
> > > > > > the tool on the code base. I've been meaning to look at whether sparse
> > > > > > can do a similar check of locks.
> > > > > 
> > > > > Lockdep doesn't cover it?
> > > > 
> > > > Short answer: no ;)
> > 
> > It's pretty good actually, if you correctly annotate things up.
> 
> I agree - it's pretty good, the problem is you need reasonable test
> coverage, and getting good test coverage of shrinkers is hard.
> 
> > > > The problem with lockdep is that you have to trigger the locking
> > > > scenario to get a warning out of it. For example you obviously won't get
> > > > any warnings about the shrinker without triggering the shrinker (which
> > > > means memory pressure since we don't have the debugfs file to trigger it).
> > > 
> > > Actually, you don't need debugfs. Writing to /proc/sys/vm/drop_caches
> > > will do it. Though maybe there's other code path scenarios that
> > > wouldn't cover.
> > 
> > Huh didn't know, but it's a bit a shotgun, plus it doesn't use
> > fs_reclaim shrinker annotations, which means you don't have lockdep
> > checks. I think at least, would need some deadlock and testing.
> 
> The big problem with this sort of method for triggering the shrinkers is
> that they are called without (many) locks held. Whereas it's entirely
> possible for a shrinker to be called at (almost) any allocation in the
> kernel.
> 
> Admittedly the Panfrost shrinkers are fairly safe - because most things are
> xxx_trylock(). kbase avoids trylock which makes reclaim more reliable, but
> means deadlocks are much easier.

This is why you need the fs_reclaim annotation. With that lockdep can
connect the dots. See also might_alloc() annotations I've added in 5.11 or
so.

Validating shrinkers for deadlocks is actually not that hard, you just
need the debugfs interface to run your shrinker at will under the
fs_reclaim_acquire/release annotations. You do _not_ need to hit the full
combinatorial test matrix of making sure that your shrinker is called in
any possible place where memory is allocated.

> > > > I have to admit I'm not 100% sure I've seen any lockdep warnings based
> > > > on buffer objects recently. I can trigger them based on jobs:
> > > > 
> [snip]
> > > > 
> > > > Certainly here the mutex causing the problem is the shrinker_lock!
> > > > 
> > > > The above is triggered by chucking a whole ton of jobs which
> > > > fault at the GPU.
> > > > 
> > > > Sadly I haven't found time to work out how to untangle the locks.
> > > 
> > > They are tricky because pretty much any memory allocation can trigger
> > > things as I recall.
> > 
> > The above should only be possible with my dma_fence annotations, and
> > yes the point to bugs in the drm/scheduler. They shouldn't matter for
> > panfrost, and those patches aren't in upstream yet.
> 
> Yes that's on a (random version of) drm-misc - just what I happened to have
> built recently. Good news if that's not actually Panfrost's bug. I haven't
> had the time to track down what's going on yet.

Are you sure this is really drm-misc? The patch should never have been
there which adds these annotations.

Also help for fixing common code is appreciated :-)

> Sounds like I'm perhaps being a bit unfair on the shrinkers - I'm just aware
> that I went down a rabbit hole before looking at changing the locks which
> started because I was convinced having shrinker_lock as a mutex was a
> problem. But it was a while ago and I've forgotten what the logic was.

Oh memory reclaim and shrinker is definitely a rabbit hole.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
