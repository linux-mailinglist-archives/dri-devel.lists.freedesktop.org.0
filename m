Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4064A7A333
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 14:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F063A10E238;
	Thu,  3 Apr 2025 12:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="pfSyGgga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DB710E238;
 Thu,  3 Apr 2025 12:58:25 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZT1xj0znYz9sJ3;
 Thu,  3 Apr 2025 14:58:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1743685097; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p9Yu87OM1Kk/dzENFohPQvz+XQJNRWjvxxcj7tVV9OA=;
 b=pfSyGggaIc/VQp3hWyip5B2ZYX27tQ4lM965xiL7qRcb+U40E0mzyzQtZqzpLoSI1LIUZK
 7SKIf0hrxgueN0lIzO15laP8f+zDt4LGBJyOogmyAkgj5B1SiXit3H0t6ek5QFd8Us1tzg
 CL9Ku5z/ytM+EEi4VKJO4Xbiaz3X/Ez/pi/1V/xM+Gcg50DGjvKvwFal1HJYmrA4e4iuVc
 G17m/qjNlcSrvt3Uujsxh+oYYUxn/vXWNw72C2uW79p/SuGSX1FaY+xUSZLJxvQB4FEoNt
 ez1dmTD6/cpReaOUy8WOZXLqb8K+XDyRNgRQh8Gq71SL2ubkEM/llk7WopViNg==
Message-ID: <2558c9cf0cf28867238eb21950ce2a3f862c15c3.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/nouveau: Prevent signalled fences in pending list
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>,  David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Date: Thu, 03 Apr 2025 14:58:13 +0200
In-Reply-To: <c779bc2f-06af-4278-8bb5-08afc074b580@amd.com>
References: <20250403101353.42880-2-phasta@kernel.org>
 <c779bc2f-06af-4278-8bb5-08afc074b580@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 454gqqwsipek8x3kykm7ffixgytojkho
X-MBO-RS-ID: dc3d724127511047ef2
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

