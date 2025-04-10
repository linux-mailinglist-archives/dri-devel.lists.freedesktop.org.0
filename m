Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 623FFA85051
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 01:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A895A10EA8A;
	Thu, 10 Apr 2025 23:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jO15wlid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C1D10EA8A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 23:56:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D3FF368449;
 Thu, 10 Apr 2025 23:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D53C4CEDD;
 Thu, 10 Apr 2025 23:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744329401;
 bh=a0htN/ztmUF/8nrqCubtCrAnCy2d9AiGQ/Vr4/78Y2c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jO15wlidyYogBPYGBYaAGSlnaxHEyVPpQ5DR154ap/5ZjitlDM4d2VS9uMgyBSpCe
 2BdFF6Y2G9la35mRiveihkiN26dTBTbEXEmnRd9YDIRBe98ggwipT7UFiGGcj8lvt6
 OuThU5bdU0pmwZwEuB7UIMzdGkaa+Rn4oaJ869Ixu24aEvCT0qQE16PDs09eP89Qsg
 AYOi4c3m6A5VED4/DylhU9++McLcq0lLpzLNN4g5vRyEO0X3Kx32SMgpwfCCBr+TLM
 2HseJSR9NC4u7iKtdgk+EXFzsWVRR6oWK+1Ek/WpMknwcKREXWjtifeIbs/NGXWbxu
 732F3aLWayxOQ==
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
Subject: [PATCH v2 6/8] rust: drm: file: Add File abstraction
Date: Fri, 11 Apr 2025 01:55:25 +0200
Message-ID: <20250410235546.43736-7-dakr@kernel.org>
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

A DRM File is the DRM counterpart to a kernel file structure,
representing an open DRM file descriptor.

