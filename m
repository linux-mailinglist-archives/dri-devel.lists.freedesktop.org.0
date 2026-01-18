Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8487D3971E
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 15:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BF410E2CC;
	Sun, 18 Jan 2026 14:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fU2dVGeo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4B210E2C9;
 Sun, 18 Jan 2026 14:27:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 947AD60010;
 Sun, 18 Jan 2026 14:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9603FC116D0;
 Sun, 18 Jan 2026 14:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768746477;
 bh=lS3NniEDt1TzzRXMVQeNkdK2mEEG0wZdHjgODHnn90A=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=fU2dVGeo/fBWPIi5TjXgHF/AQGhPgDfcqjPXxb3F7Yl/ctK2/LvymrYobZr4+MidQ
 FfiIn3Y0s3nVe1WtyQg2EqlpmhztArA66k7XT+JAH4HVO1VhlhcMssQGEzxaDjc4SH
 Y1jWBl+krS7cWXCRC9f5DsvCWz0+Dan+hYWwbHG6jkfD2srhM1J78G6qlKdokDcNhP
 3XsWHbNmba3chM7scsPq88/NpoWssGGjhWLuYOSAOxRx2JO+Cn3PuwD+73kxdk1jBy
 vl8skgbsX5O0wJhf/iKlG+SKy74PmnALHuVGaaTCj42RDDc9sdrAX2rr9MeLp5cdHD
 wyrG/qyoCuEHg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Jan 2026 15:27:52 +0100
Message-Id: <DFRSAO9CXHZ7.2WD0GAOQUILUE@kernel.org>
Subject: Re: [PATCH v2 1/3] rust/drm: Introduce DeviceContext
Cc: <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Alice Ryhl"
 <aliceryhl@google.com>, "Shankari Anand" <shankari.ak0208@gmail.com>,
 "David Airlie" <airlied@gmail.com>, "Benno Lossin" <lossin@kernel.org>,
 "Asahi Lina" <lina+kernel@asahilina.net>, "Atharv Dubey"
 <atharvd440@gmail.com>, "Daniel Almeida" <daniel.almeida@collabora.com>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116204728.725579-1-lyude@redhat.com>
 <20260116204728.725579-2-lyude@redhat.com>
In-Reply-To: <20260116204728.725579-2-lyude@redhat.com>
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

On Fri Jan 16, 2026 at 9:41 PM CET, Lyude Paul wrote:
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 3ce8f62a00569..53ca71daf2f86 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -7,14 +7,20 @@
>  use crate::{
>      alloc::allocator::Kmalloc,
>      bindings, device, drm,
> -    drm::driver::AllocImpl,
> +    drm::{driver::AllocImpl, private::Sealed},

Please use kernel vertical style [1] when making changes.

(If you want you can also add an additional patch converting the whole DRM
module first for consistency.)

[1] https://docs.kernel.org/rust/coding-guidelines.html#imports

>      error::from_err_ptr,
>      error::Result,
>      prelude::*,
>      sync::aref::{ARef, AlwaysRefCounted},
> -    types::Opaque,
> +    types::{NotThreadSafe, Opaque},
> +};
> +use core::{
> +    alloc::Layout,
> +    marker::PhantomData,
> +    mem::{self},
> +    ops::Deref,
> +    ptr::{self, NonNull},
>  };
> -use core::{alloc::Layout, mem, ops::Deref, ptr, ptr::NonNull};
> =20
>  #[cfg(CONFIG_DRM_LEGACY)]
>  macro_rules! drm_legacy_fields {
> @@ -47,26 +53,88 @@ macro_rules! drm_legacy_fields {
>      }
>  }
> =20
> -/// A typed DRM device with a specific `drm::Driver` implementation.
> +macro_rules! drm_dev_ctx {
> +    (
> +        $( #[$attrs:meta] )*
> +        $name:ident
> +    ) =3D> {
> +        $( #[$attrs] )*
> +        pub struct $name;
> +
> +        impl DeviceContext for $name {}
> +        impl Sealed for $name {}
> +
> +        // SAFETY: All registration states are free of side-effects (e.g=
. no Drop) and are ZSTs,
> +        // thus they are always thread-safe.
> +        unsafe impl Send for $name {}
> +        // SAFETY: All registration states are free of side-effects (e.g=
. no Drop) and are ZSTs,
> +        // thus they are always thread-safe.
> +        unsafe impl Sync for $name {}

They are all ZSTs and should be Send + Sync by default, hence the impls are=
 not
needed.

Also, I don't think this macro adds a lot of value when the Send and Sync i=
mpls
are removed. In the driver core it looks like this:

	mod private {
	    pub trait Sealed {}
=09
	    impl Sealed for super::Bound {}
	    impl Sealed for super::Core {}
	    impl Sealed for super::CoreInternal {}
	    impl Sealed for super::Normal {}
	}
=09
	impl DeviceContext for Bound {}
	impl DeviceContext for Core {}
	impl DeviceContext for CoreInternal {}
	impl DeviceContext for Normal {}

I think that's compact enough.

> +    };
> +}
> +
> +/// A trait implemented by all possible contexts a [`Device`] can be use=
d in.

