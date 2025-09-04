Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF96B43C14
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 14:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6BD10EA1D;
	Thu,  4 Sep 2025 12:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="LF/mHckQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B3D10E24A;
 Thu,  4 Sep 2025 12:52:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756990319; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kNwweftCdsYYW2NBJCaQsWb4UkBVa5bU0hmU/LiNdP7ZsGrCGoiwq6qJwHn4PUzuZNV0VC4++iilge29IltjBuljI1t21pJFW9YNEMoNULFuKbPaLRgl44wGW5Jk/nxgEOoNfRbxSIhZ4NMYaRZtJRLPD9tPAgiZg4Fd5zqP5sY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756990319;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=LS+WHaA6mqYgA1Bato0TNTAkG5Ennz86of9TLR85Mk0=; 
 b=mt7tdbNsL0S7mTd+5eQZAW/dIjT1eVRJglLgN2M2Z8H1OgumKXwemPNPZBTB29LeCpKxFA5FFCaRA3aop3R7WhO1bMCCAkK3NkK9XnsRcg5F/eBClw4tvJPBvMwxNDxngSuL6u6ysf5pxV6sF7yFHBNm2Ps9ldJixJ68wEGxscQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756990319; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=LS+WHaA6mqYgA1Bato0TNTAkG5Ennz86of9TLR85Mk0=;
 b=LF/mHckQA+m+dSjpj5Iye1LGHmScXT0NdGuMNbveAL+4ZXItfRs3CmVyoCdWtYov
 oJMiQMv1iAFKEfeJ8pZ7tn1VYNFE68yZ5Mqpm8Ch7wEKvc+Joa++ZtxGT1ty2R3NgPm
 j4I9itq1YgCoG4/jXWjLcp/PPv0AyYHS5NMXoAnc=
