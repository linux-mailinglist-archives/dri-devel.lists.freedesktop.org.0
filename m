Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIYgOur1hWnHIgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:08:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E39BFEA1F
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AB710E7AE;
	Fri,  6 Feb 2026 14:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="VWJiaexE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B16110E7AE;
 Fri,  6 Feb 2026 14:08:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770386916; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hu3siLgJzCQ413QEuJPxtMNGEqfa8Ynr4abt4v/wDMs4AoC2p/nKYBguCsHRvOFZcIJcc94ElfVGQhkFCI+Dn3yHW6lICms/bPprk0JR6SEse651L0vaEx0nA0QE8Mbxa7ZWOeoNTxCxjZYEZd1Etw4tV+w0anLHWWq23NESE78=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770386916;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=fjVILBM2ktsVp85wwK6bnQYSbjvZ28007Q/fc1W+zVk=; 
 b=nD5f+EUOLe4oLCkH7kCDoDDuuydhkWG9f75RmBo1rcQhsvLNPRKNR/GDJ6VCY1/ufaWPWp5rXiTCBaH5VPuB9HRLQ6kolebYPW6J7HgjO4bfHEE/hfJpZTnHjzgKOMbWce4WXhVTdY+9Tdb2/EMr7gMoBqF75nIxb3cVi4GJ3PM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770386916; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=fjVILBM2ktsVp85wwK6bnQYSbjvZ28007Q/fc1W+zVk=;
 b=VWJiaexEPUPRx9/S6lgRd0wE12s5r3SrgVUjrx5c28s0B9cVeIHpWLbRVBTUJIn0
 v8nSOI+K6DMVrvc8p9mJdiYHYOLCFRAI1V1gmhlhlYl5PIcymjmTif1RhN2WHbgFrMs
 r6RUTeezTWPwI3amTy/nIaiffklnqppLOs3w83iY=
