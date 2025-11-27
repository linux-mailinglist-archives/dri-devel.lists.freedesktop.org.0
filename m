Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941FEC8DD40
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 11:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF1510E7CB;
	Thu, 27 Nov 2025 10:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="aF3uqM6D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B3610E7CB;
 Thu, 27 Nov 2025 10:45:07 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dHCk75L7xz9v0b;
 Thu, 27 Nov 2025 11:45:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764240303; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9dmLZKUpp5ic3y2Lgnv6bFaRsccFp3cGyyyxeZ8qlGY=;
 b=aF3uqM6D8+9xhRoGjpdXhjmpSP2onVHJBSnLOBjPBfArkOJisLYT30VomziNkRrMeyyfvG
 XVquMYc+WD5HOSe4jVrO4UlJXJtFy4RpdGkdKs5lQ2fgi4J6lAkUWQbJEokvicvPjuurg2
 OmQu63uE2wa8jG35lhJVetSd33oCtWYBR3jC3JYAEUadipfKVsIGLCJF26fcBlmOa3wPdb
 OCXH7G2rGdPW0jTxxBL3mZzZ3Y7ZMxrwqwtxEDMu4IfgNrYK0HmdyE4ZGfL0W7EfX3G0e8
 m2WkwcSpQGcdgQwJYu8DZJGdK5M7wMdFJVKDSyvz8TAm97IoBu0Wcd04DUVsLw==
Message-ID: <1075dcfcd3a27d8943fc24dc5ecc8e335b3f1dae.camel@mailbox.org>
Subject: Re: [PATCH 04/18] dma-buf: inline spinlock for fence protection v2
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, sumit.semwal@linaro.org
Date: Thu, 27 Nov 2025 11:44:59 +0100
In-Reply-To: <20251113145332.16805-5-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-5-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 9e91cffe0bcd90a59b1
X-MBO-RS-META: kjbm4f7t5mtnztzjtai7y9zet6wxxjgc
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

On Thu, 2025-11-13 at 15:51 +0100, Christian K=C3=B6nig wrote:
> Implement per-fence spinlocks, allowing implementations to not give an
> external spinlock to protect the fence internal statei. Instead a spinloc=
k

s/statei/state

> embedded into the fence structure itself is used in this case.
> Shared spinlocks have the problem that implementations need to guarantee
> that the lock live at least as long all fences referencing them.

s/live/lives
s/them/it

>=20
> Using a per-fence spinlock allows completely decoupling spinlock producer

nit: AFAIK in English it's "allows for"

> and consumer life times, simplifying the handling in most use cases.

Yup! That's a great improvement :)

>=20
> v2: improve naming, coverage and function documentation
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/dma-buf/dma-fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 66 +++++++++++++-----------
> =C2=A0drivers/dma-buf/sw_sync.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++---
> =C2=A0drivers/dma-buf/sync_debug.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c |=C2=A0 4 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c=C2=A0=C2=A0 |=C2=A0 4 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h=C2=A0=C2=A0 | 12 ++---
> =C2=A0drivers/gpu/drm/drm_crtc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/drm_writeback.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_drm.c=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +=
-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c=C2=A0 |=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/qxl/qxl_release.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_fence.c=C2=A0 |=C2=A0 4 +-
> =C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_fence.c=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +=
-
> =C2=A0drivers/gpu/drm/xe/xe_hw_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 4 +-
> =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 42 ++++++++++++++-
> =C2=A016 files changed, 111 insertions(+), 62 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 7074347f506d..9a5aa9e44e13 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -343,7 +343,6 @@ void __dma_fence_might_wait(void)
> =C2=A0}
> =C2=A0#endif
> =C2=A0
> -
> =C2=A0/**
> =C2=A0 * dma_fence_signal_timestamp_locked - signal completion of a fence
> =C2=A0 * @fence: the fence to signal
> @@ -368,7 +367,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fenc=
e *fence,
> =C2=A0	struct dma_fence_cb *cur, *tmp;
> =C2=A0	struct list_head cb_list;
> =C2=A0
> -	lockdep_assert_held(fence->lock);
> +	lockdep_assert_held(dma_fence_spinlock(fence));

This acessor function could be a separate patch, couldn't it? One were
you just return fence->lock, and then in the actual inline-patch you
just add the check for the new flag.

Would be cleaner; but I guess doing it all at once is also no tragedy.

> =C2=A0
> =C2=A0	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->flags)))
> @@ -421,9 +420,9 @@ int dma_fence_signal_timestamp(struct dma_fence *fenc=
e, ktime_t timestamp)
> =C2=A0	if (WARN_ON(!fence))
> =C2=A0		return -EINVAL;
> =C2=A0
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);

Similar with this helper, could it be a separate patch?

> =C2=A0	ret =3D dma_fence_signal_timestamp_locked(fence, timestamp);
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
> =C2=A0
> =C2=A0	return ret;
> =C2=A0}
>=20

[=E2=80=A6]

> =C2=A0
> =C2=A0	trace_dma_fence_init(fence);
> @@ -1071,7 +1069,7 @@ __dma_fence_init(struct dma_fence *fence, const str=
uct dma_fence_ops *ops,
> =C2=A0 * dma_fence_init - Initialize a custom fence.
> =C2=A0 * @fence: the fence to initialize
> =C2=A0 * @ops: the dma_fence_ops for operations on this fence
> - * @lock: the irqsafe spinlock to use for locking this fence
> + * @lock: optional irqsafe spinlock to use for locking this fence
> =C2=A0 * @context: the execution context this fence is run on
> =C2=A0 * @seqno: a linear increasing sequence number for this context
> =C2=A0 *
> @@ -1081,6 +1079,10 @@ __dma_fence_init(struct dma_fence *fence, const st=
ruct dma_fence_ops *ops,
> =C2=A0 *
> =C2=A0 * context and seqno are used for easy comparison between fences, a=
llowing
> =C2=A0 * to check which fence is later by simply using dma_fence_later().
> + *
> + * It is strongly discouraged to provide an external lock. This is only =
allowed
> + * for legacy use cases when multiple fences need to be prevented from
> + * signaling out of order.

Mhhhmm, wait.
It's still one of the legendary dma_fence rules that they must (or:
should very much) signal in order.

And you agreed before that the lock doesn't actually help with
enforcing that, because you can take the lock and then still signal out
of order.

So that comment seems wrong to me


> =C2=A0 */
> =C2=A0void
> =C2=A0dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops =
*ops,
> @@ -1094,7 +1096,7 @@ EXPORT_SYMBOL(dma_fence_init);
> =C2=A0 * dma_fence_init64 - Initialize a custom fence with 64-bit seqno s=
upport.
> =C2=A0 * @fence: the fence to initialize
> =C2=A0 * @ops: the dma_fence_ops for operations on this fence
> - * @lock: the irqsafe spinlock to use for locking this fence
> + * @lock: optional irqsafe spinlock to use for locking this fence
> =C2=A0 * @context: the execution context this fence is run on
> =C2=A0 * @seqno: a linear increasing sequence number for this context
> =C2=A0 *
> @@ -1104,6 +1106,10 @@ EXPORT_SYMBOL(dma_fence_init);
> =C2=A0 *
> =C2=A0 * Context and seqno are used for easy comparison between fences, a=
llowing
> =C2=A0 * to check which fence is later by simply using dma_fence_later().
> + *
> + * It is strongly discouraged to provide an external lock. This is only =
allowed
> + * for legacy use cases when multiple fences need to be prevented from
> + * signaling out of order.

