Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E447533D34
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 15:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E44410F5D5;
	Wed, 25 May 2022 13:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166C010F5CE
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 13:05:19 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u3so30067308wrg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 06:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=05cAYL6xeSu1Wc61A6KPeOM0nDbLavsg1UBvch12Sj0=;
 b=JbNU0hB4Zh8cK/NIm+x3mS7l/ZOkafNMqqHRT/vk+87kerE8IYkD+WWG8CDky0lUUG
 CIm43R7ChfhLwe/+uqjwQzIR19sQc2D4W/rKoMllP8lZsQG1ILXgVx2tjtwMfepI6IGQ
 ohLB3IZlRtX7KIK5WOKsTuQ7/O8RpIkygJCEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=05cAYL6xeSu1Wc61A6KPeOM0nDbLavsg1UBvch12Sj0=;
 b=4Nh3hEyDA0CINtxGuIGjq9RMio2wIjASeMB05Ebpb6YkeqcCcTK7IoJqO9G02e+w6G
 K/zA+14DYHEBHomiMEhkfh3DZsAshiN4ejZNLqX5z4aZucPHzbZfMShKaOkHerhWzTED
 vhNH2KkXSlFr8dra8SKwkGHBSCuagJ8OhNByHc34F3BZduMXHS8iF7rGPgEGrkhLxK6t
 MbJ8fUvytXKdoeD4y+0L+O/coJFUgPAlKRq/e5+iimNDQed6ghzJelF+/FpKLC4ZfMPb
 e7pjDxGPRtehbD1eh9O/uJBhXZag+sDLNh7q445N8hQfrb1D/xz4d8ePPXQm8YcrkYNK
 h+Rw==
X-Gm-Message-State: AOAM531rUO9FiMnI0RVx6N2RKEQo9UAuEEqFkEu0CafD1Jv7h95ovwD9
 S1E/gktHed34n4MEKkte0+I6HQ==
X-Google-Smtp-Source: ABdhPJynYlEcScbdzp1jjX5kjvclk0P+oGNDvg1J5q/BRkuQTOrriEYl08RBffRNB/L2Xme66CqsUg==
X-Received: by 2002:adf:f089:0:b0:20e:5a80:c56 with SMTP id
 n9-20020adff089000000b0020e5a800c56mr27330681wro.37.1653483917103; 
 Wed, 25 May 2022 06:05:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 bi19-20020a05600c3d9300b003942a244f39sm1935450wmb.18.2022.05.25.06.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 06:05:16 -0700 (PDT)
Date: Wed, 25 May 2022 15:05:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: Tackling the indefinite/user DMA fence problem
Message-ID: <Yo4pin1Js4KXs2HL@phenom.ffwll.local>
References: <20220502163722.3957-1-christian.koenig@amd.com>
 <YnJQs1iusrBvpuMs@phenom.ffwll.local>
 <a01c7703-f7f7-f8ce-f80e-632a6fdcbbbe@gmail.com>
 <Ynkg81p6ADyZBa/L@phenom.ffwll.local>
 <a249c0c4-ee6c-bfb0-737b-eb6afae29602@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a249c0c4-ee6c-bfb0-737b-eb6afae29602@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: tvrtko.ursulin@linux.intel.com, sergemetral@google.com, tzimmermann@suse.de,
 gustavo@padovan.org, Felix.Kuehling@amd.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 jason@jlekstrand.net, alexander.deucher@amd.com, daniels@collabora.com,
 skhawaja@google.com, sumit.semwal@linaro.org, maad.aldabagh@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Apologies I'm constantly behind on m-l discussions :-/

