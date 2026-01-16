Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FB4D387F8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 21:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F61A10E93B;
	Fri, 16 Jan 2026 20:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Gu7vJaUl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAFB10E93C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 20:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768596534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBmlVfMkO+IoYEb83UmHg5x9NCktU7JsOGPTKXk0jk4=;
 b=Gu7vJaUl3DiHuHPdEFNlOdGh6xzyR/ERbrb+Oag6Q4lsX79upp4JGS5Lv6hQv/t1WrfBE5
 CHYxQfLFgpLkkJf+tSI9/1Io0IbiOJ42xbVl1BT/Ku+7flLdHhF8/fpYFhbMkg8MZ/gBsh
 D3dNFX/Mpn4pXp2TJ4XMXYa5IdjpKQs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-2oB9LO3FP2KhW_YS1TejFA-1; Fri,
 16 Jan 2026 15:48:49 -0500
X-MC-Unique: 2oB9LO3FP2KhW_YS1TejFA-1
X-Mimecast-MFC-AGG-ID: 2oB9LO3FP2KhW_YS1TejFA_1768596527
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 96BB41956088; Fri, 16 Jan 2026 20:48:47 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.63])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AEF4519560A7; Fri, 16 Jan 2026 20:48:45 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org, "Miguel Ojeda" <ojeda@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Alice Ryhl" <aliceryhl@google.com>,
 "Shankari Anand" <shankari.ak0208@gmail.com>,
 "David Airlie" <airlied@gmail.com>, "Benno Lossin" <lossin@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Asahi Lina" <lina+kernel@asahilina.net>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v2 3/3] rust/drm/gem: Use DeviceContext with GEM objects
Date: Fri, 16 Jan 2026 15:41:43 -0500
Message-ID: <20260116204728.725579-4-lyude@redhat.com>
In-Reply-To: <20260116204728.725579-1-lyude@redhat.com>
References: <20260116204728.725579-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

