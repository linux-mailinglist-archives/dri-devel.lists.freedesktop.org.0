Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F86C41727
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 20:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C4110E1D4;
	Fri,  7 Nov 2025 19:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SNk4/S/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0247110E127
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 19:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762543947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2w3HBCTCnyeGOWO+4tHcNTI3KzfddOfLp9dQjNEQkmE=;
 b=SNk4/S/uhq4kzHwzwkLckfe/QdOkPX3ykq0cEbFkGy+ac3qdQ1ustcCdv0PcKL7e30AH1k
 Nyzqc70nD/s+68dJuCwLGmQ38lWftyEzsiZ6ZstsVb8f61vSInpTmVF2zVbINq8egfvG1o
 Og9vfQJ14l1nsLp93TEWIGYcdUh6/Do=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-404-MGuTFIVJOt-aQPn_B6JBGw-1; Fri,
 07 Nov 2025 14:32:23 -0500
X-MC-Unique: MGuTFIVJOt-aQPn_B6JBGw-1
X-Mimecast-MFC-AGG-ID: MGuTFIVJOt-aQPn_B6JBGw_1762543940
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7DCAA180028A; Fri,  7 Nov 2025 19:32:20 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.81.9])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B420C1945110; Fri,  7 Nov 2025 19:32:15 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GPUS [RUST])
Subject: [PATCH 1/2] rust: drm: Introduce DeviceCtx
Date: Fri,  7 Nov 2025 14:23:53 -0500
Message-ID: <20251107193204.398657-2-lyude@redhat.com>
In-Reply-To: <20251107193204.398657-1-lyude@redhat.com>
References: <20251107193204.398657-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

One of the tricky things about DRM bindings in Rust is the fact that
initialization of a DRM device is a multi-step process. It's quite normal
for a device driver to start making use of its DRM device for tasks like
creating GEM objects before userspace registration happens. This is an
issue in rust though, since prior to userspace registration the device is
only partly initialized. This means there's a plethora of DRM device
operations we can't yet expose without opening up the door to UB if the DRM
device in question isn't yet registered.

Additionally, this isn't something we can reliably check at runtime. And
even if we could, performing an operation which requires the device be
registered when the device isn't actually registered is a programmer bug,
meaning there's no real way to gracefully handle such a mistake at runtime.
And even if that wasn't the case, it would be horrendously annoying and
noisy to have to check if a device is registered constantly throughout a
driver.

In order to solve this, we first take inspiration from
`kernel::device::DeviceCtx` and introduce `kernel::drm::DeviceCtx`.
This provides us with a ZST type that we can generalize over to represent
contexts where a device is known to have been registered with userspace at
some point in time (`Registered`), along with contexts where we can't make
such a guarantee (`AnyCtx`).

It's important to note we intentionally do not provide a `DeviceCtx`
which represents an unregistered device. This is because there's no
reasonable way to guarantee that a device with long-living references to
itself will not be registered eventually with userspace. Instead, we
provide a new-type for this: `UnregisteredDevice` which can
provide a guarantee that the `Device` has never been registered with
userspace. To ensure this, we modify `Registration` so that creating a new
`Registration` requires passing ownership of an `UnregisteredDevice`.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nova/driver.rs |   8 +-
 drivers/gpu/drm/tyr/driver.rs  |  13 ++-
 rust/kernel/drm/device.rs      | 167 +++++++++++++++++++++++++++------
 rust/kernel/drm/driver.rs      |  35 +++++--
 rust/kernel/drm/mod.rs         |   4 +
 5 files changed, 181 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 91b7380f83ab4..c78d69d5f045a 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -13,7 +13,7 @@ pub(crate) struct NovaDriver {
 }
 
 /// Convienence type alias for the DRM device type for this driver
