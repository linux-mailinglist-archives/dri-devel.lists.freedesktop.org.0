Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B936AE24E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A14710E4AB;
	Tue,  7 Mar 2023 14:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FF610E4AB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 14:27:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 40213424E8;
 Tue,  7 Mar 2023 14:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678199245;
 bh=Myw41AQHjD5rzjM1j2FKHqXtGruOkIC1O9lJa78/vVw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=m7rJ9bubpU2eWduCvFK5/ydxBV740I3KYlHlxZSn7BX2f/GmL3Hchi/ZRvs3b51Im
 ahhGj9ECY0CINGig8I7i8iFaPycNS+M4narw/lGH7Dwg4xDH3ndYU+2EIPNz6FJfXM
 hoCntsHB68dZSgOtMB4G1HYLkypMNEvJCWVMROd7Db9CmH1+kUBNAGwdmQVirB+CTU
 O3MWJv4BeL/ioBsxWvVAQxp05cAWDGfZJyQ2GyOBv8mn4fXCv0/taSZbd61CWNUwL3
 AxRIvjB2j7NjYWFL7GH3XCUsf4l/nsfza/f6oXJR5cTLJhHwQknv52NIS8FJ1BWmNs
 tlH2eg5ICU+Rg==
From: Asahi Lina <lina@asahilina.net>
Date: Tue, 07 Mar 2023 23:25:31 +0900
Subject: [PATCH RFC 06/18] rust: drm: gem: shmem: Add DRM shmem helper
 abstraction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-rust-drm-v1-6-917ff5bc80a8@asahilina.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678199191; l=17977;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=Myw41AQHjD5rzjM1j2FKHqXtGruOkIC1O9lJa78/vVw=;
 b=2bzmg2GBDxzMtheU4BnU4u1o1j34J+4xXpa+rnINpwVPG76o6w5BnYjHYSkPaD11xDz8jxumt
 Pd/z5Mqop8tBilCmR38aV6+KhByVJWsiP0GiYgvMZgiB9wwgcWYKRLZ
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

The DRM shmem helper includes common code useful for drivers which
allocate GEM objects as anonymous shmem. Add a Rust abstraction for
this. Drivers can choose the raw GEM implementation or the shmem layer,
depending on their needs.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 drivers/gpu/drm/Kconfig         |   5 +
 rust/bindings/bindings_helper.h |   2 +
 rust/helpers.c                  |  67 +++++++
 rust/kernel/drm/gem/mod.rs      |   3 +
 rust/kernel/drm/gem/shmem.rs    | 381 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 458 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index dab8f0f9aa96..70a983a17ac2 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -34,6 +34,11 @@ config RUST_DRM
 	bool "Rust support for the DRM subsystem"
 	depends on DRM=y
 
+config RUST_DRM_GEM_SHMEM_HELPER
+	bool
+	depends on RUST_DRM
+	select DRM_GEM_SHMEM_HELPER
+
 config DRM_MIPI_DBI
 	tristate
 	depends on DRM
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 7183dfe6473f..9f152d373df8 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -17,6 +18,7 @@
 #include <linux/fs.h>
 #include <linux/ioctl.h>
 #include <linux/io-pgtable.h>
+#include <linux/iosys-map.h>
 #include <linux/ktime.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/rust/helpers.c b/rust/helpers.c
index 78ec4162b03b..388ff1100ea5 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -19,6 +19,7 @@
  */
 
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <linux/bug.h>
 #include <linux/build_bug.h>
 #include <linux/device.h>
@@ -375,6 +376,18 @@ void rust_helper_init_completion(struct completion *c)
 }
 EXPORT_SYMBOL_GPL(rust_helper_init_completion);
 
+dma_addr_t rust_helper_sg_dma_address(const struct scatterlist *sg)
+{
+	return sg_dma_address(sg);
+}
+EXPORT_SYMBOL_GPL(rust_helper_sg_dma_address);
+
+int rust_helper_sg_dma_len(const struct scatterlist *sg)
+{
+	return sg_dma_len(sg);
+}
+EXPORT_SYMBOL_GPL(rust_helper_sg_dma_len);
+
 #ifdef CONFIG_DRM
 
 void rust_helper_drm_gem_object_get(struct drm_gem_object *obj)
@@ -395,6 +408,60 @@ __u64 rust_helper_drm_vma_node_offset_addr(struct drm_vma_offset_node *node)
 }
 EXPORT_SYMBOL_GPL(rust_helper_drm_vma_node_offset_addr);
 
