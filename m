Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CCD9DAEB2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 21:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146FE10E14F;
	Wed, 27 Nov 2024 20:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="HLLci3HT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9CD10E14F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 20:58:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732741085; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=H1Cy0yfTA1P1ndMUs9wM4SdsJSril+KRllUSZkHp3erQakvbj1gLD2DBj+QXVYQzNLx0IHh87XPcOiSlVfheEJqFofjhe15xUFNu/sWN+cfaYbkS0Mn0i5VI7fN7VxLFdFvHylnfjfCEelH/Eg9KUquDko3I9ytRJgacYCT42bE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732741085;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+/ZcnITvSJ9TYRNZ/gRJWOY+xm1HyqMaoSoXQmFHrng=; 
 b=dcNaVFNeSII4vLd2TzDvBHUhuKgKRL9ldhifacQ7OCyirdB5baJwK50ICAlKKfFI9zTfqL+sol7YpvNnLkPLYR5lniYH8khRkwXrogDFzF4qFckyRLnDUL+QGytqUYmFlk+HytRXxZYvSK8UeKMeMcrnEf2JNXP9wYJajI1LQa4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732741085; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=+/ZcnITvSJ9TYRNZ/gRJWOY+xm1HyqMaoSoXQmFHrng=;
 b=HLLci3HTossJ7LD7MZamE3df8PTMkEhCKeUGD4kxGWghhmkvRUiFAyN02DjEVAC3
 jdFRiqafWBiFb23GO93fcPaNgv0WhIQeyRMDIbsW1LE13KiHNMsVXkI1++hETwMo+ic
 90RJ7F6DU7Q0lRKe8vYCYsT8Oefgck36OQLQxtjo=
Received: by mx.zohomail.com with SMTPS id 1732741083618753.4999618284205;
 Wed, 27 Nov 2024 12:58:03 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 20/35] WIP: rust: drm/kms: Add drm_atomic_state
 bindings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-21-lyude@redhat.com>
Date: Wed, 27 Nov 2024 17:54:38 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <653F8E8D-E21A-4448-91F4-81F02DB28746@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-21-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.200.121)
X-ZohoMailClient: External
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

Hi Lyude

> On 30 Sep 2024, at 20:10, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Next up is introducing bindings that we can use to represent the =
global DRM
> atomic state, along with all of the various object states contained =
within.
> We do this by introducing a few new concepts: borrowed states, atomic =
state
> mutators, and atomic state composers.
>=20
> To understand these, we need to quickly touch upon the general life of =
an
> atomic commit. Assuming a driver does its own internal atomic commit, =
the
> procedure looks something like this:
>=20
> * Allocate a new atomic state
> * Duplicate the atomic state of each mode object we want to mutate, =
and add
>  the duplicated state to the new atomic state
> * Check (possibly more then once) the atomic state, possibly modifying =
it

nit: typo here s/then/than

>  along the way
> * Commit the atomic state to software (we'll call this commit time). =
At
>  this point no new objects can be added to the state
> * Finish committing the atomic state to hardware asynchronously
>=20
> With this in mind, we introduce AtomicStateMutator and =
AtomicStateComposer
> (along with leaky variants intended for uses in FFI calls). An
> AtomicStateMutator allows mutating an atomic state but does not allow =
for
> adding new objects to the state. Subsequently, an AtomicStateComposer
> allows for both mutating an atomic state and adding new mode objects. =
We
> control when we expose each of these types in order to implement the
> limitations required by the aforementioned example.
>=20
> Note as well that AtomicStateComposer is intended to eventually be =
usable
> directly by drivers. In this scenario, a driver will be able to create =
an
> AtomicStateComposer (the equivalent of allocating an atomic state in =
C) and
> then commit it by passing it to our DRM bindings by-value, insuring =
that
> once the commit process begins it is impossible to keep using the
> AtomicStateComposer.
>=20
> The next part of this is allowing users to modify the atomic states of =
all
> of the objects contained within an atomic state. Since it's an =
extremely
> common usecase for objects to mutate the atomic state of multiple =
objects
> at once in an unpredictable order, we need a mechanism that will allow =
us
> to hand out &mut references to each state while ensuring at runtime =
that we
> do not break rust's data aliasing rules (which disallow us from ever =
having
> more then one &mut reference to the same piece of data).

nit: same typo here

>=20
> We do this by introducing the concept of a "borrowed" state. This is a =
very
> similar concept to RefCell, where it is ensured during runtime that =
when a
> &mut reference is taken out another one cannot be created until the
> corresponding Ref object has been dropped. Our equivalent Ref types =
are
> BorrowedConnectorState, BorrowedCrtcState, and BorrowedPlaneState.

Are these `composers` as well?=20

>=20
> Each one of these types can be used in the same manner as a Ref - no

You mean core::cell::Ref, right? Maybe worth spelling out the full type.