On Thu, 2025-04-03 at 14:08 +0200, Christian K=C3=B6nig wrote:
> Am 03.04.25 um 12:13 schrieb Philipp Stanner:
> > Nouveau currently relies on the assumption that dma_fences will
> > only
> > ever get signalled through nouveau_fence_signal(), which takes care
> > of
> > removing a signalled fence from the list
> > nouveau_fence_chan.pending.
> >=20
> > This self-imposed rule is violated in nouveau_fence_done(), where
> > dma_fence_is_signaled() can signal the fence without removing it
> > from
> > the list. This enables accesses to already signalled fences through
> > the
> > list, which is a bug.
> >=20
> > Furthermore, it must always be possible to use standard dma_fence
> > methods an a dma_fence and observe valid behavior. The canonical
> > way of
> > ensuring that signalling a fence has additional effects is to add
> > those
> > effects to a callback and register it on that fence.
> >=20
> > Move the code from nouveau_fence_signal() into a dma_fence
> > callback.
> > Register that callback when creating the fence.
> >=20
> > Cc: <stable@vger.kernel.org> # 4.10+
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > Changes in v2:
> > =C2=A0 - Remove Fixes: tag. (Danilo)
> > =C2=A0 - Remove integer "drop" and call nvif_event_block() in the fence
> > =C2=A0=C2=A0=C2=A0 callback. (Danilo)
> > ---
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c | 52 +++++++++++++-------=
-
> > ----
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.h |=C2=A0 1 +
> > =C2=A02 files changed, 29 insertions(+), 24 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > index 7cc84472cece..cf510ef9641a 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -50,24 +50,24 @@ nouveau_fctx(struct nouveau_fence *fence)
> > =C2=A0	return container_of(fence->base.lock, struct
> > nouveau_fence_chan, lock);
> > =C2=A0}
> > =C2=A0
> > -static int
> > -nouveau_fence_signal(struct nouveau_fence *fence)
> > +static void
> > +nouveau_fence_cleanup_cb(struct dma_fence *dfence, struct
> > dma_fence_cb *cb)
> > =C2=A0{
> > -	int drop =3D 0;
> > +	struct nouveau_fence_chan *fctx;
> > +	struct nouveau_fence *fence;
> > +
> > +	fence =3D container_of(dfence, struct nouveau_fence, base);
> > +	fctx =3D nouveau_fctx(fence);
> > =C2=A0
> > -	dma_fence_signal_locked(&fence->base);
> > =C2=A0	list_del(&fence->head);
> > =C2=A0	rcu_assign_pointer(fence->channel, NULL);
> > =C2=A0
> > =C2=A0	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence-
> > >base.flags)) {
> > -		struct nouveau_fence_chan *fctx =3D
> > nouveau_fctx(fence);
> > -
> > =C2=A0		if (!--fctx->notify_ref)
> > -			drop =3D 1;
> > +			nvif_event_block(&fctx->event);
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	dma_fence_put(&fence->base);
> > -	return drop;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static struct nouveau_fence *
> > @@ -93,8 +93,7 @@ nouveau_fence_context_kill(struct
> > nouveau_fence_chan *fctx, int error)
> > =C2=A0		if (error)
> > =C2=A0			dma_fence_set_error(&fence->base, error);
> > =C2=A0
> > -		if (nouveau_fence_signal(fence))
> > -			nvif_event_block(&fctx->event);
> > +		dma_fence_signal_locked(&fence->base);
> > =C2=A0	}
> > =C2=A0	fctx->killed =3D 1;
> > =C2=A0	spin_unlock_irqrestore(&fctx->lock, flags);
> > @@ -127,11 +126,10 @@ nouveau_fence_context_free(struct
> > nouveau_fence_chan *fctx)
> > =C2=A0	kref_put(&fctx->fence_ref, nouveau_fence_context_put);
> > =C2=A0}
> > =C2=A0
> > -static int
> > +static void
> > =C2=A0nouveau_fence_update(struct nouveau_channel *chan, struct
> > nouveau_fence_chan *fctx)
> > =C2=A0{
> > =C2=A0	struct nouveau_fence *fence;
> > -	int drop =3D 0;
> > =C2=A0	u32 seq =3D fctx->read(chan);
> > =C2=A0
> > =C2=A0	while (!list_empty(&fctx->pending)) {
> > @@ -140,10 +138,8 @@ nouveau_fence_update(struct nouveau_channel
> > *chan, struct nouveau_fence_chan *fc
> > =C2=A0		if ((int)(seq - fence->base.seqno) < 0)
> > =C2=A0			break;
> > =C2=A0
> > -		drop |=3D nouveau_fence_signal(fence);
> > +		dma_fence_signal_locked(&fence->base);
> > =C2=A0	}
> > -
> > -	return drop;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void
> > @@ -152,7 +148,6 @@ nouveau_fence_uevent_work(struct work_struct
> > *work)
> > =C2=A0	struct nouveau_fence_chan *fctx =3D container_of(work,
> > struct nouveau_fence_chan,
> > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > uevent_work);
> > =C2=A0	unsigned long flags;
> > -	int drop =3D 0;
> > =C2=A0
> > =C2=A0	spin_lock_irqsave(&fctx->lock, flags);
> > =C2=A0	if (!list_empty(&fctx->pending)) {
> > @@ -161,11 +156,8 @@ nouveau_fence_uevent_work(struct work_struct
> > *work)
> > =C2=A0
> > =C2=A0		fence =3D list_entry(fctx->pending.next,
> > typeof(*fence), head);
> > =C2=A0		chan =3D rcu_dereference_protected(fence->channel,
> > lockdep_is_held(&fctx->lock));
> > -		if (nouveau_fence_update(chan, fctx))
> > -			drop =3D 1;
> > +		nouveau_fence_update(chan, fctx);
> > =C2=A0	}
> > -	if (drop)
> > -		nvif_event_block(&fctx->event);
> > =C2=A0
> > =C2=A0	spin_unlock_irqrestore(&fctx->lock, flags);
> > =C2=A0}
> > @@ -235,6 +227,19 @@ nouveau_fence_emit(struct nouveau_fence
> > *fence)
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fctx->lock, fctx->contex=
t, ++fctx-
> > >sequence);
> > =C2=A0	kref_get(&fctx->fence_ref);
> > =C2=A0
> > +	fence->cb.func =3D nouveau_fence_cleanup_cb;
> > +	/* Adding a callback runs into
> > __dma_fence_enable_signaling(), which will
> > +	 * ultimately run into nouveau_fence_no_signaling(), where
> > a WARN_ON
> > +	 * would fire because the refcount can be dropped there.
> > +	 *
> > +	 * Increment the refcount here temporarily to work around
> > that.
> > +	 */
> > +	dma_fence_get(&fence->base);
> > +	ret =3D dma_fence_add_callback(&fence->base, &fence->cb,
> > nouveau_fence_cleanup_cb);
>=20
> That looks like a really really awkward approach. The driver
> basically uses a the DMA fence infrastructure as middle layer and
> callbacks into itself to cleanup it's own structures.

