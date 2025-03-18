Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA247A67CFD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 20:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF2510E4BF;
	Tue, 18 Mar 2025 19:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="DM5R4GRJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97DB10E4BE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 19:23:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742325799; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Os6V6Td05KwIuZUgQfL2xcF2Mvz0o3nrG816ON/MJq4t3ocDlhcZwZPXSe2+dfBSJiwlfGnOdGwPRtv8rr8nVUJ5PrzFF4OT3VXz8N9+cEeeYQySBvf1jwY5auqL/mFnvhSBb/ur770ve98MLPcmDcX9ZlgNECnEsqucG/MYnsk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742325799;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=yhkkX4mxL4jXPbNs0ret7dE2Oxq6IFbOO5nxyNXlF6g=; 
 b=AQ2FBBaaTtkhbE5Vv286GIJS+VMOf0PdFri2pNGu8dWY8aRpb3yc/nYeKSmXT6C5UK1iHboK5lIWYEIgVHlnqiEjhY+y+/mwDWpdjOgl85jKtNmQ12r+xm49OZQ1RiAPmQWid6sKbJXA45owcdF4zbCpBb2SLgCYJWi+QKAnH3k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742325799; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=yhkkX4mxL4jXPbNs0ret7dE2Oxq6IFbOO5nxyNXlF6g=;
 b=DM5R4GRJjZnf/uzEtaTtaUJez2Jd55Sm5O92sz9v5RjvxaQ/ak2CC/9sqib2z4AE
 KgaxJ4NJt1XTmyi4JxAe0B4DlBO4+u3pB5U+Q7l7gWbdy/gNtJ6lteY5AvKzyU8ID9S
 4FmMTgdMeUU41s+W5QnCQp66CYQlqAtzblOC0Gs0=
Received: by mx.zohomail.com with SMTPS id 1742325797555216.6038219732734;
 Tue, 18 Mar 2025 12:23:17 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Tue, 18 Mar 2025 16:22:38 -0300
Subject: [PATCH 4/7] rust: drm: gem: shmem: Add DRM shmem helper
 abstraction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-drm-gem-shmem-v1-4-64b96511a84f@collabora.com>
References: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
In-Reply-To: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
 Asahi Lina <lina@asahilina.net>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External
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

The DRM shmem helper includes common code useful for drivers which
allocate GEM objects as anonymous shmem. Add a Rust abstraction for
this. Drivers can choose the raw GEM implementation or the shmem layer,
depending on their needs.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/bindings/bindings_helper.h |   3 +
 rust/helpers/drm.c              |  46 +++++
 rust/helpers/helpers.c          |   1 +
 rust/helpers/scatterlist.c      |  13 ++
 rust/kernel/drm/gem/mod.rs      |   2 +
 rust/kernel/drm/gem/shmem.rs    | 422 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 487 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 032416a23b31e8fcd4c820016e0ccc6f91af2682..085de6dc828c97139fe1664abec516628277896a 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/blk-mq.h>
@@ -23,6 +24,8 @@
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/ioport.h>
+#include <linux/iosys-map.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
 #include <linux/mdio.h>
diff --git a/rust/helpers/drm.c b/rust/helpers/drm.c
index 0c8f7200d29e7197758188299c79c51ca72584a5..032400032a6eb11351b2b7cf621b478ace547d26 100644
--- a/rust/helpers/drm.c
+++ b/rust/helpers/drm.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_vma_manager.h>
 
 void rust_helper_drm_gem_object_get(struct drm_gem_object *obj)
@@ -17,3 +18,48 @@ __u64 rust_helper_drm_vma_node_offset_addr(struct drm_vma_offset_node *node)
 {
 	return drm_vma_node_offset_addr(node);
 }
+
+#ifdef CONFIG_DRM_GEM_SHMEM_HELPER
+void rust_helper_drm_gem_shmem_object_free(struct drm_gem_object *obj)
+{
+	return drm_gem_shmem_object_free(obj);
+}
+
+void rust_helper_drm_gem_shmem_object_print_info(struct drm_printer *p, unsigned int indent,
+                                                  const struct drm_gem_object *obj)
+{
+	drm_gem_shmem_object_print_info(p, indent, obj);
+}
+
+int rust_helper_drm_gem_shmem_object_pin(struct drm_gem_object *obj)
+{
+	return drm_gem_shmem_object_pin(obj);
+}
+
+void rust_helper_drm_gem_shmem_object_unpin(struct drm_gem_object *obj)
+{
+	drm_gem_shmem_object_unpin(obj);
+}
+
+struct sg_table *rust_helper_drm_gem_shmem_object_get_sg_table(struct drm_gem_object *obj)
+{
+	return drm_gem_shmem_object_get_sg_table(obj);
+}
+
+int rust_helper_drm_gem_shmem_object_vmap(struct drm_gem_object *obj,
+                                           struct iosys_map *map)
+{
+	return drm_gem_shmem_object_vmap(obj, map);
+}
+
+void rust_helper_drm_gem_shmem_object_vunmap(struct drm_gem_object *obj,
+                                              struct iosys_map *map)
+{
+	drm_gem_shmem_object_vunmap(obj, map);
+}
+
+int rust_helper_drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	return drm_gem_shmem_object_mmap(obj, vma);
+}
+#endif
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index be3e6c2ffbe6de02d6830014226fdce9630607ab..10e8e7d3f10b3ec15aeba673f04a5538f0e0dbe8 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -28,6 +28,7 @@
 #include "rbtree.c"
 #include "rcu.c"
 #include "refcount.c"
