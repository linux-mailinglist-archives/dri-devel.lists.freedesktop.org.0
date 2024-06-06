Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5918FF0A5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 17:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154D310E99B;
	Thu,  6 Jun 2024 15:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Zt3Afebb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E22E10E9AF;
 Thu,  6 Jun 2024 15:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717687600;
 bh=V4bgInjXOWQUJlXaJjeamx+ykLHLx/l3xHE6UC4UOo0=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=Zt3AfebbxW3T1MfwZLEIKIv8rLxuFHUdbglD3qY42QyhH84h8jMiDHDpnHPGLx5lR
 gezWRvulNkk7Al2zJcHq1+SXsUvt4LLLWcCqnoB+4qZK+8tvRO0BMCb8jrOSEqdKIk
 t2kQbYDmQ/7qPwaM89Tk/SA/QmDhdFSM1blMN6DUBSuiV9CVRkdnkFIAmAf8l0UV6u
 IdSLLbXrEZqpBzNDWKx4D0f1i3yQAei9fX5wXanik9BKghkqcXq47BhBWuyPLzVlmC
 aNshKHEF3caiELLu8zsfeT/B33M281GUhfklVGORWIlU2Kok7mhVZO8iEWclyjUXKr
 +DpnDGbTwGVdg==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 290EE37821C1;
 Thu,  6 Jun 2024 15:26:32 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [RFC PATCH 6/8] rust: drm: gem: Add GEM object abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240520172422.181763-3-dakr@redhat.com>
Date: Thu, 6 Jun 2024 12:26:20 -0300
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, Daniel Vetter <daniel@ffwll.ch>, ojeda@kernel.org,
 alex.gaynor@gmail.com, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, fujita.tomonori@gmail.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9054B5B3-D117-4FD5-A050-7E32AE6452F1@collabora.com>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172422.181763-3-dakr@redhat.com>
To: Danilo Krummrich <dakr@redhat.com>
X-Mailer: Apple Mail (2.3774.600.62)
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

Hi Danilo, Lina


