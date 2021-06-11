Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D31C3A3CEC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 09:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4128F6EE37;
	Fri, 11 Jun 2021 07:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D227A6EE37
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 07:20:29 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 q5-20020a9d66450000b02903f18d65089fso2246900otm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 00:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w5HyaKYivQFcFw1U+P76u7yYOY+bmlNhq/7Cu37pQzg=;
 b=XQFok8n/YoB6+e+VNVPr4XQg6LHI8vFe41OI7z0ih42eB7l35kcKT8wPIY2dEiWCLr
 4Ggi7d8yn6PPEdhpwn3Cep3FE4/9Sx5W0yqHN2Kzmc72BHVdVKNHtmG4QQMloz/Nk7iw
 H9bcYtHxI35Ny8NWeRUkuLUo3X20EL5GR/jg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w5HyaKYivQFcFw1U+P76u7yYOY+bmlNhq/7Cu37pQzg=;
 b=O5Ill7n1Iu255ByPZ25SlLEVhvgobcdhf7FeQ7MLru+YrYpX6ct1jGp3oE/slr7Kjl
 JrAROR3+kfUQ1ZcvmFiveyVnAMzy/Ztklz7vbn/ocC4zcK5hoybVCXP+c938lEQbzzDi
 Sv4gg3R2WHW/gpbFJLXbGVDkH6Wknw9Nhk4s7HtJXnrJvRbQvSyxoqKTqaSALD2esHZC
 Lnqa4IDmK84FTQAkSb0Y/mlHf5Ne23KGu21St0leE7ic6q2L65QARpnqLGeAbxg0MEyK
 6aOzNY0joqtqE4k7/fL7oYDw+NNaFRBttgcJlWybAhaQmFun4MWRILM2WQgqLd+3fFf5
 5v3g==
X-Gm-Message-State: AOAM531SIGzBBHpGvX6cvapsTl0ieqiH/YXfeS1QRz1Dt7iWYfwYybtV
 HIqCNBxM8/VmqMTSX5dEMsy4ZzGZzWJuo6cwb24IyQ==
X-Google-Smtp-Source: ABdhPJzan3hmIml4LcasIpd+AlGk0JW41U0gOj2iy0uPT94lIx5qdNAs1mivmwjq0HYHscMyGKOhgCEuBHlUrtUPV+4=
X-Received: by 2002:a05:6830:2370:: with SMTP id
 r16mr1897455oth.188.1623396029066; 
 Fri, 11 Jun 2021 00:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <ae289388-911f-2928-d695-050863ee1007@linux.intel.com>
 <f9be43e3-4107-3742-a11b-8021b2c19e32@amd.com>
 <CAKMK7uFMEdFjUSphcyxuKMW8HfLOWQAE2iw-Fei+SRTDwUbRdQ@mail.gmail.com>
 <CAOFGe95BhZ7jXLxarL=2_zNYDydEoPJWnDWAG3aaeEJsDzR5dA@mail.gmail.com>
 <CAOFGe96KrBfvBKxcUNwths5Sigk7fk7ycLeYbgxutL3msEgfyA@mail.gmail.com>
 <CAKMK7uGqGLKFp7Obp-5xW3fPuoRmBa_0OawN-4Q-niDi147tXQ@mail.gmail.com>
 <4dc8314b-4366-2d92-4cca-1497a7c73721@amd.com>
In-Reply-To: <4dc8314b-4366-2d92-4cca-1497a7c73721@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 11 Jun 2021 09:20:17 +0200
Message-ID: <CAKMK7uHhL3kepoaznCvAsx8H20sBjWQZgsnWY+zm63KgfCA4CQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/5] dma-fence, i915: Stop allowing
 SLAB_TYPESAFE_BY_RCU for dma_fence
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
 Matthew Auld <matthew.auld@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 8:55 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 10.06.21 um 22:42 schrieb Daniel Vetter:
> > On Thu, Jun 10, 2021 at 10:10 PM Jason Ekstrand <jason@jlekstrand.net> =
wrote:
> >> On Thu, Jun 10, 2021 at 8:35 AM Jason Ekstrand <jason@jlekstrand.net> =
wrote:
> >>> On Thu, Jun 10, 2021 at 6:30 AM Daniel Vetter <daniel.vetter@ffwll.ch=
> wrote:
> >>>> On Thu, Jun 10, 2021 at 11:39 AM Christian K=C3=B6nig
> >>>> <christian.koenig@amd.com> wrote:
> >>>>> Am 10.06.21 um 11:29 schrieb Tvrtko Ursulin:
> >>>>>> On 09/06/2021 22:29, Jason Ekstrand wrote:
> >>>>>>> We've tried to keep it somewhat contained by doing most of the ha=
rd work
> >>>>>>> to prevent access of recycled objects via dma_fence_get_rcu_safe(=
).
> >>>>>>> However, a quick grep of kernel sources says that, of the 30 inst=
ances
> >>>>>>> of dma_fence_get_rcu*, only 11 of them use dma_fence_get_rcu_safe=
().
> >>>>>>> It's likely there bear traps in DRM and related subsystems just w=
aiting
> >>>>>>> for someone to accidentally step in them.
> >>>>>> ...because dma_fence_get_rcu_safe apears to be about whether the
> >>>>>> *pointer* to the fence itself is rcu protected, not about the fenc=
e
> >>>>>> object itself.
> >>>>> Yes, exactly that.
> >>> The fact that both of you think this either means that I've completel=
y
> >>> missed what's going on with RCUs here (possible but, in this case, I
> >>> think unlikely) or RCUs on dma fences should scare us all.
> >> Taking a step back for a second and ignoring SLAB_TYPESAFE_BY_RCU as
> >> such,  I'd like to ask a slightly different question:  What are the
> >> rules about what is allowed to be done under the RCU read lock and
> >> what guarantees does a driver need to provide?
> >>
> >> I think so far that we've all agreed on the following:
> >>
> >>   1. Freeing an unsignaled fence is ok as long as it doesn't have any
> >> pending callbacks.  (Callbacks should hold a reference anyway).
> >>
> >>   2. The pointer race solved by dma_fence_get_rcu_safe is real and
> >> requires the loop to sort out.
> >>
> >> But let's say I have a dma_fence pointer that I got from, say, calling
> >> dma_resv_excl_fence() under rcu_read_lock().  What am I allowed to do
> >> with it under the RCU lock?  What assumptions can I make?  Is this
> >> code, for instance, ok?
> >>
> >> rcu_read_lock();
> >> fence =3D dma_resv_excl_fence(obj);
> >> idle =3D !fence || test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags=
);
> >> rcu_read_unlock();
> >>
> >> This code very much looks correct under the following assumptions:
> >>
> >>   1. A valid fence pointer stays alive under the RCU read lock
> >>   2. SIGNALED_BIT is set-once (it's never unset after being set).
> >>
> >> However, if it were, we wouldn't have dma_resv_test_singnaled(), now
> >> would we? :-)
> >>
> >> The moment you introduce ANY dma_fence recycling that recycles a
> >> dma_fence within a single RCU grace period, all your assumptions break
> >> down.  SLAB_TYPESAFE_BY_RCU is just one way that i915 does this.  We
> >> also have a little i915_request recycler to try and help with memory
> >> pressure scenarios in certain critical sections that also doesn't
> >> respect RCU grace periods.  And, as mentioned multiple times, our
> >> recycling leaks into every other driver because, thanks to i915's
> >> choice, the above 4-line code snippet isn't valid ANYWHERE in the
> >> kernel.
> >>
> >> So the question I'm raising isn't so much about the rules today.
> >> Today, we live in the wild wild west where everything is YOLO.  But
> >> where do we want to go?  Do we like this wild west world?  So we want
> >> more consistency under the RCU read lock?  If so, what do we want the
> >> rules to be?
> >>
> >> One option would be to accept the wild-west world we live in and say
> >> "The RCU read lock gains you nothing.  If you want to touch the guts
> >> of a dma_fence, take a reference".  But, at that point, we're eating
> >> two atomics for every time someone wants to look at a dma_fence.  Do
> >> we want that?
> >>
> >> Alternatively, and this what I think Daniel and I were trying to
> >> propose here, is that we place some constraints on dma_fence
> >> recycling.  Specifically that, under the RCU read lock, the fence
> >> doesn't suddenly become a new fence.  All of the immutability and
> >> once-mutability guarantees of various bits of dma_fence hold as long
> >> as you have the RCU read lock.
> > Yeah this is suboptimal. Too many potential bugs, not enough benefits.
> >
> > This entire __rcu business started so that there would be a lockless
> > way to get at fences, or at least the exclusive one. That did not
> > really pan out. I think we have a few options:
> >
> > - drop the idea of rcu/lockless dma-fence access outright. A quick
> > sequence of grabbing the lock, acquiring the dma_fence and then
> > dropping your lock again is probably plenty good. There's a lot of
> > call_rcu and other stuff we could probably delete. I have no idea what
> > the perf impact across all the drivers would be.
>
> The question is maybe not the perf impact, but rather if that is
> possible over all.
>
> IIRC we now have some cases in TTM where RCU is mandatory and we simply
> don't have any other choice than using it.

Adding Thomas Hellstrom.

Where is that stuff? If we end up with all the dma_resv locking
complexity just for an oddball, then I think that would be rather big
bummer.

> > - try to make all drivers follow some stricter rules. The trouble is
> > that at least with radeon dma_fence callbacks aren't even very
> > reliable (that's why it has its own dma_fence_wait implementation), so
> > things are wobbly anyway.
> >
> > - live with the current situation, but radically delete all unsafe
> > interfaces. I.e. nothing is allowed to directly deref an rcu fence
> > pointer, everything goes through dma_fence_get_rcu_safe. The
> > kref_get_unless_zero would become an internal implementation detail.
> > Our "fast" and "lockless" dma_resv fence access stays a pile of
> > seqlock, retry loop and an a conditional atomic inc + atomic dec. The
> > only thing that's slightly faster would be dma_resv_test_signaled()
> >
> > - I guess minimally we should rename dma_fence_get_rcu to
> > dma_fence_tryget. It has nothing to do with rcu really, and the use is
> > very, very limited.
>
> I think what we should do is to use RCU internally in the dma_resv
> object but disallow drivers/frameworks to mess with that directly.
>
> In other words drivers should use one of the following:
> 1. dma_resv_wait_timeout()
> 2. dma_resv_test_signaled()
> 3. dma_resv_copy_fences()
> 4. dma_resv_get_fences()
> 5. dma_resv_for_each_fence() <- to be implemented
> 6. dma_resv_for_each_fence_unlocked() <- to be implemented
>
> Inside those functions we then make sure that we only save ways of
> accessing the RCU protected data structures.
>
> This way we only need to make sure that those accessor functions are
> sane and don't need to audit every driver individually.

Yeah better encapsulation for dma_resv sounds like a good thing, least
for all the other issues we've been discussing recently. I guess your
list is also missing the various "add/replace some more fences"
functions, but we have them already.

> I can tackle implementing for the dma_res_for_each_fence()/_unlocked().
> Already got a large bunch of that coded out anyway.

When/where do we need ot iterate over fences unlocked? Given how much
pain it is to get a consistent snapshot of the fences or fence state
(I've read  the dma-buf poll implementation, and it looks a bit buggy
in that regard, but not sure, just as an example) and unlocked
iterator sounds very dangerous to me.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
