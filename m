Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5120AA53DED
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A655810E0F8;
	Wed,  5 Mar 2025 23:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VXDjNYe4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331ED10E0F8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741215893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yi8QcXdg+H/kQ2ed4byvlgjFhZtCiY0sf5Enn4vU128=;
 b=VXDjNYe4y0yYNThwo1SvUnSgh4ufez9hAqEh2XOl6VdqilDsAILoy/UTmA5MSBHbthzska
 PuIrexJLcoxb9YIdWgRI5p0h/5xBX4s1Qq2QrQBoZ5nkJamY4A1w+Uc/EDshxQrc4Vi2Rk
 OofN2Uily6z6/3hhsQzg/rFFEZpwGtM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-673-vVkYYhf5OqK_am3JQdX4Xg-1; Wed,
 05 Mar 2025 18:04:48 -0500
X-MC-Unique: vVkYYhf5OqK_am3JQdX4Xg-1
X-Mimecast-MFC-AGG-ID: vVkYYhf5OqK_am3JQdX4Xg_1741215885
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 23A4D1809CA6; Wed,  5 Mar 2025 23:04:45 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2C41A300019E; Wed,  5 Mar 2025 23:04:39 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com,
 Alice Ryhl <aliceryhl@google.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <sima@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC v3 02/33] rust: drm: Add traits for registering KMS devices
Date: Wed,  5 Mar 2025 17:59:18 -0500
Message-ID: <20250305230406.567126-3-lyude@redhat.com>
In-Reply-To: <20250305230406.567126-1-lyude@redhat.com>
References: <20250305230406.567126-1-lyude@redhat.com>
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
implemented through the kernel::drm::kms::KmsDriver trait. Devices which
don't have KMS support can simply use PhantomData<Self>.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

V3:
* Get rid of Kms, long live KmsDriver
  After Daniel pointed out that we should just make KmsDriver a supertrait
  of Driver, it immediately occurred to me that there's no actual need for
  Kms to be a separate trait at all. So, drop Kms entirely and move its
  requirements over to KmsDriver.
* Drop fbdev module entirely and move fbdev related setup into AllocImpl
  (Daniel)
* Rebase to use drm_client_setup()

TODO:
* Generate feature flags automatically, these shouldn't need to be
  specified by the user

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/bindings/bindings_helper.h |   6 ++
 rust/kernel/drm/device.rs       |  10 +-
 rust/kernel/drm/drv.rs          |  56 ++++++++--
 rust/kernel/drm/gem/mod.rs      |   4 +
 rust/kernel/drm/gem/shmem.rs    |   4 +
 rust/kernel/drm/kms.rs          | 186 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 7 files changed, 258 insertions(+), 9 deletions(-)
 create mode 100644 rust/kernel/drm/kms.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ca857fb00b1a5..e1ed4f40c8e89 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,10 +6,16 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_fbdev_dma.h>
