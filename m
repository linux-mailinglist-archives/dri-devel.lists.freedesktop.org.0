Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UK5GKTczj2k+MQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:20:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 166D313707D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE56E10E800;
	Fri, 13 Feb 2026 14:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="f3Y9D6u3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719CB10E820
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 14:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770992433;
 bh=E2Uoi2C+Al/MQYTSip6vIAiy3pd4Hfy+uBSsZHCKBaw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f3Y9D6u348Kya/W74xifjxRWyXPg1GhBLW8AljtEbZ0x+LZ1pRr3GI2eC1QVP8FFF
 EGGa516+kVvcZoUfUmiz/lI44HUGvxRe9WfOdhNfJj+zqcCzFCz4r9oYSYgWWM4WX9
 Fl77LAfCYQ0pvDyuv1x2+ZyRcBhVqPW+HScAz0v0itP3OnNStyTg73VwmCiVnKGqqs
 D+maZxH9dYRNEuLDeBtmNNc+cwplVLkVOyHEw/MeaW3YAZorzedJVh+gs7WBwJLr9g
 wwcmiRprdoB+1oUtToGEyhG8Nf+nwKxciEAqpMSIv+MnLmBISHnzW9uCAfrhX6RDiq
 cMmP0EgExj0UQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D912117E01E7;
 Fri, 13 Feb 2026 15:20:32 +0100 (CET)
Date: Fri, 13 Feb 2026 15:20:28 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Christian =?UTF-8?B?S8O2bmln?=" <ckoenig.leichtzumerken@gmail.com>
Cc: phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/8] dma-buf: protected fence ops by RCU v5
Message-ID: <20260213152028.52e15600@fedora>
In-Reply-To: <20260210102232.1642-2-christian.koenig@amd.com>
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-2-christian.koenig@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 166D313707D
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 11:01:56 +0100
"Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com> wrote:

> At first glance it is counter intuitive to protect a constant function
> pointer table by RCU, but this allows modules providing the function
> table to unload by waiting for an RCU grace period.
>=20
> v2: make one the now duplicated lockdep warnings a comment instead.
> v3: Add more documentation to ->wait and ->release callback.
> v4: fix typo in documentation
> v5: rebased on drm-tip
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++------------
>  include/linux/dma-fence.h   | 29 ++++++++++++++--
>  2 files changed, 73 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index e05beae6e407..de9bf18be3d4 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -522,6 +522,7 @@ EXPORT_SYMBOL(dma_fence_signal);
>  signed long
>  dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long t=
imeout)
>  {
> +	const struct dma_fence_ops *ops;
>  	signed long ret;
> =20
>  	if (WARN_ON(timeout < 0))
> @@ -533,15 +534,21 @@ dma_fence_wait_timeout(struct dma_fence *fence, boo=
l intr, signed long timeout)
> =20
>  	dma_fence_enable_sw_signaling(fence);
> =20
> -	if (trace_dma_fence_wait_start_enabled()) {
> -		rcu_read_lock();
> -		trace_dma_fence_wait_start(fence);
> +	rcu_read_lock();
> +	ops =3D rcu_dereference(fence->ops);
> +	trace_dma_fence_wait_start(fence);
> +	if (ops->wait) {
> +		/*
> +		 * Implementing the wait ops is deprecated and not supported for
> +		 * issuer independent fences, so it is ok to use the ops outside
> +		 * the RCU protected section.
> +		 */
> +		rcu_read_unlock();
> +		ret =3D ops->wait(fence, intr, timeout);
> +	} else {
>  		rcu_read_unlock();
> -	}
> -	if (fence->ops->wait)
> -		ret =3D fence->ops->wait(fence, intr, timeout);
> -	else
>  		ret =3D dma_fence_default_wait(fence, intr, timeout);
> +	}
>  	if (trace_dma_fence_wait_end_enabled()) {
>  		rcu_read_lock();
>  		trace_dma_fence_wait_end(fence);
> @@ -562,6 +569,7 @@ void dma_fence_release(struct kref *kref)
>  {
>  	struct dma_fence *fence =3D
>  		container_of(kref, struct dma_fence, refcount);
> +	const struct dma_fence_ops *ops;
> =20
>  	rcu_read_lock();
>  	trace_dma_fence_destroy(fence);
> @@ -593,12 +601,12 @@ void dma_fence_release(struct kref *kref)
>  		spin_unlock_irqrestore(fence->lock, flags);
>  	}
> =20
> -	rcu_read_unlock();
> -
> -	if (fence->ops->release)
> -		fence->ops->release(fence);
> +	ops =3D rcu_dereference(fence->ops);
> +	if (ops->release)
> +		ops->release(fence);
>  	else
>  		dma_fence_free(fence);
> +	rcu_read_unlock();
>  }
>  EXPORT_SYMBOL(dma_fence_release);
> =20
> @@ -617,6 +625,7 @@ EXPORT_SYMBOL(dma_fence_free);
> =20
>  static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>  {
> +	const struct dma_fence_ops *ops;
>  	bool was_set;
> =20
>  	lockdep_assert_held(fence->lock);
> @@ -627,14 +636,18 @@ static bool __dma_fence_enable_signaling(struct dma=
_fence *fence)
>  	if (dma_fence_test_signaled_flag(fence))
>  		return false;
> =20
> -	if (!was_set && fence->ops->enable_signaling) {
> +	rcu_read_lock();
> +	ops =3D rcu_dereference(fence->ops);
> +	if (!was_set && ops->enable_signaling) {
>  		trace_dma_fence_enable_signal(fence);
> =20
> -		if (!fence->ops->enable_signaling(fence)) {
> +		if (!ops->enable_signaling(fence)) {
> +			rcu_read_unlock();
>  			dma_fence_signal_locked(fence);
>  			return false;
>  		}
>  	}
> +	rcu_read_unlock();
> =20
>  	return true;
>  }
> @@ -1007,8 +1020,13 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>   */
>  void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>  {
> -	if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
> -		fence->ops->set_deadline(fence, deadline);
> +	const struct dma_fence_ops *ops;
> +
> +	rcu_read_lock();
> +	ops =3D rcu_dereference(fence->ops);
> +	if (ops->set_deadline && !dma_fence_is_signaled(fence))
> +		ops->set_deadline(fence, deadline);
> +	rcu_read_unlock();
>  }
>  EXPORT_SYMBOL(dma_fence_set_deadline);
> =20
> @@ -1049,7 +1067,12 @@ __dma_fence_init(struct dma_fence *fence, const st=
ruct dma_fence_ops *ops,
>  	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
> =20
>  	kref_init(&fence->refcount);
> -	fence->ops =3D ops;
> +	/*
> +	 * At first glance it is counter intuitive to protect a constant
> +	 * function pointer table by RCU, but this allows modules providing the
> +	 * function table to unload by waiting for an RCU grace period.
> +	 */
> +	RCU_INIT_POINTER(fence->ops, ops);
>  	INIT_LIST_HEAD(&fence->cb_list);
>  	fence->lock =3D lock;
>  	fence->context =3D context;
> @@ -1129,11 +1152,12 @@ EXPORT_SYMBOL(dma_fence_init64);
>   */
>  const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>  {
> -	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> -			 "RCU protection is required for safe access to returned string");
> +	const struct dma_fence_ops *ops;
> =20
> +	/* RCU protection is required for safe access to returned string */
> +	ops =3D rcu_dereference(fence->ops);
>  	if (!dma_fence_test_signaled_flag(fence))
> -		return (const char __rcu *)fence->ops->get_driver_name(fence);
> +		return (const char __rcu *)ops->get_driver_name(fence);
>  	else
>  		return (const char __rcu *)"detached-driver";
>  }
> @@ -1161,11 +1185,12 @@ EXPORT_SYMBOL(dma_fence_driver_name);
>   */
>  const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>  {
> -	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> -			 "RCU protection is required for safe access to returned string");
> +	const struct dma_fence_ops *ops;
> =20
> +	/* RCU protection is required for safe access to returned string */
> +	ops =3D rcu_dereference(fence->ops);
>  	if (!dma_fence_test_signaled_flag(fence))
> -		return (const char __rcu *)fence->ops->get_driver_name(fence);
> +		return (const char __rcu *)ops->get_driver_name(fence);
>  	else
>  		return (const char __rcu *)"signaled-timeline";
>  }
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 9c4d25289239..6bf4feb0e01f 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -67,7 +67,7 @@ struct seq_file;
>   */
>  struct dma_fence {
>  	spinlock_t *lock;
> -	const struct dma_fence_ops *ops;
> +	const struct dma_fence_ops __rcu *ops;
>  	/*
>  	 * We clear the callback list on kref_put so that by the time we
>  	 * release the fence it is unused. No one should be adding to the
> @@ -220,6 +220,10 @@ struct dma_fence_ops {
>  	 * timed out. Can also return other error values on custom implementati=
ons,
>  	 * which should be treated as if the fence is signaled. For example a h=
ardware
>  	 * lockup could be reported like that.
> +	 *
> +	 * Implementing this callback prevents the fence from detaching after
> +	 * signaling and so it is mandatory for the module providing the
> +	 * dma_fence_ops to stay loaded as long as the dma_fence exists.
>  	 */
>  	signed long (*wait)(struct dma_fence *fence,
>  			    bool intr, signed long timeout);
> @@ -231,6 +235,13 @@ struct dma_fence_ops {
>  	 * Can be called from irq context.  This callback is optional. If it is
>  	 * NULL, then dma_fence_free() is instead called as the default
>  	 * implementation.
> +	 *
> +	 * Implementing this callback prevents the fence from detaching after
> +	 * signaling and so it is mandatory for the module providing the
> +	 * dma_fence_ops to stay loaded as long as the dma_fence exists.
> +	 *
> +	 * If the callback is implemented the memory backing the dma_fence
> +	 * object must be freed RCU safe.
>  	 */
>  	void (*release)(struct dma_fence *fence);
> =20
> @@ -454,13 +465,19 @@ dma_fence_test_signaled_flag(struct dma_fence *fenc=
e)
>  static inline bool
>  dma_fence_is_signaled_locked(struct dma_fence *fence)
>  {
> +	const struct dma_fence_ops *ops;
> +
>  	if (dma_fence_test_signaled_flag(fence))
>  		return true;
> =20
> -	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> +	rcu_read_lock();
> +	ops =3D rcu_dereference(fence->ops);
> +	if (ops->signaled && ops->signaled(fence)) {
> +		rcu_read_unlock();
>  		dma_fence_signal_locked(fence);
>  		return true;
>  	}
> +	rcu_read_unlock();
> =20
>  	return false;
>  }
> @@ -484,13 +501,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fenc=
e)
>  static inline bool
>  dma_fence_is_signaled(struct dma_fence *fence)
>  {
> +	const struct dma_fence_ops *ops;
> +
>  	if (dma_fence_test_signaled_flag(fence))
>  		return true;
> =20
> -	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> +	rcu_read_lock();
> +	ops =3D rcu_dereference(fence->ops);
> +	if (ops->signaled && ops->signaled(fence)) {
> +		rcu_read_unlock();
>  		dma_fence_signal(fence);
>  		return true;
>  	}
> +	rcu_read_unlock();
> =20
>  	return false;
>  }

