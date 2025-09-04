Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5891CB43B38
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 14:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9003510EA10;
	Thu,  4 Sep 2025 12:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="jMMy9td9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D6110EA10;
 Thu,  4 Sep 2025 12:12:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756987933; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TvKirX4c74x7jqN1tg6isOyPPEnZPs+fy4zd55xvA2Kog/pOh5jVY0IcNm9uvILjpgYC/MaPYRGnKJmj6emAOPNvfL6poMD5v2dfWX/9qzmd0ehQ9uSM3qC+f+60JaSmFHkv/tLJ/rpoTSizkvC4oMCVXcw1DHVZdmp2Qhcg0LA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756987933;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Kg+imjEAl3CXmIfEbHlp4v245YFguRUUK5TRAGFXJso=; 
 b=dzP89dQ+z49VzlwEan2/Yl6RWm+w2nhq3AinO5RmzyLWd2Ev4fXVrVwJRSctuJrHnVmSYy1lXZWe3w051TJ2xg1lugn/OrukxfXwJmtVmnTPKZ3cCfv2q8k2DptnOCrkh984LLdEdTMfvZIv0Kysj3Nh0fo0U/BGqaJ+WrZCZLo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756987933; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=Kg+imjEAl3CXmIfEbHlp4v245YFguRUUK5TRAGFXJso=;
 b=jMMy9td9dP/h8xOOi6g/kSvcUIBDwA2A4iqcDR8bGLQRHpUv3G2kd2ywqfhKg/GL
 UsoBC55q5otWRoNIjhW+guh3cuuc0GLY6Bwz4q4cQfdDWlKY9gRKt5L13DD6cyhmjuf
 B/unwPc5DkYdxBlEBcWaQTAUDGhe2V4kPBdaidww=
Received: by mx.zohomail.com with SMTPS id 1756987929589959.508568434057;
 Thu, 4 Sep 2025 05:12:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 01/14] rust: drm: gem: Simplify use of generics
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250829224116.477990-2-lyude@redhat.com>
Date: Thu, 4 Sep 2025 09:11:51 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Asahi Lina <lina+kernel@asahilina.net>,
 "open list:DRM DRIVER FOR NVIDIA GPUS [RUST]" <nouveau@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <662189D6-44B2-4880-971D-A3D2D748542D@collabora.com>
References: <20250829224116.477990-1-lyude@redhat.com>
 <20250829224116.477990-2-lyude@redhat.com>
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

Hi Lyude,

