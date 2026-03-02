Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKr5JZispWmpDgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:28:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92F81DBD44
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F39C10E525;
	Mon,  2 Mar 2026 15:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ar1BFOTD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41C310E524;
 Mon,  2 Mar 2026 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772465298;
 bh=2frp+WpzNkTFYjyNrr8OkFn8QJ3KVHcF+3FuLC11ZlM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ar1BFOTDmnzf3XBJNI/NDVMR3vDJw+RDNpgmDyiw+k5wlzerB9FIg5pyKeXKKV8Yo
 nXCVILykrbQ4q9u2EhmM3EJ/zHvHS7vZ2Msfo6yYB6HJhhb2+eXrUGQ8hF2xLppoH8
 mqjfP9nbeddpuchCkmsDSdDsvEHvvNXhJDELgBcZd+zXlOjQa8uczwVLJHMnrAvf/t
 pz3SYvHemNu73uJJgRGJdZi/UXHKQo3CsVI8zCe35T4j0HiQBJtk8NXSVWNoqxwSKz
 xf+6f6kQQcw85MaKXOTySWeauneO6N5p0NhqVgbzBozrjNzeB8nik3pioOYKEZpaNS
 BV0JfkSHO2Wqw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B03D17E0D90;
 Mon,  2 Mar 2026 16:28:18 +0100 (CET)
Date: Mon, 2 Mar 2026 16:28:12 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH 1/2] dma-buf: Assign separate lockdep class to chain lock
Message-ID: <20260302162812.15a0614b@fedora>
In-Reply-To: <20260224175544.2167712-1-matthew.brost@intel.com>
References: <20260224175544.2167712-1-matthew.brost@intel.com>
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
X-Rspamd-Queue-Id: B92F81DBD44
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:dkim,collabora.com:email]
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 09:55:43 -0800
Matthew Brost <matthew.brost@intel.com> wrote:

> dma_fence_chain_enable_signaling() runs while holding the chain
> inline_lock and may add callbacks to underlying fences, which takes
> their inline_lock.
>=20
> Since both locks share the same lockdep class, this valid nesting
> triggers a recursive locking warning. Assign a distinct lockdep class
> to the chain inline_lock so lockdep can correctly model the hierarchy.
>=20
> Fixes: a408c0ca0c41 ("dma-buf: use inline lock for the dma-fence-chain")
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/dma-buf/dma-fence-chain.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fenc=
e-chain.c
> index a707792b6025..4c2a9f2ce126 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -242,6 +242,9 @@ void dma_fence_chain_init(struct dma_fence_chain *cha=
in,
>  			  struct dma_fence *fence,
>  			  uint64_t seqno)
>  {
> +#if IS_ENABLED(CONFIG_LOCKDEP)
> +	static struct lock_class_key dma_fence_chain_lock_key;
> +#endif
>  	struct dma_fence_chain *prev_chain =3D to_dma_fence_chain(prev);
>  	uint64_t context;
> =20
> @@ -263,6 +266,20 @@ void dma_fence_chain_init(struct dma_fence_chain *ch=
ain,
>  	dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
>  			 context, seqno);
> =20
> +#if IS_ENABLED(CONFIG_LOCKDEP)
> +	/*
> +	 * dma_fence_chain_enable_signaling() is invoked while holding
> +	 * chain->base.inline_lock and may call dma_fence_add_callback()
> +	 * on the underlying fences, which takes their inline_lock.
> +	 *
> +	 * Since both locks share the same lockdep class, this legitimate
> +	 * nesting confuses lockdep and triggers a recursive locking
> +	 * warning. Assign a separate lockdep class to the chain lock
> +	 * to model this hierarchy correctly.
> +	 */
> +	lockdep_set_class(&chain->base.inline_lock, &dma_fence_chain_lock_key);
> +#endif

If we're going to recommend the use of this inline_lock for all new
dma_fence_ops implementers, as the commit message seems to imply

> Shared spinlocks have the problem that implementations need to guarantee
> that the lock lives at least as long all fences referencing them.
>=20
> Using a per-fence spinlock allows completely decoupling spinlock
> producer and consumer life times, simplifying the handling in most use
> cases.

maybe we should have the lock_class_key at the dma_buf_ops level and
have this lockdep_set_class() automated in __dma_fence_init().

> +
>  	/*
>  	 * Chaining dma_fence_chain container together is only allowed through
>  	 * the prev fence and not through the contained fence.