On Tue, May 17, 2022 at 12:28:17PM +0200, Christian König wrote:
> Am 09.05.22 um 16:10 schrieb Daniel Vetter:
> > On Mon, May 09, 2022 at 08:56:41AM +0200, Christian König wrote:
> > > Am 04.05.22 um 12:08 schrieb Daniel Vetter:
> > > > On Mon, May 02, 2022 at 06:37:07PM +0200, Christian König wrote:
> > > > > Hello everyone,
> > > > > 
> > > > > it's a well known problem that the DMA-buf subsystem mixed
> > > > > synchronization and memory management requirements into the same
> > > > > dma_fence and dma_resv objects. Because of this dma_fence objects need
> > > > > to guarantee that they complete within a finite amount of time or
> > > > > otherwise the system can easily deadlock.
> > > > > 
> > > > > One of the few good things about this problem is that it is really good
> > > > > understood by now.
> > > > > 
> > > > > Daniel and others came up with some documentation:
> > > > > https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_buf#indefinite-dma-fences
> > > > > 
> > > > > And Jason did an excellent presentation about that problem on last years
> > > > > LPC: https://lpc.events/event/11/contributions/1115/
> > > > > 
> > > > > Based on that we had been able to reject new implementations of
> > > > > infinite/user DMA fences and mitigate the effect of the few existing
> > > > > ones.
> > > > > 
> > > > > The still remaining down side is that we don't have a way of using user
> > > > > fences as dependency in both the explicit (sync_file, drm_syncobj) as
> > > > > well as the implicit (dma_resv) synchronization objects, resulting in
> > > > > numerous problems and limitations for things like HMM, user queues
> > > > > etc....
> > > > > 
> > > > > This patch set here now tries to tackle this problem by untangling the
> > > > > synchronization from the memory management. What it does *not* try to do
> > > > > is to fix the existing kernel fences, because I think we now can all
> > > > > agree on that this isn't really possible.
> > > > > 
> > > > > To archive this goal what I do in this patch set is to add some parallel
> > > > > infrastructure to cleanly separate normal kernel dma_fence objects from
> > > > > indefinite/user fences:
> > > > > 
> > > > > 1. It introduce a DMA_FENCE_FLAG_USER define (after renaming some
> > > > > existing driver defines). To note that a certain dma_fence is an user
> > > > > fence and *must* be ignore by memory management and never used as
> > > > > dependency for normal none user dma_fence objects.
> > > > > 
> > > > > 2. The dma_fence_array and dma_fence_chain containers are modified so
> > > > > that they are marked as user fences whenever any of their contained
> > > > > fences are an user fence.
> > > > > 
> > > > > 3. The dma_resv object gets a new DMA_RESV_USAGE_USER flag which must be
> > > > > used with indefinite/user fences and separates those into it's own
> > > > > synchronization domain.
> > > > > 
> > > > > 4. The existing dma_buf_poll_add_cb() function is modified so that
> > > > > indefinite/user fences are included in the polling.
> > > > > 
> > > > > 5. The sync_file synchronization object is modified so that we
> > > > > essentially have two fence streams instead of just one.
> > > > > 
> > > > > 6. The drm_syncobj is modified in a similar way. User fences are just
> > > > > ignored unless the driver explicitly states support to wait for them.
> > > > > 
> > > > > 7. The DRM subsystem gains a new DRIVER_USER_FENCE flag which drivers
> > > > > can use to indicate the need for user fences. If user fences are used
> > > > > the atomic mode setting starts to support user fences as IN/OUT fences.
> > > > > 
> > > > > 8. Lockdep is used at various critical locations to ensure that nobody
> > > > > ever tries to mix user fences with non user fences.
> > > > > 
> > > > > The general approach is to just ignore user fences unless a driver
> > > > > stated explicitely support for them.
> > > > > 
> > > > > On top of all of this I've hacked amdgpu so that we add the resulting CS
> > > > > fence only as kernel dependency to the dma_resv object and an additional
> > > > > wrapped up with a dma_fence_array and a stub user fence.
> > > > > 
> > > > > The result is that the newly added atomic modeset functions now
> > > > > correctly wait for the user fence to complete before doing the flip. And
> > > > > dependent CS don't pipeline any more, but rather block on the CPU before
> > > > > submitting work.
> > > > > 
> > > > > After tons of debugging and testing everything now seems to not go up in
> > > > > flames immediately and even lockdep is happy with the annotations.
> > > > > 
> > > > > I'm perfectly aware that this is probably by far the most controversial
> > > > > patch set I've ever created and I really wish we wouldn't need it. But
> > > > > we certainly have the requirement for this and I don't see much other
> > > > > chance to get that working in an UAPI compatible way.
> > > > > 
> > > > > Thoughts/comments?
> > > > I think you need to type up the goal or exact problem statement you're
> > > > trying to solve first. What you typed up is a solution along the lines of
> > > > "try to stuff userspace memory fences into dma_fence and see how horrible
> > > > it all is", and that's certainly an interesting experiment, but what are
> > > > you trying to solve with it?
> > > Well, good point. I explained to much how it works, but now why.
> > > 
> > > In general I would describe the goal as: Providing a standard kernel
> > > infrastructure for user fences.
> > So on that goal the part I fully agree on is that drm_syncobj can (and
> > should imo) be able to contain userspace memory fences. The uapi semantics
> > and everything is already fully set up to support that, but maybe with
> > reduced performance: Non-aware userspace (or when you don't trust the
> > supplier of the umf) needs to block when looking up the fence, and the
> > dma_fence returned will always be signalled already. But that's just a
> > mild performance issue (and vk drivers paper over that already with
> > threading) and not a correctness issue.
> 
> Exactly that, yes.
> 
> > > > Like if the issue is to enable opencl or whatever, then that's no problem
> > > > (rocm on amdkfd is a thing, same maybe without the kfd part can be done
> > > > anywhere else). If the goal is to enable userspace memory fences for vk,
> > > > then we really don't need these everywhere, but really only in drm_syncobj
> > > > (and maybe sync_file).
> > > Yes, having an in kernel representation for vk user space fences is one of
> > > the goals.
> > > 
> > > And I was going back and forth if I should rather come up with a new
> > > structure for this or use the existing dma_fence with a flag as well.
> > > 
> > > I've decided to go down the later router because we have quite a lot of
> > > existing functionality which can be re-used. But if you have a good argument
> > > that it would be more defensive to come up with something completely new,
> > > I'm perfectly fine with that as well.
> > Yeah so stuffing that into dma_fence already freaks me out a bit. It is
> > quite fundamentally a different thing, and it would be really nice to make
> > that very apparent at the type level too.
> > 
> > E.g. to make sure you never ever end up with an umf fence in mmu notifier
> > invalidate callback. You can enforce that with runtime checks too, but imo
> > compile time fail is better than runtime fail.
> 
> Well, I see arguments for both sides.
> 
> There is certainly the danger that we have an umf wait in the mmu notifier,
> but then lockdep will scream "bloody hell" immediately.
> 
> On the other hand when I make this a separate structure we need to maintain
> containers for both variants, especially a chain implementation for
> drm_syncobj. And here I don't have lockdep to keep an eye that nobody does
> anything strange.
> 
> It's only a gut feeling with no clear evidence for one side. If you insists
> on a separate structure I will go down that route.
> 
> > > > If the goal is specifically atomic kms, then there's an entire can of
> > > > worms there that I really don't want to think about, but it exists: We
> > > > have dma_fence as out-fences from atomic commit, and that's already
> > > > massively broken since most drivers allocate some memory or at least take
> > > > locks which can allocate memory in their commit path. Like i2c. Putting a
> > > > userspace memory fence as in-fence in there makes that problem
> > > > substantially worse, since at least in theory you're just not allowed to
> > > > might_faul in atomic_commit_tail.
> > > Yes, that's unfortunately one of the goals as well and yes I completely
> > > agree on the can of worms. But I think I've solved that.
> > > 
> > > What I do in the patch set is to enforce that the out fence is an user fence
> > > when the driver supports user in fences as well.
> > > 
> > > Since user fences doesn't have the memory management dependency drivers can
> > > actually allocate memory or call I2C functions which takes locks which have
> > > memory allocation dependencies.
> > > 
> > > Or do I miss some other reason why you can't fault or allocate memory in
> > > atomic_commit_tail? At least lockdep seems to be happy about that now.
> > The problem is a bit that this breaks the uapi already. At least if the
> > goal is to have this all be perfectly transparent for userspace - as you
> > as you have multi-gpu setups going on at least.
> 
> Question here is why do you think there is an UAPI break? We currently wait
> in a work item already, so where exactly is the problem?

