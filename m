Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626FEB43BF7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 14:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD62010EA19;
	Thu,  4 Sep 2025 12:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="RDt3K1CF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E52210E24A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 12:45:33 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cHfMs237Tz9tdB;
 Thu,  4 Sep 2025 14:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1756989929; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7cw5SlezJWkD9vH4s5x2Q9sfM/T9DczJB5/DrhIxAxM=;
 b=RDt3K1CFKib5cOnL+kd4amKsRNrF43xl7nF+IomYrmqtsEdP7x7UD7Sp7e+0/FEr6hOsiK
 nXM4aL8kqjmNQXj1IRFm+61pKuNi089hwn2vsiWOUp21QiEV5Zf8t1SdpuBIfeJgBHgb74
 22zMve8a6qF45kqnIwGbJcxu10d1qAOyrr8+jBW4m10/vExayKHfwuxbbqXmiY3A6yDkJB
 krBS1TD3ShW5XcdjbDHAGBRh64KhKXDRroCLD8cVe6vDT1HQyiPtsLvSkYg3ms3JIOzhZh
 Uv6fTphk53jXfqkTpw+yMs8zKsK2iMcohS8/AkY4AZIN04j75lPRFEGW5A4LeA==
Message-ID: <b6c09af972e7d4a9cb1c9d6621f77f923c3a8a56.camel@mailbox.org>
Subject: Re: [PATCH 2/2] dma-buf: add warning when dma_fence is signaled
 from IOCTL
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 simona.vetter@ffwll.ch, tvrtko.ursulin@igalia.com, airlied@gmail.com, 
 dakr@kernel.org, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org
Date: Thu, 04 Sep 2025 14:45:25 +0200
In-Reply-To: <20250812143402.8619-2-christian.koenig@amd.com>
References: <20250812143402.8619-1-christian.koenig@amd.com>
 <20250812143402.8619-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: iswzzsxdww7z5h9gisg9sxxgd37yb7gs
X-MBO-RS-ID: d86d65c433cca0c4a77
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

