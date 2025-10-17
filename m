Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA45BE7840
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 11:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9509B10EB8A;
	Fri, 17 Oct 2025 09:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rWxm7rpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E512910EB8A;
 Fri, 17 Oct 2025 09:14:40 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cnzfj37WPz9v7l;
 Fri, 17 Oct 2025 11:14:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760692477; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CiBeY4WW1js9rKGm/fIcWX6WwDK4gMjR18x6jCKLFfk=;
 b=rWxm7rpMrZmw4SefYc+byg/ueXYy92BsdwbJcS/KWxSNFHxFFYvC0VWEFajd6n03vYCorR
 1hYZnKm4Mn+iMlelMgXl9Or47C1no5p9rlRbPOiWf8dyCU8OWEWFTR/IQvsTyiROxKyBjp
 YSt2JE3LLeNzwZ7yy/20DguS89RTdub6m6Qyd7TbKTLuLKWOLg65BBN35zxY+2k8cq8VYf
 Kcd0N1U24GMhOTXKrO5Xolpv8cC1/Zh/MieaW1SJObFCqquJ6qEBFXnxbnwUiC/2+l9co8
 1Vpczebjdn01wAr6McfbEeM1qQPV3NVbgc6O8uzj5yJGDaPzoDzqbbxmOyEDfw==
Message-ID: <d4283e9220df6ce6cd9ec2ae0b011f4931f4acf5.camel@mailbox.org>
Subject: Re: [PATCH 04/15] dma-buf: detach fence ops on signal
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Date: Fri, 17 Oct 2025 11:14:35 +0200
In-Reply-To: <20251013143502.1655-5-christian.koenig@amd.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-5-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: bfdc10839e07c76281e
X-MBO-RS-META: 59q9m7qgunobce4xcuehq1oiwwn9tr64
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

On Mon, 2025-10-13 at 15:48 +0200, Christian K=C3=B6nig wrote:
> When neither a release nor a wait operation is specified it is possible
> to let the dma_fence live on independent of the module who issued it.
>=20
> This makes it possible to unload drivers and only wait for all their
> fences to signal.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
> =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A02 files changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 982f2b2a62c0..39f73edf3a33 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -374,6 +374,14 @@ int dma_fence_signal_timestamp_locked(struct dma_fen=
ce *fence,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->flags)))
> =C2=A0		return -EINVAL;
> =C2=A0
> +	/*
> +	 * When neither a release nor a wait operation is specified set the ops
> +	 * pointer to NULL to allow the fence structure to become independent
> +	 * who originally issued it.
> +	 */
> +	if (!fence->ops->release && !fence->ops->wait)
> +		RCU_INIT_POINTER(fence->ops, NULL);

OK, so the basic idea is that still living fences can't access driver
data or driver code anymore after the driver is unloaded. Good and
well, nice idea. We need something like that in Rust, too.

That's based on the rule that the driver, on unload, must signal all
the fences. Also OK.

However, how can that possibly fly by relying on the release callback
not being implemented? How many users don't need it, and could those
who implement release() be ported to.. sth else?


P.

> +
> =C2=A0	/* Stash the cb_list before replacing it with the timestamp */
> =C2=A0	list_replace(&fence->cb_list, &cb_list);
> =C2=A0
> @@ -513,7 +521,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool =
intr, signed long timeout)
> =C2=A0	rcu_read_lock();
> =C2=A0	ops =3D rcu_dereference(fence->ops);
> =C2=A0	trace_dma_fence_wait_start(fence);
> -	if (ops->wait) {
> +	if (ops && ops->wait) {
> =C2=A0		/*
> =C2=A0		 * Implementing the wait ops is deprecated and not supported for
> =C2=A0		 * issuer independent fences, so it is ok to use the ops outside
> @@ -578,7 +586,7 @@ void dma_fence_release(struct kref *kref)
> =C2=A0	}
> =C2=A0
> =C2=A0	ops =3D rcu_dereference(fence->ops);
> -	if (ops->release)
> +	if (ops && ops->release)
> =C2=A0		ops->release(fence);
> =C2=A0	else
> =C2=A0		dma_fence_free(fence);
> @@ -614,7 +622,7 @@ static bool __dma_fence_enable_signaling(struct dma_f=
ence *fence)
> =C2=A0
> =C2=A0	rcu_read_lock();
> =C2=A0	ops =3D rcu_dereference(fence->ops);
> -	if (!was_set && ops->enable_signaling) {
> +	if (!was_set && ops && ops->enable_signaling) {
> =C2=A0		trace_dma_fence_enable_signal(fence);
> =C2=A0
> =C2=A0		if (!ops->enable_signaling(fence)) {
> @@ -1000,7 +1008,7 @@ void dma_fence_set_deadline(struct dma_fence *fence=
, ktime_t deadline)
> =C2=A0
> =C2=A0	rcu_read_lock();
> =C2=A0	ops =3D rcu_dereference(fence->ops);
> -	if (ops->set_deadline && !dma_fence_is_signaled(fence))
> +	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
> =C2=A0		ops->set_deadline(fence, deadline);
> =C2=A0	rcu_read_unlock();
> =C2=A0}
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 38421a0c7c5b..e1ba1d53de88 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -425,7 +425,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
> =C2=A0
> =C2=A0	rcu_read_lock();
> =C2=A0	ops =3D rcu_dereference(fence->ops);
> -	if (ops->signaled && ops->signaled(fence)) {
> +	if (ops && ops->signaled && ops->signaled(fence)) {
> =C2=A0		rcu_read_unlock();
> =C2=A0		dma_fence_signal_locked(fence);
> =C2=A0		return true;
> @@ -461,7 +461,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
> =C2=A0
> =C2=A0	rcu_read_lock();
> =C2=A0	ops =3D rcu_dereference(fence->ops);
> -	if (ops->signaled && ops->signaled(fence)) {
> +	if (ops && ops->signaled && ops->signaled(fence)) {
> =C2=A0		rcu_read_unlock();
> =C2=A0		dma_fence_signal(fence);
> =C2=A0		return true;