> additional borrows for an atomic state may be taken until the existing =
one
> has been dropped. Subsequently, all of these types implement their
> respective AsRaw* and FromRaw* counter-parts - and allow dereferencing =
to
> each driver-private data structure for fully qualified borrows (like
> BorrowedCrtcState<'a, CrtcState<T>>. This allows a pretty clean way of
> mutating multiple states at once without ever breaking rust's =
mutability
> rules.
>=20
> We'll use all of these types over the next few commits to begin =
introducing
> various atomic modeset callbacks to each mode object type.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
>=20
> TODO:
> * Finish adding state iterators
>  We only have one iterator for planes right now, but the plan is to =
have
>  iterators for all types and have two different kind of iterators:

I assume you mean iterators for Connectors and Crtcs, right?

>  * State object iterators
>    Basically, these just iterate through all of the mode objects of a
>    specific type present in an atomic state. Currently this is what =
our
>    plane iterator does.
>  * State mutator iterators
>    With the existence of AtomicStateMutator and friends, it makes =
sense to
>    have a type of iterator that:
>    * Only iterates through unborrowed atomic states, removing the need =
to
>      deal with the Option<> that get_new_*_state() functions return
>    * Returns each (object, old_state, new_state) triplet as a =
dedicated
>      type (PlaneUpdate, CrtcUpdate, ConnectorUpdate) that can be =
upcasted
>      from an Opaque type using a single call. This is desirable, as it
>      would make iterating through objects with a specific Driver*
>      implementation as easy as just adding a .filter_map() call to the
>      iterator.
>  * Upcast functions for the Borrowed* types
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/helpers/drm/atomic.c        |  32 +++
> rust/helpers/drm/drm.c           |   3 +
> rust/kernel/drm/kms.rs           |   9 +
> rust/kernel/drm/kms/atomic.rs    | 419 +++++++++++++++++++++++++++++++
> rust/kernel/drm/kms/connector.rs |  75 ++++++
> rust/kernel/drm/kms/crtc.rs      |  75 ++++++
> rust/kernel/drm/kms/plane.rs     |  77 ++++++
> 7 files changed, 690 insertions(+)
> create mode 100644 rust/helpers/drm/atomic.c
> create mode 100644 rust/kernel/drm/kms/atomic.rs
>=20
> diff --git a/rust/helpers/drm/atomic.c b/rust/helpers/drm/atomic.c
> new file mode 100644
> index 0000000000000..fff70053f6943
> --- /dev/null
> +++ b/rust/helpers/drm/atomic.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <drm/drm_atomic.h>
> +
> +void rust_helper_drm_atomic_state_get(struct drm_atomic_state *state)
> +{
> + drm_atomic_state_get(state);
> +}
> +
> +void rust_helper_drm_atomic_state_put(struct drm_atomic_state *state)
> +{
> + drm_atomic_state_put(state);
> +}
> +
> +// Macros for generating one repetitive atomic state accessors (like =
drm_atomic_get_new_plane_state)
> +#define STATE_FUNC(type, tense)                                       =
                              \
> + struct drm_ ## type ## _state *rust_helper_drm_atomic_get_ ## tense =
## _ ## type ## _state( \
> + const struct drm_atomic_state *state,                                =
               \
> + struct drm_ ## type *type                                            =
               \
