Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4361E92DC18
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 00:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C35910E929;
	Wed, 10 Jul 2024 22:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="5GkdMaRj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B6010E929
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 22:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720651936;
 bh=+dWFA3FH7Ludee1Pce3v6jICO2fVbMP/NswgoSFuKRY=;
 h=From:To:Cc:Subject:Date:From;
 b=5GkdMaRjzWNRFUCB+gIJK4z46taUnTPhVanmNX9Gxxe3vfJI2VibCRc8rEAuEBABA
 4G+pfBAqoB78iz3fKpVAiKm4KtX4GuyEz2sMo6exZRZRN7PT5gqBT/T8NYeAsuvPrk
 HnodOPDt6pCgVtMeKX/uEExhaONTsR3ZcZzhePcdmisStP8V3g3NbpYj2angFcUbzs
 ziAaccr/mzx6JA6h8iP7+J+Tve0b8af7e/4myYWXUJ6LQ5Rkx0YiFZ1J4fhwDsgKLZ
 B3vMEqFPg/AdvFdxvXrhGmNc6ea9hHzBWuawpv808qmYQ9IcJCPyXv8fm2CyPpE64g
 tvD2vI3qALv8A==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9AFBD37813B9;
 Wed, 10 Jul 2024 22:52:12 +0000 (UTC)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: wedsonaf@gmail.com, ojeda@kernel.org, dakr@redhat.com, lyude@redhat.com,
 robh@kernel.org, lina@asahilina.net, mcanal@igalia.com, airlied@gmail.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH] drm: panthor: add dev_coredumpv support
Date: Wed, 10 Jul 2024 19:50:06 -0300
Message-ID: <20240710225011.275153-1-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.45.2
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

Dump the state of the GPU. This feature is useful for debugging purposes.
---
Hi everybody!

For those looking for a branch instead, see [0].

I know this patch has (possibly many) issues. It is meant as a
discussion around the GEM abstractions for now. In particular, I am
aware of the series introducing Rust support for vmalloc and friends -
that is some very nice work! :)