What else are callbacks good for, if not to do something automatically
when the fence gets signaled?

> Additional to that we don't guarantee any callback order for the DMA
> fence and so it can be that mix cleaning up the callback with other
> work which is certainly not good when you want to guarantee that the
> cleanup happens under the same lock.

Isn't my perception correct that the primary issue you have with this
approach is that dma_fence_put() is called from within the callback? Or
do you also take issue with deleting from the list?

>=20
> Instead the call to dma_fence_signal_locked() should probably be
> removed from nouveau_fence_signal() and into
> nouveau_fence_context_kill() and nouveau_fence_update().
>=20
> This way nouveau_fence_is_signaled() can call this function as well.

Which "this function"? dma_fence_signal_locked()

>=20
> BTW: nouveau_fence_no_signaling() looks completely broken as well. It
> calls nouveau_fence_is_signaled() and then list_del() on the fence
> head.

I can assure you that a great many things in Nouveau look completely
broken.

The question for us is always the cost-benefit-ratio when fixing bugs.
There are fixes that solve the bug with reasonable effort, and there
are great reworks towards an ideal state.

P.


>=20
> As far as I can see that is completely superfluous and should
> probably be dropped. IIRC I once had a patch to clean that up but it
> was dropped for some reason.
>=20
> Regards,
> Christian.
>=20
>=20
> > +	dma_fence_put(&fence->base);
> > +	if (ret)
> > +		return ret;
> > +
> > =C2=A0	ret =3D fctx->emit(fence);
> > =C2=A0	if (!ret) {
> > =C2=A0		dma_fence_get(&fence->base);
> > @@ -246,8 +251,7 @@ nouveau_fence_emit(struct nouveau_fence *fence)
> > =C2=A0			return -ENODEV;
> > =C2=A0		}
> > =C2=A0
> > -		if (nouveau_fence_update(chan, fctx))
> > -			nvif_event_block(&fctx->event);
> > +		nouveau_fence_update(chan, fctx);
> > =C2=A0
> > =C2=A0		list_add_tail(&fence->head, &fctx->pending);
> > =C2=A0		spin_unlock_irq(&fctx->lock);
> > @@ -270,8 +274,8 @@ nouveau_fence_done(struct nouveau_fence *fence)
> > =C2=A0
> > =C2=A0		spin_lock_irqsave(&fctx->lock, flags);
> > =C2=A0		chan =3D rcu_dereference_protected(fence->channel,
> > lockdep_is_held(&fctx->lock));
> > -		if (chan && nouveau_fence_update(chan, fctx))
> > -			nvif_event_block(&fctx->event);
> > +		if (chan)
> > +			nouveau_fence_update(chan, fctx);
> > =C2=A0		spin_unlock_irqrestore(&fctx->lock, flags);
> > =C2=A0	}
> > =C2=A0	return dma_fence_is_signaled(&fence->base);
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h
> > b/drivers/gpu/drm/nouveau/nouveau_fence.h
> > index 8bc065acfe35..e6b2df7fdc42 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
> > @@ -10,6 +10,7 @@ struct nouveau_bo;
> > =C2=A0
> > =C2=A0struct nouveau_fence {
> > =C2=A0	struct dma_fence base;
> > +	struct dma_fence_cb cb;
> > =C2=A0
> > =C2=A0	struct list_head head;
> > =C2=A0
>=20

