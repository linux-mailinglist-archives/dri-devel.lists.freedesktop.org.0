Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 364243A2D28
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 15:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7349B6E0FC;
	Thu, 10 Jun 2021 13:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0B86E0FC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 13:35:56 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id f84so40881592ybg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 06:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3vjkyyfTWo5/JLTKistslGmPpg9qi5iLAOCHQ+wsjTo=;
 b=um7xeDsMhyxbM97LuU6HQFX9UgdMtV48NQNIoJMJFJnli+6+K/Caf0CVpB23OuEPvG
 ompZ9/Iotw4gFu21a48lEYExxBLjHmmeNz+epYhk8GUMBw16FEfuunVva6R07Kz6LiVc
 zCEXiVKtN9LXqvcbzKEp30PSKiBwJ1g+q4rx5sBgHjxlBqJy8XI9FGazm8xhN1a1ERSr
 adiKiaN45sPl36WdKHU2Y5gHxmpiwv5c8KSzAveZ45SYJjjOiHPTIGab0pO4M3gPyR1c
 xEGL7trVY03xqbJNyrWg/AY5Wo8hCCJGs5NRKf9fuxwtciLCoMKfZVsEcCaHNfQCCdeJ
 2xYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3vjkyyfTWo5/JLTKistslGmPpg9qi5iLAOCHQ+wsjTo=;
 b=qiL3ITOOZQ+QfT5C6WRcxqsKQPfNmt5Dv1P2VscgOQp8jG4ZodFYuMyEZ5a/Xkx74c
 WA8jW1cvGF6BPpulWhV2l1KQeg/JH1hQOtqlOF55tztNF+rp1EBEtHrm+OhURv3cGBPq
 vdpUt9XtrOQWhyuKk+HHYJW1ploKK6kPAU2WyMwGjVceA/Fgdf4WAwPnL7Ctbo4t/+vz
 2A9xZGNj7b3JnNuKQAspaObuq2kfwpPx6QVChNjstsa7u3N7uj5jOUwdjM3ZyuB0vs/P
 8YCxoneYBffPDt+0erULQwHwM/jlNkCTDoaKK9bhUOIgTbyIWxs7oJB1N5+BSX/XYyuD
 i9ig==
X-Gm-Message-State: AOAM531r2XBUl0RavIX5JcaKnFPAkuBnR8SlFMiuPuUDI0CdMaD9NTb3
 369eLSujTamDgxFvlsUmPHhNqh4PFBHloMbp2pS2RbQJo8E+zA==
X-Google-Smtp-Source: ABdhPJzHrKpsEnJPPdw7qmxdUsJf3pTApW9qYBzndAXP3FwNK/XtDkL+ziajzVcYgl/NrzCw7foqf2VNmVFqzooWZFg=
X-Received: by 2002:a25:208b:: with SMTP id g133mr7001223ybg.211.1623332155132; 
 Thu, 10 Jun 2021 06:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <ae289388-911f-2928-d695-050863ee1007@linux.intel.com>
 <f9be43e3-4107-3742-a11b-8021b2c19e32@amd.com>
 <CAKMK7uFMEdFjUSphcyxuKMW8HfLOWQAE2iw-Fei+SRTDwUbRdQ@mail.gmail.com>
In-Reply-To: <CAKMK7uFMEdFjUSphcyxuKMW8HfLOWQAE2iw-Fei+SRTDwUbRdQ@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 10 Jun 2021 08:35:44 -0500
Message-ID: <CAOFGe95BhZ7jXLxarL=2_zNYDydEoPJWnDWAG3aaeEJsDzR5dA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/5] dma-fence, i915: Stop allowing
 SLAB_TYPESAFE_BY_RCU for dma_fence
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 6:30 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> On Thu, Jun 10, 2021 at 11:39 AM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> > Am 10.06.21 um 11:29 schrieb Tvrtko Ursulin:
> > > On 09/06/2021 22:29, Jason Ekstrand wrote:
> > >> Ever since 0eafec6d3244 ("drm/i915: Enable lockless lookup of reques=
t
> > >> tracking via RCU"), the i915 driver has used SLAB_TYPESAFE_BY_RCU (i=
t
> > >> was called SLAB_DESTROY_BY_RCU at the time) in order to allow RCU on
> > >> i915_request.  As nifty as SLAB_TYPESAFE_BY_RCU may be, it comes wit=
h
> > >> some serious disclaimers.  In particular, objects can get recycled w=
hile
> > >> RCU readers are still in-flight.  This can be ok if everyone who tou=
ches
> > >> these objects knows about the disclaimers and is careful. However,
> > >> because we've chosen to use SLAB_TYPESAFE_BY_RCU for i915_request an=
d
> > >> because i915_request contains a dma_fence, we've leaked
> > >> SLAB_TYPESAFE_BY_RCU and its whole pile of disclaimers to every driv=
er
> > >> in the kernel which may consume a dma_fence.
> > >
> > > I don't think the part about leaking is true...
> > >
> > >> We've tried to keep it somewhat contained by doing most of the hard =
work
> > >> to prevent access of recycled objects via dma_fence_get_rcu_safe().
> > >> However, a quick grep of kernel sources says that, of the 30 instanc=
es
> > >> of dma_fence_get_rcu*, only 11 of them use dma_fence_get_rcu_safe().
> > >> It's likely there bear traps in DRM and related subsystems just wait=
ing
> > >> for someone to accidentally step in them.
> > >
> > > ...because dma_fence_get_rcu_safe apears to be about whether the
> > > *pointer* to the fence itself is rcu protected, not about the fence
> > > object itself.
> >
> > Yes, exactly that.