Now that we have the ability to represent the context in which a DRM device
is in at compile-time, we can start carrying around this context with GEM
object types in order to allow a driver to safely create GEM objects before
a DRM device has registered with userspace.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nova/driver.rs |  2 +-
 drivers/gpu/drm/nova/gem.rs    | 11 +++---
 drivers/gpu/drm/tyr/driver.rs  |  2 +-
 drivers/gpu/drm/tyr/gem.rs     |  3 +-
 rust/kernel/drm/device.rs      | 14 ++++----
 rust/kernel/drm/driver.rs      |  2 +-
 rust/kernel/drm/gem/mod.rs     | 66 ++++++++++++++++++++++------------
 7 files changed, 63 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 8cea5f68c3b04..2c13261450406 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -67,7 +67,7 @@ fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<S
 impl drm::Driver for NovaDriver {
     type Data = NovaData;
     type File = File;
-    type Object = gem::Object<NovaObject>;
+    type Object<Ctx: drm::DeviceContext> = gem::Object<NovaObject, Ctx>;
 
     const INFO: drm::DriverInfo = INFO;
 
diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
index 6ccfa5da57617..f6e98b9db58d8 100644
--- a/drivers/gpu/drm/nova/gem.rs
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -2,7 +2,7 @@
 
 use kernel::{
     drm,
-    drm::{gem, gem::BaseObject},
+    drm::{gem, gem::BaseObject, DeviceContext},
     page,
     prelude::*,
     sync::aref::ARef,
@@ -20,20 +20,23 @@ pub(crate) struct NovaObject {}
 impl gem::DriverObject for NovaObject {
     type Driver = NovaDriver;
 
-    fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
+    fn new<Ctx: DeviceContext>(_dev: &NovaDevice<Ctx>, _size: usize) -> impl PinInit<Self, Error> {
         try_pin_init!(NovaObject {})
     }
 }
 
 impl NovaObject {
     /// Create a new DRM GEM object.
-    pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
+    pub(crate) fn new<Ctx: DeviceContext>(
+        dev: &NovaDevice<Ctx>,
+        size: usize,
+    ) -> Result<ARef<gem::Object<Self, Ctx>>> {
         if size == 0 {
             return Err(EINVAL);
         }
         let aligned_size = page::page_align(size).ok_or(EINVAL)?;
 
-        gem::Object::new(dev, aligned_size)
+        gem::Object::<Self, Ctx>::new(dev, aligned_size)
     }
 
     /// Look up a GEM object handle for a `File` and return an `ObjectRef` for it.
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 768d50bde929e..c94aa1f12ca61 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -183,7 +183,7 @@ fn drop(self: Pin<&mut Self>) {
 impl drm::Driver for TyrDriver {
     type Data = TyrData;
     type File = File;
-    type Object = drm::gem::Object<TyrObject>;
+    type Object<R: drm::DeviceContext> = drm::gem::Object<TyrObject, R>;
 
     const INFO: drm::DriverInfo = INFO;
 
diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 1273bf89dbd5d..00804f8c14bd4 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -3,6 +3,7 @@
 use crate::driver::TyrDevice;
 use crate::driver::TyrDriver;
 use kernel::drm::gem;
+use kernel::drm::DeviceContext;
 use kernel::prelude::*;
 
 /// GEM Object inner driver data
@@ -12,7 +13,7 @@ pub(crate) struct TyrObject {}
 impl gem::DriverObject for TyrObject {
     type Driver = TyrDriver;
 
-    fn new(_dev: &TyrDevice, _size: usize) -> impl PinInit<Self, Error> {
+    fn new<Ctx: DeviceContext>(_dev: &TyrDevice<Ctx>, _size: usize) -> impl PinInit<Self, Error> {
         try_pin_init!(TyrObject {})
     }
 }
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 441ed7c94fcf5..0864bd10af339 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -140,13 +140,13 @@ impl<T: drm::Driver> UnregisteredDevice<T> {
         master_set: None,
         master_drop: None,
         debugfs_init: None,
-        gem_create_object: T::Object::ALLOC_OPS.gem_create_object,
-        prime_handle_to_fd: T::Object::ALLOC_OPS.prime_handle_to_fd,
-        prime_fd_to_handle: T::Object::ALLOC_OPS.prime_fd_to_handle,
-        gem_prime_import: T::Object::ALLOC_OPS.gem_prime_import,
-        gem_prime_import_sg_table: T::Object::ALLOC_OPS.gem_prime_import_sg_table,
-        dumb_create: T::Object::ALLOC_OPS.dumb_create,
-        dumb_map_offset: T::Object::ALLOC_OPS.dumb_map_offset,
+        gem_create_object: T::Object::<Uninit>::ALLOC_OPS.gem_create_object,
+        prime_handle_to_fd: T::Object::<Uninit>::ALLOC_OPS.prime_handle_to_fd,
+        prime_fd_to_handle: T::Object::<Uninit>::ALLOC_OPS.prime_fd_to_handle,
+        gem_prime_import: T::Object::<Uninit>::ALLOC_OPS.gem_prime_import,
+        gem_prime_import_sg_table: T::Object::<Uninit>::ALLOC_OPS.gem_prime_import_sg_table,
+        dumb_create: T::Object::<Uninit>::ALLOC_OPS.dumb_create,
+        dumb_map_offset: T::Object::<Uninit>::ALLOC_OPS.dumb_map_offset,
         show_fdinfo: None,
         fbdev_probe: None,
 
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 108d789e43759..b37c5685e8ad8 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -109,7 +109,7 @@ pub trait Driver {
     type Data: Sync + Send;
 
     /// The type used to manage memory for this driver.
-    type Object: AllocImpl;
+    type Object<Ctx: drm::DeviceContext>: AllocImpl;
 
     /// The type used to represent a DRM File (client)
     type File: drm::file::DriverFile;
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index d49a9ba026356..1dd8681a5738b 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -7,13 +7,16 @@
 use crate::{
     alloc::flags::*,
     bindings, drm,
-    drm::driver::{AllocImpl, AllocOps},
+    drm::{
+        device::{DeviceContext, Registered},
+        driver::{AllocImpl, AllocOps},
+    },
     error::{to_result, Result},
     prelude::*,
     sync::aref::{ARef, AlwaysRefCounted},
     types::Opaque,
 };
-use core::{ops::Deref, ptr::NonNull};
+use core::{marker::PhantomData, ops::Deref, ptr::NonNull};
 
 /// A type alias for retrieving a [`Driver`]s [`DriverFile`] implementation from its
 /// [`DriverObject`] implementation.
@@ -22,21 +25,30 @@
 /// [`DriverFile`]: drm::file::DriverFile
 pub type DriverFile<T> = drm::File<<<T as DriverObject>::Driver as drm::Driver>::File>;
 
+/// A type alias for retrieving the current [`AllocImpl`] for a given [`DriverObject`].
+///
+/// [`Driver`]: drm::Driver
+pub type DriverAllocImpl<T, Ctx = Registered> =
+    <<T as DriverObject>::Driver as drm::Driver>::Object<Ctx>;
+
 /// GEM object functions, which must be implemented by drivers.
 pub trait DriverObject: Sync + Send + Sized {
     /// Parent `Driver` for this object.
     type Driver: drm::Driver;
 
     /// Create a new driver data object for a GEM object of a given size.
-    fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl PinInit<Self, Error>;
+    fn new<Ctx: DeviceContext>(
+        dev: &drm::Device<Self::Driver, Ctx>,
+        size: usize,
+    ) -> impl PinInit<Self, Error>;
 
     /// Open a new handle to an existing object, associated with a File.
-    fn open(_obj: &<Self::Driver as drm::Driver>::Object, _file: &DriverFile<Self>) -> Result {
+    fn open(_obj: &DriverAllocImpl<Self>, _file: &DriverFile<Self>) -> Result {
         Ok(())
     }
 
     /// Close a handle to an existing object, associated with a File.
-    fn close(_obj: &<Self::Driver as drm::Driver>::Object, _file: &DriverFile<Self>) {}
+    fn close(_obj: &DriverAllocImpl<Self>, _file: &DriverFile<Self>) {}
 }
 
 /// Trait that represents a GEM object subtype
@@ -62,9 +74,12 @@ extern "C" fn open_callback<T: DriverObject>(
     // SAFETY: `open_callback` is only ever called with a valid pointer to a `struct drm_file`.
     let file = unsafe { DriverFile::<T>::from_raw(raw_file) };
 
-    // SAFETY: `open_callback` is specified in the AllocOps structure for `DriverObject<T>`,
-    // ensuring that `raw_obj` is contained within a `DriverObject<T>`
-    let obj = unsafe { <<T::Driver as drm::Driver>::Object as IntoGEMObject>::from_raw(raw_obj) };
+    // SAFETY:
+    // * `open_callback` is specified in the AllocOps structure for `DriverObject`, ensuring that
+    //   `raw_obj` is contained within a `DriverAllocImpl<T>`
+    // * It is only possible for `open_callback` to be called after device registration, ensuring
+    //   that the object's device is in the `Registered` state.
+    let obj: &DriverAllocImpl<T> = unsafe { IntoGEMObject::from_raw(raw_obj) };
 
     match T::open(obj, file) {
         Err(e) => e.to_errno(),
@@ -81,12 +96,12 @@ extern "C" fn close_callback<T: DriverObject>(
 
     // SAFETY: `close_callback` is specified in the AllocOps structure for `Object<T>`, ensuring
     // that `raw_obj` is indeed contained within a `Object<T>`.
-    let obj = unsafe { <<T::Driver as drm::Driver>::Object as IntoGEMObject>::from_raw(raw_obj) };
+    let obj: &DriverAllocImpl<T> = unsafe { IntoGEMObject::from_raw(raw_obj) };
 
     T::close(obj, file);
 }
 
-impl<T: DriverObject> IntoGEMObject for Object<T> {
+impl<T: DriverObject, Ctx: DeviceContext> IntoGEMObject for Object<T, Ctx> {
     fn as_raw(&self) -> *mut bindings::drm_gem_object {
         self.obj.get()
     }
@@ -94,7 +109,7 @@ fn as_raw(&self) -> *mut bindings::drm_gem_object {
     unsafe fn from_raw<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self {
         // SAFETY: `obj` is guaranteed to be in an `Object<T>` via the safety contract of this
         // function
-        unsafe { &*crate::container_of!(Opaque::cast_from(self_ptr), Object<T>, obj) }
+        unsafe { &*crate::container_of!(Opaque::cast_from(self_ptr), Object<T, Ctx>, obj) }
     }
 }
 
@@ -111,7 +126,7 @@ fn size(&self) -> usize {
     fn create_handle<D, F>(&self, file: &drm::File<F>) -> Result<u32>
     where
         Self: AllocImpl<Driver = D>,
-        D: drm::Driver<Object = Self, File = F>,
+        D: drm::Driver<Object<Registered> = Self, File = F>,
         F: drm::file::DriverFile<Driver = D>,
     {
         let mut handle: u32 = 0;
@@ -126,7 +141,7 @@ fn create_handle<D, F>(&self, file: &drm::File<F>) -> Result<u32>
     fn lookup_handle<D, F>(file: &drm::File<F>, handle: u32) -> Result<ARef<Self>>
     where
         Self: AllocImpl<Driver = D>,
-        D: drm::Driver<Object = Self, File = F>,
+        D: drm::Driver<Object<Registered> = Self, File = F>,
         F: drm::file::DriverFile<Driver = D>,
     {
         // SAFETY: The arguments are all valid per the type invariants.
@@ -166,16 +181,18 @@ impl<T: IntoGEMObject> BaseObject for T {}
 ///
 /// # Invariants
 ///
-/// - `self.obj` is a valid instance of a `struct drm_gem_object`.
+/// * `self.obj` is a valid instance of a `struct drm_gem_object`.
+/// * Any type invariants of `Ctx` apply to the parent DRM device for this GEM object.
 #[repr(C)]
 #[pin_data]
-pub struct Object<T: DriverObject + Send + Sync> {
+pub struct Object<T: DriverObject + Send + Sync, Ctx: DeviceContext = Registered> {
     obj: Opaque<bindings::drm_gem_object>,
     #[pin]
     data: T,
+    _ctx: PhantomData<Ctx>,
 }
 
-impl<T: DriverObject> Object<T> {
+impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
     const OBJECT_FUNCS: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
         free: Some(Self::free_callback),
         open: Some(open_callback::<T>),
@@ -195,11 +212,12 @@ impl<T: DriverObject> Object<T> {
     };
 
     /// Create a new GEM object.
-    pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
+    pub fn new(dev: &drm::Device<T::Driver, Ctx>, size: usize) -> Result<ARef<Self>> {
         let obj: Pin<KBox<Self>> = KBox::pin_init(
             try_pin_init!(Self {
                 obj: Opaque::new(bindings::drm_gem_object::default()),
                 data <- T::new(dev, size),
+                _ctx: PhantomData,
             }),
             GFP_KERNEL,
         )?;
@@ -208,6 +226,8 @@ pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
         unsafe { (*obj.as_raw()).funcs = &Self::OBJECT_FUNCS };
 
         // SAFETY: The arguments are all valid per the type invariants.
+        // INVARIANT: We use `dev` for creating the GEM object, which is known to be in state `Ctx` -
+        // ensuring that the GEM object's pointer to the DRM device is always in the same state.
         to_result(unsafe { bindings::drm_gem_object_init(dev.as_raw(), obj.obj.get(), size) })?;
 
         // SAFETY: We will never move out of `Self` as `ARef<Self>` is always treated as pinned.
@@ -221,13 +241,15 @@ pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
     }
 
     /// Returns the `Device` that owns this GEM object.
-    pub fn dev(&self) -> &drm::Device<T::Driver> {
+    pub fn dev(&self) -> &drm::Device<T::Driver, Ctx> {
         // SAFETY:
         // - `struct drm_gem_object.dev` is initialized and valid for as long as the GEM
         //   object lives.
         // - The device we used for creating the gem object is passed as &drm::Device<T::Driver> to
         //   Object::<T>::new(), so we know that `T::Driver` is the right generic parameter to use
         //   here.
+        // - Any type invariants of `Ctx` are upheld by using the same `Ctx` for the `Device` we
+        //   return.
         unsafe { drm::Device::from_raw((*self.as_raw()).dev) }
     }
 
@@ -253,7 +275,7 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
 }
 
 // SAFETY: Instances of `Object<T>` are always reference-counted.
-unsafe impl<T: DriverObject> crate::sync::aref::AlwaysRefCounted for Object<T> {
+unsafe impl<T: DriverObject, Ctx: DeviceContext> AlwaysRefCounted for Object<T, Ctx> {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
         unsafe { bindings::drm_gem_object_get(self.as_raw()) };
@@ -268,9 +290,9 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
 
-impl<T: DriverObject> super::private::Sealed for Object<T> {}
+impl<T: DriverObject, Ctx: DeviceContext> super::private::Sealed for Object<T, Ctx> {}
 
-impl<T: DriverObject> Deref for Object<T> {
+impl<T: DriverObject, Ctx: DeviceContext> Deref for Object<T, Ctx> {
     type Target = T;
 
     fn deref(&self) -> &Self::Target {
@@ -278,7 +300,7 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
-impl<T: DriverObject> AllocImpl for Object<T> {
+impl<T: DriverObject, Ctx: DeviceContext> AllocImpl for Object<T, Ctx> {
     type Driver = T::Driver;
 
     const ALLOC_OPS: AllocOps = AllocOps {
-- 
2.52.0

