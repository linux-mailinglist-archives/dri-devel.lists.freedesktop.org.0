Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0567C849BA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 11:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1851710E3BB;
	Tue, 25 Nov 2025 10:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="I0oFNr9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83B810E3B6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 10:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764068314;
 bh=8X/qwjuwikxSf/pIi2QQ28vbvxJoO9Gtn/+n3x/9S9w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I0oFNr9cBrN0DjOqWXN3qSW9snKBefQxZ2mweWg0aoXfeE+yTpem633EkeaAr9by3
 +91+rwOQLrnzn1SM8PhKg2+tfvkQK3nGUhhO5GdcYJmUhfGTPHNd1E4d8zxplM9ief
 E7Lg6rO2xEibAFuNN9m0wmO5HKRgcxN7hxHZKKYhHdquwmxwusxhyN8OndzRemLf7W
 iyyrYnAJK8RroKoUP3SePmVRLkqqCRmLZzOWgSHJLAoNgvbFmxUzAiOC2WuWkelTtg
 f3jhDv1+eys5WrM6d0lcE/wbwHrlqqvJl3VcTXVqU4DkmAXB+SFRPvk0ZUPwmqp5tK
 rLsOiXaGCt8EQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B42AF17E0610;
 Tue, 25 Nov 2025 11:58:33 +0100 (CET)
Date: Tue, 25 Nov 2025 11:58:29 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Daniel Almeida <daniel.almeida@collabora.com>, Alice
 Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Alexandre Courbot <acourbot@nvidia.com>, Dave
 Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, Peter Colberg
 <pcolberg@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC WIP 2/3] rust: sync: Add dma_fence abstractions
Message-ID: <20251125115829.24e6caf7@fedora>
In-Reply-To: <bc4f01ec5172d29abd64429e3017cc53c0522e01.camel@mailbox.org>
References: <20251118132520.266179-2-phasta@kernel.org>
 <20251118132520.266179-4-phasta@kernel.org>
 <E55D72FC-AEF6-4D2D-973F-123306E4EB4C@collabora.com>
 <bc4f01ec5172d29abd64429e3017cc53c0522e01.camel@mailbox.org>
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

On Tue, 25 Nov 2025 10:48:12 +0100
Philipp Stanner <phasta@mailbox.org> wrote:

> > > +impl ArcBorrow<'_, DmaFenceCtx> {
> > > +=C2=A0=C2=A0=C2=A0 /// Create a new fence, consuming `data`.
> > > +=C2=A0=C2=A0=C2=A0 ///
> > > +=C2=A0=C2=A0=C2=A0 /// The fence will increment the refcount of the =
fence context associated with this
> > > +=C2=A0=C2=A0=C2=A0 /// [`DmaFenceCtx`].
> > > +=C2=A0=C2=A0=C2=A0 pub fn new_fence<T>(
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &mut self,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data: impl PinInit<T>,
> > > +=C2=A0=C2=A0=C2=A0 ) -> Result<ARef<DmaFence<T>>> {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fctx: Arc<DmaFenceCtx=
> =3D (*self).into();
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let seqno: u64 =3D fctx.g=
et_new_fence_seqno();
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // TODO: Should we reset =
seqno in case of failure? =20
> >=20
> > I think we should go back to the old value, yeah. =20
>=20
> It would be trivial to implement that (just atomic.decrement()).
>=20
> The thing why the TODO even exists is that I'm a bit unsure about
> races. It seems we have to choose between either a gap in the seqnos or
> the possiblity of seqnos being out of order.
>=20
> If the user / driver creates fences with >1 thread on a fence context,
> I mean.
>=20
> We're pretty free in our choices, however. The shared fence-fctx
> spinlock will be removed anyways, so one could later easily replace the
> fctx atomic with a lock if that's desirable.
>=20
> I can implement a seqno-decrement for now.

I don't think we need to return unused seqnos in case of failure. I
mean, we could have something like the following pseudo-code:

	atomic_cmpxchg(ctx.seqno, fence.seqno + 1, fence.seqno)

but it wouldn't cover the case where fences are not returned in the
order they were assigned, and seqnos are pretty cheap anyway (if a u64
is enough to count things in nanoseconds for hundreds of years, they are
more than enough for a fence timeline on which fences are emitted at a
way lower rate, even in case of recurring failures). The guarantee we
really care about is seqnos not going backward, because that would mess
up with the assumption that fences on a given timeline/ctx are signalled
in order (this assumption is used to coalesce fences in a
fence_array/resv IIRC).
