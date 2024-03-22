Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826F88874C4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 23:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC3511282E;
	Fri, 22 Mar 2024 22:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="edPEkYa4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5B711282F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 22:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711145707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wB343G/URjvp9S/F5TMB5/43KB5zndfAK18UMcVICOA=;
 b=edPEkYa43sVcORYu7JQwEYSp8NycUVgbzxURnqO6EzLEu8yINksmtNX2aObDtYAdBNdzt/
 wB/waICbbl09FtgJLUgwMqKvTIFDKVeAjQf6x7fmNHj2iCIUhWqQk4kaCtZrrrZI+KFgAR
 VLYnE31chdOMOVcMnwjbZFTyuStDxx0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-7FBJ-4FAOeW-Wk7awtYhhQ-1; Fri, 22 Mar 2024 18:15:02 -0400
X-MC-Unique: 7FBJ-4FAOeW-Wk7awtYhhQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3B888007AF;
 Fri, 22 Mar 2024 22:15:01 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.8.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CE928173;
 Fri, 22 Mar 2024 22:15:00 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Asahi Lina <lina@asahilina.net>,
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org (open list),
 rust-for-linux@vger.kernel.org (open list:RUST)
Subject: [PATCH 1/4] WIP: rust: Add basic KMS bindings
Date: Fri, 22 Mar 2024 18:03:33 -0400
Message-ID: <20240322221305.1403600-2-lyude@redhat.com>
In-Reply-To: <20240322221305.1403600-1-lyude@redhat.com>
References: <20240322221305.1403600-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/bindings/bindings_helper.h  |   4 +
 rust/helpers.c                   |  17 ++
 rust/kernel/drm/device.rs        |   2 +
 rust/kernel/drm/drv.rs           | 115 +++++++--
 rust/kernel/drm/kms.rs           | 146 +++++++++++
 rust/kernel/drm/kms/connector.rs | 404 +++++++++++++++++++++++++++++++
 rust/kernel/drm/kms/crtc.rs      | 300 +++++++++++++++++++++++
 rust/kernel/drm/kms/encoder.rs   | 175 +++++++++++++
 rust/kernel/drm/kms/plane.rs     | 300 +++++++++++++++++++++++
 rust/kernel/drm/mod.rs           |   1 +
 10 files changed, 1448 insertions(+), 16 deletions(-)
 create mode 100644 rust/kernel/drm/kms.rs
 create mode 100644 rust/kernel/drm/kms/connector.rs
 create mode 100644 rust/kernel/drm/kms/crtc.rs
 create mode 100644 rust/kernel/drm/kms/encoder.rs
 create mode 100644 rust/kernel/drm/kms/plane.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a712efecdb1a9..5856afbe6e8f6 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,12 +6,16 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_probe_helper.h>
 #include <kunit/test.h>
 #include <linux/device.h>
 #include <linux/dma-resv.h>
diff --git a/rust/helpers.c b/rust/helpers.c
index 69fc66164c785..bf9b299f4597f 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -20,6 +20,7 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_connector.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <kunit/test-bug.h>
@@ -284,6 +285,22 @@ int rust_helper_drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct vm_
 EXPORT_SYMBOL_GPL(rust_helper_drm_gem_shmem_object_mmap);
 
 #endif
