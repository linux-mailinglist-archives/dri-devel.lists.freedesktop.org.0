Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7269DA9EE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 15:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5DF10E136;
	Wed, 27 Nov 2024 14:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="KQclbAVC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C7510E136
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 14:37:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732718230; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mjSNqlXhrSAhrZx4s4asPmByY6tMEk8bYhmKG6z96AivQm1Pw8ECTYz7MQBxlrhEYIDXVuZk1dznRUPUIpL4O5LI3UsU1RKmFBtgmJ0xKRVy3qFKUQny7nFfcsWnMfZVBAR1KTu0RJ8LpyhxaNLLsqiKRyV9t8U27lhGn007BJs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732718230;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9XHjmjcw2a+7IfwIAfkVcwy2fr5yzUZYB1w5Q2sFOhE=; 
 b=OLc6MmZ11cUbLZrkfYfIOxdvrCFj9xTeNbzuYCXvwNa3kR3LvSSWNUepXofot2UG93FElihbkGjIhCBewDvsL0UjZeafq0AJlZmMLoiQq6wOj0a9N3c1bpREdeFY1/wiiaH5E6U20l/3CJDLt650TXHLEH8MSTBE+DpNMBMvnR0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732718230; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=9XHjmjcw2a+7IfwIAfkVcwy2fr5yzUZYB1w5Q2sFOhE=;
 b=KQclbAVCCCYoPsz/WCbOh5aTSZ+BoD9fRywryZ3u/mIqC/OIlwjKvzKJCbaGDcQR
 iVYWNQCl6UEWVLXwfSOVCbgtFjH4KzlN1ObRfLNjmTucb7sZIT5DXal4vJEMHrOEDsx
 hMleBnmO1KSlU/wCqzYlQwJ1duYpxzD1BsMmLSXU=
Received: by mx.zohomail.com with SMTPS id 1732718226861940.4981914974559;
 Wed, 27 Nov 2024 06:37:06 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 07/35] WIP: rust: drm/kms: Add drm_crtc bindings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-8-lyude@redhat.com>
Date: Wed, 27 Nov 2024 11:36:50 -0300
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
Message-Id: <042BD8BE-A0E1-4CD4-89AB-96314DABECA3@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-8-lyude@redhat.com>
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

Hi Lyude,

> On 30 Sep 2024, at 20:09, Lyude Paul <lyude@redhat.com> wrote:
>=20
> This introduces basic bindings for DRM CRTCs which follow the same =
general
> pattern as connectors and planes (e.g. AsRawCrtc, AsRawCrtcState, =
etc.).
> There is one big difference though - drm_crtc_state appears to be the =
one
> atomic state that actually has data which can be mutated from outside =
of
> the atomic commit phase - which means we can't keep rust referencs to =
it,

Nit: typo in `references to it`

> and instead need to use the Opaque type and implement things through
> pointers instead.
>=20
> This should be the last mode object we're introducing for the time =
being
> with its own atomic state. Note that we've not added bindings for =
private
> modesetting objects yet, but I don't think those will be needed for =
rvkms -
> and the same general patterns we're using here should work for adding
> private modesetting objects.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
>=20
> TODO:
> * Add commit data in the future
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/kms.rs      |   1 +
> rust/kernel/drm/kms/crtc.rs | 501 ++++++++++++++++++++++++++++++++++++
> 2 files changed, 502 insertions(+)
> create mode 100644 rust/kernel/drm/kms/crtc.rs
>=20
> diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
> index 5b075794a1155..4b54611fdba8b 100644
> --- a/rust/kernel/drm/kms.rs
> +++ b/rust/kernel/drm/kms.rs
> @@ -3,6 +3,7 @@
> //! KMS driver abstractions for rust.
>=20
> pub mod connector;
> +pub mod crtc;
> pub mod fbdev;
> pub mod plane;
>=20
> diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
> new file mode 100644
> index 0000000000000..d84db49948380
> --- /dev/null
> +++ b/rust/kernel/drm/kms/crtc.rs
> @@ -0,0 +1,501 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! KMS driver abstractions for rust.

Maybe this should be a little more specific?

