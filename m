Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90499A8504F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 01:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6F110EA8B;
	Thu, 10 Apr 2025 23:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FqVMiDut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1CF10EA8B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 23:56:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 63351429C9;
 Thu, 10 Apr 2025 23:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B88C4CEDD;
 Thu, 10 Apr 2025 23:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744329391;
 bh=ZD7jM2034IwafW0y5C6VCP5oscC4zTp0VctUICUW7vg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FqVMiDutq0XYp1k96nXUexds0GIsNwjcy1MLoSrKELGMdnFF7WAeOFLKsYCNctUIx
 u3aYmXyTFWB1l2suVIKhPvakvK+1wJVIArm25Y2SfP/n8OSIZqbxP0CQgA1VGgrVTI
 O3XcsEMo3H4vZMTE3ALxZQnD6u/W8v7g3vd8VIVlhDcDibhjDgxVZnLrYC9ktBXkh5
 lIKRVLDo9befzbKVWtEFYuBTUnLNvTQ4O7dMJJd2sfOV0o46xU1poaIoG9lPCmhwp5
 DsUsJ27B8Csa4FuN5ujmTEHAhj4pDJKndHL0MmaH1x+YY4M5DCl4sa2VjTinQkSpS8
 woHQwgPS/Jpbg==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
 alyssa@rosenzweig.io
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 4/8] rust: drm: add device abstraction
Date: Fri, 11 Apr 2025 01:55:23 +0200
Message-ID: <20250410235546.43736-5-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410235546.43736-1-dakr@kernel.org>
References: <20250410235546.43736-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Asahi Lina <lina@asahilina.net>

Implement the abstraction for a `struct drm_device`.

A `drm::Device` creates a static const `struct drm_driver` filled with
the data from the `drm::Driver` trait implementation of the actual
driver creating the `drm::Device`.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Asahi Lina <lina@asahilina.net>
[ Rewrite of drm::Device
    * full rewrite of the drm::Device abstraction using the subclassing
      pattern
    * original source archive: http://archive.today/5NxBo

  - Danilo ]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/device.rs       | 193 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/driver.rs       |   7 --
 rust/kernel/drm/mod.rs          |   2 +
 4 files changed, 196 insertions(+), 7 deletions(-)
 create mode 100644 rust/kernel/drm/device.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 84921ffbefa7..1dd7100c1cff 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,6 +6,7 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