On Tue, 2025-08-12 at 16:34 +0200, Christian K=C3=B6nig wrote:
> From: Christian K=C3=B6nig <ckoenig@able.fritz.box>
>=20
> We have the re-occurring problem that people try to invent a
> DMA-fences implementation which signals fences based on an userspace
> IOCTL.
>=20
> This is well known as source of hard to track down crashes and is
> documented to be an invalid approach. The problem is that it seems
> to work during initial testing and only long term tests points out
> why this can never work correctly.
>=20
> So give at least a warning when people try to signal a fence from
> task context and not from interrupts or a work item. This check is
> certainly not perfect but better than nothing.
>=20
> Signed-off-by: Christian K=C3=B6nig <ckoenig@able.fritz.box>
> ---
> =C2=A0drivers/dma-buf/dma-fence.c | 59 +++++++++++++++++++++++++++-------=
---
> =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 |=C2=A0 9 ++++--
> =C2=A02 files changed, 51 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 3f78c56b58dc..2bce620eacac 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -345,33 +345,23 @@ void __dma_fence_might_wait(void)
> =C2=A0}
> =C2=A0#endif
> =C2=A0
> -
> =C2=A0/**
> - * dma_fence_signal_timestamp_locked - signal completion of a fence
> + * dma_fence_signal_internal - internal signal completion of a fence
> =C2=A0 * @fence: the fence to signal
> =C2=A0 * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC t=
ime domain
> =C2=A0 *
> - * Signal completion for software callbacks on a fence, this will unbloc=
k
> - * dma_fence_wait() calls and run all the callbacks added with
> - * dma_fence_add_callback(). Can be called multiple times, but since a f=
ence
> - * can only go from the unsignaled to the signaled state and not back, i=
t will
> - * only be effective the first time. Set the timestamp provided as the f=
ence
> - * signal timestamp.
> - *
> - * Unlike dma_fence_signal_timestamp(), this function must be called wit=
h
> - * &dma_fence.lock held.
> + * Internal signal the dma_fence without error checking. Should *NEVER* =
be used
> + * by drivers or external code directly.
> =C2=A0 *
> =C2=A0 * Returns 0 on success and a negative error value when @fence has =
been
> =C2=A0 * signalled already.
> =C2=A0 */
> -int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t timestamp)
> +int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp=
)
> =C2=A0{
> =C2=A0	struct dma_fence_cb *cur, *tmp;
> =C2=A0	struct list_head cb_list;
> =C2=A0
> =C2=A0	lockdep_assert_held(fence->lock);
> -
> =C2=A0	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->flags)))
> =C2=A0		return -EINVAL;
> @@ -390,7 +380,46 @@ int dma_fence_signal_timestamp_locked(struct dma_fen=
ce *fence,
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> -EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
> +EXPORT_SYMBOL(dma_fence_signal_internal);
> +
> +/**
> + * dma_fence_signal_timestamp_locked - signal completion of a fence
> + * @fence: the fence to signal
> + * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time d=
omain
> + *
> + * Signal completion for software callbacks on a fence, this will unbloc=
k
> + * dma_fence_wait() calls and run all the callbacks added with
> + * dma_fence_add_callback(). Can be called multiple times, but since a f=
ence
> + * can only go from the unsignaled to the signaled state and not back, i=
t will
> + * only be effective the first time. Set the timestamp provided as the f=
ence
> + * signal timestamp.
> + *
> + * Unlike dma_fence_signal_timestamp(), this function must be called wit=
h
> + * &dma_fence.lock held.
> + *
> + * Returns 0 on success and a negative error value when @fence has been
> + * signalled already.
> + */
> +int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t timestamp)
> +{
> +	/*
> +	 * We have the re-occurring problem that people try to invent a
> +	 * DMA-fences implementation which signals fences based on an userspace
> +	 * IOCTL.
> +	 *
> +	 * This is well known as source of hard to track down crashes and is
> +	 * documented to be an invalid approach. The problem is that it seems
> +	 * to work during initial testing and only long term tests points out
> +	 * why this can never work correctly.
> +	 *
> +	 * So give at least a warning when people try to signal a fence from
> +	 * task context and not from interrupts or a work item. This check is
> +	 * certainly not perfect but better than nothing.
> +	 */
> +	WARN_ON_ONCE(!in_interrupt() && !current_work());

I only just realized that this could cause false-positive warnings
should a driver tear down drm/sched with drm_sched_fini() plus
drm_sched_backend_ops.cancel_job(). This signals left over dma_fences
with an error.

And drm_sched_fini() doesn't usually run in work items, does it. It can
be invoked through ioctls that destroy a channel and the associated
scheduler, with rmmod etc.

cancel_job() is (for now) only used in the unit tests since we recently
had to revert the usage in Nouveau (because of a different problem). I
intend to add it back there, though; and we established cancel_job() as
the way to deal with drm/sched's memory leaks in lengthy discussions.


I think that warning should not be added. False positive warnings in
dmesg would confuse users, cause unnecessary support tickets etc.


P.


> +	return dma_fence_signal_internal(fence, timestamp);
> +}
> =C2=A0
> =C2=A0/**
> =C2=A0 * dma_fence_signal_timestamp - signal completion of a fence
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 64639e104110..8dbcd66989b8 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -369,6 +369,7 @@ int dma_fence_signal_locked(struct dma_fence *fence);
> =C2=A0int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t tim=
estamp);
> =C2=A0int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t timestamp);
> +int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp=
);
> =C2=A0signed long dma_fence_default_wait(struct dma_fence *fence,
> =C2=A0				=C2=A0=C2=A0 bool intr, signed long timeout);
> =C2=A0int dma_fence_add_callback(struct dma_fence *fence,
> @@ -422,7 +423,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
> =C2=A0		return true;
> =C2=A0
> =C2=A0	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> -		dma_fence_signal_locked(fence);
> +		dma_fence_signal_internal(fence, ktime_get());
> =C2=A0		return true;
> =C2=A0	}
> =C2=A0
> @@ -448,11 +449,15 @@ dma_fence_is_signaled_locked(struct dma_fence *fenc=
e)
> =C2=A0static inline bool
> =C2=A0dma_fence_is_signaled(struct dma_fence *fence)
> =C2=A0{
> +	unsigned long flags;
> +
> =C2=A0	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> =C2=A0		return true;
> =C2=A0
> =C2=A0	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> -		dma_fence_signal(fence);
> +		spin_lock_irqsave(fence->lock, flags);
> +		dma_fence_signal_internal(fence, ktime_get());
> +		spin_unlock_irqrestore(fence->lock, flags);
> =C2=A0		return true;
> =C2=A0	}
> =C2=A0