+#include "scatterlist.c"
 #include "security.c"
 #include "signal.c"
 #include "slab.c"
diff --git a/rust/helpers/scatterlist.c b/rust/helpers/scatterlist.c
new file mode 100644
index 0000000000000000000000000000000000000000..cc5553b76c25f05e508f5db443d2b639017711eb
--- /dev/null
+++ b/rust/helpers/scatterlist.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/scatterlist.h>
+
+dma_addr_t rust_helper_sg_dma_address(const struct scatterlist *sg)
+{
+	return sg_dma_address(sg);
+}
+
+int rust_helper_sg_dma_len(const struct scatterlist *sg)
+{
+	return sg_dma_len(sg);
+}
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index e4e060d93ad12e1cb577cec5499389adf66e36a9..083faac8602885aee5ef213bb3302b79dfac4a95 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -3,6 +3,8 @@
 //! DRM GEM API
 //!
 //! C header: [`include/linux/drm/drm_gem.h`](srctree/include/linux/drm/drm_gem.h)
+#[cfg(CONFIG_DRM_GEM_SHMEM_HELPER = "y")]
+pub mod shmem;
 
 use crate::{
     alloc::flags::*,
diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
new file mode 100644
index 0000000000000000000000000000000000000000..cd080d820727fb39cb91cb0617df39310b5b68c8
--- /dev/null
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -0,0 +1,422 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! DRM GEM shmem helper objects
+//!
+//! C header: [`include/linux/drm/drm_gem_shmem_helper.h`](srctree/include/linux/drm/drm_gem_shmem_helper.h)
+
+use crate::drm::{device, drv, gem};
+use crate::{
+    error::{from_err_ptr, to_result},
+    prelude::*,
+};
+use core::{
+    marker::{PhantomData, PhantomPinned},
+    mem,
+    mem::MaybeUninit,
+    ops::{Deref, DerefMut},
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
+#[pin_data]
+pub struct Object<T: DriverObject> {
+    #[pin]
+    obj: bindings::drm_gem_shmem_object,
+    // The DRM core ensures the Device exists as long as its objects exist, so we don't need to
+    // manage the reference count here.
+    dev: *const bindings::drm_device,
+    #[pin]
+    inner: T,
+}
+
+// SAFETY: drm_gem_shmem_object is safe to zero-initialize
+unsafe impl init::Zeroable for bindings::drm_gem_shmem_object {}
+
+/// # Safety
+///
+/// This is only safe to be called from the GEM core.
+unsafe extern "C" fn gem_create_object<T: DriverObject>(
+    dev: *mut bindings::drm_device,
+    size: usize,
+) -> *mut bindings::drm_gem_object {
+    // SAFETY: krealloc is always safe to call like this
+    let p = unsafe {
+        bindings::krealloc(core::ptr::null(), Object::<T>::SIZE, bindings::GFP_KERNEL)
+            as *mut Object<T>
+    };
+
+    if p.is_null() {
+        return ENOMEM.to_ptr();
+    }
+
+    let init = try_pin_init!(Object {
+        obj <- init::zeroed(),
+        // SAFETY: GEM ensures the device lives as long as its objects live
+        inner <- T::new(unsafe { device::Device::borrow(dev)}, size),
+        dev,
+    });
+
+    // SAFETY: p is a valid pointer to an uninitialized Object<T>.
+    if let Err(e) = unsafe { init.__pinned_init(p) } {
+        // SAFETY: p is a valid pointer from `krealloc` and __pinned_init guarantees we can dealloc it.
+        unsafe { bindings::kfree(p as *mut _) };
+
+        return e.to_ptr();
+    }
+
+    // SAFETY: __pinned_init() guarantees the object has been initialized
+    let new: &mut Object<T> = unsafe { &mut *(p as *mut _) };
+
+    new.obj.base.funcs = &Object::<T>::VTABLE;
+    &mut new.obj.base
+}
+
+/// # Safety
+///
+/// This is only safe to be called from the GEM core.
+unsafe extern "C" fn free_callback<T: DriverObject>(obj: *mut bindings::drm_gem_object) {
+    // SAFETY: All of our objects are Object<T>.
+    let shmem = unsafe {
+        crate::container_of!(obj, bindings::drm_gem_shmem_object, base)
+            as *mut bindings::drm_gem_shmem_object
+    };
+    // SAFETY: All of our objects are Object<T>.
+    let p = unsafe { crate::container_of!(shmem, Object<T>, obj) as *mut Object<T> };
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
+        status: None,
+        rss: None,
+        vm_ops: &SHMEM_VM_OPS,
+        evict: None,
+    };
+
+    /// # Safety
+    ///
+    /// Must only be used with DRM functions that are thread-safe
+    unsafe fn mut_shmem(&self) -> *mut bindings::drm_gem_shmem_object {
+        &self.obj as *const _ as *mut _
+    }
+
+    /// Create a new shmem-backed DRM object of the given size.
+    pub fn new(dev: &device::Device<T::Driver>, size: usize) -> Result<gem::UniqueObjectRef<Self>> {
+        // SAFETY: This function can be called as long as the ALLOC_OPS are set properly
+        // for this driver, and the gem_create_object is called.
+        let p = unsafe {
+            let p = from_err_ptr(bindings::drm_gem_shmem_create(dev.as_raw(), size))?;
+            crate::container_of!(p, Object<T>, obj) as *mut _
+        };
+
+        let obj_ref = gem::UniqueObjectRef {
+            ptr: p,
+            _p: PhantomPinned,
+        };
+
+        Ok(obj_ref)
+    }
+
+    /// Returns the `Device` that owns this GEM object.
+    pub fn dev(&self) -> &device::Device<T::Driver> {
+        // SAFETY: GEM ensures that the device outlives its objects, so we can
+        // just borrow here.
+        unsafe { device::Device::borrow(self.dev) }
+    }
+
+    /// Creates (if necessary) and returns a scatter-gather table of DMA pages for this object.
+    ///
+    /// This will pin the object in memory.
+    pub fn sg_table(&self) -> Result<SGTable<T>> {
+        // SAFETY: drm_gem_shmem_get_pages_sgt is thread-safe.
+        let sgt = from_err_ptr(unsafe { bindings::drm_gem_shmem_get_pages_sgt(self.mut_shmem()) })?;
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
+        // SAFETY: drm_gem_shmem_vmap can be called with the DMA reservation lock held
+        to_result(unsafe {
+            let resv = self.obj.base.resv as *const _ as *mut _;
+            bindings::dma_resv_lock(resv, core::ptr::null_mut());
+            let ret = bindings::drm_gem_shmem_vmap(self.mut_shmem(), map.as_mut_ptr());
+            bindings::dma_resv_unlock(resv);
+            ret
+        })?;
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
+        self.obj.set_map_wc(map_wc);
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
+    fn gem_obj(&self) -> &bindings::drm_gem_object {
+        &self.obj.base
+    }
+
+    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Object<T> {
+        // SAFETY: The invariant guarantees this is correct.
+        unsafe {
+            let shmem = crate::container_of!(obj, bindings::drm_gem_shmem_object, base)
+                as *mut bindings::drm_gem_shmem_object;
+            crate::container_of!(shmem, Object<T>, obj) as *mut Object<T>
+        }
+    }
+}
+
+impl<T: DriverObject> drv::AllocImpl for Object<T> {
+    const ALLOC_OPS: drv::AllocOps = drv::AllocOps {
+        gem_create_object: Some(gem_create_object::<T>),
+        prime_handle_to_fd: None,
+        prime_fd_to_handle: None,
+        gem_prime_import: None,
+        gem_prime_import_sg_table: Some(bindings::drm_gem_shmem_prime_import_sg_table),
+        dumb_create: Some(bindings::drm_gem_shmem_dumb_create),
+        dumb_map_offset: None,
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
+        // SAFETY: This function is safe to call with the DMA reservation lock held
+        unsafe {
+            let resv = self.owner.obj.base.resv as *const _ as *mut _;
+            bindings::dma_resv_lock(resv, core::ptr::null_mut());
+            bindings::drm_gem_shmem_vunmap(self.owner.mut_shmem(), &mut self.map);
+            bindings::dma_resv_unlock(resv);
+        }
+    }
+}
+
+/// SAFETY: `iosys_map` objects are safe to send across threads.
+unsafe impl<T: DriverObject> Send for VMap<T> {}
+/// SAFETY: `iosys_map` objects are safe to send across threads.
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
+        // SAFETY: Always safe to call on scatterlist objects
+        (unsafe { bindings::sg_dma_address(&self.0) }) as usize
+    }
+
+    /// Returns the length of this span in bytes
+    pub fn dma_len(&self) -> usize {
+        // SAFETY: Always safe to call on scatterlist objects
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
+            // SAFETY: sgt is always a valid pointer
+            left: unsafe { (*self.sgt).nents } as usize,
+            // SAFETY: sgt is always a valid pointer
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
+/// SAFETY: `sg_table` objects are safe to send across threads.
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
+            // SAFETY: `self.sg` is always a valid pointer
+            self.sg = unsafe { bindings::sg_next(self.sg) };
+            self.left -= 1;
+            // SAFETY: `self.sg` is always a valid pointer
+            Some(unsafe { &(*(sg as *const SGEntry)) })
+        }
+    }
+}

-- 
2.48.1