> + ) {                                                                  =
                       \
> + return drm_atomic_get_## tense ## _ ## type ## _state(state, type);  =
               \
> + }
> +#define STATE_FUNCS(type) \
> + STATE_FUNC(type, new); \
> + STATE_FUNC(type, old);
> +
> +STATE_FUNCS(plane);
> +STATE_FUNCS(crtc);
> +STATE_FUNCS(connector);
> +
> +#undef STATE_FUNCS
> +#undef STATE_FUNC
> diff --git a/rust/helpers/drm/drm.c b/rust/helpers/drm/drm.c
> index 028b8ab429572..365f6807774d4 100644
> --- a/rust/helpers/drm/drm.c
> +++ b/rust/helpers/drm/drm.c
> @@ -1,5 +1,8 @@
> // SPDX-License-Identifier: GPL-2.0
>=20
> +#ifdef CONFIG_DRM_KMS_HELPER
> +#include "atomic.c"
> +#endif
> #include "gem.c"
> #ifdef CONFIG_DRM_GEM_SHMEM_HELPER
> #include "gem_shmem_helper.c"
> diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
> index d74267c78864f..4ab039d67352e 100644
> --- a/rust/kernel/drm/kms.rs
> +++ b/rust/kernel/drm/kms.rs
> @@ -2,6 +2,7 @@
>=20
> //! KMS driver abstractions for rust.
>=20
> +pub mod atomic;
> pub mod connector;
> pub mod crtc;
> pub mod encoder;
> @@ -248,6 +249,14 @@ pub(crate) fn mode_config_mutex(&self) -> =
&Mutex<()> {
>     pub fn mode_config_lock(&self) -> ModeConfigGuard<'_, T> {
>         ModeConfigGuard(self.mode_config_mutex().lock(), PhantomData)
>     }
> +
> +    /// Return the number of registered [`Plane`](plane::Plane) =
objects on this [`Device`].
> +    #[inline]
> +    pub fn num_plane(&self) -> i32 {
> +        // SAFETY: The only context which this could change is before =
registration, which must be
> +        // single-threaded anyway - so it's safe to just read this =
value

I think you can limit the scope of the unsafe block here, IIUC the =
pointer dereference is the only unsafe part?

Also, you should probably mention that `as_raw()` returns a valid =
pointer.

> +        unsafe { (*self.as_raw()).mode_config.num_total_plane }
> +    }
> }
>=20
> /// A modesetting object in DRM.
> diff --git a/rust/kernel/drm/kms/atomic.rs =
b/rust/kernel/drm/kms/atomic.rs
> new file mode 100644
> index 0000000000000..a4354b89b07cc
> --- /dev/null
> +++ b/rust/kernel/drm/kms/atomic.rs
> @@ -0,0 +1,419 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! [`struct drm_atomic_state`] related bindings for rust.
> +//!
> +//! [`struct drm_atomic_state`]: srctree/include/drm/drm_atomic.h
> +use alloc::boxed::Box;
> +use crate::{
> +    bindings,
> +    drm::{device::Device, drv::Driver},
> +    types::*,
> +    error::{from_err_ptr, to_result, from_result},
> +    init::Zeroable,
> +    prelude::*,
> +    private::Sealed
> +};
> +use core::{
> +    marker::*,
> +    ptr::NonNull,
> +    cell::Cell,
> +    ffi::*,
> +    slice,
> +    ops::*,
> +    mem::ManuallyDrop,
> +    iter::Iterator,
> +};
> +use super::{
> +    crtc::*,
> +    connector::*,
> +    plane::*,
> +    Kms,
> +    KmsDriver,
> +    ModeObject
> +};
> +
> +/// The main wrapper around [`struct drm_atomic_state`].
> +///
> +/// This type is usually embedded within another interface such as an =
[`AtomicStateMutator`].
> +///
> +/// # Invariants
> +///
> +/// - The data layout of this type is identical to [`struct =
drm_atomic_state`].
> +/// - `state` is initialized for as long as this type is exposed to =
users.
> +///
> +/// [`struct drm_atomic_state`]: srctree/include/drm/drm_atomic.h
> +#[repr(transparent)]
> +pub struct AtomicState<T: KmsDriver> {
> +    pub(super) state: Opaque<bindings::drm_atomic_state>,
> +    _p: PhantomData<T>,
> +}
> +
> +impl<T: KmsDriver> AtomicState<T> {
> +    /// Reconstruct an immutable reference to an atomic state from =
the given pointer
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must point to a valid initialized instance of [`struct =
drm_atomic_state`].
> +    ///
> +    /// [`struct drm_atomic_state`]: srctree/include/drm/drm_atomic.h
> +    pub(super) unsafe fn from_raw<'a>(ptr: *const =
bindings::drm_atomic_state) -> &'a Self {
> +        // SAFETY: Our data layout is identical
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    pub(crate) fn as_raw(&self) -> *mut bindings::drm_atomic_state {
> +        self.state.get()
> +    }
> +
> +    /// Return the [`Device`] associated with this [`AtomicState`].
> +    pub fn drm_dev(&self) -> &Device<T> {
> +        // SAFETY:
> +        // * `state` is initialized via our type invariants.
> +        // * `dev` is invariant throughout the lifetime of =
`AtomicState`
> +        unsafe { Device::borrow((*self.state.get()).dev) }
> +    }
> +
> +    /// Return the old atomic state for `crtc`, if it is present =
within this [`AtomicState`].
> +    pub fn get_old_crtc_state<C>(&self, crtc: &C) -> =
Option<&C::State>
> +    where
> +        C: AsRawCrtc<Driver =3D T>,
> +    {
> +        // SAFETY: This function either returns NULL or a valid =
pointer to a `drm_crtc_state`
> +        unsafe {
> +            bindings::drm_atomic_get_old_crtc_state(
> +                self.as_raw(),
> +                crtc.as_raw()
> +            ).as_ref().map(|p| unsafe { C::State::from_raw(p) })
> +        }
> +    }
> +
> +    /// Return the old atomic state for `plane`, if it is present =
within this [`AtomicState`].
> +    pub fn get_old_plane_state<P>(&self, plane: &P) -> =
Option<&P::State>
> +    where
> +        P: AsRawPlane<Driver =3D T>,
> +    {
> +        // SAFETY: This function either returns NULL or a valid =
pointer to a `drm_plane_state`
> +        unsafe {
> +            bindings::drm_atomic_get_old_plane_state(
> +                self.as_raw(),
> +                plane.as_raw()
> +            ).as_ref().map(|p| unsafe { P::State::from_raw(p) })
> +        }
> +    }
> +
> +    /// Return the old atomic state for `connector` if it is present =
within this [`AtomicState`].
> +    pub fn get_old_connector_state<C>(&self, connector: &C) -> =
Option<&C::State>
> +    where
> +        C: AsRawConnector<Driver =3D T>
> +    {
> +        // SAFETY: THis function either returns NULL or a valid =
pointer to a `drm_connector_state`.
> +        unsafe {
> +            bindings::drm_atomic_get_old_connector_state(
> +                self.as_raw(),
> +                connector.as_raw()
> +            ).as_ref().map(|p| unsafe { C::State::from_raw(p) })
> +        }
> +    }
> +}
> +
> +// SAFETY: DRM atomic state objects are always reference counted and =
the get/put functions satisfy
> +// the requirements.
> +unsafe impl<T: KmsDriver> AlwaysRefCounted for AtomicState<T> {
> +    fn inc_ref(&self) {
> +        // SAFETY: FFI call with no special requirements
> +        unsafe { bindings::drm_atomic_state_get(self.state.get()) }
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: FFI calls with no special requirements
> +        unsafe { bindings::drm_atomic_state_put(obj.as_ptr().cast()) =
}
> +    }
> +}
> +
> +/// A smart-pointer for modifying the contents of an atomic state.
> +///
> +/// As it's not unreasonable for a modesetting driver to want to have =
references to the state of
> +/// multiple modesetting objects at once, along with mutating =
multiple states for unique modesetting
> +/// objects at once, this type provides a mechanism for safely doing =
both of these things.
> +///
> +/// To honor Rust's aliasing rules regarding mutable references, this =
structure ensures only one
> +/// mutable reference to a mode object's atomic state may exist at a =
time - and refuses to provide
> +/// another if one has already been taken out using runtime checks.
> +pub struct AtomicStateMutator<T: KmsDriver> {
> +    /// The state being mutated. Note that the use of `ManuallyDrop` =
here is because mutators are
> +    /// only constructed in FFI callbacks and thus borrow their =
references to the atomic state from
> +    /// DRM. Composers, which make use of mutators internally, can =
potentially be owned by rust code
> +    /// if a driver is performing an atomic commit internally - and =
thus will call the drop
> +    /// implementation here.
> +    state: ManuallyDrop<ARef<AtomicState<T>>>,

The last part was a bit difficult to understand. What do you mean by =
`will call the drop implementation here` ?

> +
> +    /// Bitmask of borrowed CRTC state objects
> +    pub(super) borrowed_crtcs: Cell<u32>,
> +    /// Bitmask of borrowed plane state objects
> +    pub(super) borrowed_planes: Cell<u32>,
> +    /// Bitmask of borrowed connector state objects
> +    pub(super) borrowed_connectors: Cell<u32>,
> +}
> +
> +impl<T: KmsDriver> AtomicStateMutator<T> {
> +    /// Construct a new [`AtomicStateMutator`]
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must point to a valid `drm_atomic_state`
> +    pub(super) unsafe fn new(ptr: =
NonNull<bindings::drm_atomic_state>) -> Self {
> +        Self {
> +            // SAFETY: The data layout of `AtomicState<T>` is =
identical to drm_atomic_state
> +            state: ManuallyDrop::new(unsafe { =
ARef::from_raw(ptr.cast()) }),
> +            borrowed_planes: Cell::default(),
> +            borrowed_crtcs: Cell::default(),
> +            borrowed_connectors: Cell::default(),
> +        }
> +    }
> +
> +    pub(crate) fn as_raw(&self) -> *mut bindings::drm_atomic_state {
> +        self.state.as_raw()
> +    }
> +
> +    /// Return the [`Device`] for this [`AtomicStateMutator`]
> +    pub fn drm_dev(&self) -> &Device<T> {
> +        self.state.drm_dev()
> +    }
> +
> +    /// Retrieve the last committed atomic state for `crtc` if `crtc` =
has already been added to the
> +    /// atomic state being composed.
> +    ///
> +    /// Returns `None` otherwise.
> +    pub fn get_old_crtc_state<C>(&self, crtc: &C) -> =
Option<&C::State>
> +    where
> +        C: AsRawCrtc<Driver =3D T>
> +    {
> +        self.state.get_old_crtc_state(crtc)
> +    }
> +
> +    /// Retrieve the last committed atomic state for `connector` if =
`connector` has already been
> +    /// added to the atomic state being composed.
> +    ///
> +    /// Returns `None` otherwise.
> +    pub fn get_old_connector_state<C>(&self, connector: &C) -> =
Option<&C::State>
> +    where
> +        C: AsRawConnector<Driver =3D T>
> +    {
> +        self.state.get_old_connector_state(connector)
> +    }
> +
> +    /// Retrieve the last committed atomic state for `plane` if =
`plane` has already been added to
> +    /// the atomic state being composed.
> +    ///
> +    /// Returns `None` otherwise.
> +    pub fn get_old_plane_state<P>(&self, plane: &P) -> =
Option<&P::State>
> +    where
> +        P: AsRawPlane<Driver =3D T>,
> +    {
> +        self.state.get_old_plane_state(plane)
> +    }

> +
> +    /// Return a composer for `plane`s new atomic state if it was =
previously added to the atomic
> +    /// state being composed.
> +    ///
> +    /// Returns `None` otherwise, or if a composer still exists for =
this state.
> +    pub fn get_new_crtc_state<C>(&self, crtc: &C) -> =
Option<BorrowedCrtcState<'_, C::State>>
> +    where
> +        C: AsRawCrtc<Driver =3D T>
> +    {
> +        // SAFETY: DRM either returns NULL or a valid pointer to a =
`drm_crtc_state`
> +        let state =3D unsafe {
> +            bindings::drm_atomic_get_new_crtc_state(self.as_raw(), =
crtc.as_raw())
> +        };
> +
> +        BorrowedCrtcState::<C::State>::new(self, =
NonNull::new(state)?)
> +    }

You say that this function returns a composer, but..

> +
> +    /// Return a composer for `plane`s new atomic state if it was =
previously added to the atomic
> +    /// state being composed.
> +    ///
> +    /// Returns `None` otherwise, or if a composer still exists for =
this state.
> +    pub fn get_new_plane_state<P>(&self, plane: &P) -> =
Option<BorrowedPlaneState<'_, P::State>>
> +    where
> +        P: AsRawPlane<Driver =3D T>,
> +    {
> +        // SAFETY: DRM either returns NULL or a valid pointer to a =
`drm_plane_state`.
> +        let state =3D unsafe {
> +            bindings::drm_atomic_get_new_plane_state(self.as_raw(), =
plane.as_raw())
> +        };
> +
> +        BorrowedPlaneState::<P::State>::new(self, =
NonNull::new(state)?)
> +    }
> +
> +    /// Return a composer for `crtc`s new atomic state if it was =
previously added to the atomic
> +    /// state being composed.
> +    ///
> +    /// Returns `None` otherwise, or if a composer still exists for =
this state.
> +    pub fn get_new_connector_state<C>(
> +        &self,
> +        connector: &C
> +    ) -> Option<BorrowedConnectorState<'_, C::State>>
> +    where
> +        C: AsRawConnector<Driver =3D T>,
> +    {
> +        // SAFETY: DRM either returns NULL or a valid pointer to a =
`drm_connector_state`
> +        let state =3D unsafe {
> +            =
bindings::drm_atomic_get_new_connector_state(self.as_raw(), =
connector.as_raw())
> +        };
> +
> +        BorrowedConnectorState::<C::State>::new(self, =
NonNull::new(state)?)
> +    }
> +
> +    /// Iterate through each of the planes (regardless of type) =
currently in this atomic state.
> +    pub fn iter_planes(&self) -> AtomicStatePlaneIter<'_, T> {
> +        AtomicStatePlaneIter::new(&self.state)
> +    }
> +}
> +
> +/// An [`AtomicStateMutator`] wrapper which is not yet part of any =
commit operation.
> +///
> +/// Since it's not yet part of a commit operation, new mode objects =
may be added to the state. It
> +/// also holds a reference to the underlying [`AtomicState`] that =
will be released when this object
> +/// is dropped.
> +pub struct AtomicStateComposer<T: KmsDriver>(AtomicStateMutator<T>);

=E2=80=A6the composer seems to be its own type? Maybe to ease the =
confusion a bit, you can
say that `get_new_crtc_state` returns a composer in its borrowed form?

> +
> +impl<T: KmsDriver> Deref for AtomicStateComposer<T> {
> +    type Target =3D AtomicStateMutator<T>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0
> +    }
> +}
> +
> +impl<T: KmsDriver> Drop for AtomicStateComposer<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: We're in drop, so this is guaranteed to be the =
last possible reference
> +        unsafe { ManuallyDrop::drop(&mut self.0.state) }

Ok, so the ManuallyDrop is actually dropped here, which is probably what =
you meant in the comment
in `AtomicStateMutator.