-pub(crate) type NovaDevice = drm::Device<NovaDriver>;
+pub(crate) type NovaDevice<Ctx = drm::Registered> = drm::Device<NovaDriver, Ctx>;
 
 #[pin_data]
 pub(crate) struct NovaData {
@@ -48,10 +48,10 @@ impl auxiliary::Driver for NovaDriver {
     fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
         let data = try_pin_init!(NovaData { adev: adev.into() });
 
-        let drm = drm::Device::<Self>::new(adev.as_ref(), data)?;
-        drm::Registration::new_foreign_owned(&drm, adev.as_ref(), 0)?;
+        let drm = drm::UnregisteredDevice::<Self>::new(adev.as_ref(), data)?;
+        let drm = drm::Registration::new_foreign_owned(drm, adev.as_ref(), 0)?;
 
-        Ok(KBox::new(Self { drm }, GFP_KERNEL)?.into())
+        Ok(KBox::new(Self { drm: drm.into() }, GFP_KERNEL)?.into())
     }
 }
 
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index d5625dd1e41c8..e3ea5ad85f49b 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -30,7 +30,7 @@
 pub(crate) type IoMem = kernel::io::mem::IoMem<SZ_2M>;
 
 /// Convenience type alias for the DRM device type for this driver.
-pub(crate) type TyrDevice = drm::Device<TyrDriver>;
+pub(crate) type TyrDevice<Ctx = drm::Registered> = drm::Device<TyrDriver, Ctx>;
 
 #[pin_data(PinnedDrop)]
 pub(crate) struct TyrDriver {
@@ -140,10 +140,15 @@ fn probe(
                 gpu_info,
         });
 
-        let tdev: ARef<TyrDevice> = drm::Device::new(pdev.as_ref(), data)?;
-        drm::driver::Registration::new_foreign_owned(&tdev, pdev.as_ref(), 0)?;
+        let tdev = drm::UnregisteredDevice::<Self>::new(pdev.as_ref(), data)?;
+        let tdev = drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(), 0)?;
 
-        let driver = KBox::pin_init(try_pin_init!(TyrDriver { device: tdev }), GFP_KERNEL)?;
+        let driver = KBox::pin_init(
+            try_pin_init!(TyrDriver {
+                device: tdev.into()
+            }),
+            GFP_KERNEL,
+        )?;
 
         // We need this to be dev_info!() because dev_dbg!() does not work at
         // all in Rust for now, and we need to see whether probe succeeded.
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 3ce8f62a00569..00072984930a3 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -7,14 +7,14 @@
 use crate::{
     alloc::allocator::Kmalloc,
     bindings, device, drm,
-    drm::driver::AllocImpl,
+    drm::{driver::AllocImpl, private::Sealed},
     error::from_err_ptr,
     error::Result,
     prelude::*,
     sync::aref::{ARef, AlwaysRefCounted},
     types::Opaque,
 };
-use core::{alloc::Layout, mem, ops::Deref, ptr, ptr::NonNull};
+use core::{alloc::Layout, marker::PhantomData, mem, ops::Deref, ptr, ptr::NonNull};
 
 #[cfg(CONFIG_DRM_LEGACY)]
 macro_rules! drm_legacy_fields {
@@ -47,26 +47,83 @@ macro_rules! drm_legacy_fields {
     }
 }
 