I think this documentation should provide a rough overview of the different
states a DRM device can have.

> +pub trait DeviceContext: Sealed + Send + Sync {}
> +
> +drm_dev_ctx! {
> +    /// The [`DeviceContext`] of a [`Device`] that was registered with u=
serspace at some point.
> +    ///
> +    /// This represents a [`Device`] which is guaranteed to have been re=
gistered with userspace at
> +    /// some point in time. Such a DRM device is guaranteed to have been=
 fully-initialized.
> +    ///
> +    /// Note: A device in this context is not guaranteed to remain regis=
tered with userspace for its
> +    /// entire lifetime, as this is impossible to guarantee at compile-t=
ime. However, any
> +    /// userspace-dependent operations performed with an unregistered de=
vice in this [`DeviceContext`]
> +    /// are guaranteed to be no-ops.
> +    ///
> +    /// # Invariants
> +    ///
> +    /// A [`Device`] in this [`DeviceContext`] is guaranteed to have cal=
led `drm_dev_register` once.

I'm not sure it makes sense for user facing documentation to menthion the
corresponding C function here. I'd just say that it has been registered wit=
h the
DRM core.

> +    Registered
> +}
> +
> @@ -132,9 +202,40 @@ pub fn new(dev: &device::Device, data: impl PinInit<=
T::Data, Error>) -> Result<A
> =20
>          // SAFETY: The reference count is one, and now we take ownership=
 of that reference as a
>          // `drm::Device`.
> -        Ok(unsafe { ARef::from_raw(raw_drm) })
> +        // INVARIANT: We just created the device above, but have yet to =
call `drm_dev_register`.
> +        // `Self` cannot be copied or sent to another thread - ensuring =
that `drm_dev_register`
> +        // won't be called during its lifetime and that the device is un=
registered

Please end with a period.

> +        Ok(Self(unsafe { ARef::from_raw(raw_drm) }, NotThreadSafe))
>      }
> +}
> =20
> +/// A typed DRM device with a specific [`drm::Driver`] implementation an=
d [`DeviceContext`].
> +///
> +/// Since DRM devices can be used before being fully initialized and reg=
istered with userspace, `C`
> +/// represents the furthest [`DeviceContext`] we can guarantee that this=
 [`Device`] has reached.
> +///
> +/// Keep in mind: this means that an unregistered device can still have =
the registration state
> +/// [`Registered`] as long as it was registered with userspace once in t=
he past, and that the
> +/// behavior of such a device is still well-defined. In such a situation=
, the behavior of any
> +/// functions which interact with userspace will simply be no-ops. Addit=
ionally, a device with the

I don't think those are necessarily no-ops, in hot-unplug cases drivers mig=
ht
still receive DRM callbacks from userspace. But they won't be able to acces=
s bus
device resources anymore. In contrast to the DRM C implementation the
corresponding synchronization happens at driver core level in Rust, whereas=
 on
the C side there is drm_dev_enter() / drm_dev_exit() for this.

> +/// registration state [`Uninit`] simply does not have a guaranteed regi=
stration state at compile
> +/// time, and could be either registered or unregistered. Since there is=
 no way to guarantee a