You should probably reference `AtomicStateComposer::drop()` directly =
instead of saying `here`, specially
as it=E2=80=99s another type entirely.

> +    }
> +}
> +
> +impl<T: KmsDriver> AtomicStateComposer<T> {
> +    /// # Safety
> +    ///
> +    /// The caller guarantees that `ptr` points to a valid instance =
of `drm_atomic_state`.
> +    pub(crate) unsafe fn new(ptr: =
NonNull<bindings::drm_atomic_state>) -> Self {
> +        // SAFETY: see `AtomicStateMutator::from_raw()`
> +         Self(unsafe { AtomicStateMutator::new(ptr) })
> +    }
> +
> +    /// Attempt to add the state for `crtc` to the atomic state for =
this composer if it hasn't
> +    /// already been added, and create a mutator for it.


`get_new_crtc_state` returns `Option<BorrowedCrtcState<'_, C::State>>`, =
which you labeled a `composer`.

Now, the same type is being returned, but it=E2=80=99s being referenced =
to as a `mutator` ?

I am sure these things make perfect sense for experienced KMS =
developers, but it=E2=80=99s a bit confusing to other
reviewers at first.

> +    ///
> +    /// If a composer already exists for this `crtc`, this function =
returns `Error(EBUSY)`. If
> +    /// attempting to add the state fails, another error code will be =
returned.
> +    pub fn add_crtc_state<C>(&self, crtc: &C) -> =
Result<BorrowedCrtcState<'_, C::State>>
> +    where
> +        C: AsRawCrtc<Driver =3D T>
> +    {
> +        // SAFETY: DRM will only return a valid pointer to a =
[`drm_crtc_state`] - or an error.
> +        let state =3D unsafe {
> +            from_err_ptr(
> +                bindings::drm_atomic_get_crtc_state(self.as_raw(), =
crtc.as_raw())
> +            ).map(|c| NonNull::new_unchecked(c))
> +        }?;
> +
> +        BorrowedCrtcState::<C::State>::new(self, state).ok_or(EBUSY)
> +    }
> +
> +    /// Attempt to add the state for `plane` to the atomic state for =
this composer if it hasn't
> +    /// already been added, and create a mutator for it.
> +    ///
> +    /// If a composer already exists for this `plane`, this function =
returns `Error(EBUSY)`. If
> +    /// attempting to add the state fails, another error code will be =
returned.
> +    pub fn add_plane_state<P>(&self, plane: &P) -> =
Result<BorrowedPlaneState<'_, P::State>>
> +    where
> +        P: AsRawPlane<Driver =3D T>,
> +    {
> +        // SAFETY: DRM will only return a valid pointer to a =
[`drm_plane_state`] - or an error.
> +        let state =3D unsafe {
> +            from_err_ptr(
> +                bindings::drm_atomic_get_plane_state(self.as_raw(), =
plane.as_raw())
> +            ).map(|p| NonNull::new_unchecked(p))
> +        }?;
> +
> +        BorrowedPlaneState::<P::State>::new(self, state).ok_or(EBUSY)
> +    }
> +
> +    /// Attempt to add the state for `connector` to the atomic state =
for this composer if it hasn't
> +    /// already been added, and create a mutator for it.
> +    ///
> +    /// If a composer already exists for this `connector`, this =
function returns `Error(EBUSY)`. If
> +    /// attempting to add the state fails, another error code will be =
returned.
> +    pub fn add_connector_state<C>(
> +        &self,
> +        connector: &C
> +    ) -> Result<BorrowedConnectorState<'_, C::State>>
> +    where
> +        C: AsRawConnector<Driver =3D T>,
> +    {
> +        // SAFETY: DRM will only return a valid pointer to a =
[`drm_plane_state`] - or an error.
> +        let state =3D unsafe {
> +            from_err_ptr(
> +                =
bindings::drm_atomic_get_connector_state(self.as_raw(), =
connector.as_raw())
> +            ).map(|c| NonNull::new_unchecked(c))
> +        }?;
> +
> +        BorrowedConnectorState::<C::State>::new(self, =
state).ok_or(EBUSY)
> +    }
> +
> +    /// Attempt to add any planes affected by changes on `crtc` to =
this [`AtomicStateComposer`].
> +    ///
> +    /// Will return an [`Error`] if this fails.
> +    pub fn add_affected_planes(&self, crtc: &impl AsRawCrtc<Driver =3D =
T>) -> Result {
> +        // SAFETY: FFI call with no special safety requirements
> +        to_result(unsafe {
> +            bindings::drm_atomic_add_affected_planes(self.as_raw(), =
crtc.as_raw())
> +        })
> +    }
> +}
> +
> +/// An iterator which goes through each DRM plane currently in an =
atomic state.
> +///
> +/// Note that this iterator will return [`OpaquePlane`]s, because =
it's entirely possible for a
> +/// driver to have multiple implementations of [`DriverPlane`] - so =
we don't know what the fully
> +/// qualified type of each plane is.
> +pub struct AtomicStatePlaneIter<'a, T: KmsDriver> {
> +    state: &'a AtomicState<T>,
> +    current_idx: u8,
> +}
> +
> +impl<'a, T: KmsDriver> Iterator for AtomicStatePlaneIter<'a, T> {
> +    type Item =3D &'a OpaquePlane<T>;
> +
> +    fn next(&mut self) -> Option<Self::Item> {
> +        let ptr =3D self.state.state.get();
> +
> +        // SAFETY: `planes` is initialized by the time we expose =
AtomicState<T> through any form to
> +        // users. And because we don't allow state mutation outside =
of mutators, which are single
> +        // threaded, the contents of this struct are at least =
guaranteed not to change through the
> +        // duration of this borrow.
> +        let planes: &[bindings::__drm_planes_state] =3D unsafe {
> +            slice::from_raw_parts((*ptr).planes.cast_const(), =
self.state.drm_dev().num_plane() as _)
> +        };
> +
> +        for plane_states in &planes[self.current_idx as _..] {
> +            self.current_idx +=3D 1;
> +            if !plane_states.ptr.is_null() {
> +                // SAFETY: OpaquePlane has an identical data layout, =
and its only possible values
> +                // are NULL or pointing at a valid drm_plane
> +                return Some(unsafe { =
OpaquePlane::from_raw(plane_states.ptr) });
> +            }
> +        }
> +
> +        None
> +    }
> +}
> +
> +impl<'a, T: KmsDriver> AtomicStatePlaneIter<'a, T> {
> +    fn new(state: &'a AtomicState<T>) -> AtomicStatePlaneIter<'a, T> =
{
> +        Self {
> +            current_idx: 0,
> +            state
> +        }
> +    }
> +}
> diff --git a/rust/kernel/drm/kms/connector.rs =
b/rust/kernel/drm/kms/connector.rs
> index f62740d7f6469..6fcfce8b48c64 100644
> --- a/rust/kernel/drm/kms/connector.rs
> +++ b/rust/kernel/drm/kms/connector.rs
> @@ -31,6 +31,7 @@
>     ModeConfigGuard,
>     encoder::*,
>     KmsDriver,
> +    atomic::*,
> };
> use macros::pin_data;
>=20
> @@ -679,6 +680,80 @@ unsafe fn from_raw_mut<'a>(ptr: *mut =
bindings::drm_connector_state) -> &'a mut S
>     }
> }
>=20
> +/// An interface for mutating a [`Connector`]s atomic state.
> +///
> +/// This type is typically returned by an [`AtomicStateMutator`] =
within contexts where it is
> +/// possible to safely mutate a connector's state. In order to uphold =
rust's data-aliasing rules,
> +/// only [`BorrowedConnectorState`] may exist at a time.

