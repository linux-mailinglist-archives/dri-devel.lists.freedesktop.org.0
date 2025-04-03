Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74443A7A561
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 16:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77FC10E205;
	Thu,  3 Apr 2025 14:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="nKsHAfpr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CB210E205;
 Thu,  3 Apr 2025 14:40:26 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZT4CW0YtFz9t7h;
 Thu,  3 Apr 2025 16:40:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1743691223; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EotwNtCXeMJqVKkewQhAKZUbOMnZCRXe3XsN9jbimow=;
 b=nKsHAfprMdINrpUEnwdMNEzZkg7X62u+AzLytnW8J3TCjcI5c9PIH1osyTtGsBi40Fgzfh
 0BLeNwJoqPemqUM6+o7+Lqr+YbM+bbvlCBWhoxfcThRhlaKdclJMRxWg8zwaB0kvQvHflz
 IPR2l8j2iMlK5kqRPBaEr7Se/ncMXFybCiOT6BwMrDsQj5p9zWpSZY/2VOYzb01Bj7pgqB
 8BVpF4oZLiiJaAZSfY+GXrFbdxObZWFWXjGPlSO5VQW31sPR8Y/8Hyz5xR7hu4UCUEOO1M
 7LXtS107dcJAqvV5QXgFfAsyfpTjBf/sHsuERzpEyoJ5avgR/8DiFPRD/37+Dw==
Message-ID: <36b076dc17083f9edd9b100bd8fa57badde41158.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/nouveau: Prevent signalled fences in pending list
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Date: Thu, 03 Apr 2025 16:40:19 +0200
In-Reply-To: <72156b6a-9a8b-4485-8091-95f02c96eba8@amd.com>
References: <20250403101353.42880-2-phasta@kernel.org>
 <c779bc2f-06af-4278-8bb5-08afc074b580@amd.com>
 <2558c9cf0cf28867238eb21950ce2a3f862c15c3.camel@mailbox.org>
 <72156b6a-9a8b-4485-8091-95f02c96eba8@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: sm1sfzwzrrjcz69c5hiajc6rnxzujchn
