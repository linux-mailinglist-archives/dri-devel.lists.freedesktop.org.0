Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD4A8504E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 01:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2593410EA88;
	Thu, 10 Apr 2025 23:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rY0bDlhG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637B410EA88
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 23:56:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CC96160008;
 Thu, 10 Apr 2025 23:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D3FC4CEE7;
 Thu, 10 Apr 2025 23:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744329387;
 bh=5mOtfrZz6XTA8QNC/eMLpRA4sRn7l0G35uhPgGVBNR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rY0bDlhGnWHSCvj5z4uZM8FSJ3JyDKARYR0roMCxrh3U0QrRn6G9PAHlsoimGYIog
 loXVxhGdFQpUuO2nxXJJtaukmpYW7Yt/lgKzQBcV9LUZFpS79Wmkg0jyx/FKjlMrtO
 z4ABiv/+fut8oS5U7ZE/MEvrzgbIWJhtlUGTKzWWCJ6agxWhOGMsJvlEp3+x3cAGIK
 nqaHGTIbge4hMxsa3qqOFEglGWUH/KvKmdyubqaxNJjYRQ2egA42Gwjkeai3jQwzph
 k1KgX8y+3LuasUSBImdSVwAg9nThFoo4ibz9dBWFU7k9Rac59c7ZureqSWfyDbebJv
 fi059c2+u7A6Q==
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
Subject: [PATCH v2 3/8] rust: drm: add driver abstractions
Date: Fri, 11 Apr 2025 01:55:22 +0200
Message-ID: <20250410235546.43736-4-dakr@kernel.org>
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

Implement the DRM driver abstractions.

The `Driver` trait provides the interface to the actual driver to fill
in the driver specific data, such as the `DriverInfo`, driver features
and IOCTLs.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Asahi Lina <lina@asahilina.net>
[ Remove unnecessary DRM features, add #[expect(unused)] to avoid
  warnings, add sealed trait.
    * original source archive: https://archive.is/Pl9ys

  - Danilo ]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/driver.rs       | 116 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   8 +++
 3 files changed, 125 insertions(+)
 create mode 100644 rust/kernel/drm/driver.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 11b936735207..84921ffbefa7 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,6 +6,7 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/blk-mq.h>
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
new file mode 100644
index 000000000000..26b72b2eaa63
--- /dev/null
+++ b/rust/kernel/drm/driver.rs
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM driver core.
+//!
+//! C header: [`include/linux/drm/drm_drv.h`](srctree/include/linux/drm/drm_drv.h)
+
+use crate::{bindings, drm, str::CStr};
+use macros::vtable;
+
+/// Driver use the GEM memory manager. This should be set for all modern drivers.
+pub const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
+
+/// Information data for a DRM Driver.
+pub struct DriverInfo {
+    /// Driver major version.
+    pub major: i32,
+    /// Driver minor version.
+    pub minor: i32,
+    /// Driver patchlevel version.
+    pub patchlevel: i32,
+    /// Driver name.
+    pub name: &'static CStr,
+    /// Driver description.
+    pub desc: &'static CStr,
+}
+
+/// Internal memory management operation set, normally created by memory managers (e.g. GEM).
+///
+/// See `kernel::drm::gem` and `kernel::drm::gem::shmem`.
+pub struct AllocOps {
+    #[expect(unused)]
+    pub(crate) gem_create_object: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            size: usize,
+        ) -> *mut bindings::drm_gem_object,
+    >,
+    #[expect(unused)]
+    pub(crate) prime_handle_to_fd: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            file_priv: *mut bindings::drm_file,
+            handle: u32,
+            flags: u32,
+            prime_fd: *mut core::ffi::c_int,
+        ) -> core::ffi::c_int,
+    >,
+    #[expect(unused)]
+    pub(crate) prime_fd_to_handle: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            file_priv: *mut bindings::drm_file,
+            prime_fd: core::ffi::c_int,
+            handle: *mut u32,
+        ) -> core::ffi::c_int,
+    >,
+    #[expect(unused)]
+    pub(crate) gem_prime_import: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            dma_buf: *mut bindings::dma_buf,
+        ) -> *mut bindings::drm_gem_object,
+    >,
+    #[expect(unused)]
+    pub(crate) gem_prime_import_sg_table: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            attach: *mut bindings::dma_buf_attachment,
+            sgt: *mut bindings::sg_table,
+        ) -> *mut bindings::drm_gem_object,
+    >,
+    #[expect(unused)]
+    pub(crate) dumb_create: Option<
+        unsafe extern "C" fn(
+            file_priv: *mut bindings::drm_file,
+            dev: *mut bindings::drm_device,
+            args: *mut bindings::drm_mode_create_dumb,
+        ) -> core::ffi::c_int,
+    >,
+    #[expect(unused)]
+    pub(crate) dumb_map_offset: Option<
+        unsafe extern "C" fn(
+            file_priv: *mut bindings::drm_file,
+            dev: *mut bindings::drm_device,
+            handle: u32,
+            offset: *mut u64,
+        ) -> core::ffi::c_int,
+    >,
+}
+
+/// Trait for memory manager implementations. Implemented internally.
+pub trait AllocImpl: super::private::Sealed {
+    /// The C callback operations for this memory manager.
+    const ALLOC_OPS: AllocOps;
+}
+
+/// The DRM `Driver` trait.
+///
+/// This trait must be implemented by drivers in order to create a `struct drm_device` and `struct
+/// drm_driver` to be registered in the DRM subsystem.
+#[vtable]
+pub trait Driver {
+    /// Context data associated with the DRM driver
+    type Data: Sync + Send;
+
+    /// The type used to manage memory for this driver.
+    ///
+    /// Should be either `drm::gem::Object<T>` or `drm::gem::shmem::Object<T>`.
+    type Object: AllocImpl;
+
+    /// Driver metadata
+    const INFO: DriverInfo;
+
+    /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
+    const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 9ec6d7cbcaf3..2e3f9a8a9353 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -2,4 +2,12 @@
 
 //! DRM subsystem abstractions.
 
+pub mod driver;
 pub mod ioctl;
+
+pub use self::driver::Driver;
+pub use self::driver::DriverInfo;
+
+pub(crate) mod private {
+    pub trait Sealed {}
+}
-- 
2.49.0

