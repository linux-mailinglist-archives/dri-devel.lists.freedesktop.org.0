Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAAAC844B2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 10:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7A010E39E;
	Tue, 25 Nov 2025 09:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="dmZkZdPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3A510E39F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 09:48:22 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dFyYb3brpz9tG0;
 Tue, 25 Nov 2025 10:48:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764064099; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WphHttedwhbcC6KACljdlXQ9DFRsHWon2RO4cPCiXVw=;
 b=dmZkZdPgaE38Zu7M3UemFAm4b0zT4dbswiJQDLr/2IofehFSmKjGbCQgsxFKDnJzRdMe0G
 +Mm20p7/QoBrOh8FHlP0BHGNPPoP77k/5gXONhH2oRk+3GsLJgdigink7q27fMfzZHLeIc
 bQ5tQjRXIMKS3bAFm1QwNHFdbdT5Qxi5MZTKCCQhiQBBm4uH5aA/RHfM4QMVJ1Cpwcu64H
 Q632uSuvaqzo9Bi44FW7XTzGLVgVYv6ZLj7+OJzd72FKnmtYvlFwNu/8uVYRj9z8jd/jWH
 8gevtfTFfxy9Zg7p577y5tVDP/enbWN31/6IhgDKzhrRK5zIXg+W/J2PG+9KMA==
Message-ID: <bc4f01ec5172d29abd64429e3017cc53c0522e01.camel@mailbox.org>
Subject: Re: [RFC WIP 2/3] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
To: Daniel Almeida <daniel.almeida@collabora.com>, Philipp Stanner
 <phasta@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,  Alexandre Courbot
 <acourbot@nvidia.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, Peter
 Colberg <pcolberg@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Tue, 25 Nov 2025 10:48:12 +0100
In-Reply-To: <E55D72FC-AEF6-4D2D-973F-123306E4EB4C@collabora.com>
References: <20251118132520.266179-2-phasta@kernel.org>
 <20251118132520.266179-4-phasta@kernel.org>
 <E55D72FC-AEF6-4D2D-973F-123306E4EB4C@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 8a68871e12d96e4a55c
X-MBO-RS-META: 9ikcbr3oinihsejoq4ajmed9p65wxnjf
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

On Mon, 2025-11-24 at 09:49 -0300, Daniel Almeida wrote:
> Hi Phillipp,
>=20
> >=20

[=E2=80=A6]

> > +use kernel::sync::{Arc, ArcBorrow};
> > +use kernel::c_str;
> > +
> > +/// Defines the callback function the dma-fence backend will call once=
 the fence gets signalled.
> > +pub trait DmaFenceCbFunc {
> > +=C2=A0=C2=A0=C2=A0 /// The callback function. `cb` is a container of t=
he data which the driver passed in
> > +=C2=A0=C2=A0=C2=A0 /// [`DmaFence::register_callback`].
> > +=C2=A0=C2=A0=C2=A0 fn callback(cb: Pin<KBox<DmaFenceCb<Self>>>)
> > +=C2=A0=C2=A0=C2=A0 where
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self: Sized;
> > +}
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
> We should probably deref to this type.

As a transparent container you mean. I can put it on the todo-list.

>=20
> > +}
> > +
> > +impl<T: DmaFenceCbFunc + 'static> DmaFenceCb<T> {
> >=20

[=E2=80=A6]

> > +impl ArcBorrow<'_, DmaFenceCtx> {
> > +=C2=A0=C2=A0=C2=A0 /// Create a new fence, consuming `data`.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// The fence will increment the refcount of the fe=
nce context associated with this
> > +=C2=A0=C2=A0=C2=A0 /// [`DmaFenceCtx`].
> > +=C2=A0=C2=A0=C2=A0 pub fn new_fence<T>(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &mut self,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data: impl PinInit<T>,
> > +=C2=A0=C2=A0=C2=A0 ) -> Result<ARef<DmaFence<T>>> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fctx: Arc<DmaFenceCtx> =
=3D (*self).into();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let seqno: u64 =3D fctx.get=
_new_fence_seqno();
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // TODO: Should we reset se=
qno in case of failure?
>=20
> I think we should go back to the old value, yeah.