It's a bit washy, but dma_fence and hence implicit sync is supposed to
finish in finite time. umf just doesn't.

Ofc in reality you can still flood your compositor and they're not very
robust, but with umf it's trivial to just hang your compositor forever and
nothing happens. There was a least quite a bit of screaming from
compositor folks 2 years ago when we've gone through the i915-gem fun of
"hey we redefined dma_fence to have indefinite fence semantcis, cool isn't
it". And this is kinda similar - you don't hang the kernel with all the
lockdep stuff, meaning ^C can get you out of any hang. But userspace is
still dead, and the user is still potentially rather unhappy.

So either we force a timeout in the kernel or in userspace or somewhere,
and at that point I'm not entirely sure this is really worth it.

Same holds for sync_file. drm_syncobj is different and does have the
entire "this might never signal" concept encoded in it's uapi already, so
that's fine.

> > > > If the goal is to keep the uapi perfectly compatible then your patch set
> > > > doesn't look like a solution, since as soon as another driver is involved
> > > > which doesn't understand userspace memory fences it all falls apart. So
> > > > works great for a quick demo with amd+amd sharing, but not much further.
> > > > And I don't think it's feasible to just rev the entire ecosystem, since
> > > > that kinda defeats the point of keeping uapi stable - if we rev everything
> > > > we might as well also rev the uapi and make this a bit more incremental
> > > > again :-)
> > > Yes, unfortunately the uapi needs to stay compatible as well and yes that
> > > means we need to deploy this to all drivers involved.
> > > 
> > > We at least need to be able to provide a stack on new hardware with (for
> > > example) Ubuntu 18.04 without replacing all the userspace components.
> > > 
> > > What we can replace is the OpenGL stack and if necessary libdrm, but not
> > > (for example) the X server and most likely not the DDX in some cases.
> > > 
> > > The same applies with surfaceflinger and to some extend Wayland as well.
> > So for perfect uapi compat for existing compositor I really don't think
> > stuffing umf into the kernel is the right approach. Too many little
> > corners that break:
> > 
> > - the in/out fence mismatch every
> 
> On that part I need further explanation, cause I hoped that this is solved.

