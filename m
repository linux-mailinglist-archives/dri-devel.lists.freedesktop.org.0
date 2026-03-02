Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H5NNGq9pWn8FQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 17:40:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0361DD0D1
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 17:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858E410E540;
	Mon,  2 Mar 2026 16:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="o8JG+XcT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FA110E1B9;
 Mon,  2 Mar 2026 16:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772469605;
 bh=e0LPHc0dSQpMVQTkBHuDCPcXCofZf1909IIidtRsbw8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o8JG+XcTNcaNYlffXWaaKCCrw9LZmti4q2VNupkdU61UxWeDO/NPa9X5pcMzx+hlD
 Ml3U7nQeSIzSeKptRvDEpQpvIXAd+CbTEMiPgsPrvTSxmDRJC3PpMkiAJa66/G5OQp
 8nzgHuIYClMXS89Z+9sIR6Te8bDbUSN4Yup0k/AXYJwFVuooPY3+AcaMA0/eIYWM0j
 MdVy/AYMeNBfRGFIwSo2/Of8lYXeT/DQy5wgK/bp4Cr/yFyBSrlpawvpP/zeDvmaCP
 m5ziWmHszRUAC/83JoadRYNi72rOTG1pWswjWRlIS9T1KjU212bV9yk69ecsYmI3L0
 vfzMuJOCY+RgA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A5F3817E0EA0;
 Mon,  2 Mar 2026 17:40:04 +0100 (CET)
Date: Mon, 2 Mar 2026 17:39:59 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH 1/2] dma-buf: Assign separate lockdep class to chain lock
Message-ID: <20260302173959.1c07d7d5@fedora>
In-Reply-To: <470ae9bb-e955-4773-b5b5-cc97b5bda20a@amd.com>
References: <20260224175544.2167712-1-matthew.brost@intel.com>
 <20260302162812.15a0614b@fedora>
 <470ae9bb-e955-4773-b5b5-cc97b5bda20a@amd.com>
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
X-Rspamd-Queue-Id: 9B0361DD0D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: no action

On Mon, 2 Mar 2026 16:42:28 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 3/2/26 16:28, Boris Brezillon wrote:
> > On Tue, 24 Feb 2026 09:55:43 -0800
> > Matthew Brost <matthew.brost@intel.com> wrote:
> >  =20
> >> dma_fence_chain_enable_signaling() runs while holding the chain
> >> inline_lock and may add callbacks to underlying fences, which takes
> >> their inline_lock.
> >>
> >> Since both locks share the same lockdep class, this valid nesting
> >> triggers a recursive locking warning. Assign a distinct lockdep
> >> class to the chain inline_lock so lockdep can correctly model the
> >> hierarchy.
> >>
> >> Fixes: a408c0ca0c41 ("dma-buf: use inline lock for the
> >> dma-fence-chain") Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >> Cc: Philipp Stanner <phasta@kernel.org>
> >> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> >> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >> ---
> >>  drivers/dma-buf/dma-fence-chain.c | 17 +++++++++++++++++
> >>  1 file changed, 17 insertions(+)
> >>
> >> diff --git a/drivers/dma-buf/dma-fence-chain.c
> >> b/drivers/dma-buf/dma-fence-chain.c index
> >> a707792b6025..4c2a9f2ce126 100644 ---
> >> a/drivers/dma-buf/dma-fence-chain.c +++
> >> b/drivers/dma-buf/dma-fence-chain.c @@ -242,6 +242,9 @@ void
> >> dma_fence_chain_init(struct dma_fence_chain *chain, struct
> >> dma_fence *fence, uint64_t seqno)
> >>  {
> >> +#if IS_ENABLED(CONFIG_LOCKDEP)
> >> +	static struct lock_class_key dma_fence_chain_lock_key;
> >> +#endif
> >>  	struct dma_fence_chain *prev_chain =3D
> >> to_dma_fence_chain(prev); uint64_t context;
> >> =20
> >> @@ -263,6 +266,20 @@ void dma_fence_chain_init(struct
> >> dma_fence_chain *chain, dma_fence_init64(&chain->base,
> >> &dma_fence_chain_ops, NULL, context, seqno);
> >> =20
> >> +#if IS_ENABLED(CONFIG_LOCKDEP)
> >> +	/*
> >> +	 * dma_fence_chain_enable_signaling() is invoked while
> >> holding
> >> +	 * chain->base.inline_lock and may call
> >> dma_fence_add_callback()
> >> +	 * on the underlying fences, which takes their
> >> inline_lock.
> >> +	 *
> >> +	 * Since both locks share the same lockdep class, this
> >> legitimate
> >> +	 * nesting confuses lockdep and triggers a recursive
> >> locking
> >> +	 * warning. Assign a separate lockdep class to the chain
> >> lock
> >> +	 * to model this hierarchy correctly.
> >> +	 */
> >> +	lockdep_set_class(&chain->base.inline_lock,
> >> &dma_fence_chain_lock_key); +#endif =20
> >=20
> > If we're going to recommend the use of this inline_lock for all new
> > dma_fence_ops implementers, as the commit message seems to imply
> >  =20
> >> Shared spinlocks have the problem that implementations need to
> >> guarantee that the lock lives at least as long all fences
> >> referencing them.
> >>
> >> Using a per-fence spinlock allows completely decoupling spinlock
> >> producer and consumer life times, simplifying the handling in most
> >> use cases. =20
> >=20
> > maybe we should have the lock_class_key at the dma_buf_ops level and
> > have this lockdep_set_class() automated in __dma_fence_init(). =20
>=20
> The dma_fence_chain() and dma_fence_array() containers are the only
> ones who are allowed to nest the lock with other dma_fences. E.g. we
> have WARN_ON()s in place which fire when you try to stitch together
> something which won't work.
>=20
> So everybody else should get a lockdep warning when they try to do
> nasty things like this because you really can't guarantee lock order
> between different dma_fence implementations.

Okay, that makes sense.