Received: by mx.zohomail.com with SMTPS id 1770386914603927.541128059737;
 Fri, 6 Feb 2026 06:08:34 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 4/4] rust/drm/gem: Use DeviceContext with GEM objects
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260131001602.2095470-5-lyude@redhat.com>
Date: Fri, 6 Feb 2026 11:08:18 -0300
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <43885D9A-4D61-43FC-9BFB-31DDB8A9446E@collabora.com>
References: <20260131001602.2095470-1-lyude@redhat.com>
 <20260131001602.2095470-5-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,ffwll.ch,google.com,gmail.com,asahilina.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	APPLE_MAILER_COMMON(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 4E39BFEA1F
X-Rspamd-Action: no action



> On 30 Jan 2026, at 21:13, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Now that we have the ability to represent the context in which a DRM =
device
> is in at compile-time, we can start carrying around this context with =
GEM
> object types in order to allow a driver to safely create GEM objects =
before
> a DRM device has registered with userspace.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> V4:
> * Add a comment to explain the Uninit DeviceContext usage in the GEM =
object
>  vtable (tl;dr: the DeviceContext is meaningless here)
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> drivers/gpu/drm/nova/driver.rs |  2 +-
> drivers/gpu/drm/nova/gem.rs    | 11 ++++---
> drivers/gpu/drm/tyr/driver.rs  |  2 +-
> drivers/gpu/drm/tyr/gem.rs     |  3 +-
> rust/kernel/drm/device.rs      | 18 ++++++-----
> rust/kernel/drm/driver.rs      |  2 +-
> rust/kernel/drm/gem/mod.rs     | 57 ++++++++++++++++++++++------------
> 7 files changed, 61 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nova/driver.rs =
b/drivers/gpu/drm/nova/driver.rs
> index 8cea5f68c3b04..2c13261450406 100644
> --- a/drivers/gpu/drm/nova/driver.rs
> +++ b/drivers/gpu/drm/nova/driver.rs
> @@ -67,7 +67,7 @@ fn probe(adev: &auxiliary::Device<Core>, _info: =
&Self::IdInfo) -> impl PinInit<S
> impl drm::Driver for NovaDriver {
>     type Data =3D NovaData;
>     type File =3D File;
> -    type Object =3D gem::Object<NovaObject>;
> +    type Object<Ctx: drm::DeviceContext> =3D gem::Object<NovaObject, =
Ctx>;
>=20
>     const INFO: drm::DriverInfo =3D INFO;
>=20
> diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> index 6ccfa5da57617..f6e98b9db58d8 100644
> --- a/drivers/gpu/drm/nova/gem.rs
> +++ b/drivers/gpu/drm/nova/gem.rs
> @@ -2,7 +2,7 @@
>=20
> use kernel::{
>     drm,
> -    drm::{gem, gem::BaseObject},
> +    drm::{gem, gem::BaseObject, DeviceContext},
>     page,
>     prelude::*,
>     sync::aref::ARef,
> @@ -20,20 +20,23 @@ pub(crate) struct NovaObject {}
> impl gem::DriverObject for NovaObject {
>     type Driver =3D NovaDriver;
>=20
> -    fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, =
Error> {
> +    fn new<Ctx: DeviceContext>(_dev: &NovaDevice<Ctx>, _size: usize) =
-> impl PinInit<Self, Error> {
>         try_pin_init!(NovaObject {})
>     }
> }
>=20
> impl NovaObject {
>     /// Create a new DRM GEM object.
> -    pub(crate) fn new(dev: &NovaDevice, size: usize) -> =
Result<ARef<gem::Object<Self>>> {
> +    pub(crate) fn new<Ctx: DeviceContext>(
> +        dev: &NovaDevice<Ctx>,
> +        size: usize,
> +    ) -> Result<ARef<gem::Object<Self, Ctx>>> {
>         if size =3D=3D 0 {
>             return Err(EINVAL);
>         }
>         let aligned_size =3D page::page_align(size).ok_or(EINVAL)?;
>=20
> -        gem::Object::new(dev, aligned_size)
> +        gem::Object::<Self, Ctx>::new(dev, aligned_size)
>     }
>=20
>     /// Look up a GEM object handle for a `File` and return an =
`ObjectRef` for it.
> diff --git a/drivers/gpu/drm/tyr/driver.rs =
b/drivers/gpu/drm/tyr/driver.rs
> index b574ee1c24587..170ffdfd92a18 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -177,7 +177,7 @@ fn drop(self: Pin<&mut Self>) {
> impl drm::Driver for TyrDriver {
>     type Data =3D TyrData;
>     type File =3D File;
> -    type Object =3D drm::gem::Object<TyrObject>;
> +    type Object<R: drm::DeviceContext> =3D =
drm::gem::Object<TyrObject, R>;
>=20
>     const INFO: drm::DriverInfo =3D INFO;
>=20
> diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> index 1273bf89dbd5d..00804f8c14bd4 100644
> --- a/drivers/gpu/drm/tyr/gem.rs
> +++ b/drivers/gpu/drm/tyr/gem.rs
> @@ -3,6 +3,7 @@
> use crate::driver::TyrDevice;
> use crate::driver::TyrDriver;
> use kernel::drm::gem;
> +use kernel::drm::DeviceContext;
> use kernel::prelude::*;
>=20
> /// GEM Object inner driver data
> @@ -12,7 +13,7 @@ pub(crate) struct TyrObject {}
> impl gem::DriverObject for TyrObject {
>     type Driver =3D TyrDriver;
>=20
> -    fn new(_dev: &TyrDevice, _size: usize) -> impl PinInit<Self, =
Error> {
> +    fn new<Ctx: DeviceContext>(_dev: &TyrDevice<Ctx>, _size: usize) =
-> impl PinInit<Self, Error> {
>         try_pin_init!(TyrObject {})
>     }
> }
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index a1d9b0e92f3fd..8dd1508c51cec 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -163,13 +163,17 @@ impl<T: drm::Driver> UnregisteredDevice<T> {
>         master_set: None,
>         master_drop: None,
>         debugfs_init: None,
> -        gem_create_object: T::Object::ALLOC_OPS.gem_create_object,
> -        prime_handle_to_fd: T::Object::ALLOC_OPS.prime_handle_to_fd,
> -        prime_fd_to_handle: T::Object::ALLOC_OPS.prime_fd_to_handle,
> -        gem_prime_import: T::Object::ALLOC_OPS.gem_prime_import,
> -        gem_prime_import_sg_table: =
T::Object::ALLOC_OPS.gem_prime_import_sg_table,
> -        dumb_create: T::Object::ALLOC_OPS.dumb_create,
> -        dumb_map_offset: T::Object::ALLOC_OPS.dumb_map_offset,
> +
> +        // Ignore the Uninit DeviceContext below. It is only provided =
because it is required by the
> +        // compiler, and it is not actually used by these functions.
> +        gem_create_object: =
T::Object::<Uninit>::ALLOC_OPS.gem_create_object,
> +        prime_handle_to_fd: =
T::Object::<Uninit>::ALLOC_OPS.prime_handle_to_fd,
> +        prime_fd_to_handle: =
T::Object::<Uninit>::ALLOC_OPS.prime_fd_to_handle,
> +        gem_prime_import: =
T::Object::<Uninit>::ALLOC_OPS.gem_prime_import,
> +        gem_prime_import_sg_table: =
T::Object::<Uninit>::ALLOC_OPS.gem_prime_import_sg_table,
> +        dumb_create: T::Object::<Uninit>::ALLOC_OPS.dumb_create,
> +        dumb_map_offset: =
T::Object::<Uninit>::ALLOC_OPS.dumb_map_offset,
> +
>         show_fdinfo: None,
>         fbdev_probe: None,
>=20
> diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
> index cfb8884ece700..e6893f089733d 100644
> --- a/rust/kernel/drm/driver.rs
> +++ b/rust/kernel/drm/driver.rs
> @@ -110,7 +110,7 @@ pub trait Driver {
>     type Data: Sync + Send;
>=20
>     /// The type used to manage memory for this driver.
> -    type Object: AllocImpl;
> +    type Object<Ctx: drm::DeviceContext>: AllocImpl;
>=20
>     /// The type used to represent a DRM File (client)
>     type File: drm::file::DriverFile;
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index ad74c5159f725..3af9f52f8eda4 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -8,6 +8,10 @@
>     bindings,
>     drm::{
>         self,
> +        device::{
> +            DeviceContext,
> +            Registered, //
> +        },
>         driver::{
>             AllocImpl,
>             AllocOps, //
> @@ -22,6 +26,7 @@
>     types::Opaque,
> };
> use core::{
> +    marker::PhantomData,
>     ops::Deref,
>     ptr::NonNull, //
> };
> @@ -36,7 +41,8 @@
> /// A type alias for retrieving the current [`AllocImpl`] for a given =
[`DriverObject`].
> ///
> /// [`Driver`]: drm::Driver
> -pub type DriverAllocImpl<T> =3D <<T as DriverObject>::Driver as =
drm::Driver>::Object;
> +pub type DriverAllocImpl<T, Ctx =3D Registered> =3D
> +    <<T as DriverObject>::Driver as drm::Driver>::Object<Ctx>;
>=20
> /// GEM object functions, which must be implemented by drivers.
> pub trait DriverObject: Sync + Send + Sized {
> @@ -44,7 +50,10 @@ pub trait DriverObject: Sync + Send + Sized {
>     type Driver: drm::Driver;
>=20
>     /// Create a new driver data object for a GEM object of a given =
size.
> -    fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl =
PinInit<Self, Error>;
> +    fn new<Ctx: DeviceContext>(
> +        dev: &drm::Device<Self::Driver, Ctx>,
> +        size: usize,
> +    ) -> impl PinInit<Self, Error>;
>=20
>     /// Open a new handle to an existing object, associated with a =
File.
>     fn open(_obj: &DriverAllocImpl<Self>, _file: &DriverFile<Self>) -> =
Result {
> @@ -78,9 +87,12 @@ extern "C" fn open_callback<T: DriverObject>(
>     // SAFETY: `open_callback` is only ever called with a valid =
pointer to a `struct drm_file`.
>     let file =3D unsafe { DriverFile::<T>::from_raw(raw_file) };
>=20
> -    // SAFETY: `open_callback` is specified in the AllocOps structure =
for `DriverObject<T>`,
> -    // ensuring that `raw_obj` is contained within a =
`DriverObject<T>`
> -    let obj =3D unsafe { <<T::Driver as drm::Driver>::Object as =
IntoGEMObject>::from_raw(raw_obj) };
> +    // SAFETY:
> +    // * `open_callback` is specified in the AllocOps structure for =
`DriverObject`, ensuring that
> +    //   `raw_obj` is contained within a `DriverAllocImpl<T>`
> +    // * It is only possible for `open_callback` to be called after =
device registration, ensuring
> +    //   that the object's device is in the `Registered` state.
> +    let obj: &DriverAllocImpl<T> =3D unsafe { =
IntoGEMObject::from_raw(raw_obj) };
>=20
>     match T::open(obj, file) {
>         Err(e) =3D> e.to_errno(),
> @@ -97,12 +109,12 @@ extern "C" fn close_callback<T: DriverObject>(
>=20
>     // SAFETY: `close_callback` is specified in the AllocOps structure =
for `Object<T>`, ensuring
>     // that `raw_obj` is indeed contained within a `Object<T>`.
> -    let obj =3D unsafe { <<T::Driver as drm::Driver>::Object as =
IntoGEMObject>::from_raw(raw_obj) };
> +    let obj: &DriverAllocImpl<T> =3D unsafe { =
IntoGEMObject::from_raw(raw_obj) };
>=20
>     T::close(obj, file);
> }
>=20
> -impl<T: DriverObject> IntoGEMObject for Object<T> {
> +impl<T: DriverObject, Ctx: DeviceContext> IntoGEMObject for Object<T, =
Ctx> {
>     fn as_raw(&self) -> *mut bindings::drm_gem_object {
>         self.obj.get()
>     }
> @@ -110,7 +122,7 @@ fn as_raw(&self) -> *mut bindings::drm_gem_object =
{
>     unsafe fn from_raw<'a>(self_ptr: *mut bindings::drm_gem_object) -> =
&'a Self {
>         // SAFETY: `obj` is guaranteed to be in an `Object<T>` via the =
safety contract of this
>         // function
> -        unsafe { &*crate::container_of!(Opaque::cast_from(self_ptr), =
Object<T>, obj) }
> +        unsafe { &*crate::container_of!(Opaque::cast_from(self_ptr), =
Object<T, Ctx>, obj) }
>     }
> }
>=20
> @@ -127,7 +139,7 @@ fn size(&self) -> usize {
>     fn create_handle<D, F>(&self, file: &drm::File<F>) -> Result<u32>
>     where
>         Self: AllocImpl<Driver =3D D>,
> -        D: drm::Driver<Object =3D Self, File =3D F>,
> +        D: drm::Driver<Object<Registered> =3D Self, File =3D F>,
>         F: drm::file::DriverFile<Driver =3D D>,
>     {
>         let mut handle: u32 =3D 0;
> @@ -142,7 +154,7 @@ fn create_handle<D, F>(&self, file: &drm::File<F>) =
-> Result<u32>
>     fn lookup_handle<D, F>(file: &drm::File<F>, handle: u32) -> =
Result<ARef<Self>>
>     where
>         Self: AllocImpl<Driver =3D D>,
> -        D: drm::Driver<Object =3D Self, File =3D F>,
> +        D: drm::Driver<Object<Registered> =3D Self, File =3D F>,
>         F: drm::file::DriverFile<Driver =3D D>,
>     {
>         // SAFETY: The arguments are all valid per the type =
invariants.
> @@ -182,16 +194,18 @@ impl<T: IntoGEMObject> BaseObject for T {}
> ///
> /// # Invariants
> ///
> -/// - `self.obj` is a valid instance of a `struct drm_gem_object`.
> +/// * `self.obj` is a valid instance of a `struct drm_gem_object`.
> +/// * Any type invariants of `Ctx` apply to the parent DRM device for =
this GEM object.
> #[repr(C)]
> #[pin_data]
> -pub struct Object<T: DriverObject + Send + Sync> {
> +pub struct Object<T: DriverObject + Send + Sync, Ctx: DeviceContext =3D=
 Registered> {
>     obj: Opaque<bindings::drm_gem_object>,
>     #[pin]
>     data: T,
> +    _ctx: PhantomData<Ctx>,
> }
>=20
> -impl<T: DriverObject> Object<T> {
> +impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
>     const OBJECT_FUNCS: bindings::drm_gem_object_funcs =3D =
bindings::drm_gem_object_funcs {
>         free: Some(Self::free_callback),
>         open: Some(open_callback::<T>),
> @@ -211,11 +225,12 @@ impl<T: DriverObject> Object<T> {
>     };
>=20
>     /// Create a new GEM object.
> -    pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> =
Result<ARef<Self>> {
> +    pub fn new(dev: &drm::Device<T::Driver, Ctx>, size: usize) -> =
Result<ARef<Self>> {
>         let obj: Pin<KBox<Self>> =3D KBox::pin_init(
>             try_pin_init!(Self {
>                 obj: Opaque::new(bindings::drm_gem_object::default()),
>                 data <- T::new(dev, size),
> +                _ctx: PhantomData,
>             }),
>             GFP_KERNEL,
>         )?;
> @@ -224,6 +239,8 @@ pub fn new(dev: &drm::Device<T::Driver>, size: =
usize) -> Result<ARef<Self>> {
>         unsafe { (*obj.as_raw()).funcs =3D &Self::OBJECT_FUNCS };
>=20
>         // SAFETY: The arguments are all valid per the type =
invariants.
> +        // INVARIANT: We use `dev` for creating the GEM object, which =
is known to be in state `Ctx` -
> +        // ensuring that the GEM object's pointer to the DRM device =
is always in the same state.

I=E2=80=99d rewrite this, i.e.: they are in the same state at this =
moment, because
upgrading the typestate in drm::Device will not carry over to the =
object.

>         to_result(unsafe { bindings::drm_gem_object_init(dev.as_raw(), =
obj.obj.get(), size) })?;
>=20
>         // SAFETY: We will never move out of `Self` as `ARef<Self>` is =
always treated as pinned.
> @@ -237,13 +254,15 @@ pub fn new(dev: &drm::Device<T::Driver>, size: =
usize) -> Result<ARef<Self>> {
>     }
>=20
>     /// Returns the `Device` that owns this GEM object.
> -    pub fn dev(&self) -> &drm::Device<T::Driver> {
> +    pub fn dev(&self) -> &drm::Device<T::Driver, Ctx> {
>         // SAFETY:
>         // - `struct drm_gem_object.dev` is initialized and valid for =
as long as the GEM
>         //   object lives.
>         // - The device we used for creating the gem object is passed =
as &drm::Device<T::Driver> to
>         //   Object::<T>::new(), so we know that `T::Driver` is the =
right generic parameter to use
>         //   here.
> +        // - Any type invariants of `Ctx` are upheld by using the =
same `Ctx` for the `Device` we
> +        //   return.
>         unsafe { drm::Device::from_raw((*self.as_raw()).dev) }
>     }
>=20
> @@ -269,7 +288,7 @@ extern "C" fn free_callback(obj: *mut =
bindings::drm_gem_object) {
> }
>=20
> // SAFETY: Instances of `Object<T>` are always reference-counted.
> -unsafe impl<T: DriverObject> crate::sync::aref::AlwaysRefCounted for =
Object<T> {
> +unsafe impl<T: DriverObject, Ctx: DeviceContext> AlwaysRefCounted for =
Object<T, Ctx> {
>     fn inc_ref(&self) {
>         // SAFETY: The existence of a shared reference guarantees that =
the refcount is non-zero.
>         unsafe { bindings::drm_gem_object_get(self.as_raw()) };
> @@ -284,9 +303,9 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
>     }
> }
>=20
> -impl<T: DriverObject> super::private::Sealed for Object<T> {}
> +impl<T: DriverObject, Ctx: DeviceContext> super::private::Sealed for =
Object<T, Ctx> {}
>=20
> -impl<T: DriverObject> Deref for Object<T> {
> +impl<T: DriverObject, Ctx: DeviceContext> Deref for Object<T, Ctx> {
>     type Target =3D T;
>=20
>     fn deref(&self) -> &Self::Target {
> @@ -294,7 +313,7 @@ fn deref(&self) -> &Self::Target {
>     }
> }
>=20
> -impl<T: DriverObject> AllocImpl for Object<T> {
> +impl<T: DriverObject, Ctx: DeviceContext> AllocImpl for Object<T, =
Ctx> {
>     type Driver =3D T::Driver;
>=20
>     const ALLOC_OPS: AllocOps =3D AllocOps {
> --=20
> 2.52.0
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