The thing is even if you force the out fence to be an umf too if the
in-fence is, they're chained. So as soon as you have an unsignalled in
fence all subsequent out fences need to be forced to be umf semantics.
Possible, but definitely messy.

> > - cross gpu with different userspace that doesn't understand umf and then
> >    just ignores them
> 
> Well by stuffing umf into the kernel the whole thing becomes transparent for
> userspace.
> 
> So it won't matter that you have a new amdgpu stack which wants to use umf
> and an older i915 stack which knows nothing about umfs.
> 
> The kernel will block on command submission as soon as a buffer is used by
> i915. And as you said above as well that might cause performance trouble,
> but is not a correctness problem.

The problem is that you still have to adjust all drivers. Which yes
eventually we have to do, but if the compat code is just in the driver
which has switched to umf already, then the cost is a lot more localized.
And with the dma_fence trick below it's all good.

> > - compositors which currently assume implicit sync finishes eventually,
> >    and with umf that gets complicated at best
> 
> But for userspace compositors there is no difference between an umf which
> times out and a dma_fence which timesout? Or am I missing something here?
> 
> > - same with sync_file, the uapi atm does not have a concept of future
> >    fence
> > 
> > So you can kinda make this work, but it falls apart all over the place.
> > And I also don't think smashing umf into all these old concepts helps us
> > in any way to get towards a desktop which is umf-native.
> 
> Yeah, but having an umf compatibility memory management doesn't help either
> to get away from pre-pinned pages.

I think it's really two worlds:

a) dma_fence syncing (sync_file, implicit sync in dma_resv, drm_syncobj
with dma_fence) and pre-pinned everything memory

b) umf mode, which opens the door for page faults and clever tricks and
avoids the need to pre-pin everything

It sucks, but I really haven't found a way to mix these. And I feel like
that it's pretty dangerous to pretend that we can do it - it freaks me out
at least :-)

