Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHUkDNvnkmlSzwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 10:48:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0A51420F4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 10:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B6110E060;
	Mon, 16 Feb 2026 09:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bCeF2KEg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695A610E060
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 09:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771235286;
 bh=iIEvNz79W3Gc+2Ria4HM539VpSXcxo0H+XPzxfA5D3E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bCeF2KEgF5cWxWzTJY74hqwP6EvGEOCRBnydy66AyQKVCPP4/1lY7kL8UBlHMyZb+
 wndOIofEluq93Hi8EFVm9uZqKqIs7N+EN5XEGUyDTraey6XCPeOd26bEocXXsQC/6K
 ihqpEkD+GdYozO1khMN2d9gdhc4jr+OB5e2uawHimwHZY9B2ZF0+IdMHROHldTjsDw
 AKbfBNWHPbX0RPNXOAjj6ApL36nV02SDY6GVjX0hA8JhYiSfESfvEDotVN8MHB9JEQ
 znO5bjxul2b0oa+faCFuNMwYf1Q+Gn4iuzvTZZ0W1vQtSnZ18/aRod1QdlLAYeJmYP
 wl4D1l5rB/Osw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BEAFF17E1517;
 Mon, 16 Feb 2026 10:48:05 +0100 (CET)
Date: Mon, 16 Feb 2026 10:48:01 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Christian =?UTF-8?B?S8O2bmln?=
 <ckoenig.leichtzumerken@gmail.com>, matthew.brost@intel.com,
 sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 4/8] dma-buf: inline spinlock for fence protection v4
Message-ID: <20260216104801.214f3b3c@fedora>
In-Reply-To: <668921abf453f3cb65aca13a9c06e8c81c46a411.camel@mailbox.org>
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-5-christian.koenig@amd.com>
 <20260213152733.36789fa2@fedora>
 <668921abf453f3cb65aca13a9c06e8c81c46a411.camel@mailbox.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:phasta@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,linaro.org,lists.freedesktop.org,lists.linaro.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 8F0A51420F4
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 08:33:21 +0100
Philipp Stanner <phasta@mailbox.org> wrote:

> On Fri, 2026-02-13 at 15:27 +0100, Boris Brezillon wrote:
> > On Tue, 10 Feb 2026 11:01:59 +0100
> > "Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com> wrote:
> >  =20
> > > Implement per-fence spinlocks, allowing implementations to not give an
> > > external spinlock to protect the fence internal statei. Instead a spi=
nlock
> > > embedded into the fence structure itself is used in this case.
> > >=20
> > > Shared spinlocks have the problem that implementations need to guaran=
tee
> > > that the lock live at least as long all fences referencing them.
> > >=20
> > > Using a per-fence spinlock allows completely decoupling spinlock prod=
ucer
> > > and consumer life times, simplifying the handling in most use cases.
> > >=20
> > > v2: improve naming, coverage and function documentation
> > > v3: fix one additional locking in the selftests
> > > v4: separate out some changes to make the patch smaller,
> > > =C2=A0=C2=A0=C2=A0 fix one amdgpu crash found by CI systems
> > >=20
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > ---
> > > =C2=A0drivers/dma-buf/dma-fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++++++++++++-----
> > > =C2=A0drivers/dma-buf/sync_debug.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h=C2=A0 |=C2=A0 2 +-
> > > =C2=A0drivers/gpu/drm/drm_crtc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0drivers/gpu/drm/drm_writeback.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c |=C2=A0 3 ++-
> > > =C2=A0drivers/gpu/drm/qxl/qxl_release.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 3 ++-
> > > =C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_fence.c=C2=A0=C2=A0 |=C2=A0 3 ++-
> > > =C2=A0drivers/gpu/drm/xe/xe_hw_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 3 ++-
> > > =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 +++++++++++++------
> > > =C2=A010 files changed, 41 insertions(+), 19 deletions(-)
> > >=20
> > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > > index 56aa59867eaa..1833889e7466 100644
> > > --- a/drivers/dma-buf/dma-fence.c
> > > +++ b/drivers/dma-buf/dma-fence.c
> > > @@ -343,7 +343,6 @@ void __dma_fence_might_wait(void)
> > > =C2=A0}
> > > =C2=A0#endif
> > > =C2=A0
> > > -
> > > =C2=A0/**
> > > =C2=A0 * dma_fence_signal_timestamp_locked - signal completion of a f=
ence
> > > =C2=A0 * @fence: the fence to signal
> > > @@ -1067,7 +1066,6 @@ static void
> > > =C2=A0__dma_fence_init(struct dma_fence *fence, const struct dma_fenc=
e_ops *ops,
> > > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spinlock_t *l=
ock, u64 context, u64 seqno, unsigned long flags)
> > > =C2=A0{
> > > -	BUG_ON(!lock);
> > > =C2=A0	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_nam=
e);
> > > =C2=A0
> > > =C2=A0	kref_init(&fence->refcount);
> > > @@ -1078,10 +1076,15 @@ __dma_fence_init(struct dma_fence *fence, con=
st struct dma_fence_ops *ops,
> > > =C2=A0	 */
> > > =C2=A0	RCU_INIT_POINTER(fence->ops, ops);
> > > =C2=A0	INIT_LIST_HEAD(&fence->cb_list);
> > > -	fence->lock =3D lock;
> > > =C2=A0	fence->context =3D context;
> > > =C2=A0	fence->seqno =3D seqno;
> > > =C2=A0	fence->flags =3D flags | BIT(DMA_FENCE_FLAG_INITIALIZED_BIT);
> > > +	if (lock) {
> > > +		fence->extern_lock =3D lock;
> > > +	} else {
> > > +		spin_lock_init(&fence->inline_lock);
> > > +		fence->flags |=3D BIT(DMA_FENCE_FLAG_INLINE_LOCK_BIT); =20
> >=20
> > Hm, does this even make a different in term of instructions to check for
> > a bit instead of extern_lock =3D=3D NULL? If not, I'd be in favor of
> > killing this redundancy and checking extern_lock against NULL in
> > dma_fence_spinlock(). =20
>=20
> extern_lock and inline_lock are a union, so they overlap each other.
> inline_lock will only be equivalent to all zeros after initializing a
> new fence to 0.
>=20
>=20
> P.
>=20
> PS: Can you terminate messages by a delimiter or by cropping? I give
> this tip sometimes, because often the reviewer has to scroll emails
> down to the end to see whether there are further comments. I terminate
> my messages with "P." for that purpose ;]

I tend to strip messages and quote only the bits I comment on. I get
this time I didn't, my bad.