Maybe you mean that only one [`BorrowedConnectorState`] may exist at a =
time? In which case
the word `one` is missing.

> +pub struct BorrowedConnectorState<'a, T: FromRawConnectorState> {
> +    state: &'a mut T,
> +    mask: &'a Cell<u32>
> +}
> +
> +impl<'a, T: FromRawConnectorState> BorrowedConnectorState<'a, T> {
> +    pub(super) fn new<D: KmsDriver>(
> +        mutator: &'a AtomicStateMutator<D>,
> +        state: NonNull<bindings::drm_connector_state>
> +    ) -> Option<Self> {
> +        // SAFETY: `connector` is invariant throughout the lifetime =
of the atomic state, is

Maybe that=E2=80=99s only me, but every time you say `invariant`, my =
mind jumps to variance as in [0].


> +        // initialized by this point, and we're guaranteed it is of =
type `OpaqueConnector<T>` by
> +        // type invariance
> +        let connector =3D unsafe { =
T::Connector::from_raw((*state.as_ptr()).connector) };
> +        let conn_mask =3D connector.mask();
> +        let borrowed_mask =3D mutator.borrowed_connectors.get();
> +
> +        if borrowed_mask & conn_mask =3D=3D 0 {
> +            mutator.borrowed_connectors.set(borrowed_mask | =
conn_mask);
> +            Some(Self {
> +                mask: &mutator.borrowed_connectors,
> +                // SAFETY: We're guaranteed `state` is of =
`ConnectorState<T>` by type invariance,
> +                // and we just confirmed by checking =
`borrowed_connectors` that no other mutable
> +                // borrows have been taken out for `state`
> +                state: unsafe { T::from_raw_mut(state.as_ptr()) },
> +            })
> +        } else {
> +            // TODO: Print a kernel warning here, this is a user =
error
> +            None
> +        }
> +    }
> +}
> +
> +impl<'a, T: DriverConnectorState> Deref for =
BorrowedConnectorState<'a, ConnectorState<T>> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.state.inner
> +    }
> +}
> +
> +impl<'a, T: DriverConnectorState> DerefMut for =
BorrowedConnectorState<'a, ConnectorState<T>> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        &mut self.state.inner
> +    }
> +}
> +
> +impl<'a, T: FromRawConnectorState> Drop for =
BorrowedConnectorState<'a, T> {
> +    fn drop(&mut self) {
> +        let mask =3D self.state.connector().mask();
> +        self.mask.set(self.mask.get() & !mask);
> +    }
> +}
> +
> +impl<'a, T: FromRawConnectorState> AsRawConnectorState for =
BorrowedConnectorState<'a, T> {
> +    type Connector =3D T::Connector;
> +}
> +
> +impl<'a, T: FromRawConnectorState> private::AsRawConnectorState for =
BorrowedConnectorState<'a, T> {
> +    fn as_raw(&self) -> &bindings::drm_connector_state {
> +        self.state.as_raw()
> +    }
> +
> +    unsafe fn as_raw_mut(&mut self) -> &mut =
bindings::drm_connector_state {
> +        // SAFETY: We're bound by the same safety contract as this =
function
> +        unsafe { self.state.as_raw_mut() }
> +    }
> +}
> +
> unsafe extern "C" fn atomic_duplicate_state_callback<T: =
DriverConnectorState>(
>     connector: *mut bindings::drm_connector
> ) -> *mut bindings::drm_connector_state
> diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
> index 246d15a15c14d..7864540705f76 100644
> --- a/rust/kernel/drm/kms/crtc.rs
> +++ b/rust/kernel/drm/kms/crtc.rs
> @@ -3,6 +3,7 @@
> //! KMS driver abstractions for rust.
>=20
> use super::{
> +    atomic::*,
>     plane::*,
>     ModeObject,
>     StaticModeObject,
> @@ -552,6 +553,80 @@ unsafe fn from_raw<'a>(ptr: *const =
bindings::drm_crtc_state) -> &'a Self {
>         unsafe { &*(ptr.cast()) }
>     }
> }
> +
> +/// An interface for mutating a [`Crtc`]s atomic state.
> +///
> +/// This type is typically returned by an [`AtomicStateMutator`] =
within contexts where it is
> +/// possible to safely mutate a plane's state. In order to uphold =
rust's data-aliasing rules, only
> +/// [`BorrowedCrtcState`] may exist at a time.