> > My take is still that for backwards compat the simplest way is if a
> > umf-native driver simply provides dma-fence backwards compat as an opt-in,
> > which userspace chooses when it's necessary. There's really only two
> > things you need for that to work:
> > 
> > - a timeout of some sort on the dma_fence, which might or might not kill
> >    the entire context. This is entirey up to how your userspace does or
> >    does not implement stuff like arb robustness or vk_error_device_lost
> > 
> > - pre-pinned memory management to block out the all the inversions. This
> >    is a bit more nasty, but since we do have all the code for this already
> >    it really shouldn't be too tricky to make that happen for the fancy new
> >    umf world.
> 
> Well, exactly that's what we want to get away from.
> 
> > You do not need a kernel scheduler or anything like that at all, you can
> > do full userspace direct submit to hw and all that fun. Maybe do a
> > drm/sched frontend (and then your submit code does exactly what userspace
> > would do too).
> > 
> > Importantly the things you really don't need:
> > 
> > - special hw support, even if the only mode your hw supports is with page
> >    faults and all that: You can make sure all the pages are present
> >    upfront, and then simply kill the entire context is a page fault
> >    happens.
> 
> Well, that's only like 90% correct.
> 
> You can make that work without special hardware support, but from the
> experience with ROCm and very extensive talks with out hardware folks we
> have seriously problems making sure that the hw can't access freed up memory
> any more.
> 
> Except for the solution of never freeing up memory the only other
> possibility is to wait between 1 and 6 seconds until a shoot down made sure
> that there is really nobody accessing old page tables entries any more.
> 
> In the case of an user space queue with hardware scheduler support and HMM
> the memory would just still be referenced until userspace cooperatively
> inserted a barrier, but that again breaks some dma_fence assumptions as far
> as I can see.

So two things:

- Don't use legacy semantics for compute. They're completely different
  worlds, and i915 plan is to have completely different mode between
  legacy and compute mode creation, because they really don't mesh, at
  context creation time. So kinda like amdgpu renderD* vs amdkfd, except
  all int he renderD* node.

  You _never_ want to run ROCm or level0 or cuda with legacy mode, because
  it sucks too much. The trouble is a bit vulkan since if you run it
  headless, you want to run in compute mode, but if want wayland/x11
  winsys support, then you need legacy support. But we've come up with
  some supremely nasty tricks for that too in the discussion at plumbers
  last year.

  The other trouble is interop. I think the best path here is the vk
  approach of "you only get drm_syncobj, no implicit sync ever". But that
  might not be workable for rocm/opencl/whatever. I'm not sure what's the
  best option there, if absolutely everything breaks I guess we could look
  into adding a umf implicit sync slot to dma_resv, but I really think we
  should exhaust all other options first before we step into that dragon's
  lair :-/

  If we do go with the umf implicit sync I think we should really do it as
  a timeline thing, i.e. you attach the umf container once, the other side
  gets it once, an after that point the only thing that keeps happening is
  that writers increment the syncpt seqno, and readers just sample that
  every time they use the buffer. So essentially:

  struct dma_buf_umf_implict_sync {
  	struct drm_syncobj *sync;
	atomic_t seqno;
  };

  Plus a few ioctls to increment the seqno (and receive the value) and
  read the current seqno. That still means interop isn't perfectly
  transparent, but maybe we could at least reuse some of the codepaths we
  have for drm_syncobj in both kernel and userspace.

  Maybe we could make it backwards compat but just blocking rendering
  until the umf signals if a buffer is shared with any importer that
  doesn't understand umf implicit sync.

  But that's all rather horrible imo.

