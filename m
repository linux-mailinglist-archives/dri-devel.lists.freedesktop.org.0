Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F00543A3508
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 22:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C79A6EDDD;
	Thu, 10 Jun 2021 20:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D1D6EDDC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 20:42:49 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 6-20020a9d07860000b02903e83bf8f8fcso978639oto.12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3MteMUmpbOhv5skxW3ZChFAKsrp5eoLJOhSTSRIlg8A=;
 b=LMgGpM5wo/Fqto1RB0jmfkjSUlY6Y5O3sVD/2KLe7oIr7kCJ1QMFVpSdpbrM28Syzm
 8TuhVvQu+g3J6zr07q5fyHwvgCPrE97dfDX5PQyk1yi4vqs47LUC5kgPgrP4t+kykLWB
 a/pxAoxxFFl/f+o2UfgG11d6KXwVCMlxYJYNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3MteMUmpbOhv5skxW3ZChFAKsrp5eoLJOhSTSRIlg8A=;
 b=f+qzqWW3nQy7u7J7jQZnQfjUj8Rx1x2DDoBcv/Gal86JzUjtdpYFsMJtxEH1cszJqZ
 pjKj+ZQ7FWU8vpeOQwPXovJjNApqt4hXLMr1Ilhfw/Xc1XHcdwZlIQDHJjiQvsl5yam1
 JV+CzC9BIe27NmyFjG84v3uyddiw0xPoXIkzIfYkQCyu6KSmwrhp9FN3KS80V2FrU4fV
 3oi/1BcGd5nZF1UUlVZ3QwZOfiDM1F4qM5ZsDHX6EJ9EQhw+JdUeViZVF6zNRNmIHGku
 IIuKK0ge6KuFlkGqS2HO5tZC5lEaYijIMvB/lDEMmlmFxJyHp4FEnUvKT0yhQDOt4akT
 dnyg==
X-Gm-Message-State: AOAM530rtKsVfP+Jq/YAVy1H/bJYyjrtcN9MxfyT0OoAiN2gWrmG3QEV
 rRSftDlQl4/K7mT2QzLj7eog3x76PYdOIvP4iOETxA==
X-Google-Smtp-Source: ABdhPJzSDKdq4MUnQpGarh3SOEwvktAtLgAz7jqCDG5WY2Rg7/mzkfLC17VBf30qhwbJT152N0HlzRRnAmolrQLtNWI=
X-Received: by 2002:a9d:12eb:: with SMTP id g98mr179122otg.303.1623357768536; 
 Thu, 10 Jun 2021 13:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <ae289388-911f-2928-d695-050863ee1007@linux.intel.com>
 <f9be43e3-4107-3742-a11b-8021b2c19e32@amd.com>
 <CAKMK7uFMEdFjUSphcyxuKMW8HfLOWQAE2iw-Fei+SRTDwUbRdQ@mail.gmail.com>
 <CAOFGe95BhZ7jXLxarL=2_zNYDydEoPJWnDWAG3aaeEJsDzR5dA@mail.gmail.com>
 <CAOFGe96KrBfvBKxcUNwths5Sigk7fk7ycLeYbgxutL3msEgfyA@mail.gmail.com>
In-Reply-To: <CAOFGe96KrBfvBKxcUNwths5Sigk7fk7ycLeYbgxutL3msEgfyA@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 10 Jun 2021 22:42:36 +0200
Message-ID: <CAKMK7uGqGLKFp7Obp-5xW3fPuoRmBa_0OawN-4Q-niDi147tXQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/5] dma-fence, i915: Stop allowing
 SLAB_TYPESAFE_BY_RCU for dma_fence
To: Jason Ekstrand <jason@jlekstrand.net>
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

