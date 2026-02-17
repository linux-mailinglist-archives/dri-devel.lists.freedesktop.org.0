Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKboL151lGlmEAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 15:04:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143C614CF31
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 15:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A3410E25E;
	Tue, 17 Feb 2026 14:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ImZ3NB8u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE7110E25E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 14:04:09 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fFhFy3H7Gz9ss3;
 Tue, 17 Feb 2026 15:04:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1771337046; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppRD/uPxe+TTRNocgCzCwGOgX3BbHQSLRy7z1y3OVtU=;
 b=ImZ3NB8uC842fnWRwfcSQz9+235VRMXHpI50PJUhqU9C48XkVHWqqnYAAPMgcVdNy1e5a3
 Vi8i/MJK6llhGBRp1i/dtz0Vc0qJdiCjJf7dbWKx1xp9Gmr0BFoSHLikg7pKqkNms/H0yS
 VLSKHTUR+yoe1eiuhW8ML9qX0EBBwsCkbsDspAd/6s0AoagAH9YygcQmWqwDehrYH3eW53
 UkCckDZF8BsVaTiLNmB1WmBM7xupGO5k1LXp1TX18bf4/yd9VeHpXCBklNigmFzHFJVH9l
 S3bA5eqsF0C1NG5bdc3X5Rfl8V02VvpAozXuLaZUyFXVv+Ezt78XBTob2N5Esw==
Message-ID: <3d90656315ab0b52f4725ca7c2cd10859d1e4f69.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alice
 Ryhl <aliceryhl@google.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, phasta@kernel.org, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>,  Daniel Almeida <daniel.almeida@collabora.com>, Joel
 Fernandes <joelagnelf@nvidia.com>,  linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  rust-for-linux@vger.kernel.org
Date: Tue, 17 Feb 2026 15:03:57 +0100
In-Reply-To: <d9e00d8c-93c0-45f8-95f2-3235fb781e7a@amd.com>
References: <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210133617.0a4be958@fedora>
 <aYsvc3Q8h-Gg27-g@google.com> <20260210142631.6f8a3411@fedora>
 <aYs3VVH_UXMFa5oC@google.com>
 <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
 <aYtJznZcCEYBffil@google.com>
 <d9e00d8c-93c0-45f8-95f2-3235fb781e7a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: a39b3d18f28fd9b1e90
X-MBO-RS-META: 3szqqireognodmxtjpexkd4wuwt4jhd1
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,gmail.com,ffwll.ch,garyguo.net,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 143C614CF31
X-Rspamd-Action: no action

On Tue, 2026-02-10 at 16:45 +0100, Christian K=C3=B6nig wrote:
> On 2/10/26 16:07, Alice Ryhl wrote:
> > On Tue, Feb 10, 2026 at 02:56:52PM +0100, Christian K=C3=B6nig wrote:
> > > On 2/10/26 14:49, Alice Ryhl wrote:
> > > > On Tue, Feb 10, 2026 at 02:26:31PM +0100, Boris Brezillon wrote:
> > > > > On Tue, 10 Feb 2026 13:15:31 +0000
> > > > > Alice Ryhl <aliceryhl@google.com> wrote:
> > > > >=20
> > > > > > On Tue, Feb 10, 2026 at 01:36:17PM +0100, Boris Brezillon wrote=
:
> > > > > > > On Tue, 10 Feb 2026 10:15:04 +0000
> > > > > > > Alice Ryhl <aliceryhl@google.com> wrote:
> > > > > > > =C2=A0=20
> > > > > > > > impl MustBeSignalled<'_> {
> > > > > > > > =C2=A0=C2=A0=C2=A0 /// Drivers generally should not use thi=
s one.
> > > > > > > > =C2=A0=C2=A0=C2=A0 fn i_promise_it_will_be_signalled(self) =
-> WillBeSignalled { ... }
> > > > > > > >=20
> > > > > > > > =C2=A0=C2=A0=C2=A0 /// One way to ensure the fence has been=
 signalled is to signal it.