- For memory management I think the right long term approach is to punt
  this all to userspace, for both legacy and compute mode, with exactly
  the same semantics as mmap()/munmap() on the cpu side. i915 calls this
  vm_bind (the rfc is floating around somewhere), but essentially i915.ko
  will execute vm_bind and vm_unbind directly, completely decoupled from
  any in-flight command submission (we just punch out the ptes and force a
  tlb flush and done). If userspace unmaps memory it still uses, it gets
  to keep all the pieces. This is how vk and all the new stuff works. It
  does mean there's more work for gl and that kind of stuff, but this
  really shouldn't be the kernel's problem.

  Aside: We're aiming for the same for gpu context. If userspace closes a
  gpu context we just preempt and destroy it right away, userspace gets to
  keep he pieces if they wanted to let it finish first.

  This is exactly like on the cpu side where userspace can create/destroy
  threads and mmap/munmap as it sees fit, and it just blows up if it gets
  it all wrong.

  Ofc if you're hw is busted and you can't do reasonable efficient tlb
  flushing (even with pipeling and batching) then you're screwed, so I'm
  hoping your 1-6 seconds of waiting isn't that. If it is then you kinda
  have an unfixable security bug :-/ But iirc amdkfd already has batched
  up tlb flushes as dma_fence in USAGE_OTHER now, so this should all work.

  Anything else, i.e. userpsace fails to insert the required cache flushes
  or barriers or anything else before it calls gpu_unamp (or vm_unbind or
  whatever you want to call it) is a userspace bug.

  Ofc if you preempt a context for memory eviction due to memory pressure
  then the kernel has to do all the cache flushing and everything. Same
  for evicting pages due to memory pressure in the hmm use case. If you're
  preemption takes a few seconds I think there's bigger problems no matter
  what :-)

  Btw on vm_bind it'd be great if you or someone from amd's rocm/kfd side
  can take a look and drop your input. I expect that we'll have the same
  discussion with nouveau/nvidia and maybe also some of the armsoc chips.
  So it would be great if we can collect upstream wisdom on this topic a
  bit.

Neither of these are a reason to stuff umf into implicit sync or sync file
imo.

> > - special fw scheduler support: Once the memory management inversions are
> >    taken care of with pre-pinning under dma_fences, then the only other
> >    thing you need is a timeout for the dma_fence to signal. And maybe some
> >    kind of guaranteed ordering if you want to use a dma_fence timeline
> >    since that one can't go backwards.
> 
> Yeah, that not going backward thing turned out to be massively more tricky
> than I thought initially as well.
> 
> Alex, Marek and I worked quite hard on relaying those requirements to our
> internal teams, but I'm still not quite sure if that will turn out working
> or not.

I really don't think you need to teach this to your fw scheduler, that
sounds backwards. At least for i915+guc we don't have any plans to inflict
this on our fw scheduler (otoh our fw scheduler sucks at resolving
dependencies, but that's a different topic - currently it just busy-spins
if a context is stuck, there's some plans to preempt contexts instead and
round-robin to the next one):

All our fw scheduler is doing is scheduling gpu context and round-robing
them with preemption if they use up their time slice before they go idle
again. Everything else is meaning and semantics we put on top either in
the kernel (for dma_fence based sync) or in userspace (for direct submit
userspace galore, which currently is done in the most hilarious way in a
downstream hack since the hw support isn't there yet). Hilarious here
means we submit a batchbuffer to the kernel which jumps back to it's
start, and then use conditional rendering CS commands to latch in the next
real userspace batch as userspace queues them up. There's a ring of these
to keep it all nicely pipelined and the gpu busy. It's terrible, but for
certain niche use-cases it gets the job done :-)

> > Trying to shoehorn umf into all the old concepts like implicit sync or
> > sync_file which really don't support umf works for a demo, but imo just
> > isn't solid enough for shipping everywhere.
> > 
> > And long term I really don't think we ever want umf anywhere else than
> > drm_syncobj, at least for a 100% umf-native stack.
> 
> Ok then I will concentrate on drm_syncobj for now.
> 
> What about in driver backward compatibility? E.g. blocking wait in the
> multimedia driver CS IOCTL until umf signals?

Yeah I think for that we can keep on using drm_syncobj exactly as-is, i.e.
if it's a umf you just block until signalled when the driver tries to look
up the dma_fence. Ofc userspace can be a bit more clever (and they all
should do so) by doing that waiting in a userspace thread, and eventually
we want them to get at the umf behind it all if they trust the other side,
so that the wait can happen on the gpu.

But that's kinda details, in general I think drm_syncobj should be ready
for cross-driver/process/whatever umf sharing.

Cheers, Daniel

> Thanks,
> Christian.
> 
> > 
> > So maybe this all goes back to the old discussion with had, where you
> > argued for the need for special fw and hw and all that to make the old
> > dma_fence stuff work. Why is that needed? I still don't get that part ...
> > -Daniel
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
