Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4807CC84F20
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 13:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B339C10E1E7;
	Tue, 25 Nov 2025 12:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="k2fdrdh8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCE310E1E7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 12:20:19 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dG1wv6NwJz9tjW;
 Tue, 25 Nov 2025 13:20:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764073215; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hLDFyfT9EndJf8AcTn74PgSt5lki+wkE1OitiOol2XM=;
 b=k2fdrdh8Rt70JoeGm5ThW5lpNrdHDeS3XeA6UVPe00SqtN7mpRO77jCQ9pEdQC4Zvh5WPS
 V0pOAikY9eg5LNDbgGD+wgCedIe1YJMRuHwGPUxJGlNVcTBeeiOs7yqcln7Tafq9lGdHNt
 Yfaik6oG+vMcq5XRKkIe8WBeBv7pmsQFOQ8STV0r8FVeMzFr90O0rJnNNdT99qfbEsGrVm
 La7vlEjh3T15etQ+j8fKpukGvQtk7+OvYEXutZZAznxKWXuWJWITaGVe5S9b2xPsAwMEAC
 WGXGZE7eHX5v8GGV0vJu9VrHH7Uj4WwH3dCJkYMDA7MqD9kEc31ccTt7IcTtKA==
Message-ID: <682a788c21c6513e30c5eb1020191f31f7aec612.camel@mailbox.org>
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
Date: Tue, 25 Nov 2025 13:20:03 +0100
In-Reply-To: <20251125115829.24e6caf7@fedora>
References: <20251118132520.266179-2-phasta@kernel.org>
 <20251118132520.266179-4-phasta@kernel.org>
 <E55D72FC-AEF6-4D2D-973F-123306E4EB4C@collabora.com>
 <bc4f01ec5172d29abd64429e3017cc53c0522e01.camel@mailbox.org>
 <20251125115829.24e6caf7@fedora>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: erwifug3wftbwfeeisezhppdzb6oqbux
X-MBO-RS-ID: 8dd4f54f3d9fb97adb0
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

On Tue, 2025-11-25 at 11:58 +0100, Boris Brezillon wrote:
> On Tue, 25 Nov 2025 10:48:12 +0100
> Philipp Stanner <phasta@mailbox.org> wrote:
>=20
> > > > +impl ArcBorrow<'_, DmaFenceCtx> {
> > > > +=C2=A0=C2=A0=C2=A0 /// Create a new fence, consuming `data`.
> > > > +=C2=A0=C2=A0=C2=A0 ///
> > > > +=C2=A0=C2=A0=C2=A0 /// The fence will increment the refcount of th=
e fence context associated with this
> > > > +=C2=A0=C2=A0=C2=A0 /// [`DmaFenceCtx`].
> > > > +=C2=A0=C2=A0=C2=A0 pub fn new_fence<T>(
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &mut self,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data: impl PinInit<T>,
> > > > +=C2=A0=C2=A0=C2=A0 ) -> Result<ARef<DmaFence<T>>> {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fctx: Arc<DmaFenceC=
tx> =3D (*self).into();
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let seqno: u64 =3D fctx=
.get_new_fence_seqno();
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // TODO: Should we rese=
t seqno in case of failure?=C2=A0=20
> > >=20
> > > I think we should go back to the old value, yeah.=C2=A0=20
> >=20
> > It would be trivial to implement that (just atomic.decrement()).
> >=20
> > The thing why the TODO even exists is that I'm a bit unsure about
> > races. It seems we have to choose between either a gap in the seqnos or
> > the possiblity of seqnos being out of order.
> >=20
> > If the user / driver creates fences with >1 thread on a fence context,
> > I mean.
> >=20
> > We're pretty free in our choices, however. The shared fence-fctx
> > spinlock will be removed anyways, so one could later easily replace the
> > fctx atomic with a lock if that's desirable.
> >=20
> > I can implement a seqno-decrement for now.
>=20
> I don't think we need to return unused seqnos in case of failure. I
> mean, we could have something like the following pseudo-code:
>=20
> 	atomic_cmpxchg(ctx.seqno, fence.seqno + 1, fence.seqno)

The code above is the code that creates fence.seqno in the first place,
obtaining the next seqno from the fctx (timeline).

>=20
> but it wouldn't cover the case where fences are not returned in the
> order they were assigned, and seqnos are pretty cheap anyway (if a u64
> is enough to count things in nanoseconds for hundreds of years, they are
> more than enough for a fence timeline on which fences are emitted at a
> way lower rate, even in case of recurring failures). The guarantee we
> really care about is seqnos not going backward, because that would mess
> up with the assumption that fences on a given timeline/ctx are signalled
> in order (this assumption is used to coalesce fences in a
> fence_array/resv IIRC).

Agreed, everything should signal according to the seqno.

The question we are facing with Rust (or rather, my design here) is
rather to what degree the infrastructure shall enforce this. As you
know, in C there isn't even a real "fence context", it's just an
abstract concept, represented by an integer maintained by the driver.

In Rust we can model it more exactly. For instance, we could enforce
ordered signaling by creating a function as the only way to signal
fences:

fctx.signal_all_fences_up_to_seqno(9042);

which then iterates over the fences, signaling all in order.


With some other APIs, such as jobqueue.submit_job(), which creates a
fence with the code above, it's trivial as long as the driver only
calls submit_job() with 1 thread.

If the driver came up with the idea of using >=3D2 threads firing on
submit_job(), then you by design have ordering issues, independently
from the fence context using this or that atomic operation or even full
locking.

If the driver scrambles calls to submit_job() or new_fence(), then it
can certainly happen that done_fences are signaled by JQ out of order =E2=
=80=93
though I'm not sure how horrible that would actually be, considering
that this does not imply that anything gets executed before all
dependencies are fullfiled. AFAICS it's more "nice to have / would be
the cleanest possible design".

I think I have a TODO in jobqueue where we could solve that by only
signaling pending done_fence's once all preceding fences have been
signaled.


P.