+#include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 5b4db2dfe87f5..cf063de387329 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -5,8 +5,8 @@
 //! C header: [`include/linux/drm/drm_device.h`](srctree/include/linux/drm/drm_device.h)
 
 use crate::{
-    bindings, device, drm,
-    drm::drv::AllocImpl,
+    bindings, device,
+    drm::{self, drv::AllocImpl, kms::private::KmsImpl as KmsImplPrivate},
     error::code::*,
     error::from_err_ptr,
     error::Result,
@@ -73,7 +73,7 @@ impl<T: drm::drv::Driver> Device<T> {
         dumb_create: T::Object::ALLOC_OPS.dumb_create,
         dumb_map_offset: T::Object::ALLOC_OPS.dumb_map_offset,
         show_fdinfo: None,
-        fbdev_probe: None,
+        fbdev_probe: T::Object::ALLOC_OPS.fbdev_probe,
 
         major: T::INFO.major,
         minor: T::INFO.minor,
@@ -153,6 +153,10 @@ pub fn data(&self) -> <T::Data as ForeignOwnable>::Borrowed<'_> {
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
index e42e266bdd0da..3e09e130730f6 100644
--- a/rust/kernel/drm/drv.rs
+++ b/rust/kernel/drm/drv.rs
@@ -6,14 +6,15 @@
 
 use crate::{
     alloc::flags::*,
-    bindings,
+    bindings, device,
     devres::Devres,
-    drm,
+    drm::{self, kms::private::KmsImpl as KmsImplPrivate},
     error::{Error, Result},
     private::Sealed,
     str::CStr,
     types::{ARef, ForeignOwnable},
 };
+use core::ptr::null;
 use macros::vtable;
 
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
@@ -115,6 +116,12 @@ pub struct AllocOps {
             offset: *mut u64,
         ) -> core::ffi::c_int,
     >,
+    pub(crate) fbdev_probe: Option<
+        unsafe extern "C" fn(
+            fbdev_helper: *mut bindings::drm_fb_helper,
+            sizes: *mut bindings::drm_fb_helper_surface_size,
+        ) -> core::ffi::c_int,
+    >,
 }
 
 /// Trait for memory manager implementations. Implemented internally.
@@ -142,6 +149,14 @@ pub trait Driver {
     /// The type used to represent a DRM File (client)
     type File: drm::file::DriverFile;
 
+    /// The KMS implementation for this driver.
+    ///
+    /// Drivers that wish to support KMS should pass their implementation of `drm::kms::KmsDriver`
+    /// here. Drivers which do not have KMS support can simply pass `drm::kms::NoKms` here.
+    type Kms: drm::kms::KmsImpl<Driver = Self>
+    where
+        Self: Sized;
+
     /// Driver metadata
     const INFO: DriverInfo;
 
@@ -159,21 +174,44 @@ pub trait Driver {
 
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
         let ret = unsafe { bindings::drm_dev_register(drm.as_raw(), flags) };
         if ret < 0 {
             return Err(Error::from_errno(ret));
         }
 
+        #[cfg(CONFIG_DRM_CLIENT = "y")]
+        if has_kms {
+            if let Some(ref info) = mode_config_info {
+                if let Some(fourcc) = info.preferred_fourcc {
+                    // SAFETY: We just registered `drm` above, fulfilling the C API requirements
+                    unsafe { bindings::drm_client_setup_with_fourcc(drm.as_raw(), fourcc) }
+                } else {
+                    // SAFETY: We just registered `drm` above, fulfilling the C API requirements
+                    unsafe { bindings::drm_client_setup(drm.as_raw(), null()) }
+                }
+            }
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
@@ -195,5 +233,11 @@ fn drop(&mut self) {
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
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 3fcab497cc2a5..605b0a22ac08b 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -300,6 +300,10 @@ impl<T: DriverObject> drv::AllocImpl for Object<T> {
         gem_prime_import_sg_table: None,
         dumb_create: None,
         dumb_map_offset: None,
+        #[cfg(CONFIG_DRM_FBDEV_EMULATION = "y")]
+        fbdev_probe: Some(bindings::drm_fbdev_dma_driver_fbdev_probe),
+        #[cfg(CONFIG_DRM_FBDEV_EMULATION = "n")]
+        fbdev_probe: None,
     };
 }
 
diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 92da0d7d59912..9c0162b268aa8 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -279,6 +279,10 @@ impl<T: DriverObject> drv::AllocImpl for Object<T> {
         gem_prime_import_sg_table: Some(bindings::drm_gem_shmem_prime_import_sg_table),
         dumb_create: Some(bindings::drm_gem_shmem_dumb_create),
         dumb_map_offset: None,
+        #[cfg(CONFIG_DRM_FBDEV_EMULATION = "y")]
+        fbdev_probe: Some(bindings::drm_fbdev_shmem_driver_fbdev_probe),
+        #[cfg(CONFIG_DRM_FBDEV_EMULATION = "n")]
+        fbdev_probe: None,
     };
 }
 
diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
new file mode 100644
index 0000000000000..78970c69f4cda
--- /dev/null
+++ b/rust/kernel/drm/kms.rs
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! KMS driver abstractions for rust.
+
+use crate::{
+    device,
+    drm::{device::Device, drv::Driver},
+    error::to_result,
+    prelude::*,
+    types::*,
+};
+use bindings;
+use core::{marker::PhantomData, ops::Deref};
+
+/// The C vtable for a [`Device`].
+///
+/// This is created internally by DRM.
+pub struct ModeConfigOps {
+    pub(crate) kms_vtable: bindings::drm_mode_config_funcs,
+    pub(crate) kms_helper_vtable: bindings::drm_mode_config_helper_funcs,
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
+    /// the KMS setup for devices which don't have KMS support.
+    #[allow(unreachable_pub)]
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
+        unsafe fn setup_kms(_drm: &Device<Self::Driver>) -> Result<ModeConfigInfo> {
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
+        Self { drm }
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
+pub trait KmsDriver: Driver {
+    /// Return a [`ModeConfigInfo`] structure for this [`device::Device`].
+    fn mode_config_info(
+        dev: &device::Device,
+        drm_data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
+    ) -> Result<ModeConfigInfo>;
+
+    /// Create mode objects like [`crtc::Crtc`], [`plane::Plane`], etc. for this device
+    fn create_objects(drm: &UnregisteredKmsDevice<'_, Self>) -> Result
+    where
+        Self: Sized;
+}
+
+impl<T: KmsDriver> private::KmsImpl for T {
+    type Driver = Self;
+
+    const MODE_CONFIG_OPS: Option<ModeConfigOps> = Some(ModeConfigOps {
+        kms_vtable: bindings::drm_mode_config_funcs {
+            atomic_check: Some(bindings::drm_atomic_helper_check),
+            fb_create: Some(bindings::drm_gem_fb_create),
+            mode_valid: None,
+            atomic_commit: Some(bindings::drm_atomic_helper_commit),
+            get_format_info: None,
+            atomic_state_free: None,
+            atomic_state_alloc: None,
+            atomic_state_clear: None,
+        },
+
+        kms_helper_vtable: bindings::drm_mode_config_helper_funcs {
+            atomic_commit_setup: None,
+            atomic_commit_tail: None,
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
+}
+
+impl<T: KmsDriver> KmsImpl for T {}
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
+    /// An optional default fourcc format code to be preferred for clients.
+    pub preferred_fourcc: Option<u32>,
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
2.48.1

