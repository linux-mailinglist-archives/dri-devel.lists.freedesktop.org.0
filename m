Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF40A85052
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 01:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5137510EA87;
	Thu, 10 Apr 2025 23:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dF2mAUlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD6910EA8E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 23:56:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E14C45C3F87;
 Thu, 10 Apr 2025 23:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B0BC4CEE9;
 Thu, 10 Apr 2025 23:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744329405;
 bh=fkJns83qNS0YdmYN8u4wUjdryxyadx6+DhmLR99ZIKE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dF2mAUlJw2lRjxOL2RhpgLzChhoB7RVlpuJFLx46J13XO8dkZY5VbdFZNZJVuebf1
 sG89Ijzr1XtRfTxirkV1WrzfSmXL8Bh03Z7FQE+KJCjXJ/8tcpfFjcFFQ9jTsYLU0d
 zLW2cdwzPils3EAfp5V2ipd25oEFiITmP51FHcOvBL40Vc5wDvrUuh01Fsm/QJ5h92
 hyjLh9sTLusZr80Z71DAxBTfeZxB2H7TSx4r7nB2QApHe1mVrY0oNjB/sz4qV3AOA7
 NhMcpS6DmoLknlintS0vTLkOMSX2Hl4PCMpCApgm046gCZtP7YPSNN5Bz6PaxmFB0m
 sSgxBZ0J6q8LA==
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
Subject: [PATCH v2 7/8] rust: drm: gem: Add GEM object abstraction
Date: Fri, 11 Apr 2025 01:55:26 +0200
Message-ID: <20250410235546.43736-8-dakr@kernel.org>
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

DRM GEM is the DRM memory management subsystem used by most modern
drivers; add a Rust abstraction for DRM GEM.

This includes the BaseObject trait, which contains operations shared by
all GEM object classes.

Signed-off-by: Asahi Lina <lina@asahilina.net>
[ Rework of GEM object abstractions
    * switch to the Opaque<T> type
    * fix (mutable) references to struct drm_gem_object (which in this
      context is UB)
    * drop all custom reference types in favor of AlwaysRefCounted
    * bunch of minor changes and simplifications (e.g. IntoGEMObject
      trait)
    * write and fix safety and invariant comments
    * remove necessity for and convert 'as' casts
    * original source archive: https://archive.is/dD5SL

  - Danilo ]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/bindings/bindings_helper.h |   2 +
 rust/helpers/drm.c              |  19 ++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/drm/device.rs       |   4 +-
 rust/kernel/drm/driver.rs       |   2 +-
 rust/kernel/drm/gem/mod.rs      | 321 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 7 files changed, 348 insertions(+), 2 deletions(-)
 create mode 100644 rust/helpers/drm.c
 create mode 100644 rust/kernel/drm/gem/mod.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index e39fb4210710..f4d75f889e87 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -9,6 +9,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/blk-mq.h>
@@ -59,3 +60,4 @@ const gfp_t RUST_CONST_HELPER___GFP_ZERO = __GFP_ZERO;
 const gfp_t RUST_CONST_HELPER___GFP_HIGHMEM = ___GFP_HIGHMEM;
 const gfp_t RUST_CONST_HELPER___GFP_NOWARN = ___GFP_NOWARN;
 const blk_features_t RUST_CONST_HELPER_BLK_FEAT_ROTATIONAL = BLK_FEAT_ROTATIONAL;