Received: by mx.zohomail.com with SMTPS id 1756990318302309.3482528512816;
 Thu, 4 Sep 2025 05:51:58 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 04/14] rust: drm: gem: Support driver-private GEM
 object types
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250829224116.477990-5-lyude@redhat.com>
Date: Thu, 4 Sep 2025 09:51:41 -0300
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
Message-Id: <856327A4-2D29-4340-984E-97E2002CCAE8@collabora.com>
References: <20250829224116.477990-1-lyude@redhat.com>
 <20250829224116.477990-5-lyude@redhat.com>
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
> One of the original intents with the gem bindings was that drivers =
could
> specify additional gem implementations, in order to enable for driver
> private gem objects. This wasn't really possible however, as up until =
now
> our GEM bindings have always assumed that the only GEM object we would =
run
> into was driver::Driver::Object - meaning that implementing another =
GEM
> object type would result in all of the BaseDriverObject callbacks =
assuming
> the wrong type.
>=20
> This is a pretty easy fix though, all we need to do is specify a
> BaseDriverObject in driver::Driver instead of an AllocImpl, and then =
add an
> associated type for AllocImpl in BaseDriverObject. That way each
> BaseDriverObject has its own AllocImpl allowing it to know which type =
to
> provide in BaseDriverObject callbacks, and driver::Driver can simply =
go
> through the BaseDriverObject to its AllocImpl type in order to get =
access
> to ALLOC_OPS.
>=20
> So, let's do this and update Nova for these changes.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> V4:
> * Update trait bounds. This looks gnarlier then it is:
>=20
>    Self: AllocImpl<Driver =3D D>, <-- Get the driver for this GEM =
object
>    D: drm::Driver<Object =3D O, File =3D F>, <-- Get the driver's =
Object, File
>                                              impl
>    F: drm::file::DriverFile,
>    O: BaseDriverObject<Object =3D Self>, <-- Make sure we're the =
driver's
>                                            main GEM object impl.
>  (don't worry, the compiler can always figure out what D, F, O are)
> * Also, rename the commit. I realized I should be clearer about what =
this
>  does so people can stop me if this isn't what was meant by private =
gem
>  object implementations :).
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> drivers/gpu/drm/nova/driver.rs |  8 ++++++--
> drivers/gpu/drm/nova/gem.rs    |  1 +
> rust/kernel/drm/device.rs      | 17 ++++++++++-------
> rust/kernel/drm/driver.rs      |  2 +-
> rust/kernel/drm/gem/mod.rs     | 21 +++++++++++++--------
> 5 files changed, 31 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nova/driver.rs =
b/drivers/gpu/drm/nova/driver.rs
> index 91b7380f83ab4..4c252426056c5 100644
> --- a/drivers/gpu/drm/nova/driver.rs
> +++ b/drivers/gpu/drm/nova/driver.rs
> @@ -1,7 +1,11 @@
> // SPDX-License-Identifier: GPL-2.0
>=20
> use kernel::{
> -    auxiliary, c_str, device::Core, drm, drm::gem, drm::ioctl, =
prelude::*, sync::aref::ARef,
> +    auxiliary, c_str,
> +    device::Core,
> +    drm::{self, gem, ioctl},
> +    prelude::*,
> +    types::ARef,
> };
>=20
> use crate::file::File;
> @@ -59,7 +63,7 @@ fn probe(adev: &auxiliary::Device<Core>, _info: =
&Self::IdInfo) -> Result<Pin<KBo
> impl drm::Driver for NovaDriver {
>     type Data =3D NovaData;
>     type File =3D File;
> -    type Object =3D gem::Object<NovaObject>;
> +    type Object =3D NovaObject;
>=20
>     const INFO: drm::DriverInfo =3D INFO;
>=20
> diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> index 2760ba4f3450b..10e3053f1a246 100644
> --- a/drivers/gpu/drm/nova/gem.rs
> +++ b/drivers/gpu/drm/nova/gem.rs
> @@ -18,6 +18,7 @@ pub(crate) struct NovaObject {}
>=20
> impl gem::DriverObject for NovaObject {
>     type Driver =3D NovaDriver;
> +    type Object =3D gem::Object<Self>;
>=20
>     fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, =
Error> {
>         try_pin_init!(NovaObject {})
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 3bb7c83966cf2..16cf6cb53d9a7 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -60,6 +60,9 @@ pub struct Device<T: drm::Driver> {
>     data: T::Data,
> }
>=20
> +/// A type alias for referring to the [`AllocImpl`] implementation =
for a DRM driver.
> +type DriverAllocImpl<T> =3D <<T as drm::Driver>::Object as =
drm::gem::DriverObject>::Object;
> +
> impl<T: drm::Driver> Device<T> {
>     const VTABLE: bindings::drm_driver =3D drm_legacy_fields! {
>         load: None,
> @@ -70,13 +73,13 @@ impl<T: drm::Driver> Device<T> {
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
> +        gem_create_object: =
DriverAllocImpl::<T>::ALLOC_OPS.gem_create_object,
> +        prime_handle_to_fd: =
DriverAllocImpl::<T>::ALLOC_OPS.prime_handle_to_fd,
> +        prime_fd_to_handle: =
DriverAllocImpl::<T>::ALLOC_OPS.prime_fd_to_handle,
> +        gem_prime_import: =
DriverAllocImpl::<T>::ALLOC_OPS.gem_prime_import,
> +        gem_prime_import_sg_table: =
DriverAllocImpl::<T>::ALLOC_OPS.gem_prime_import_sg_table,
> +        dumb_create: DriverAllocImpl::<T>::ALLOC_OPS.dumb_create,
> +        dumb_map_offset: =
DriverAllocImpl::<T>::ALLOC_OPS.dumb_map_offset,

There are now possibly infinitely many ALLOC_OPS. Is it a problem that
we=E2=80=99re choosing a particular one here?

>         show_fdinfo: None,
>         fbdev_probe: None,
>=20
> diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
> index dae0f4d1bbe3c..2500a61f45a6a 100644
> --- a/rust/kernel/drm/driver.rs
> +++ b/rust/kernel/drm/driver.rs
> @@ -103,7 +103,7 @@ pub trait Driver {
>     type Data: Sync + Send;
>=20
>     /// The type used to manage memory for this driver.
> -    type Object: AllocImpl;
> +    type Object: drm::gem::DriverObject;
>=20
>     /// The type used to represent a DRM File (client)
>     type File: drm::file::DriverFile;
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index b27b9fbf28bbb..ec36cd9ea69ed 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -26,16 +26,19 @@ pub trait DriverObject: Sync + Send + Sized {
>     /// Parent `Driver` for this object.
>     type Driver: drm::Driver;
>=20
> +    /// The GEM object type that will be passed to various callbacks.
> +    type Object: AllocImpl;
> +
>     /// Create a new driver data object for a GEM object of a given =
size.
>     fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl =
PinInit<Self, Error>;
>=20
>     /// Open a new handle to an existing object, associated with a =
File.
> -    fn open(_obj: &<Self::Driver as drm::Driver>::Object, _file: =
&DriverFile<Self>) -> Result {
> +    fn open(_obj: &Self::Object, _file: &DriverFile<Self>) -> Result =
{
>         Ok(())
>     }
>=20
>     /// Close a handle to an existing object, associated with a File.
> -    fn close(_obj: &<Self::Driver as drm::Driver>::Object, _file: =
&DriverFile<Self>) {}
> +    fn close(_obj: &Self::Object, _file: &DriverFile<Self>) {}
> }
>=20
> /// Trait that represents a GEM object subtype
> @@ -83,7 +86,7 @@ extern "C" fn open_callback<T: DriverObject>(
>=20
>     // SAFETY: `open_callback` is specified in the AllocOps structure =
for `DriverObject<T>`,
>     // ensuring that `raw_obj` is contained within a `DriverObject<T>`
> -    let obj =3D unsafe { <<T::Driver as drm::Driver>::Object as =
IntoGEMObject>::from_raw(raw_obj) };
> +    let obj =3D unsafe { T::Object::from_raw(raw_obj) };
>=20
>     match T::open(obj, file) {
>         Err(e) =3D> e.to_errno(),
> @@ -100,7 +103,7 @@ extern "C" fn close_callback<T: DriverObject>(
>=20
>     // SAFETY: `close_callback` is specified in the AllocOps structure =
for `Object<T>`, ensuring
>     // that `raw_obj` is indeed contained within a `Object<T>`.
> -    let obj =3D unsafe { <<T::Driver as drm::Driver>::Object as =
IntoGEMObject>::from_raw(raw_obj) };
> +    let obj =3D unsafe { T::Object::from_raw(raw_obj) };
>=20
>     T::close(obj, file);
> }
> @@ -127,11 +130,12 @@ fn size(&self) -> usize {
>=20
>     /// Creates a new handle for the object associated with a given =
`File`
>     /// (or returns an existing one).
> -    fn create_handle<D, F>(&self, file: &drm::File<F>) -> Result<u32>
> +    fn create_handle<D, F, O>(&self, file: &drm::File<F>) -> =
Result<u32>
>     where
>         Self: AllocImpl<Driver =3D D>,
> -        D: drm::Driver<Object =3D Self, File =3D F>,
> +        D: drm::Driver<Object =3D O, File =3D F>,
>         F: drm::file::DriverFile,
> +        O: DriverObject<Object =3D Self>,
>     {
>         let mut handle: u32 =3D 0;
>         // SAFETY: The arguments are all valid per the type =
invariants.
> @@ -142,11 +146,12 @@ fn create_handle<D, F>(&self, file: =
&drm::File<F>) -> Result<u32>
>     }
>=20
>     /// Looks up an object by its handle for a given `File`.
> -    fn lookup_handle<D, F>(file: &drm::File<F>, handle: u32) -> =
Result<ARef<Self>>
> +    fn lookup_handle<D, F, O>(file: &drm::File<F>, handle: u32) -> =
Result<ARef<Self>>
>     where
>         Self: AllocImpl<Driver =3D D>,
> -        D: drm::Driver<Object =3D Self, File =3D F>,
> +        D: drm::Driver<Object =3D O, File =3D F>,
>         F: drm::file::DriverFile,
> +        O: DriverObject<Object =3D Self>,
>     {
>         // SAFETY: The arguments are all valid per the type =
invariants.
>         let ptr =3D unsafe { =
bindings::drm_gem_object_lookup(file.as_raw().cast(), handle) };
> --=20
> 2.50.0
>=20

