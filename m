Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986ADC8DC1C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 11:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CCC10E704;
	Thu, 27 Nov 2025 10:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="fSIwiwA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF7510E7ED;
 Thu, 27 Nov 2025 10:29:39 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dHCNH4kq6z9ssn;
 Thu, 27 Nov 2025 11:29:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764239375; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CttLpGvt+BQI7FK1pMA6SKCpI/oMH9d0l5Icob0Xv4I=;
 b=fSIwiwA6qpIYUorjY8LpQXqNrz6Urb6q/aFKVfNSMud+gZT7ABBG5H2IzwfDsbNLSdpPqC
 feLZZUSyaf0sYn4mO1hnNbFz8/BBUsI8Ktz6JFVBGGCcs/HxceYSr4YJSuEWZUhF4LTY3Z
 9Sj6vD0EVIILmuO+H4TRPTrfZ4mOgyc9Ehgq9KAFNQlPLUzxSNKhF07qvKu5c/qk+nkLZX
 93VegSuldr//XgUG6JFfea0vw7teupZqey2RnELwQ/gEfQBqyKilSFViFGNmVdIJ+EUuTi
 JU6vOjtAfryT8arQzBmy1nNlkIMqOc8o+1yxuZiRM8jx08BZWwCyWitqEhulyg==
Message-ID: <7821929c041b973712968a4f90bd6e81e8051c81.camel@mailbox.org>
Subject: Re: [PATCH 03/18] dma-buf: detach fence ops on signal v2
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 sumit.semwal@linaro.org
Date: Thu, 27 Nov 2025 11:29:32 +0100
In-Reply-To: <20251113145332.16805-4-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-4-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 4b0056efd151b94d99d
X-MBO-RS-META: jz8qzc3tzot1mnufrpciosqww3ci6q6u
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
> When neither a release nor a wait backend ops is specified it is possible
> to let the dma_fence live on independently of the module who issued it.
>=20
> This makes it possible to unload drivers and only wait for all their
> fences to signal.
>=20
> v2: fix typo in comment
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Philipp Stanner <phasta@kernel.org>


> ---
> =C2=A0drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
> =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A02 files changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index ec21be9b089a..7074347f506d 100644
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
> +	 * from who originally issued it.
> +	 */
> +	if (!fence->ops->release && !fence->ops->wait)
> +		RCU_INIT_POINTER(fence->ops, NULL);
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
> index 77f07735f556..eb57bcc8712f 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -436,7 +436,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
> =C2=A0
> =C2=A0	rcu_read_lock();
> =C2=A0	ops =3D rcu_dereference(fence->ops);
> -	if (ops->signaled && ops->signaled(fence)) {
> +	if (ops && ops->signaled && ops->signaled(fence)) {
> =C2=A0		rcu_read_unlock();
> =C2=A0		dma_fence_signal_locked(fence);
> =C2=A0		return true;
> @@ -472,7 +472,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
> =C2=A0
> =C2=A0	rcu_read_lock();
> =C2=A0	ops =3D rcu_dereference(fence->ops);
> -	if (ops->signaled && ops->signaled(fence)) {
> +	if (ops && ops->signaled && ops->signaled(fence)) {
> =C2=A0		rcu_read_unlock();
> =C2=A0		dma_fence_signal(fence);
> =C2=A0		return true;