new file mode 100644
index 000000000000..c5433d314409
--- /dev/null
+++ b/rust/kernel/drm/device.rs
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM device.
+//!
+//! C header: [`include/linux/drm/drm_device.h`](srctree/include/linux/drm/drm_device.h)
+
+use crate::{
+    bindings, device, drm,
+    drm::driver::AllocImpl,
+    error::from_err_ptr,
+    error::Result,
+    prelude::*,
+    types::{ARef, AlwaysRefCounted, Opaque},
+};
+use core::{mem, ops::Deref, ptr, ptr::NonNull};
+
+#[cfg(CONFIG_DRM_LEGACY)]
+macro_rules! drm_legacy_fields {
+    ( $($field:ident: $val:expr),* $(,)? ) => {
+        bindings::drm_driver {
+            $( $field: $val ),*,
+            firstopen: None,
+            preclose: None,
+            dma_ioctl: None,
+            dma_quiescent: None,
+            context_dtor: None,
+            irq_handler: None,
+            irq_preinstall: None,
+            irq_postinstall: None,
+            irq_uninstall: None,
+            get_vblank_counter: None,
+            enable_vblank: None,
+            disable_vblank: None,
+            dev_priv_size: 0,
+        }
+    }
+}
+
+#[cfg(not(CONFIG_DRM_LEGACY))]
+macro_rules! drm_legacy_fields {
+    ( $($field:ident: $val:expr),* $(,)? ) => {
+        bindings::drm_driver {
+            $( $field: $val ),*
+        }
+    }
+}
+
+/// A typed DRM device with a specific `drm::Driver` implementation. The device is always
+/// reference-counted.
+#[repr(C)]
+#[pin_data]
+pub struct Device<T: drm::Driver> {
+    dev: Opaque<bindings::drm_device>,
+    #[pin]
+    data: T::Data,
+}
+
+impl<T: drm::Driver> Device<T> {
+    const VTABLE: bindings::drm_driver = drm_legacy_fields! {
+        load: None,
+        open: None, // TODO: File abstraction
+        postclose: None, // TODO: File abstraction
+        unload: None,
+        release: None,
+        master_set: None,
+        master_drop: None,
+        debugfs_init: None,
+        gem_create_object: T::Object::ALLOC_OPS.gem_create_object,
+        prime_handle_to_fd: T::Object::ALLOC_OPS.prime_handle_to_fd,
+        prime_fd_to_handle: T::Object::ALLOC_OPS.prime_fd_to_handle,
+        gem_prime_import: T::Object::ALLOC_OPS.gem_prime_import,
+        gem_prime_import_sg_table: T::Object::ALLOC_OPS.gem_prime_import_sg_table,
+        dumb_create: T::Object::ALLOC_OPS.dumb_create,
+        dumb_map_offset: T::Object::ALLOC_OPS.dumb_map_offset,
+        show_fdinfo: None,
+        fbdev_probe: None,
+
+        major: T::INFO.major,
+        minor: T::INFO.minor,
+        patchlevel: T::INFO.patchlevel,
+        name: T::INFO.name.as_char_ptr() as *mut _,
+        desc: T::INFO.desc.as_char_ptr() as *mut _,
+
+        driver_features: drm::driver::FEAT_GEM,
+        ioctls: T::IOCTLS.as_ptr(),
+        num_ioctls: T::IOCTLS.len() as i32,
+        fops: core::ptr::null_mut() as _,
+    };
+
+    /// Create a new `drm::Device` for a `drm::Driver`.
+    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<ARef<Self>> {
+        // SAFETY:
+        // - `VTABLE`, as a `const` is pinned to the read-only section of the compilation,
+        // - `dev` is valid by its type invarants,
+        let raw_drm: *mut Self = unsafe {
+            bindings::__drm_dev_alloc(
+                dev.as_raw(),
+                &Self::VTABLE,
+                mem::size_of::<Self>(),
+                mem::offset_of!(Self, dev),
+            )
+        }
+        .cast();
+        let raw_drm = NonNull::new(from_err_ptr(raw_drm)?).ok_or(ENOMEM)?;
+
+        // SAFETY: `raw_drm` is a valid pointer to `Self`.
+        let raw_data = unsafe { ptr::addr_of_mut!((*raw_drm.as_ptr()).data) };
+
+        // SAFETY:
+        // - `raw_data` is a valid pointer to uninitialized memory.
+        // - `raw_data` will not move until it is dropped.
+        unsafe { data.__pinned_init(raw_data) }.inspect_err(|_| {
+            // SAFETY: `__drm_dev_alloc()` was successful, hence `raw_drm` must be valid and the
+            // refcount must be non-zero.
+            unsafe { bindings::drm_dev_put(ptr::addr_of_mut!((*raw_drm.as_ptr()).dev).cast()) };
+        })?;
+
+        // SAFETY: The reference count is one, and now we take ownership of that reference as a
+        // `drm::Device`.
+        Ok(unsafe { ARef::from_raw(raw_drm) })
+    }
+
+    pub(crate) fn as_raw(&self) -> *mut bindings::drm_device {
+        self.dev.get()
+    }
+
+    /// # Safety
+    ///
+    /// `ptr` must be a valid poiner to a `struct device` embedded in `Self`.
+    unsafe fn from_drm_device(ptr: *const bindings::drm_device) -> *mut Self {
+        // SAFETY: By the safety requirements of this function `ptr` is a valid pointer to a
+        // `struct drm_device` embedded in `Self`.
+        unsafe { crate::container_of!(ptr, Self, dev) }.cast_mut()
+    }
+
+    /// Not intended to be called externally, except via declare_drm_ioctls!()
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count,
+    /// i.e. it must be ensured that the reference count of the C `struct drm_device` `ptr` points
+    /// to can't drop to zero, for the duration of this function call and the entire duration when
+    /// the returned reference exists.
+    ///
+    /// Additionally, callers must ensure that the `struct device`, `ptr` is pointing to, is
+    /// embedded in `Self`.
+    #[doc(hidden)]
+    pub unsafe fn as_ref<'a>(ptr: *const bindings::drm_device) -> &'a Self {
+        // SAFETY: By the safety requirements of this function `ptr` is a valid pointer to a
+        // `struct drm_device` embedded in `Self`.
+        let ptr = unsafe { Self::from_drm_device(ptr) };
+
+        // SAFETY: `ptr` is valid by the safety requirements of this function.
+        unsafe { &*ptr.cast() }
+    }
+}
+
+impl<T: drm::Driver> Deref for Device<T> {
+    type Target = T::Data;
+
+    fn deref(&self) -> &Self::Target {
+        &self.data
+    }
+}
+
+// SAFETY: DRM device objects are always reference counted and the get/put functions
+// satisfy the requirements.
+unsafe impl<T: drm::Driver> AlwaysRefCounted for Device<T> {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::drm_dev_get(self.as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::drm_dev_put(obj.cast().as_ptr()) };
+    }
+}
+
+impl<T: drm::Driver> AsRef<device::Device> for Device<T> {
+    fn as_ref(&self) -> &device::Device {
+        // SAFETY: `bindings::drm_device::dev` is valid as long as the DRM device itself is valid,
+        // which is guaranteed by the type invariant.
+        unsafe { device::Device::as_ref((*self.as_raw()).dev) }
+    }
+}
+
+// SAFETY: A `drm::Device` can be released from any thread.
+unsafe impl<T: drm::Driver> Send for Device<T> {}
+
+// SAFETY: A `drm::Device` can be shared among threads because all immutable methods are protected
+// by the synchronization in `struct drm_device`.
+unsafe impl<T: drm::Driver> Sync for Device<T> {}
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 26b72b2eaa63..6d09d1933d3e 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -28,14 +28,12 @@ pub struct DriverInfo {
 ///
 /// See `kernel::drm::gem` and `kernel::drm::gem::shmem`.
 pub struct AllocOps {
-    #[expect(unused)]
     pub(crate) gem_create_object: Option<
         unsafe extern "C" fn(
             dev: *mut bindings::drm_device,
             size: usize,
         ) -> *mut bindings::drm_gem_object,
     >,
-    #[expect(unused)]
     pub(crate) prime_handle_to_fd: Option<
         unsafe extern "C" fn(
             dev: *mut bindings::drm_device,
@@ -45,7 +43,6 @@ pub struct AllocOps {
             prime_fd: *mut core::ffi::c_int,
         ) -> core::ffi::c_int,
     >,
-    #[expect(unused)]
     pub(crate) prime_fd_to_handle: Option<
         unsafe extern "C" fn(
             dev: *mut bindings::drm_device,
@@ -54,14 +51,12 @@ pub struct AllocOps {
             handle: *mut u32,
         ) -> core::ffi::c_int,
     >,
-    #[expect(unused)]
     pub(crate) gem_prime_import: Option<
         unsafe extern "C" fn(
             dev: *mut bindings::drm_device,
             dma_buf: *mut bindings::dma_buf,
         ) -> *mut bindings::drm_gem_object,
     >,
-    #[expect(unused)]
     pub(crate) gem_prime_import_sg_table: Option<
         unsafe extern "C" fn(
             dev: *mut bindings::drm_device,
@@ -69,7 +64,6 @@ pub struct AllocOps {
             sgt: *mut bindings::sg_table,
         ) -> *mut bindings::drm_gem_object,
     >,
-    #[expect(unused)]
     pub(crate) dumb_create: Option<
         unsafe extern "C" fn(
             file_priv: *mut bindings::drm_file,
@@ -77,7 +71,6 @@ pub struct AllocOps {
             args: *mut bindings::drm_mode_create_dumb,
         ) -> core::ffi::c_int,
     >,
-    #[expect(unused)]
     pub(crate) dumb_map_offset: Option<
         unsafe extern "C" fn(
             file_priv: *mut bindings::drm_file,
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 2e3f9a8a9353..967854a2083e 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -2,9 +2,11 @@
 
 //! DRM subsystem abstractions.
 
+pub mod device;
 pub mod driver;
 pub mod ioctl;
 
+pub use self::device::Device;
 pub use self::driver::Driver;
 pub use self::driver::DriverInfo;
 
-- 
2.49.0

