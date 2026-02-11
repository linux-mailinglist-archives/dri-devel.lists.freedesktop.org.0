Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMKmObVUjGnblAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:06:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D5F123256
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8535B10E359;
	Wed, 11 Feb 2026 10:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Sii0OuOF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB2310E359
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 10:06:40 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4f9vGj3dH4z9v9S;
 Wed, 11 Feb 2026 11:06:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770804397; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ulZ8oXpOyxIGBeB4NUf6LE2wZ7XaF0a6xXMAJpmhIg8=;
 b=Sii0OuOF92lR4VNp1wszsI2WTg7WVqSB9235BnbW9yNSWTDLjCytS7W2owo/htm5QQY0HW
 5ONir7V1GDni1GmuATM0+RvMGFGCD+Rpm/VfEKqj4pchKiK+/kQizO9wvuR9RYHXVWD0MF
 aZewi0iiSwz6Fl8zrT4m6oIUwTW7CkyAqVvzQiYU53bjrFtmeiknIGablWUvuW0XE3JynV
 zXOReeRSlegpT+qk8Ufcj9DDlR6q427/jVzbHB2iSDpqYlb/ZMIseDNrcd78cdWAwGgAC8
 fMPJYNSF/h9LJikfiwot63Otqqq2Z9ecOnQvXwokSw2xx3KNR61Lvbp4T/fF/A==