+const fop_flags_t RUST_CONST_HELPER_FOP_UNSIGNED_OFFSET = FOP_UNSIGNED_OFFSET;
diff --git a/rust/helpers/drm.c b/rust/helpers/drm.c
new file mode 100644
index 000000000000..0c8f7200d29e
--- /dev/null
+++ b/rust/helpers/drm.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_gem.h>
+#include <drm/drm_vma_manager.h>
+
+void rust_helper_drm_gem_object_get(struct drm_gem_object *obj)
+{
+	drm_gem_object_get(obj);
+}
+
+void rust_helper_drm_gem_object_put(struct drm_gem_object *obj)
+{
+	drm_gem_object_put(obj);
+}
+
+__u64 rust_helper_drm_vma_node_offset_addr(struct drm_vma_offset_node *node)
+{
+	return drm_vma_node_offset_addr(node);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index e1c21eba9b15..1c360c58bc83 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -14,6 +14,7 @@
 #include "cpumask.c"
 #include "cred.c"
 #include "device.c"
+#include "drm.c"
 #include "err.c"
 #include "fs.c"
 #include "io.c"
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index f7d7abf83fa4..c5a279e63010 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -84,9 +84,11 @@ impl<T: drm::Driver> Device<T> {
         driver_features: drm::driver::FEAT_GEM,
         ioctls: T::IOCTLS.as_ptr(),
         num_ioctls: T::IOCTLS.len() as i32,
-        fops: core::ptr::null_mut() as _,
+        fops: &Self::GEM_FOPS as _,
     };
 
+    const GEM_FOPS: bindings::file_operations = drm::gem::create_fops();
+
     /// Create a new `drm::Device` for a `drm::Driver`.
     pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<ARef<Self>> {
         // SAFETY:
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 24c2225b5d28..9d234b08a888 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -90,7 +90,7 @@ pub struct AllocOps {
 }
 
 /// Trait for memory manager implementations. Implemented internally.
-pub trait AllocImpl: super::private::Sealed {
+pub trait AllocImpl: super::private::Sealed + drm::gem::IntoGEMObject {
     /// The C callback operations for this memory manager.
     const ALLOC_OPS: AllocOps;
 }
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
new file mode 100644
index 000000000000..6f4ca75bc7d5
--- /dev/null
+++ b/rust/kernel/drm/gem/mod.rs
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM GEM API
+//!
+//! C header: [`include/linux/drm/drm_gem.h`](srctree/include/linux/drm/drm_gem.h)
+
+use crate::{
+    alloc::flags::*,
+    bindings, drm,
+    drm::driver::{AllocImpl, AllocOps},
+    error::{to_result, Result},
+    prelude::*,
+    types::{ARef, Opaque},
+};
+use core::{mem, ops::Deref, ptr};
+
+/// GEM object functions, which must be implemented by drivers.
+pub trait BaseDriverObject<T: BaseObject>: Sync + Send + Sized {
+    /// Create a new driver data object for a GEM object of a given size.
+    fn new(dev: &drm::Device<T::Driver>, size: usize) -> impl PinInit<Self, Error>;
+
+    /// Open a new handle to an existing object, associated with a File.
+    fn open(
+        _obj: &<<T as IntoGEMObject>::Driver as drm::Driver>::Object,
+        _file: &drm::File<<<T as IntoGEMObject>::Driver as drm::Driver>::File>,
+    ) -> Result {
+        Ok(())
+    }
+
+    /// Close a handle to an existing object, associated with a File.
+    fn close(
+        _obj: &<<T as IntoGEMObject>::Driver as drm::Driver>::Object,
+        _file: &drm::File<<<T as IntoGEMObject>::Driver as drm::Driver>::File>,
+    ) {
+    }
+}
+
+/// Trait that represents a GEM object subtype
+pub trait IntoGEMObject: Sized + super::private::Sealed {
+    /// Owning driver for this type
+    type Driver: drm::Driver;
+
+    /// Returns a reference to the raw `drm_gem_object` structure, which must be valid as long as
+    /// this owning object is valid.
+    #[allow(clippy::wrong_self_convention)]
+    fn into_gem_obj(&self) -> &Opaque<bindings::drm_gem_object>;
+
+    /// Converts a pointer to a `struct drm_gem_object` into a pointer to `Self`.
+    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Self;
+}
+
+/// Trait which must be implemented by drivers using base GEM objects.
+pub trait DriverObject: BaseDriverObject<Object<Self>> {
+    /// Parent `Driver` for this object.
+    type Driver: drm::Driver;
+}
+
+extern "C" fn open_callback<T: BaseDriverObject<U>, U: BaseObject>(
+    raw_obj: *mut bindings::drm_gem_object,
+    raw_file: *mut bindings::drm_file,
+) -> core::ffi::c_int {
+    // SAFETY: `open_callback` is only ever called with a valid pointer to a `struct drm_file`.
+    let file = unsafe {
+        drm::File::<<<U as IntoGEMObject>::Driver as drm::Driver>::File>::as_ref(raw_file)
+    };
+    let obj =
+        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::from_gem_obj(
+            raw_obj,
+        );
+
+    // SAFETY: `from_gem_obj()` returns a valid pointer as long as the type is correct and the
+    // `raw_obj` we got is valid.
+    match T::open(unsafe { &*obj }, file) {
+        Err(e) => e.to_errno(),
+        Ok(()) => 0,
+    }
+}
+
+extern "C" fn close_callback<T: BaseDriverObject<U>, U: BaseObject>(
+    raw_obj: *mut bindings::drm_gem_object,
+    raw_file: *mut bindings::drm_file,
+) {
+    // SAFETY: `open_callback` is only ever called with a valid pointer to a `struct drm_file`.
+    let file = unsafe {
+        drm::File::<<<U as IntoGEMObject>::Driver as drm::Driver>::File>::as_ref(raw_file)
+    };
+    let obj =
+        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::from_gem_obj(
+            raw_obj,
+        );
+
+    // SAFETY: `from_gem_obj()` returns a valid pointer as long as the type is correct and the
+    // `raw_obj` we got is valid.
+    T::close(unsafe { &*obj }, file);
+}
+
+impl<T: DriverObject> IntoGEMObject for Object<T> {
+    type Driver = T::Driver;
+
+    fn into_gem_obj(&self) -> &Opaque<bindings::drm_gem_object> {
+        &self.obj
+    }
+
+    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Self {
+        // SAFETY: All of our objects are Object<T>.
+        unsafe { crate::container_of!(obj, Object<T>, obj).cast_mut() }
+    }
+}
+
+/// Base operations shared by all GEM object classes
+pub trait BaseObject
+where
+    Self: crate::types::AlwaysRefCounted + IntoGEMObject,
+{
+    /// Returns the size of the object in bytes.
+    fn size(&self) -> usize {
+        // SAFETY: `self.into_gem_obj()` is guaranteed to be a pointer to a valid `struct
+        // drm_gem_object`.
+        unsafe { (*self.into_gem_obj().get()).size }
+    }
+
+    /// Creates a new handle for the object associated with a given `File`
+    /// (or returns an existing one).
+    fn create_handle(
+        &self,
+        file: &drm::File<<<Self as IntoGEMObject>::Driver as drm::Driver>::File>,
+    ) -> Result<u32> {
+        let mut handle: u32 = 0;
+        // SAFETY: The arguments are all valid per the type invariants.
+        to_result(unsafe {
+            bindings::drm_gem_handle_create(
+                file.as_raw().cast(),
+                self.into_gem_obj().get(),
+                &mut handle,
+            )
+        })?;
+        Ok(handle)
+    }
+
+    /// Looks up an object by its handle for a given `File`.
+    fn lookup_handle(
+        file: &drm::File<<<Self as IntoGEMObject>::Driver as drm::Driver>::File>,
+        handle: u32,
+    ) -> Result<ARef<Self>> {
+        // SAFETY: The arguments are all valid per the type invariants.
+        let ptr = unsafe { bindings::drm_gem_object_lookup(file.as_raw().cast(), handle) };
+        let ptr = <Self as IntoGEMObject>::from_gem_obj(ptr);
+        let ptr = ptr::NonNull::new(ptr).ok_or(ENOENT)?;
+
+        // SAFETY: We take ownership of the reference of `drm_gem_object_lookup()`.
+        Ok(unsafe { ARef::from_raw(ptr) })
+    }
+
+    /// Creates an mmap offset to map the object from userspace.
+    fn create_mmap_offset(&self) -> Result<u64> {
+        // SAFETY: The arguments are valid per the type invariant.
+        to_result(unsafe { bindings::drm_gem_create_mmap_offset(self.into_gem_obj().get()) })?;
+
+        // SAFETY: The arguments are valid per the type invariant.
+        Ok(unsafe {
+            bindings::drm_vma_node_offset_addr(ptr::addr_of_mut!(
+                (*self.into_gem_obj().get()).vma_node
+            ))
+        })
+    }
+}
+
+impl<T> BaseObject for T where Self: crate::types::AlwaysRefCounted + IntoGEMObject {}
+
+/// A base GEM object.
+///
+/// Invariants
+///
+/// `self.dev` is always a valid pointer to a `struct drm_device`.
+#[repr(C)]
+#[pin_data]
+pub struct Object<T: DriverObject + Send + Sync> {
+    obj: Opaque<bindings::drm_gem_object>,
+    dev: ptr::NonNull<bindings::drm_device>,
+    #[pin]
+    data: T,
+}
+
+impl<T: DriverObject> Object<T> {
+    /// The size of this object's structure.
+    pub const SIZE: usize = mem::size_of::<Self>();
+
+    const OBJECT_FUNCS: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
+        free: Some(Self::free_callback),
+        open: Some(open_callback::<T, Object<T>>),
+        close: Some(close_callback::<T, Object<T>>),
+        print_info: None,
+        export: None,
+        pin: None,
+        unpin: None,
+        get_sg_table: None,
+        vmap: None,
+        vunmap: None,
+        mmap: None,
+        status: None,
+        vm_ops: core::ptr::null_mut(),
+        evict: None,
+        rss: None,
+    };
+
+    /// Create a new GEM object.
+    pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
+        let obj: Pin<KBox<Self>> = KBox::pin_init(
+            try_pin_init!(Self {
+                obj: Opaque::new(bindings::drm_gem_object::default()),
+                data <- T::new(dev, size),
+                // INVARIANT: The drm subsystem guarantees that the `struct drm_device` will live
+                // as long as the GEM object lives.
+                //
+                // SAFETY: By the type invariants of `drm::Device`, `dev.as_raw()` must be valid.
+                dev: unsafe { ptr::NonNull::new_unchecked(dev.as_raw()) },
+            }),
+            GFP_KERNEL,
+        )?;
+
+        // SAFETY: `obj.as_raw()` is guaranteed to be valid by the initialization above.
+        unsafe { (*obj.as_raw()).funcs = &Self::OBJECT_FUNCS };
+
+        // SAFETY: The arguments are all valid per the type invariants.
+        to_result(unsafe { bindings::drm_gem_object_init(dev.as_raw(), obj.obj.get(), size) })?;
+
+        // SAFETY: We never move out of `Self`.
+        let ptr = KBox::into_raw(unsafe { Pin::into_inner_unchecked(obj) });
+
+        // SAFETY: `ptr` comes from `KBox::into_raw` and hence can't be NULL.
+        let ptr = unsafe { ptr::NonNull::new_unchecked(ptr) };
+
+        // SAFETY: We take over the initial reference count from `drm_gem_object_init()`.
+        Ok(unsafe { ARef::from_raw(ptr) })
+    }
+
+    /// Returns the `Device` that owns this GEM object.
+    pub fn dev(&self) -> &drm::Device<T::Driver> {
+        // SAFETY: The DRM subsystem guarantees that the `struct drm_device` will live as long as
+        // the GEM object lives, so we can just borrow from the raw pointer.
+        unsafe { drm::Device::as_ref(self.dev.as_ptr()) }
+    }
+
+    fn as_raw(&self) -> *mut bindings::drm_gem_object {
+        self.obj.get()
+    }
+
+    extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
+        // SAFETY: All of our objects are of type `Object<T>`.
+        let this = unsafe { crate::container_of!(obj, Self, obj) }.cast_mut();
+
+        // SAFETY: The C code only ever calls this callback with a valid pointer to a `struct
+        // drm_gem_object`.
+        unsafe { bindings::drm_gem_object_release(obj) };
+
+        // SAFETY: All of our objects are allocated via `KBox`, and we're in the
+        // free callback which guarantees this object has zero remaining references,
+        // so we can drop it.
+        let _ = unsafe { KBox::from_raw(this) };
+    }
+}
+
+// SAFETY: Instances of `Object<T>` are always reference-counted.
+unsafe impl<T: DriverObject> crate::types::AlwaysRefCounted for Object<T> {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::drm_gem_object_get(self.as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
+        // SAFETY: `obj` is a valid pointer to an `Object<T>`.
+        let obj = unsafe { obj.as_ref() };
+
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::drm_gem_object_put(obj.as_raw()) }
+    }
+}
+
+impl<T: DriverObject> super::private::Sealed for Object<T> {}
+
+impl<T: DriverObject> Deref for Object<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.data
+    }
+}
+
+impl<T: DriverObject> AllocImpl for Object<T> {
+    const ALLOC_OPS: AllocOps = AllocOps {
+        gem_create_object: None,
+        prime_handle_to_fd: None,
+        prime_fd_to_handle: None,
+        gem_prime_import: None,
+        gem_prime_import_sg_table: None,
+        dumb_create: None,
+        dumb_map_offset: None,
+    };
+}
+
+pub(super) const fn create_fops() -> bindings::file_operations {
+    // SAFETY: As by the type invariant, it is safe to initialize `bindings::file_operations`
+    // zeroed.
+    let mut fops: bindings::file_operations = unsafe { core::mem::zeroed() };
+
+    fops.owner = core::ptr::null_mut();
+    fops.open = Some(bindings::drm_open);
+    fops.release = Some(bindings::drm_release);
+    fops.unlocked_ioctl = Some(bindings::drm_ioctl);
+    #[cfg(CONFIG_COMPAT)]
+    {
+        fops.compat_ioctl = Some(bindings::drm_compat_ioctl);
+    }
+    fops.poll = Some(bindings::drm_poll);
+    fops.read = Some(bindings::drm_read);
+    fops.llseek = Some(bindings::noop_llseek);
+    fops.mmap = Some(bindings::drm_gem_mmap);
+    fops.fop_flags = bindings::FOP_UNSIGNED_OFFSET;
+
+    fops
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index b36223e5bd98..1b82b6945edf 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -5,6 +5,7 @@
 pub mod device;
 pub mod driver;
 pub mod file;
+pub mod gem;
 pub mod ioctl;
 
 pub use self::device::Device;
-- 
2.49.0

