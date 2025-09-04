Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0F2B43D79
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 15:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0286610EA47;
	Thu,  4 Sep 2025 13:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="EqDhF7bJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF7310EA44;
 Thu,  4 Sep 2025 13:43:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756993394; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EM5RoJlDfidcoH0iXxABuN7m3OYlKGT+wnqNJELtbqkq7Bqy7YpsWx5iTdIimV/o5iOi3eYqpRJ8vVnjSpQ4AM7AzRFoDztrgj7bebQQxtOEPD+K6RJUs1QnnY64OUtKxuWPM5UWftPyD33C7V7g67OGJh+IjrKF+Wea+sSpjO8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756993394;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=v/CGpSbTX1swAaII5MzvS161EteBjkwE/loRHMWcMrE=; 
 b=U3YK7nZm/bLjgDIxJubCTzRmhy5p13IsMKb0SruW0+Q5V//rs0TIDsyGg/FosfP0M8VZF0rWLsY+uKB88ujPhF0SRNXoPB0s/1jCFX1gU/fYMoKiXsEka0p01Cq+91pmNw5NW30d6TfXFOSs9IFIunaEIWBfCrf3Xf0QH0qrNCE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756993394; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=v/CGpSbTX1swAaII5MzvS161EteBjkwE/loRHMWcMrE=;
 b=EqDhF7bJLuQAElm1IsjDZdxHLUV9Jb4oCgW/HpVLvppQ+9QJnyzs7qNzq0oQkPdZ
 JNQ+tyjOgj5tB7VBcCmVWuUTRKRgsT1Kru3tliFQk4r1zAatMwCa7NwQgZw8OGu+t9s
 k4WRNWnpFFmYc/cWSE90dqPgclkYNAS4CAzUGeeE=
Received: by mx.zohomail.com with SMTPS id 1756993391488147.0851196413604;
 Thu, 4 Sep 2025 06:43:11 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 09/14] rust: gem: Introduce DriverObject::Args
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250829224116.477990-10-lyude@redhat.com>
Date: Thu, 4 Sep 2025 10:42:55 -0300
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
Message-Id: <91A174DE-B7A1-4F35-ADAB-39873B17A3D4@collabora.com>
References: <20250829224116.477990-1-lyude@redhat.com>
 <20250829224116.477990-10-lyude@redhat.com>
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



> On 29 Aug 2025, at 19:35, Lyude Paul <lyude@redhat.com> wrote:
>=20
> This is an associated type that may be used in order to specify a =
data-type
> to pass to gem objects when construction them, allowing for drivers to =
more

This doesn=E2=80=99t read very well IMHO.

> easily initialize their private-data for gem objects.

nit: I think that "private data" doesn=E2=80=99t need a hyphen?