> On 29 Aug 2025, at 19:35, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Now that my rust skills have been honed, I noticed that there's a lot =
of
> generics in our gem bindings that don't actually need to be here. =
Currently
> the hierarchy of traits in our gem bindings looks like this:
>=20
>  * Drivers implement:
>    * BaseDriverObject<T: DriverObject> (has the callbacks)
>    * DriverObject (has the drm::Driver type)
>  * Crate implements:
>    * IntoGEMObject for Object<T> where T: DriverObject
>      Handles conversion to/from raw object pointers
>    * BaseObject for T where T: IntoGEMObject
>      Provides methods common to all gem interfaces
>=20
>  Also of note, this leaves us with two different drm::Driver =
associated
>  types:
>    * DriverObject::Driver
>    * IntoGEMObject::Driver
>=20
> I'm not entirely sure of the original intent here unfortunately (if =
anyone
> is, please let me know!), but my guess is that the idea would be that =
some
> objects can implement IntoGEMObject using a different ::Driver than
> DriverObject - presumably to enable the usage of gem objects from =
different
> drivers. A reasonable usecase of course.
>=20
> However - if I'm not mistaken, I don't think that this is actually how
> things would go in practice. Driver implementations are of course
> implemented by their associated drivers, and generally drivers are not
> linked to each-other when building the kernel. Which is to say that =
even in
> a situation where we would theoretically deal with gem objects from =
another
> driver, we still wouldn't have access to its drm::driver::Driver
> implementation. It's more likely we would simply want a variant of gem
> objects in such a situation that have no association with a
> drm::driver::Driver type.
>=20
> Taking that into consideration, we can assume the following:
> * Anything that implements BaseDriverObject will implement =
DriverObject
>  In other words, all BaseDriverObjects indirectly have an associated
>  ::Driver type - so the two traits can be combined into one with no
>  generics.
> * Not everything that implements IntoGEMObject will have an associated
>  ::Driver, and that's OK.
>=20
> And with this, we now can do quite a bit of cleanup with the use of
> generics here. As such, this commit:
>=20
> * Removes the generics on BaseDriverObject
> * Moves DriverObject::Driver into BaseDriverObject
> * Removes DriverObject
> * Removes IntoGEMObject::Driver
> * Add AllocImpl::Driver, which we can use as a binding to figure out =
the
>  correct File type for BaseObject
>=20
> Leaving us with a simpler trait hierarchy that now looks like this:
>=20
>  * Drivers implement: BaseDriverObject
>  * Crate implements:
>    * IntoGEMObject for Object<T> where T: DriverObject
>    * BaseObject for T where T: IntoGEMObject
>=20
> Which makes the code a lot easier to understand and build on :).
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> V2:
> * Don't refer to Object<T> in callbacks, as this would result in =
drivers
>  getting the wrong gem object type for shmem gem objects once we add
>  support for those. Instead, we'll just add a type alias to clean this
>  part up.
> V3:
> * Fix nova compilation
> * Also, add an associated driver type to AllocImpl - as we still need =
the
>  current driver accessible from BaseObject so that we can use the =
driver's
>  various associated types, like File
> V4:
> * Add missing Object =3D Self constraint to type bounds for =
create_handle,
>  lookup_handle. I forgot that if drivers can have private gem objects =
with
>  a different data layout, we can only guarantee gem objects with =
handles
>  are of the same gem object type as the main one in use by the driver.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> drivers/gpu/drm/nova/gem.rs |  8 ++--
> rust/kernel/drm/driver.rs   |  3 ++
> rust/kernel/drm/gem/mod.rs  | 77 ++++++++++++++++---------------------
> 3 files changed, 40 insertions(+), 48 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> index cd82773dab92c..2760ba4f3450b 100644
> --- a/drivers/gpu/drm/nova/gem.rs
> +++ b/drivers/gpu/drm/nova/gem.rs
> @@ -16,16 +16,14 @@
> #[pin_data]
> pub(crate) struct NovaObject {}
>=20
> -impl gem::BaseDriverObject<gem::Object<NovaObject>> for NovaObject {
> +impl gem::DriverObject for NovaObject {
> +    type Driver =3D NovaDriver;
> +
>     fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, =
Error> {
>         try_pin_init!(NovaObject {})
>     }
> }
>=20
> -impl gem::DriverObject for NovaObject {
> -    type Driver =3D NovaDriver;
> -}
> -
> impl NovaObject {
>     /// Create a new DRM GEM object.
>     pub(crate) fn new(dev: &NovaDevice, size: usize) -> =
Result<ARef<gem::Object<Self>>> {
> diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
> index fe7e8d06961aa..dae0f4d1bbe3c 100644
> --- a/rust/kernel/drm/driver.rs
> +++ b/rust/kernel/drm/driver.rs
> @@ -86,6 +86,9 @@ pub struct AllocOps {
>=20
> /// Trait for memory manager implementations. Implemented internally.
> pub trait AllocImpl: super::private::Sealed + drm::gem::IntoGEMObject =
{
> +    /// The [`Driver`] implementation for this [`AllocImpl`].
> +    type Driver: drm::Driver;
> +
>     /// The C callback operations for this memory manager.
>     const ALLOC_OPS: AllocOps;
> }
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index b71821cfb5eaa..31c5799d995c5 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -15,31 +15,31 @@
> use core::{mem, ops::Deref, ptr::NonNull};
>=20
> /// GEM object functions, which must be implemented by drivers.
> -pub trait BaseDriverObject<T: BaseObject>: Sync + Send + Sized {
> +pub trait DriverObject: Sync + Send + Sized {
> +    /// Parent `Driver` for this object.
> +    type Driver: drm::Driver;
> +
>     /// Create a new driver data object for a GEM object of a given =
size.
> -    fn new(dev: &drm::Device<T::Driver>, size: usize) -> impl =
PinInit<Self, Error>;
> +    fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl =
PinInit<Self, Error>;
>=20
>     /// Open a new handle to an existing object, associated with a =
File.
>     fn open(
> -        _obj: &<<T as IntoGEMObject>::Driver as drm::Driver>::Object,
> -        _file: &drm::File<<<T as IntoGEMObject>::Driver as =
drm::Driver>::File>,
> +        _obj: &<Self::Driver as drm::Driver>::Object,
> +        _file: &drm::File<<Self::Driver as drm::Driver>::File>,
>     ) -> Result {
>         Ok(())
>     }
>=20
>     /// Close a handle to an existing object, associated with a File.
>     fn close(
> -        _obj: &<<T as IntoGEMObject>::Driver as drm::Driver>::Object,
> -        _file: &drm::File<<<T as IntoGEMObject>::Driver as =
drm::Driver>::File>,
> +        _obj: &<Self::Driver as drm::Driver>::Object,
> +        _file: &drm::File<<Self::Driver as drm::Driver>::File>,
>     ) {
>     }
> }
>=20
> /// Trait that represents a GEM object subtype
> pub trait IntoGEMObject: Sized + super::private::Sealed + =
AlwaysRefCounted {
> -    /// Owning driver for this type
> -    type Driver: drm::Driver;
> -
>     /// Returns a reference to the raw `drm_gem_object` structure, =
which must be valid as long as
>     /// this owning object is valid.
>     fn as_raw(&self) -> *mut bindings::drm_gem_object;
> @@ -74,25 +74,15 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
>     }
> }
>=20
> -/// Trait which must be implemented by drivers using base GEM =
objects.
> -pub trait DriverObject: BaseDriverObject<Object<Self>> {
> -    /// Parent `Driver` for this object.
> -    type Driver: drm::Driver;
> -}
> -
> -extern "C" fn open_callback<T: BaseDriverObject<U>, U: BaseObject>(
> +extern "C" fn open_callback<T: DriverObject>(
>     raw_obj: *mut bindings::drm_gem_object,
>     raw_file: *mut bindings::drm_file,
> ) -> core::ffi::c_int {
>     // SAFETY: `open_callback` is only ever called with a valid =
pointer to a `struct drm_file`.
> -    let file =3D unsafe {
> -        drm::File::<<<U as IntoGEMObject>::Driver as =
drm::Driver>::File>::from_raw(raw_file)
> -    };
> -    // SAFETY: `open_callback` is specified in the AllocOps structure =
for `Object<T>`, ensuring that
> -    // `raw_obj` is indeed contained within a `Object<T>`.
> -    let obj =3D unsafe {
> -        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as =
IntoGEMObject>::from_raw(raw_obj)
> -    };
> +    let file =3D unsafe { drm::File::<<T::Driver as =
drm::Driver>::File>::from_raw(raw_file) };
> +    // SAFETY: `open_callback` is specified in the AllocOps structure =
for `DriverObject<T>`,
> +    // ensuring that `raw_obj` is contained within a =
`DriverObject<T>`
> +    let obj =3D unsafe { <<T::Driver as drm::Driver>::Object as =
IntoGEMObject>::from_raw(raw_obj) };
>=20
>     match T::open(obj, file) {
>         Err(e) =3D> e.to_errno(),
> @@ -100,26 +90,21 @@ extern "C" fn open_callback<T: =
BaseDriverObject<U>, U: BaseObject>(
>     }
> }
>=20
> -extern "C" fn close_callback<T: BaseDriverObject<U>, U: BaseObject>(
> +extern "C" fn close_callback<T: DriverObject>(
>     raw_obj: *mut bindings::drm_gem_object,
>     raw_file: *mut bindings::drm_file,
> ) {
>     // SAFETY: `open_callback` is only ever called with a valid =
pointer to a `struct drm_file`.
> -    let file =3D unsafe {
> -        drm::File::<<<U as IntoGEMObject>::Driver as =
drm::Driver>::File>::from_raw(raw_file)
> -    };
> +    let file =3D unsafe { drm::File::<<T::Driver as =
drm::Driver>::File>::from_raw(raw_file) };
> +
>     // SAFETY: `close_callback` is specified in the AllocOps structure =
for `Object<T>`, ensuring
>     // that `raw_obj` is indeed contained within a `Object<T>`.
> -    let obj =3D unsafe {
> -        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as =
IntoGEMObject>::from_raw(raw_obj)
> -    };
> +    let obj =3D unsafe { <<T::Driver as drm::Driver>::Object as =
IntoGEMObject>::from_raw(raw_obj) };
>=20
>     T::close(obj, file);
> }
>=20
> impl<T: DriverObject> IntoGEMObject for Object<T> {
> -    type Driver =3D T::Driver;
> -
>     fn as_raw(&self) -> *mut bindings::drm_gem_object {
>         self.obj.get()
>     }
> @@ -141,10 +126,12 @@ fn size(&self) -> usize {
>=20
>     /// Creates a new handle for the object associated with a given =
`File`
>     /// (or returns an existing one).
> -    fn create_handle(
> -        &self,
> -        file: &drm::File<<<Self as IntoGEMObject>::Driver as =
drm::Driver>::File>,
> -    ) -> Result<u32> {
> +    fn create_handle<D, F>(&self, file: &drm::File<F>) -> Result<u32>
> +    where
> +        Self: AllocImpl<Driver =3D D>,
> +        D: drm::Driver<Object =3D Self, File =3D F>,
> +        F: drm::file::DriverFile,

Shouldn=E2=80=99t this be F: drm::file::DriverFile<Driver =3DD>?

As you said in the commit message, I don=E2=80=99t see where exactly we =
would have
two competing drm::Driver types when calling this function, but we =
should
perhaps enforce this bound anyways.

> +    {
>         let mut handle: u32 =3D 0;
>         // SAFETY: The arguments are all valid per the type =
invariants.
>         to_result(unsafe {
> @@ -154,10 +141,12 @@ fn create_handle(
>     }
>=20
>     /// Looks up an object by its handle for a given `File`.
> -    fn lookup_handle(
> -        file: &drm::File<<<Self as IntoGEMObject>::Driver as =
drm::Driver>::File>,
> -        handle: u32,
> -    ) -> Result<ARef<Self>> {
> +    fn lookup_handle<D, F>(file: &drm::File<F>, handle: u32) -> =
Result<ARef<Self>>
> +    where
> +        Self: AllocImpl<Driver =3D D>,
> +        D: drm::Driver<Object =3D Self, File =3D F>,
> +        F: drm::file::DriverFile,

Same here?

> +    {
>         // SAFETY: The arguments are all valid per the type =
invariants.
>         let ptr =3D unsafe { =
bindings::drm_gem_object_lookup(file.as_raw().cast(), handle) };
>         if ptr.is_null() {
> @@ -212,8 +201,8 @@ impl<T: DriverObject> Object<T> {
>=20
>     const OBJECT_FUNCS: bindings::drm_gem_object_funcs =3D =
bindings::drm_gem_object_funcs {
>         free: Some(Self::free_callback),
> -        open: Some(open_callback::<T, Object<T>>),
> -        close: Some(close_callback::<T, Object<T>>),
> +        open: Some(open_callback::<T>),
> +        close: Some(close_callback::<T>),
>         print_info: None,
>         export: None,
>         pin: None,
> @@ -296,6 +285,8 @@ fn deref(&self) -> &Self::Target {
> }
>=20
> impl<T: DriverObject> AllocImpl for Object<T> {
> +    type Driver =3D T::Driver;
> +
>     const ALLOC_OPS: AllocOps =3D AllocOps {
>         gem_create_object: None,
>         prime_handle_to_fd: None,
> --=20
> 2.50.0
>=20

With the DriverFile comment sorted out:

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
