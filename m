Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A728B84EA4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 15:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8ED10E035;
	Thu, 18 Sep 2025 13:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="uqITXsg9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9746110E035
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 13:53:18 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cSHCb1JR9z9tVj;
 Thu, 18 Sep 2025 15:53:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1758203595; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OUBYYvSGe+MepVbrBScAhlp/CIm+gqllylEfovme28g=;
 b=uqITXsg9G4RGk0ll8yauIDt5/9URtVno802vy+Hyju6yyn+LHlpoWVi/ko/+oeeJqEpN1I
 eZINJe11521zAhvO9nuIUxZuCLyhSgVooA/bdOM8fcv/iDxwMMQFmG3FbLAF7E383JcRMx
 6Yl1CLwYpUf03DW35QyF7V/3wn5VsBj29Tm+Py9kYyGuylI8Ren7n9T2GwXGnvn9TrNP+S
 n3o1TKRmcSzEXgdvdHRu6TpxMjYmdDrZGyVrhxdRU7S71VlSOddEq4d08bhtwoGJdVacd2
 G7OYRuzjrFrPu4kwgZdpIbqAipfX3Xuxvq6e4tA+wA71CjAA7e1xXlbEhaMQUA==
Message-ID: <c6910eec62f3eb4a22945cc10d02413572ea9bb7.camel@mailbox.org>
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>,  Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>,  Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Sumit Semwal
 <sumit.semwal@linaro.org>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Viresh Kumar <viresh.kumar@linaro.org>, Asahi
 Lina <lina+kernel@asahilina.net>, Daniel Almeida
 <daniel.almeida@collabora.com>,  Tamir Duberstein <tamird@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
 Lyude Paul <lyude@redhat.com>, Mitchell Levy <levymitchell0@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org
Date: Thu, 18 Sep 2025 15:53:06 +0200
In-Reply-To: <6d37c0a8-5066-4012-96bd-8d37df18312f@amd.com>
References: <20250918123100.124738-2-phasta@kernel.org>
 <6d37c0a8-5066-4012-96bd-8d37df18312f@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: fh4gxs65q1hz1ppk4ohkstxxabrodkdi
X-MBO-RS-ID: 7add6b8ef0eeea938de
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

On Thu, 2025-09-18 at 15:11 +0200, Christian K=C3=B6nig wrote:
> Oh, now it gets funny.

For the Rust compiler maybe ^^'
dma_fence is a tough nut to crack because of all its callbacks and
strict rules <.<

