Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E34A9DA99E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 15:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD0410EAE3;
	Wed, 27 Nov 2024 14:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="UTd8aLZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4DC10EAE3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 14:05:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732716328; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=oB1NqOPYGTI2V007+mAEJvbGKvpIq5yRhTlTqdEH4IUi/bK2f4L2xK/9tWMmf1L9OLqqDRJS5Y8fLlZm19bFIfJ79rvwVsAY1GltBrIbYJGBagfPswDJT/3t1qwmST8iv7Y5aD42Aj7dnGOqL10guKN0/cXqt5LyN4sOuQJW56U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732716328;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=lWQaC8Mykzh2lnFxQvbvc6WyVeJRdfmR2Vr0d6hP99A=; 
 b=Qr2ynllsRQ1Ns178KMNYSo4pT5KlcF+2Izd3IWejlYLn4GIJmVJ4tPite/G22HGnyqHIIzcK+UPAM/y5v/qvlNxBNbrDSXxZzicSYeyYekZeixpzJoa7+hzrGi/zZco07h5m/HdJZjSx8Y1vWjXJlwBKiWywVJR5gKMpIWmjaBM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732716328; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=lWQaC8Mykzh2lnFxQvbvc6WyVeJRdfmR2Vr0d6hP99A=;
 b=UTd8aLZ/zLIXg3Kn6F/Vvpdbcu4dzVj6CC1GYvw/CIJgw5QwZUF4mKVF6JrlFNLY
 16YYZZiEjXBnmGocDpeSQn0DOO3gZmpu3zLavjkijFQifhYA1C+MlZ8PsI22jYnjn7D
 V8wGDp7JZ2qWBm80OPRbxDxst0NW2URBJgoX68C8=
Received: by mx.zohomail.com with SMTPS id 1732716325951864.0172514414779;
 Wed, 27 Nov 2024 06:05:25 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 06/35] rust: drm/kms: Add drm_plane bindings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-7-lyude@redhat.com>