+#ifdef CONFIG_DRM_GEM_SHMEM_HELPER
+
+void rust_helper_drm_gem_shmem_object_free(struct drm_gem_object *obj)
+{
+	return drm_gem_shmem_object_free(obj);
+}
+EXPORT_SYMBOL_GPL(rust_helper_drm_gem_shmem_object_free);
+
+void rust_helper_drm_gem_shmem_object_print_info(struct drm_printer *p, unsigned int indent,
+						   const struct drm_gem_object *obj)
+{
+	drm_gem_shmem_object_print_info(p, indent, obj);
+}
+EXPORT_SYMBOL_GPL(rust_helper_drm_gem_shmem_object_print_info);
+
+int rust_helper_drm_gem_shmem_object_pin(struct drm_gem_object *obj)
+{
+	return drm_gem_shmem_object_pin(obj);
+}
+EXPORT_SYMBOL_GPL(rust_helper_drm_gem_shmem_object_pin);
+
+void rust_helper_drm_gem_shmem_object_unpin(struct drm_gem_object *obj)
+{
+	drm_gem_shmem_object_unpin(obj);
+}
+EXPORT_SYMBOL_GPL(rust_helper_drm_gem_shmem_object_unpin);
+
+struct sg_table *rust_helper_drm_gem_shmem_object_get_sg_table(struct drm_gem_object *obj)
+{
+	return drm_gem_shmem_object_get_sg_table(obj);
+}
+EXPORT_SYMBOL_GPL(rust_helper_drm_gem_shmem_object_get_sg_table);
+
+int rust_helper_drm_gem_shmem_object_vmap(struct drm_gem_object *obj,
+					    struct iosys_map *map)
+{
+	return drm_gem_shmem_object_vmap(obj, map);
+}
+EXPORT_SYMBOL_GPL(rust_helper_drm_gem_shmem_object_vmap);
+
+void rust_helper_drm_gem_shmem_object_vunmap(struct drm_gem_object *obj,
+					       struct iosys_map *map)
+{
+	drm_gem_shmem_object_vunmap(obj, map);
+}
+EXPORT_SYMBOL_GPL(rust_helper_drm_gem_shmem_object_vunmap);
+
+int rust_helper_drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	return drm_gem_shmem_object_mmap(obj, vma);
+}
+EXPORT_SYMBOL_GPL(rust_helper_drm_gem_shmem_object_mmap);
+
+#endif
 #endif
 
 /*
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 8a7d99613718..e66bdef35c2e 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -4,6 +4,9 @@
 //!
 //! C header: [`include/linux/drm/drm_gem.h`](../../../../include/linux/drm/drm_gem.h)
 
+#[cfg(CONFIG_RUST_DRM_GEM_SHMEM_HELPER)]
+pub mod shmem;
+
 use alloc::boxed::Box;
 
 use crate::{
diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
new file mode 100644
index 000000000000..15446ea1113e
--- /dev/null
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -0,0 +1,381 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! DRM GEM shmem helper objects
+//!
+//! C header: [`include/linux/drm/drm_gem_shmem_helper.h`](../../../../include/linux/drm/drm_gem_shmem_helper.h)
+
+use crate::drm::{device, drv, gem};
+use crate::{
+    error::{from_kernel_err_ptr, to_result},
+    prelude::*,
+};
+use core::{
+    marker::PhantomData,
+    mem,
+    mem::{ManuallyDrop, MaybeUninit},
+    ops::{Deref, DerefMut},
+    ptr::addr_of_mut,
+    slice,
+};
+
+use gem::BaseObject;
+
+/// Trait which must be implemented by drivers using shmem-backed GEM objects.
+pub trait DriverObject: gem::BaseDriverObject<Object<Self>> {
+    /// Parent `Driver` for this object.
+    type Driver: drv::Driver;
+}
+
+// FIXME: This is terrible and I don't know how to avoid it
+#[cfg(CONFIG_NUMA)]
+macro_rules! vm_numa_fields {
+    ( $($field:ident: $val:expr),* $(,)? ) => {
+        bindings::vm_operations_struct {
+            $( $field: $val ),*,
+            set_policy: None,
+            get_policy: None,
+        }
+    }
+}
+
+#[cfg(not(CONFIG_NUMA))]
+macro_rules! vm_numa_fields {
+    ( $($field:ident: $val:expr),* $(,)? ) => {
+        bindings::vm_operations_struct {
+            $( $field: $val ),*
+        }
+    }
+}
+
+const SHMEM_VM_OPS: bindings::vm_operations_struct = vm_numa_fields! {
+    open: Some(bindings::drm_gem_shmem_vm_open),
+    close: Some(bindings::drm_gem_shmem_vm_close),
+    may_split: None,
+    mremap: None,
+    mprotect: None,
+    fault: Some(bindings::drm_gem_shmem_fault),
+    huge_fault: None,
+    map_pages: None,
+    pagesize: None,
+    page_mkwrite: None,
+    pfn_mkwrite: None,
+    access: None,
+    name: None,
+    find_special_page: None,
+};
+
+/// A shmem-backed GEM object.
+#[repr(C)]
+pub struct Object<T: DriverObject> {
+    obj: bindings::drm_gem_shmem_object,
+    // The DRM core ensures the Device exists as long as its objects exist, so we don't need to
+    // manage the reference count here.
+    dev: ManuallyDrop<device::Device<T::Driver>>,
+    inner: T,
+}
+
+unsafe extern "C" fn gem_create_object<T: DriverObject>(
+    raw_dev: *mut bindings::drm_device,
+    size: usize,
+) -> *mut bindings::drm_gem_object {
+    // SAFETY: GEM ensures the device lives as long as its objects live,
+    // so we can conjure up a reference from thin air and never drop it.
+    let dev = ManuallyDrop::new(unsafe { device::Device::from_raw(raw_dev) });
+
+    let inner = match T::new(&*dev, size) {
+        Ok(v) => v,
+        Err(e) => return e.to_ptr(),
+    };
+
+    let p = unsafe {
+        bindings::krealloc(
+            core::ptr::null(),
+            Object::<T>::SIZE,
+            bindings::GFP_KERNEL | bindings::__GFP_ZERO,
+        ) as *mut Object<T>
+    };
+
+    if p.is_null() {
+        return ENOMEM.to_ptr();
+    }
+
+    // SAFETY: p is valid as long as the alloc succeeded
+    unsafe {
+        addr_of_mut!((*p).dev).write(dev);
+        addr_of_mut!((*p).inner).write(inner);
+    }
+
+    // SAFETY: drm_gem_shmem_object is safe to zero-init, and
+    // the rest of Object has been initialized
+    let new: &mut Object<T> = unsafe { &mut *(p as *mut _) };
+
+    new.obj.base.funcs = &Object::<T>::VTABLE;
+    &mut new.obj.base
+}
+
+unsafe extern "C" fn free_callback<T: DriverObject>(obj: *mut bindings::drm_gem_object) {
+    // SAFETY: All of our objects are Object<T>.
+    let p = crate::container_of!(obj, Object<T>, obj) as *mut Object<T>;
+
+    // SAFETY: p is never used after this
+    unsafe {
+        core::ptr::drop_in_place(&mut (*p).inner);
+    }
+
+    // SAFETY: This pointer has to be valid, since p is valid
+    unsafe {
+        bindings::drm_gem_shmem_free(&mut (*p).obj);
+    }
+}
+
+impl<T: DriverObject> Object<T> {
+    /// The size of this object's structure.
+    const SIZE: usize = mem::size_of::<Self>();
+
+    /// `drm_gem_object_funcs` vtable suitable for GEM shmem objects.
+    const VTABLE: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
+        free: Some(free_callback::<T>),
+        open: Some(super::open_callback::<T, Object<T>>),
+        close: Some(super::close_callback::<T, Object<T>>),
+        print_info: Some(bindings::drm_gem_shmem_object_print_info),
+        export: None,
+        pin: Some(bindings::drm_gem_shmem_object_pin),
+        unpin: Some(bindings::drm_gem_shmem_object_unpin),
+        get_sg_table: Some(bindings::drm_gem_shmem_object_get_sg_table),
+        vmap: Some(bindings::drm_gem_shmem_object_vmap),
+        vunmap: Some(bindings::drm_gem_shmem_object_vunmap),
+        mmap: Some(bindings::drm_gem_shmem_object_mmap),
+        vm_ops: &SHMEM_VM_OPS,
+    };
+
+    // SAFETY: Must only be used with DRM functions that are thread-safe
+    unsafe fn mut_shmem(&self) -> *mut bindings::drm_gem_shmem_object {
+        &self.obj as *const _ as *mut _
+    }
+
+    /// Create a new shmem-backed DRM object of the given size.
+    pub fn new(dev: &device::Device<T::Driver>, size: usize) -> Result<gem::UniqueObjectRef<Self>> {
+        // SAFETY: This function can be called as long as the ALLOC_OPS are set properly
+        // for this driver, and the gem_create_object is called.
+        let p = unsafe { bindings::drm_gem_shmem_create(dev.raw() as *mut _, size) };
+        let p = crate::container_of!(p, Object<T>, obj) as *mut _;
+
+        // SAFETY: The gem_create_object callback ensures this is a valid Object<T>,
+        // so we can take a unique reference to it.
+        let obj_ref = gem::UniqueObjectRef { ptr: p };
+
+        Ok(obj_ref)
+    }
+
+    /// Returns the `Device` that owns this GEM object.
+    pub fn dev(&self) -> &device::Device<T::Driver> {
+        &self.dev
+    }
+
+    /// Creates (if necessary) and returns a scatter-gather table of DMA pages for this object.
+    ///
+    /// This will pin the object in memory.
+    pub fn sg_table(&self) -> Result<SGTable<T>> {
+        // SAFETY: drm_gem_shmem_get_pages_sgt is thread-safe.
+        let sgt = from_kernel_err_ptr(unsafe {
+            bindings::drm_gem_shmem_get_pages_sgt(self.mut_shmem())
+        })?;
+
+        Ok(SGTable {
+            sgt,
+            _owner: self.reference(),
+        })
+    }
+
+    /// Creates and returns a virtual kernel memory mapping for this object.
+    pub fn vmap(&self) -> Result<VMap<T>> {
+        let mut map: MaybeUninit<bindings::iosys_map> = MaybeUninit::uninit();
+
+        // SAFETY: drm_gem_shmem_vmap is thread-safe
+        to_result(unsafe { bindings::drm_gem_shmem_vmap(self.mut_shmem(), map.as_mut_ptr()) })?;
+
+        // SAFETY: if drm_gem_shmem_vmap did not fail, map is initialized now
+        let map = unsafe { map.assume_init() };
+
+        Ok(VMap {
+            map,
+            owner: self.reference(),
+        })
+    }
+
+    /// Set the write-combine flag for this object.
+    ///
+    /// Should be called before any mappings are made.
+    pub fn set_wc(&mut self, map_wc: bool) {
+        unsafe { (*self.mut_shmem()).map_wc = map_wc };
+    }
+}
+
+impl<T: DriverObject> Deref for Object<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+impl<T: DriverObject> DerefMut for Object<T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.inner
+    }
+}
+
+impl<T: DriverObject> crate::private::Sealed for Object<T> {}
+
+impl<T: DriverObject> gem::IntoGEMObject for Object<T> {
+    type Driver = T::Driver;
+
+    fn gem_obj(&self) -> *mut bindings::drm_gem_object {
+        &self.obj.base as *const _ as *mut _
+    }
+
+    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Object<T> {
+        crate::container_of!(obj, Object<T>, obj) as *mut Object<T>
+    }
+}
+
+impl<T: DriverObject> drv::AllocImpl for Object<T> {
+    const ALLOC_OPS: drv::AllocOps = drv::AllocOps {
+        gem_create_object: Some(gem_create_object::<T>),
+        prime_handle_to_fd: Some(bindings::drm_gem_prime_handle_to_fd),
+        prime_fd_to_handle: Some(bindings::drm_gem_prime_fd_to_handle),
+        gem_prime_import: None,
+        gem_prime_import_sg_table: Some(bindings::drm_gem_shmem_prime_import_sg_table),
+        gem_prime_mmap: Some(bindings::drm_gem_prime_mmap),
+        dumb_create: Some(bindings::drm_gem_shmem_dumb_create),
+        dumb_map_offset: None,
+        dumb_destroy: None,
+    };
+}
+
+/// A virtual mapping for a shmem-backed GEM object in kernel address space.
+pub struct VMap<T: DriverObject> {
+    map: bindings::iosys_map,
+    owner: gem::ObjectRef<Object<T>>,
+}
+
+impl<T: DriverObject> VMap<T> {
+    /// Returns a const raw pointer to the start of the mapping.
+    pub fn as_ptr(&self) -> *const core::ffi::c_void {
+        // SAFETY: The shmem helpers always return non-iomem maps
+        unsafe { self.map.__bindgen_anon_1.vaddr }
+    }
+
+    /// Returns a mutable raw pointer to the start of the mapping.
+    pub fn as_mut_ptr(&mut self) -> *mut core::ffi::c_void {
+        // SAFETY: The shmem helpers always return non-iomem maps
+        unsafe { self.map.__bindgen_anon_1.vaddr }
+    }
+
+    /// Returns a byte slice view of the mapping.
+    pub fn as_slice(&self) -> &[u8] {
+        // SAFETY: The vmap maps valid memory up to the owner size
+        unsafe { slice::from_raw_parts(self.as_ptr() as *const u8, self.owner.size()) }
+    }
+
+    /// Returns mutable a byte slice view of the mapping.
+    pub fn as_mut_slice(&mut self) -> &mut [u8] {
+        // SAFETY: The vmap maps valid memory up to the owner size
+        unsafe { slice::from_raw_parts_mut(self.as_mut_ptr() as *mut u8, self.owner.size()) }
+    }
+
+    /// Borrows a reference to the object that owns this virtual mapping.
+    pub fn owner(&self) -> &gem::ObjectRef<Object<T>> {
+        &self.owner
+    }
+}
+
+impl<T: DriverObject> Drop for VMap<T> {
+    fn drop(&mut self) {
+        // SAFETY: This function is thread-safe
+        unsafe {
+            bindings::drm_gem_shmem_vunmap(self.owner.mut_shmem(), &mut self.map);
+        }
+    }
+}
+
+/// SAFETY: `iosys_map` objects are safe to send across threads.
+unsafe impl<T: DriverObject> Send for VMap<T> {}
+unsafe impl<T: DriverObject> Sync for VMap<T> {}
+
+/// A single scatter-gather entry, representing a span of pages in the device's DMA address space.
+///
+/// For devices not behind a standalone IOMMU, this corresponds to physical addresses.
+#[repr(transparent)]
+pub struct SGEntry(bindings::scatterlist);
+
+impl SGEntry {
+    /// Returns the starting DMA address of this span
+    pub fn dma_address(&self) -> usize {
+        (unsafe { bindings::sg_dma_address(&self.0) }) as usize
+    }
+
+    /// Returns the length of this span in bytes
+    pub fn dma_len(&self) -> usize {
+        (unsafe { bindings::sg_dma_len(&self.0) }) as usize
+    }
+}
+
+/// A scatter-gather table of DMA address spans for a GEM shmem object.
+///
+/// # Invariants
+/// `sgt` must be a valid pointer to the `sg_table`, which must correspond to the owned
+/// object in `_owner` (which ensures it remains valid).
+pub struct SGTable<T: DriverObject> {
+    sgt: *const bindings::sg_table,
+    _owner: gem::ObjectRef<Object<T>>,
+}
+
+impl<T: DriverObject> SGTable<T> {
+    /// Returns an iterator through the SGTable's entries
+    pub fn iter(&'_ self) -> SGTableIter<'_> {
+        SGTableIter {
+            left: unsafe { (*self.sgt).nents } as usize,
+            sg: unsafe { (*self.sgt).sgl },
+            _p: PhantomData,
+        }
+    }
+}
+
+impl<'a, T: DriverObject> IntoIterator for &'a SGTable<T> {
+    type Item = &'a SGEntry;
+    type IntoIter = SGTableIter<'a>;
+
+    fn into_iter(self) -> Self::IntoIter {
+        self.iter()
+    }
+}
+
+/// SAFETY: `sg_table` objects are safe to send across threads.
+unsafe impl<T: DriverObject> Send for SGTable<T> {}
+unsafe impl<T: DriverObject> Sync for SGTable<T> {}
+
+/// An iterator through `SGTable` entries.
+///
+/// # Invariants
+/// `sg` must be a valid pointer to the scatterlist, which must outlive our lifetime.
+pub struct SGTableIter<'a> {
+    sg: *mut bindings::scatterlist,
+    left: usize,
+    _p: PhantomData<&'a ()>,
+}
+
+impl<'a> Iterator for SGTableIter<'a> {
+    type Item = &'a SGEntry;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        if self.left == 0 {
+            None
+        } else {
+            let sg = self.sg;
+            self.sg = unsafe { bindings::sg_next(self.sg) };
+            self.left -= 1;
+            Some(unsafe { &(*(sg as *const SGEntry)) })
+        }
+    }
+}

-- 
2.35.1