The fact that both of you think this either means that I've completely
missed what's going on with RCUs here (possible but, in this case, I
think unlikely) or RCUs on dma fences should scare us all.  Yes, it
protects against races on the dma_fence pointer itself.  However,
whether or not that dma_fence pointer lives in RCU-protected memory is
immaterial AFAICT.  It also does magic to deal with
SLAB_TYPESAFE_BY_RCU.  Let's walk through it.  Please tell me if/where
I go off the rails.

First, let's set the scenario:  The race this is protecting us against
(I think) is where someone else comes along and swaps out the pointer
we're trying to fetch for NULL or a different one and then drops the
last reference.

First, before we get to dma_fence_get_rcu_safe(), the caller has taken
an RCU read lock.  Then we get into the function

    fence =3D rcu_dereference(*fencep);
    if (!fence)
        return NULL;

First, we dereference fencep and grab the pointer.  There's an
rcu_dereference() here which does the usual RCU magic (which I don't
fully understand yet) to turn an __rcu pointer into a "real" pointer.
It's possible that the pointer is NULL, if so we bail.  We may have
lost the race or it could be the the pointer was NULL the whole time.
Doesn't matter.

    if (!dma_fence_get_rcu(fence))
        continue;

This attempts to get a reference and, if it fails continues.  More on
the continue later.  For now, let's dive into dma_fence_get()

    if (kref_get_unless_zero(&fence->refcount))
        return fence;
    else
        return NULL;

So we try to get a reference unless it's zero.  This is a pretty
standard pattern and, if the dma_fence was freed with kfree_rcu(),
would be all we need.  If the reference count on the dma_fence drops
to 0 and then the dma_fence is freed with kfree_rcu, we're guaranteed
that there is an RCU grace period between when the reference count
hits 0 and the memory is reclaimed.  Since all this happens inside the
RCU read lock, if we raced with someone attempting to swap out the
pointer and drop the reference count to zero, we have one of two
cases:

 1. We get the old pointer but successfully take a reference.  In this
case, it's the same as if we were called a few cycles earlier and
straight-up won the race.  We get the old pointer and, because we now
have a reference, the object is never freed.

 2. We get the old pointer but refcount is already zero by the time we
get here.  In this case, kref_get_unless_zero() returns false and
dma_fence_get_rcu() returns NULL.

If these were the only two cases we cared about, all of
dma_fence_get_rcu_safe() could be implemented as follows:

static inline struct dma_fence *
dma_fence_get_rcu_safe(struct dma_fence **fencep)
{
    struct dma_fence *fence;

    fence =3D rcu_dereference(*fencep);
    if (fence)
        fence =3D dma_fence_get_rcu(fence);

    return fence;
}

and we we'd be done.  The case the above code doesn't handle is if the
thing we're racing with swaps it to a non-NULL pointer.  To handle
that case, we throw a loop around the whole thing as follows:

static inline struct dma_fence *
dma_fence_get_rcu_safe(struct dma_fence **fencep)
{
    struct dma_fence *fence;

    do {
        fence =3D rcu_dereference(*fencep);
        if (!fence)
            return NULL;

        fence =3D dma_fence_get_rcu(fence);
    } while (!fence);

    return fence;
}

Ok, great, we've got an implementation, right?  Unfortunately, this is
where SLAB_TYPESAFE_BY_RCU crashes the party.  The giant disclaimer
about SLAB_TYPESAFE_BY_RCU is that memory gets recycled immediately
and doesn't wait for an RCU grace period.  You're guaranteed that
memory exists at that pointer so you won't get a nasty SEGFAULT and
you're guaranteed that the memory is still a dma_fence, but you're not
guaranteed anything else.  In particular, there's a 3rd case:

 3. We get an old pointer but it's been recycled and points to a
totally different dma_fence whose reference count is non-zero.  In
this case, rcu_dereference returns non-null and kref_get_unless_zero()
succeeds but we still managed to end up with the wrong fence.