>=20
> Adding Tvrtko as well since he recently looked into making dma_fences mor=
e robust regarding context lifetime.
>=20
> On 18.09.25 14:30, Philipp Stanner wrote:
> > dma_fence is a synchronization mechanism which is needed by virtually
> > all GPU drivers.
> >=20
> > A dma_fence offers many features, among which the most important ones
> > are registering callbacks (for example to kick off a work item) which
> > get executed once a fence gets signalled.
> >=20
> > dma_fence has a number of callbacks. Only the two most basic ones
> > (get_driver_name(), get_timeline_name() are abstracted since they are
> > enough to enable the basic functionality.
> >=20
> > Callbacks in Rust are registered by passing driver data which implement=
s
> > the Rust callback trait, whose function will be called by the C backend=
.
> >=20
> > dma_fence's are always refcounted, so implement AlwaysRefcounted for
> > them. Once a reference drops to zero, the C backend calls a release
> > function, where we implement drop_in_place() to conveniently marry that
> > C-cleanup mechanism with Rust's ownership concepts.
> >=20
> > This patch provides basic functionality, but is still missing:
> > =C2=A0 - An implementation of PinInit<T, Error> for all driver data.
> > =C2=A0 - A clever implementation for working dma_fence_begin_signalling=
()
> > =C2=A0=C2=A0=C2=A0 guards. See the corresponding TODO in the code.
> > =C2=A0 - Additional useful helper functions such as dma_fence_is_signal=
ed().
> > =C2=A0=C2=A0=C2=A0 These _should_ be relatively trivial to implement, t=
hough.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > So. =C2=A1Hola!
> >=20
> > This is a highly WIP RFC. It's obviously at many places not yet
> > conforming very well to Rust's standards.
> >=20
> > Nevertheless, it has progressed enough that I want to request comments
> > from the community.
> >=20
> > There are a number of TODOs in the code to which I need input.
> >=20
> > Notably, it seems (half-)illegal to use a shared static reference to an
> > Atomic, which I currently use for the dma_fence unit test / docstring
> > test. I'm willing to rework that if someone suggests how.
> > (Still, shouldn't changing a global Atomic always be legal? It can race=
,
> > of course. But that's kind of the point of an atomic)
> >=20
> > What I want comments on the most is the design of the callbacks. I thin=
k
> > it's a great opportunity to provide Rust drivers with rust-only
> > callbacks, so that they don't have to bother about the C functions.
> >=20
> > dma_fence wise, only the most basic callbacks currently get implemented=
.
> > For Nova, AFAICS, we don't need much more than signalling fences and
> > registering callbacks.
> >=20
> >=20
> > Another, solvable, issue I'm having is designing the
> > dma_fence_begin_signallin() abstractions. There are TODOs about that in
> > the code. That should ideally be robust and not racy. So we might want
> > some sort of synchronized (locked?) way for using that abstraction.
> >=20
> >=20
> > Regarding the manually created spinlock of mine: I so far never need
> > that spinlock anywhere in Rust and wasn't sure what's then the best way
> > to pass a "raw" spinlock to C.
>=20
> I was hoping to remove that anyway. Maybe it's time to do so now.

Remove what, the spinlock pointer from struct dma_fence?
Or were you trying to quote the section above about
dma_fence_begin_signalling()?

If the lock were to be removed, would then the driver be responsible
for locking through its fence context?


P.

>=20
> Anyway I will need some time to look into it deeper.
>=20
> Regards,
> Christian.
>=20
> >=20
> >=20
> > So much from my side. Hope to hear from you.
> >=20
> > (I've compiled and tested this with the unit test on the current -rc3)
> >=20
> > Philipp
> > ---
> > =C2=A0rust/bindings/bindings_helper.h |=C2=A0=C2=A0 1 +
> > =C2=A0rust/helpers/dma_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 23 ++
> > =C2=A0rust/helpers/helpers.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0rust/helpers/spinlock.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 5 +
> > =C2=A0rust/kernel/sync.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0rust/kernel/sync/dma_fence.rs=C2=A0=C2=A0 | 388 +++++++++++++++++=
+++++++++++++++
> > =C2=A06 files changed, 420 insertions(+)
> > =C2=A0create mode 100644 rust/helpers/dma_fence.c
> > =C2=A0create mode 100644 rust/kernel/sync/dma_fence.rs
> >=20
> > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_h=
elper.h
> > index 84d60635e8a9..107cb6b6f4a4 100644
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -48,6 +48,7 @@
> > =C2=A0#include <linux/cred.h>
> > =C2=A0#include <linux/device/faux.h>
> > =C2=A0#include <linux/dma-mapping.h>
> > +#include <linux/dma-fence.h>
> > =C2=A0#include <linux/errname.h>
> > =C2=A0#include <linux/ethtool.h>
> > =C2=A0#include <linux/file.h>
> > diff --git a/rust/helpers/dma_fence.c b/rust/helpers/dma_fence.c
> > new file mode 100644
> > index 000000000000..a9fc4829bbae
> > --- /dev/null
> > +++ b/rust/helpers/dma_fence.c
> > @@ -0,0 +1,23 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/dma-fence.h>
> > +
> > +void rust_helper_dma_fence_get(struct dma_fence *f)
> > +{
> > +	dma_fence_get(f);
> > +}
> > +
> > +void rust_helper_dma_fence_put(struct dma_fence *f)
> > +{
> > +	dma_fence_put(f);
> > +}
> > +
> > +bool rust_helper_dma_fence_begin_signalling(void)
> > +{
> > +	return dma_fence_begin_signalling();
> > +}
> > +
> > +void rust_helper_dma_fence_end_signalling(bool cookie)
> > +{
> > +	dma_fence_end_signalling(cookie);
> > +}
> > diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> > index 7cf7fe95e41d..99a7f7834c03 100644
> > --- a/rust/helpers/helpers.c
> > +++ b/rust/helpers/helpers.c
> > @@ -20,6 +20,7 @@
> > =C2=A0#include "cred.c"
> > =C2=A0#include "device.c"
> > =C2=A0#include "dma.c"
> > +#include "dma_fence.c"
> > =C2=A0#include "drm.c"
> > =C2=A0#include "err.c"
> > =C2=A0#include "fs.c"
> > diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
> > index 42c4bf01a23e..017ac447ebbd 100644
> > --- a/rust/helpers/spinlock.c
> > +++ b/rust/helpers/spinlock.c
> > @@ -16,6 +16,11 @@ void rust_helper___spin_lock_init(spinlock_t *lock, =
const char *name,
> > =C2=A0#endif /* CONFIG_DEBUG_SPINLOCK */
> > =C2=A0}
> > =C2=A0
> > +void rust_helper_spin_lock_init(spinlock_t *lock)
> > +{
> > +	spin_lock_init(lock);
> > +}
> > +
> > =C2=A0void rust_helper_spin_lock(spinlock_t *lock)
> > =C2=A0{
> > =C2=A0	spin_lock(lock);
> > diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> > index 00f9b558a3ad..6e59526020bc 100644
> > --- a/rust/kernel/sync.rs
> > +++ b/rust/kernel/sync.rs
> > @@ -12,6 +12,7 @@
> > =C2=A0mod arc;
> > =C2=A0pub mod aref;
> > =C2=A0pub mod completion;
> > +pub mod dma_fence;
> > =C2=A0mod condvar;
> > =C2=A0pub mod lock;
> > =C2=A0mod locked_by;
> > @@ -20,6 +21,7 @@
> > =C2=A0
> > =C2=A0pub use arc::{Arc, ArcBorrow, UniqueArc};
> > =C2=A0pub use completion::Completion;
> > +pub use dma_fence::{DmaFence, DmaFenceCtx, DmaFenceNames, DmaFenceCb, =
DmaFenceCbFunc};
> > =C2=A0pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
> > =C2=A0pub use lock::global::{global_lock, GlobalGuard, GlobalLock, Glob=
alLockBackend, GlobalLockedBy};
> > =C2=A0pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
> > diff --git a/rust/kernel/sync/dma_fence.rs b/rust/kernel/sync/dma_fence=
.rs
> > new file mode 100644
> > index 000000000000..a00bb10b2208
> > --- /dev/null
> > +++ b/rust/kernel/sync/dma_fence.rs
> > @@ -0,0 +1,388 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! DmaFence support.
> > +//!
> > +//! Reference: <https://docs.kernel.org/driver-api/dma-buf.html#c.dma_=
fence>
> > +//!
> > +//! C header: [`include/linux/dma-fence.h`](srctree/include/linux/dma-=
fence.h)
> > +
> > +use crate::{
> > +=C2=A0=C2=A0=C2=A0 bindings,
> > +=C2=A0=C2=A0=C2=A0 prelude::*,
> > +=C2=A0=C2=A0=C2=A0 str::CStr,
> > +=C2=A0=C2=A0=C2=A0 types::ForeignOwnable,
> > +=C2=A0=C2=A0=C2=A0 types::{ARef, AlwaysRefCounted, Opaque},
> > +};
> > +
> > +use core::{
> > +=C2=A0=C2=A0=C2=A0 ptr::{drop_in_place, NonNull},
> > +=C2=A0=C2=A0=C2=A0 sync::atomic::{AtomicU64, Ordering},
> > +};
> > +
> > +use kernel::sync::{Arc, ArcBorrow};
> > +
> > +/// The C dma_fence backend functions ask for certain name parameters =
at times. In order to avoid
> > +/// storing those names in [`DmaFence`] (there can be millions of fenc=
es at the same time, wasting
> > +/// much memory), the driver must provide associated constants which t=
he C backend will access,
> > +/// ultimately.
> > +pub trait DmaFenceNames {
> > +=C2=A0=C2=A0=C2=A0 /// The driver's name.
> > +=C2=A0=C2=A0=C2=A0 const DRIVER_NAME: &CStr;
> > +=C2=A0=C2=A0=C2=A0 /// The name of the timeline the fence is associate=
d with.
> > +=C2=A0=C2=A0=C2=A0 const TIMELINE_NAME: &CStr;
> > +}
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
> > +}
> > +
> > +impl<T: DmaFenceCbFunc + 'static> DmaFenceCb<T> {
> > +=C2=A0=C2=A0=C2=A0 fn new(data: impl PinInit<T>) -> Result<Pin<KBox<Se=
lf>>> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let cb =3D try_pin_init!(Se=
lf {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inn=
er: Opaque::zeroed(), // This gets initialized by the C backend.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dat=
a <- data,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 });
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KBox::pin_init(cb, GFP_KERN=
EL)
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Callback for the C dma_fence backend.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// # Safety
> > +=C2=A0=C2=A0=C2=A0 /// All data used and cast in this function was val=
idly created by
> > +=C2=A0=C2=A0=C2=A0 /// [`DmaFence::register_callback`] and isn't modif=
ied by the C backend until this callback
> > +=C2=A0=C2=A0=C2=A0 /// here has run.
> > +=C2=A0=C2=A0=C2=A0 unsafe extern "C" fn callback(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _fence_ptr: *mut bindings::=
dma_fence,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cb_ptr: *mut bindings::dma_=
fence_cb,
> > +=C2=A0=C2=A0=C2=A0 ) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let cb_ptr =3D Opaque::cast=
_from(cb_ptr);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The constructor =
guarantees that `cb_ptr` is always `inner` of a DmaFenceCb.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let cb_ptr =3D unsafe { cra=
te::container_of!(cb_ptr, Self, inner) }.cast_mut() as *mut c_void;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `cp_ptr` is the =
heap memory of a Pin<Kbox<Self>> because it was created by
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // invoking ForeignOwnable:=
:into_foreign() on such an instance.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let cb =3D unsafe { <Pin<KB=
ox<Self>> as ForeignOwnable>::from_foreign(cb_ptr) };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Pass ownership back over=
 to the driver.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 T::callback(cb);
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +/// A dma-fence context. A fence context takes care of associating rel=
ated fences with each other,
> > +/// providing each with raising sequence numbers and a common identifi=
er.
> > +#[pin_data]
> > +pub struct DmaFenceCtx {
> > +=C2=A0=C2=A0=C2=A0 /// An opaque spinlock. Only ever passed to the C b=
ackend, never used by Rust.
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 lock: Opaque<bindings::spinlock_t>,
> > +=C2=A0=C2=A0=C2=A0 /// The fence context number.
> > +=C2=A0=C2=A0=C2=A0 nr: u64,
> > +=C2=A0=C2=A0=C2=A0 /// The sequence number for the next fence created.
> > +=C2=A0=C2=A0=C2=A0 seqno: AtomicU64,
> > +}
> > +
> > +impl DmaFenceCtx {
> > +=C2=A0=C2=A0=C2=A0 /// Create a new `DmaFenceCtx`.
> > +=C2=A0=C2=A0=C2=A0 pub fn new() -> Result<Arc<Self>> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let ctx =3D pin_init!(Self =
{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // =
Feed in a non-Rust spinlock for now, since the Rust side never needs the lo=
ck.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loc=
k <- Opaque::ffi_init(|slot: *mut bindings::spinlock| {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `slot` is a valid pointer to an uninitiali=
zed `struct spinlock_t`.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::spin_lock_init(slot) };
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // =
SAFETY: `dma_fence_context_alloc()` merely works on a global atomic. Parame=
ter `1`
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // =
is the number of contexts we want to allocate.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nr:=
 unsafe { bindings::dma_fence_context_alloc(1) },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 seq=
no: AtomicU64::new(0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 });
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Arc::pin_init(ctx, GFP_KERN=
EL)
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 fn get_new_fence_seqno(&self) -> u64 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.seqno.fetch_add(1, Ord=
ering::Relaxed)
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +impl ArcBorrow<'_, DmaFenceCtx> {
> > +=C2=A0=C2=A0=C2=A0 /// Create a new fence, consuming `data`.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// The fence will increment the refcount of the fe=
nce context associated with this
> > +=C2=A0=C2=A0=C2=A0 /// [`DmaFenceCtx`].
> > +=C2=A0=C2=A0=C2=A0 pub fn new_fence<T: DmaFenceNames>(
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
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Pass `fctx` by value so =
that the fence will hold a reference to the DmaFenceCtx as long
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // as it lives.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DmaFence::new(fctx, data, &=
self.lock, self.nr, seqno)
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +/// A synchronization primitive mainly for GPU drivers.
> > +///
> > +/// DmaFences are always reference counted. The typical use case is th=
at one side registers
> > +/// callbacks on the fence which will perform a certain action (such a=
s queueing work) once the
> > +/// other side signals the fence.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::c_str;
> > +/// use kernel::sync::{Arc, ArcBorrow, DmaFence, DmaFenceCtx, DmaFence=
Names, DmaFenceCb, DmaFenceCbFunc};
> > +/// use core::sync::atomic::{self, AtomicBool};
> > +///
> > +/// static mut CHECKER: AtomicBool =3D AtomicBool::new(false);
> > +///
> > +/// struct CallbackData {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 i: u32,
> > +/// }
> > +///
> > +/// impl CallbackData {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 fn new() -> Self {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self { i: 9 }
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +/// }
> > +///
> > +/// impl DmaFenceCbFunc for CallbackData {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 fn callback(cb: Pin<KBox<DmaFenceCb<Self>>=
>) where Self: Sized {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert_eq!(cb.data=
.i, 9);
> > +///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Just to=
 have an easy way for testing. This cannot race with the checker
> > +///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // because the fen=
ce signalling callbacks are executed synchronously.
> > +///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { CHECKER.s=
tore(true, atomic::Ordering::Relaxed); }
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +/// }
> > +///
> > +/// struct DriverData {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 i: u32,
> > +/// }
> > +///
> > +/// impl DriverData {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 fn new() -> Self {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self { i: 5 }
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +/// }
> > +///
> > +/// impl DmaFenceNames for DriverData {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 const DRIVER_NAME: &CStr =3D c_str!("DUMMY=
_DRIVER");
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 const TIMELINE_NAME: &CStr =3D c_str!("DUM=
MY_TIMELINE");
> > +/// }
> > +///
> > +/// let data =3D DriverData::new();
> > +/// let fctx =3D DmaFenceCtx::new()?;
> > +///
> > +/// let mut fence =3D fctx.as_arc_borrow().new_fence(data)?;
> > +///
> > +/// let cb_data =3D CallbackData::new();
> > +/// fence.register_callback(cb_data);
> > +/// // fence.begin_signalling();
> > +/// fence.signal()?;
> > +/// // Now check wehether the callback was actually executed.
> > +/// // SAFETY: `fence.signal()` above works sequentially. We just chec=
k here whether the signalling
> > +/// // actually did set the boolean correctly.
> > +/// unsafe { assert_eq!(CHECKER.load(atomic::Ordering::Relaxed), true)=
; }
> > +///
> > +/// Ok::<(), Error>(())
> > +/// ```
> > +#[pin_data]
> > +pub struct DmaFence<T> {
> > +=C2=A0=C2=A0=C2=A0 /// The actual dma_fence passed to C.
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 inner: Opaque<bindings::dma_fence>,
> > +=C2=A0=C2=A0=C2=A0 /// User data.
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 data: T,
> > +=C2=A0=C2=A0=C2=A0 /// Marks whether the fence is currently in the sig=
nalling critical section.
> > +=C2=A0=C2=A0=C2=A0 signalling: bool,
> > +=C2=A0=C2=A0=C2=A0 /// A boolean needed for the C backend's lockdep gu=
ard.
> > +=C2=A0=C2=A0=C2=A0 signalling_cookie: bool,
> > +=C2=A0=C2=A0=C2=A0 /// A reference to the associated [`DmaFenceCtx`] s=
o that it cannot be dropped while there are
> > +=C2=A0=C2=A0=C2=A0 /// still fences around.
> > +=C2=A0=C2=A0=C2=A0 fctx: Arc<DmaFenceCtx>,
> > +}
> > +
> > +// SAFETY: `DmaFence` is safe to be sent to any task.
> > +unsafe impl<T> Send for DmaFence<T> {}
> > +
> > +// SAFETY: `DmaFence` is safe to be accessed concurrently.
> > +unsafe impl<T> Sync for DmaFence<T> {}
> > +
> > +// SAFETY: These implement the C backends refcounting methods which ar=
e proven to work correctly.
> > +unsafe impl<T: DmaFenceNames> AlwaysRefCounted for DmaFence<T> {
> > +=C2=A0=C2=A0=C2=A0 fn inc_ref(&self) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.as_raw()` =
is a pointer to a valid `struct dma_fence`.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::dma_fenc=
e_get(self.as_raw()) }
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
> > +impl<T: DmaFenceNames> DmaFence<T> {
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
> > +=C2=A0=C2=A0=C2=A0 const fn ops_create() -> bindings::dma_fence_ops {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Zeroing out memo=
ry on the stack is always safe.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut ops: bindings::dma_=
fence_ops =3D unsafe { core::mem::zeroed() };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ops.get_driver_name =3D Som=
e(Self::get_driver_name);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ops.get_timeline_name =3D S=
ome(Self::get_timeline_name);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ops.release =3D Some(Self::=
release);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ops
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 extern "C" fn get_driver_name(_ptr: *mut bindings::=
dma_fence) -> *const c_char {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 T::DRIVER_NAME.as_ptr()
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 extern "C" fn get_timeline_name(_ptr: *mut bindings=
::dma_fence) -> *const c_char {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 T::TIMELINE_NAME.as_ptr()
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// The release function called by the C backend on=
ce the refcount drops to 0. We use this to
> > +=C2=A0=C2=A0=C2=A0 /// drop the Rust dma-fence, too. Since [`DmaFence`=
] implements [`AlwaysRefCounted`], this is
> > +=C2=A0=C2=A0=C2=A0 /// perfectly safe and a convenient way to concile =
the two release mechanisms of C and Rust.
> > +=C2=A0=C2=A0=C2=A0 unsafe extern "C" fn release(ptr: *mut bindings::dm=
a_fence) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let ptr =3D Opaque::cast_fr=
om(ptr);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The constructor =
guarantees that `ptr` is always the inner fence of a DmaFence.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence =3D unsafe { crat=
e::container_of!(ptr, Self, inner) }.cast_mut();
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: See above. Also,=
 the release callback will only be called once, when the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // refcount drops to 0, and=
 when that happens the fence is by definition still valid.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { drop_in_place(fenc=
e) };
> > +=C2=A0=C2=A0=C2=A0 }
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
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(())
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_fence {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.inner.get()
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
>=20

