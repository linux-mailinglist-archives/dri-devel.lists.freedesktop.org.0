Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E62C8E8BD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 14:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7347F10E02F;
	Thu, 27 Nov 2025 13:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="KX2HwYlK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECAC10E02F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 13:45:14 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dHHjy3pbyz9tHc;
 Thu, 27 Nov 2025 14:45:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764251110; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HDrromgx4HgbeBPOlXiv35zzN5FAtYly0SE4RV5MXdU=;
 b=KX2HwYlKkmwopliaLzFiWdXjhyfBpMKWHxo94OICk95xgwkCUT6C1cf77sJ0/mO9ntEvji
 K4x/TDrKD9Es/NhUDkyOfCkgYNqPDxDrqS9u9kYCVfnh5E4Yrbc3ChLHQH2onKqpLP4yGo
 4WhU0QFPuQ5FUMJ93tr+6G5kkLU7dcS2dkmwWp6pgd4Z7BZG/zafTNx/rcgbPJ0QzUWQnF
 JMNnmMMVESp8WJLZmURd37K8QOaYIDqsoItjNMjBPte9yEBenNGYaUpSo3/qsnbUjiZrdC
 Uz+MNeyomlOX4eqaLwBMQKW+9Nj25IG7zsYYXVuo4PsMJNcrP03vKX0KUNBmDA==
Message-ID: <dd1e28ccf9e78881da11f1c96c1ccb2fcfe5fd00.camel@mailbox.org>
Subject: Re: [RFC WIP 2/3] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
To: Lyude Paul <lyude@redhat.com>, Philipp Stanner <phasta@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Alexandre Courbot
 <acourbot@nvidia.com>, Daniel Almeida <daniel.almeida@collabora.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Dave Airlie
 <airlied@redhat.com>, Peter Colberg <pcolberg@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
Date: Thu, 27 Nov 2025 14:45:06 +0100
In-Reply-To: <b8234f181d35b21a3319b95a54b21bdba11b8001.camel@redhat.com>
References: <20251118132520.266179-2-phasta@kernel.org>
 <20251118132520.266179-4-phasta@kernel.org>
 <b8234f181d35b21a3319b95a54b21bdba11b8001.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 0e1f101fe78498e00fb
X-MBO-RS-META: 9zpu7pas74igesmozo8t1j1m1o95pi7w
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

On Fri, 2025-11-21 at 18:03 -0500, Lyude Paul wrote:
> I haven't gone through this fully yet. I meant to today, but I ended up
> needing way more time to explain some of my review comments w/r/t some
> ww_mutex bindings for rust then I was expecting. But I do already have so=
me
> comments worth reading below:
>=20
> On Tue, 2025-11-18 at 14:25 +0100, Philipp Stanner wrote:
> >=20
> > +
> > +/// Container for driver data which the driver gets back in its callba=
ck once the fence gets
> > +/// signalled.
> > +#[pin_data]
> > +pub struct DmaFenceCb<T: DmaFenceCbFunc> {
> > +=C2=A0=C2=A0=C2=A0 /// C struct needed for the backend.
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 inner: Opaque<bindings::dma_fence_cb>,
> > +=C2=A0=C2=A0=C2=A0 /// Driver data.
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 pub data: T,
>=20
> It's entirely possible I've just never seen someone do this before but - =
is
> are we actually able to make pinned members of structs `pub`? I would hav=
e
> thought that wouldn't be allowed (especially if `data` was exposed as jus=
t
> `T`, since a user could then move it pretty easily and break the pinning
> guarantee).

>=20
> =E2=80=A6snip=E2=80=A6
>=20
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// # Safety
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// `ptr`must be a valid pointer to a [`DmaFence`].
> > +=C2=A0=C2=A0=C2=A0 unsafe fn dec_ref(ptr: NonNull<Self>) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `ptr` is never a=
 NULL pointer; and when `dec_ref()` is called
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // the fence is by definiti=
on still valid.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence =3D unsafe { (*pt=
r.as_ptr()).inner.get() };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Valid because `f=
ence` was created validly above.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::dma_fenc=
e_put(fence) }
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +impl<T> DmaFence<T> {
> > +=C2=A0=C2=A0=C2=A0 // TODO: There could be a subtle potential problem =
here? The LLVM compiler backend can create
> > +=C2=A0=C2=A0=C2=A0 // several versions of this constant. Their content=
 would be identical, but their addresses
> > +=C2=A0=C2=A0=C2=A0 // different.
> > +=C2=A0=C2=A0=C2=A0 const OPS: bindings::dma_fence_ops =3D Self::ops_cr=
eate();
>=20
> oh no, not you too!!! D:
>=20
> I can answer this question - yes, `OPS` definitely won't have a unique me=
mory
> address. Whether that's an issue or not depends on if you actually need t=
o
> check what pointer a `DmaFence` has its `dma_fence_ops` set to and compar=
e it
> against another. If not though, it's probably fine.

In C, there are some use cases where people check the fence_ops addr to
see to whom the fence belongs, AFAIK.

I, so far, can live with there being several ops as long as they all
point to the same functions:

get_driver_name() and get_timeline_name() won't be called by anyone any
time soon (maybe we could even remove them from C, but so far they are
mandatory), and release() receives its data pointer from the C backend,
and since all is pinned we should be good.

However, it's probably wise to at least leave a comment (without the
"TODO") there to make future extenders aware that they cannot identify
a fence by its ops.

> >=20
> >=20

[=E2=80=A6]

> > +
> > +=C2=A0=C2=A0=C2=A0 /// Signal the fence. This will invoke all register=
ed callbacks.
> > +=C2=A0=C2=A0=C2=A0 pub fn signal(&self) -> Result {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self` is refcou=
nted.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let ret =3D unsafe { bindin=
gs::dma_fence_signal(self.as_raw()) };
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ret !=3D 0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn Err(Error::from_errno(ret));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> You can just use to_result()

OK.

--


I want to present a new version of DmaFence soonish which takes the
separate spinlocks into account that Christian is working on.


P.