Same here, missing `one` perhaps?

> +///
> +/// # Invariants
> +///
> +/// `self.state` always points to a valid instance of a =
[`FromRawCrtcState`] object.
> +pub struct BorrowedCrtcState<'a, T: FromRawCrtcState> {
> +    state: NonNull<T>,
> +    mask: &'a Cell<u32>,
> +}
> +
> +impl<'a, T: FromRawCrtcState> BorrowedCrtcState<'a, T> {
> +    pub(super) fn new<D: KmsDriver>(
> +        mutator: &'a AtomicStateMutator<D>,
> +        state: NonNull<bindings::drm_crtc_state>
> +    ) -> Option<Self> {
> +        // SAFETY: `crtc` is invariant throughout the lifetime of the =
atomic state, and always
> +        // points to a valid `Crtc<T::Crtc>`
> +        let crtc =3D unsafe { =
T::Crtc::from_raw((*state.as_ptr()).crtc) };
> +        let crtc_mask =3D crtc.mask();
> +        let borrowed_mask =3D mutator.borrowed_crtcs.get();
> +
> +        if borrowed_mask & crtc_mask =3D=3D 0 {
> +            mutator.borrowed_crtcs.set(borrowed_mask | crtc_mask);

Do you mean for this to be called by multiple threads? If so, I wonder =
if atomics would be a
better fit.

> +            Some(Self {
> +                mask: &mutator.borrowed_crtcs,
> +                state: state.cast()
> +            })
> +        } else {
> +            None
> +        }
> +    }
> +}
> +
> +impl<'a, T: FromRawCrtcState> Drop for BorrowedCrtcState<'a, T> {
> +    fn drop(&mut self) {
> +        // SAFETY: Our interface is proof that we are the only ones =
with a reference to this data
> +        let mask =3D unsafe { self.state.as_ref() }.crtc().mask();
> +        self.mask.set(self.mask.get() & !mask);
> +    }
> +}
> +
> +impl<'a, T: DriverCrtcState> Deref for BorrowedCrtcState<'a, =
CrtcState<T>> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: Our interface ensures that `self.state.inner` =
follows rust's data-aliasing rules,
> +        // so this is safe
> +        unsafe { &*(*self.state.as_ptr()).inner.get() }
> +    }
> +}
> +
> +impl<'a, T: DriverCrtcState> DerefMut for BorrowedCrtcState<'a, =
CrtcState<T>> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        // SAFETY: Our interface ensures that `self.state.inner` =
follows rust's data-aliasing rules,
> +        // so this is safe
> +        unsafe { (*self.state.as_ptr()).inner.get_mut() }
> +    }
> +}
> +
> +impl<'a, T: FromRawCrtcState> AsRawCrtcState for =
BorrowedCrtcState<'a, T> {
> +    type Crtc =3D T::Crtc;
> +}
> +
> +impl<'a, T: FromRawCrtcState> private::AsRawCrtcState for =
BorrowedCrtcState<'a, T> {
> +    fn as_raw(&self) -> *mut bindings::drm_crtc_state {
> +        self.state.as_ptr().cast()
> +    }
> +}
> +
> unsafe extern "C" fn crtc_destroy_callback<T: DriverCrtc>(
>     crtc: *mut bindings::drm_crtc
> ) {
> diff --git a/rust/kernel/drm/kms/plane.rs =
b/rust/kernel/drm/kms/plane.rs
> index 1c151ae3b3dcc..d6e11a65cc101 100644
> --- a/rust/kernel/drm/kms/plane.rs
> +++ b/rust/kernel/drm/kms/plane.rs
> @@ -29,6 +29,7 @@
>     UnregisteredKmsDevice,
>     ModeObject,
>     StaticModeObject,
> +    atomic::*,
> };
>=20
> /// The main trait for implementing the [`struct drm_plane`] API for =
[`Plane`]
> @@ -597,6 +598,82 @@ unsafe fn from_raw_mut<'a>(ptr: *mut =
bindings::drm_plane_state) -> &'a mut Self
>         unsafe { &mut *ptr.cast() }
>     }
> }
> +
> +/// An interface for mutating a [`Plane`]s atomic state.
> +///
> +/// This type is typically returned by an [`AtomicStateMutator`] =
within contexts where it is
> +/// possible to safely mutate a plane's state. In order to uphold =
rust's data-aliasing rules, only
> +/// [`BorrowedPlaneState`] may exist at a time.
> +pub struct BorrowedPlaneState<'a, T: FromRawPlaneState> {
> +    state: &'a mut T,
> +    mask: &'a Cell<u32>
> +}
> +
> +impl<'a, T: FromRawPlaneState> BorrowedPlaneState<'a, T> {
> +    pub(super) fn new<D: KmsDriver>(
> +        mutator: &'a AtomicStateMutator<D>,
> +        state: NonNull<bindings::drm_plane_state>
> +    ) -> Option<Self> {
> +        // SAFETY: `plane` is invariant throughout the lifetime of =
the atomic state, is
> +        // initialized by this point, and we're guaranteed it is of =
type `AsRawPlane` by type
> +        // invariance
> +        let plane =3D unsafe { =
T::Plane::from_raw((*state.as_ptr()).plane) };
> +        let plane_mask =3D plane.mask();
> +        let borrowed_mask =3D mutator.borrowed_planes.get();
> +
> +        if borrowed_mask & plane_mask =3D=3D 0 {
> +            mutator.borrowed_planes.set(borrowed_mask | plane_mask);
> +            Some(Self {
> +                mask: &mutator.borrowed_planes,
> +                // SAFETY: We're guaranteed `state` is of =
`FromRawPlaneState` by type invariance,
> +                // and we just confirmed by checking =
`borrowed_planes` that no other mutable borrows
> +                // have been taken out for `state`
> +                state: unsafe { T::from_raw_mut(state.as_ptr()) },
> +            })
> +        } else {
> +            None
> +        }
> +    }
> +}
> +
> +impl<'a, T: FromRawPlaneState> Drop for BorrowedPlaneState<'a, T> {
> +    fn drop(&mut self) {
> +        let mask =3D self.state.plane().mask();
> +        self.mask.set(self.mask.get() & !mask);
> +    }
> +}
> +
> +impl<'a, T: FromRawPlaneState> AsRawPlaneState for =
BorrowedPlaneState<'a, T> {
> +    type Plane =3D T::Plane;
> +}
> +
> +impl<'a, T: FromRawPlaneState> private::AsRawPlaneState for =
BorrowedPlaneState<'a, T> {
> +    fn as_raw(&self) -> &bindings::drm_plane_state {
> +        self.state.as_raw()
> +    }
> +
> +    unsafe fn as_raw_mut(&mut self) -> &mut bindings::drm_plane_state =
{
> +        // SAFETY: This function is bound by the same safety contract =
as `self.inner.as_raw_mut()`
> +        unsafe { self.state.as_raw_mut() }
> +    }
> +}
> +
> +impl<'a, T: FromRawPlaneState> Sealed for BorrowedPlaneState<'a, T> =
{}
> +
> +impl<'a, T: DriverPlaneState> Deref for BorrowedPlaneState<'a, =
PlaneState<T>> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.state.inner
> +    }
> +}
> +
> +impl<'a, T: DriverPlaneState> DerefMut for BorrowedPlaneState<'a, =
PlaneState<T>> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        &mut self.state.inner
> +    }
> +}
> +
> unsafe extern "C" fn plane_destroy_callback<T: DriverPlane>(
>     plane: *mut bindings::drm_plane
> ) {
> --=20
> 2.46.1
>=20


By the way, you said:

> Note that the use of `ManuallyDrop` here is because mutators are
> +    /// only constructed in FFI callbacks and thus borrow their =
references to the atomic state from
> +    /// DRM

Can you be more specific? I couldn=E2=80=99t pinpoint where exactly this =
happens.

=E2=80=94=E2=80=94=E2=80=94


This is what I have for now. I may come back to this patch at a later =
point since
there is quite a bit going on here.

=E2=80=94 Daniel

[0] https://doc.rust-lang.org/reference/subtyping.html=
