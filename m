Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593EEA054B6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 08:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC47610E7F5;
	Wed,  8 Jan 2025 07:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J74plNu4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A6510E7F1;
 Wed,  8 Jan 2025 07:39:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CA7F55C3DD8;
 Wed,  8 Jan 2025 07:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4267C4CEE0;
 Wed,  8 Jan 2025 07:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736321944;
 bh=9JpopllONnBnaO2zazzax/ph9EPvvRuP1gFw4S4Mj94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J74plNu47cju+K9lAo4MPtIY9oBpX/QfCzhvR/xf+x5tu+JYv4G7a0Pdib4n91WLC
 b1sqRiOPI4RmG3smOGYfmUvjtlTJrKJnWlaFQLuASJQ6JQKjH42bBRByPPuVsFq/L4
 TatlOe4ZCHHN665xWzQhT+gHRLpcL6lyWTRfx8jDCCHBxXjB60ml3ZOxTKWJ58i4ja
 OaTcsrZdwi7PZvuVcbJ63pUCXCFktUmaTeQ+7STIIFbmJd31GSB4PmzzJwHmpel7bg
 gi4Q2xsDNA/2nHrdnl/aGSjlg6HQ5ZrRDIO197VdxSeflveCMeg/nQoT7qsNFRXQoA
 ELhXcBrAdEb2A==
Date: Wed, 8 Jan 2025 08:39:01 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH] nouveau/fence: handle cross device fences properly.
Message-ID: <Z34rleGXo15o9NXd@pollux>
References: <20250107055846.536589-1-airlied@gmail.com>
 <Z31P_Wp4qMzIlv88@pollux>
 <CAPM=9twK4UUnrOc1rB7bZLgWG534HH14vsdyCgUcKX1YLrnNDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9twK4UUnrOc1rB7bZLgWG534HH14vsdyCgUcKX1YLrnNDg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 08, 2025 at 11:04:21AM +1000, Dave Airlie wrote:
> On Wed, 8 Jan 2025 at 02:02, Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Tue, Jan 07, 2025 at 03:58:46PM +1000, Dave Airlie wrote:
> > > From: Dave Airlie <airlied@redhat.com>
> > >
> > > If we have two nouveau controlled devices and one passes a dma-fence
> > > to the other, when we hit the sync path it can cause the second device
> > > to try and put a sync wait in it's pushbuf for the seqno of the context
> > > on the first device.
> > >
> > > Since fence contexts are vmm bound, check the if vmm's match between
> > > both users, this should ensure that fence seqnos don't get used wrongly
> > > on incorrect channels.
> >
> > The fence sequence number is global, i.e. per device, hence checking the vmm
> > context seems too restrictive.
> >
> > Wouldn't it be better to ensure that `prev->cli->drm == chan->cli->drm`?
> 
> Can you prove that? I thought the same and I've gone around a few
> times yesterday/today and convinced myself what I wrote is right.

Honestly, I thought you were implying that by the commit summary and message,
but that's more the how you found this.

With that bias grep made me end up at pre-nv84 code, where this is actually
still the case (see nv17_fence_sync()).

But of course for later GPUs it's a per fence-context / channel seqno; can't
know what the firmware scheduler puts first.

I think we should change the commit message to "handle cross cli fences
properly" (channels of the same cli share the cli's vmm) and clarify in the
commit message that not only cross device cases are affected.

I'd also put that the problem is that (for nv84 and later) we otherwise take the
channel ID of the fence' channel and add it on top of the fence-context vma
address of the target channel, which (if they have different VMMs) makes us end
up with a wrong synchronization point [1].

Cross device could even be worse with very old GPUs, since ->sync() just assumes
the same fence-context type between the channels.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/nouveau/nv84_fence.c#n100

> 
> dma_fence_init gets passed the seqno which comes from fctx->sequence,
> which is nouveau_fence_chan, which gets allocated for each channel.
> 
> So we should hit this path if we have 2 userspace submits, one with
> say graphics, the one with copy engine contexts, otherwise we should
> wait on the CPU.
> 
> > >  drivers/gpu/drm/nouveau/nouveau_fence.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > index ee5e9d40c166f..5743c82f4094b 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > @@ -370,7 +370,8 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
> > >
> > >                               rcu_read_lock();
> > >                               prev = rcu_dereference(f->channel);
> > > -                             if (prev && (prev == chan ||
> > > +                             if (prev && (prev->vmm == chan->vmm) &&
> > > +                                 (prev == chan ||
> >
> > Maybe better break it down a bit, e.g.
> >
> > bool local = prev && (prev->... == chan->...);
> >
> > if (local && ...) {
> > ...
> > }
> 
> I'll update that once we resolve the above.
> 
> Dave.