On Thu, Jun 10, 2021 at 10:10 PM Jason Ekstrand <jason@jlekstrand.net> wrot=
e:
>
> On Thu, Jun 10, 2021 at 8:35 AM Jason Ekstrand <jason@jlekstrand.net> wro=
te:
> > On Thu, Jun 10, 2021 at 6:30 AM Daniel Vetter <daniel.vetter@ffwll.ch> =
wrote:
> > > On Thu, Jun 10, 2021 at 11:39 AM Christian K=C3=B6nig
> > > <christian.koenig@amd.com> wrote:
> > > > Am 10.06.21 um 11:29 schrieb Tvrtko Ursulin:
> > > > > On 09/06/2021 22:29, Jason Ekstrand wrote:
> > > > >>
> > > > >> We've tried to keep it somewhat contained by doing most of the h=
ard work
> > > > >> to prevent access of recycled objects via dma_fence_get_rcu_safe=
().
> > > > >> However, a quick grep of kernel sources says that, of the 30 ins=
tances
> > > > >> of dma_fence_get_rcu*, only 11 of them use dma_fence_get_rcu_saf=
e().
> > > > >> It's likely there bear traps in DRM and related subsystems just =
waiting
> > > > >> for someone to accidentally step in them.
> > > > >
> > > > > ...because dma_fence_get_rcu_safe apears to be about whether the
> > > > > *pointer* to the fence itself is rcu protected, not about the fen=
ce
> > > > > object itself.
> > > >
> > > > Yes, exactly that.
> >
> > The fact that both of you think this either means that I've completely
> > missed what's going on with RCUs here (possible but, in this case, I
> > think unlikely) or RCUs on dma fences should scare us all.
>
> Taking a step back for a second and ignoring SLAB_TYPESAFE_BY_RCU as
> such,  I'd like to ask a slightly different question:  What are the
> rules about what is allowed to be done under the RCU read lock and
> what guarantees does a driver need to provide?
>
> I think so far that we've all agreed on the following:
>
>  1. Freeing an unsignaled fence is ok as long as it doesn't have any
> pending callbacks.  (Callbacks should hold a reference anyway).
>
>  2. The pointer race solved by dma_fence_get_rcu_safe is real and
> requires the loop to sort out.
>
> But let's say I have a dma_fence pointer that I got from, say, calling
> dma_resv_excl_fence() under rcu_read_lock().  What am I allowed to do
> with it under the RCU lock?  What assumptions can I make?  Is this
> code, for instance, ok?
>
> rcu_read_lock();
> fence =3D dma_resv_excl_fence(obj);
> idle =3D !fence || test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> rcu_read_unlock();
>
> This code very much looks correct under the following assumptions:
>
>  1. A valid fence pointer stays alive under the RCU read lock
>  2. SIGNALED_BIT is set-once (it's never unset after being set).
>
> However, if it were, we wouldn't have dma_resv_test_singnaled(), now
> would we? :-)
>
> The moment you introduce ANY dma_fence recycling that recycles a
> dma_fence within a single RCU grace period, all your assumptions break
> down.  SLAB_TYPESAFE_BY_RCU is just one way that i915 does this.  We
> also have a little i915_request recycler to try and help with memory
> pressure scenarios in certain critical sections that also doesn't
> respect RCU grace periods.  And, as mentioned multiple times, our
> recycling leaks into every other driver because, thanks to i915's
> choice, the above 4-line code snippet isn't valid ANYWHERE in the
> kernel.
>
> So the question I'm raising isn't so much about the rules today.
> Today, we live in the wild wild west where everything is YOLO.  But
> where do we want to go?  Do we like this wild west world?  So we want
> more consistency under the RCU read lock?  If so, what do we want the
> rules to be?
>
> One option would be to accept the wild-west world we live in and say
> "The RCU read lock gains you nothing.  If you want to touch the guts
> of a dma_fence, take a reference".  But, at that point, we're eating
> two atomics for every time someone wants to look at a dma_fence.  Do
> we want that?
>
> Alternatively, and this what I think Daniel and I were trying to
> propose here, is that we place some constraints on dma_fence
> recycling.  Specifically that, under the RCU read lock, the fence
> doesn't suddenly become a new fence.  All of the immutability and
> once-mutability guarantees of various bits of dma_fence hold as long
> as you have the RCU read lock.

Yeah this is suboptimal. Too many potential bugs, not enough benefits.

This entire __rcu business started so that there would be a lockless
way to get at fences, or at least the exclusive one. That did not
really pan out. I think we have a few options:

- drop the idea of rcu/lockless dma-fence access outright. A quick
sequence of grabbing the lock, acquiring the dma_fence and then
dropping your lock again is probably plenty good. There's a lot of
call_rcu and other stuff we could probably delete. I have no idea what
the perf impact across all the drivers would be.

- try to make all drivers follow some stricter rules. The trouble is
that at least with radeon dma_fence callbacks aren't even very
reliable (that's why it has its own dma_fence_wait implementation), so
things are wobbly anyway.

- live with the current situation, but radically delete all unsafe
interfaces. I.e. nothing is allowed to directly deref an rcu fence
pointer, everything goes through dma_fence_get_rcu_safe. The
kref_get_unless_zero would become an internal implementation detail.
Our "fast" and "lockless" dma_resv fence access stays a pile of
seqlock, retry loop and an a conditional atomic inc + atomic dec. The
only thing that's slightly faster would be dma_resv_test_signaled()

- I guess minimally we should rename dma_fence_get_rcu to
dma_fence_tryget. It has nothing to do with rcu really, and the use is
very, very limited.

Not sure what's a good idea here tbh.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