X-MBO-RS-ID: bd7fd8576ab2d4ccf54
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2025-04-03 at 15:10 +0200, Christian K=C3=B6nig wrote:
> =C2=A0Am 03.04.25 um 14:58 schrieb Philipp Stanner:
> =C2=A0
> > =C2=A0
> > On Thu, 2025-04-03 at 14:08 +0200, Christian K=C3=B6nig wrote:
> > =C2=A0
> > > =C2=A0
> > > Am 03.04.25 um 12:13 schrieb Philipp Stanner:
> > > =C2=A0
> > > > =C2=A0
> > > > Nouveau currently relies on the assumption that dma_fences will
> > > > only
> > > > ever get signalled through nouveau_fence_signal(), which takes
> > > > care
> > > > of
> > > > removing a signalled fence from the list
> > > > nouveau_fence_chan.pending.
> > > >=20
> > > > This self-imposed rule is violated in nouveau_fence_done(),
> > > > where
> > > > dma_fence_is_signaled() can signal the fence without removing
> > > > it
> > > > from
> > > > the list. This enables accesses to already signalled fences
> > > > through
> > > > the
> > > > list, which is a bug.
> > > >=20
> > > > Furthermore, it must always be possible to use standard
> > > > dma_fence
> > > > methods an a dma_fence and observe valid behavior. The
> > > > canonical
> > > > way of
> > > > ensuring that signalling a fence has additional effects is to
> > > > add
> > > > those
> > > > effects to a callback and register it on that fence.
> > > >=20
> > > > Move the code from nouveau_fence_signal() into a dma_fence
> > > > callback.
> > > > Register that callback when creating the fence.
> > > >=20
> > > > Cc: <stable@vger.kernel.org> # 4.10+
> > > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > > ---
> > > > Changes in v2:
> > > > =C2=A0 - Remove Fixes: tag. (Danilo)
> > > > =C2=A0 - Remove integer "drop" and call nvif_event_block() in the
> > > > fence
> > > > =C2=A0=C2=A0=C2=A0 callback. (Danilo)
> > > > ---
> > > > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c | 52 +++++++++++++---=
-
> > > > ----
> > > > ----
> > > > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.h |=C2=A0 1 +
> > > > =C2=A02 files changed, 29 insertions(+), 24 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > index 7cc84472cece..cf510ef9641a 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > @@ -50,24 +50,24 @@ nouveau_fctx(struct nouveau_fence *fence)
> > > > =C2=A0	return container_of(fence->base.lock, struct
> > > > nouveau_fence_chan, lock);
> > > > =C2=A0}
> > > > =C2=A0
> > > > -static int
> > > > -nouveau_fence_signal(struct nouveau_fence *fence)
> > > > +static void
> > > > +nouveau_fence_cleanup_cb(struct dma_fence *dfence, struct
> > > > dma_fence_cb *cb)
> > > > =C2=A0{
> > > > -	int drop =3D 0;
> > > > +	struct nouveau_fence_chan *fctx;
> > > > +	struct nouveau_fence *fence;
> > > > +
> > > > +	fence =3D container_of(dfence, struct nouveau_fence,
> > > > base);
> > > > +	fctx =3D nouveau_fctx(fence);
> > > > =C2=A0
> > > > -	dma_fence_signal_locked(&fence->base);
> > > > =C2=A0	list_del(&fence->head);
> > > > =C2=A0	rcu_assign_pointer(fence->channel, NULL);
> > > > =C2=A0
> > > > =C2=A0	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence-
> > > > =C2=A0
> > > > > =C2=A0
> > > > > base.flags)) {
> > > > > =C2=A0
> > > > =C2=A0
> > > > -		struct nouveau_fence_chan *fctx =3D
> > > > nouveau_fctx(fence);
> > > > -
> > > > =C2=A0		if (!--fctx->notify_ref)
> > > > -			drop =3D 1;
> > > > +			nvif_event_block(&fctx->event);
> > > > =C2=A0	}
> > > > =C2=A0
> > > > =C2=A0	dma_fence_put(&fence->base);
> > > > -	return drop;
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static struct nouveau_fence *
> > > > @@ -93,8 +93,7 @@ nouveau_fence_context_kill(struct
> > > > nouveau_fence_chan *fctx, int error)
> > > > =C2=A0		if (error)
> > > > =C2=A0			dma_fence_set_error(&fence->base,
> > > > error);
> > > > =C2=A0
> > > > -		if (nouveau_fence_signal(fence))
> > > > -			nvif_event_block(&fctx->event);
> > > > +		dma_fence_signal_locked(&fence->base);
> > > > =C2=A0	}
> > > > =C2=A0	fctx->killed =3D 1;
> > > > =C2=A0	spin_unlock_irqrestore(&fctx->lock, flags);
> > > > @@ -127,11 +126,10 @@ nouveau_fence_context_free(struct
> > > > nouveau_fence_chan *fctx)
> > > > =C2=A0	kref_put(&fctx->fence_ref, nouveau_fence_context_put);
> > > > =C2=A0}
> > > > =C2=A0
> > > > -static int
> > > > +static void
> > > > =C2=A0nouveau_fence_update(struct nouveau_channel *chan, struct
> > > > nouveau_fence_chan *fctx)
> > > > =C2=A0{
> > > > =C2=A0	struct nouveau_fence *fence;
> > > > -	int drop =3D 0;
> > > > =C2=A0	u32 seq =3D fctx->read(chan);
> > > > =C2=A0
> > > > =C2=A0	while (!list_empty(&fctx->pending)) {
> > > > @@ -140,10 +138,8 @@ nouveau_fence_update(struct
> > > > nouveau_channel
> > > > *chan, struct nouveau_fence_chan *fc
> > > > =C2=A0		if ((int)(seq - fence->base.seqno) < 0)
> > > > =C2=A0			break;
> > > > =C2=A0
> > > > -		drop |=3D nouveau_fence_signal(fence);
> > > > +		dma_fence_signal_locked(&fence->base);
> > > > =C2=A0	}
> > > > -
> > > > -	return drop;
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static void
> > > > @@ -152,7 +148,6 @@ nouveau_fence_uevent_work(struct
> > > > work_struct
> > > > *work)
> > > > =C2=A0	struct nouveau_fence_chan *fctx =3D container_of(work,
> > > > struct nouveau_fence_chan,
> > > > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > uevent_work);
> > > > =C2=A0	unsigned long flags;
> > > > -	int drop =3D 0;
> > > > =C2=A0
> > > > =C2=A0	spin_lock_irqsave(&fctx->lock, flags);
> > > > =C2=A0	if (!list_empty(&fctx->pending)) {
> > > > @@ -161,11 +156,8 @@ nouveau_fence_uevent_work(struct
> > > > work_struct
> > > > *work)
> > > > =C2=A0
> > > > =C2=A0		fence =3D list_entry(fctx->pending.next,
> > > > typeof(*fence), head);
> > > > =C2=A0		chan =3D rcu_dereference_protected(fence-
> > > > >channel,
> > > > lockdep_is_held(&fctx->lock));
> > > > -		if (nouveau_fence_update(chan, fctx))
> > > > -			drop =3D 1;
> > > > +		nouveau_fence_update(chan, fctx);
> > > > =C2=A0	}
> > > > -	if (drop)
> > > > -		nvif_event_block(&fctx->event);
> > > > =C2=A0
> > > > =C2=A0	spin_unlock_irqrestore(&fctx->lock, flags);
> > > > =C2=A0}
> > > > @@ -235,6 +227,19 @@ nouveau_fence_emit(struct nouveau_fence
> > > > *fence)
> > > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fctx->lock, fctx->co=
ntext,
> > > > ++fctx-
> > > > =C2=A0
> > > > > =C2=A0
> > > > > sequence);
> > > > > =C2=A0
> > > > =C2=A0
> > > > =C2=A0	kref_get(&fctx->fence_ref);
> > > > =C2=A0
> > > > +	fence->cb.func =3D nouveau_fence_cleanup_cb;
> > > > +	/* Adding a callback runs into
> > > > __dma_fence_enable_signaling(), which will
> > > > +	 * ultimately run into nouveau_fence_no_signaling(),
> > > > where
> > > > a WARN_ON
> > > > +	 * would fire because the refcount can be dropped
> > > > there.
> > > > +	 *
> > > > +	 * Increment the refcount here temporarily to work
> > > > around
> > > > that.
> > > > +	 */
> > > > +	dma_fence_get(&fence->base);
> > > > +	ret =3D dma_fence_add_callback(&fence->base, &fence->cb,
> > > > nouveau_fence_cleanup_cb);
> > > > =C2=A0
> > > =C2=A0
> > > That looks like a really really awkward approach. The driver
> > > basically uses a the DMA fence infrastructure as middle layer and
> > > callbacks into itself to cleanup it's own structures.
> > > =C2=A0
> > =C2=A0
> > What else are callbacks good for, if not to do something
> > automatically
> > when the fence gets signaled?
> > =C2=A0
> =C2=A0
> =C2=A0Well if you add a callback for a signal you issued yourself then
> that's kind of awkward.
> =C2=A0
> =C2=A0E.g. you call into the DMA fence code, just for the DMA fence code
> to call yourself back again.