-/// A typed DRM device with a specific `drm::Driver` implementation.
+macro_rules! drm_dev_ctx {
+    (
+        $( #[$attrs:meta] )*
+        $name:ident
+    ) => {
+        $( #[$attrs] )*
+        pub struct $name;
+
+        impl DeviceCtx for $name {}
+        impl Sealed for $name {}
+
+        // SAFETY: All registration states are free of side-effects (e.g. no Drop) and are ZSTs,
+        // thus they are always thread-safe.
+        unsafe impl Send for $name {}
+        // SAFETY: All registration states are free of side-effects (e.g. no Drop) and are ZSTs,
+        // thus they are always thread-safe.
+        unsafe impl Sync for $name {}
+    };
+}
+
+/// A trait implemented by all possible contexts a [`Device`] can be used in.
+pub trait DeviceCtx: Sealed + Send + Sync {}
+
+drm_dev_ctx! {
+    /// The [`DeviceCtx`] of a [`Device`] that was registered with userspace at some point.
+    ///
+    /// This represents a [`Device`] which is guaranteed to have been registered with userspace at
+    /// some point in time. Once a DRM device has registered itself with userspace, it is safe to
+    /// assume that the initialization process for the DRM device has completed.
+    ///
+    /// Note: A device in this context is not guaranteed to remain registered with userspace for its
+    /// entire lifetime, as this is impossible to guarantee at compile-time. However, any
+    /// userspace-dependent operations performed with an unregistered device in this [`DeviceCtx`]
+    /// are guaranteed to be no-ops.
+    ///
+    /// # Invariants
+    ///
+    /// A [`Device`] in this [`DeviceCtx`] is guaranteed to have called `drm_dev_register` once.
+    Registered
+}
+
+drm_dev_ctx! {
+    /// The [`DeviceCtx`] of a [`Device`] that has no initialization or registration guarantees.
+    ///
+    /// A [`Device`] in this context could be in any state, pre or post registration, and is only
+    /// guaranteed to be minimally initialized. As such the operations which may be performed on
+    /// such [`Device`]s are more limited then in the [`Registered`] context.
+    AnyCtx
+}
+
+/// A [`Device`] which is known at compile-time to be unregistered with userspace.
 ///
-/// The device is always reference-counted.
+/// This type allows performing operations which are only safe to do before userspace registration,
+/// and can be used to create a [`Registration`](drm::driver::Registration) once the driver is ready
+/// to register the device with userspace.
 ///
 /// # Invariants
 ///
-/// `self.dev` is a valid instance of a `struct device`.
-#[repr(C)]
-pub struct Device<T: drm::Driver> {
-    dev: Opaque<bindings::drm_device>,
-    data: T::Data,
+/// The device in `self.0` is guaranteed to be a newly created [`Device`] that has not yet been
+/// registered with userspace until this type is dropped.
+pub struct UnregisteredDevice<T: drm::Driver>(ARef<Device<T, AnyCtx>>);
+
+impl<T: drm::Driver> Deref for UnregisteredDevice<T> {
+    type Target = Device<T, AnyCtx>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
 }
 
-impl<T: drm::Driver> Device<T> {
+impl<T: drm::Driver> UnregisteredDevice<T> {
     const VTABLE: bindings::drm_driver = drm_legacy_fields! {
         load: None,
         open: Some(drm::File::<T::File>::open_callback),
         postclose: Some(drm::File::<T::File>::postclose_callback),
         unload: None,
-        release: Some(Self::release),
+        release: Some(Device::<T>::release),
         master_set: None,
         master_drop: None,
         debugfs_init: None,
@@ -94,8 +151,10 @@ impl<T: drm::Driver> Device<T> {
 
     const GEM_FOPS: bindings::file_operations = drm::gem::create_fops();
 
-    /// Create a new `drm::Device` for a `drm::Driver`.
-    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<ARef<Self>> {
+    /// Create a new `UnregisteredDevice` for a `drm::Driver`.
+    ///
+    /// This can be used to create a [`Registration`](kernel::drm::Registration).
+    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<Self> {
         // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, hence ensure a `kmalloc()`
         // compatible `Layout`.
         let layout = Kmalloc::aligned_layout(Layout::new::<Self>());
@@ -103,12 +162,12 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<A
         // SAFETY:
         // - `VTABLE`, as a `const` is pinned to the read-only section of the compilation,
         // - `dev` is valid by its type invarants,
-        let raw_drm: *mut Self = unsafe {
+        let raw_drm: *mut Device<T, AnyCtx> = unsafe {
             bindings::__drm_dev_alloc(
                 dev.as_raw(),
                 &Self::VTABLE,
                 layout.size(),
-                mem::offset_of!(Self, dev),
+                mem::offset_of!(Device<T, AnyCtx>, dev),
             )
         }
         .cast();
@@ -123,7 +182,7 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<A
         unsafe { data.__pinned_init(raw_data) }.inspect_err(|_| {
             // SAFETY: `raw_drm` is a valid pointer to `Self`, given that `__drm_dev_alloc` was
             // successful.
-            let drm_dev = unsafe { Self::into_drm_device(raw_drm) };
+            let drm_dev = unsafe { Device::into_drm_device(raw_drm) };
 
             // SAFETY: `__drm_dev_alloc()` was successful, hence `drm_dev` must be valid and the
             // refcount must be non-zero.
@@ -132,9 +191,40 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<A
 
         // SAFETY: The reference count is one, and now we take ownership of that reference as a
         // `drm::Device`.
-        Ok(unsafe { ARef::from_raw(raw_drm) })
+        // INVARIANT: We just created the device above, but have yet to call `drm_dev_register`.
+        // This proves that `raw_drm` must be unregistered.
+        Ok(Self(unsafe { ARef::from_raw(raw_drm) }))
     }
+}
+
+/// A typed DRM device with a specific [`drm::Driver`] implementation and [`DeviceCtx`].
+///
+/// Since DRM devices can be used before being fully initialized and registered with userspace, this
+/// type keeps track of whether it is known at compile-time that a device has been registered with
+/// userspace at least once using the type parameter `Ctx`.
+///
+/// Keep in mind: this means that an unregistered device can still have the registration state
+/// [`Registered`] as long as it was registered with userspace once in the past, and that the
+/// behavior of such a device is still well-defined. In such a situation, the behavior of any
+/// functions which interact with userspace will simply be no-ops. Additionally, a device with the
+/// registration state [`Unknown`] simply does not have a guaranteed registration state at compile
+/// time, and could be either registered or unregistered. Since there is no way to guarantee a
+/// long-lived reference to an unregistered device would remain unregistered, we do not provide a
+/// [`DeviceCtx`] for this.
+///
+/// # Invariants
+///
+/// * `self.dev` is a valid instance of a `struct device`.
+/// * The data layout of `Self` remains the same across all implementations of `Ctx`.
+/// * Any invariants for `Ctx` also apply.
+#[repr(C)]
+pub struct Device<T: drm::Driver, C: DeviceCtx = Registered> {
+    dev: Opaque<bindings::drm_device>,
+    data: T::Data,
+    _ctx: PhantomData<C>,
+}
 
+impl<T: drm::Driver, C: DeviceCtx> Device<T, C> {
     pub(crate) fn as_raw(&self) -> *mut bindings::drm_device {
         self.dev.get()
     }
@@ -160,13 +250,13 @@ unsafe fn into_drm_device(ptr: NonNull<Self>) -> *mut bindings::drm_device {
     ///
     /// # Safety
     ///
-    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count,
-    /// i.e. it must be ensured that the reference count of the C `struct drm_device` `ptr` points
-    /// to can't drop to zero, for the duration of this function call and the entire duration when
-    /// the returned reference exists.
-    ///
-    /// Additionally, callers must ensure that the `struct device`, `ptr` is pointing to, is
-    /// embedded in `Self`.
+    /// * Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count,
+    ///   i.e. it must be ensured that the reference count of the C `struct drm_device` `ptr` points
+    ///   to can't drop to zero, for the duration of this function call and the entire duration when
+    ///   the returned reference exists.
+    /// * Additionally, callers must ensure that the `struct device`, `ptr` is pointing to, is
+    ///   embedded in `Self`.
+    /// * Callers promise that any type invariants of `Ctx` will be upheld.
     #[doc(hidden)]
     pub unsafe fn from_raw<'a>(ptr: *const bindings::drm_device) -> &'a Self {
         // SAFETY: By the safety requirements of this function `ptr` is a valid pointer to a
@@ -188,7 +278,26 @@ extern "C" fn release(ptr: *mut bindings::drm_device) {
     }
 }
 
-impl<T: drm::Driver> Deref for Device<T> {
+impl<T: drm::Driver> Device<T, AnyCtx> {
+    /// Assume the device has been fully initialized and registered with userspace.
+    ///
+    /// # Safety
+    ///
+    /// The caller promises that `drm_dev_register` has been called on this device.
+    pub(crate) unsafe fn assume_registered(&self) -> &Device<T, Registered> {
+        // SAFETY: The data layout is identical via our type invariants.
+        unsafe { mem::transmute(self) }
+    }
+}
+
+impl<T: drm::Driver, C: DeviceCtx> AsRef<Device<T, AnyCtx>> for Device<T, C> {
+    fn as_ref(&self) -> &Device<T, AnyCtx> {
+        // SAFETY: The data layout is identical via our type invariants.
+        unsafe { mem::transmute(self) }
+    }
+}
+
+impl<T: drm::Driver, C: DeviceCtx> Deref for Device<T, C> {
     type Target = T::Data;
 
     fn deref(&self) -> &Self::Target {
@@ -198,7 +307,7 @@ fn deref(&self) -> &Self::Target {
 
 // SAFETY: DRM device objects are always reference counted and the get/put functions
 // satisfy the requirements.
-unsafe impl<T: drm::Driver> AlwaysRefCounted for Device<T> {
+unsafe impl<T: drm::Driver, C: DeviceCtx> AlwaysRefCounted for Device<T, C> {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
         unsafe { bindings::drm_dev_get(self.as_raw()) };
@@ -213,7 +322,7 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
 
-impl<T: drm::Driver> AsRef<device::Device> for Device<T> {
+impl<T: drm::Driver, C: DeviceCtx> AsRef<device::Device> for Device<T, C> {
     fn as_ref(&self) -> &device::Device {
         // SAFETY: `bindings::drm_device::dev` is valid as long as the DRM device itself is valid,
         // which is guaranteed by the type invariant.
@@ -222,8 +331,8 @@ fn as_ref(&self) -> &device::Device {
 }
 
 // SAFETY: A `drm::Device` can be released from any thread.
-unsafe impl<T: drm::Driver> Send for Device<T> {}
+unsafe impl<T: drm::Driver, C: DeviceCtx> Send for Device<T, C> {}
 
 // SAFETY: A `drm::Device` can be shared among threads because all immutable methods are protected
 // by the synchronization in `struct drm_device`.
-unsafe impl<T: drm::Driver> Sync for Device<T> {}
+unsafe impl<T: drm::Driver, C: DeviceCtx> Sync for Device<T, C> {}
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index f30ee4c6245cd..fde0447566bef 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -10,6 +10,7 @@
     prelude::*,
     sync::aref::ARef,
 };
+use core::{mem, ptr::NonNull};
 use macros::vtable;
 
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
@@ -122,30 +123,46 @@ pub trait Driver {
 
 impl<T: Driver> Registration<T> {
     /// Creates a new [`Registration`] and registers it.
-    fn new(drm: &drm::Device<T>, flags: usize) -> Result<Self> {
+    fn new(drm: drm::UnregisteredDevice<T>, flags: usize) -> Result<Self> {
         // SAFETY: `drm.as_raw()` is valid by the invariants of `drm::Device`.
         to_result(unsafe { bindings::drm_dev_register(drm.as_raw(), flags) })?;
 
-        Ok(Self(drm.into()))
+        // SAFETY: We just called `drm_dev_register` above
+        let new = NonNull::from(unsafe { drm.assume_registered() });
+
+        // Leak the ARef from UnregisteredDevice in preparation for transferring its ownership.
+        mem::forget(drm);
+
+        // SAFETY: `drm`'s `Drop` constructor was never called, ensuring that there remains at least
+        // one reference to the device - which we take ownership over here.
+        let new = unsafe { ARef::from_raw(new) };
+
+        Ok(Self(new))
     }
 
-    /// Same as [`Registration::new`}, but transfers ownership of the [`Registration`] to
+    /// Same as [`Registration::new`], but transfers ownership of the [`Registration`] to
     /// [`devres::register`].
-    pub fn new_foreign_owned(
-        drm: &drm::Device<T>,
-        dev: &device::Device<device::Bound>,
+    pub fn new_foreign_owned<'a>(
+        drm: drm::UnregisteredDevice<T>,
+        dev: &'a device::Device<device::Bound>,
         flags: usize,
-    ) -> Result
+    ) -> Result<&'a drm::Device<T>>
     where
         T: 'static,
     {
-        if drm.as_ref().as_raw() != dev.as_raw() {
+        let this_dev: &device::Device = drm.as_ref();
+        if this_dev.as_raw() != dev.as_raw() {
             return Err(EINVAL);
         }
 
         let reg = Registration::<T>::new(drm, flags)?;
+        let drm = NonNull::from(reg.device());
+
+        devres::register(dev, reg, GFP_KERNEL)?;
 
-        devres::register(dev, reg, GFP_KERNEL)
+        // SAFETY: Since `reg` was passed to devres::register(), the device now owns the lifetime
+        // of the DRM registration - ensuring that this references lives for at least as long as 'a.
+        Ok(unsafe { drm.as_ref() })
     }
 
     /// Returns a reference to the `Device` instance for this registration.
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 1b82b6945edf2..90018edef3236 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -8,7 +8,11 @@
 pub mod gem;
 pub mod ioctl;
 
+pub use self::device::AnyCtx;
 pub use self::device::Device;
+pub use self::device::DeviceCtx;
+pub use self::device::Registered;
+pub use self::device::UnregisteredDevice;
 pub use self::driver::Driver;
 pub use self::driver::DriverInfo;
 pub use self::driver::Registration;
-- 
2.51.1