> On 20 May 2024, at 14:24, Danilo Krummrich <dakr@redhat.com> wrote:
>=20
> From: Asahi Lina <lina@asahilina.net>
>=20
> The DRM GEM subsystem is the DRM memory management subsystem used by
> most modern drivers. Add a Rust abstraction to allow Rust DRM driver
> implementations to use it.
>=20
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Co-developed-by: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
> rust/bindings/bindings_helper.h |   1 +
> rust/helpers.c                  |  23 ++
> rust/kernel/drm/drv.rs          |   4 +-
> rust/kernel/drm/gem/mod.rs      | 406 ++++++++++++++++++++++++++++++++
> rust/kernel/drm/mod.rs          |   1 +
> 5 files changed, 433 insertions(+), 2 deletions(-)
> create mode 100644 rust/kernel/drm/gem/mod.rs
>=20
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index c591811ccb67..b245db8d5a87 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -9,6 +9,7 @@
> #include <drm/drm_device.h>
> #include <drm/drm_drv.h>
> #include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> #include <drm/drm_ioctl.h>
> #include <kunit/test.h>
> #include <linux/errname.h>
> diff --git a/rust/helpers.c b/rust/helpers.c
> index dc2405772b1a..30e86bf00337 100644
> --- a/rust/helpers.c
> +++ b/rust/helpers.c
> @@ -20,6 +20,7 @@
>  * Sorted alphabetically.
>  */
>=20
> +#include <drm/drm_gem.h>
> #include <kunit/test-bug.h>
> #include <linux/bug.h>
> #include <linux/build_bug.h>
> @@ -302,6 +303,28 @@ u64 rust_helper_pci_resource_len(struct pci_dev =
*pdev, int barnr)
> return pci_resource_len(pdev, barnr);
> }
>=20
> +#ifdef CONFIG_DRM
> +
> +void rust_helper_drm_gem_object_get(struct drm_gem_object *obj)
> +{
> + drm_gem_object_get(obj);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_drm_gem_object_get);
> +
> +void rust_helper_drm_gem_object_put(struct drm_gem_object *obj)
> +{
> + drm_gem_object_put(obj);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_drm_gem_object_put);
> +
> +__u64 rust_helper_drm_vma_node_offset_addr(struct drm_vma_offset_node =
*node)
> +{
> + return drm_vma_node_offset_addr(node);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_drm_vma_node_offset_addr);
> +
> +#endif
> +
> /*
>  * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we =
can
>  * use it in contexts where Rust expects a `usize` like slice (array) =
indices.
> diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> index c5a63663ea21..063b420f57e5 100644
> --- a/rust/kernel/drm/drv.rs
> +++ b/rust/kernel/drm/drv.rs
> @@ -113,7 +113,7 @@ pub struct AllocOps {
> }
>=20
> /// Trait for memory manager implementations. Implemented internally.
> -pub trait AllocImpl: Sealed {
> +pub trait AllocImpl: Sealed + drm::gem::IntoGEMObject {
>     /// The C callback operations for this memory manager.
>     const ALLOC_OPS: AllocOps;
> }
> @@ -243,7 +243,7 @@ pub fn new(parent: &device::Device) -> =
Result<Self> {
>             drm: drm::device::Device::new(parent, &vtable)?,
>             registered: false,
>             vtable,
> -            fops: Default::default(), // TODO: GEM abstraction
> +            fops: drm::gem::create_fops(),
>             _pin: PhantomPinned,
>             _p: PhantomData,
>         })
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> new file mode 100644
> index 000000000000..4cd85d5f1df8
> --- /dev/null
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -0,0 +1,406 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM GEM API
> +//!
> +//! C header: =
[`include/linux/drm/drm_gem.h`](../../../../include/linux/drm/drm_gem.h)
> +
> +use alloc::boxed::Box;
> +
> +use crate::{
> +    alloc::flags::*,
> +    bindings,
> +    drm::{device, drv, file},
> +    error::{to_result, Result},
> +    prelude::*,
> +};
> +use core::{marker::PhantomPinned, mem, ops::Deref, ops::DerefMut};
> +
> +/// GEM object functions, which must be implemented by drivers.
> +pub trait BaseDriverObject<T: BaseObject>: Sync + Send + Sized {
> +    /// Create a new driver data object for a GEM object of a given =
size.
> +    fn new(dev: &device::Device<T::Driver>, size: usize) -> impl =
PinInit<Self, Error>;
> +
> +    /// Open a new handle to an existing object, associated with a =
File.
> +    fn open(
> +        _obj: &<<T as IntoGEMObject>::Driver as drv::Driver>::Object,
> +        _file: &file::File<<<T as IntoGEMObject>::Driver as =
drv::Driver>::File>,

I wonder if these can be put into a type alias? As in,

type File<T: IntoGEMObject> =3D file::File<<<T as IntoGEMObject>::Driver =
as drv::Driver>::File>;

etc

That would clean things up a bit.

> +    ) -> Result {
> +        Ok(())
> +    }
> +
> +    /// Close a handle to an existing object, associated with a File.
> +    fn close(
> +        _obj: &<<T as IntoGEMObject>::Driver as drv::Driver>::Object,
> +        _file: &file::File<<<T as IntoGEMObject>::Driver as =
drv::Driver>::File>,
> +    ) {
> +    }
> +}
> +
> +/// Trait that represents a GEM object subtype
> +pub trait IntoGEMObject: Sized + crate::private::Sealed {
> +    /// Owning driver for this type
> +    type Driver: drv::Driver;
> +
> +    /// Returns a reference to the raw `drm_gem_object` structure, =
which must be valid as long as
> +    /// this owning object is valid.
> +    fn gem_obj(&self) -> &bindings::drm_gem_object;
> +
> +    /// Converts a pointer to a `drm_gem_object` into a pointer to =
this type.
> +    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Self;
> +}
> +
> +/// Trait which must be implemented by drivers using base GEM =
objects.
> +pub trait DriverObject: BaseDriverObject<Object<Self>> {
> +    /// Parent `Driver` for this object.
> +    type Driver: drv::Driver;
> +}
> +
> +unsafe extern "C" fn free_callback<T: DriverObject>(obj: *mut =
bindings::drm_gem_object) {
> +    // SAFETY: All of our objects are Object<T>.
> +    let this =3D unsafe { crate::container_of!(obj, Object<T>, obj) } =
as *mut Object<T>;
> +
> +    // SAFETY: The pointer we got has to be valid
> +    unsafe { bindings::drm_gem_object_release(obj) };
> +
> +    // SAFETY: All of our objects are allocated via Box<>, and we're =
in the
> +    // free callback which guarantees this object has zero remaining =
references,
> +    // so we can drop it
> +    unsafe {
> +        let _ =3D Box::from_raw(this);
> +    };
> +}
> +
> +unsafe extern "C" fn open_callback<T: BaseDriverObject<U>, U: =
BaseObject>(
> +    raw_obj: *mut bindings::drm_gem_object,
> +    raw_file: *mut bindings::drm_file,
> +) -> core::ffi::c_int {
> +    // SAFETY: The pointer we got has to be valid.
> +    let file =3D unsafe {
> +        file::File::<<<U as IntoGEMObject>::Driver as =
drv::Driver>::File>::from_raw(raw_file)
> +    };
> +    let obj =3D
> +        <<<U as IntoGEMObject>::Driver as drv::Driver>::Object as =
IntoGEMObject>::from_gem_obj(
> +            raw_obj,
> +        );
> +
> +    // SAFETY: from_gem_obj() returns a valid pointer as long as the =
type is
> +    // correct and the raw_obj we got is valid.
> +    match T::open(unsafe { &*obj }, &file) {
> +        Err(e) =3D> e.to_errno(),
> +        Ok(()) =3D> 0,
> +    }
> +}
> +
> +unsafe extern "C" fn close_callback<T: BaseDriverObject<U>, U: =
BaseObject>(
> +    raw_obj: *mut bindings::drm_gem_object,
> +    raw_file: *mut bindings::drm_file,
> +) {
> +    // SAFETY: The pointer we got has to be valid.
> +    let file =3D unsafe {
> +        file::File::<<<U as IntoGEMObject>::Driver as =
drv::Driver>::File>::from_raw(raw_file)
> +    };
> +    let obj =3D
> +        <<<U as IntoGEMObject>::Driver as drv::Driver>::Object as =
IntoGEMObject>::from_gem_obj(
> +            raw_obj,
> +        );
> +
> +    // SAFETY: from_gem_obj() returns a valid pointer as long as the =
type is
> +    // correct and the raw_obj we got is valid.
> +    T::close(unsafe { &*obj }, &file);
> +}
> +
> +impl<T: DriverObject> IntoGEMObject for Object<T> {
> +    type Driver =3D T::Driver;
> +
> +    fn gem_obj(&self) -> &bindings::drm_gem_object {
> +        &self.obj
> +    }
> +
> +    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut =
Object<T> {
> +        unsafe { crate::container_of!(obj, Object<T>, obj) as *mut =
Object<T> }
> +    }
> +}
> +
> +/// Base operations shared by all GEM object classes
> +pub trait BaseObject: IntoGEMObject {
> +    /// Returns the size of the object in bytes.
> +    fn size(&self) -> usize {
> +        self.gem_obj().size
> +    }
> +
> +    /// Creates a new reference to the object.
> +    fn reference(&self) -> ObjectRef<Self> {
> +        // SAFETY: Having a reference to an Object implies holding a =
GEM reference
> +        unsafe {
> +            bindings::drm_gem_object_get(self.gem_obj() as *const _ =
as *mut _);
> +        }
> +        ObjectRef {
> +            ptr: self as *const _,
> +        }
> +    }
> +
> +    /// Creates a new handle for the object associated with a given =
`File`
> +    /// (or returns an existing one).
> +    fn create_handle(
> +        &self,
> +        file: &file::File<<<Self as IntoGEMObject>::Driver as =
drv::Driver>::File>,
> +    ) -> Result<u32> {
> +        let mut handle: u32 =3D 0;
> +        // SAFETY: The arguments are all valid per the type =
invariants.
> +        to_result(unsafe {
> +            bindings::drm_gem_handle_create(
> +                file.raw() as *mut _,
> +                self.gem_obj() as *const _ as *mut _,
> +                &mut handle,
> +            )
> +        })?;
> +        Ok(handle)
> +    }
> +
> +    /// Looks up an object by its handle for a given `File`.
> +    fn lookup_handle(
> +        file: &file::File<<<Self as IntoGEMObject>::Driver as =
drv::Driver>::File>,
> +        handle: u32,
> +    ) -> Result<ObjectRef<Self>> {
> +        // SAFETY: The arguments are all valid per the type =
invariants.
> +        let ptr =3D unsafe { =
bindings::drm_gem_object_lookup(file.raw() as *mut _, handle) };
> +
> +        if ptr.is_null() {
> +            Err(ENOENT)
> +        } else {
> +            Ok(ObjectRef {
> +                ptr: ptr as *const _,
> +            })
> +        }
> +    }
> +
> +    /// Creates an mmap offset to map the object from userspace.
> +    fn create_mmap_offset(&self) -> Result<u64> {
> +        // SAFETY: The arguments are valid per the type invariant.
> +        to_result(unsafe {
> +            bindings::drm_gem_create_mmap_offset(self.gem_obj() as =
*const _ as *mut _)
> +        })?;
> +        Ok(unsafe {
> +            =
bindings::drm_vma_node_offset_addr(&self.gem_obj().vma_node as *const _ =
as *mut _)
> +        })
> +    }
> +}
> +
> +impl<T: IntoGEMObject> BaseObject for T {}
> +
> +/// A base GEM object.
> +#[repr(C)]
> +#[pin_data]
> +pub struct Object<T: DriverObject> {
> +    obj: bindings::drm_gem_object,
> +    // The DRM core ensures the Device exists as long as its objects =
exist, so we don't need to
> +    // manage the reference count here.
> +    dev: *const bindings::drm_device,
> +    #[pin]
> +    inner: T,
> +    #[pin]
> +    _p: PhantomPinned,
> +}

A bit minor, but why is PhantomPinned structurally pinned here?

Maybe Benno can also chime in, but, at a first glance, I do not see any =
reason for a marker type to be pinned.

> +
> +// SAFETY: This struct is safe to zero-initialize
> +unsafe impl init::Zeroable for bindings::drm_gem_object {}
> +
> +impl<T: DriverObject> Object<T> {
> +    /// The size of this object's structure.
> +    pub const SIZE: usize =3D mem::size_of::<Self>();
> +
> +    const OBJECT_FUNCS: bindings::drm_gem_object_funcs =3D =
bindings::drm_gem_object_funcs {
> +        free: Some(free_callback::<T>),
> +        open: Some(open_callback::<T, Object<T>>),
> +        close: Some(close_callback::<T, Object<T>>),
> +        print_info: None,
> +        export: None,
> +        pin: None,
> +        unpin: None,
> +        get_sg_table: None,
> +        vmap: None,
> +        vunmap: None,
> +        mmap: None,
> +        status: None,
> +        vm_ops: core::ptr::null_mut(),
> +        evict: None,
> +        rss: None,
> +    };
> +
> +    /// Create a new GEM object.
> +    pub fn new(dev: &device::Device<T::Driver>, size: usize) -> =
Result<Pin<UniqueObjectRef<Self>>> {
> +        let obj: Pin<Box<Self>> =3D Box::pin_init(
> +            try_pin_init!(Self {
> +                // SAFETY: This struct is expected to be =
zero-initialized
> +                obj: bindings::drm_gem_object {
> +                    funcs: &Self::OBJECT_FUNCS,
> +                    ..Default::default()
> +                },
> +                inner <- T::new(dev, size),
> +                // SAFETY: The drm subsystem guarantees that the =
drm_device will live as long as
> +                // the GEM object lives, so we can conjure a =
reference out of thin air.
> +                dev: dev.as_raw(),
> +                _p: PhantomPinned
> +            }),
> +            GFP_KERNEL,
> +        )?;
> +
> +        to_result(unsafe {
> +            bindings::drm_gem_object_init(dev.as_raw(), &obj.obj as =
*const _ as *mut _, size)
> +        })?;
> +
> +        // SAFETY: We never move out of self
> +        let obj_ref =3D unsafe {
> +            Pin::new_unchecked(UniqueObjectRef {
> +                // SAFETY: We never move out of the Box
> +                ptr: Box::leak(Pin::into_inner_unchecked(obj)),
> +                _p: PhantomPinned,
> +            })
> +        };
> +
> +        Ok(obj_ref)
> +    }
> +
> +    /// Returns the `Device` that owns this GEM object.
> +    pub fn dev(&self) -> &device::Device<T::Driver> {
> +        // SAFETY: The drm subsystem guarantees that the drm_device =
will live as long as
> +        // the GEM object lives, so we can just borrow from the raw =
pointer.
> +        unsafe { device::Device::borrow(self.dev) }
> +    }
> +}
> +
> +impl<T: DriverObject> crate::private::Sealed for Object<T> {}
> +
> +impl<T: DriverObject> Deref for Object<T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.inner
> +    }
> +}
> +
> +impl<T: DriverObject> DerefMut for Object<T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        &mut self.inner
> +    }
> +}
> +
> +impl<T: DriverObject> drv::AllocImpl for Object<T> {
> +    const ALLOC_OPS: drv::AllocOps =3D drv::AllocOps {
> +        gem_create_object: None,
> +        prime_handle_to_fd: None,
> +        prime_fd_to_handle: None,
> +        gem_prime_import: None,
> +        gem_prime_import_sg_table: None,
> +        dumb_create: None,
> +        dumb_map_offset: None,
> +    };
> +}
> +
> +/// A reference-counted shared reference to a base GEM object.
> +pub struct ObjectRef<T: IntoGEMObject> {
> +    // Invariant: the pointer is valid and initialized, and this =
ObjectRef owns a reference to it.
> +    ptr: *const T,
> +}
> +
> +impl<T: IntoGEMObject> ObjectRef<T> {
> +    /// Downgrade this reference to a shared reference.
> +    pub fn from_pinned_unique(pin: Pin<UniqueObjectRef<T>>) -> Self {
> +        // SAFETY: A (shared) `ObjectRef` doesn't need to be pinned, =
since it doesn't allow us to
> +        // optain a mutable reference.
> +        let uq =3D unsafe { Pin::into_inner_unchecked(pin) };
> +
> +        uq.into_ref()
> +    }
> +}
> +
> +/// SAFETY: GEM object references are safe to share between threads.
> +unsafe impl<T: IntoGEMObject> Send for ObjectRef<T> {}
> +unsafe impl<T: IntoGEMObject> Sync for ObjectRef<T> {}
> +
> +impl<T: IntoGEMObject> Clone for ObjectRef<T> {
> +    fn clone(&self) -> Self {
> +        self.reference()
> +    }
> +}
> +
> +impl<T: IntoGEMObject> Drop for ObjectRef<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: Having an ObjectRef implies holding a GEM =
reference.
> +        // The free callback will take care of deallocation.
> +        unsafe {
> +            bindings::drm_gem_object_put((*self.ptr).gem_obj() as =
*const _ as *mut _);
> +        }
> +    }
> +}
> +
> +impl<T: IntoGEMObject> Deref for ObjectRef<T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: The pointer is valid per the invariant
> +        unsafe { &*self.ptr }
> +    }
> +}
> +
> +/// A unique reference to a base GEM object.
> +pub struct UniqueObjectRef<T: IntoGEMObject> {
> +    // Invariant: the pointer is valid and initialized, and this =
ObjectRef owns the only reference
> +    // to it.
> +    ptr: *mut T,
> +    _p: PhantomPinned,
> +}
> +
> +impl<T: IntoGEMObject> UniqueObjectRef<T> {
> +    /// Downgrade this reference to a shared reference.
> +    pub fn into_ref(self) -> ObjectRef<T> {
> +        let ptr =3D self.ptr as *const _;
> +        core::mem::forget(self);
> +
> +        ObjectRef { ptr }
> +    }
> +}
> +
> +impl<T: IntoGEMObject> Drop for UniqueObjectRef<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: Having a UniqueObjectRef implies holding a GEM
> +        // reference. The free callback will take care of =
deallocation.
> +        unsafe {
> +            bindings::drm_gem_object_put((*self.ptr).gem_obj() as =
*const _ as *mut _);
> +        }
> +    }
> +}
> +
> +impl<T: IntoGEMObject> Deref for UniqueObjectRef<T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: The pointer is valid per the invariant
> +        unsafe { &*self.ptr }
> +    }
> +}
> +
> +impl<T: IntoGEMObject> DerefMut for UniqueObjectRef<T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        // SAFETY: The pointer is valid per the invariant
> +        unsafe { &mut *self.ptr }
> +    }
> +}
> +
> +pub(super) fn create_fops() -> bindings::file_operations {
> +    bindings::file_operations {
> +        owner: core::ptr::null_mut(),
> +        open: Some(bindings::drm_open),
> +        release: Some(bindings::drm_release),
> +        unlocked_ioctl: Some(bindings::drm_ioctl),
> +        #[cfg(CONFIG_COMPAT)]
> +        compat_ioctl: Some(bindings::drm_compat_ioctl),
> +        #[cfg(not(CONFIG_COMPAT))]
> +        compat_ioctl: None,
> +        poll: Some(bindings::drm_poll),
> +        read: Some(bindings::drm_read),
> +        llseek: Some(bindings::noop_llseek),
> +        mmap: Some(bindings::drm_gem_mmap),
> +        ..Default::default()
> +    }
> +}
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> index a767942d0b52..c44760a1332f 100644
> --- a/rust/kernel/drm/mod.rs
> +++ b/rust/kernel/drm/mod.rs
> @@ -5,4 +5,5 @@
> pub mod device;
> pub mod drv;
> pub mod file;
> +pub mod gem;
> pub mod ioctl;
> --=20
> 2.45.1

This looks good to me,

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