+
+#ifdef CONFIG_DRM_KMS_HELPER
+
+void rust_helper_drm_connector_get(struct drm_connector *connector)
+{
+	drm_connector_get(connector);
+}
+EXPORT_SYMBOL_GPL(rust_helper_drm_connector_get);
+
+void rust_helper_drm_connector_put(struct drm_connector *connector)
+{
+	drm_connector_put(connector);
+}
+EXPORT_SYMBOL_GPL(rust_helper_drm_connector_put);
+
+#endif /* CONFIG_DRM_KMS_HELPER */
 #endif
 
 void rust_helper_pci_set_drvdata(struct pci_dev *pdev, void *data)
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 6176e2e879d0b..07bc8ed50eae0 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -20,6 +20,8 @@ pub struct Device<T: drm::drv::Driver> {
 }
 
 impl<T: drm::drv::Driver> Device<T> {
+    pub const HAS_KMS: bool = T::FEATURES & drm::drv::FEAT_MODESET != 0;
+
     #[allow(dead_code, clippy::mut_from_ref)]
     pub(crate) unsafe fn raw_mut(&self) -> &mut bindings::drm_device {
         unsafe { &mut *self.drm.get() }
diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
index fa9ce64a5080c..308f0a117f546 100644
--- a/rust/kernel/drm/drv.rs
+++ b/rust/kernel/drm/drv.rs
@@ -5,9 +5,13 @@
 //! C header: [`include/linux/drm/drm_drv.h`](../../../../include/linux/drm/drm_drv.h)
 
 use crate::{
-    bindings, device, drm,
+    bindings, device,
+    drm::{
+        self,
+        kms,
+    },
     error::code::*,
-    error::from_err_ptr,
+    error::{from_err_ptr, to_result},
     error::{Error, Result},
     prelude::*,
     private::Sealed,
@@ -15,6 +19,7 @@
     types::{ARef, ForeignOwnable},
     ThisModule,
     sync::Arc,
+    init::Zeroable,
 };
 use core::{
     marker::{PhantomData, PhantomPinned},
@@ -150,7 +155,11 @@ pub trait Driver {
 /// The struct which contains both the driver's fops and vtable
 ///
 /// These live in the same structure since it needs to be self-referential, so having them in their
-/// own structure allows us to pin this struct without pinning the [`Registration`] object
+/// own structure allows us to pin this struct without pinning the [`Registration`] object.
+///
+/// Drivers should not need to create this structure themselves, as it will be created for them by
+/// DRM. As well: this object is a temporary holdover until we can generate the DRM fops and vtable
+/// in a const function (which should be possible once const mem::zeroed becomes stable).
 #[pin_data]
 pub struct DriverOps {
     #[pin]
@@ -225,8 +234,10 @@ macro_rules! drm_legacy_fields {
 #[allow(clippy::crate_in_macro_def)]
 #[macro_export]
 macro_rules! new_drm_registration {
-    ($type:ty, $parent:expr) => {{
-        $crate::drm::drv::Registration::<$type>::new($parent, &crate::THIS_MODULE)
+    ($type:ty, $parent:expr, $mode_config_info:expr) => {{
+        $crate::drm::drv::Registration::<$type>::new(
+            $parent, $mode_config_info, &crate::THIS_MODULE
+        )
     }};
 }
 
@@ -249,6 +260,8 @@ pub struct RegistrationInfo<T: Driver> {
     drm: ARef<drm::device::Device<T>>,
 }
 
+unsafe impl Zeroable for bindings::drm_mode_config { }
+
 impl<T: Driver> Registration<T> {
     const VTABLE: bindings::drm_driver = drm_legacy_fields! {
         load: None,
@@ -282,28 +295,89 @@ impl<T: Driver> Registration<T> {
         fops: core::ptr::null_mut(),
     };
 
+    const KMS_VTABLE: bindings::drm_mode_config_funcs = bindings::drm_mode_config_funcs {
+        atomic_check: None, // TODO
+        // TODO TODO: There are other possibilities then this function, but we need
+        // to write up more bindings before we can support those
+        fb_create: Some(bindings::drm_gem_fb_create),
+        mode_valid: None, // TODO
+        atomic_commit: Some(bindings::drm_atomic_helper_commit),
+        get_format_info: None,
+        atomic_state_free: None,
+        atomic_state_alloc: None,
+        atomic_state_clear: None,
+        output_poll_changed: None,
+    };
+
+    const KMS_HELPER_VTABLE: bindings::drm_mode_config_helper_funcs =
+        bindings::drm_mode_config_helper_funcs {
+            atomic_commit_setup: None, // TODO
+            atomic_commit_tail: None, // TODO
+        };
+
+    pub const HAS_KMS: bool = T::FEATURES & FEAT_MODESET != 0;
+
     /// Creates a new [`Registration`] but does not register it yet.
     ///
-    /// It is allowed to move.
-    /// XXX: Write up a macro for calling this, since we now handle as much init here as possible to
-    /// avoid having to handle it after we've moved away the Registration object
+    /// It is allowed to move. Note that `mode_confg_info` must be provided for a device to be
+    /// initialized with KMS.
     pub fn new(
         parent: &dyn device::RawDevice,
+        mode_config_info: Option<drm::kms::ModeConfigInfo>,
         module: &'static ThisModule,
     ) -> Result<Self> {
-        let registered = Arc::try_new(AtomicBool::new(false))?;
-        let ops = DriverOps::try_new(Self::VTABLE, module)?;
+        // mode_config_info must be passed for KMS drivers. We do this check up here so we don't
+        // have to worry about leaking raw_drm
+        // XXX: Would love to know a way to do this at compile-time instead…
+        if Self::HAS_KMS != mode_config_info.is_some() {
+            parent.pr_err(
+                if Self::HAS_KMS {
+                    format_args!("KMS drivers must specify mode_config_info for new devices")
+                } else {
+                    format_args!("mode_config_info is only for KMS drivers (see drm::drv::Driver::FEATURES)")
+                }
+            );
 
-        let raw_drm = unsafe { bindings::drm_dev_alloc(&ops.vtable, parent.raw_device()) };
-        if T::FEATURES & FEAT_MODESET != 0 {
-            unsafe { bindings::drmm_mode_config_init(raw_drm) };
+            return Err(EINVAL);
         }
 
-        let raw_drm = NonNull::new(from_err_ptr(raw_drm)? as *mut _).ok_or(ENOMEM)?;
+        let registered = Arc::try_new(AtomicBool::new(false))?;
+        let ops = DriverOps::try_new(Self::VTABLE, module)?;
+
+        // SAFETY: FFI call with no special requirements
+        let raw_drm: NonNull<Self> =
+            from_err_ptr(unsafe { bindings::drm_dev_alloc(&ops.vtable, parent.raw_device()) })
+            .and_then(|p| NonNull::new(p).ok_or(ENOMEM))?
+            .cast();
 
         // The reference count is one, and now we take ownership of that reference as a
         // drm::device::Device.
-        let drm = unsafe { ARef::from_raw(raw_drm) };
+        let drm: ARef<drm::device::Device<T>> = unsafe { ARef::from_raw(raw_drm.cast()) };
+
+        // Finally, setup KMS - we do this at the end to avoid leaking raw_drm if something fails
+        if Self::HAS_KMS {
+            // SAFETY: We made sure at the start of this function that mode_config_info is Some
+            let mode_config_info = unsafe { mode_config_info.unwrap_unchecked() };
+
+            // SAFETY: We just allocated the device, and it's safe to zero-initialize this
+            unsafe {
+                (*drm.drm.get()).mode_config = bindings::drm_mode_config {
+                    funcs: &Self::KMS_VTABLE,
+                    helper_private: &Self::KMS_HELPER_VTABLE,
+                    min_width: mode_config_info.min_resolution.0,
+                    min_height: mode_config_info.min_resolution.1,
+                    max_width: mode_config_info.max_resolution.0,
+                    max_height: mode_config_info.max_resolution.1,
+                    cursor_width: mode_config_info.max_cursor.0,
+                    cursor_height: mode_config_info.max_cursor.1,
+                    preferred_depth: mode_config_info.preferred_depth,
+                    ..Default::default()
+                }
+            };
+
+            // SAFETY: FFI call with no special requirements
+            unsafe { to_result(bindings::drmm_mode_config_init(drm.drm.get())) }?;
+        }
 
         Ok(Self {
             drm,
@@ -324,6 +398,8 @@ pub fn registration_info(&self) -> RegistrationInfo<T> {
 
     /// Registers a DRM device with the rest of the kernel.
     ///
+    /// For KMS drivers, this also calls `bindings::drm_mode_config_reset()` before registration.
+    ///
     /// Users are encouraged to use the [`drm_device_register!()`] macro because it automatically
     /// picks up the current module.
     pub fn register(
@@ -390,7 +466,14 @@ fn drop(&mut self) {
             let data_pointer = unsafe { self.drm.raw_mut().dev_private };
 
             // SAFETY: Since `registered` is true, `self.drm` is both valid and registered.
-            unsafe { bindings::drm_dev_unregister(self.drm.raw_mut()) };
+            unsafe {
+                let raw_drm = self.drm.raw_mut();
+
+                bindings::drm_dev_unregister(raw_drm);
+                if Self::HAS_KMS {
+                    bindings::drm_atomic_helper_shutdown(raw_drm);
+                }
+            };
 
             // Free data as well.
             // SAFETY: `data_pointer` was returned by `into_foreign` during registration.
diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
new file mode 100644
index 0000000000000..b55d14415367a
--- /dev/null
+++ b/rust/kernel/drm/kms.rs
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! KMS driver abstractions for rust.
+
+pub mod connector;
+pub mod crtc;
+pub mod encoder;
+pub mod plane;
+
+use crate::{
+    drm::{drv, device::Device},
+    prelude::*,
+    types::ARef,
+    private::Sealed
+};
+use core::{
+    ops::Deref,
+    ptr,
+};
+use bindings;
+
+#[derive(Copy, Clone)]
+pub struct ModeConfigInfo {
+    /// The minimum (w, h) resolution this driver can support
+    pub min_resolution: (i32, i32),
+    /// The maximum (w, h) resolution this driver can support
+    pub max_resolution: (i32, i32),
+    /// The maximum (w, h) cursor size this driver can support
+    pub max_cursor: (u32, u32),
+    /// The preferred depth for dumb ioctls
+    pub preferred_depth: u32,
+}
+
+// TODO: I am not totally sure about this. Ideally, I'd like a nice way of hiding KMS-specific
+// functions for DRM drivers which don't implement KMS - so that we don't have to have a bunch of
+// random modesetting functions all over the DRM device trait. But, unfortunately I don't know of
+// any nice way of doing that yet :(
+
+/// An atomic KMS driver implementation
+pub trait KmsDriver: drv::Driver { }
+
+impl<T: KmsDriver> Device<T> {
+    pub fn mode_config_reset(&self) {
+        // SAFETY: The previous build assertion ensures this can only be called for devices with KMS
+        // support, which means mode_config is initialized
+        unsafe { bindings::drm_mode_config_reset(self.drm.get()) }
+    }
+}
+
+/// Main trait for a modesetting object in DRM
+pub trait ModeObject: Sealed + Send + Sync {
+    /// The parent driver for this ModeObject
+    type Driver: KmsDriver;
+
+    /// Return the `drv::Device` for this `ModeObject`
+    fn drm_dev(&self) -> &Device<Self::Driver>;
+}
+
+/// A trait for modesetting objects which don't come with their own reference-counting.
+///
+/// Objects without a reference count share the lifetime of their parent DRM device
+///
+/// SAFETY: This trait must not be implemented for modesetting objects which have a refcount
+/// already, as otherwise `KmsRef` can't safely guarantee the object will stay alive.
+pub unsafe trait StaticModeObject: ModeObject {}
+
+/// An owned reference to a non-reference counted modesetting object.
+///
+/// In KMS: some modesetting objects aren't reference counted and instead share the drm device's
+/// lifetime. In order to allow rust drivers access to "owned" references to objects which are
+/// guaranteed to remain valid, we provide a smart-pointer that holds both a pointer to the
+/// modesetting object, and an owned refcount from its owning device - ensuring that the object
+/// remains valid for as long as this reference exists.
+pub struct KmsRef<T: StaticModeObject> {
+    dev: ARef<Device<T::Driver>>,
+    object: *const T,
+}
+
+// SAFETY: Owned references to DRM device are thread-safe, and object will survive as long as we
+// have said owned references
+unsafe impl<T: StaticModeObject> Send for KmsRef<T> {}
+unsafe impl<T: StaticModeObject> Sync for KmsRef<T> {}
+
+impl<T: StaticModeObject> From<&T> for KmsRef<T> {
+    fn from(value: &T) -> Self {
+        Self {
+            dev: value.drm_dev().into(),
+            object: value,
+        }
+    }
+}
+
+impl<T: StaticModeObject> Deref for KmsRef<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: We're guaranteed object will point to a valid object as long as we hold dev
+        unsafe { &(*self.object) }
+    }
+}
+
+impl<T: StaticModeObject> Clone for KmsRef<T> {
+    fn clone(&self) -> Self {
+        Self {
+            dev: self.dev.clone(),
+            object: self.object
+        }
+    }
+}
+
+/// A mode config guard.
+///
+/// This is an exclusive primitive that represents when `bindings::drm_device.mode_config.lock` is
+/// held - as some modesetting operations (particularly ones related to connectors) are still
+/// protected under this single lock. So long as this object is held, it is guaranteed that the lock
+/// is held.
+pub struct ModeConfigGuard<'a, T: KmsDriver> {
+    owner: &'a Device<T>,
+    owned: bool,
+}
+
+impl<'a, T: KmsDriver> ModeConfigGuard<'a, T> {
+    /// Create a "borrowed" mode config guard.
+    ///
+    /// This is primarily for situations in the DRM bindings where we know that the mode_config lock
+    /// is held, but we aren't the ones who initially acquired it. Dropping this mode config guard
+    /// is a no-op.
+    ///
+    /// SAFETY: The caller must ensure that the mode_config lock is acquired throughout the lifetime
+    /// of this object.
+    unsafe fn new_borrowed(dev: &'a Device<T>) -> Self {
+        Self {
+            owner: dev,
+            owned: false,
+        }
+    }
+
+    /// Assert that the given device is the owner of this mode config guard.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `dev` is different from the owning device for this mode config guard.
+    pub(crate) fn assert_owner(&self, dev: &Device<T>) {
+        assert!(ptr::eq(self.owner, dev))
+    }
+}
diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
new file mode 100644
index 0000000000000..88dfa946d306b
--- /dev/null
+++ b/rust/kernel/drm/kms/connector.rs
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! Rust bindings for DRM connectors
+
+use crate::{
+    bindings,
+    sync::ArcBorrow,
+    drm::{
+        drv::{Driver, FEAT_MODESET},
+        device::Device,
+    },
+    types::{AlwaysRefCounted, Opaque, ARef},
+    prelude::*,
+    init::Zeroable,
+    error::{to_result, from_result},
+    build_error,
+};
+use core::{
+    marker::PhantomPinned,
+    ptr::null_mut,
+    mem,
+    ptr::{self, NonNull},
+    ffi::*,
+    ops::Deref,
+};
+use super::{
+    ModeObject,
+    ModeConfigGuard,
+    encoder::{Encoder, DriverEncoder},
+    KmsDriver,
+};
+use macros::pin_data;
+
+// XXX: This is :\, figure out a better way at some point?
+pub use bindings::{
+    DRM_MODE_CONNECTOR_Unknown,
+    DRM_MODE_CONNECTOR_VGA,
+    DRM_MODE_CONNECTOR_DVII,
+    DRM_MODE_CONNECTOR_DVID,
+    DRM_MODE_CONNECTOR_DVIA,
+    DRM_MODE_CONNECTOR_Composite,
+    DRM_MODE_CONNECTOR_SVIDEO,
+    DRM_MODE_CONNECTOR_LVDS,
+    DRM_MODE_CONNECTOR_Component,
+    DRM_MODE_CONNECTOR_9PinDIN,
+    DRM_MODE_CONNECTOR_DisplayPort,
+    DRM_MODE_CONNECTOR_HDMIA,
+    DRM_MODE_CONNECTOR_HDMIB,
+    DRM_MODE_CONNECTOR_TV,
+    DRM_MODE_CONNECTOR_eDP,
+    DRM_MODE_CONNECTOR_VIRTUAL,
+    DRM_MODE_CONNECTOR_DSI,
+    DRM_MODE_CONNECTOR_DPI,
+    DRM_MODE_CONNECTOR_WRITEBACK,
+    DRM_MODE_CONNECTOR_SPI,
+    DRM_MODE_CONNECTOR_USB,
+};
+
+/// A DRM connector implementation
+pub trait DriverConnector: Send + Sync + Sized {
+    /// The return type of the new() function. Should be `impl PinInit<Self, Error>`.
+    /// TODO: Remove this when return_position_impl_trait_in_trait is stable.
+    type Initializer: PinInit<Self, Error>;
+
+    /// The data type to use for passing incoming arguments for new `Connector<T>` instances
+    /// Drivers which don't care about this can just use `()`
+    type Args;
+
+    /// The parent driver for this DRM connector implementation
+    type Driver: KmsDriver;
+
+    /// The atomic state implementation for this DRM connector implementation
+    type State: DriverConnectorState;
+
+    /// Create a new instance of the private driver data struct for this connector in-place
+    fn new(dev: &Device<Self::Driver>, args: Self::Args) -> Self::Initializer;
+
+    /// Retrieve a list of available display modes for this connector
+    fn get_modes<'a>(
+        connector: ConnectorGuard<'a, Self>,
+        guard: &ModeConfigGuard<'a, Self::Driver>
+    ) -> i32;
+}
+
+/// A DRM connector
+#[repr(C)]
+#[pin_data]
+pub struct Connector<T: DriverConnector> {
+    connector: Opaque<bindings::drm_connector>,
+    #[pin]
+    inner: T,
+    #[pin]
+    _p: PhantomPinned
+}
+
+impl<T: DriverConnector> crate::private::Sealed for Connector<T> { }
+
+// SAFETY: DRM expects this struct to be zero-initialized
+unsafe impl Zeroable for bindings::drm_connector { }
+
+// SAFETY: Connector.connector is not exposed to users by default, and our accessors ensure we only
+// perform thread-safe operations for this object
+unsafe impl<T: DriverConnector> Send for Connector<T> { }
+unsafe impl<T: DriverConnector> Sync for Connector<T> { }
+
+unsafe impl<T: DriverConnector> AlwaysRefCounted for Connector<T> {
+    fn inc_ref(&self) {
+        unsafe { bindings::drm_connector_get(self.raw_mut_ptr()) }
+    }
+
+    unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
+        unsafe { bindings::drm_connector_put(obj.as_ref().raw_mut_ptr()) }
+    }
+}
+
+impl<T: DriverConnector> Deref for Connector<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+impl<T: DriverConnector> ModeObject for Connector<T> {
+    type Driver = T::Driver;
+
+    fn drm_dev(&self) -> &Device<Self::Driver> {
+        // SAFETY: DRM connectors exist for as long as the device does, so this pointer is always
+        // valid
+        unsafe { &*((*self.raw_mut_ptr()).dev.cast()) }
+    }
+}
+
+impl<T: DriverConnector> Connector<T> {
+    const FUNCS: bindings::drm_connector_funcs = bindings::drm_connector_funcs {
+        dpms: None,
+        atomic_get_property: None,
+        atomic_set_property: None,
+        early_unregister: None,
+        late_register: None,
+        set_property: None,
+        reset: Some(connector_reset_callback::<T::State>),
+        atomic_print_state: None,
+        atomic_destroy_state: Some(atomic_destroy_state_callback::<T::State>),
+        destroy: Some(connector_destroy_callback::<T>),
+        force: None,
+        detect: None,
+        fill_modes: Some(bindings::drm_helper_probe_single_connector_modes),
+        debugfs_init: None,
+        oob_hotplug_event: None,
+        atomic_duplicate_state: Some(atomic_duplicate_state_callback::<T::State>),
+    };
+
+    const HELPER_FUNCS: bindings::drm_connector_helper_funcs = bindings::drm_connector_helper_funcs {
+        mode_valid: None,
+        atomic_check: None,
+        get_modes: Some(get_modes_callback::<T>),
+        detect_ctx: None,
+        enable_hpd: None,
+        disable_hpd: None,
+        best_encoder: None,
+        atomic_commit: None,
+        mode_valid_ctx: None,
+        atomic_best_encoder: None,
+        prepare_writeback_job: None,
+        cleanup_writeback_job: None,
+    };
+
+    pub fn new(
+        dev: &Device<T::Driver>,
+        type_: u32,
+        args: T::Args,
+    ) -> Result<ARef<Self>> {
+        let new: Pin<Box<Self>> = Box::try_pin_init(try_pin_init!(Self {
+            connector: Opaque::new(bindings::drm_connector {
+                helper_private: &Self::HELPER_FUNCS,
+                ..Default::default()
+            }),
+            inner <- T::new(dev, args),
+            _p: PhantomPinned
+        }))?;
+
+        // SAFETY: FFI call with no special safety requirements
+        to_result(unsafe {
+            bindings::drm_connector_init(
+                dev.drm.get(),
+                new.raw_mut_ptr(),
+                &Self::FUNCS,
+                type_ as i32
+            )
+        })?;
+
+        // Convert the connector into an ARef so the caller has proper ownership over a refcount to
+        // it. Also, the Box we consume here will be reconstructed in connector_destroy_callback()
+        // once the connector's refcount drops to zero.
+        // SAFETY: We currently hold ownership of the Box containing the connector and it's
+        // refcount. As well, this operation will not move the contents of the Box.
+        Ok(unsafe {
+            ARef::from_raw(NonNull::new_unchecked(Box::into_raw(Pin::into_inner_unchecked(new))))
+        })
+    }
+
+    pub(super) unsafe fn raw_mut_ptr(&self) -> *mut bindings::drm_connector {
+        self.connector.get()
+    }
+
+    pub(super) unsafe fn from_raw_ptr<'a>(ptr: *const bindings::drm_connector) -> &'a Self {
+        unsafe { &*(ptr as *mut Self) }
+    }
+
+    /// Acquire a `ConnectorGuard` for this connector from a `ModeConfigGuard`.
+    ///
+    /// This verifies using the provided reference that the given guard is actually for the same
+    /// device as this connector's parent.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `guard` is not a mode config guard for this connector's parent DRM device
+    pub fn guard<'a>(&'a self, guard: &ModeConfigGuard<'a, T::Driver>) -> ConnectorGuard<'a, T> {
+        guard.assert_owner(self.drm_dev());
+        ConnectorGuard { connector: self }
+    }
+
+    /// Attach an encoder to this connector, this should only be done before registration
+    #[must_use]
+    pub fn attach_encoder<E: DriverEncoder>(&self, encoder: &Encoder<E>) -> Result {
+        // SAFETY: FFI call with no special requirements
+        to_result(unsafe {
+            bindings::drm_connector_attach_encoder(self.raw_mut_ptr(), encoder.raw_mut_ptr())
+        })
+    }
+}
+
+unsafe extern "C" fn connector_destroy_callback<T: DriverConnector>(
+    connector: *mut bindings::drm_connector,
+) {
+    // SAFETY: Connector has to point to a valid drm_connector, as its function table is the only
+    // existing entrypoint to this function
+    unsafe {
+        bindings::drm_connector_unregister(connector);
+        bindings::drm_connector_cleanup(connector);
+    };
+
+    // SAFETY: We always create connectors in boxes, and since we are running from this connector's
+    // destructor we are guaranteed to have the last remaining reference. Furthermore, we're
+    // guaranteed by type invariance that the contents of the box are of type Connector<T>.
+    unsafe { drop(Box::from_raw(connector as *mut Connector<T>)) };
+}
+
+unsafe extern "C" fn get_modes_callback<T: DriverConnector>(
+    connector: *mut bindings::drm_connector,
+) -> c_int {
+    // SAFETY: We're guaranteed by type invariants that connector is of type Connector<T>, and
+    // connector must point to a valid instance of Connector<T> as it's the only entry-point to this
+    // callback.
+    let connector = unsafe { Connector::<T>::from_raw_ptr(connector) };
+
+    // SAFETY: This FFI callback is only called while the mode config lock is held
+    let guard = unsafe { ModeConfigGuard::new_borrowed(connector.drm_dev()) };
+
+    T::get_modes(connector.guard(&guard), &guard)
+}
+
+/// A privileged smart-pointer for `Connector<T>` which proves that the owner currently is protected
+/// under the `bindings::drm_device.mode_config.mutex` lock and provides access to data and methods
+/// protected under said lock.
+#[derive(Copy, Clone)]
+pub struct ConnectorGuard<'a, T: DriverConnector> {
+    connector: &'a Connector<T>,
+}
+
+impl<T: DriverConnector> Deref for ConnectorGuard<'_, T> {
+    type Target = Connector<T>;
+
+    fn deref(&self) -> &Self::Target {
+        self.connector
+    }
+}
+
+impl<'a, T: DriverConnector> ConnectorGuard<'a, T> {
+    pub fn add_modes_noedid(&self, (max_h, max_v): (i32, i32)) -> i32 {
+        unsafe { bindings::drm_add_modes_noedid(self.raw_mut_ptr(), max_h, max_v) }
+    }
+
+    pub fn set_preferred_mode(&self, (h_pref, w_pref): (i32, i32)) {
+        unsafe { bindings::drm_set_preferred_mode(self.raw_mut_ptr(), h_pref, w_pref) }
+    }
+}
+
+#[derive(Default)]
+#[repr(C)]
+pub struct ConnectorState<T: DriverConnectorState> {
+    state: bindings::drm_connector_state,
+    inner: T,
+}
+
+/// The trait for a driver's atomic DRM connector state
+pub trait DriverConnectorState: Clone + Default + Sized {
+    type Connector: DriverConnector;
+}
+
+impl<T: DriverConnectorState> ConnectorState<T> {
+    /// Consume this struct without dropping it, and return a pointer to its base
+    /// `drm_connector_state` which can be handed off to DRM.
+    fn into_raw(self: Box<Self>) -> *mut bindings::drm_connector_state {
+        let this = Box::into_raw(self);
+
+        unsafe { &mut (*this).state }
+    }
+
+    /// Consume a raw pointer and recover the original `Box<ConnectorState<T>>`
+    ///
+    /// SAFETY: Callers must ensure that ptr contains a valid instance of `ConnectorState<T>`
+    unsafe fn from_raw(ptr: *mut bindings::drm_connector_state) -> Box<Self> {
+        unsafe { Box::from_raw(ptr as *mut _) }
+    }
+
+    /// Obtain a reference back to the `ConnectorState<T>`
+    ///
+    /// SAFETY: Callers must ensure that ptr contains a valid instance of `ConnectorState<T>`.
+    unsafe fn as_ref<'a>(ptr: *const bindings::drm_connector_state) -> &'a Self {
+        unsafe { &*(ptr as *const _) }
+    }
+
+    /// Obtain a mutable reference back to the ConnectorState<T>
+    ///
+    /// SAFETY: Callers must ensure that ptr contains a valid instance of `ConnectorState<T>`, and
+    /// that no other references to this `ConnectorState<T>` exist for the lifetime of this
+    /// reference
+    unsafe fn as_mut_ref<'a>(ptr: *mut bindings::drm_connector_state) -> &'a mut Self {
+        unsafe { &mut *(ptr as *mut _) }
+    }
+
+    /// Obtain a mutable pointer to the base connector state, for use in FFI calls
+    unsafe fn as_mut_ptr(&mut self) -> *mut bindings::drm_connector_state {
+        &mut self.state
+    }
+}
+
+unsafe impl Zeroable for bindings::drm_connector_state {}
+
+unsafe extern "C" fn atomic_duplicate_state_callback<T: DriverConnectorState>(
+    connector: *mut bindings::drm_connector
+) -> *mut bindings::drm_connector_state
+{
+    // SAFETY: `connector` has to point to a valid instance of drm_connector, since it holds the vtable for
+    // this function - which is the only possible entrypoint the caller could have used
+    let state = unsafe { (*connector).state };
+    if state.is_null() {
+        return null_mut();
+    }
+
+    // SAFETY: We just verified that `state` is non-null, and we're guaranteed by our bindings that
+    // `state` is of type `ConnectorState<T>`.
+    let state = unsafe { ConnectorState::<T>::as_ref(state) };
+
+    let mut new: Result<Box<ConnectorState<T>>> = Box::try_init(try_init!(ConnectorState::<T> {
+        state: bindings::drm_connector_state { ..Default::default() },
+        inner: state.inner.clone()
+    }));
+
+    if let Ok(mut new) = new {
+        // SAFETY: Just a lil' FFI call, nothing special here
+        unsafe {
+            bindings::__drm_atomic_helper_connector_duplicate_state(connector, new.as_mut_ptr())
+        };
+
+        new.into_raw()
+    } else {
+        null_mut()
+    }
+}
+
+unsafe extern "C" fn atomic_destroy_state_callback<T: DriverConnectorState>(
+    _connector: *mut bindings::drm_connector,
+    connector_state: *mut bindings::drm_connector_state
+) {
+    // SAFETY: This callback wouldn't be called unless there a connector state to destroy
+    unsafe { bindings::__drm_atomic_helper_connector_destroy_state(connector_state) };
+
+    // SAFETY: We're guaranteed by type invariants that connector_state is of type
+    // ConnectorState<T>, and since this is the destructor callback for DRM - we're guaranteed to
+    // hold the only remaining reference to this state
+    unsafe { drop(ConnectorState::<T>::from_raw(connector_state)) };
+}
+
+unsafe extern "C" fn connector_reset_callback<T: DriverConnectorState>(
+    connector: *mut bindings::drm_connector,
+) {
+    // SAFETY: The only entrypoint to this function lives in `connector` so it must be valid, and
+    let state = unsafe { (*connector).state };
+    if !state.is_null() {
+        // SAFETY: We're guaranteed by type invariance that this connector's state is of type
+        // DriverConnectorState<T>
+        unsafe { atomic_destroy_state_callback::<T>(connector, state) }
+    }
+
+    // Unfortunately, this is the best we can do at the moment as this FFI callback was mistakenly
+    // presumed to be infallible :(
+    let new = Box::try_new(ConnectorState::<T>::default()).expect("Blame the API, sorry!");
+
+    // SAFETY: DRM takes ownership of the state from here and assigns it to the connector
+    unsafe { bindings::__drm_atomic_helper_connector_reset(connector, new.into_raw()) };
+}
diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
new file mode 100644
index 0000000000000..3d072028a4884
--- /dev/null
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! KMS driver abstractions for rust.
+
+use super::{
+    plane::*,
+    ModeObject,
+    StaticModeObject,
+    KmsDriver
+};
+use crate::{
+    bindings,
+    drm::{drv::Driver, device::Device},
+    device,
+    prelude::*,
+    types::Opaque,
+    init::Zeroable,
+    sync::Arc,
+    error::to_result,
+};
+use core::{
+    cell::UnsafeCell,
+    marker::PhantomPinned,
+    ptr::{null, null_mut},
+    ops::Deref,
+};
+use macros::vtable;
+
+/// A typed KMS CRTC with a specific driver.
+#[repr(C)]
+#[pin_data]
+pub struct Crtc<T: DriverCrtc> {
+    // The FFI drm_crtc object
+    pub(super) crtc: Opaque<bindings::drm_crtc>,
+    /// The driver's private inner data
+    #[pin]
+    inner: T,
+    #[pin]
+    _p: PhantomPinned,
+}
+
+/// KMS CRTC object functions, which must be implemented by drivers.
+pub trait DriverCrtc: Send + Sync + Sized {
+    /// The return type of the new() function. Should be `impl PinInit<Self, Error>`.
+    /// TODO: Remove this when return_position_impl_trait_in_trait is stable.
+    type Initializer: PinInit<Self, Error>;
+
+    /// The data type to use for passing incoming arguments for new `Crtc<T>` instances
+    /// Drivers which don't care about this can just use `()`
+    type Args;
+
+    /// The parent driver implementation
+    type Driver: KmsDriver;
+
+    /// The type for this driver's drm_crtc_state implementation
+    type State: DriverCrtcState;
+
+    /// Create a new CRTC for this driver
+    fn new(device: &Device<Self::Driver>, args: Self::Args) -> Self::Initializer;
+}
+
+unsafe impl Zeroable for bindings::drm_crtc { }
+
+impl<T: DriverCrtc> crate::private::Sealed for Crtc<T> {}
+
+// SAFETY: Crtc.crtc is not exposed to users by default, and our accessors ensure we only perform
+// thread-safe operations for this object
+unsafe impl<T: DriverCrtc> Send for Crtc<T> { }
+unsafe impl<T: DriverCrtc> Sync for Crtc<T> { }
+
+impl<T: DriverCrtc> Deref for Crtc<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+impl<T: DriverCrtc> ModeObject for Crtc<T> {
+    type Driver = T::Driver;
+
+    fn drm_dev(&self) -> &Device<Self::Driver> {
+        // SAFETY: DRM connectors exist for as long as the device does, so this pointer is always
+        // valid
+        unsafe { &*((*self.raw_mut_ptr()).dev as *const _) }
+    }
+}
+
+// SAFETY: CRTCs are non-refcounted modesetting objects
+unsafe impl<T: DriverCrtc> StaticModeObject for Crtc<T> { }
+
+impl<T: DriverCrtc> Crtc<T> {
+    /// The actual C vtable for drm_crtc_funcs
+    const FUNCS: bindings::drm_crtc_funcs = bindings::drm_crtc_funcs {
+        atomic_destroy_state: Some(atomic_destroy_state_callback::<T::State>),
+        atomic_duplicate_state: Some(atomic_duplicate_state_callback::<T::State>),
+        atomic_get_property: None,
+        atomic_print_state: None,
+        atomic_set_property: None,
+        cursor_move: None,
+        cursor_set2: None,
+        cursor_set: None,
+        destroy: Some(crtc_destroy_callback::<T>),
+        disable_vblank: None,
+        early_unregister: None,
+        enable_vblank: None,
+        gamma_set: None, // TODO
+        get_crc_sources: None,
+        get_vblank_counter: None,
+        get_vblank_timestamp: None,
+        late_register: None,
+        page_flip: Some(bindings::drm_atomic_helper_page_flip),
+        page_flip_target: None,
+        reset: Some(crtc_reset_callback::<T::State>),
+        set_config: Some(bindings::drm_atomic_helper_set_config),
+        set_crc_source: None,
+        set_property: None,
+        verify_crc_source: None,
+    };
+
+    /// The actual C vtable for drm_crtc_helper_funcs
+    const HELPER_FUNCS: bindings::drm_crtc_helper_funcs = bindings::drm_crtc_helper_funcs {
+        atomic_disable: None,
+        atomic_enable: None,
+        atomic_check: None,
+        dpms: None,
+        commit: None,
+        prepare: None,
+        disable: None,
+        mode_set: None,
+        mode_valid: None,
+        mode_fixup: None,
+        atomic_begin: None,
+        atomic_flush: None,
+        mode_set_nofb: None,
+        mode_set_base: None,
+        mode_set_base_atomic: None,
+        get_scanout_position: None,
+    };
+
+    pub fn new<'a, P, C>(
+        dev: &'a Device<T::Driver>,
+        primary: &'a Plane<P>,
+        cursor: Option<&'a Plane<C>>,
+        name: Option<&CStr>,
+        args: T::Args,
+    ) -> Result<&'a Self>
+    where
+        P: DriverPlane,
+        C: DriverPlane
+    {
+        let this = Box::try_pin_init(try_pin_init!(Self {
+            crtc: Opaque::new(bindings::drm_crtc {
+                helper_private: &Self::HELPER_FUNCS,
+                ..Default::default()
+            }),
+            inner <- T::new(dev, args),
+            _p: PhantomPinned,
+        }))?;
+
+        to_result(unsafe {
+            bindings::drm_crtc_init_with_planes(
+                dev.drm.get(),
+                this.raw_mut_ptr(),
+                primary.raw_mut_ptr(),
+                cursor.map_or(null_mut(), |c| c.raw_mut_ptr()),
+                &Self::FUNCS,
+                name.map_or(null(), |n| n.as_char_ptr())
+            )
+        })?;
+
+        // Convert the box into a raw pointer, we'll re-assemble it in crtc_destroy_callback()
+        // SAFETY: We don't move anything
+        Ok(unsafe { &*Box::into_raw(Pin::into_inner_unchecked(this)) })
+    }
+
+    pub(super) fn raw_mut_ptr(&self) -> *mut bindings::drm_crtc {
+        self.crtc.get()
+    }
+}
+
+unsafe extern "C" fn crtc_destroy_callback<T: DriverCrtc>(
+    crtc: *mut bindings::drm_crtc
+) {
+    // SAFETY: FFI call with no special requirements
+    unsafe { bindings::drm_crtc_cleanup(crtc) };
+
+    // SAFETY: We're guaranteed by type invariants this plane is contained within an Box<Crtc<T>>
+    unsafe { drop(Box::from_raw(crtc as *mut Crtc<T>)) };
+}
+
+unsafe impl Zeroable for bindings::drm_crtc_state { }
+
+pub trait DriverCrtcState: Clone + Default + Sized {
+    type Crtc: DriverCrtc;
+}
+
+#[derive(Default)]
+#[repr(C)]
+pub struct CrtcState<T: DriverCrtcState> {
+    state: bindings::drm_crtc_state,
+    inner: T,
+}
+
+impl<T: DriverCrtcState> CrtcState<T> {
+    /// Consume this struct without dropping it, and return a pointer to its base `drm_crtc_state`
+    /// which can be handed off to DRM.
+    fn into_raw(self: Box<Self>) -> *mut bindings::drm_crtc_state {
+        let this = Box::into_raw(self);
+
+        unsafe { &mut (*this).state }
+    }
+
+    /// Consume a raw pointer and recover the original `Box<CrtcState<T>>`
+    ///
+    /// SAFETY: Callers must ensure that ptr contains a valid instance of `CrtcState<T>`
+    unsafe fn from_raw(ptr: *mut bindings::drm_crtc_state) -> Box<Self> {
+        unsafe { Box::from_raw(ptr as *mut _) }
+    }
+
+    /// Obtain a reference back to the `CrtcState<T>`
+    ///
+    /// SAFETY: Callers must ensure that ptr contains a valid instance of `CrtcState<T>`.
+    unsafe fn as_ref<'a>(ptr: *const bindings::drm_crtc_state) -> &'a Self {
+        unsafe { &*(ptr as *const _) }
+    }
+
+    /// Obtain a mutable reference back to the CrtcState<T>
+    ///
+    /// SAFETY: Callers must ensure that ptr contains a valid instance of `CrtcState<T>`, and that
+    /// no other references to this `CrtcState<T>` exist for the lifetime of this reference
+    unsafe fn as_mut_ref<'a>(ptr: *mut bindings::drm_crtc_state) -> &'a mut Self {
+        unsafe { &mut *(ptr as *mut _) }
+    }
+
+    /// Obtain a mutable pointer to the base plane state, for use in FFI calls
+    unsafe fn as_mut_ptr(&mut self) -> *mut bindings::drm_crtc_state {
+        &mut self.state
+    }
+}
+
+unsafe extern "C" fn atomic_duplicate_state_callback<T: DriverCrtcState>(
+    crtc: *mut bindings::drm_crtc
+) -> *mut bindings::drm_crtc_state {
+    // SAFETY: `crtc` has to point to a valid instance of drm_crtc, since it holds the vtable for
+    // this function - which is the only possible entrypoint the caller could have used
+    let state = unsafe { (*crtc).state };
+    if state.is_null() {
+        return null_mut();
+    }
+
+    // SAFETY: We just verified that `state` is non-null, and we're guaranteed by our bindings that
+    // `state` is of type `CrtcState<T>`.
+    let state = unsafe { CrtcState::<T>::as_ref(state) };
+
+    let mut new: Result<Box<CrtcState<T>>> = Box::try_init(try_init!(CrtcState::<T> {
+        state: bindings::drm_crtc_state { ..Default::default() },
+        inner: state.inner.clone()
+    }));
+
+    if let Ok(mut new) = new {
+        unsafe { bindings::__drm_atomic_helper_crtc_duplicate_state(crtc, new.as_mut_ptr()) }
+
+        new.into_raw()
+    } else {
+        null_mut()
+    }
+}
+
+unsafe extern "C" fn atomic_destroy_state_callback<T: DriverCrtcState>(
+    _crtc: *mut bindings::drm_crtc,
+    crtc_state: *mut bindings::drm_crtc_state,
+) {
+    // SAFETY: This callback wouldn't be called unless there a CRTC state to destroy
+    unsafe { bindings::__drm_atomic_helper_crtc_destroy_state(crtc_state) };
+    //
+    // SAFETY: We're guaranteed by type invariants that crtc_state is of type CrtcState<T>, and
+    // since this is the destructor callback for DRM - we're guaranteed to hold the only remaining
+    // reference to this state
+    drop(unsafe { CrtcState::<T>::from_raw(crtc_state) });
+}
+
+unsafe extern "C" fn crtc_reset_callback<T: DriverCrtcState>(
+    crtc: *mut bindings::drm_crtc,
+) {
+    // SAFETY: The only entrypoint to this function lives in `crtc` so it must be valid, and
+    let state = unsafe { (*crtc).state };
+    if !state.is_null() {
+        // SAFETY: We're guaranteed by type invariance that this crtc's state is of type
+        // DriverConnectorState<T>
+        unsafe { atomic_destroy_state_callback::<T>(crtc, state) }
+    }
+
+    // Unfortunately, this is the best we can do at the moment as this FFI callback was mistakenly
+    // presumed to be infallible :(
+    let new = Box::try_new(CrtcState::<T>::default()).expect("Blame the API, sorry!");
+
+    // SAFETY: DRM takes ownership of the state from here and assigns it to the crtc
+    unsafe { bindings::__drm_atomic_helper_crtc_reset(crtc, new.into_raw()) };
+}
diff --git a/rust/kernel/drm/kms/encoder.rs b/rust/kernel/drm/kms/encoder.rs
new file mode 100644
index 0000000000000..7a5bc0ca1577b
--- /dev/null
+++ b/rust/kernel/drm/kms/encoder.rs
@@ -0,0 +1,175 @@
+// TODO: License stuff
+
+//! drm_encoder abstractions for rust
+
+use crate::{
+    drm::{
+        device::Device,
+        drv::Driver,
+    },
+    prelude::*,
+    sync::Arc,
+    types::Opaque,
+    init::Zeroable,
+    error::to_result,
+};
+use core::{
+    marker::PhantomPinned,
+    ptr::null,
+    ops::Deref,
+};
+use super::{ModeObject, StaticModeObject, KmsDriver};
+use bindings;
+
+pub use bindings::{
+    DRM_MODE_ENCODER_NONE,
+    DRM_MODE_ENCODER_DAC,
+    DRM_MODE_ENCODER_TMDS,
+    DRM_MODE_ENCODER_LVDS,
+    DRM_MODE_ENCODER_TVDAC,
+    DRM_MODE_ENCODER_VIRTUAL,
+    DRM_MODE_ENCODER_DSI,
+    DRM_MODE_ENCODER_DPMST,
+    DRM_MODE_ENCODER_DPI,
+};
+
+/// A DRM encoder (`drm_encoder`)
+///
+/// This is the main struct for DRM encoders, which may also hold any private data specified by the
+/// driver.
+#[repr(C)]
+#[pin_data]
+pub struct Encoder<T: DriverEncoder> {
+    /// The FFI drm_encoder object
+    encoder: Opaque<bindings::drm_encoder>,
+    /// The driver's private inner data
+    #[pin]
+    inner: T,
+    #[pin]
+    _p: PhantomPinned,
+}
+
+/// The main trait for KMS drivers to implement for their display encoders.
+pub trait DriverEncoder: Send + Sync + Sized {
+    /// The return type of the new() function. Should be `impl PinInit<Self, Error>`.
+    /// TODO: Remove this when return_position_impl_trait_in_trait is stable.
+    type Initializer: PinInit<Self, Error>;
+
+    /// The parent driver for this drm_encoder implementation
+    type Driver: KmsDriver;
+
+    /// The type used for passing arguments to the driver's constructor
+    /// Drivers which don't care about this can just use `()`
+    type Args;
+
+    /// Create a new encoder for this driver
+    fn new(device: &Device<Self::Driver>, args: Self::Args) -> Self::Initializer;
+}
+
+impl<T: DriverEncoder> crate::private::Sealed for Encoder<T> {}
+
+unsafe impl Zeroable for bindings::drm_encoder {}
+
+// SAFETY: Encoder.encoder is not exposed to users by default, and our accessors ensure we only
+// perform thread-safe operations for this object
+unsafe impl<T: DriverEncoder> Send for Encoder<T> { }
+unsafe impl<T: DriverEncoder> Sync for Encoder<T> { }
+
+impl<T: DriverEncoder> ModeObject for Encoder<T> {
+    type Driver = T::Driver;
+
+    fn drm_dev(&self) -> &Device<Self::Driver> {
+        // SAFETY: DRM encoders exist for as long as the device does, so this pointer is always
+        // valid
+        unsafe { &*((*self.raw_mut_ptr()).dev.cast()) }
+    }
+}
+
+// SAFETY: Encoders do not have a refcount
+unsafe impl<T: DriverEncoder> StaticModeObject for Encoder<T> { }
+
+impl<T: DriverEncoder> Deref for Encoder<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+impl<T: DriverEncoder> Encoder<T> {
+    const FUNCS: bindings::drm_encoder_funcs = bindings::drm_encoder_funcs {
+        reset: None,
+        destroy: Some(encoder_destroy_callback::<T>),
+        late_register: None,
+        early_unregister: None,
+        debugfs_init: None,
+    };
+
+    const HELPER_FUNCS: bindings::drm_encoder_helper_funcs = bindings::drm_encoder_helper_funcs {
+        dpms: None,
+        mode_valid: None,
+        mode_fixup: None,
+        prepare: None,
+        mode_set: None,
+        commit: None,
+        detect: None,
+        enable: None,
+        disable: None,
+        atomic_check: None,
+        atomic_enable: None,
+        atomic_disable: None,
+        atomic_mode_set: None,
+    };
+
+    pub fn new<'a>(
+        dev: &'a Device<T::Driver>,
+        type_: u32,
+        possible_crtcs: u32,
+        possible_clones: u32,
+        name: Option<&CStr>,
+        args: T::Args,
+    ) -> Result<&'a Self> {
+        let this: Pin<Box<Self>> = Box::try_pin_init(try_pin_init!(Self {
+            encoder: Opaque::new(bindings::drm_encoder {
+                helper_private: &Self::HELPER_FUNCS,
+                possible_crtcs,
+                possible_clones,
+                ..Default::default()
+            }),
+            inner <- T::new(dev, args),
+            _p: PhantomPinned
+        }))?;
+
+        // SAFETY: FFI call with no special requirements
+        to_result(unsafe {
+            bindings::drm_encoder_init(
+                dev.drm.get(),
+                this.raw_mut_ptr(),
+                &Self::FUNCS,
+                type_ as _,
+                name.map_or(null(), |n| n.as_char_ptr())
+            )
+        })?;
+
+        // Convert the box into a raw pointer, we'll re-assemble it in encoder_destroy_callback()
+        // SAFETY: We don't move anything
+        Ok(unsafe { &*Box::into_raw(Pin::into_inner_unchecked(this)) })
+    }
+
+    pub(crate) unsafe fn raw_mut_ptr(&self) -> *mut bindings::drm_encoder {
+        self.encoder.get()
+    }
+}
+
+unsafe extern "C" fn encoder_destroy_callback<T: DriverEncoder>(
+    encoder: *mut bindings::drm_encoder
+) {
+    // SAFETY: encoder contains the only possible entrypoint to this function, so the pointer must
+    // be valid
+    unsafe { bindings::drm_encoder_cleanup(encoder) };
+
+    // Reclaim ownership of the reference we took in Encoder::<T>::new() so we can drop it
+    // SAFETY: We always create encoders in Arc<T>, and we're guaranteed by type invariants that
+    // this encoder is a Encoder<T>
+    unsafe { drop(Box::from_raw(encoder as *mut Encoder<T>)) };
+}
diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
new file mode 100644
index 0000000000000..78c8e370b997c
--- /dev/null
+++ b/rust/kernel/drm/kms/plane.rs
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! KMS atomic plane abstractions for rust.
+
+use alloc::boxed::Box;
+use crate::{
+    bindings,
+    drm::{device::Device, drv::Driver},
+    error::{to_result, from_err_ptr, Error},
+    init::Zeroable,
+    prelude::*,
+    types::{ARef, Opaque},
+    sync::{Arc, ArcBorrow},
+    init::InPlaceInit,
+    offset_of,
+};
+use core::{
+    cell::UnsafeCell,
+    mem::{self, size_of, MaybeUninit},
+    ptr::{NonNull, null, null_mut, addr_of_mut},
+    marker::PhantomPinned,
+    ops::Deref,
+    ffi::c_int,
+};
+use macros::pin_data;
+use super::{KmsDriver, ModeObject, StaticModeObject};
+
+/// The main structure containing a drm_plane that is exposed to callers. It is intentionally
+/// impossible to acquire a mutable reference to this structure, and as such this structure should
+/// only be exposed through immutable references.
+#[repr(C)]
+#[pin_data]
+pub struct Plane<T: DriverPlane> {
+    /// The FFI drm_plane object
+    pub(super) plane: Opaque<bindings::drm_plane>,
+    /// The driver's private inner data
+    #[pin]
+    inner: T,
+    #[pin]
+    _p: PhantomPinned,
+}
+
+unsafe impl Zeroable for bindings::drm_plane {}
+
+// SAFETY: Plane.plane is not exposed to users by default, and our accessors ensure we only
+// perform thread-safe operations for this object
+unsafe impl<T: DriverPlane> Send for Plane<T> { }
+unsafe impl<T: DriverPlane> Sync for Plane<T> { }
+
+/// The main trait for implementing the drm_plane API. This contains the various trait methods that
+/// need to be implemented by a driver. The private driver data for the plane is contained in
+/// whatever struct the driver defines which implements this trait.
+pub trait DriverPlane: Send + Sync + Sized {
+    /// The return type of the new() function. Should be `impl PinInit<Self, Error>`.
+    /// TODO: Remove this when return_position_impl_trait_in_trait is stable.
+    type Initializer: PinInit<Self, Error>;
+
+    /// The data type to use for passing incoming arguments for new `Plane<T>` instances
+    /// Drivers which don't care about this can just use `()`
+    type Args;
+
+    /// The parent driver implementation
+    type Driver: KmsDriver;
+
+    /// The type for this driver's drm_plane_state implementation
+    type State: DriverPlaneState;
+
+    /// Create a new plane for this driver
+    fn new(device: &Device<Self::Driver>, args: Self::Args) -> Self::Initializer;
+}
+
+impl<T: DriverPlane> crate::private::Sealed for Plane<T> {}
+
+impl<T: DriverPlane> ModeObject for Plane<T> {
+    type Driver = T::Driver;
+
+    fn drm_dev(&self) -> &Device<Self::Driver> {
+        // SAFETY: DRM planes exist for as long as the device does, so this pointer is always valid
+        unsafe { &*((*self.raw_mut_ptr()).dev as *const _) }
+    }
+}
+
+// SAFETY: Planes do not have a refcount
+unsafe impl<T: DriverPlane> StaticModeObject for Plane<T> { }
+
+impl<T: DriverPlane> Deref for Plane<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+impl<T: DriverPlane> Plane<T> {
+    /// The actual C vtable for drm_plane_funcs
+    const FUNCS: bindings::drm_plane_funcs = bindings::drm_plane_funcs {
+        update_plane: Some(bindings::drm_atomic_helper_update_plane),
+        disable_plane: Some(bindings::drm_atomic_helper_disable_plane),
+        destroy: Some(plane_destroy_callback::<T>),
+        reset: Some(plane_reset_callback::<T::State>),
+        set_property: None,
+        atomic_duplicate_state: Some(atomic_duplicate_state_callback::<T::State>),
+        atomic_destroy_state: Some(atomic_destroy_state_callback::<T::State>),
+        atomic_set_property: None, // TODO someday
+        atomic_get_property: None, // TODO someday
+        late_register: None, // TODO someday
+        early_unregister: None, // TODO someday
+        atomic_print_state: None, // TODO: Display someday???
+        format_mod_supported: None // TODO someday
+    };
+
+    const HELPER_FUNCS: bindings::drm_plane_helper_funcs = bindings::drm_plane_helper_funcs {
+        prepare_fb: None, // TODO someday?
+        cleanup_fb: None, // TODO someday?
+        begin_fb_access: None, // TODO: someday?
+        end_fb_access: None, // TODO: someday?
+        atomic_check: None, // TODO
+        atomic_update: None, // TODO
+        atomic_enable: None, // TODO
+        atomic_disable: None, // TODO
+        atomic_async_check: None, // TODO
+        atomic_async_update: None, // TODO
+    };
+
+    pub fn new<'a>(
+        dev: &'a Device<T::Driver>,
+        possible_crtcs: u32,
+        formats: &'static [u32],
+        format_modifiers: Option<&'static [u64]>,
+        type_: PlaneType,
+        name: Option<&CStr>,
+        args: T::Args,
+    ) -> Result<&'a Self> {
+        let this: Pin<Box<Self>> = Box::try_pin_init(try_pin_init!(Self {
+            plane: Opaque::new(bindings::drm_plane {
+                helper_private: &Self::HELPER_FUNCS,
+                ..Default::default()
+            }),
+            inner <- T::new(dev, args),
+            _p: PhantomPinned
+        }))?;
+
+        // SAFETY: FFI call with no special requirements
+        to_result(unsafe {
+            bindings::drm_universal_plane_init(
+                dev.drm.get(),
+                this.raw_mut_ptr(),
+                possible_crtcs,
+                &Self::FUNCS,
+                formats.as_ptr(),
+                formats.len() as _,
+                format_modifiers.map_or(null(), |f| f.as_ptr()),
+                type_ as _,
+                name.map_or(null(), |n| n.as_char_ptr())
+            )
+        })?;
+
+        // Convert the box into a raw pointer, we'll re-assemble it in plane_destroy_callback()
+        // SAFETY: We don't move anything
+        Ok(unsafe { &*Box::into_raw(Pin::into_inner_unchecked(this)) })
+    }
+
+    pub(super) fn raw_mut_ptr(&self) -> *mut bindings::drm_plane {
+        self.plane.get()
+    }
+}
+
+unsafe extern "C" fn plane_destroy_callback<T: DriverPlane>(
+    plane: *mut bindings::drm_plane
+) {
+    // SAFETY: plane contains the only possible entrypoint to this function, so the pointer must be
+    // valid
+    unsafe { bindings::drm_plane_cleanup(plane) };
+
+    // Reclaim ownership of the reference we took in Plane::<T>::new() so we can drop it
+    // SAFETY: We're guaranteed by type invariants this plane is contained within an Box<Plane<T>>
+    unsafe { drop(Box::from_raw(plane as *mut Plane<T>)) };
+}
+
+#[derive(Default)]
+#[repr(C)]
+pub struct PlaneState<T: DriverPlaneState> {
+    state: bindings::drm_plane_state,
+    inner: T,
+}
+
+/// Traits which must be implemented by KMS drivers for DRM planes.
+pub trait DriverPlaneState: Clone + Default + Sized {
+    /// The type for this driver's drm_plane implementation
+    type Plane: DriverPlane;
+}
+
+impl<T: DriverPlaneState> PlaneState<T> {
+    /// Consume this struct without dropping it, and return a pointer to its base `drm_plane_state`
+    /// which can be handed off to DRM.
+    fn into_raw(self: Box<Self>) -> *mut bindings::drm_plane_state {
+        let this = Box::into_raw(self);
+
+        unsafe { &mut (*this).state }
+    }
+
+    /// Consume a raw pointer and recover the original `Box<PlaneState<T>>`
+    ///
+    /// SAFETY: Callers must ensure that ptr contains a valid instance of `PlaneState<T>`
+    unsafe fn from_raw(ptr: *mut bindings::drm_plane_state) -> Box<Self> {
+        unsafe { Box::from_raw(ptr as *mut _) }
+    }
+
+    /// Obtain a reference back to the `PlaneState<T>`
+    ///
+    /// SAFETY: Callers must ensure that ptr contains a valid instance of `PlaneState<T>`.
+    unsafe fn as_ref<'a>(ptr: *const bindings::drm_plane_state) -> &'a Self {
+        unsafe { &*(ptr as *const _) }
+    }
+
+    /// Obtain a mutable reference back to the PlaneState<T>
+    ///
+    /// SAFETY: Callers must ensure that ptr contains a valid instance of `PlaneState<T>`, and that
+    /// no other references to this `PlaneState<T>` exist for the lifetime of this reference
+    unsafe fn as_mut_ref<'a>(ptr: *mut bindings::drm_plane_state) -> &'a mut Self {
+        unsafe { &mut *(ptr as *mut _) }
+    }
+
+    /// Obtain a mutable pointer to the base plane state, for use in FFI calls
+    unsafe fn as_mut_ptr(&mut self) -> *mut bindings::drm_plane_state {
+        &mut self.state
+    }
+}
+
+unsafe impl Zeroable for bindings::drm_plane_state { }
+
+unsafe extern "C" fn atomic_duplicate_state_callback<T: DriverPlaneState>(
+    plane: *mut bindings::drm_plane
+) -> *mut bindings::drm_plane_state
+{
+    // SAFETY: `plane` has to point to a valid instance of drm_plane, since it holds the vtable for
+    // this function - which is the only possible entrypoint the caller could have used
+    let state = unsafe { (*plane).state };
+    if state.is_null() {
+        return null_mut();
+    }
+
+    // SAFETY: We just verified that `state` is non-null, and we're guaranteed by our bindings that
+    // `state` is of type `PlaneState<T>`.
+    let state = unsafe { PlaneState::<T>::as_ref(state) };
+
+    let mut new: Result<Box<PlaneState<T>>> = Box::try_init(try_init!(PlaneState::<T> {
+        state: bindings::drm_plane_state { ..Default::default() },
+        inner: state.inner.clone()
+    }));
+
+    if let Ok(mut new) = new {
+        // SAFETY: Just a lil' FFI call, nothing special here
+        unsafe { bindings::__drm_atomic_helper_plane_duplicate_state(plane, new.as_mut_ptr()) };
+
+        new.into_raw()
+    } else {
+        null_mut()
+    }
+}
+
+unsafe extern "C" fn atomic_destroy_state_callback<T: DriverPlaneState>(
+    _plane: *mut bindings::drm_plane,
+    plane_state: *mut bindings::drm_plane_state
+) {
+    // SAFETY: This callback wouldn't be called unless there a plane state to destroy
+    unsafe { bindings::__drm_atomic_helper_plane_destroy_state(plane_state) };
+
+    // SAFETY: We're guaranteed by type invariants that plane_state is of type PlaneState<T>, and
+    // since this is the destructor callback for DRM - we're guaranteed to hold the only remaining
+    // reference to this state
+    unsafe { drop(PlaneState::<T>::from_raw(plane_state)) };
+}
+
+unsafe extern "C" fn plane_reset_callback<T: DriverPlaneState>(
+    plane: *mut bindings::drm_plane,
+) {
+    // SAFETY: The only entrypoint to this function lives in `plane` so it must be valid, and
+    let state = unsafe { (*plane).state };
+    if !state.is_null() {
+        // SAFETY: We're guaranteed by type invariance that this plane's state is of type
+        // DriverPlaneState<T>
+        unsafe { atomic_destroy_state_callback::<T>(plane, state) }
+    }
+
+    // Unfortunately, this is the best we can do at the moment as this FFI callback was mistakenly
+    // presumed to be infallible :(
+    let new = Box::try_new(PlaneState::<T>::default()).expect("Blame the API, sorry!");
+
+    // SAFETY: DRM takes ownership of the state from here and assigns it to the plane
+    unsafe { bindings::__drm_atomic_helper_plane_reset(plane, new.into_raw()) };
+}
+
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+#[repr(u32)]
+pub enum PlaneType {
+    OVERLAY = bindings::drm_plane_type_DRM_PLANE_TYPE_OVERLAY,
+    PRIMARY = bindings::drm_plane_type_DRM_PLANE_TYPE_PRIMARY,
+    CURSOR = bindings::drm_plane_type_DRM_PLANE_TYPE_CURSOR,
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 2c12dbd181997..049ae675cb9b1 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -8,3 +8,4 @@
 pub mod fourcc;
 pub mod gem;
 pub mod ioctl;
+pub mod kms;
-- 
2.43.0