Now we're entering CS-Philosophy, because it depends on who "you" and
"yourself" are. In case of the driver, yes, naturally it registers a
callback because at some other place (e.g., in the driver's interrupt
handler) the fence will be signaled and the driver wants the callback
stuff to be done.

If that's not dma_fences' callbacks' purpose, then I'd be interested in
knowing what their purpose is, because from my POV this discussion
seems to imply that we effectively must never use them for anything.

How could it ever be different? Who, for example, registers dma_fence
callbacks while not signaling them "himself"?


>=20
> =C2=A0
> =C2=A0
> > =C2=A0
> > > =C2=A0
> > > Additional to that we don't guarantee any callback order for the
> > > DMA
> > > fence and so it can be that mix cleaning up the callback with
> > > other
> > > work which is certainly not good when you want to guarantee that
> > > the
> > > cleanup happens under the same lock.
> > > =C2=A0
> > =C2=A0
> > Isn't my perception correct that the primary issue you have with
> > this
> > approach is that dma_fence_put() is called from within the
> > callback? Or
> > do you also take issue with deleting from the list?
> > =C2=A0
> =C2=A0
> =C2=A0Well kind of both. The issue is that the caller of
> dma_fence_signal() or dma_fence_signal_locked() must hold the
> reference until the function returns.
> =C2=A0
> =C2=A0When you do the list cleanup and the drop inside the callback it is
> perfectly possible that the fence pointer becomes stale before you
> return and that's really not a good idea.

In other words, you would prefer if this patch would have a function
with my callback's code in a function, and that function would be
called at every place where the driver signals a fence?

If that's your opinion, then, IOW, it would mean for us to go almost
back to status quo, with nouveau_fence_signal2.0, but with the
dma_fence_is_signaled() part fixed.


P.