Danilo, as we've spoken before, I find it hard to work with `rust: drm:
gem: Add GEM object abstraction`. My patch is based on v1, but IIUC
the issue remains in v2: it is not possible to build a gem::ObjectRef
from a bindings::drm_gem_object*.

Furthermore, gem::IntoGEMObject contains a Driver: drv::Driver
associated type:

```
+/// Trait that represents a GEM object subtype
+pub trait IntoGEMObject: Sized + crate::private::Sealed {
+    /// Owning driver for this type
+    type Driver: drv::Driver;
+
```

While this does work for Asahi and Nova - two drivers that are written
entirely in Rust - it is a blocker for any partially-converted drivers.
This is because there is no drv::Driver at all, only Rust functions that
are called from an existing C driver.

IMHO, are unlikely to see full rewrites of any existing C code. But
partial convertions allows companies to write new features entirely in
Rust, or to migrate to Rust in small steps. For this reason, I think we
should strive to treat partially-converted drivers as first-class
citizens.

[0]: https://gitlab.collabora.com/dwlsalmeida/for-upstream/-/tree/panthor-devcoredump?ref_type=heads

 drivers/gpu/drm/panthor/Kconfig         |  13 ++
 drivers/gpu/drm/panthor/Makefile        |   2 +
 drivers/gpu/drm/panthor/dump.rs         | 294 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/lib.rs          |  10 +
 drivers/gpu/drm/panthor/panthor_mmu.c   |  39 ++++
 drivers/gpu/drm/panthor/panthor_mmu.h   |   3 +
 drivers/gpu/drm/panthor/panthor_rs.h    |  40 ++++
 drivers/gpu/drm/panthor/panthor_sched.c |  28 ++-
 drivers/gpu/drm/panthor/regs.rs         | 264 +++++++++++++++++++++
 rust/bindings/bindings_helper.h         |   3 +
 10 files changed, 695 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panthor/dump.rs
 create mode 100644 drivers/gpu/drm/panthor/lib.rs
 create mode 100644 drivers/gpu/drm/panthor/panthor_rs.h
 create mode 100644 drivers/gpu/drm/panthor/regs.rs

diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
index 55b40ad07f3b..78d34e516f5b 100644
--- a/drivers/gpu/drm/panthor/Kconfig
+++ b/drivers/gpu/drm/panthor/Kconfig
@@ -21,3 +21,16 @@ config DRM_PANTHOR
 
 	  Note that the Mali-G68 and Mali-G78, while Valhall architecture, will
 	  be supported with the panfrost driver as they are not CSF GPUs.
+
+config DRM_PANTHOR_RS
+	bool "Panthor Rust components"
+	depends on DRM_PANTHOR
+	depends on RUST
+	help
+	  Enable Panthor's Rust components
+
+config DRM_PANTHOR_COREDUMP
+	bool "Panthor devcoredump support"
+	depends on DRM_PANTHOR_RS
+	help
+	  Dump the GPU state through devcoredump for debugging purposes
\ No newline at end of file
diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 15294719b09c..10387b02cd69 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -11,4 +11,6 @@ panthor-y := \
 	panthor_mmu.o \
 	panthor_sched.o
 
+panthor-$(CONFIG_DRM_PANTHOR_RS) += lib.o
 obj-$(CONFIG_DRM_PANTHOR) += panthor.o
+
diff --git a/drivers/gpu/drm/panthor/dump.rs b/drivers/gpu/drm/panthor/dump.rs
new file mode 100644
index 000000000000..77fe5f420300
--- /dev/null
+++ b/drivers/gpu/drm/panthor/dump.rs
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright Collabora 2024
+
+//! Dump the GPU state to a file, so we can figure out what went wrong if it
+//! crashes.
+//!
+//! The dump is comprised of the following sections:
+//!
+//! Registers,
+//! Firmware interface (TODO)
+//! Buffer objects (the whole VM)
+//!
+//! Each section is preceded by a header that describes it. Most importantly,
+//! each header starts with a magic number that should be used by userspace to
+//! when decoding.
+//!
+
+use alloc::DumpAllocator;
+use kernel::bindings;
+use kernel::prelude::*;
+
+use crate::regs;
+use crate::regs::GpuRegister;
+
+// PANT
+const MAGIC: u32 = 0x544e4150;
+
+#[derive(Copy, Clone)]
+#[repr(u32)]
+enum HeaderType {
+    /// A register dump
+    Registers,
+    /// The VM data,
+    Vm,
+    /// A dump of the firmware interface
+    _FirmwareInterface,
+}
+
+#[repr(C)]
+pub(crate) struct DumpArgs {
+    dev: *mut bindings::device,
+    /// The slot for the job
+    slot: i32,
+    /// The active buffer objects
+    bos: *mut *mut bindings::drm_gem_object,
+    /// The number of active buffer objects
+    bo_count: usize,
+    /// The base address of the registers to use when reading.
+    reg_base_addr: *mut core::ffi::c_void,
+}
+
+#[repr(C)]
+pub(crate) struct Header {
+    magic: u32,
+    ty: HeaderType,
+    header_size: u32,
+    data_size: u32,
+}
+
+#[repr(C)]
+#[derive(Clone, Copy)]
+pub(crate) struct RegisterDump {
+    register: GpuRegister,
+    value: u32,
+}
+
+/// The registers to dump
+const REGISTERS: [GpuRegister; 18] = [
+    regs::SHADER_READY_LO,
+    regs::SHADER_READY_HI,
+    regs::TILER_READY_LO,
+    regs::TILER_READY_HI,
+    regs::L2_READY_LO,
+    regs::L2_READY_HI,
+    regs::JOB_INT_MASK,
+    regs::JOB_INT_STAT,
+    regs::MMU_INT_MASK,
+    regs::MMU_INT_STAT,
+    regs::as_transtab_lo(0),
+    regs::as_transtab_hi(0),
+    regs::as_memattr_lo(0),
+    regs::as_memattr_hi(0),
+    regs::as_faultstatus(0),
+    regs::as_faultaddress_lo(0),
+    regs::as_faultaddress_hi(0),
+    regs::as_status(0),
+];
+
+mod alloc {
+    use core::ptr::NonNull;
+
+    use kernel::bindings;
+    use kernel::prelude::*;
+
+    use crate::dump::Header;
+    use crate::dump::HeaderType;
+    use crate::dump::MAGIC;
+
+    pub(crate) struct DumpAllocator {
+        mem: NonNull<core::ffi::c_void>,
+        pos: usize,
+        capacity: usize,
+    }
+
+    impl DumpAllocator {
+        pub(crate) fn new(size: usize) -> Result<Self> {
+            if isize::try_from(size).unwrap() == isize::MAX {
+                return Err(EINVAL);
+            }
+
+            // Let's cheat a bit here, since there is no Rust vmalloc allocator
+            // for the time being.
+            //
+            // Safety: just a FFI call to alloc memory
+            let mem = NonNull::new(unsafe {
+                bindings::__vmalloc_noprof(
+                    size.try_into().unwrap(),
+                    bindings::GFP_KERNEL | bindings::GFP_NOWAIT | 1 << bindings::___GFP_NORETRY_BIT,
+                )
+            });
+
+            let mem = match mem {
+                Some(buffer) => buffer,
+                None => return Err(ENOMEM),
+            };
+
+            // Ssfety: just a FFI call to zero out the memory. Mem and size were
+            // used to allocate the memory above.
+            unsafe { core::ptr::write_bytes(mem.as_ptr(), 0, size) };
+            Ok(Self {
+                mem,
+                pos: 0,
+                capacity: size,
+            })
+        }
+
+        fn alloc_mem(&mut self, size: usize) -> Option<*mut u8> {
+            assert!(size % 8 == 0, "Allocation size must be 8-byte aligned");
+            if isize::try_from(size).unwrap() == isize::MAX {
+                return None;
+            } else if self.pos + size > self.capacity {
+                kernel::pr_debug!("DumpAllocator out of memory");
+                None
+            } else {
+                let offset = self.pos;
+                self.pos += size;
+
+                // Safety: we know that this is a valid allocation, so
+                // dereferencing is safe. We don't ever return two pointers to
+                // the same address, so we adhere to the aliasing rules. We make
+                // sure that the memory is zero-initialized before being handed
+                // out (this happens when the allocator is first created) and we
+                // enforce a 8 byte alignment rule.
+                Some(unsafe { self.mem.as_ptr().offset(offset as isize) as *mut u8 })
+            }
+        }
+
+        pub(crate) fn alloc<T>(&mut self) -> Option<&mut T> {
+            let mem = self.alloc_mem(core::mem::size_of::<T>())? as *mut T;
+            // Safety: we uphold safety guarantees in alloc_mem(), so this is
+            // safe to dereference.
+            Some(unsafe { &mut *mem })
+        }
+
+        pub(crate) fn alloc_bytes(&mut self, num_bytes: usize) -> Option<&mut [u8]> {
+            let mem = self.alloc_mem(num_bytes)?;
+
+            // Safety: we uphold safety guarantees in alloc_mem(), so this is
+            // safe to build a slice
+            Some(unsafe { core::slice::from_raw_parts_mut(mem, num_bytes) })
+        }
+
+        pub(crate) fn alloc_header(&mut self, ty: HeaderType, data_size: u32) -> &mut Header {
+            let hdr: &mut Header = self.alloc().unwrap();
+            hdr.magic = MAGIC;
+            hdr.ty = ty;
+            hdr.header_size = core::mem::size_of::<Header>() as u32;
+            hdr.data_size = data_size;
+            hdr
+        }
+
+        pub(crate) fn is_end(&self) -> bool {
+            self.pos == self.capacity
+        }
+
+        pub(crate) fn dump(self) -> (NonNull<core::ffi::c_void>, usize) {
+            (self.mem, self.capacity)
+        }
+    }
+}
+
+fn dump_registers(alloc: &mut DumpAllocator, args: &DumpArgs) {
+    let sz = core::mem::size_of_val(&REGISTERS);
+    alloc.alloc_header(HeaderType::Registers, sz.try_into().unwrap());
+
+    for reg in &REGISTERS {
+        let dumped_reg: &mut RegisterDump = alloc.alloc().unwrap();
+        dumped_reg.register = *reg;
+        dumped_reg.value = reg.read(args.reg_base_addr);
+    }
+}
+
+fn dump_bo(alloc: &mut DumpAllocator, bo: &mut bindings::drm_gem_object) {
+    let mut map = bindings::iosys_map::default();
+
+    // Safety: we trust the kernel to provide a valid BO.
+    let ret = unsafe { bindings::drm_gem_vmap_unlocked(bo, &mut map as _) };
+    if ret != 0 {
+        pr_warn!("Failed to map BO");
+        return;
+    }
+
+    let sz = bo.size;
+
+    // Safety: we know that the vaddr is valid and we know the BO size.
+    let mapped_bo: &mut [u8] =
+        unsafe { core::slice::from_raw_parts_mut(map.__bindgen_anon_1.vaddr as *mut _, sz) };
+
+    alloc.alloc_header(HeaderType::Vm, sz as u32);
+
+    let bo_data = alloc.alloc_bytes(sz).unwrap();
+    bo_data.copy_from_slice(&mapped_bo[..]);
+
+    // Safety: BO is valid and was previously mapped.
+    unsafe { bindings::drm_gem_vunmap_unlocked(bo, &mut map as _) };
+}
+
+/// Dumps the current state of the GPU to a file
+///
+/// # Safety
+///
+/// `Args` must be aligned and non-null.
+/// All fields of `DumpArgs` must be valid.
+#[no_mangle]
+pub(crate) extern "C" fn panthor_core_dump(args: *const DumpArgs) -> core::ffi::c_int {
+    assert!(!args.is_null());
+    // Safety: we checked whether the pointer was null. It is assumed to be
+    // aligned as per the safety requirements.
+    let args = unsafe { &*args };
+    //
+    // TODO: Ideally, we would use the safe GEM abstraction from the kernel
+    // crate, but I see no way to create a drm::gem::ObjectRef from a
+    // bindings::drm_gem_object. drm::gem::IntoGEMObject is only implemented for
+    // drm::gem::Object, which means that new references can only be created
+    // from a Rust-owned GEM object.
+    //
+    // It also has a has a `type Driver: drv::Driver` associated type, from
+    // which it can access the `File` associated type. But not all GEM functions
+    // take a file, though. For example, `drm_gem_vmap_unlocked` (used here)
+    // does not.
+    //
+    // This associated type is a blocker here, because there is no actual
+    // drv::Driver. We're only implementing a few functions in Rust.
+    let mut bos = match Vec::with_capacity(args.bo_count, GFP_KERNEL) {
+        Ok(bos) => bos,
+        Err(_) => return ENOMEM.to_errno(),
+    };
+    for i in 0..args.bo_count {
+        // Safety: `args` is assumed valid as per the safety requirements.
+        // `bos` is a valid pointer to a valid array of valid pointers.
+        let bo = unsafe { &mut **args.bos.add(i) };
+        bos.push(bo, GFP_KERNEL).unwrap();
+    }
+
+    let mut sz = core::mem::size_of::<Header>();
+    sz += REGISTERS.len() * core::mem::size_of::<RegisterDump>();
+
+    for bo in &mut *bos {
+        sz += core::mem::size_of::<Header>();
+        sz += bo.size;
+    }
+
+    // Everything must fit within this allocation, otherwise it was miscomputed.
+    let mut alloc = match DumpAllocator::new(sz) {
+        Ok(alloc) => alloc,
+        Err(e) => return e.to_errno(),
+    };
+
+    dump_registers(&mut alloc, &args);
+    for bo in bos {
+        dump_bo(&mut alloc, bo);
+    }
+
+    if !alloc.is_end() {
+        pr_warn!("DumpAllocator: wrong allocation size");
+    }
+
+    let (mem, size) = alloc.dump();
+
+    // Safety: `mem` is a valid pointer to a valid allocation of `size` bytes.
+    unsafe { bindings::dev_coredumpv(args.dev, mem.as_ptr(), size, bindings::GFP_KERNEL) };
+
+    0
+}
diff --git a/drivers/gpu/drm/panthor/lib.rs b/drivers/gpu/drm/panthor/lib.rs
new file mode 100644
index 000000000000..faef8662d0f5
--- /dev/null
+++ b/drivers/gpu/drm/panthor/lib.rs
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright Collabora 2024
+
+//! The Rust components of the Panthor driver
+
+#[cfg(CONFIG_DRM_PANTHOR_COREDUMP)]
+mod dump;
+mod regs;
+
+const __LOG_PREFIX: &[u8] = b"panthor\0";
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index fa0a002b1016..f8934de41ffa 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2,6 +2,8 @@
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
 /* Copyright 2023 Collabora ltd. */
 
+#include "drm/drm_gem.h"
+#include "linux/gfp_types.h"
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_exec.h>
@@ -2619,6 +2621,43 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
 	return drm_gpuvm_prepare_objects(&vm->base, exec, slot_count);
 }
 
+/**
+ * panthor_vm_bo_dump() - Dump the VM BOs for debugging purposes.
+ *
+ *
+ * @vm: VM targeted by the GPU job.
+ * @count: The number of BOs returned
+ *
+ * Return: an array of pointers to the BOs backing the whole VM.
+ */
+struct drm_gem_object **
+panthor_vm_dump(struct panthor_vm *vm, u32 *count)
+{
+	struct drm_gpuva *va, *next;
+	struct drm_gem_object **objs;
+	*count = 0;
+	u32 i = 0;
+
+	mutex_lock(&vm->op_lock);
+	drm_gpuvm_for_each_va_safe(va, next, &vm->base) {
+		(*count)++;
+	}
+
+	objs = kcalloc(*count, sizeof(struct drm_gem_object *), GFP_KERNEL);
+	if (!objs) {
+		mutex_unlock(&vm->op_lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	drm_gpuvm_for_each_va_safe(va, next, &vm->base) {
+		objs[i] = va->gem.obj;
+		i++;
+	}
+	mutex_unlock(&vm->op_lock);
+
+	return objs;
+}
+
 /**
  * panthor_mmu_unplug() - Unplug the MMU logic
  * @ptdev: Device.
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index f3c1ed19f973..e9369c19e5b5 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -50,6 +50,9 @@ int panthor_vm_add_bos_resvs_deps_to_job(struct panthor_vm *vm,
 void panthor_vm_add_job_fence_to_bos_resvs(struct panthor_vm *vm,
 					   struct drm_sched_job *job);
 
+struct drm_gem_object **
+panthor_vm_dump(struct panthor_vm *vm, u32 *count);
+
 struct dma_resv *panthor_vm_resv(struct panthor_vm *vm);
 struct drm_gem_object *panthor_vm_root_gem(struct panthor_vm *vm);
 
diff --git a/drivers/gpu/drm/panthor/panthor_rs.h b/drivers/gpu/drm/panthor/panthor_rs.h
new file mode 100644
index 000000000000..024db09be9a1
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_rs.h
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright Collabora 2024
+
+#include <drm/drm_gem.h>
+
+struct PanthorDumpArgs {
+	struct device *dev;
+	/**
+   * The slot for the job
+   */
+	s32 slot;
+	/**
+   * The active buffer objects
+   */
+	struct drm_gem_object **bos;
+	/**
+   * The number of active buffer objects
+   */
+	size_t bo_count;
+	/**
+   * The base address of the registers to use when reading.
+   */
+	void *reg_base_addr;
+};
+
+/**
+ * Dumps the current state of the GPU to a file
+ *
+ * # Safety
+ *
+ * All fields of `DumpArgs` must be valid.
+ */
+#ifdef CONFIG_DRM_PANTHOR_RS
+int panthor_core_dump(const struct PanthorDumpArgs *args);
+#else
+inline int panthor_core_dump(const struct PanthorDumpArgs *args)
+{
+	return 0;
+}
+#endif
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 79ffcbc41d78..39e1654d930e 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 /* Copyright 2023 Collabora ltd. */
 
+#include "drm/drm_gem.h"
+#include "linux/gfp_types.h"
+#include "linux/slab.h"
 #include <drm/drm_drv.h>
 #include <drm/drm_exec.h>
 #include <drm/drm_gem_shmem_helper.h>
@@ -31,6 +34,7 @@
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
+#include "panthor_rs.h"
 
 /**
  * DOC: Scheduler
@@ -2805,6 +2809,27 @@ static void group_sync_upd_work(struct work_struct *work)
 	group_put(group);
 }
 
+static void dump_job(struct panthor_device *dev, struct panthor_job *job)
+{
+	struct panthor_vm *vm = job->group->vm;
+	struct drm_gem_object **objs;
+	u32 count;
+
+	objs = panthor_vm_dump(vm, &count);
+
+	if (!IS_ERR(objs)) {
+		struct PanthorDumpArgs args = {
+			.dev = job->group->ptdev->base.dev,
+			.bos = objs,
+			.bo_count = count,
+			.reg_base_addr = dev->iomem,
+		};
+		panthor_core_dump(&args);
+		kfree(objs);
+	}
+}
+
+
 static struct dma_fence *
 queue_run_job(struct drm_sched_job *sched_job)
 {
@@ -2929,7 +2954,7 @@ queue_run_job(struct drm_sched_job *sched_job)
 	}
 
 	done_fence = dma_fence_get(job->done_fence);
-
+	dump_job(ptdev, job);
 out_unlock:
 	mutex_unlock(&sched->lock);
 	pm_runtime_mark_last_busy(ptdev->base.dev);
@@ -2950,6 +2975,7 @@ queue_timedout_job(struct drm_sched_job *sched_job)
 	drm_warn(&ptdev->base, "job timeout\n");
 
 	drm_WARN_ON(&ptdev->base, atomic_read(&sched->reset.in_progress));
+	dump_job(ptdev, job);
 
 	queue_stop(queue, job);
 
diff --git a/drivers/gpu/drm/panthor/regs.rs b/drivers/gpu/drm/panthor/regs.rs
new file mode 100644
index 000000000000..514bc9ee2856
--- /dev/null
+++ b/drivers/gpu/drm/panthor/regs.rs
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright Collabora 2024
+// SPDX-FileCopyrightText: (C) COPYRIGHT 2010-2022 ARM Limited. All rights reserved.
+
+//! The registers for Panthor, extracted from panthor_regs.h
+
+#![allow(unused_macros, unused_imports, dead_code)]
+
+use kernel::bindings;
+
+use core::ops::Add;
+use core::ops::Shl;
+use core::ops::Shr;
+
+#[repr(transparent)]
+#[derive(Clone, Copy)]
+pub(crate) struct GpuRegister(u64);
+
+impl GpuRegister {
+    pub(crate) fn read(&self, iomem: *const core::ffi::c_void) -> u32 {
+        // Safety: `reg` represents a valid address
+        unsafe {
+            let addr = iomem.offset(self.0 as isize);
+            bindings::readl_relaxed(addr as *const _)
+        }
+    }
+}
+
+pub(crate) const fn bit(index: u64) -> u64 {
+    1 << index
+}
+pub(crate) const fn genmask(high: u64, low: u64) -> u64 {
+    ((1 << (high - low + 1)) - 1) << low
+}
+
+pub(crate) const GPU_ID: GpuRegister = GpuRegister(0x0);
+pub(crate) const fn gpu_arch_major(x: u64) -> GpuRegister {
+    GpuRegister((x) >> 28)
+}
+pub(crate) const fn gpu_arch_minor(x: u64) -> GpuRegister {
+    GpuRegister((x) & genmask(27, 24) >> 24)
+}
+pub(crate) const fn gpu_arch_rev(x: u64) -> GpuRegister {
+    GpuRegister((x) & genmask(23, 20) >> 20)
+}
+pub(crate) const fn gpu_prod_major(x: u64) -> GpuRegister {
+    GpuRegister((x) & genmask(19, 16) >> 16)
+}
+pub(crate) const fn gpu_ver_major(x: u64) -> GpuRegister {
+    GpuRegister((x) & genmask(15, 12) >> 12)
+}
+pub(crate) const fn gpu_ver_minor(x: u64) -> GpuRegister {
+    GpuRegister((x) & genmask(11, 4) >> 4)
+}
+pub(crate) const fn gpu_ver_status(x: u64) -> GpuRegister {
+    GpuRegister(x & genmask(3, 0))
+}
+pub(crate) const GPU_L2_FEATURES: GpuRegister = GpuRegister(0x4);
+pub(crate) const fn gpu_l2_features_line_size(x: u64) -> GpuRegister {
+    GpuRegister(1 << ((x) & genmask(7, 0)))
+}
+pub(crate) const GPU_CORE_FEATURES: GpuRegister = GpuRegister(0x8);
+pub(crate) const GPU_TILER_FEATURES: GpuRegister = GpuRegister(0xc);
+pub(crate) const GPU_MEM_FEATURES: GpuRegister = GpuRegister(0x10);
+pub(crate) const GROUPS_L2_COHERENT: GpuRegister = GpuRegister(bit(0));
+pub(crate) const GPU_MMU_FEATURES: GpuRegister = GpuRegister(0x14);
+pub(crate) const fn gpu_mmu_features_va_bits(x: u64) -> GpuRegister {
+    GpuRegister((x) & genmask(7, 0))
+}
+pub(crate) const fn gpu_mmu_features_pa_bits(x: u64) -> GpuRegister {
+    GpuRegister(((x) >> 8) & genmask(7, 0))
+}
+pub(crate) const GPU_AS_PRESENT: GpuRegister = GpuRegister(0x18);
+pub(crate) const GPU_CSF_ID: GpuRegister = GpuRegister(0x1c);
+pub(crate) const GPU_INT_RAWSTAT: GpuRegister = GpuRegister(0x20);
+pub(crate) const GPU_INT_CLEAR: GpuRegister = GpuRegister(0x24);
+pub(crate) const GPU_INT_MASK: GpuRegister = GpuRegister(0x28);
+pub(crate) const GPU_INT_STAT: GpuRegister = GpuRegister(0x2c);
+pub(crate) const GPU_IRQ_FAULT: GpuRegister = GpuRegister(bit(0));
+pub(crate) const GPU_IRQ_PROTM_FAULT: GpuRegister = GpuRegister(bit(1));
+pub(crate) const GPU_IRQ_RESET_COMPLETED: GpuRegister = GpuRegister(bit(8));
+pub(crate) const GPU_IRQ_POWER_CHANGED: GpuRegister = GpuRegister(bit(9));
+pub(crate) const GPU_IRQ_POWER_CHANGED_ALL: GpuRegister = GpuRegister(bit(10));
+pub(crate) const GPU_IRQ_CLEAN_CACHES_COMPLETED: GpuRegister = GpuRegister(bit(17));
+pub(crate) const GPU_IRQ_DOORBELL_MIRROR: GpuRegister = GpuRegister(bit(18));
+pub(crate) const GPU_IRQ_MCU_STATUS_CHANGED: GpuRegister = GpuRegister(bit(19));
+pub(crate) const GPU_CMD: GpuRegister = GpuRegister(0x30);
+const fn gpu_cmd_def(ty: u64, payload: u64) -> u64 {
+    (ty) | ((payload) << 8)
+}
+pub(crate) const fn gpu_soft_reset() -> GpuRegister {
+    GpuRegister(gpu_cmd_def(1, 1))
+}
+pub(crate) const fn gpu_hard_reset() -> GpuRegister {
+    GpuRegister(gpu_cmd_def(1, 2))
+}
+pub(crate) const CACHE_CLEAN: GpuRegister = GpuRegister(bit(0));
+pub(crate) const CACHE_INV: GpuRegister = GpuRegister(bit(1));
+pub(crate) const GPU_STATUS: GpuRegister = GpuRegister(0x34);
+pub(crate) const GPU_STATUS_ACTIVE: GpuRegister = GpuRegister(bit(0));
+pub(crate) const GPU_STATUS_PWR_ACTIVE: GpuRegister = GpuRegister(bit(1));
+pub(crate) const GPU_STATUS_PAGE_FAULT: GpuRegister = GpuRegister(bit(4));
+pub(crate) const GPU_STATUS_PROTM_ACTIVE: GpuRegister = GpuRegister(bit(7));
+pub(crate) const GPU_STATUS_DBG_ENABLED: GpuRegister = GpuRegister(bit(8));
+pub(crate) const GPU_FAULT_STATUS: GpuRegister = GpuRegister(0x3c);
+pub(crate) const GPU_FAULT_ADDR_LO: GpuRegister = GpuRegister(0x40);
+pub(crate) const GPU_FAULT_ADDR_HI: GpuRegister = GpuRegister(0x44);
+pub(crate) const GPU_PWR_KEY: GpuRegister = GpuRegister(0x50);
+pub(crate) const GPU_PWR_KEY_UNLOCK: GpuRegister = GpuRegister(0x2968a819);
+pub(crate) const GPU_PWR_OVERRIDE0: GpuRegister = GpuRegister(0x54);
+pub(crate) const GPU_PWR_OVERRIDE1: GpuRegister = GpuRegister(0x58);
+pub(crate) const GPU_TIMESTAMP_OFFSET_LO: GpuRegister = GpuRegister(0x88);
+pub(crate) const GPU_TIMESTAMP_OFFSET_HI: GpuRegister = GpuRegister(0x8c);
+pub(crate) const GPU_CYCLE_COUNT_LO: GpuRegister = GpuRegister(0x90);
+pub(crate) const GPU_CYCLE_COUNT_HI: GpuRegister = GpuRegister(0x94);
+pub(crate) const GPU_TIMESTAMP_LO: GpuRegister = GpuRegister(0x98);
+pub(crate) const GPU_TIMESTAMP_HI: GpuRegister = GpuRegister(0x9c);
+pub(crate) const GPU_THREAD_MAX_THREADS: GpuRegister = GpuRegister(0xa0);
+pub(crate) const GPU_THREAD_MAX_WORKGROUP_SIZE: GpuRegister = GpuRegister(0xa4);
+pub(crate) const GPU_THREAD_MAX_BARRIER_SIZE: GpuRegister = GpuRegister(0xa8);
+pub(crate) const GPU_THREAD_FEATURES: GpuRegister = GpuRegister(0xac);
+pub(crate) const fn gpu_texture_features(n: u64) -> GpuRegister {
+    GpuRegister(0xB0 + ((n) * 4))
+}
+pub(crate) const GPU_SHADER_PRESENT_LO: GpuRegister = GpuRegister(0x100);
+pub(crate) const GPU_SHADER_PRESENT_HI: GpuRegister = GpuRegister(0x104);
+pub(crate) const GPU_TILER_PRESENT_LO: GpuRegister = GpuRegister(0x110);
+pub(crate) const GPU_TILER_PRESENT_HI: GpuRegister = GpuRegister(0x114);
+pub(crate) const GPU_L2_PRESENT_LO: GpuRegister = GpuRegister(0x120);
+pub(crate) const GPU_L2_PRESENT_HI: GpuRegister = GpuRegister(0x124);
+pub(crate) const SHADER_READY_LO: GpuRegister = GpuRegister(0x140);
+pub(crate) const SHADER_READY_HI: GpuRegister = GpuRegister(0x144);
+pub(crate) const TILER_READY_LO: GpuRegister = GpuRegister(0x150);
+pub(crate) const TILER_READY_HI: GpuRegister = GpuRegister(0x154);
+pub(crate) const L2_READY_LO: GpuRegister = GpuRegister(0x160);
+pub(crate) const L2_READY_HI: GpuRegister = GpuRegister(0x164);
+pub(crate) const SHADER_PWRON_LO: GpuRegister = GpuRegister(0x180);
+pub(crate) const SHADER_PWRON_HI: GpuRegister = GpuRegister(0x184);
+pub(crate) const TILER_PWRON_LO: GpuRegister = GpuRegister(0x190);
+pub(crate) const TILER_PWRON_HI: GpuRegister = GpuRegister(0x194);
+pub(crate) const L2_PWRON_LO: GpuRegister = GpuRegister(0x1a0);
+pub(crate) const L2_PWRON_HI: GpuRegister = GpuRegister(0x1a4);
+pub(crate) const SHADER_PWROFF_LO: GpuRegister = GpuRegister(0x1c0);
+pub(crate) const SHADER_PWROFF_HI: GpuRegister = GpuRegister(0x1c4);
+pub(crate) const TILER_PWROFF_LO: GpuRegister = GpuRegister(0x1d0);
+pub(crate) const TILER_PWROFF_HI: GpuRegister = GpuRegister(0x1d4);
+pub(crate) const L2_PWROFF_LO: GpuRegister = GpuRegister(0x1e0);
+pub(crate) const L2_PWROFF_HI: GpuRegister = GpuRegister(0x1e4);
+pub(crate) const SHADER_PWRTRANS_LO: GpuRegister = GpuRegister(0x200);
+pub(crate) const SHADER_PWRTRANS_HI: GpuRegister = GpuRegister(0x204);
+pub(crate) const TILER_PWRTRANS_LO: GpuRegister = GpuRegister(0x210);
+pub(crate) const TILER_PWRTRANS_HI: GpuRegister = GpuRegister(0x214);
+pub(crate) const L2_PWRTRANS_LO: GpuRegister = GpuRegister(0x220);
+pub(crate) const L2_PWRTRANS_HI: GpuRegister = GpuRegister(0x224);
+pub(crate) const SHADER_PWRACTIVE_LO: GpuRegister = GpuRegister(0x240);
+pub(crate) const SHADER_PWRACTIVE_HI: GpuRegister = GpuRegister(0x244);
+pub(crate) const TILER_PWRACTIVE_LO: GpuRegister = GpuRegister(0x250);
+pub(crate) const TILER_PWRACTIVE_HI: GpuRegister = GpuRegister(0x254);
+pub(crate) const L2_PWRACTIVE_LO: GpuRegister = GpuRegister(0x260);
+pub(crate) const L2_PWRACTIVE_HI: GpuRegister = GpuRegister(0x264);
+pub(crate) const GPU_REVID: GpuRegister = GpuRegister(0x280);
+pub(crate) const GPU_COHERENCY_FEATURES: GpuRegister = GpuRegister(0x300);
+pub(crate) const GPU_COHERENCY_PROTOCOL: GpuRegister = GpuRegister(0x304);
+pub(crate) const GPU_COHERENCY_ACE: GpuRegister = GpuRegister(0);
+pub(crate) const GPU_COHERENCY_ACE_LITE: GpuRegister = GpuRegister(1);
+pub(crate) const GPU_COHERENCY_NONE: GpuRegister = GpuRegister(31);
+pub(crate) const MCU_CONTROL: GpuRegister = GpuRegister(0x700);
+pub(crate) const MCU_CONTROL_ENABLE: GpuRegister = GpuRegister(1);
+pub(crate) const MCU_CONTROL_AUTO: GpuRegister = GpuRegister(2);
+pub(crate) const MCU_CONTROL_DISABLE: GpuRegister = GpuRegister(0);
+pub(crate) const MCU_STATUS: GpuRegister = GpuRegister(0x704);
+pub(crate) const MCU_STATUS_DISABLED: GpuRegister = GpuRegister(0);
+pub(crate) const MCU_STATUS_ENABLED: GpuRegister = GpuRegister(1);
+pub(crate) const MCU_STATUS_HALT: GpuRegister = GpuRegister(2);
+pub(crate) const MCU_STATUS_FATAL: GpuRegister = GpuRegister(3);
+pub(crate) const JOB_INT_RAWSTAT: GpuRegister = GpuRegister(0x1000);
+pub(crate) const JOB_INT_CLEAR: GpuRegister = GpuRegister(0x1004);
+pub(crate) const JOB_INT_MASK: GpuRegister = GpuRegister(0x1008);
+pub(crate) const JOB_INT_STAT: GpuRegister = GpuRegister(0x100c);
+pub(crate) const JOB_INT_GLOBAL_IF: GpuRegister = GpuRegister(bit(31));
+pub(crate) const fn job_int_csg_if(x: u64) -> GpuRegister {
+    GpuRegister(bit(x))
+}
+pub(crate) const MMU_INT_RAWSTAT: GpuRegister = GpuRegister(0x2000);
+pub(crate) const MMU_INT_CLEAR: GpuRegister = GpuRegister(0x2004);
+pub(crate) const MMU_INT_MASK: GpuRegister = GpuRegister(0x2008);
+pub(crate) const MMU_INT_STAT: GpuRegister = GpuRegister(0x200c);
+pub(crate) const MMU_BASE: GpuRegister = GpuRegister(0x2400);
+pub(crate) const MMU_AS_SHIFT: GpuRegister = GpuRegister(6);
+const fn mmu_as(as_: u64) -> u64 {
+    MMU_BASE.0 + ((as_) << MMU_AS_SHIFT.0)
+}
+pub(crate) const fn as_transtab_lo(as_: u64) -> GpuRegister {
+    GpuRegister(mmu_as(as_) + 0x0)
+}
+pub(crate) const fn as_transtab_hi(as_: u64) -> GpuRegister {
+    GpuRegister(mmu_as(as_) + 0x4)
+}
+pub(crate) const fn as_memattr_lo(as_: u64) -> GpuRegister {
+    GpuRegister(mmu_as(as_) + 0x8)
+}
+pub(crate) const fn as_memattr_hi(as_: u64) -> GpuRegister {
+    GpuRegister(mmu_as(as_) + 0xC)
+}
+pub(crate) const fn as_memattr_aarch64_inner_alloc_expl(w: u64, r: u64) -> GpuRegister {
+    GpuRegister((3 << 2) | (if w > 0 { bit(0) } else { 0 } | (if r > 0 { bit(1) } else { 0 })))
+}
+pub(crate) const fn as_lockaddr_lo(as_: u64) -> GpuRegister {
+    GpuRegister(mmu_as(as_) + 0x10)
+}
+pub(crate) const fn as_lockaddr_hi(as_: u64) -> GpuRegister {
+    GpuRegister(mmu_as(as_) + 0x14)
+}
+pub(crate) const fn as_command(as_: u64) -> GpuRegister {
+    GpuRegister(mmu_as(as_) + 0x18)
+}
+pub(crate) const AS_COMMAND_NOP: GpuRegister = GpuRegister(0);
+pub(crate) const AS_COMMAND_UPDATE: GpuRegister = GpuRegister(1);
+pub(crate) const AS_COMMAND_LOCK: GpuRegister = GpuRegister(2);
+pub(crate) const AS_COMMAND_UNLOCK: GpuRegister = GpuRegister(3);
+pub(crate) const AS_COMMAND_FLUSH_PT: GpuRegister = GpuRegister(4);
+pub(crate) const AS_COMMAND_FLUSH_MEM: GpuRegister = GpuRegister(5);
+pub(crate) const fn as_faultstatus(as_: u64) -> GpuRegister {
+    GpuRegister(mmu_as(as_) + 0x1C)
+}
+pub(crate) const fn as_faultaddress_lo(as_: u64) -> GpuRegister {
+    GpuRegister(mmu_as(as_) + 0x20)
+}
+pub(crate) const fn as_faultaddress_hi(as_: u64) -> GpuRegister {
+    GpuRegister(mmu_as(as_) + 0x24)
+}
+pub(crate) const fn as_status(as_: u64) -> GpuRegister {
+    GpuRegister(mmu_as(as_) + 0x28)
+}
+pub(crate) const AS_STATUS_AS_ACTIVE: GpuRegister = GpuRegister(bit(0));
+pub(crate) const fn as_transcfg_lo(as_: u64) -> GpuRegister {
+    GpuRegister(mmu_as(as_) + 0x30)
+}
+pub(crate) const fn as_transcfg_hi(as_: u64) -> GpuRegister {
+    GpuRegister(mmu_as(as_) + 0x34)
+}
+pub(crate) const fn as_transcfg_ina_bits(x: u64) -> GpuRegister {
+    GpuRegister((x) << 6)
+}
+pub(crate) const fn as_transcfg_outa_bits(x: u64) -> GpuRegister {
+    GpuRegister((x) << 14)
+}
+pub(crate) const AS_TRANSCFG_SL_CONCAT: GpuRegister = GpuRegister(bit(22));
+pub(crate) const AS_TRANSCFG_PTW_RA: GpuRegister = GpuRegister(bit(30));
+pub(crate) const AS_TRANSCFG_DISABLE_HIER_AP: GpuRegister = GpuRegister(bit(33));
+pub(crate) const AS_TRANSCFG_DISABLE_AF_FAULT: GpuRegister = GpuRegister(bit(34));
+pub(crate) const AS_TRANSCFG_WXN: GpuRegister = GpuRegister(bit(35));
+pub(crate) const AS_TRANSCFG_XREADABLE: GpuRegister = GpuRegister(bit(36));
+pub(crate) const fn as_faultextra_lo(as_: u64) -> GpuRegister {
+    GpuRegister(mmu_as(as_) + 0x38)
+}
+pub(crate) const fn as_faultextra_hi(as_: u64) -> GpuRegister {
+    GpuRegister(mmu_as(as_) + 0x3C)
+}
+pub(crate) const CSF_GPU_LATEST_FLUSH_ID: GpuRegister = GpuRegister(0x10000);
+pub(crate) const fn csf_doorbell(i: u64) -> GpuRegister {
+    GpuRegister(0x80000 + ((i) * 0x10000))
+}
+pub(crate) const CSF_GLB_DOORBELL_ID: GpuRegister = GpuRegister(0);
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index b245db8d5a87..4ee4b97e7930 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -12,15 +12,18 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
+#include <linux/devcoredump.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/jiffies.h>
+#include <linux/iosys-map.h>
 #include <linux/mdio.h>
 #include <linux/pci.h>
 #include <linux/phy.h>
 #include <linux/refcount.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/vmalloc.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
-- 
2.45.2