> +
> +use super::{
> +    plane::*,
> +    ModeObject,
> +    StaticModeObject,
> +    KmsDriver,
> +    UnregisteredKmsDevice
> +};
> +use crate::{
> +    bindings,
> +    drm::device::Device,
> +    device,
> +    prelude::*,
> +    private::Sealed,
> +    error::from_result,
> +    types::Opaque,
> +    init::Zeroable,
> +    sync::Arc,
> +    error::to_result,
> +};
> +use core::{
> +    cell::{Cell, UnsafeCell},
> +    marker::*,
> +    ptr::{NonNull, null, null_mut, addr_of_mut, self},
> +    ops::{Deref, DerefMut},
> +    mem,
> +};
> +use macros::vtable;
> +
> +/// The main trait for implementing the [`struct drm_crtc`] API for =
[`Crtc`].
> +///
> +/// Any KMS driver should have at least one implementation of this =
type, which allows them to create
> +/// [`Crtc`] objects. Additionally, a driver may store driver-private =
data within the type that
> +/// implements [`DriverCrtc`] - and it will be made available when =
using a fully typed [`Crtc`]
> +/// object.
> +///
> +/// # Invariants
> +///
> +/// - Any C FFI callbacks generated using this trait are guaranteed =
that passed-in
> +///   [`struct drm_crtc`] pointers are contained within a =
[`Crtc<Self>`].
> +/// - Any C FFI callbacks generated using this trait are guaranteed =
that passed-in
> +///   [`struct drm_crtc_state`] pointers are contained within a =
[`CrtcState<Self::State>`].
> +///
> +/// [`struct drm_crtc`]: srctree/include/drm/drm_crtc.h
> +/// [`struct drm_crtc_state`]: srctree/include/drm/drm_crtc.h
> +#[vtable]
> +pub trait DriverCrtc: Send + Sync + Sized {
> +    /// The generated C vtable for this [`DriverCrtc`] =
implementation.
> +    #[unique]
> +    const OPS: &'static DriverCrtcOps =3D &DriverCrtcOps {
> +        funcs: bindings::drm_crtc_funcs {
> +            atomic_destroy_state: =
Some(atomic_destroy_state_callback::<Self::State>),
> +            atomic_duplicate_state: =
Some(atomic_duplicate_state_callback::<Self::State>),
> +            atomic_get_property: None,
> +            atomic_print_state: None,
> +            atomic_set_property: None,
> +            cursor_move: None,
> +            cursor_set2: None,
> +            cursor_set: None,
> +            destroy: Some(crtc_destroy_callback::<Self>),
> +            disable_vblank: None,
> +            early_unregister: None,
> +            enable_vblank: None,
> +            gamma_set: None, // TODO
> +            get_crc_sources: None,
> +            get_vblank_counter: None,
> +            get_vblank_timestamp: None,
> +            late_register: None,
> +            page_flip: Some(bindings::drm_atomic_helper_page_flip),
> +            page_flip_target: None,
> +            reset: Some(crtc_reset_callback::<Self::State>),
> +            set_config: Some(bindings::drm_atomic_helper_set_config),
> +            set_crc_source: None,
> +            set_property: None,
> +            verify_crc_source: None,
> +        },
> +
> +        helper_funcs: bindings::drm_crtc_helper_funcs {
> +            atomic_disable: None,
> +            atomic_enable: None,
> +            atomic_check: None,
> +            dpms: None,
> +            commit: None,
> +            prepare: None,
> +            disable: None,
> +            mode_set: None,
> +            mode_valid: None,
> +            mode_fixup: None,
> +            atomic_begin: None,
> +            atomic_flush: None,
> +            mode_set_nofb: None,
> +            mode_set_base: None,
> +            mode_set_base_atomic: None,
> +            get_scanout_position: None,
> +        },
> +    };
> +
> +    /// The type to pass to the `args` field of [`Crtc::new`].
> +    ///
> +    /// This type will be made available in in the `args` argument of =
[`Self::new`]. Drivers which
> +    /// don't need this can simply pass [`()`] here.
> +    type Args;
> +
> +    /// The parent [`KmsDriver`] implementation.
> +    type Driver: KmsDriver;
> +
> +    /// The [`DriverCrtcState`] implementation for this =
[`DriverCrtc`].
> +    ///
> +    /// See [`DriverCrtcState`] for more info.
> +    type State: DriverCrtcState;
> +
> +    /// The constructor for creating a [`Crtc`] using this =
[`DriverCrtc`] implementation.
> +    ///
> +    /// Drivers may use this to instantiate their [`DriverCrtc`] =
object.
> +    fn new(device: &Device<Self::Driver>, args: &Self::Args) -> impl =
PinInit<Self, Error>;
> +}
> +
> +/// The generated C vtable for a [`DriverCrtc`].
> +///
> +/// This type is created internally by DRM.
> +pub struct DriverCrtcOps {
> +    funcs: bindings::drm_crtc_funcs,
> +    helper_funcs: bindings::drm_crtc_helper_funcs,
> +}
> +
> +/// The main interface for a [`struct drm_crtc`].
> +///
> +/// This type is the main interface for dealing with DRM CRTCs. In =
addition, it also allows
> +/// immutable access to whatever private data is contained within an =
implementor's [`DriverCrtc`]
> +/// type.
> +///
> +/// # Invariants
> +///
> +/// - `crtc` and `inner` are initialized for as long as this object =
is made available to users.
> +/// - The data layout of this structure begins with [`struct =
drm_crtc`].
> +/// - The atomic state for this type can always be assumed to be of =
type [`CrtcState<T::State>`].
> +///
> +/// [`struct drm_crtc`]: srctree/include/drm/drm_crtc.h
> +#[repr(C)]
> +#[pin_data]
> +pub struct Crtc<T: DriverCrtc> {
> +    // The FFI drm_crtc object
> +    crtc: Opaque<bindings::drm_crtc>,
> +    /// The driver's private inner data
> +    #[pin]
> +    inner: T,
> +    #[pin]
> +    _p: PhantomPinned,
> +}
> +
> +// SAFETY: DRM expects this struct to be zero-initialized
> +unsafe impl Zeroable for bindings::drm_crtc { }
> +
> +impl<T: DriverCrtc> Sealed for Crtc<T> {}
> +
> +// SAFETY: Our CRTC interfaces are guaranteed to be thread-safe
> +unsafe impl<T: DriverCrtc> Send for Crtc<T> { }
> +
> +// SAFETY: Our CRTC interfaces are guaranteed to be thread-safe
> +unsafe impl<T: DriverCrtc> Sync for Crtc<T> { }
> +
> +impl<T: DriverCrtc> Deref for Crtc<T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.inner
> +    }
> +}
> +
> +impl<T: DriverCrtc> ModeObject for Crtc<T> {
> +    type Driver =3D T::Driver;
> +
> +    fn drm_dev(&self) -> &Device<Self::Driver> {
> +        // SAFETY: DRM connectors exist for as long as the device =
does, so this pointer is always
> +        // valid
> +        unsafe { Device::borrow((*self.as_raw()).dev) }
> +    }
> +
> +    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
> +        // SAFETY: We don't expose Crtc<T> to users before it's =
initialized, so `base` is always
> +        // initialized
> +        unsafe { addr_of_mut!((*self.as_raw()).base) }
> +    }
> +}
> +
> +// SAFETY: CRTCs are non-refcounted modesetting objects
> +unsafe impl<T: DriverCrtc> StaticModeObject for Crtc<T> { }
> +
> +impl<T: DriverCrtc> Crtc<T> {
> +    /// Construct a new [`Crtc`].
> +    ///
> +    /// A driver may use this from their [`Kms::create_objects`] =
callback in order to construct new
> +    /// [`Crtc`] objects.
> +    ///
> +    /// [`Kms::create_objects`]: =
kernel::drm::kms::Kms::create_objects
> +    pub fn new<'a, 'b: 'a, P, C>(

With two lifetimes and two generic types, this is getting a bit =
convoluted IMHO.

I wonder if more descriptive names for the generics would help here, =
like `PlaneData` instead of P.

> +        dev: &'a UnregisteredKmsDevice<'a, T::Driver>,
> +        primary: &'a Plane<P>,
> +        cursor: Option<&'a Plane<C>>,
> +        name: Option<&CStr>,
> +        args: T::Args,
> +    ) -> Result<&'b Self>
> +    where
> +        P: DriverPlane<Driver =3D T::Driver>,
> +        C: DriverPlane<Driver =3D T::Driver>
> +    {
> +        let this =3D Box::try_pin_init(
> +            try_pin_init!(Self {
> +                crtc: Opaque::new(bindings::drm_crtc {
> +                    helper_private: &T::OPS.helper_funcs,
> +                    ..Default::default()
> +                }),
> +                inner <- T::new(dev, &args),
> +                _p: PhantomPinned,
> +            }),
> +            GFP_KERNEL
> +        )?;
> +
> +        to_result(unsafe {
> +            bindings::drm_crtc_init_with_planes(
> +                dev.as_raw(),
> +                this.as_raw(),
> +                primary.as_raw(),
> +                cursor.map_or(null_mut(), |c| c.as_raw()),
> +                &T::OPS.funcs,
> +                name.map_or(null(), |n| n.as_char_ptr())
> +            )
> +        })?;
> +
> +        // Convert the box into a raw pointer, we'll re-assemble it =
in crtc_destroy_callback()
> +        // SAFETY: We don't move anything
> +        Ok(unsafe { &*Box::into_raw(Pin::into_inner_unchecked(this)) =
})

Maybe break this into multiple lines?

> +    }
> +}
> +
> +/// A trait implemented by any type that acts as a [`struct =
drm_crtc`] interface.
> +///
> +/// This is implemented internally by DRM.
> +///
> +/// [`struct drm_crtc`]: srctree/include/drm/drm_crtc.h
> +pub trait AsRawCrtc: StaticModeObject {
> +    /// The type that should be returned for a CRTC state acquired =
using this CRTC interface
> +    type State: FromRawCrtcState;
> +
> +    /// Return a raw pointer to the `bindings::drm_crtc` for this =
object
> +    fn as_raw(&self) -> *mut bindings::drm_crtc;
> +
> +    /// Convert a raw `bindings::drm_crtc` pointer into an object of =
this type.
> +    ///
> +    /// SAFETY: Callers promise that `ptr` points to a valid instance =
of this type
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_crtc) -> &'a Self;
> +}
> +
> +impl<T: DriverCrtc> AsRawCrtc for Crtc<T> {
> +    type State =3D CrtcState<T::State>;
> +
> +    fn as_raw(&self) -> *mut bindings::drm_crtc {
> +        self.crtc.get()
> +    }
> +
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_crtc) -> &'a Self =
{
> +        // SAFETY: Our data layout starts with `bindings::drm_crtc`
> +        unsafe { &*ptr.cast() }
> +    }
> +}
> +
> +unsafe impl Zeroable for bindings::drm_crtc_state { }
> +
> +impl<T: DriverCrtcState> Sealed for CrtcState<T> {}
> +
> +/// The main trait for implementing the [`struct drm_crtc_state`] API =
for a [`Crtc`].
> +///
> +/// A driver may store driver-private data within the implementor's =
type, which will be available
> +/// when using a full typed [`CrtcState`] object.
> +///
> +/// # Invariants
> +///
> +/// - Any C FFI callbacks generated using this trait are guaranteed =
that passed-in
> +///   [`struct drm_crtc`] pointers are contained within a =
[`Crtc<Self::Crtc>`].
> +/// - Any C FFI callbacks generated using this trait are guaranteed =
that passed-in
> +///   [`struct drm_crtc_state`] pointers are contained within a =
[`CrtcState<Self>`].
> +///
> +/// [`struct drm_crtc`]: srctree/include/drm_crtc.h
> +/// [`struct drm_crtc_state`]: srctree/include/drm_crtc.h
> +pub trait DriverCrtcState: Clone + Default + Unpin {
> +    /// The parent CRTC driver for this CRTC state
> +    type Crtc: DriverCrtc<State =3D Self> where Self: Sized;
> +}
> +
> +/// The main interface for a [`struct drm_crtc_state`].
> +///
> +/// This type is the main interface for dealing with the atomic state =
of DRM crtcs. In addition, it
> +/// allows access to whatever private data is contained within an =
implementor's [`DriverCrtcState`]
> +/// type.
> +///
> +/// # Invariants
> +///
> +/// - `state` and `inner` initialized for as long as this object is =
exposed to users.
> +/// - The data layout of this structure begins with [`struct =
drm_crtc_state`].
> +/// - The CRTC for this type can always be assumed to be of type =
[`Crtc<T::Crtc>`].
> +///
> +/// [`struct drm_crtc_state`]: srctree/include/drm/drm_crtc.h
> +#[repr(C)]
> +pub struct CrtcState<T: DriverCrtcState> {
> +    state: Opaque<bindings::drm_crtc_state>,
> +    inner: UnsafeCell<T>,

I don=E2=80=99t think this is being passed to C, nor do I see UnsafeCell =
being used for its interior mutability
Here, so can=E2=80=99t this just be T?

> +}
> +
> +impl<T: DriverCrtcState> Deref for CrtcState<T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: Our interface ensures that `inner` will not be =
modified unless only a single
> +        // mutable reference exists to `inner`, so this is safe
> +        unsafe { &*self.inner.get() }
> +    }
> +}
> +
> +impl<T: DriverCrtcState> DerefMut for CrtcState<T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        // SAFETY: Our interfaces ensures that we either have one =
mutable reference to the state
> +        // (this one), or multiple immutable references
> +        unsafe { self.inner.get_mut() }
> +    }
> +}
> +
> +/// A trait implemented by any type which can produce a reference to =
a [`struct drm_crtc_state`].
> +///
> +/// This is implemented internally by DRM.
> +///
> +/// [`struct drm_crtc_state`]: srctree/include/drm/drm_crtc.h
> +pub trait AsRawCrtcState: private::AsRawCrtcState {
> +    /// The type that this CRTC state interface returns to represent =
the parent CRTC
> +    type Crtc: AsRawCrtc;
> +}
> +
> +pub(crate) mod private {
> +    use super::*;
> +
> +    #[doc(hidden)]
> +    pub trait AsRawCrtcState {
> +        /// Return a raw pointer to the DRM CRTC state
> +        ///
> +        /// Note that CRTC states are the only atomic state in KMS =
which don't nicely follow rust's
> +        /// data aliasing rules already.
> +        fn as_raw(&self) -> *mut bindings::drm_crtc_state;
> +    }
> +}
> +
> +pub(super) use private::AsRawCrtcState as AsRawCrtcStatePrivate;
> +
> +/// A trait for providing common methods which can be used on any =
type that can be used as an atomic
> +/// CRTC state.
> +pub trait RawCrtcState: AsRawCrtcState {
> +    /// Return the CRTC that owns this state.
> +    fn crtc(&self) -> &Self::Crtc {
> +        // SAFETY:
> +        // * This type conversion is guaranteed by type invariance
> +        // * Our interface ensures that this access follows rust's =
data-aliasing rules
> +        // * `crtc` is guaranteed to never be NULL and is invariant =
throughout the lifetime of the
> +        //   state
> +        unsafe { <Self::Crtc as =
AsRawCrtc>::from_raw((*self.as_raw()).crtc) }
> +    }
> +}
> +impl<T: AsRawCrtcState> RawCrtcState for T {}
> +
> +/// A trait implemented for any type which can be constructed =
directly from a
> +/// [`struct drm_crtc_state`] pointer.
> +///
> +/// This is implemented internally by DRM.
> +///
> +/// [`struct drm_crtc_state`]: srctree/include/drm/drm_crtc.h
> +pub trait FromRawCrtcState: AsRawCrtcState {
> +    /// Obtain a reference back to this type from a raw DRM crtc =
state pointer
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that ptr contains a valid instance of =
this type.
> +    unsafe fn from_raw<'a>(ptr: *const bindings::drm_crtc_state) -> =
&'a Self;
> +}
> +
> +impl<T: DriverCrtcState> private::AsRawCrtcState for CrtcState<T> {
> +    #[inline]
> +    fn as_raw(&self) -> *mut bindings::drm_crtc_state {
> +        self.state.get()
> +    }
> +}
> +
> +impl<T: DriverCrtcState> AsRawCrtcState for CrtcState<T> {
> +    type Crtc =3D Crtc<T::Crtc>;
> +}
> +
> +impl<T: DriverCrtcState> FromRawCrtcState for CrtcState<T> {
> +    unsafe fn from_raw<'a>(ptr: *const bindings::drm_crtc_state) -> =
&'a Self {
> +        // SAFETY: Our data layout starts with =
`bindings::drm_crtc_state`
> +        unsafe { &*(ptr.cast()) }
> +    }
> +}
> +
> +unsafe extern "C" fn crtc_destroy_callback<T: DriverCrtc>(
> +    crtc: *mut bindings::drm_crtc
> +) {
> +    // SAFETY: DRM guarantees that `crtc` points to a valid =
initialized `drm_crtc`.
> +    unsafe { bindings::drm_crtc_cleanup(crtc) };
> +
> +    // SAFETY:
> +    // - DRM guarantees we are now the only one with access to this =
[`drm_crtc`].
> +    // - This cast is safe via `DriverCrtc`s type invariants.
> +    // - We created this as a pinned type originally
> +    drop(unsafe { Pin::new_unchecked(Box::from_raw(crtc as *mut =
Crtc<T>)) });
> +}
> +
> +unsafe extern "C" fn atomic_duplicate_state_callback<T: =
DriverCrtcState>(
> +    crtc: *mut bindings::drm_crtc
> +) -> *mut bindings::drm_crtc_state {
> +    // SAFETY: DRM guarantees that `crtc` points to a valid =
initialized `drm_crtc`.
> +    let state =3D unsafe { (*crtc).state };
> +    if state.is_null() {
> +        return null_mut();
> +    }
> +
> +    // SAFETY: This cast is safe via `DriverCrtcState`s type =
invariants.
> +    let crtc =3D unsafe { Crtc::<T::Crtc>::from_raw(crtc) };
> +
> +    // SAFETY: This cast is safe via `DriverCrtcState`s type =
invariants.
> +    let state =3D unsafe { CrtcState::<T>::from_raw(state) };
> +
> +    let mut new =3D Box::try_init(
> +        try_init!(CrtcState::<T> {
> +            state: Opaque::new(Default::default()),
> +            inner: UnsafeCell::new((*state).clone()),
> +        }),
> +        GFP_KERNEL
> +    );
> +
> +    if let Ok(mut new) =3D new {
> +        let new =3D Box::into_raw(new).cast();
> +
> +        // SAFETY: DRM simply copies the data from the previous base =
DRM state here and does not
> +        // move the contents of `ptr`
> +        unsafe { =
bindings::__drm_atomic_helper_crtc_duplicate_state(crtc.as_raw(), new) }
> +
> +        new
> +    } else {
> +        null_mut()
> +    }
> +}
> +
> +unsafe extern "C" fn atomic_destroy_state_callback<T: =
DriverCrtcState>(
> +    _crtc: *mut bindings::drm_crtc,
> +    crtc_state: *mut bindings::drm_crtc_state,
> +) {
> +    // SAFETY: DRM guarantees that `state` points to a valid instance =
of `drm_crtc_state`
> +    unsafe { =
bindings::__drm_atomic_helper_crtc_destroy_state(crtc_state) };
> +
> +    // SAFETY:
> +    // * DRM guarantees we are the only one with access to this =
`drm_crtc_state`
> +    // * This cast is safe via our type invariants.
> +    // * All data in `CrtcState` is either Unpin, or pinned
> +    drop(unsafe { Box::from_raw(crtc_state as *mut CrtcState<T>) });
> +}
> +
> +unsafe extern "C" fn crtc_reset_callback<T: DriverCrtcState>(
> +    crtc: *mut bindings::drm_crtc,
> +) {
> +    // SAFETY: DRM guarantees that `state` points to a valid instance =
of `drm_crtc_state`
> +    let state =3D unsafe { (*crtc).state };
> +    if !state.is_null() {
> +        // SAFETY:
> +        // * We're guaranteed `crtc` is `Crtc<T>` via type invariants
> +        // * We're guaranteed `state` is `CrtcState<T>` via type =
invariants.
> +        unsafe { atomic_destroy_state_callback::<T>(crtc, state) }
> +
> +        // SAFETY: No special requirements here, DRM expects this to =
be NULL
> +        unsafe { (*crtc).state =3D null_mut(); }
> +    }
> +
> +    // SAFETY: `crtc` is guaranteed to be of type `Crtc<T::Crtc>` by =
type invariance
> +    let crtc =3D unsafe { Crtc::<T::Crtc>::from_raw(crtc) };
> +
> +    // Unfortunately, this is the best we can do at the moment as =
this FFI callback was mistakenly
> +    // presumed to be infallible :(
> +    let new =3D Box::try_init(
> +        try_init!(CrtcState::<T> {
> +            state: Opaque::new(Default::default()),
> +            inner: UnsafeCell::new(Default::default()),
> +        }),
> +        GFP_KERNEL
> +    ).expect("Unfortunately, this API was presumed infallible");
> +
> +    // SAFETY: DRM takes ownership of the state from here, and will =
never move it
> +    unsafe {
> +        bindings::__drm_atomic_helper_crtc_reset(
> +            crtc.as_raw(),
> +            Box::into_raw(new).cast()
> +        )
> +    };
> +}
> --=20
> 2.46.1
>=20
>=20

Overall LGTM.

By the way, what is WIP about this?

=E2=80=94 Daniel=
