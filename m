Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C3439DFFC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 17:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D64E6E8EF;
	Mon,  7 Jun 2021 15:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036566E8EF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 15:09:40 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l2so18063948wrw.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 08:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vZ63pomolCNygXxUrLgoBaK4K7VhK2/PKb67eARr/lE=;
 b=Fgb1nlIclnde1N05lNXzDzRli/clRDImBaJd2TRGdNqjIthgWjUX9ztjNmWTGvd8+Y
 ggYXO77XUyiYq/kZCUAA3On5cQrZkpOoUpz3rhn2nJYbsJi95c63pOHtjA5XnyZbRmGA
 RgdPtmbVdVv99LxA88lAWqp30ytCQ0SosGOYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vZ63pomolCNygXxUrLgoBaK4K7VhK2/PKb67eARr/lE=;
 b=qtK7gRNjsvT9QvoSnc4qRzrrkfRK/UbnuF26kc1wzwzEYE+el5PNysLUy+PDWURh5V
 j1uFPvD+jomYOqZ0ef3zpg/LwrEB7KgedxYany0qeme2q5py9xJp2xekA7pWwPpzLHFq
 W6PpeCL4MtJeJbeb4jsw0D1eyRsza7MnBnm43IbgMZPgtd8jqkVZFXrFTDAl0lVUepYn
 Yba1j34KrQWBEwrgcD2H3xSeyrnLxJ2dEpJ/SrW0tHUFiIsXuV0KVuXqWuj1XISelzQO
 C/jnRLSwJzF2BK0T/lLEIdDSUV7+MGNDS3spH936gxgkDxKteqb/iGOmuFyIzXC48n92
 m1Ww==
X-Gm-Message-State: AOAM533Zf9okDUNrnyRgltuaoUaw14aeMmVeWiuIr98N8kEhPbEh0erV
 /PzRzJHHOQsLKbx+WOTIjgPIhg==
X-Google-Smtp-Source: ABdhPJwpTjz4rsLcCcdGyJudkbnS+bpUSHTDcVO4HatKe7Fprlaz3xqqGHQpFPUcjiYiGlxPOOl1gA==
X-Received: by 2002:adf:ee52:: with SMTP id w18mr17686636wro.37.1623078579529; 
 Mon, 07 Jun 2021 08:09:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p16sm16843952wrs.52.2021.06.07.08.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 08:09:38 -0700 (PDT)
Date: Mon, 7 Jun 2021 17:09:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: handle exclusive fence similar to shared ones
Message-ID: <YL42scoTq8RUuEkD@phenom.ffwll.local>
References: <20210606100312.119176-1-christian.koenig@amd.com>
 <CAKMK7uGX7z2KdymWus2fk9VR57wU+Rj4jcS0j=j_sYwaH8zrLg@mail.gmail.com>
 <3fdb2dbe-748b-5297-277f-6a8394100725@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fdb2dbe-748b-5297-277f-6a8394100725@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 07, 2021 at 11:59:11AM +0200, Christian König wrote:
> Am 07.06.21 um 10:58 schrieb Daniel Vetter:
> > Hi Christian,
> > 
> > So unfortunately I got distracted with some i915 bugs and fun last
> > week completely, so didn't get around to it.
> > 
> > On Sun, Jun 6, 2021 at 12:03 PM Christian König
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > Hi Daniel,
> > > 
> > > as discussed here are the patches which change the handle around exclusive fence handling.
> > > 
> > > The main problem seems to have been the dma_resv_test_signaled() function which ignored the exclusive fence when shared fences where present. This was already rather inconsistent since dma_fence_wait_timeout() takes the exclusive one into account even if shared ones are present.
> > > 
> > > The second patch then fixes nouveu to also always take the exclusive fence into account.
> > > 
> > > The third then removes the workaround in amdgpu around the VM page table clearing handling. Since I'm not sure if there are no other places which relies on the existing behavior I will hold this one back for a while.
> > > 
> > > Is that what you had in mind as well?
> > I think from the semantics something where we treat the exclusive
> > fence as an IPC mechanism that the kernel doesn't care much about
> > (exceptions apply), and but more consistently count all access from
> > any CS as a shared fence. So in a way what you've done here, and also
> > what you've done in the earlier series with setting the read/write
> > flags on shared fences.
> 
> Yeah, I think that this will work for me as well.
> 
> > For actual approach what I've picked is a bit of what amdgpu does +
> > what other drivers do with NO_IMPLICIT, but with the bugs fixed
> > (there's a bunch of them): Essentially we try to always set the shared
> > fences, and exclusive fences are set additionally on top when the
> > implicit sync IPC calls for that. And on the depdendency side we do
> > clever logic to only take in the exclusive fence when required.
> > Currently for amdgpu this means introspecting the fence owner (there's
> > some nasty tricks there I think to do to make this work and not be a
> > security bug), for others that's done with the NO_IMPLICIT flag (but
> > again some nasty corners there, which I think a bunch of drivers get
> > wrong).
> 
> For amdgpu I have been pondering on the following idea  last week to make it
> behave the same as the other drivers:
> 
> 1. We allow setting the explicit fence without touching the shared fences.
>     As far as I understand it this is also part of your idea above.
> 
> 2. During command submission amdgpu uses a dma_fence_chain node to chain
> together the new CS with the existing explicit sync.
> 
> 3. During command synchronization amdgpu takes a look at the explicit fence
> and walks the dma_fence_chain history.
>     Submissions from the same process (the owner) are not synced to (e.g.
> same behavior as of today), but as soon as we see something which doesn't
> fit into the amdgpu CS model we sync to the remaining chain.
> 
> That would give us both keeping the current amdgpu CS behavior (which we
> then can extend) as well as setting the explicit fence according to the
> DMA-buf rules.

