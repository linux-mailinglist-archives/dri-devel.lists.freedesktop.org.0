Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D26AE249
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7BA10E4A8;
	Tue,  7 Mar 2023 14:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE1110E4A8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 14:26:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id EFF01420D8;
 Tue,  7 Mar 2023 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678199215;
 bh=ybXc676YDutsjlMaSuuenGoZJO/fukuHqULLdgV/v/M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=OpjjgA7LC7q4Glsexbn+nW/mRuBv6rhD+pd1NYciXMLw6u+H1RakS8DC5sXggG0cG
 Yd7SjxsIlxh0AkS1OthspkDO4sz81hphi9x5hXBrb9l/LKUV4XxP5Dr6x0Bv1VN7QJ
 JPOYSKEkvlAHwMATnLAjSaRiCKmnokEd6OTQ0Mu0ay6GhsN1g+hUgG/simriZqZCsB
 XPcBmLMCgB8rUy+OQn8gKjvKQg1SAGrorvM6lQgXslEQ3cdS94LXjOjhrOIoaeqrUB
 ASxFLNkLA2ydu5CGN9DDkJlr3E2Ck/1gD0mzAb3jDjmuc4YM1C3WPKe/AianXlSmwS
 Cg3r/1An4X4Dg==
From: Asahi Lina <lina@asahilina.net>
Date: Tue, 07 Mar 2023 23:25:27 +0900
Subject: [PATCH RFC 02/18] rust: drm: Add Device and Driver abstractions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-rust-drm-v1-2-917ff5bc80a8@asahilina.net>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
In-Reply-To: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678199191; l=16844;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=ybXc676YDutsjlMaSuuenGoZJO/fukuHqULLdgV/v/M=;
 b=ZAJvSXMpknOJW8GmoecAuTMvhH+w8WU/LojoH//ra2xRSLnc2949i7/QPHqsvsnwzxoW56X/r
 CCeFhXwJVd9AxNJFrQPow+MTQsL1NH1jvQhvrIsCC5yTlyWY2NPGHs8
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-sgx@vger.kernel.org,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the initial abstractions for DRM drivers and devices. These go
together in one commit since they are fairly tightly coupled types.

