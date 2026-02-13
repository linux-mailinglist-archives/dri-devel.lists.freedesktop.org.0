Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLqWBMszj2k+MQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:23:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB3E13709B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1E610E2F1;
	Fri, 13 Feb 2026 14:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VKjS/whA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836D810E2F1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 14:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770992581;
 bh=4ZuFx3oHsXDervj8s2y8ehxlvTGDYpAYSEQXl25VKxU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VKjS/whAoZgyXAXvbRB0zY5HZMw6SGpUIESLgpCYPsBXbKThZTU0NuZHnM4kU03G0
 qI58WGjOJswr5jxlB4GSTQFBWIgjAXRRG/guHzfFbGXrJkIDvmjETkxoBIr5MSvoIi
 2PuChwC7yy0LisIfGJ/AmaR7scVVkmrvI+pCfAuj/Aqe6u/PRb2Gr/P4GPx+F7dMNt
 Crgmrb4l1q7JGYWt49wcVewaqWLMZABXw24ZlDZadozgT6rZ1rBPPd54tpXqeQ0lFw
 T1v8D1Hpi99tpag2sDxxUP/ga5oXGup4mbDBdjb0hPCXW+VX07xA7Krcm1BmEOubEI
 SBAA74F2tpniw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E3C2717E01E7;
 Fri, 13 Feb 2026 15:23:00 +0100 (CET)
Date: Fri, 13 Feb 2026 15:22:57 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Christian =?UTF-8?B?S8O2bmln?=" <ckoenig.leichtzumerken@gmail.com>
Cc: phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/8] dma-buf: detach fence ops on signal v2
Message-ID: <20260213152257.2651e2bb@fedora>
In-Reply-To: <20260210102232.1642-3-christian.koenig@amd.com>
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-3-christian.koenig@amd.com>
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 5EB3E13709B
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 11:01:57 +0100
"Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com> wrote:

> When neither a release nor a wait backend ops is specified it is possible
> to let the dma_fence live on independently of the module who issued it.
>=20
> This makes it possible to unload drivers and only wait for all their
> fences to signal.
>=20
> v2: fix typo in comment
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reviewed-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

One nit below.

> ---
>  drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
>  include/linux/dma-fence.h   |  4 ++--
>  2 files changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index de9bf18be3d4..ba02321bef0b 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -371,6 +371,14 @@ void dma_fence_signal_timestamp_locked(struct dma_fe=
nce *fence,
>  				      &fence->flags)))
>  		return;
> =20
> +	/*
> +	 * When neither a release nor a wait operation is specified set the ops
> +	 * pointer to NULL to allow the fence structure to become independent
> +	 * from who originally issued it.

I think this deserves some comment in the dma_fence_ops doc, so that
people know what to expect when they implement this interface.

> +	 */
> +	if (!fence->ops->release && !fence->ops->wait)
> +		RCU_INIT_POINTER(fence->ops, NULL);
> +
>  	/* Stash the cb_list before replacing it with the timestamp */
>  	list_replace(&fence->cb_list, &cb_list);
> =20
> @@ -537,7 +545,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool =
intr, signed long timeout)
>  	rcu_read_lock();
>  	ops =3D rcu_dereference(fence->ops);
>  	trace_dma_fence_wait_start(fence);
> -	if (ops->wait) {
> +	if (ops && ops->wait) {
>  		/*
>  		 * Implementing the wait ops is deprecated and not supported for
>  		 * issuer independent fences, so it is ok to use the ops outside
> @@ -602,7 +610,7 @@ void dma_fence_release(struct kref *kref)
>  	}
> =20
>  	ops =3D rcu_dereference(fence->ops);
> -	if (ops->release)
> +	if (ops && ops->release)
>  		ops->release(fence);
>  	else
>  		dma_fence_free(fence);
> @@ -638,7 +646,7 @@ static bool __dma_fence_enable_signaling(struct dma_f=
ence *fence)
> =20
>  	rcu_read_lock();
>  	ops =3D rcu_dereference(fence->ops);
> -	if (!was_set && ops->enable_signaling) {
> +	if (!was_set && ops && ops->enable_signaling) {
>  		trace_dma_fence_enable_signal(fence);
> =20
>  		if (!ops->enable_signaling(fence)) {
> @@ -1024,7 +1032,7 @@ void dma_fence_set_deadline(struct dma_fence *fence=
, ktime_t deadline)
> =20
>  	rcu_read_lock();
>  	ops =3D rcu_dereference(fence->ops);
> -	if (ops->set_deadline && !dma_fence_is_signaled(fence))
> +	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
>  		ops->set_deadline(fence, deadline);
>  	rcu_read_unlock();
>  }
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 6bf4feb0e01f..e1afbb5909f9 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -472,7 +472,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
> =20
>  	rcu_read_lock();
>  	ops =3D rcu_dereference(fence->ops);
> -	if (ops->signaled && ops->signaled(fence)) {
> +	if (ops && ops->signaled && ops->signaled(fence)) {
>  		rcu_read_unlock();
>  		dma_fence_signal_locked(fence);
>  		return true;
> @@ -508,7 +508,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
> =20
>  	rcu_read_lock();
>  	ops =3D rcu_dereference(fence->ops);
> -	if (ops->signaled && ops->signaled(fence)) {
> +	if (ops && ops->signaled && ops->signaled(fence)) {
>  		rcu_read_unlock();
>  		dma_fence_signal(fence);
>  		return true;