It would be trivial to implement that (just atomic.decrement()).

The thing why the TODO even exists is that I'm a bit unsure about
races. It seems we have to choose between either a gap in the seqnos or
the possiblity of seqnos being out of order.

If the user / driver creates fences with >1 thread on a fence context,
I mean.

We're pretty free in our choices, however. The shared fence-fctx
spinlock will be removed anyways, so one could later easily replace the
fctx atomic with a lock if that's desirable.

I can implement a seqno-decrement for now.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Pass `fctx` by value so =
that the fence will hold a reference to the DmaFenceCtx as long
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // as it lives.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DmaFence::new(fctx, data, &=
self.lock, self.nr, seqno)
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> >=20

[=E2=80=A6]

> > +
> > +impl<T> DmaFence<T> {
> > +=C2=A0=C2=A0=C2=A0 // TODO: There could be a subtle potential problem =
here? The LLVM compiler backend can create
> > +=C2=A0=C2=A0=C2=A0 // several versions of this constant. Their content=
 would be identical, but their addresses
> > +=C2=A0=C2=A0=C2=A0 // different.
> > +=C2=A0=C2=A0=C2=A0 const OPS: bindings::dma_fence_ops =3D Self::ops_cr=
eate();
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Create an initializer for a new [`DmaFence`].
> > +=C2=A0=C2=A0=C2=A0 fn new(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fctx: Arc<DmaFenceCtx>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data: impl PinInit<T>, // T=
ODO: The driver data should implement PinInit<T, Error>
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock: &Opaque<bindings::spi=
nlock_t>,
>=20
> I wonder if we should take a Rust lock directly?

Yes, good idea; Boqun has suggested that in the first dma_fence RFC,
too. It will be as simple as SpinLock<()>.

Will do in dma_fence RFC v2 and rebase the Jobqueue on it.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 context: u64,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 seqno: u64,
> > +=C2=A0=C2=A0=C2=A0 ) -> Result<ARef<Self>> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence =3D pin_init!(Sel=
f {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inn=
er <- Opaque::ffi_init(|slot: *mut bindings::dma_fence| {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 let lock_ptr =3D &raw const (*lock);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `slot` is a valid pointer to an uninitiali=
zed `struct dma_fence`.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // `lock_ptr` is a pointer to the spinlock of the fen=
ce context, which is shared
>=20
> Then we should perhaps extract that lock from the fence context itself, i=
nstead
> of passing it as an argument? This relationship is not enforced in the cu=
rrent
> code.

See the series linked in the cover letter. Soon fences will all have
their own lock, and the fctx will either just be the atomic seqno or
have a separate lock.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // among all the fences. This can't become a UAF beca=
use each fence takes a
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // reference of the fence context.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::dma_fence_init(slot, &Self::OPS, O=
paque::cast_into(lock_ptr), context, seqno) };
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dat=
a <- data,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sig=
nalling: false,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sig=
nalling_cookie: false,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fct=
x: fctx,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 });
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let b =3D KBox::pin_init(fe=
nce, GFP_KERNEL)?;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: We don't move th=
e contents of `b` anywhere here. After unwrapping it, ARef will
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // take care of preventing =
memory moves.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let rawptr =3D KBox::into_r=
aw(unsafe { Pin::into_inner_unchecked(b) });
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `rawptr` was cre=
ated validly above.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let aref =3D unsafe { ARef:=
:from_raw(NonNull::new_unchecked(rawptr)) };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(aref)
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Mark the beginning of a DmaFence signalling cri=
tical section. Should be called once a fence
> > +=C2=A0=C2=A0=C2=A0 /// gets published.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// The signalling critical section is marked as fi=
nished automatically once the fence signals.
> > +=C2=A0=C2=A0=C2=A0 pub fn begin_signalling(&mut self) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // FIXME: this needs to be =
mutable, obviously, but we can't borrow mutably. *sigh*
>=20
> Is AtomicBool going away? Otherwise can you expand?

The AtomicBool is just used in the example demo code.

The issue here is that begin_signalling() should set a "this fence is
currently in the signalling section"-flag. So the fence needs to be
mutable. Then, however, Rust complains because self.signalling is not
protected by any lock.

So one needs some sort of synchronization. Stuffing a DmaFence into a
SpinLock would be overkill, however, considering that the C code
already takes care of properly taking all locks.

I've asked about that problem on Zulip once:
https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/.=
E2.9C.94.20ARef.20without.20locking/near/539747635

Haven't looked deeper into solving it since, because those lockdep
guards are kind of nice-to-have at the moment.

I think the solution will be to make self.signalling an AtomicBool (I
think you meant that above?)

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.signalling =3D true;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // TODO: Should we warn if =
a user tries to do this several times for the same
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // fence? And should we ign=
ore the request if the fence is already signalled?
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `dma_fence_begin=
_signalling()` works on global lockdep data and calling it is
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // always safe.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.signalling_cookie =3D =
unsafe { bindings::dma_fence_begin_signalling() };
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> >=20
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
> Do you think it=E2=80=99s worth it to have a separate error type for when=
 fences
> are already signaled? I am asking, but I am not convinced either, FYI.

My tendency so far was to mostly ignore it. All users in C don't care
whether the fence already was signaled. dma_fence just returns -EINVAL
in that case (not a good choice anyways IMO).

AFAIR I was close to not having Rust's signal() return an error at all,
because it's kind of useless?

But, correct me if I'm wrong, I think the policy with Rust abstractions
is to map the C API as closely as possible?

Anyways, I'd expect Rust drivers to ignore that error, too.

>=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self.signalling {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // =
SAFETY: `dma_fence_end_signalling()` works on global lockdep data. The only
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // =
parameter is a boolean passed by value.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
afe { bindings::dma_fence_end_signalling(self.signalling_cookie) };
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(())
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Register a callback on a [`DmaFence`]. The call=
back will be invoked in the fence's
> > +=C2=A0=C2=A0=C2=A0 /// signalling path, i.e., critical section.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// Consumes `data`. `data` is passed back to the i=
mplemented callback function when the fence
> > +=C2=A0=C2=A0=C2=A0 /// gets signalled.
> > +=C2=A0=C2=A0=C2=A0 pub fn register_callback<U: DmaFenceCbFunc + 'stati=
c>(&self, data: impl PinInit<U>) -> Result {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let cb =3D DmaFenceCb::new(=
data)?;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let ptr =3D cb.into_foreign=
() as *mut DmaFenceCb<U>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `ptr` was create=
d validly directly above.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let inner_cb =3D unsafe { (=
*ptr).inner.get() };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.as_raw()` =
is valid because `self` is refcounted, `inner_cb` was created
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // validly above and was tu=
rned into a ForeignOwnable, so it won't be dropped. `callback`
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // has static life time.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let ret =3D unsafe {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin=
dings::dma_fence_add_callback(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 self.as_raw(),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 inner_cb,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Some(DmaFenceCb::<U>::callback),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ret !=3D 0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn Err(Error::from_errno(ret));
>=20
> Related to the question above: not being able to place a callback seems t=
o be
> common in the DRM scheduler (i.e.: the fence has signaled already). Hence=
 my
> question about a separate error type, as we would have to single out
> Err(EINVAL) often otherwise.

Interesting, dma_fence_add_callback() actually returns a different
error code, ENOENT, if the fence was signalled already, whereas
dma_fence_signal() gives EINVAL.

That's kind of not optimal. I'll consider fixing that on the C side.

Regardless, what's relevant for us here is that not being able to
register a callback is a serious failure that needs to be checked,
whereas trying to signal an already signaled fence is valid behavior
and no big deal.

If you try to register a callback on an already signaled fence, that
effectively means that you as the registering party need to take care
of the callback's code being executed, since dma_fence won't do that
anymore. The jobqueue design is catching that problem through the API
design; you were asking about the cb-registering API in the other mail,
I'll answer there.



Thx for the review!

P.