Message-ID: <f1345723cc5a61cdec5a6f168f71a323b822b7e2.camel@mailbox.org>
Subject: Re: [PATCH 1/8] dma-buf: protected fence ops by RCU v5
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Wed, 11 Feb 2026 11:06:35 +0100
In-Reply-To: <20260210102232.1642-2-christian.koenig@amd.com>
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: ohutjas4wzmfoqujgeakiopcxw9sxx3r
X-MBO-RS-ID: b5ea9796890fbc85a5c
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,linaro.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[mailbox.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Queue-Id: 56D5F123256
X-Rspamd-Action: no action

On Tue, 2026-02-10 at 11:01 +0100, Christian K=C3=B6nig wrote:
> At first glance it is counter intuitive to protect a constant function
> pointer table by RCU, but this allows modules providing the function
> table to unload by waiting for an RCU grace period.

I think that someone who does not already have a deep understanding
about dma-buf and fences will have much trouble understanding *why*
this patch is in the log and *what it achieves*.

Good commit messages are at least as important as good code. In
drm/sched for example I've been trying so many times to figure out why
certain hacks and changes were implemented, but all that git-blame ever
gave me was one liners, often hinting at some driver internal work
around ._.

>=20
> v2: make one the now duplicated lockdep warnings a comment instead.
> v3: Add more documentation to ->wait and ->release callback.
> v4: fix typo in documentation
> v5: rebased on drm-tip
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++---------=
---
> =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 | 29 ++++++++++++++--
> =C2=A02 files changed, 73 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index e05beae6e407..de9bf18be3d4 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -522,6 +522,7 @@ EXPORT_SYMBOL(dma_fence_signal);
> =C2=A0signed long
> =C2=A0dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed l=
ong timeout)
> =C2=A0{
> +	const struct dma_fence_ops *ops;
> =C2=A0	signed long ret;
> =C2=A0
> =C2=A0	if (WARN_ON(timeout < 0))
> @@ -533,15 +534,21 @@ dma_fence_wait_timeout(struct dma_fence *fence, boo=
l intr, signed long timeout)
> =C2=A0
> =C2=A0	dma_fence_enable_sw_signaling(fence);
> =C2=A0
> -	if (trace_dma_fence_wait_start_enabled()) {

Why can wait_start_enabled() be removed? Is that related to the life
time decoupling or is it a separate topic?

> -		rcu_read_lock();
> -		trace_dma_fence_wait_start(fence);
> +	rcu_read_lock();
> +	ops =3D rcu_dereference(fence->ops);
> +	trace_dma_fence_wait_start(fence);
> +	if (ops->wait) {
> +		/*
> +		 * Implementing the wait ops is deprecated and not supported for
> +		 * issuer independent fences, so it is ok to use the ops outside

s/issuer/issuers of

And how do we know that this here is an independent fence?
What even is an "independent fence" =E2=80=93 one with internal spinlock?

> +		 * the RCU protected section.
> +		 */
> +		rcu_read_unlock();
> +		ret =3D ops->wait(fence, intr, timeout);
> +	} else {
> =C2=A0		rcu_read_unlock();
> -	}
> -	if (fence->ops->wait)
> -		ret =3D fence->ops->wait(fence, intr, timeout);
> -	else
> =C2=A0		ret =3D dma_fence_default_wait(fence, intr, timeout);
> +	}

The git diff here looks awkward. Do you use git format-patch --
histogram?

> =C2=A0	if (trace_dma_fence_wait_end_enabled()) {
> =C2=A0		rcu_read_lock();
> =C2=A0		trace_dma_fence_wait_end(fence);
> @@ -562,6 +569,7 @@ void dma_fence_release(struct kref *kref)
> =C2=A0{
> =C2=A0	struct dma_fence *fence =3D
> =C2=A0		container_of(kref, struct dma_fence, refcount);
> +	const struct dma_fence_ops *ops;
> =C2=A0
> =C2=A0	rcu_read_lock();
> =C2=A0	trace_dma_fence_destroy(fence);
> @@ -593,12 +601,12 @@ void dma_fence_release(struct kref *kref)
> =C2=A0		spin_unlock_irqrestore(fence->lock, flags);
> =C2=A0	}
> =C2=A0
> -	rcu_read_unlock();
> -
> -	if (fence->ops->release)
> -		fence->ops->release(fence);
> +	ops =3D rcu_dereference(fence->ops);
> +	if (ops->release)
> +		ops->release(fence);
> =C2=A0	else
> =C2=A0		dma_fence_free(fence);
> +	rcu_read_unlock();
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(dma_fence_release);
> =C2=A0
> @@ -617,6 +625,7 @@ EXPORT_SYMBOL(dma_fence_free);
> =C2=A0
> =C2=A0static bool __dma_fence_enable_signaling(struct dma_fence *fence)
> =C2=A0{
> +	const struct dma_fence_ops *ops;
> =C2=A0	bool was_set;
> =C2=A0
> =C2=A0	lockdep_assert_held(fence->lock);
> @@ -627,14 +636,18 @@ static bool __dma_fence_enable_signaling(struct dma=
_fence *fence)
> =C2=A0	if (dma_fence_test_signaled_flag(fence))
> =C2=A0		return false;
> =C2=A0
> -	if (!was_set && fence->ops->enable_signaling) {
> +	rcu_read_lock();
> +	ops =3D rcu_dereference(fence->ops);
> +	if (!was_set && ops->enable_signaling) {
> =C2=A0		trace_dma_fence_enable_signal(fence);
> =C2=A0
> -		if (!fence->ops->enable_signaling(fence)) {
> +		if (!ops->enable_signaling(fence)) {
> +			rcu_read_unlock();
> =C2=A0			dma_fence_signal_locked(fence);
> =C2=A0			return false;
> =C2=A0		}
> =C2=A0	}
> +	rcu_read_unlock();
> =C2=A0
> =C2=A0	return true;
> =C2=A0}
> @@ -1007,8 +1020,13 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> =C2=A0 */
> =C2=A0void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadli=
ne)
> =C2=A0{
> -	if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
> -		fence->ops->set_deadline(fence, deadline);
> +	const struct dma_fence_ops *ops;
> +
> +	rcu_read_lock();
> +	ops =3D rcu_dereference(fence->ops);
> +	if (ops->set_deadline && !dma_fence_is_signaled(fence))
> +		ops->set_deadline(fence, deadline);
> +	rcu_read_unlock();
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(dma_fence_set_deadline);
> =C2=A0
> @@ -1049,7 +1067,12 @@ __dma_fence_init(struct dma_fence *fence, const st=
ruct dma_fence_ops *ops,
> =C2=A0	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
> =C2=A0
> =C2=A0	kref_init(&fence->refcount);
> -	fence->ops =3D ops;
> +	/*
> +	 * At first glance it is counter intuitive to protect a constant
> +	 * function pointer table by RCU, but this allows modules providing the
> +	 * function table to unload by waiting for an RCU grace period.

Maybe add a sentence like "Fences can live longer than the module which
issued them."

> +	 */
> +	RCU_INIT_POINTER(fence->ops, ops);
> =C2=A0	INIT_LIST_HEAD(&fence->cb_list);
> =C2=A0	fence->lock =3D lock;
> =C2=A0	fence->context =3D context;
> @@ -1129,11 +1152,12 @@ EXPORT_SYMBOL(dma_fence_init64);
> =C2=A0 */
> =C2=A0const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
> =C2=A0{
> -	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> -			 "RCU protection is required for safe access to returned string");
> +	const struct dma_fence_ops *ops;
> =C2=A0
> +	/* RCU protection is required for safe access to returned string */
> +	ops =3D rcu_dereference(fence->ops);
> =C2=A0	if (!dma_fence_test_signaled_flag(fence))
> -		return (const char __rcu *)fence->ops->get_driver_name(fence);
> +		return (const char __rcu *)ops->get_driver_name(fence);
> =C2=A0	else
> =C2=A0		return (const char __rcu *)"detached-driver";
> =C2=A0}
> @@ -1161,11 +1185,12 @@ EXPORT_SYMBOL(dma_fence_driver_name);
> =C2=A0 */
> =C2=A0const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
> =C2=A0{
> -	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> -			 "RCU protection is required for safe access to returned string");
> +	const struct dma_fence_ops *ops;
> =C2=A0
> +	/* RCU protection is required for safe access to returned string */
> +	ops =3D rcu_dereference(fence->ops);
> =C2=A0	if (!dma_fence_test_signaled_flag(fence))
> -		return (const char __rcu *)fence->ops->get_driver_name(fence);
> +		return (const char __rcu *)ops->get_driver_name(fence);
> =C2=A0	else
> =C2=A0		return (const char __rcu *)"signaled-timeline";
> =C2=A0}

Did we make any progress in our conversation about removing those two
functions and callbacks? They're only used by i915.


> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 9c4d25289239..6bf4feb0e01f 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -67,7 +67,7 @@ struct seq_file;
> =C2=A0 */
> =C2=A0struct dma_fence {
> =C2=A0	spinlock_t *lock;
> -	const struct dma_fence_ops *ops;
> +	const struct dma_fence_ops __rcu *ops;
> =C2=A0	/*
> =C2=A0	 * We clear the callback list on kref_put so that by the time we
> =C2=A0	 * release the fence it is unused. No one should be adding to the
> @@ -220,6 +220,10 @@ struct dma_fence_ops {
> =C2=A0	 * timed out. Can also return other error values on custom impleme=
ntations,
> =C2=A0	 * which should be treated as if the fence is signaled. For exampl=
e a hardware
> =C2=A0	 * lockup could be reported like that.
> +	 *
> +	 * Implementing this callback prevents the fence from detaching after
> +	 * signaling and so it is mandatory for the module providing the

s/mandatory/necessary ?

> +	 * dma_fence_ops to stay loaded as long as the dma_fence exists.
> =C2=A0	 */
> =C2=A0	signed long (*wait)(struct dma_fence *fence,
> =C2=A0			=C2=A0=C2=A0=C2=A0 bool intr, signed long timeout);
> @@ -231,6 +235,13 @@ struct dma_fence_ops {
> =C2=A0	 * Can be called from irq context.=C2=A0 This callback is optional=
. If it is
> =C2=A0	 * NULL, then dma_fence_free() is instead called as the default
> =C2=A0	 * implementation.
> +	 *
> +	 * Implementing this callback prevents the fence from detaching after
> +	 * signaling and so it is mandatory for the module providing the

same

> +	 * dma_fence_ops to stay loaded as long as the dma_fence exists.
> +	 *
> +	 * If the callback is implemented the memory backing the dma_fence
> +	 * object must be freed RCU safe.
> =C2=A0	 */
> =C2=A0	void (*release)(struct dma_fence *fence);
> =C2=A0
> @@ -454,13 +465,19 @@ dma_fence_test_signaled_flag(struct dma_fence *fenc=
e)
> =C2=A0static inline bool
> =C2=A0dma_fence_is_signaled_locked(struct dma_fence *fence)
> =C2=A0{
> +	const struct dma_fence_ops *ops;
> +
> =C2=A0	if (dma_fence_test_signaled_flag(fence))
> =C2=A0		return true;
> =C2=A0
> -	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> +	rcu_read_lock();
> +	ops =3D rcu_dereference(fence->ops);
> +	if (ops->signaled && ops->signaled(fence)) {

Maybe you can educate me a bit about RCU here =E2=80=93 couldn't this still
race? If the ops were unloaded before you take rcu_read_lock(),
rcu_dereference() would give you an invalid pointer here since you
don't check for !ops, no?


> +		rcu_read_unlock();
> =C2=A0		dma_fence_signal_locked(fence);
> =C2=A0		return true;
> =C2=A0	}
> +	rcu_read_unlock();
> =C2=A0
> =C2=A0	return false;
> =C2=A0}
> @@ -484,13 +501,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fenc=
e)
> =C2=A0static inline bool
> =C2=A0dma_fence_is_signaled(struct dma_fence *fence)
> =C2=A0{
> +	const struct dma_fence_ops *ops;
> +
> =C2=A0	if (dma_fence_test_signaled_flag(fence))
> =C2=A0		return true;
> =C2=A0
> -	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> +	rcu_read_lock();
> +	ops =3D rcu_dereference(fence->ops);
> +	if (ops->signaled && ops->signaled(fence)) {

same


Danke,
P.

> +		rcu_read_unlock();
> =C2=A0		dma_fence_signal(fence);
> =C2=A0		return true;
> =C2=A0	}
> +	rcu_read_unlock();
> =C2=A0
> =C2=A0	return false;
> =C2=A0}