To deal with 3, we do this:

    /* The atomic_inc_not_zero() inside dma_fence_get_rcu()
     * provides a full memory barrier upon success (such as now).
     * This is paired with the write barrier from assigning
     * to the __rcu protected fence pointer so that if that
     * pointer still matches the current fence, we know we
     * have successfully acquire a reference to it. If it no
     * longer matches, we are holding a reference to some other
     * reallocated pointer. This is possible if the allocator
     * is using a freelist like SLAB_TYPESAFE_BY_RCU where the
     * fence remains valid for the RCU grace period, but it
     * may be reallocated. When using such allocators, we are
     * responsible for ensuring the reference we get is to
     * the right fence, as below.
     */
    if (fence =3D=3D rcu_access_pointer(*fencep))
        return rcu_pointer_handoff(fence);

    dma_fence_put(fence);

We dereference fencep one more time and check to ensure that the
pointer we fetched at the start still matches.  There are some serious
memory barrier tricks going on here.  In particular, we're depending
on the fact that kref_get_unless_zero() does an atomic which means a
memory barrier between when the other thread we're racing with swapped
out the pointer and when the atomic happened.  Assuming that the other
thread swapped out the pointer BEFORE dropping the reference, we can
detect the recycle race with this pointer check.  If this last check
succeeds, we return the fence.  If it fails, then we ended up with the
wrong dma_fence and we drop the reference we acquired above and try
again.

Again, the important issue here that causes problems is that there's
no RCU grace period between the kref hitting zero and the dma_fence
being recycled.  If a dma_fence is freed with kfree_rcu(), we have
such a grace period and it's fine.  If we recycling, we can end up in
all sorts of weird corners if we're not careful to ensure that the
fence we got is the fence we think we got.

Before I move on, there's one more important point:  This can happen
without SLAB_TYPESAFE_BY_RCU.  Really, any dma_fence recycling scheme
which doesn't ensure an RCU grace period between keref->zero and
recycle will run afoul of this.  SLAB_TYPESAFE_BY_RCU just happens to
be the way i915 gets into this mess.

> We do leak, and badly. Any __rcu protected fence pointer where a
> shared fence could show up is affected. And the point of dma_fence is
> that they're shareable, and we're inventing ever more ways to do so
> (sync_file, drm_syncobj, implicit fencing maybe soon with
> import/export ioctl on top, in/out fences in CS ioctl, atomic ioctl,
> ...).
>
> So without a full audit anything that uses the following pattern is
> probably busted:
>
> rcu_read_lock();
> fence =3D rcu_dereference();
> fence =3D dma_fence_get_rcu();
> rcu_read_lock();
>
> /* use the fence now that we acquired a full reference */
>
> And I don't mean "you might wait a bit too much" busted, but "this can
> lead to loops in the dma_fence dependency chain, resulting in
> deadlocks" kind of busted.

Yup.

> What's worse, the standard rcu lockless
> access pattern is also busted completely:
>
> rcu_read_lock();
> fence =3D rcu_derefence();
> /* locklessly check the state of fence */
> rcu_read_unlock();

Yeah, this one's broken too.  It depends on what you're doing with
that state just how busted and what that breakage costs you but it's
definitely busted.