>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> V3:
> * s/BaseDriverObject/DriverObject/
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> drivers/gpu/drm/nova/gem.rs |  5 ++-
> rust/kernel/drm/gem/mod.rs  | 75 +++++++++++++++++++++++++++++++++----
> 2 files changed, 71 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> index 10e3053f1a246..015cb56061a56 100644
> --- a/drivers/gpu/drm/nova/gem.rs
> +++ b/drivers/gpu/drm/nova/gem.rs
> @@ -19,8 +19,9 @@ pub(crate) struct NovaObject {}
> impl gem::DriverObject for NovaObject {
>     type Driver =3D NovaDriver;
>     type Object =3D gem::Object<Self>;
> +    type Args =3D ();
>=20
> -    fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, =
Error> {
> +    fn new(_dev: &NovaDevice, _size: usize, _args: Self::Args) -> =
impl PinInit<Self, Error> {
>         try_pin_init!(NovaObject {})
>     }
> }
> @@ -34,7 +35,7 @@ pub(crate) fn new(dev: &NovaDevice, size: usize) -> =
Result<ARef<gem::Object<Self
>             return Err(EINVAL);
>         }
>=20
> -        gem::Object::new(dev, aligned_size)
> +        gem::Object::new(dev, aligned_size, ())
>     }
>=20
>     /// Look up a GEM object handle for a `File` and return an =
`ObjectRef` for it.
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index f901d4263ee87..fe6ff3762a504 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -6,13 +6,14 @@
>=20
> use crate::{
>     alloc::flags::*,
> -    bindings, drm,
> +    bindings,
>     drm::driver::{AllocImpl, AllocOps},
> +    drm::{self, private::Sealed},
>     error::{to_result, Result},
>     prelude::*,
>     types::{ARef, AlwaysRefCounted, Opaque},
> };
> -use core::{ops::Deref, ptr::NonNull};
> +use core::{marker::PhantomData, ops::Deref, ptr::NonNull};
>=20
> /// A type alias for retrieving a [`Driver`]s [`DriverFile`] =
implementation from its
> /// [`DriverObject`] implementation.
> @@ -21,6 +22,26 @@
> /// [`DriverFile`]: drm::file::DriverFile
> pub type DriverFile<T> =3D drm::File<<<T as DriverObject>::Driver as =
drm::Driver>::File>;
>=20
> +/// A helper macro for implementing AsRef<OpaqueObject<=E2=80=A6>>
> +macro_rules! impl_as_opaque {
> +    ($type:ty where $tparam:ident : $tparam_trait:ident) =3D> {
> +        impl<D, $tparam> =
core::convert::AsRef<kernel::drm::gem::OpaqueObject<D>> for $type
> +        where
> +            D: kernel::drm::driver::Driver,
> +            Self: kernel::drm::gem::DriverObject<Driver =3D D>,
> +            Self: kernel::drm::gem::IntoGEMObject,
> +            $tparam: $tparam_trait,
> +        {
> +            fn as_ref(&self) -> &kernel::drm::gem::OpaqueObject<D> {
> +                // SAFETY: This cast is safe via our type invariant.
> +                unsafe { &*((self.as_raw().cast_const()).cast()) }
> +            }
> +        }
> +    };
> +}
> +
> +pub(crate) use impl_as_opaque;
> +
> /// GEM object functions, which must be implemented by drivers.
> pub trait DriverObject: Sync + Send + Sized {
>     /// Parent `Driver` for this object.
> @@ -29,8 +50,15 @@ pub trait DriverObject: Sync + Send + Sized {
>     /// The GEM object type that will be passed to various callbacks.
>     type Object: AllocImpl;
>=20
> +    /// The data type to use for passing arguments to =
[`BaseDriverObject::new`].
> +    type Args;
> +
>     /// Create a new driver data object for a GEM object of a given =
size.
> -    fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl =
PinInit<Self, Error>;
> +    fn new(
> +        dev: &drm::Device<Self::Driver>,
> +        size: usize,
> +        args: Self::Args,
> +    ) -> impl PinInit<Self, Error>;
>=20
>     /// Open a new handle to an existing object, associated with a =
File.
>     fn open(_obj: &Self::Object, _file: &DriverFile<Self>) -> Result {
> @@ -42,7 +70,7 @@ fn close(_obj: &Self::Object, _file: =
&DriverFile<Self>) {}
> }
>=20
> /// Trait that represents a GEM object subtype
> -pub trait IntoGEMObject: Sized + super::private::Sealed + =
AlwaysRefCounted {
> +pub trait IntoGEMObject: Sized + Sealed + AlwaysRefCounted {
>     /// Returns a reference to the raw `drm_gem_object` structure, =
which must be valid as long as
>     /// this owning object is valid.
>     fn as_raw(&self) -> *mut bindings::drm_gem_object;
> @@ -233,11 +261,11 @@ impl<T: DriverObject> Object<T> {
>     };
>=20
>     /// Create a new GEM object.
> -    pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> =
Result<ARef<Self>> {
> +    pub fn new(dev: &drm::Device<T::Driver>, size: usize, args: =
T::Args) -> Result<ARef<Self>> {
>         let obj: Pin<KBox<Self>> =3D KBox::pin_init(
>             try_pin_init!(Self {
>                 obj: Opaque::new(bindings::drm_gem_object::default()),
> -                data <- T::new(dev, size),
> +                data <- T::new(dev, size, args),
>                 // INVARIANT: The drm subsystem guarantees that the =
`struct drm_device` will live
>                 // as long as the GEM object lives.
>                 dev: dev.into(),
> @@ -289,7 +317,7 @@ extern "C" fn free_callback(obj: *mut =
bindings::drm_gem_object) {
>     }
> }
>=20
> -impl<T: DriverObject> super::private::Sealed for Object<T> {}
> +impl<T: DriverObject> Sealed for Object<T> {}
>=20
> impl<T: DriverObject> Deref for Object<T> {
>     type Target =3D T;
> @@ -313,6 +341,39 @@ impl<T: DriverObject> AllocImpl for Object<T> {
>     };
> }
>=20
> +impl_as_opaque!(Object<T> where T: DriverObject);
> +
> +/// A GEM object whose private-data layout is not known.
> +///
> +/// Not all GEM objects are created equal, and subsequently drivers =
may occasionally need to deal
> +/// with situations where they are working with a GEM object but have =
no knowledge of its
> +/// private-data layout.
> +///
> +/// It may be used just like a normal [`Object`], with the exception =
that it cannot access
> +/// driver-private data.
> +///
> +/// # Invariant
> +///
> +/// Via `#[repr(transparent)]`, this type is guaranteed to have an =
identical data layout to
> +/// `struct drm_gem_object`.
> +#[repr(transparent)]
> +pub struct OpaqueObject<T: =
drm::Driver>(Opaque<bindings::drm_gem_object>, PhantomData<T>);

I=E2=80=99m not sure whether this belongs in this patch.

I agree with the motivation, but where exactly is this used for now? I =
don't
see it being passed in a callback, for example. The only way to get one =
would
be through as_ref() IIUC, but who would call this and why?

> +
> +impl<T: drm::Driver> IntoGEMObject for OpaqueObject<T> {
> +    unsafe fn from_raw<'a>(self_ptr: *mut bindings::drm_gem_object) =
-> &'a Self {
> +        // SAFETY:
> +        // - This cast is safe via our type invariant.
> +        // - `self_ptr` is guaranteed to be a valid pointer to a gem =
object by our safety contract.
> +        unsafe { &*self_ptr.cast::<Self>().cast_const() }
> +    }
> +
> +    fn as_raw(&self) -> *mut bindings::drm_gem_object {
> +        self.0.get()
> +    }
> +}
> +
> +impl<D: drm::Driver> Sealed for OpaqueObject<D> {}
> +
> pub(super) const fn create_fops() -> bindings::file_operations {
>     // SAFETY: As by the type invariant, it is safe to initialize =
`bindings::file_operations`
>     // zeroed.
> --=20
> 2.50.0
>=20