> > > > > > > > =C2=A0=C2=A0=C2=A0 fn signal_fence(self) -> WillBeSignalled=
 {
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fence.signa=
l();
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.i_promise_i=
t_will_be_signalled()
> > > > > > > > =C2=A0=C2=A0=C2=A0 }
> > > > > > > >=20
> > > > > > > > =C2=A0=C2=A0=C2=A0 /// Another way to ensure the fence will=
 be signalled is to spawn a
> > > > > > > > =C2=A0=C2=A0=C2=A0 /// workqueue item that promises to sign=
al it.
> > > > > > > > =C2=A0=C2=A0=C2=A0 fn transfer_to_wq(
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self,
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wq: &Workqueue,
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 item: impl DmaFe=
nceWorkItem,
> > > > > > > > =C2=A0=C2=A0=C2=A0 ) -> WillBeSignalled {
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // briefly obtai=
n the lock class of the wq to indicate to
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // lockdep that =
the signalling path "blocks" on arbitrary jobs
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // from this wq =
completing
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bindings::lock_a=
cquire(&wq->key);
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bindings::lock_r=
elease(&wq->key);
> > > > > > > >=20
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // enqueue the j=
ob
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wq.enqueue(item,=
 wq);
> > > > > > > >=20
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // The signature=
 of DmaFenceWorkItem::run() promises to arrange
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // for it to be =
signalled.
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.i_promise_i=
t_will_be_signalled()
> > > > > > > > =C2=A0=C2=A0=C2=A0 }=C2=A0=20
> > > > > > >=20
> > > > > > > I guess what's still missing is some sort of `transfer_to_hw(=
)`
> > > > > > > function and way to flag the IRQ handler taking over the fenc=
e
> > > > > > > signaling token.=C2=A0=20
> > > > > >=20
> > > > > > Yes, transfer to hardware needs to be another piece of logic si=
milar to
> > > > > > transfer to wq. And I imagine there are many ways such a transf=
er to
> > > > > > hardware could work.
> > > > > >=20
> > > > > > Unless you have a timeout on it, in which case the WillBeSignal=
led is
> > > > > > satisfied by the fact you have a timeout alone, and the signall=
ing that
> > > > > > happens from the irq is just an opportunistic signal from outsi=
de the
> > > > > > dma fence signalling critical path.
> > > > >=20
> > > > > Yes and no. If it deadlocks in the completion WorkItem because of
> > > > > allocations (or any of the forbidden use cases), I think we want =
to
> > > > > catch that, because that's a sign fences are likely to end up wit=
h
> > > > > timeouts when they should have otherwise been signaled properly.
> > > > >=20
> > > > > > Well ... unless triggering timeouts can block on GFP_KERNEL
> > > > > > allocations...
> > > > >=20
> > > > > I mean, the timeout handler should also be considered a DMA-signa=
lling
> > > > > path, and the same rules should apply to it.
> > > >=20
> > > > I guess that's fair. Even with a timeout you want both to be signal=
ling
> > > > path.
> > > >=20
> > > > I guess more generally, if a fence is signalled by mechanism A or B=
,
> > > > whichever happens first, you have the choice between:
> > >=20
> > > That doesn't happen in practice.
> > >=20
> > > For each fence you only have one signaling path you need to guarantee
> > > forward progress for.
> > >=20
> > > All other signaling paths are just opportunistically optimizations
> > > which *can* signal the fence, but there is no guarantee that they
> > > will.
> > >=20
> > > We used to have some exceptions to that, especially around aborting
> > > submissions, but those turned out to be a really bad idea as well.=C2=
=A0=20
> > >=20
> > > Thinking more about it you should probably enforce that there is only
> > > one signaling path for each fence signaling.
> >=20
> > I'm not really convinced by this.
> >=20
> > First, the timeout path must be a fence signalling path because the
> > reason you have a timeout in the first place is because the hw might
> > never signal the fence. So if the timeout path deadlocks on a
> > kmalloc(GFP_KERNEL) and the hw never comes around to wake you up, boom.
>=20
> Mhm, good point. On the other hand the timeout handling should probably b=
e considered part of the normal signaling path.


Why would anyone want to allocate in a timeout path in the first place =E2=
=80=93 especially for jobqueue?

Timeout -> close the associated ring. Done.
JobQueue will signal the done_fences with -ECANCELED.=20

What would the driver want to allocate in its timeout path, i.e.: timeout c=
allback.


P.