> because once you have TYPESAFE_BY_RCU rcu_read_lock doesn't prevent a
> use-after-free anymore. The only thing it guarantees is that your
> fence pointer keeps pointing at either freed memory, or a fence, but
> nothing else. You have to wrap your rcu_derefence and code into a
> seqlock of some kind, either a real one like dma_resv, or an
> open-coded one like dma_fence_get_rcu_safe uses. And yes the latter is
> a specialized seqlock, except it fails to properly document in
> comments where all the required barriers are.
>
> tldr; all the code using dma_fence_get_rcu needs to be assumed to be brok=
en.
>
> Heck this is fragile and tricky enough that i915 shot its own leg off
> routinely (there's a bugfix floating around just now), so not even
> internally we're very good at getting this right.
>
> > > If one has a stable pointer to a fence dma_fence_get_rcu is I think
> > > enough to deal with SLAB_TYPESAFE_BY_RCU used by i915_request (as dma
> > > fence is a base object there). Unless you found a bug in rq field
> > > recycling. But access to the dma fence is all tightly controlled so I
> > > don't get what leaks.
> > >
> > >> This patch series stops us using SLAB_TYPESAFE_BY_RCU for i915_reque=
st
> > >> and, instead, does an RCU-safe slab free via rcu_call().  This shoul=
d
> > >> let us keep most of the perf benefits of slab allocation while avoid=
ing
> > >> the bear traps inherent in SLAB_TYPESAFE_BY_RCU.  It then removes
> > >> support
> > >> for SLAB_TYPESAFE_BY_RCU from dma_fence entirely.
> > >
> > > According to the rationale behind SLAB_TYPESAFE_BY_RCU traditional RC=
U
> > > freeing can be a lot more costly so I think we need a clear
> > > justification on why this change is being considered.
> >
> > The problem is that SLAB_TYPESAFE_BY_RCU requires that we use a sequenc=
e
> > counter to make sure that we don't grab the reference to a reallocated
> > dma_fence.
> >
> > Updating the sequence counter every time we add a fence now means two
> > additions writes and one additional barrier for an extremely hot path.
> > The extra overhead of RCU freeing is completely negligible compared to =
that.
> >
> > The good news is that I think if we are just a bit more clever about ou=
r
> > handle we can both avoid the sequence counter and keep
> > SLAB_TYPESAFE_BY_RCU around.

We're already trying to do handle cleverness as described above.  But,
as Daniel said and I put in some commit message, we're probably only
doing it in about 1/3 of the places we need to be.

> You still need a seqlock, or something else that's serving as your
> seqlock. dma_fence_list behind a single __rcu protected pointer, with
> all subsequent fence pointers _not_ being rcu protected (i.e. full
> reference, on every change we allocate might work. Which is a very
> funny way of implementing something like a seqlock.
>
> And that only covers dma_resv, you _have_ to do this _everywhere_ in
> every driver. Except if you can proof that your __rcu fence pointer
> only ever points at your own driver's fences.
>
> So unless you're volunteering to audit all the drivers, and constantly
> re-audit them (because rcu only guaranteeing type-safety but not
> actually preventing use-after-free is very unusual in the kernel) just
> fixing dma_resv doesn't solve the problem here at all.
>
> > But this needs more code cleanup and abstracting the sequence counter
> > usage in a macro.
>
> The other thing is that this doesn't even make sense for i915 anymore.

I'm not sure I'd go that far.  Yes, we've got the ULLS hack but
i915_request is going to stay around for a while.  What's really
overblown here is the bazillions of requests.  GL drivers submit tens
or maybe 100ish batches per frame.  Media has to ping-pong a bit more
but it should still be < 1000/second.  If we're really
dma_fence_release-bound, we're in a microbenchmark.

--Jason

> The solution to the "userspace wants to submit bazillion requests"
> problem is direct userspace submit. Current hw doesn't have userspace
> ringbuffer, but we have a pretty clever trick in the works to make
> this possible with current hw, essentially by submitting a CS that
> loops on itself, and then inserting batches into this "ring" by
> latching a conditional branch in this CS. It's not pretty, but it gets
> the job done and outright removes the need for plaid mode throughput
> of i915_request dma fences.
> -Daniel
>
> >
> > Regards,
> > Christian.
> >
> >
> > >
> > > Regards,
> > >
> > > Tvrtko
> > >
> > >>
> > >> Note: The last patch is labled DONOTMERGE.  This was at Daniel Vette=
r's
> > >> request as we may want to let this bake for a couple releases before=
 we
> > >> rip out dma_fence_get_rcu_safe entirely.
> > >>
> > >> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > >> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > >> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > >> Cc: Dave Airlie <airlied@redhat.com>
> > >> Cc: Matthew Auld <matthew.auld@intel.com>
> > >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > >>
> > >> Jason Ekstrand (5):
> > >>    drm/i915: Move intel_engine_free_request_pool to i915_request.c
> > >>    drm/i915: Use a simpler scheme for caching i915_request
> > >>    drm/i915: Stop using SLAB_TYPESAFE_BY_RCU for i915_request
> > >>    dma-buf: Stop using SLAB_TYPESAFE_BY_RCU in selftests
> > >>    DONOTMERGE: dma-buf: Get rid of dma_fence_get_rcu_safe
> > >>
> > >>   drivers/dma-buf/dma-fence-chain.c         |   8 +-
> > >>   drivers/dma-buf/dma-resv.c                |   4 +-
> > >>   drivers/dma-buf/st-dma-fence-chain.c      |  24 +---
> > >>   drivers/dma-buf/st-dma-fence.c            |  27 +---
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |   4 +-
> > >>   drivers/gpu/drm/i915/gt/intel_engine_cs.c |   8 --
> > >>   drivers/gpu/drm/i915/i915_active.h        |   4 +-
> > >>   drivers/gpu/drm/i915/i915_request.c       | 147 ++++++++++++------=
----
> > >>   drivers/gpu/drm/i915/i915_request.h       |   2 -
> > >>   drivers/gpu/drm/i915/i915_vma.c           |   4 +-
> > >>   include/drm/drm_syncobj.h                 |   4 +-
> > >>   include/linux/dma-fence.h                 |  50 --------
> > >>   include/linux/dma-resv.h                  |   4 +-
> > >>   13 files changed, 110 insertions(+), 180 deletions(-)
> > >>
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