So what I had in mind is:

1. we reserve 3 additional shared slots (so one more than currently)

2. when we pull in depedencies we ignore exclusive fences when they're an
amdgpu/amdkfd one, only when it's a OWNER_UNKNOWN do we take it

3. above obviously breaks buffer moves, to fix that we always add the
ttm_bo->moving fence. If amggpu would support a "ignore implicit fencing"
flag like other drivers with NO_IMPLICIT, then we'd also need to overrule
that for a dynamically shared dma-buf (since for those we don't have a
->moving fence slot). Non-dynamic dma-buf aren't a problem since they are
guaranteed to be pinned, so can't move.

4. When we add fences we
- always add the exclusive fence (like in my patch)
- keep the current set of shared fences
- add our own fences also as a shared one (so that amdpug can ignore the
  exclusive fence for any sync against amdgpu, whether same owner or other
  owner). This is the critical piece to make sure the current uapi for
  amdgpu isn't changed
- add the previous exclusive fence if a) there is one and b) it's not an
  amdgpu/kfd one. This is where we need the additional fence slot

At first glance this throws away foreign exclusive fences, which could
break implicit sync. But by moving foreign exclusive fences to the shared
slot, we can rely on the amdgpu implicit sync logic of only looking at the
owner (and not whether a fence is exclusive of shared), and we get the
right implicit fencing even on subsequent CS.

And for foreign drivers it also all works, because the exlusive fence is
always set, and because amdgpu doesn't ignore foreign fences (even if
they're set as shared we force a sync iirc) there's a dependency chain
that makes sure everything is correct and ordered. Same for dma-buf
poll/sync_file export, that would then work on amdgpu correctly too
because the exclusive slot is set.

The only downside here is that amdgpu always sets the exclusive fence
slot, but that can't be fixed without an uapi revision since the kernel
simply doesn't know that. But amdgpu isn't the only driver, panfrost does
the same so *shrugh*.

So I think this should work but
- it's a hellalot of auditing to make sure I didn't miss anything
- and it's like attempt no 5 or so of me trying to slice this knot without
  breaking anything, or changing the current dma_resv rules.

> > There's two reasons I'm more leaning in that direction:
> > - The annoying thing is that the audit on the dependency side is a lot
> > trickier since everyone rolls their own dependency handling.
> 
> Yes, absolutely agree. That's why I said we need to have use case based
> functionality here.
> 
> In other words what we need is something like an
> dma_resv_for_each_sync_fence(for_write) macro.
> 
> E.g. drivers then only do something like:
> 
> dma_resv_for_each_sync_fence(resv, for_write, fence)
>     driver_specific_syncing_to_fence(fence);
> 
> And not every driver calling the underlying functions on it's own and then
> doing whatever it pleases.

Yeah, but amdgpu can't use those, so we're back to square one. amdgpu
currently has zero information from userspace about which CS are writes
and which are not. Other drivers (aside from panfrost) generally have
that, so they can do smarter things here.

Also we could fairly trivially fix this by adding new uapi so that amdgpu
would know this, and just oversyncing on old uerspace. But you made it
pretty clear when I proposed that that this option isn't on the table.

So for now we need to be more clever to get amdgpu aligned. And then when
that's done we (well you guys, maybe using the patches from Jason + a CS
flag to not do implicit sync at all) can add the uapi to make this
smarter.

Then, and only then, do we have the pieces to look into smarter/use-case
dependent dma_resv helpers.

Also, some of these helpers already exist, and are used by the drivers
derived from v3d. But amdgpu can't use them, because the "just oversync
for current userspace" approach you nacked. So you'll have to live with
your own quirks. I don't want to make helpers for that because then other
drivers might come up with the idea to use them :-)

> > If we don't change (for now at least) the rules around dma_resv then an
> > oversight in the audit isn't going to be a huge problem.
> > - Wording becomes inconsistent: An exclusive fence which is also a
> > shared is a bit confusing. I think it's better if we stick to the
> > current rules for dma_resv, change the semantics we want in drivers (I
> > think that's doable, at maybe some code cost e.g. Jason's import ioctl
> > would be simpler with your changed rules, but still doable with the
> > current dma_resv rules). And then when we have that, we figure out
> > what to change with the dma_resv struct/rules.
> 
> But then at least do the minimal change so that we can get amdgpu in line
> with all other drivers like I outlined above.
> 
> We can keep that as a hack in amdgpu if that makes you feel better. Chaining
> the exclusive fence together is roughly 4 times slower than the shared
> approach, but I think that this is negligible compared to all the other
> stuff we do.

Yeah I was pondering on the chaining, and for the intentional sync it's
not a problem because it's just 1 winsys buffer we touch like this. So
totally fine in Jason's approach. But not for amdgpu, where with the
current uapi means you have to annotate _all_ buffers as written to.

So not great, and which is why I've thrown a few variants of this idea out
already as unpractical. Hence the current idea I'm toying with above.

Cheers, Daniel


> 
> Regards,
> Christian.
> 
> > Wrt the patches: Good thing is that what you change here and what I've
> > found thus far is 100% not overlapping, so at least we didn't waste
> > time auditing the same code :-)
> > 
> > Cheers, Daniel
> > > Regards,
> > > Christian.
> > > 
> > > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
