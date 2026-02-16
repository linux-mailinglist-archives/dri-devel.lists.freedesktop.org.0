Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CfxDE3Ikmm6xgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 08:33:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E26514145D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 08:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458D310E175;
	Mon, 16 Feb 2026 07:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rxb1qJ6e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA1610E175
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 07:33:27 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fDvdc2cFkz9tWn;
 Mon, 16 Feb 2026 08:33:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1771227204; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uASRMdbfWoss+hAxMXx9qtV27gkLmxIAGydsFqOR5Eo=;
 b=rxb1qJ6eW/dtwIaYEUCyUVw4B9hui+MR0ZhX2rsHqOdWUBBNDomjV+Aol6lzYv/0pb/amw
 YTWkr91GQGd3K2WOwhaChwxRSGpg7iFX5oQNa1q+tw55LAkK8sbqGKijAweRvxuEr0FmbS
 KgKfPFS2WKBZmn0ewNRv+wGv95CjMt87nfuOAP2QAkh7CxBvBvVuaups3go+B+l7phpzZ/
 8S2//yeBOZJ9AwqM6ErdrK4t9JOVBwD2hnDvmVJkiFBm+mLRQi3KdRBGHJMylw1DJsCyxr
 BEGc5YugjMvh7Dh/f0NE7I/KMG+OcGS3D0S4lQ+diJQFbk3vlj0hPjfuZ0n5SQ==
Message-ID: <668921abf453f3cb65aca13a9c06e8c81c46a411.camel@mailbox.org>
Subject: Re: [PATCH 4/8] dma-buf: inline spinlock for fence protection v4
From: Philipp Stanner <phasta@mailbox.org>
To: Boris Brezillon <boris.brezillon@collabora.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: matthew.brost@intel.com, sumit.semwal@linaro.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Mon, 16 Feb 2026 08:33:21 +0100
In-Reply-To: <20260213152733.36789fa2@fedora>
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-5-christian.koenig@amd.com>
 <20260213152733.36789fa2@fedora>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: tqozzon3qh7t6crug95y716okyph686y
X-MBO-RS-ID: 3ee4d0bf4dda64aaa30
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
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:ckoenig.leichtzumerken@gmail.com,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: 6E26514145D
X-Rspamd-Action: no action

On Fri, 2026-02-13 at 15:27 +0100, Boris Brezillon wrote:
> On Tue, 10 Feb 2026 11:01:59 +0100
> "Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com> wrote:
>=20
> > Implement per-fence spinlocks, allowing implementations to not give an
> > external spinlock to protect the fence internal statei. Instead a spinl=
ock
> > embedded into the fence structure itself is used in this case.
> >=20
> > Shared spinlocks have the problem that implementations need to guarante=
e
> > that the lock live at least as long all fences referencing them.
> >=20
> > Using a per-fence spinlock allows completely decoupling spinlock produc=
er
> > and consumer life times, simplifying the handling in most use cases.
> >=20
> > v2: improve naming, coverage and function documentation
> > v3: fix one additional locking in the selftests
> > v4: separate out some changes to make the patch smaller,
> > =C2=A0=C2=A0=C2=A0 fix one amdgpu crash found by CI systems
> >=20
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > ---
> > =C2=A0drivers/dma-buf/dma-fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++++++++++++-----
> > =C2=A0drivers/dma-buf/sync_debug.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h=C2=A0 |=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/drm_crtc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/drm_writeback.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c |=C2=A0 3 ++-
> > =C2=A0drivers/gpu/drm/qxl/qxl_release.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 3 ++-
> > =C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_fence.c=C2=A0=C2=A0 |=C2=A0 3 ++-
> > =C2=A0drivers/gpu/drm/xe/xe_hw_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 ++-
> > =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 +++++++++++++------
> > =C2=A010 files changed, 41 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index 56aa59867eaa..1833889e7466 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -343,7 +343,6 @@ void __dma_fence_might_wait(void)
> > =C2=A0}
> > =C2=A0#endif
> > =C2=A0
> > -
> > =C2=A0/**
> > =C2=A0 * dma_fence_signal_timestamp_locked - signal completion of a fen=
ce
> > =C2=A0 * @fence: the fence to signal
> > @@ -1067,7 +1066,6 @@ static void
> > =C2=A0__dma_fence_init(struct dma_fence *fence, const struct dma_fence_=
ops *ops,
> > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spinlock_t *loc=
k, u64 context, u64 seqno, unsigned long flags)
> > =C2=A0{
> > -	BUG_ON(!lock);
> > =C2=A0	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name)=
;
> > =C2=A0
> > =C2=A0	kref_init(&fence->refcount);
> > @@ -1078,10 +1076,15 @@ __dma_fence_init(struct dma_fence *fence, const=
 struct dma_fence_ops *ops,
> > =C2=A0	 */
> > =C2=A0	RCU_INIT_POINTER(fence->ops, ops);
> > =C2=A0	INIT_LIST_HEAD(&fence->cb_list);
> > -	fence->lock =3D lock;
> > =C2=A0	fence->context =3D context;
> > =C2=A0	fence->seqno =3D seqno;
> > =C2=A0	fence->flags =3D flags | BIT(DMA_FENCE_FLAG_INITIALIZED_BIT);
> > +	if (lock) {
> > +		fence->extern_lock =3D lock;
> > +	} else {
> > +		spin_lock_init(&fence->inline_lock);
> > +		fence->flags |=3D BIT(DMA_FENCE_FLAG_INLINE_LOCK_BIT);
>=20
> Hm, does this even make a different in term of instructions to check for
> a bit instead of extern_lock =3D=3D NULL? If not, I'd be in favor of
> killing this redundancy and checking extern_lock against NULL in
> dma_fence_spinlock().

extern_lock and inline_lock are a union, so they overlap each other.
inline_lock will only be equivalent to all zeros after initializing a
new fence to 0.


P.

PS: Can you terminate messages by a delimiter or by cropping? I give
this tip sometimes, because often the reviewer has to scroll emails
down to the end to see whether there are further comments. I terminate
my messages with "P." for that purpose ;]
