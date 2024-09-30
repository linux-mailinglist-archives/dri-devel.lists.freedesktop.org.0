Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7652F98B0E0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB82410E300;
	Mon, 30 Sep 2024 23:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XQynRX+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F042F10E300
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACftoemmwJyFTrC4hxNed1Z9He1Jfe5sVp07orpoTOA=;
 b=XQynRX+KrAGcd9gYDaJB0d3A3ZPcdnw0iLTqNGeFg9Sq4pT5UAetcnSSnHvc/1JrsiRhcj
 ZkxuYFEzxYPF8KX8uMQOuMJL34tcIqx/+vWXa/FOHWZyzTHjDPisrppdaS3+afizHtZ6gl
 0LDmd85u4VJlO9sLvHHM4nLd4QhYSIk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-270-UwIA5MDvP625sjJaVLOC9Q-1; Mon,
 30 Sep 2024 19:37:35 -0400
X-MC-Unique: UwIA5MDvP625sjJaVLOC9Q-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 24B38196A415; Mon, 30 Sep 2024 23:37:32 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C70673003DEC; Mon, 30 Sep 2024 23:37:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [WIP RFC v2 02/35] WIP: rust: drm: Add traits for registering KMS
 devices
Date: Mon, 30 Sep 2024 19:09:45 -0400
Message-ID: <20240930233257.1189730-3-lyude@redhat.com>
In-Reply-To: <20240930233257.1189730-1-lyude@redhat.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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

This commit adds some traits for registering DRM devices with KMS support,
implemented through the kernel::drm::kms::Kms trait. Devices which don't
have KMS support can simply use PhantomData<Self>.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

TODO:
* Generate feature flags automatically, these shouldn't need to be
  specified by the user

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/bindings/bindings_helper.h |   4 +
 rust/kernel/drm/device.rs       |  18 ++-
 rust/kernel/drm/drv.rs          |  45 ++++++-
 rust/kernel/drm/kms.rs          | 230 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/kms/fbdev.rs    |  45 +++++++
 rust/kernel/drm/mod.rs          |   1 +
 6 files changed, 335 insertions(+), 8 deletions(-)
 create mode 100644 rust/kernel/drm/kms.rs
 create mode 100644 rust/kernel/drm/kms/fbdev.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 04898f70ef1b8..4a8e44e11c96a 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,11 +6,15 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 2b687033caa2d..d4d6b1185f6a6 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -5,14 +5,22 @@
 //! C header: [`include/linux/drm/drm_device.h`](srctree/include/linux/drm/drm_device.h)
 
 use crate::{
-    bindings, device, drm,
-    drm::drv::AllocImpl,
+    bindings, device,
+    drm::{
+        drv::AllocImpl,
+        self,
+        kms::{KmsImpl, private::KmsImpl as KmsImplPrivate}
+    },
     error::code::*,
     error::from_err_ptr,
     error::Result,
     types::{ARef, AlwaysRefCounted, ForeignOwnable, Opaque},
 };
-use core::{ffi::c_void, marker::PhantomData, ptr::NonNull};
+use core::{
+    ffi::c_void,
+    marker::PhantomData,
+    ptr::NonNull
+};
 
 #[cfg(CONFIG_DRM_LEGACY)]
 macro_rules! drm_legacy_fields {
@@ -150,6 +158,10 @@ pub fn data(&self) -> <T::Data as ForeignOwnable>::Borrowed<'_> {
         // SAFETY: `Self::data` is always converted and set on device creation.
         unsafe { <T::Data as ForeignOwnable>::from_foreign(drm.raw_data()) };
     }
+
+    pub(crate) const fn has_kms() -> bool {
+        <T::Kms as KmsImplPrivate>::MODE_CONFIG_OPS.is_some()
+    }
 }
 
 // SAFETY: DRM device objects are always reference counted and the get/put functions
diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
index 0cf3fb1cea53c..6b61f2755ba79 100644
--- a/rust/kernel/drm/drv.rs
+++ b/rust/kernel/drm/drv.rs
@@ -8,7 +8,15 @@
     alloc::flags::*,
     bindings,
     devres::Devres,
-    drm,
+    drm::{
+        self,
+        kms::{
+            KmsImpl,
+            private::KmsImpl as KmsImplPrivate,
+            Kms
+        }
+    },
+    device,
     error::{Error, Result},
     private::Sealed,
     str::CStr,