Add a Rust abstraction to allow drivers to implement their own File types
that implement the DriverFile trait.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Asahi Lina <lina@asahilina.net>
[ Rework of drm::File
    * switch to the Opaque<T> type
    * fix (mutable) references to struct drm_file (which in this context
      is UB)
    * restructure and rename functions to align with common kernel
      schemes
    * write and fix safety and invariant comments
    * remove necessity for and convert 'as' casts
    * original source archive: https://archive.is/GH8oy

  - Danilo ]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/drm/device.rs       |  4 +-
 rust/kernel/drm/driver.rs       |  3 +
 rust/kernel/drm/file.rs         | 99 +++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |  2 +
 5 files changed, 107 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/drm/file.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 1dd7100c1cff..e39fb4210710 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -8,6 +8,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/blk-mq.h>
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index c5433d314409..f7d7abf83fa4 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -58,8 +58,8 @@ pub struct Device<T: drm::Driver> {
 impl<T: drm::Driver> Device<T> {
     const VTABLE: bindings::drm_driver = drm_legacy_fields! {
         load: None,
-        open: None, // TODO: File abstraction
-        postclose: None, // TODO: File abstraction
+        open: Some(drm::File::<T::File>::open_callback),
+        postclose: Some(drm::File::<T::File>::postclose_callback),
         unload: None,
         release: None,
         master_set: None,
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 96bb287eada2..24c2225b5d28 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -109,6 +109,9 @@ pub trait Driver {
     /// Should be either `drm::gem::Object<T>` or `drm::gem::shmem::Object<T>`.
     type Object: AllocImpl;
 
+    /// The type used to represent a DRM File (client)
+    type File: drm::file::DriverFile;
+
     /// Driver metadata
     const INFO: DriverInfo;
 
diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
new file mode 100644
index 000000000000..3b97728f03e0
--- /dev/null
+++ b/rust/kernel/drm/file.rs
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM File objects.
+//!
+//! C header: [`include/linux/drm/drm_file.h`](srctree/include/linux/drm/drm_file.h)
+
+use crate::{bindings, drm, error::Result, prelude::*, types::Opaque};
+use core::marker::PhantomData;
+use core::pin::Pin;
+
+/// Trait that must be implemented by DRM drivers to represent a DRM File (a client instance).
+pub trait DriverFile {
+    /// The parent `Driver` implementation for this `DriverFile`.
+    type Driver: drm::Driver;
+
+    /// Open a new file (called when a client opens the DRM device).
+    fn open(device: &drm::Device<Self::Driver>) -> Result<Pin<KBox<Self>>>;
+}
+
+/// An open DRM File.
+///
+/// # Invariants
+///
+/// `self.0` is always a valid pointer to an open `struct drm_file`.
+#[repr(transparent)]
+pub struct File<T: DriverFile>(Opaque<bindings::drm_file>, PhantomData<T>);
+
+impl<T: DriverFile> File<T> {
+    #[doc(hidden)]
+    /// Not intended to be called externally, except via declare_drm_ioctls!()
+    ///
+    /// # Safety
+    ///
+    /// `raw_file` must be a valid pointer to an open `struct drm_file`, opened through `T::open`.
+    pub unsafe fn as_ref<'a>(ptr: *mut bindings::drm_file) -> &'a File<T> {
+        // SAFETY: `raw_file` is valid by the safety requirements of this function.
+        unsafe { &*ptr.cast() }
+    }
+
+    pub(super) fn as_raw(&self) -> *mut bindings::drm_file {
+        self.0.get()
+    }
+
+    fn driver_priv(&self) -> *mut T {
+        // SAFETY: By the type invariants of `Self`, `self.as_raw()` is always valid.
+        unsafe { (*self.as_raw()).driver_priv }.cast()
+    }
+
+    /// Return a pinned reference to the driver file structure.
+    pub fn inner(&self) -> Pin<&T> {
+        // SAFETY: By the type invariant the pointer `self.as_raw()` points to a valid and opened
+        // `struct drm_file`, hence `driver_priv` has been properly initialized by `open_callback`.
+        unsafe { Pin::new_unchecked(&*(self.driver_priv())) }
+    }
+
+    /// The open callback of a `struct drm_file`.
+    pub(crate) extern "C" fn open_callback(
+        raw_dev: *mut bindings::drm_device,
+        raw_file: *mut bindings::drm_file,
+    ) -> core::ffi::c_int {
+        // SAFETY: A callback from `struct drm_driver::open` guarantees that
+        // - `raw_dev` is valid pointer to a `sturct drm_device`,
+        // - the corresponding `sturct drm_device` has been registered.
+        let drm = unsafe { drm::Device::as_ref(raw_dev) };
+
+        // SAFETY: `raw_file` valid pointer to a `struct drm_file`.
+        let file = unsafe { File::<T>::as_ref(raw_file) };
+
+        let inner = match T::open(drm) {
+            Err(e) => {
+                return e.to_errno();
+            }
+            Ok(i) => i,
+        };
+
+        // SAFETY: This pointer is treated as pinned, and the Drop guarantee is upheld in
+        // `postclose_callback()`.
+        let driver_priv = KBox::into_raw(unsafe { Pin::into_inner_unchecked(inner) });
+
+        // SAFETY: By the type invariants of `Self`, `self.as_raw()` is always valid.
+        unsafe { (*file.as_raw()).driver_priv = driver_priv.cast() };
+
+        0
+    }
+
+    /// The postclose callback of a `struct drm_file`.
+    pub(crate) extern "C" fn postclose_callback(
+        _raw_dev: *mut bindings::drm_device,
+        raw_file: *mut bindings::drm_file,
+    ) {
+        // SAFETY: This reference won't escape this function
+        let file = unsafe { File::<T>::as_ref(raw_file) };
+
+        // SAFETY: `file.driver_priv` has been created in `open_callback` through `KBox::into_raw`.
+        let _ = unsafe { KBox::from_raw(file.driver_priv()) };
+    }
+}
+
+impl<T: DriverFile> super::private::Sealed for File<T> {}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 2d88e70ba607..b36223e5bd98 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -4,12 +4,14 @@
 
 pub mod device;
 pub mod driver;
+pub mod file;
 pub mod ioctl;
 
 pub use self::device::Device;
 pub use self::driver::Driver;
 pub use self::driver::DriverInfo;
 pub use self::driver::Registration;
+pub use self::file::File;
 
 pub(crate) mod private {
     pub trait Sealed {}
-- 
2.49.0