> =C2=A0
> =C2=A0
> > =C2=A0
> >=20
> > =C2=A0
> > > =C2=A0
> > > Instead the call to dma_fence_signal_locked() should probably be
> > > removed from nouveau_fence_signal() and into
> > > nouveau_fence_context_kill() and nouveau_fence_update().
> > >=20
> > > This way nouveau_fence_is_signaled() can call this function as
> > > well.
> > > =C2=A0
> > =C2=A0
> > Which "this function"? dma_fence_signal_locked()
> > =C2=A0
> =C2=A0
> =C2=A0No the cleanup function for the list entry. Whatever you call that
> then, the name nouveau_fence_signal() is probably not appropriate any
> more.
> =C2=A0
> =C2=A0
> > =C2=A0
> >=20
> > =C2=A0
> > > =C2=A0
> > > BTW: nouveau_fence_no_signaling() looks completely broken as
> > > well. It
> > > calls nouveau_fence_is_signaled() and then list_del() on the
> > > fence
> > > head.
> > > =C2=A0
> > =C2=A0
> > I can assure you that a great many things in Nouveau look
> > completely
> > broken.
> >=20
> > The question for us is always the cost-benefit-ratio when fixing
> > bugs.
> > There are fixes that solve the bug with reasonable effort, and
> > there
> > are great reworks towards an ideal state.
> > =C2=A0
> =C2=A0
> =C2=A0I would just simply drop that function. As far as I can see it
> severs no purpose other than doing exactly what the common DMA fence
> code does anyway.
> =C2=A0
> =C2=A0Just one less thing which could fail.
> =C2=A0
> =C2=A0Christian.
> =C2=A0
> =C2=A0
> > =C2=A0
> >=20
> > P.
> >=20
> >=20
> > =C2=A0
> > > =C2=A0
> > > As far as I can see that is completely superfluous and should
> > > probably be dropped. IIRC I once had a patch to clean that up but
> > > it
> > > was dropped for some reason.
> > >=20
> > > Regards,
> > > Christian.
> > >=20
> > >=20
> > > =C2=A0
> > > > =C2=A0
> > > > +	dma_fence_put(&fence->base);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > =C2=A0	ret =3D fctx->emit(fence);
> > > > =C2=A0	if (!ret) {
> > > > =C2=A0		dma_fence_get(&fence->base);
> > > > @@ -246,8 +251,7 @@ nouveau_fence_emit(struct nouveau_fence
> > > > *fence)
> > > > =C2=A0			return -ENODEV;
> > > > =C2=A0		}
> > > > =C2=A0
> > > > -		if (nouveau_fence_update(chan, fctx))
> > > > -			nvif_event_block(&fctx->event);
> > > > +		nouveau_fence_update(chan, fctx);
> > > > =C2=A0
> > > > =C2=A0		list_add_tail(&fence->head, &fctx->pending);
> > > > =C2=A0		spin_unlock_irq(&fctx->lock);
> > > > @@ -270,8 +274,8 @@ nouveau_fence_done(struct nouveau_fence
> > > > *fence)
> > > > =C2=A0
> > > > =C2=A0		spin_lock_irqsave(&fctx->lock, flags);
> > > > =C2=A0		chan =3D rcu_dereference_protected(fence-
> > > > >channel,
> > > > lockdep_is_held(&fctx->lock));
> > > > -		if (chan && nouveau_fence_update(chan, fctx))
> > > > -			nvif_event_block(&fctx->event);
> > > > +		if (chan)
> > > > +			nouveau_fence_update(chan, fctx);
> > > > =C2=A0		spin_unlock_irqrestore(&fctx->lock, flags);
> > > > =C2=A0	}
> > > > =C2=A0	return dma_fence_is_signaled(&fence->base);
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h
> > > > b/drivers/gpu/drm/nouveau/nouveau_fence.h
> > > > index 8bc065acfe35..e6b2df7fdc42 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
> > > > @@ -10,6 +10,7 @@ struct nouveau_bo;
> > > > =C2=A0
> > > > =C2=A0struct nouveau_fence {
> > > > =C2=A0	struct dma_fence base;
> > > > +	struct dma_fence_cb cb;
> > > > =C2=A0
> > > > =C2=A0	struct list_head head;
> > > > =C2=A0
> > > > =C2=A0
> > > =C2=A0=C2=A0
> > =C2=A0=C2=A0
> =C2=A0
> =C2=A0