@@ -142,6 +150,12 @@ pub trait Driver {
     /// The type used to represent a DRM File (client)
     type File: drm::file::DriverFile;
 
+    /// The KMS implementation for this driver.
+    ///
+    /// Drivers that wish to support KMS should pass their implementation of `drm::kms::KmsDriver`
+    /// here. Drivers which do not have KMS support can simply pass `drm::kms::NoKms` here.
+    type Kms: drm::kms::KmsImpl<Driver = Self> where Self: Sized;
+
     /// Driver metadata
     const INFO: DriverInfo;
 
@@ -159,21 +173,36 @@ pub trait Driver {
 
 impl<T: Driver> Registration<T> {
     /// Creates a new [`Registration`] and registers it.
-    pub fn new(drm: ARef<drm::device::Device<T>>, flags: usize) -> Result<Self> {
+    pub fn new(dev: &device::Device, data: T::Data, flags: usize) -> Result<Self> {
+        let drm = drm::device::Device::<T>::new(dev, data)?;
+        let has_kms = drm::device::Device::<T>::has_kms();
+
+        let mode_config_info = if has_kms {
+            // SAFETY: We have yet to register this device
+            Some(unsafe { T::Kms::setup_kms(&drm)? })
+        } else {
+            None
+        };
+
         // SAFETY: Safe by the invariants of `drm::device::Device`.
         let ret = unsafe { bindings::drm_dev_register(drm.as_raw(), flags as u64) };
         if ret < 0 {
             return Err(Error::from_errno(ret));
         }
 
+        if let Some(ref info) = mode_config_info {
+            // SAFETY: We just registered the device above
+            unsafe { T::Kms::setup_fbdev(&drm, info) };
+        }
+
         Ok(Self(drm))
     }
 
     /// Same as [`Registration::new`}, but transfers ownership of the [`Registration`] to `Devres`.
-    pub fn new_foreign_owned(drm: ARef<drm::device::Device<T>>, flags: usize) -> Result {
-        let reg = Registration::<T>::new(drm.clone(), flags)?;
+    pub fn new_foreign_owned(dev: &device::Device, data: T::Data, flags: usize) -> Result {
+        let reg = Registration::<T>::new(dev, data, flags)?;
 
-        Devres::new_foreign_owned(drm.as_ref(), reg, GFP_KERNEL)
+        Devres::new_foreign_owned(dev, reg, GFP_KERNEL)
     }
 
     /// Returns a reference to the `Device` instance for this registration.
@@ -195,5 +224,11 @@ fn drop(&mut self) {
         // SAFETY: Safe by the invariant of `ARef<drm::device::Device<T>>`. The existance of this
         // `Registration` also guarantees the this `drm::device::Device` is actually registered.
         unsafe { bindings::drm_dev_unregister(self.0.as_raw()) };
+
+        if drm::device::Device::<T>::has_kms() {
+            // SAFETY: We just checked above that KMS was setup for this device, so this is safe to
+            // call
+            unsafe { bindings::drm_atomic_helper_shutdown(self.0.as_raw()) }
+        }
     }
 }
diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
new file mode 100644
index 0000000000000..d3558a5eccc54
--- /dev/null
+++ b/rust/kernel/drm/kms.rs
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! KMS driver abstractions for rust.
+
+pub mod fbdev;
+
+use crate::{
+    drm::{
+        drv::Driver,
+        device::Device
+    },
+    device,
+    prelude::*,
+    types::*,
+    error::to_result,
+    private::Sealed,
+};
+use core::{
+    ops::Deref,
+    ptr::{self, NonNull},
+    mem::{self, ManuallyDrop},
+    marker::PhantomData,
+};
+use bindings;
+
+/// The C vtable for a [`Device`].
+///
+/// This is created internally by DRM.
+pub(crate) struct ModeConfigOps {
+    pub(crate) kms_vtable: bindings::drm_mode_config_funcs,
+    pub(crate) kms_helper_vtable: bindings::drm_mode_config_helper_funcs
+}
+
+/// A trait representing a type that can be used for setting up KMS, or a stub.
+///
+/// For drivers which don't have KMS support, the methods provided by this trait may be stubs. It is
+/// implemented internally by DRM.
+pub trait KmsImpl: private::KmsImpl {}
+
+pub(crate) mod private {
+    use super::*;
+
+    /// Private callback implemented internally by DRM for setting up KMS on a device, or stubbing
+    /// the KMS setup for devices which don't have KMS support can just use [`PhantomData`].
+    pub trait KmsImpl {
+        /// The parent driver for this KMS implementation
+        type Driver: Driver;
+
+        /// The optional KMS callback operations for this driver.
+        const MODE_CONFIG_OPS: Option<ModeConfigOps>;
+
+        /// The callback for setting up KMS on a device
+        ///
+        /// # Safety
+        ///
+        /// `drm` must be unregistered.
+        unsafe fn setup_kms(drm: &Device<Self::Driver>) -> Result<ModeConfigInfo> {
+            build_error::build_error("This should never be reachable")
+        }
+
+        /// The callback for setting up fbdev emulation on a KMS device.
+        ///
+        /// # Safety
+        ///
+        /// `drm` must be registered.
+        unsafe fn setup_fbdev(drm: &Device<Self::Driver>, mode_config_info: &ModeConfigInfo) {
+            build_error::build_error("This should never be reachable")
+        }
+    }
+}
+
+/// A [`Device`] with KMS initialized that has not been registered with userspace.
+///
+/// This type is identical to [`Device`], except that it is able to create new static KMS resources.
+/// It represents a KMS device that is not yet visible to userspace, and also contains miscellaneous
+/// state required during the initialization process of a [`Device`].
+pub struct UnregisteredKmsDevice<'a, T: Driver> {
+    drm: &'a Device<T>,
+}
+
+impl<'a, T: Driver> Deref for UnregisteredKmsDevice<'a, T> {
+    type Target = Device<T>;
+
+    fn deref(&self) -> &Self::Target {
+        self.drm
+    }
+}
+
+impl<'a, T: Driver> UnregisteredKmsDevice<'a, T> {
+    /// Construct a new [`UnregisteredKmsDevice`].
+    ///
+    /// # Safety
+    ///
+    /// The caller promises that `drm` is an unregistered [`Device`].
+    pub(crate) unsafe fn new(drm: &'a Device<T>) -> Self {
+        Self {
+            drm,
+        }
+    }
+}
+
+/// A trait which must be implemented by drivers that wish to support KMS
+///
+/// It should be implemented for the same type that implements [`Driver`]. Drivers which don't
+/// support KMS should use [`PhantomData<Self>`].
+///
+/// [`PhantomData<Self>`]: PhantomData
+#[vtable]
+pub trait Kms {
+    /// The parent [`Driver`] for this [`Device`].
+    type Driver: KmsDriver;
+
+    /// The fbdev implementation to use for this [`Device`].
+    ///
+    /// Which implementation may be used here depends on the GEM implementation specified in
+    /// [`Driver::Object`]. See [`fbdev`] for more information.
+    type Fbdev: fbdev::FbdevImpl;
+
+    /// Return a [`ModeConfigInfo`] structure for this [`device::Device`].
+    fn mode_config_info(
+        dev: &device::Device,
+        drm_data: <<Self::Driver as Driver>::Data as ForeignOwnable>::Borrowed<'_>,
+    ) -> Result<ModeConfigInfo>;
+
+    /// Create mode objects like [`crtc::Crtc`], [`plane::Plane`], etc. for this device
+    fn create_objects(drm: &UnregisteredKmsDevice<'_, Self::Driver>) -> Result;
+}
+
+impl<T: Kms> private::KmsImpl for T {
+    type Driver = T::Driver;
+
+    const MODE_CONFIG_OPS: Option<ModeConfigOps> = Some(ModeConfigOps {
+        kms_vtable: bindings::drm_mode_config_funcs {
+            atomic_check: Some(bindings::drm_atomic_helper_check),
+            // TODO TODO: There are other possibilities then this function, but we need
+            // to write up more bindings before we can support those
+            fb_create: Some(bindings::drm_gem_fb_create),
+            mode_valid: None, // TODO
+            atomic_commit: Some(bindings::drm_atomic_helper_commit),
+            get_format_info: None,
+            atomic_state_free: None,
+            atomic_state_alloc: None,
+            atomic_state_clear: None,
+            output_poll_changed: None,
+        },
+
+        kms_helper_vtable: bindings::drm_mode_config_helper_funcs {
+            atomic_commit_setup: None, // TODO
+            atomic_commit_tail: None, // TODO
+        },
+    });
+
+    unsafe fn setup_kms(drm: &Device<Self::Driver>) -> Result<ModeConfigInfo> {
+        let mode_config_info = T::mode_config_info(drm.as_ref(), drm.data())?;
+
+        // SAFETY: `MODE_CONFIG_OPS` is always Some() in this implementation
+        let ops = unsafe { T::MODE_CONFIG_OPS.as_ref().unwrap_unchecked() };
+
+        // SAFETY:
+        // - This function can only be called before registration via our safety contract.
+        // - Before registration, we are the only ones with access to this device.
+        unsafe {
+            (*drm.as_raw()).mode_config = bindings::drm_mode_config {
+                funcs: &ops.kms_vtable,
+                helper_private: &ops.kms_helper_vtable,
+                min_width: mode_config_info.min_resolution.0,
+                min_height: mode_config_info.min_resolution.1,
+                max_width: mode_config_info.max_resolution.0,
+                max_height: mode_config_info.max_resolution.1,
+                cursor_width: mode_config_info.max_cursor.0,
+                cursor_height: mode_config_info.max_cursor.1,
+                preferred_depth: mode_config_info.preferred_depth,
+                ..Default::default()
+            };
+        }
+
+        // SAFETY: We just setup all of the required info this function needs in `drm_device`
+        to_result(unsafe { bindings::drmm_mode_config_init(drm.as_raw()) })?;
+
+        // SAFETY: `drm` is guaranteed to be unregistered via our safety contract.
+        let drm = unsafe { UnregisteredKmsDevice::new(drm) };
+
+        T::create_objects(&drm)?;
+
+        // TODO: Eventually add a hook to customize how state readback happens, for now just reset
+        // SAFETY: Since all static modesetting objects were created in `T::create_objects()`, and
+        // that is the only place they can be created, this fulfills the C API requirements.
+        unsafe { bindings::drm_mode_config_reset(drm.as_raw()) };
+
+        Ok(mode_config_info)
+    }
+
+    unsafe fn setup_fbdev(drm: &Device<Self::Driver>, mode_config_info: &ModeConfigInfo) {
+        <<T as Kms>::Fbdev as fbdev::private::FbdevImpl>::setup_fbdev(drm, mode_config_info)
+    }
+}
+
+impl<T: Kms> KmsImpl for T {}
+
+impl<T: Driver> private::KmsImpl for PhantomData<T> {
+    type Driver = T;
+
+    const MODE_CONFIG_OPS: Option<ModeConfigOps> = None;
+}
+
+impl<T: Driver> KmsImpl for PhantomData<T> {}
+
+/// Various device-wide information for a [`Device`] that is provided during initialization.
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
+/// A [`Driver`] with [`Kms`] implemented.
+///
+/// This is implemented internally by DRM for any [`Device`] whose [`Driver`] type implements
+/// [`Kms`], and provides access to methods which are only safe to use with KMS devices.
+pub trait KmsDriver: Driver {}
+
+impl<T, K> KmsDriver for T
+where
+    T: Driver<Kms = K>,
+    K: Kms<Driver = T> {}
diff --git a/rust/kernel/drm/kms/fbdev.rs b/rust/kernel/drm/kms/fbdev.rs
new file mode 100644
index 0000000000000..bdf97500137d8
--- /dev/null
+++ b/rust/kernel/drm/kms/fbdev.rs
@@ -0,0 +1,45 @@
+//! Fbdev helper implementations for rust.
+//!
+//! This module provides the various Fbdev implementations that can be used by Rust KMS drivers.
+use core::marker::*;
+use crate::{private::Sealed, drm::{kms::*, device::Device, gem}};
+use bindings;
+
+pub(crate) mod private {
+    use super::*;
+
+    pub trait FbdevImpl {
+        /// Setup the fbdev implementation for this KMS driver.
+        fn setup_fbdev<T: Driver>(drm: &Device<T>, mode_config_info: &ModeConfigInfo);
+    }
+}
+
+/// The main trait for a driver's DRM implementation.
+///
+/// Drivers are expected not to implement this directly, and to instead use one of the objects
+/// provided by this module such as [`FbdevDma`].
+pub trait FbdevImpl: private::FbdevImpl {}
+
+/// The fbdev implementation for drivers using the gem DMA helpers.
+///
+/// Drivers which use the gem DMA helpers ([`gem::Object`]) should use this for their [`Kms::Fbdev`]
+/// type.
+pub struct FbdevDma<T: Driver>(PhantomData<T>);
+
+impl<T, G> private::FbdevImpl for FbdevDma<T>
+where
+    T: Driver<Object = gem::Object<G>>,
+    G: gem::DriverObject
+{
+    #[inline]
+    fn setup_fbdev<D: Driver>(drm: &Device<D>, mode_config_info: &ModeConfigInfo) {
+        // SAFETY: Our implementation bounds re proof that this driver is using the gem dma helpers
+        unsafe { bindings::drm_fbdev_dma_setup(drm.as_raw(), mode_config_info.preferred_depth) };
+    }
+}
+
+impl<T, G> FbdevImpl for FbdevDma<T>
+where
+    T: Driver<Object = gem::Object<G>>,
+    G: gem::DriverObject
+{}
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
2.46.1