Date: Wed, 27 Nov 2024 11:05:09 -0300
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
Message-Id: <8F8E50EB-6E10-4FEB-A9A9-630B67B41E33@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-7-lyude@redhat.com>
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
> The next step is adding a set of basic bindings to create a plane, =
which
> has to happen before we can create a CRTC (since we need to be able to =
at
> least specify a primary plane for a CRTC upon creation). This mostly
> follows the same general pattern as connectors (AsRawPlane,
> AsRawPlaneState, etc.).
>=20
> There is one major difference with planes vs. other types of atomic =
mode
> objects: drm_plane_state isn't the only base plane struct used in DRM
> drivers, as some drivers will use helpers like drm_shadow_plane_state =
which
> have a drm_plane_state embedded within them.
>=20
> Since we'll eventually be adding bindings for shadow planes, we =
introduce a
> PlaneStateHelper trait - which represents any data type which can be =
used
> as the main wrapping structure around a drm_plane_state - and we =
implement
> this trait for PlaneState<T>. This trait can be used in our C =
callbacks to
> allow for drivers to use different wrapping structures without needing =
to
> implement a separate set of FFI callbacks for each type. Currently =
planes
> are the only type I'm aware of which do this.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
>=20
> V2:
> * Start using Gerry Guo's updated #[vtable] function so that our =
driver
>  operations table has a static location in memory
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/kms.rs       |   1 +
> rust/kernel/drm/kms/plane.rs | 504 +++++++++++++++++++++++++++++++++++
> 2 files changed, 505 insertions(+)
> create mode 100644 rust/kernel/drm/kms/plane.rs
>=20
> diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
> index 0138e6830b48c..5b075794a1155 100644
> --- a/rust/kernel/drm/kms.rs
> +++ b/rust/kernel/drm/kms.rs
> @@ -4,6 +4,7 @@
>=20
> pub mod connector;
> pub mod fbdev;
> +pub mod plane;
>=20
> use crate::{
>     drm::{
> diff --git a/rust/kernel/drm/kms/plane.rs =
b/rust/kernel/drm/kms/plane.rs
> new file mode 100644
> index 0000000000000..3040c4546b121
> --- /dev/null
> +++ b/rust/kernel/drm/kms/plane.rs
> @@ -0,0 +1,504 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! Bindings for [`struct drm_plane`] and friends.
> +//!
> +//! [`struct drm_plane`]: srctree/include/drm/drm_plane.h
> +
> +use alloc::boxed::Box;
> +use crate::{
> +    bindings,
> +    drm::{device::Device, drv::Driver, fourcc::*},
> +    error::{to_result, from_result, Error},
> +    init::Zeroable,
> +    prelude::*,
> +    types::{ARef, Opaque},
> +    private::Sealed,
> +};
> +use core::{
> +    cell::Cell,
> +    pin::Pin,
> +    slice,
> +    mem::{self, size_of, ManuallyDrop},
> +    ptr::{self, null, null_mut, NonNull},
> +    marker::*,
> +    ops::*,
> +};
> +use macros::pin_data;
> +use super::{
> +    KmsDriver,
> +    UnregisteredKmsDevice,
> +    ModeObject,
> +    StaticModeObject,
> +};
> +
> +/// The main trait for implementing the [`struct drm_plane`] API for =
[`Plane`]
> +///
> +/// Any KMS driver should have at least one implementation of this =
type, which allows them to create
> +/// [`Plane`] objects. Additionally, a driver may store =
driver-private data within the type that
> +/// implements [`DriverPlane`] - and it will be made available when =
using a fully typed [`Plane`]
> +/// object.
> +///
> +/// # Invariants
> +///
> +/// - Any C FFI callbacks generated using this trait are guaranteed =
that passed-in
> +///   [`struct drm_plane`] pointers are contained within a =
[`Plane<Self>`].
> +/// - Any C FFI callbacks generated using this trait are guaranteed =
that passed-in
> +///   [`struct drm_plane_state`] pointers are contained within a =
[`PlaneState<Self::State>`].
> +///
> +/// [`struct drm_plane`]: srctree/include/drm/drm_plane.h
> +/// [`struct drm_plane_state`]: srctree/include/drm/drm_plane.h
> +#[vtable]
> +pub trait DriverPlane: Send + Sync + Sized {
> +    /// The generated C vtable for this [`DriverPlane`] =
implementation.
> +    #[unique]
> +    const OPS: &'static DriverPlaneOps =3D &DriverPlaneOps {
> +        funcs: bindings::drm_plane_funcs {
> +            update_plane: =
Some(bindings::drm_atomic_helper_update_plane),
> +            disable_plane: =
Some(bindings::drm_atomic_helper_disable_plane),
> +            destroy: Some(plane_destroy_callback::<Self>),
> +            reset: Some(plane_reset_callback::<Self>),
> +            set_property: None,
> +            atomic_duplicate_state: =
Some(atomic_duplicate_state_callback::<Self::State>),
> +            atomic_destroy_state: =
Some(atomic_destroy_state_callback::<Self::State>),
> +            atomic_set_property: None, // TODO someday
> +            atomic_get_property: None, // TODO someday
> +            late_register: None, // TODO someday
> +            early_unregister: None, // TODO someday
> +            atomic_print_state: None, // TODO: Display someday???
> +            format_mod_supported: None // TODO someday
> +        },
> +
> +        helper_funcs: bindings::drm_plane_helper_funcs {
> +            prepare_fb: None,
> +            cleanup_fb: None,
> +            begin_fb_access: None, // TODO: someday?
> +            end_fb_access: None, // TODO: someday?
> +            atomic_check: None,
> +            atomic_update: None,
> +            atomic_enable: None, // TODO
> +            atomic_disable: None, // TODO
> +            atomic_async_check: None, // TODO
> +            atomic_async_update: None, // TODO
> +            panic_flush: None,
> +            get_scanout_buffer: None
> +        }
> +    };
> +
> +    /// The type to pass to the `args` field of [`Plane::new`].
> +    ///
> +    /// This type will be made available in in the `args` argument of =
[`Self::new`]. Drivers which
> +    /// don't need this can simply pass [`()`] here.
> +    type Args;
> +
> +    /// The parent [`Driver`] implementation.
> +    type Driver: KmsDriver;
> +
> +    /// The [`DriverPlaneState`] implementation for this =
[`DriverPlane`].
> +    ///
> +    /// See [`DriverPlaneState`] for more info.
> +    type State: DriverPlaneState;
> +
> +    /// The constructor for creating a [`Plane`] using this =
[`DriverPlane`] implementation.
> +    ///
> +    /// Drivers may use this to instantiate their [`DriverPlane`] =
object.
> +    fn new(device: &Device<Self::Driver>, args: Self::Args) -> impl =
PinInit<Self, Error>;
> +}
> +
> +/// The generated C vtable for a [`DriverPlane`].
> +///
> +/// This type is created internally by DRM.
> +pub struct DriverPlaneOps {
> +    funcs: bindings::drm_plane_funcs,
> +    helper_funcs: bindings::drm_plane_helper_funcs,
> +}
> +
> +#[derive(Copy, Clone, Debug, PartialEq, Eq)]
> +#[repr(u32)]
> +/// An enumerator describing a type of [`Plane`].
> +///
> +/// This is mainly just relevant for DRM legacy drivers.
> +pub enum PlaneType {
> +    /// Overlay planes represent all non-primary, non-cursor planes. =
Some drivers refer to these
> +    /// types of planes as "sprites" internally.
> +    OVERLAY =3D bindings::drm_plane_type_DRM_PLANE_TYPE_OVERLAY,

IMHO this should be CamelCase

> +
> +    /// A primary plane attached to a CRTC that is the most likely to =
be able to light up the CRTC
> +    /// when no scaling/cropping is used, and the plane covers the =
whole CRTC.
> +    PRIMARY =3D bindings::drm_plane_type_DRM_PLANE_TYPE_PRIMARY,
> +
> +    /// A cursor plane attached to a CRTC that is more likely to be =
enabled when no scaling/cropping
> +    /// is used, and the framebuffer has the size indicated by =
[`ModeConfigInfo::max_cursor`].
> +    ///
> +    /// [`ModeConfigInfo::max_cursor`]: =
crate::drm::kms::ModeConfigInfo
> +    CURSOR =3D bindings::drm_plane_type_DRM_PLANE_TYPE_CURSOR,
> +}
> +
> +/// The main interface for a [`struct drm_plane`].
> +///
> +/// This type is the main interface for dealing with DRM planes. In =
addition, it also allows
> +/// immutable access to whatever private data is contained within an =
implementor's [`DriverPlane`]
> +/// type.
> +///
> +/// # Invariants
> +///
> +/// - `plane` and `inner` are initialized for as long as this object =
is made available to users.
> +/// - The data layout of this structure begins with [`struct =
drm_plane`].
> +/// - The atomic state for this type can always be assumed to be of =
type [`PlaneState<T::State>`].
> +///
> +/// [`struct drm_plane`]: srctree/include/drm/drm_plane.h
> +#[repr(C)]
> +#[pin_data]
> +pub struct Plane<T: DriverPlane> {
> +    /// The FFI drm_plane object
> +    plane: Opaque<bindings::drm_plane>,
> +    /// The driver's private inner data
> +    #[pin]
> +    inner: T,
> +    #[pin]
> +    _p: PhantomPinned,
> +}
> +
> +unsafe impl Zeroable for bindings::drm_plane {}

The new `unsafe` lints on rust-next will probably complain here FYI.

> +
> +impl<T: DriverPlane> Sealed for Plane<T> {}
> +
> +impl<T: DriverPlane> Deref for Plane<T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.inner
> +    }
> +}
> +
> +impl<T: DriverPlane> Plane<T> {
> +    /// Construct a new [`Plane`].
> +    ///
> +    /// A driver may use this from their [`Kms::create_objects`] =
callback in order to construct new
> +    /// [`Plane`] objects.
> +    ///
> +    /// [`Kms::create_objects`]: =
kernel::drm::kms::Kms::create_objects
> +    pub fn new<'a, 'b: 'a, const FMT_COUNT: usize, const MOD_COUNT: =
usize>(
> +        dev: &'a UnregisteredKmsDevice<'a, T::Driver>,
> +        possible_crtcs: u32,
> +        formats: &'static FormatList<FMT_COUNT>,
> +        format_modifiers: Option<&'static ModifierList<MOD_COUNT>>,
> +        type_: PlaneType,
> +        name: Option<&CStr>,
> +        args: T::Args,
> +    ) -> Result<&'b Self> {
> +        let this: Pin<Box<Self>> =3D Box::try_pin_init(
> +            try_pin_init!(Self {
> +                plane: Opaque::new(bindings::drm_plane {
> +                    helper_private: &T::OPS.helper_funcs,
> +                    ..Default::default()
> +                }),
> +                inner <- T::new(dev, args),
> +                _p: PhantomPinned
> +            }),
> +            GFP_KERNEL
> +        )?;
> +
> +        // SAFETY: FFI call with no special requirements
> +        to_result(unsafe {
> +            bindings::drm_universal_plane_init(
> +                dev.as_raw(),
> +                this.as_raw(),
> +                possible_crtcs,
> +                &T::OPS.funcs,
> +                formats.as_ptr(),
> +                formats.raw_len() as _,
> +                format_modifiers.map_or(null(), |f| f.as_ptr()),
> +                type_ as _,
> +                name.map_or(null(), |n| n.as_char_ptr())
> +            )
> +        })?;
> +
> +        // Convert the box into a raw pointer, we'll re-assemble it =
in plane_destroy_callback()
> +        // SAFETY: We don't move anything
> +        Ok(unsafe { &*Box::into_raw(Pin::into_inner_unchecked(this)) =
})
> +    }
> +}
> +
> +/// A trait implemented by any type that acts as a [`struct =
drm_plane`] interface.
> +///
> +/// This is implemented internally by DRM.
> +///
> +/// [`struct drm_plane`]: srctree/include/drm/drm_plane.h
> +pub trait AsRawPlane: StaticModeObject {
> +    /// The type that should be used to represent an atomic state for =
this plane interface.
> +    type State: FromRawPlaneState;
> +
> +    /// Return the raw `bindings::drm_plane` for this DRM plane.
> +    ///
> +    /// Drivers should never use this directly.
> +    fn as_raw(&self) -> *mut bindings::drm_plane;
> +
> +    /// Convert a raw `bindings::drm_plane` pointer into an object of =
this type.
> +    ///
> +    /// SAFETY: Callers promise that `ptr` points to a valid instance =
of this type
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_plane) -> &'a =
Self;
> +}
> +
> +impl<T: DriverPlane> AsRawPlane for Plane<T> {
> +    type State =3D PlaneState<T::State>;
> +
> +    fn as_raw(&self) -> *mut bindings::drm_plane {
> +        self.plane.get()
> +    }
> +
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_plane) -> &'a Self =
{
> +        // SAFETY: Our data layout starts with `bindings::drm_plane`
> +        unsafe { &*ptr.cast() }
> +    }
> +}
> +
> +impl<T: DriverPlane> ModeObject for Plane<T> {
> +    type Driver =3D T::Driver;
> +
> +    fn drm_dev(&self) -> &Device<Self::Driver> {
> +        // SAFETY: DRM planes exist for as long as the device does, =
so this pointer is always valid
> +        unsafe { Device::borrow((*self.as_raw()).dev) }
> +    }
> +
> +    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
> +        // SAFETY: We don't expose DRM planes to users before `base` =
is initialized
> +        unsafe { &mut ((*self.as_raw()).base) }
> +    }
> +}
> +
> +// SAFETY: Planes do not have a refcount
> +unsafe impl<T: DriverPlane> StaticModeObject for Plane<T> {}
> +
> +// SAFETY: Our interface is thread-safe.
> +unsafe impl<T: DriverPlane> Send for Plane<T> {}
> +
> +// SAFETY: Our interface is thread-safe.
> +unsafe impl<T: DriverPlane> Sync for Plane<T> {}
> +
> +/// A trait implemented by any type which can produce a reference to =
a [`struct drm_plane_state`].
> +///
> +/// This is implemented internally by DRM.
> +///
> +/// [`struct drm_plane_state`]: srctree/include/drm/drm_plane.h
> +pub trait AsRawPlaneState: private::AsRawPlaneState {
> +    /// The type that this plane state interface returns to represent =
the parent DRM plane
> +    type Plane: AsRawPlane;
> +}
> +
> +pub(crate) mod private {
> +    /// Trait for retrieving references to the base plane state =
contained within any plane state
> +    /// compatible type
> +    #[doc(hidden)]
> +    pub trait AsRawPlaneState {

You should probably document why you need this module. I think you did =
on one of your previous
patches already.

> +        /// Return an immutable reference to the raw plane state
> +        fn as_raw(&self) -> &bindings::drm_plane_state;
> +
> +        /// Get a mutable reference to the raw =
`bindings::drm_plane_state` contained within this
> +        /// type.
> +        ///
> +        /// # Safety
> +        ///
> +        /// The caller promises this mutable reference will not be =
used to modify any contents of
> +        /// `bindings::drm_plane_state` which DRM would consider to =
be static - like the backpointer
> +        /// to the DRM plane that owns this state. This also means =
the mutable reference should
> +        /// never be exposed outside of this crate.
> +        unsafe fn as_raw_mut(&mut self) -> &mut =
bindings::drm_plane_state;
> +    }
> +}
> +
> +pub(crate) use private::AsRawPlaneState as AsRawPlaneStatePrivate;
> +
> +/// A trait implemented for any type which can be constructed =
directly from a
> +/// [`struct drm_plane_state`] pointer.
> +///
> +/// This is implemented internally by DRM.
> +///
> +/// [`struct drm_plane_state`]: srctree/include/drm/drm_plane.h
> +pub trait FromRawPlaneState: AsRawPlaneState {
> +    /// Get an immutable reference to this type from the given raw =
`bindings::drm_plane_state`
> +    /// pointer
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller guarantees `ptr` is contained within a valid =
instance of `Self`
> +    unsafe fn from_raw<'a>(ptr: *const bindings::drm_plane_state) -> =
&'a Self;
> +
> +    /// Get a mutable reference to this type from the given raw =
`bindings::drm_plane_state` pointer
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller guarantees `ptr` is contained within a valid =
instance of `Self`, and that no
> +    /// other references (mutable or immutable) to `ptr` exist.
> +    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_plane_state) =
-> &'a mut Self;
> +}
> +
> +/// The main interface for a [`struct drm_plane_state`].
> +///
> +/// This type is the main interface for dealing with the atomic state =
of DRM planes. In addition, it
> +/// allows access to whatever private data is contained within an =
implementor's [`DriverPlaneState`]
> +/// type.
> +///
> +/// # Invariants
> +///
> +/// - The DRM C API and our interface guarantees that only the user =
has mutable access to `state`,
> +///   up until [`drm_atomic_helper_commit_hw_done`] is called. =
Therefore, `plane` follows rust's
> +///   data aliasing rules and does not need to be behind an =
[`Opaque`] type.
> +/// - `state` and `inner` initialized for as long as this object is =
exposed to users.
> +/// - The data layout of this structure begins with [`struct =
drm_plane_state`].
> +/// - The plane for this atomic state can always be assumed to be of =
type [`Plane<T::Plane>`].
> +///
> +/// [`struct drm_plane_state`]: srctree/include/drm/drm_plane.h
> +/// [`drm_atomic_helper_commit_hw_done`]: =
srctree/include/drm/drm_atomic_helper.h
> +#[derive(Default)]
> +#[repr(C)]
> +pub struct PlaneState<T: DriverPlaneState> {
> +    state: bindings::drm_plane_state,
> +    inner: T,
> +}

Out of curiosity, why the repr(C) here?

> +
> +/// The main trait for implementing the [`struct drm_plane_state`] =
API for a [`Plane`].
> +///
> +/// A driver may store driver-private data within the implementor's =
type, which will be available
> +/// when using a full typed [`PlaneState`] object.
> +///
> +/// # Invariants
> +///
> +/// - Any C FFI callbacks generated using this trait are guaranteed =
that passed-in
> +///   [`struct drm_plane`] pointers are contained within a =
[`Plane<Self::Plane>`].
> +/// - Any C FFI callbacks generated using this trait are guaranteed =
that passed-in
> +///   [`struct drm_plane_state`] pointers are contained within a =
[`PlaneState<Self>`].
> +///
> +/// [`struct drm_plane`]: srctree/include/drm_plane.h
> +/// [`struct drm_plane_state`]: srctree/include/drm_plane.h
> +pub trait DriverPlaneState: Clone + Default + Sized {
> +    /// The type for this driver's drm_plane implementation
> +    type Plane: DriverPlane;
> +}
> +
> +impl<T: DriverPlaneState> Sealed for PlaneState<T> {}
> +
> +impl<T: DriverPlaneState> AsRawPlaneState for PlaneState<T> {
> +    type Plane =3D Plane<T::Plane>;
> +}
> +
> +impl<T: DriverPlaneState> private::AsRawPlaneState for PlaneState<T> =
{
> +    fn as_raw(&self) -> &bindings::drm_plane_state {
> +        &self.state
> +    }
> +
> +    unsafe fn as_raw_mut(&mut self) -> &mut bindings::drm_plane_state =
{
> +        &mut self.state
> +    }
> +}
> +
> +impl<T: DriverPlaneState> FromRawPlaneState for PlaneState<T> {
> +    unsafe fn from_raw<'a>(ptr: *const bindings::drm_plane_state) -> =
&'a Self {
> +        // SAFETY: Our data layout starts with =
`bindings::drm_plane_state`
> +        unsafe { &*ptr.cast() }

Same comment about breaking this into multiple statements since it gets =
a bit hard to parse otherwise.


> +    }
> +
> +    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_plane_state) =
-> &'a mut Self {
> +        // SAFETY: Our data layout starts with =
`bindings::drm_plane_state`
> +        unsafe { &mut *ptr.cast() }
> +    }
> +}
> +
> +unsafe impl Zeroable for bindings::drm_plane_state {}

The unsafe lint will probably complain here too.

> +
> +impl<T: DriverPlaneState> Deref for PlaneState<T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.inner
> +    }
> +}
> +
> +impl<T: DriverPlaneState> DerefMut for PlaneState<T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        &mut self.inner
> +    }
> +}
> +
> +unsafe extern "C" fn plane_destroy_callback<T: DriverPlane>(
> +    plane: *mut bindings::drm_plane
> +) {
> +    // SAFETY: DRM guarantees that `plane` points to a valid =
initialized `drm_plane`.
> +    unsafe { bindings::drm_plane_cleanup(plane) };
> +
> +    // SAFETY:
> +    // - DRM guarantees we are now the only one with access to this =
[`drm_plane`].
> +    // - This cast is safe via `DriverPlane`s type invariants.
> +    drop(unsafe { Box::from_raw(plane as *mut Plane<T>) });
> +}
> +
> +unsafe extern "C" fn atomic_duplicate_state_callback<T: =
DriverPlaneState>(
> +    plane: *mut bindings::drm_plane
> +) -> *mut bindings::drm_plane_state {
> +    // SAFETY: DRM guarantees that `plane` points to a valid =
initialized `drm_plane`.
> +    let state =3D unsafe { (*plane).state };
> +    if state.is_null() {
> +        return null_mut();
> +    }
> +
> +    // SAFETY: This cast is safe via `DriverPlaneState`s type =
invariants.
> +    let state =3D unsafe { PlaneState::<T>::from_raw(state) };
> +
> +    let new =3D Box::try_init(
> +        try_init!(PlaneState::<T> {
> +            state: bindings::drm_plane_state { ..Default::default() =
},
> +            inner: state.inner.clone()
> +        }),
> +        GFP_KERNEL
> +    );
> +
> +    if let Ok(mut new) =3D new {
> +        // SAFETY: Just a lil' FFI call, nothing special here
> +        unsafe {
> +            =
bindings::__drm_atomic_helper_plane_duplicate_state(plane, =
new.as_raw_mut())
> +        };
> +
> +        Box::into_raw(new).cast()
> +    } else {
> +        null_mut()
> +    }
> +}
> +
> +unsafe extern "C" fn atomic_destroy_state_callback<T: =
DriverPlaneState>(
> +    _plane: *mut bindings::drm_plane,
> +    state: *mut bindings::drm_plane_state
> +) {
> +    // SAFETY: DRM guarantees that `state` points to a valid instance =
of `drm_plane_state`
> +    unsafe { bindings::__drm_atomic_helper_plane_destroy_state(state) =
};
> +
> +    // SAFETY:
> +    // * DRM guarantees we are the only one with access to this =
`drm_plane_state`
> +    // * This cast is safe via our type invariants.
> +    drop(unsafe { Box::from_raw(state.cast::<PlaneState<T>>()) });
> +}
> +
> +unsafe extern "C" fn plane_reset_callback<T: DriverPlane>(
> +    plane: *mut bindings::drm_plane,
> +) {
> +    // SAFETY: DRM guarantees that `state` points to a valid instance =
of `drm_plane_state`
> +    let state =3D unsafe { (*plane).state };
> +    if !state.is_null() {
> +        // SAFETY:
> +        // * We're guaranteed `plane` is `Plane<T>` via type =
invariants
> +        // * We're guaranteed `state` is `PlaneState<T>` via type =
invariants.
> +        unsafe { atomic_destroy_state_callback::<T::State>(plane, =
state) }
> +
> +        // SAFETY: No special requirements here, DRM expects this to =
be NULL
> +        unsafe { (*plane).state =3D null_mut(); }
> +    }
> +
> +    // Unfortunately, this is the best we can do at the moment as =
this FFI callback was mistakenly
> +    // presumed to be infallible :(
> +    let new =3D Box::new(PlaneState::<T::State>::default(), =
GFP_KERNEL)
> +        .expect("Blame the API, sorry!");

Same comment as the previous patch: maybe just return here?

> +
> +    // DRM takes ownership of the state from here, resets it, and =
then assigns it to the plane
> +    // SAFETY:
> +    // - DRM guarantees that `plane` points to a valid instance of =
`drm_plane`.
> +    // - The cast to `drm_plane_state` is safe via `PlaneState`s type =
invariants.
> +    unsafe { bindings::__drm_atomic_helper_plane_reset(plane, =
Box::into_raw(new).cast()) };
> +}
> --=20
> 2.46.1
>=20

LGTM overall. Like the preceding patch, this is very well-done. Kudos

=E2=80=94 Daniel