A few things have been stubbed out, to be implemented as further bits of
the DRM subsystem are introduced.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/bindings/bindings_helper.h |   3 +
 rust/kernel/drm/device.rs       |  76 +++++++++
 rust/kernel/drm/drv.rs          | 339 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   2 +
 4 files changed, 420 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 2687bef1676f..2a999138c4ae 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,10 +6,13 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/fs.h>
 #include <linux/ioctl.h>
 #include <linux/io-pgtable.h>
 #include <linux/ktime.h>
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
new file mode 100644
index 000000000000..6007f941137a
--- /dev/null
+++ b/rust/kernel/drm/device.rs
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM device.
+//!
+//! C header: [`include/linux/drm/drm_device.h`](../../../../include/linux/drm/drm_device.h)
+
+use crate::{bindings, device, drm, types::ForeignOwnable};
+use core::marker::PhantomData;
+
+/// Represents a reference to a DRM device. The device is reference-counted and is guaranteed to
+/// not be dropped while this object is alive.
+pub struct Device<T: drm::drv::Driver> {
+    // Type invariant: ptr must be a valid and initialized drm_device,
+    // and this value must either own a reference to it or the caller
+    // must ensure that it is never dropped if the reference is borrowed.
+    pub(super) ptr: *mut bindings::drm_device,
+    _p: PhantomData<T>,
+}
+
+impl<T: drm::drv::Driver> Device<T> {
+    // Not intended to be called externally, except via declare_drm_ioctls!()
+    #[doc(hidden)]
+    pub unsafe fn from_raw(raw: *mut bindings::drm_device) -> Device<T> {
+        Device {
+            ptr: raw,
+            _p: PhantomData,
+        }
+    }
+
+    #[allow(dead_code)]
+    pub(crate) fn raw(&self) -> *const bindings::drm_device {
+        self.ptr
+    }
+
+    pub(crate) fn raw_mut(&mut self) -> *mut bindings::drm_device {
+        self.ptr
+    }
+
+    /// Returns a borrowed reference to the user data associated with this Device.
+    pub fn data(&self) -> <T::Data as ForeignOwnable>::Borrowed<'_> {
+        unsafe { T::Data::borrow((*self.ptr).dev_private) }
+    }
+}
+
+impl<T: drm::drv::Driver> Drop for Device<T> {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // relinquish it now.
+        unsafe { bindings::drm_dev_put(self.ptr) };
+    }
+}
+
+impl<T: drm::drv::Driver> Clone for Device<T> {
+    fn clone(&self) -> Self {
+        // SAFETY: We get a new reference and then create a new owning object from the raw pointer
+        unsafe {
+            bindings::drm_dev_get(self.ptr);
+            Device::from_raw(self.ptr)
+        }
+    }
+}
+
+// SAFETY: `Device` only holds a pointer to a C device, which is safe to be used from any thread.
+unsafe impl<T: drm::drv::Driver> Send for Device<T> {}
+
+// SAFETY: `Device` only holds a pointer to a C device, references to which are safe to be used
+// from any thread.
+unsafe impl<T: drm::drv::Driver> Sync for Device<T> {}
+
+// Make drm::Device work for dev_info!() and friends
+unsafe impl<T: drm::drv::Driver> device::RawDevice for Device<T> {
+    fn raw_device(&self) -> *mut bindings::device {
+        // SAFETY: ptr must be valid per the type invariant
+        unsafe { (*self.ptr).dev }
+    }
+}
diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
new file mode 100644
index 000000000000..29a465515dc9
--- /dev/null
+++ b/rust/kernel/drm/drv.rs
@@ -0,0 +1,339 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM driver core.
+//!
+//! C header: [`include/linux/drm/drm_drv.h`](../../../../include/linux/drm/drm_drv.h)
+
+use crate::{
+    bindings, device, drm,
+    error::code::*,
+    error::from_kernel_err_ptr,
+    error::{Error, Result},
+    prelude::*,
+    private::Sealed,
+    str::CStr,
+    types::ForeignOwnable,
+    ThisModule,
+};
+use core::{
+    marker::{PhantomData, PhantomPinned},
+    pin::Pin,
+};
+use macros::vtable;
+
+/// Driver use the GEM memory manager. This should be set for all modern drivers.
+pub const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
+/// Driver supports mode setting interfaces (KMS).
+pub const FEAT_MODESET: u32 = bindings::drm_driver_feature_DRIVER_MODESET;
+/// Driver supports dedicated render nodes.
+pub const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
+/// Driver supports the full atomic modesetting userspace API.
+///
+/// Drivers which only use atomic internally, but do not support the full userspace API (e.g. not
+/// all properties converted to atomic, or multi-plane updates are not guaranteed to be tear-free)
+/// should not set this flag.
+pub const FEAT_ATOMIC: u32 = bindings::drm_driver_feature_DRIVER_ATOMIC;
+/// Driver supports DRM sync objects for explicit synchronization of command submission.
+pub const FEAT_SYNCOBJ: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ;
+/// Driver supports the timeline flavor of DRM sync objects for explicit synchronization of command
+/// submission.
+pub const FEAT_SYNCOBJ_TIMELINE: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ_TIMELINE;
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
+    /// Driver date.
+    pub date: &'static CStr,
+}
+
+/// Internal memory management operation set, normally created by memory managers (e.g. GEM).
+///
+/// See `kernel::drm::gem` and `kernel::drm::gem::shmem`.
+pub struct AllocOps {
+    pub(crate) gem_create_object: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            size: usize,
+        ) -> *mut bindings::drm_gem_object,
+    >,
+    pub(crate) prime_handle_to_fd: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            file_priv: *mut bindings::drm_file,
+            handle: u32,
+            flags: u32,
+            prime_fd: *mut core::ffi::c_int,
+        ) -> core::ffi::c_int,
+    >,
+    pub(crate) prime_fd_to_handle: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            file_priv: *mut bindings::drm_file,
+            prime_fd: core::ffi::c_int,
+            handle: *mut u32,
+        ) -> core::ffi::c_int,
+    >,
+    pub(crate) gem_prime_import: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            dma_buf: *mut bindings::dma_buf,
+        ) -> *mut bindings::drm_gem_object,
+    >,
+    pub(crate) gem_prime_import_sg_table: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            attach: *mut bindings::dma_buf_attachment,
+            sgt: *mut bindings::sg_table,
+        ) -> *mut bindings::drm_gem_object,
+    >,
+    pub(crate) gem_prime_mmap: Option<
+        unsafe extern "C" fn(
+            obj: *mut bindings::drm_gem_object,
+            vma: *mut bindings::vm_area_struct,
+        ) -> core::ffi::c_int,
+    >,
+    pub(crate) dumb_create: Option<
+        unsafe extern "C" fn(
+            file_priv: *mut bindings::drm_file,
+            dev: *mut bindings::drm_device,
+            args: *mut bindings::drm_mode_create_dumb,
+        ) -> core::ffi::c_int,
+    >,
+    pub(crate) dumb_map_offset: Option<
+        unsafe extern "C" fn(
+            file_priv: *mut bindings::drm_file,
+            dev: *mut bindings::drm_device,
+            handle: u32,
+            offset: *mut u64,
+        ) -> core::ffi::c_int,
+    >,
+    pub(crate) dumb_destroy: Option<
+        unsafe extern "C" fn(
+            file_priv: *mut bindings::drm_file,
+            dev: *mut bindings::drm_device,
+            handle: u32,
+        ) -> core::ffi::c_int,
+    >,
+}
+
+/// Trait for memory manager implementations. Implemented internally.
+pub trait AllocImpl: Sealed {
+    /// The C callback operations for this memory manager.
+    const ALLOC_OPS: AllocOps;
+}
+
+/// A DRM driver implementation.
+#[vtable]
+pub trait Driver {
+    /// Context data associated with the DRM driver
+    ///
+    /// Determines the type of the context data passed to each of the methods of the trait.
+    type Data: ForeignOwnable + Sync + Send;
+
+    /// The type used to manage memory for this driver.
+    ///
+    /// Should be either `drm::gem::Object<T>` or `drm::gem::shmem::Object<T>`.
+    type Object: AllocImpl;
+
+    /// Driver metadata
+    const INFO: DriverInfo;
+
+    /// Feature flags
+    const FEATURES: u32;
+
+    /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
+    const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
+}
+
+/// A registration of a DRM device
+///
+/// # Invariants:
+///
+/// drm is always a valid pointer to an allocated drm_device
+pub struct Registration<T: Driver> {
+    drm: drm::device::Device<T>,
+    registered: bool,
+    fops: bindings::file_operations,
+    vtable: Pin<Box<bindings::drm_driver>>,
+    _p: PhantomData<T>,
+    _pin: PhantomPinned,
+}
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
+/// Registers a DRM device with the rest of the kernel.
+///
+/// It automatically picks up THIS_MODULE.
+#[allow(clippy::crate_in_macro_def)]
+#[macro_export]
+macro_rules! drm_device_register {
+    ($reg:expr, $data:expr, $flags:expr $(,)?) => {{
+        $crate::drm::drv::Registration::register($reg, $data, $flags, &crate::THIS_MODULE)
+    }};
+}
+
+impl<T: Driver> Registration<T> {
+    const VTABLE: bindings::drm_driver = drm_legacy_fields! {
+        load: None,
+        open: None, // TODO: File abstraction
+        postclose: None, // TODO: File abstraction
+        lastclose: None,
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
+        gem_prime_mmap: T::Object::ALLOC_OPS.gem_prime_mmap,
+        dumb_create: T::Object::ALLOC_OPS.dumb_create,
+        dumb_map_offset: T::Object::ALLOC_OPS.dumb_map_offset,
+        dumb_destroy: T::Object::ALLOC_OPS.dumb_destroy,
+
+        major: T::INFO.major,
+        minor: T::INFO.minor,
+        patchlevel: T::INFO.patchlevel,
+        name: T::INFO.name.as_char_ptr() as *mut _,
+        desc: T::INFO.desc.as_char_ptr() as *mut _,
+        date: T::INFO.date.as_char_ptr() as *mut _,
+
+        driver_features: T::FEATURES,
+        ioctls: T::IOCTLS.as_ptr(),
+        num_ioctls: T::IOCTLS.len() as i32,
+        fops: core::ptr::null_mut(),
+    };
+
+    /// Creates a new [`Registration`] but does not register it yet.
+    ///
+    /// It is allowed to move.
+    pub fn new(parent: &dyn device::RawDevice) -> Result<Self> {
+        let vtable = Pin::new(Box::try_new(Self::VTABLE)?);
+        let raw_drm = unsafe { bindings::drm_dev_alloc(&*vtable, parent.raw_device()) };
+        let raw_drm = from_kernel_err_ptr(raw_drm)?;
+
+        // The reference count is one, and now we take ownership of that reference as a
+        // drm::device::Device.
+        let drm = unsafe { drm::device::Device::from_raw(raw_drm) };
+
+        Ok(Self {
+            drm,
+            registered: false,
+            vtable,
+            fops: Default::default(), // TODO: GEM abstraction
+            _pin: PhantomPinned,
+            _p: PhantomData,
+        })
+    }
+
+    /// Registers a DRM device with the rest of the kernel.
+    ///
+    /// Users are encouraged to use the [`drm_device_register!()`] macro because it automatically
+    /// picks up the current module.
+    pub fn register(
+        self: Pin<&mut Self>,
+        data: T::Data,
+        flags: usize,
+        module: &'static ThisModule,
+    ) -> Result {
+        if self.registered {
+            // Already registered.
+            return Err(EINVAL);
+        }
+
+        // SAFETY: We never move out of `this`.
+        let this = unsafe { self.get_unchecked_mut() };
+        let data_pointer = <T::Data as ForeignOwnable>::into_foreign(data);
+        // SAFETY: `drm` is valid per the type invariant
+        unsafe {
+            (*this.drm.raw_mut()).dev_private = data_pointer as *mut _;
+        }
+
+        this.fops.owner = module.0;
+        this.vtable.fops = &this.fops;
+
+        // SAFETY: The device is now initialized and ready to be registered.
+        let ret = unsafe { bindings::drm_dev_register(this.drm.raw_mut(), flags as u64) };
+        if ret < 0 {
+            // SAFETY: `data_pointer` was returned by `into_foreign` above.
+            unsafe { T::Data::from_foreign(data_pointer) };
+            return Err(Error::from_kernel_errno(ret));
+        }
+
+        this.registered = true;
+        Ok(())
+    }
+
+    /// Returns a reference to the `Device` instance for this registration.
+    pub fn device(&self) -> &drm::device::Device<T> {
+        &self.drm
+    }
+}
+
+// SAFETY: `Registration` doesn't offer any methods or access to fields when shared between threads
+// or CPUs, so it is safe to share it.
+unsafe impl<T: Driver> Sync for Registration<T> {}
+
+// SAFETY: Registration with and unregistration from the drm subsystem can happen from any thread.
+// Additionally, `T::Data` (which is dropped during unregistration) is `Send`, so it is ok to move
+// `Registration` to different threads.
+#[allow(clippy::non_send_fields_in_send_ty)]
+unsafe impl<T: Driver> Send for Registration<T> {}
+
+impl<T: Driver> Drop for Registration<T> {
+    /// Removes the registration from the kernel if it has completed successfully before.
+    fn drop(&mut self) {
+        if self.registered {
+            // Get a pointer to the data stored in device before destroying it.
+            // SAFETY: `drm` is valid per the type invariant
+            let data_pointer = unsafe { (*self.drm.raw_mut()).dev_private };
+
+            // SAFETY: Since `registered` is true, `self.drm` is both valid and registered.
+            unsafe { bindings::drm_dev_unregister(self.drm.raw_mut()) };
+
+            // Free data as well.
+            // SAFETY: `data_pointer` was returned by `into_foreign` during registration.
+            unsafe { <T::Data as ForeignOwnable>::from_foreign(data_pointer) };
+        }
+    }
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 9ec6d7cbcaf3..69376b3c6db9 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -2,4 +2,6 @@
 
 //! DRM subsystem abstractions.
 
+pub mod device;
+pub mod drv;
 pub mod ioctl;

-- 
2.35.1

