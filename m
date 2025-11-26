Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4624C8A12B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 14:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1163510E53E;
	Wed, 26 Nov 2025 13:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="b5gG/lb1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7895F10E53E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 13:42:25 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dGgjB2V5dz9tkP;
 Wed, 26 Nov 2025 14:42:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764164542; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8tBCksQX/lN6TfzB7MLqlekbx8z3to8qCTCZhVftfI=;
 b=b5gG/lb178SBx2KQ2YaJ9ILrT3Xqedks5KYohXY/5mk6PbeCgVWphyv4UprzvcCAS3KoMM
 6YWmdwe2K2mUHEjHt8UV/WZBx7TrrtdTa/zYytkuxRUO1ck3QBo1/o+8ATjpHq7nlnZws2
 Idq2KfN6SiW/kKFAGWeZsQMBEjJ8qCcsmeCwInpSKh7nIWrcbrikPu2uu/HStA6jBndfhb
 B+7TqQKvRA3zdfg8lcPHGrzbq7xHe5BSq+AHF1fD+Pmmb6dvdRB5N59zoNXp0fChINpsYA
 0i4ITQ1R1pbGNrfgEqRc9yJC7IpuPRbblMQZUJvGQ90KVci+F3KDwWxQdfVdBg==
Message-ID: <6e0ea7fa210be3b7592197a276d99a9986834f6e.camel@mailbox.org>
Subject: Re: [RFC WIP 2/3] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: phasta@kernel.org, Daniel Almeida <daniel.almeida@collabora.com>, Alice
 Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Alexandre Courbot <acourbot@nvidia.com>, Dave
 Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, Peter Colberg
 <pcolberg@redhat.com>,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,  rust-for-linux@vger.kernel.org
Date: Wed, 26 Nov 2025 14:42:16 +0100
In-Reply-To: <20251125145040.350e54a9@fedora>
References: <20251118132520.266179-2-phasta@kernel.org>
 <20251118132520.266179-4-phasta@kernel.org>
 <E55D72FC-AEF6-4D2D-973F-123306E4EB4C@collabora.com>
 <bc4f01ec5172d29abd64429e3017cc53c0522e01.camel@mailbox.org>
 <20251125115829.24e6caf7@fedora>
 <682a788c21c6513e30c5eb1020191f31f7aec612.camel@mailbox.org>
 <20251125145040.350e54a9@fedora>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 6eb2e13faf69235993f
X-MBO-RS-META: 5weiccjg5byr19kozjy5gre33n8d161g
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

On Tue, 2025-11-25 at 14:50 +0100, Boris Brezillon wrote:
> On Tue, 25 Nov 2025 13:20:03 +0100
> Philipp Stanner <phasta@mailbox.org> wrote:
>=20

[=E2=80=A6]

>=20
> >=20
> > Agreed, everything should signal according to the seqno.
> >=20
> > The question we are facing with Rust (or rather, my design here) is
> > rather to what degree the infrastructure shall enforce this. As you
> > know, in C there isn't even a real "fence context", it's just an
> > abstract concept, represented by an integer maintained by the driver.
> >=20
> > In Rust we can model it more exactly. For instance, we could enforce
> > ordered signaling by creating a function as the only way to signal
> > fences:
> >=20
> > fctx.signal_all_fences_up_to_seqno(9042);
> >=20
> > which then iterates over the fences, signaling all in order.
>=20
> Up to you, but then it implies keeping a list of currently active
> fences attached to the context, plus some locks to protect this list.
> Another option would be to track the last signalled seqno at the
> context level, and complain if a fence with a lower seqno is signalled.

Well, JQ (or, maybe: the fence context) needs a list of fences to be
able to signal them.

At second glance, considering a more robust signalling API for DmaFence
as drafted out above, it might be the cleaner solution to have those
lists in the fctx and lock the lists there.

I'll investigate that.

>=20
> >=20
> >=20
> > With some other APIs, such as jobqueue.submit_job(), which creates a
> > fence with the code above, it's trivial as long as the driver only
> > calls submit_job() with 1 thread.
>=20
> As I was explaining to Daniel yesterday, you need some sort of
> serialization when you submit to the same context anyway. In Tyr,
> things will be serialized through the GPUVM resv, which guarantees that
> no more than one thread can allocate seqnos on a given context inside
> this critical section.
>=20
> >=20
> > If the driver came up with the idea of using >=3D2 threads firing on
> > submit_job(), then you by design have ordering issues, independently
> > from the fence context using this or that atomic operation or even full
> > locking.
>=20
> In practice you don't, because submission to a given context are
> serialized one way or another (see above). Maybe what we should assume
> is that only one thread gets a mutable ref to this FenceCtx/JobQueue,
> and seqno allocation is something requiring mutability. The locking is
> something that's provided by the layer giving a mutable ref to this
> fence context.

I think that would then be achieved the Rust-way by having submit_job()
take a &mut self.

Anyways, enforcing that sounds like a great idea to me; that solves the
seqno issue.

>=20
> >=20
> > If the driver scrambles calls to submit_job() or new_fence(), then it
> > can certainly happen that done_fences are signaled by JQ out of order =
=E2=80=93
> > though I'm not sure how horrible that would actually be, considering
> > that this does not imply that anything gets executed before all
> > dependencies are fullfiled. AFAICS it's more "nice to have / would be
> > the cleanest possible design".
>=20
> A fence context should really be bound to a GPU queue, and jobs on a
> GPU queue are expected to be executed in order. So long as the jobs are
> queued in order, they should be executed and signalled in order.
>=20

Jobs will ALWAYS be run in order, and their corresponding fences be
signalled in order. Just the seqno might be out-of-order, if there were
no solution as drafted above by you and me.

But no argument here, we should enforce that as much as possible.

>  Of
> course, this implies some locking when you prepare/queue jobs because
> preparation and queuing are two distinct steps, and if you let 2
> threads do that concurrently, the queuing won't be ordered.=C2=A0
> That's
> already stuff drivers have to deal with today, so I'm not sure we
> should make a difference for rust drivers, other than making this
> explicit by requiring mutable JobQueue/FenceCtx references in
> situations where we expect some higher-level locking to be in place.

Yes, the problem already exists. I brought to point up to answer the
question: to what degree do we want to enforce absolute correctness.

>=20
> >=20
> > I think I have a TODO in jobqueue where we could solve that by only
> > signaling pending done_fence's once all preceding fences have been
> > signaled.
>=20
> I believe this is something we want to enforce, not fix. If signalling
> is done out of order, that's probably a driver bug, and it should be
> reported as such IMHO.

We can only enforcing that by designing DmaFence the way I said above:

the only way to signal a fence is via the fctx:

fctx.signal_all_up_to_seqno(9001);


If we're sure that there's really never a use case where someone
definitely needs a raw dma_fence_signal() equivalent where you can just
randomly signal whatever you want, I think that's the right thing to
do.


P.