Same.

> =C2=A0 */
> =C2=A0void
> =C2=A0dma_fence_init64(struct dma_fence *fence, const struct dma_fence_op=
s *ops,
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 3c20f1d31cf5..956a3ad7a075 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -155,12 +155,12 @@ static void timeline_fence_release(struct dma_fence=
 *fence)
> =C2=A0	struct sync_timeline *parent =3D dma_fence_parent(fence);
> =C2=A0	unsigned long flags;
> =C2=A0
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);
> =C2=A0	if (!list_empty(&pt->link)) {
> =C2=A0		list_del(&pt->link);
> =C2=A0		rb_erase(&pt->node, &parent->pt_tree);
> =C2=A0	}
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
> =C2=A0
> =C2=A0	sync_timeline_put(parent);
> =C2=A0	dma_fence_free(fence);
> @@ -178,7 +178,7 @@ static void timeline_fence_set_deadline(struct dma_fe=
nce *fence, ktime_t deadlin
> =C2=A0	struct sync_pt *pt =3D dma_fence_to_sync_pt(fence);
> =C2=A0	unsigned long flags;
> =C2=A0
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);
> =C2=A0	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
> =C2=A0		if (ktime_before(deadline, pt->deadline))
> =C2=A0			pt->deadline =3D deadline;
> @@ -186,7 +186,7 @@ static void timeline_fence_set_deadline(struct dma_fe=
nce *fence, ktime_t deadlin
> =C2=A0		pt->deadline =3D deadline;
> =C2=A0		__set_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags);
> =C2=A0	}
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
> =C2=A0}
>=20

[=E2=80=A6]

> =C2=A0
> +/**
> + * dma_fence_spinlock - return pointer to the spinlock protecting the fe=
nce
> + * @fence: the fence to get the lock from
> + *
> + * Return either the pointer to the embedded or the external spin lock.
> + */
> +static inline spinlock_t *dma_fence_spinlock(struct dma_fence *fence)
> +{
> +	return test_bit(DMA_FENCE_FLAG_INLINE_LOCK_BIT, &fence->flags) ?
> +		&fence->inline_lock : fence->extern_lock;
> +}
> +
> +/**
> + * dma_fence_lock_irqsave - irqsave lock the fence
> + * @fence: the fence to lock
> + * @flags: where to store the CPU flags.
> + *
> + * Lock the fence, preventing it from changing to the signaled state.
> + */
> +#define dma_fence_lock_irqsave(fence, flags)	\


I think we discussed that before (too many emails..).

The names are inconsistent. One is dma_fence_spinlock, the other
dma_fence_lock().


P.

> +	spin_lock_irqsave(dma_fence_spinlock(fence), flags)
> +
> +/**
> + * dma_fence_unlock_irqrestore - unlock the fence and irqrestore
> + * @fence: the fence to unlock
> + * @flags the CPU flags to restore
> + *
> + * Unlock the fence, allowing it to change it's state to signaled again.
> + */
> +#define dma_fence_unlock_irqrestore(fence, flags)	\
> +	spin_unlock_irqrestore(dma_fence_spinlock(fence), flags)
> +
> =C2=A0#ifdef CONFIG_LOCKDEP
> =C2=A0bool dma_fence_begin_signalling(void);
> =C2=A0void dma_fence_end_signalling(bool cookie);