> +/// long-lived reference to an unregistered device would remain unregist=
ered, we do not provide a
> +/// [`DeviceContext`] for this.
> +///
> +/// # Invariants
> +///
> +/// * `self.dev` is a valid instance of a `struct device`.
> +/// * The data layout of `Self` remains the same across all implementati=
ons of `C`.
> +/// * Any invariants for `C` also apply.
> +#[repr(C)]
> +pub struct Device<T: drm::Driver, C: DeviceContext =3D Registered> {
> +    dev: Opaque<bindings::drm_device>,
> +    data: T::Data,
> +    _ctx: PhantomData<C>,
> +}
> +
> +impl<T: drm::Driver, C: DeviceContext> Device<T, C> {
>      pub(crate) fn as_raw(&self) -> *mut bindings::drm_device {
>          self.dev.get()
>      }
> @@ -160,13 +261,13 @@ unsafe fn into_drm_device(ptr: NonNull<Self>) -> *m=
ut bindings::drm_device {
>      ///
>      /// # Safety
>      ///
> -    /// Callers must ensure that `ptr` is valid, non-null, and has a non=
-zero reference count,
> -    /// i.e. it must be ensured that the reference count of the C `struc=
t drm_device` `ptr` points
> -    /// to can't drop to zero, for the duration of this function call an=
d the entire duration when
> -    /// the returned reference exists.
> -    ///
> -    /// Additionally, callers must ensure that the `struct device`, `ptr=
` is pointing to, is
> -    /// embedded in `Self`.
> +    /// * Callers must ensure that `ptr` is valid, non-null, and has a n=
on-zero reference count,
> +    ///   i.e. it must be ensured that the reference count of the C `str=
uct drm_device` `ptr` points
> +    ///   to can't drop to zero, for the duration of this function call =
and the entire duration when
> +    ///   the returned reference exists.
> +    /// * Additionally, callers must ensure that the `struct device`, `p=
tr` is pointing to, is

I'd drop "additionally", it is a listing anyways.

> +    ///   embedded in `Self`.
> +    /// * Callers promise that any type invariants of `C` will be upheld=
.

What do you mean by "type invariants of C"?

>  impl<T: Driver> Registration<T> {
>      /// Creates a new [`Registration`] and registers it.
> -    fn new(drm: &drm::Device<T>, flags: usize) -> Result<Self> {
> +    fn new(drm: drm::UnregisteredDevice<T>, flags: usize) -> Result<Self=
> {
>          // SAFETY: `drm.as_raw()` is valid by the invariants of `drm::De=
vice`.
>          to_result(unsafe { bindings::drm_dev_register(drm.as_raw(), flag=
s) })?;
> =20
> -        Ok(Self(drm.into()))
> +        // SAFETY: We just called `drm_dev_register` above
> +        let new =3D NonNull::from(unsafe { drm.assume_ctx() });
> +
> +        // Leak the ARef from UnregisteredDevice in preparation for tran=
sferring its ownership.
> +        mem::forget(drm);
> +
> +        // SAFETY: `drm`'s `Drop` constructor was never called, ensuring=
 that there remains at least
> +        // one reference to the device - which we take ownership over he=
re.
> +        let new =3D unsafe { ARef::from_raw(new) };
> +
> +        Ok(Self(new))
>      }
> =20
> -    /// Same as [`Registration::new`}, but transfers ownership of the [`=
Registration`] to
> +    /// Same as [`Registration::new`], but transfers ownership of the [`=
Registration`] to
>      /// [`devres::register`].
> -    pub fn new_foreign_owned(
> -        drm: &drm::Device<T>,
> -        dev: &device::Device<device::Bound>,
> +    pub fn new_foreign_owned<'a>(
> +        drm: drm::UnregisteredDevice<T>,
> +        dev: &'a device::Device<device::Bound>,
>          flags: usize,
> -    ) -> Result
> +    ) -> Result<&'a drm::Device<T>>
>      where
>          T: 'static,
>      {
> -        if drm.as_ref().as_raw() !=3D dev.as_raw() {
> +        let this_dev: &device::Device =3D drm.as_ref();
> +        if this_dev.as_raw() !=3D dev.as_raw() {

this_dev is misleading, since it actually is the parent device. Besides tha=
t,
the change seems unnecessary, no?

>              return Err(EINVAL);
>          }
> =20
>          let reg =3D Registration::<T>::new(drm, flags)?;
> +        let drm =3D NonNull::from(reg.device());
> +
> +        devres::register(dev, reg, GFP_KERNEL)?;
> =20
> -        devres::register(dev, reg, GFP_KERNEL)
> +        // SAFETY: Since `reg` was passed to devres::register(), the dev=
ice now owns the lifetime
> +        // of the DRM registration - ensuring that this references lives=
 for at least as long as 'a.
> +        Ok(unsafe { drm.as_ref() })
>      }

