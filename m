Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDfrDWkcpmmeKQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:25:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E311E69B7
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B90A10E5FA;
	Mon,  2 Mar 2026 23:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="gpX5I9IR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F1410E5EF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 23:25:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772493917; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VfvR6KHY7SahqLyYmKfIttVP1RYudBkmwbNeQLiAs37NGIpct44BG3xgr5zw3zS9oxbumxkF8WeWWHbLYCG5e9i3E0+fJvUi2EBTWVtqpaUL5vxX9ddkjecaV6blfe8/SipW1z/xERdO74UatfDoP1eqB7jGMv77lPXosU3u4EQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772493917;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=5V1eropQD/TmDs3tBgiw9tG8Tok52HeVEgtcA0hhWFY=; 
 b=i5IyAvbnJyuRxcAWw07hyYD7v1qlo6I69TwJFSeb+/KnPKnrzwdcOLv/xCshN1wyolfBygAOBYXeM5dltZhSab6Xy7CtKs5mrT/qBP6jt3xPvzkZ/Y2H2emNijp/d6yq5v3VN5whHiQhPoeWKoronG0A+fczOIUK4ZETlRHfp3E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772493917; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=5V1eropQD/TmDs3tBgiw9tG8Tok52HeVEgtcA0hhWFY=;
 b=gpX5I9IRRDBGY6rQuNafABGxGpDi1Sgs/PlwvxTwRp9ZuH1C15khXi5UOrqXs5iz
 lLcj48ncElFR1xBKBgQup8qx15xmq0hdv4OORDvdz9t3+ca8NEiF2hJyzcH7zU5R5kb
 EWhCQ4892zNL5455P8KUiBcJMdqBsHk0zjQOJ2nY=
Received: by mx.zohomail.com with SMTPS id 1772493916721383.1176815360051;
 Mon, 2 Mar 2026 15:25:16 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, beata.michalska@arm.com, lyude@redhat.com,
 work@onurozkan.dev, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 09/12] drm/tyr: add GPU virtual memory module
Date: Mon,  2 Mar 2026 15:24:57 -0800
Message-ID: <20260302232500.244489-10-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260302232500.244489-1-deborah.brouwer@collabora.com>
References: <20260302232500.244489-1-deborah.brouwer@collabora.com>
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
X-Rspamd-Queue-Id: C0E311E69B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Boris Brezillon <boris.brezillon@collabora.com>

Add GPU virtual address space management using the DRM GPUVM framework.
Each virtual memory (VM) space is backed by ARM64 LPAE Stage 1 page tables
and can be mapped into hardware address space (AS) slots for GPU execution.

The implementation provides memory isolation and virtual address
allocation. VMs support mapping GEM buffer objects with configurable
protection flags (readonly, noexec, uncached) and handle both 4KB and 2MB
page sizes. A new_dummy_object() helper is provided to create a dummy GEM
object for use as a GPUVM root.

The vm module integrates with the MMU for address space activation and
provides map/unmap/remap operations with page table synchronization.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- Add documentation.
- Add function new_dummy_object().
- Remove page_table initialization and associated support functions
from Vm creation.

 drivers/gpu/drm/tyr/gem.rs |  22 +-
 drivers/gpu/drm/tyr/gpu.rs |   1 -
 drivers/gpu/drm/tyr/tyr.rs |   1 +
 drivers/gpu/drm/tyr/vm.rs  | 795 +++++++++++++++++++++++++++++++++++++
 4 files changed, 817 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/tyr/vm.rs

diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index c6d4d6f9bae3..111acf33993f 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -7,9 +7,11 @@
 use kernel::{
     drm::{
         gem,
+        gem::shmem,
         DeviceContext, //
     },
-    prelude::*, //
+    prelude::*,
+    sync::aref::ARef, //
 };
 
 use crate::driver::{
@@ -41,3 +43,21 @@ fn new<Ctx: DeviceContext>(
         try_pin_init!(Self { flags: args.flags })
     }
 }
+
+/// Type alias for Tyr GEM buffer objects.
+pub(crate) type Bo = gem::shmem::Object<BoData>;
+
+/// Creates a dummy GEM object to serve as the root of a GPUVM.
+pub(crate) fn new_dummy_object<Ctx: DeviceContext>(ddev: &TyrDrmDevice<Ctx>) -> Result<ARef<Bo>> {
+    let bo = gem::shmem::Object::<BoData>::new(
+        ddev,
+        4096,
+        shmem::ObjectConfig {
+            map_wc: true,
+            parent_resv_obj: None,
+        },
+        BoCreateArgs { flags: 0 },
+    )?;
+
+    Ok(bo)
+}
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 5d9637899c7d..c4cac3418455 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -133,7 +133,6 @@ pub(crate) fn log(&self, pdev: &platform::Device) {
     }
 
     /// Returns the number of virtual address bits supported by the GPU.
-    #[expect(dead_code)]
     pub(crate) fn va_bits(&self) -> u32 {
         self.mmu_features & genmask_u32(0..=7)
     }
diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
index 9f9f31ea02e3..b3244670dd79 100644
--- a/drivers/gpu/drm/tyr/tyr.rs
+++ b/drivers/gpu/drm/tyr/tyr.rs
@@ -14,6 +14,7 @@
 mod mmu;
 mod regs;
 mod slot;
+mod vm;
 
 kernel::module_platform_driver! {
     type: TyrPlatformDriverData,
diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
new file mode 100644
index 000000000000..f19acebdd66b
--- /dev/null
+++ b/drivers/gpu/drm/tyr/vm.rs
@@ -0,0 +1,795 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+//! GPU virtual memory management using the DRM GPUVM framework.
+//!
+//! This module manages GPU virtual address spaces, providing memory isolation and
+//! the illusion of owning the entire virtual address (VA) range, similar to CPU virtual memory.
+//! Each virtual memory (VM) area is backed by ARM64 LPAE Stage 1 page tables and can be
+//! mapped into hardware address space (AS) slots for GPU execution.
+#![allow(dead_code)]
+
+use core::ops::Range;
+
+use kernel::{
+    c_str,
+    drm::{
+        gpuvm::{
+            DriverGpuVm,
+            GpuVaAlloc,
+            GpuVm,
+            GpuVmBoRegistered,
+            GpuVmCore,
+            OpMap,
+            OpMapRequest,
+            OpMapped,
+            OpRemap,
+            OpRemapped,
+            OpUnmap,
+            OpUnmapped, //
+        },
+        DeviceContext, //
+    },
+    impl_flags,
+    iommu::pgtable::{
+        prot,
+        IoPageTable,
+        ARM64LPAES1, //
+    },
+    new_mutex,
+    platform,
+    prelude::*,
+    sizes::{
+        SZ_1G,
+        SZ_2M,
+        SZ_4K, //
+    },
+    sync::{
+        aref::ARef,
+        Arc,
+        ArcBorrow,
+        Mutex, //
+    },
+    uapi, //
+};
+
+use crate::{
+    driver::{
+        TyrDrmDevice,
+        TyrDrmDriver, //
+    },
+    gem,
+    gem::Bo,
+    gpu::GpuInfo,
+    mmu::{
+        address_space::VmAsData,
+        Mmu, //
+    }, //
+};
+
+impl_flags!(
+    /// Flags controlling virtual memory mapping behavior.
+    ///
+    /// These flags control access permissions and caching behavior for GPU virtual
+    /// memory mappings.
+    #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
+    pub(crate) struct VmMapFlags(u32);
+
+    /// Individual flags that can be combined in [`VmMapFlags`].
+    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
+    pub(crate) enum VmFlag {
+        /// Map as read-only.
+        Readonly = uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_READONLY as u32,
+        /// Map as non-executable.
+        Noexec = uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC as u32,
+        /// Map as uncached.
+        Uncached = uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED as u32,
+    }
+);
+
+impl VmMapFlags {
+    /// Convert the flags to `pgtable::prot`.
+    fn to_prot(self) -> u32 {
+        let mut prot = 0;
+
+        if self.contains(VmFlag::Readonly) {
+            prot |= prot::READ;
+        } else {
+            prot |= prot::READ | prot::WRITE;
+        }
+
+        if self.contains(VmFlag::Noexec) {
+            prot |= prot::NOEXEC;
+        }
+
+        if !self.contains(VmFlag::Uncached) {
+            prot |= prot::CACHE;
+        }
+
+        prot
+    }
+}
+
+impl core::fmt::Display for VmMapFlags {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        let mut first = true;
+
+        if self.contains(VmFlag::Readonly) {
+            write!(f, "READONLY")?;
+            first = false;
+        }
+        if self.contains(VmFlag::Noexec) {
+            if !first {
+                write!(f, " | ")?;
+            }
+            write!(f, "NOEXEC")?;
+            first = false;
+        }
+
+        if self.contains(VmFlag::Uncached) {
+            if !first {
+                write!(f, " | ")?;
+            }
+            write!(f, "UNCACHED")?;
+        }
+
+        Ok(())
+    }
+}
+
+impl TryFrom<u32> for VmMapFlags {
+    type Error = Error;
+
+    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
+        let valid = (kernel::uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_READONLY
+            | kernel::uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC
+            | kernel::uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED)
+            as u32;
+
+        if value & !valid != 0 {
+            pr_err!("Invalid VM map flags: {:#x}\n", value);
+            return Err(EINVAL);
+        }
+        Ok(Self(value))
+    }
+}
+
+/// Arguments for a virtual memory map operation.
+struct VmMapArgs {
+    /// Access permissions and caching behavior for the mapping.
+    flags: VmMapFlags,
+    /// GEM buffer object registered with the GPUVM framework.
+    vm_bo: GpuVmBoRegistered<GpuVmData>,
+    /// Offset in bytes from the start of the buffer object.
+    bo_offset: u64,
+}
+
+/// Type of virtual memory operation.
+enum VmOpType {
+    /// Map a GEM buffer object into the virtual address space.
+    Map(VmMapArgs),
+    /// Unmap a region from the virtual address space.
+    Unmap,
+}
+
+/// Preallocated resources needed to execute a VM operation.
+///
+/// VM operations may require allocating new GPUVA objects to track mappings.
+/// To avoid allocation failures during the operation, preallocate the
+/// maximum number of GPUVAs that might be needed.
+struct VmOpResources {
+    /// Preallocated GPUVA objects for remap operations.
+    ///
+    /// Partial unmap requests or map requests overlapping existing mappings
+    /// will trigger a remap call, which needs to register up to three VA
+    /// objects (one for the new mapping, and two for the previous and next
+    /// mappings).
+    preallocated_gpuvas: [Option<GpuVaAlloc<GpuVmData>>; 3],
+}
+
+/// Request to execute a virtual memory operation.
+struct VmOpRequest {
+    /// Request type.
+    op_type: VmOpType,
+
+    /// Region of the virtual address space covered by this request.
+    region: Range<u64>,
+}
+
+/// Arguments for a page table map operation.
+struct PtMapArgs {
+    /// Memory protection flags describing allowed accesses for this mapping.
+    ///
+    /// This is directly derived from [`VmMapFlags`] via [`VmMapFlags::to_prot`].
+    prot: u32,
+}
+
+/// Type of page table operation.
+enum PtOpType {
+    /// Map pages into the page table.
+    Map(PtMapArgs),
+    /// Unmap pages from the page table.
+    Unmap,
+}
+
+/// Context for updating the GPU page table.
+///
+/// This context is created when beginning a page table update operation and
+/// automatically flushes changes when dropped. It ensures that the
+/// Memory Management Unit (MMU) state is properly managed and Translation
+/// Lookaside Buffer (TLB) entries are flushed.
+pub(crate) struct PtUpdateContext<'ctx> {
+    /// Page table.
+    pt: &'ctx IoPageTable<ARM64LPAES1>,
+
+    /// MMU manager.
+    mmu: &'ctx Mmu,
+
+    /// Reference to the address space data to pass to the MMU functions.
+    as_data: &'ctx VmAsData,
+
+    /// Region of the virtual address space covered by this request.
+    region: Range<u64>,
+
+    /// Operation type.
+    op_type: PtOpType,
+
+    /// Preallocated resources that can be used when executing the request.
+    resources: &'ctx mut VmOpResources,
+}
+
+impl<'ctx> PtUpdateContext<'ctx> {
+    /// Creates a new page table update context.
+    ///
+    /// This prepares the MMU for a page table update.
+    /// The context will automatically flush the TLB and
+    /// complete the update when dropped.
+    fn new(
+        pt: &'ctx IoPageTable<ARM64LPAES1>,
+        mmu: &'ctx Mmu,
+        as_data: &'ctx VmAsData,
+        region: Range<u64>,
+        op_type: PtOpType,
+        resources: &'ctx mut VmOpResources,
+    ) -> Result<PtUpdateContext<'ctx>> {
+        mmu.start_vm_update(as_data, &region)?;
+
+        Ok(Self {
+            pt,
+            mmu,
+            as_data,
+            region,
+            op_type,
+            resources,
+        })
+    }
+
+    /// Finds one of our pre-allocated VAs.
+    ///
+    /// It is a logic error to call this more than three times for a given
+    /// PtUpdateContext.
+    fn preallocated_gpuva(&mut self) -> Result<GpuVaAlloc<GpuVmData>> {
+        self.resources
+            .preallocated_gpuvas
+            .iter_mut()
+            .find_map(|f| f.take())
+            .ok_or(EINVAL)
+    }
+}
+
+impl Drop for PtUpdateContext<'_> {
+    fn drop(&mut self) {
+        if let Err(e) = self.mmu.end_vm_update(self.as_data) {
+            pr_err!("Failed to end VM update {:?}\n", e);
+        }
+
+        if let Err(e) = self.mmu.flush_vm(self.as_data) {
+            pr_err!("Failed to flush VM {:?}\n", e);
+        }
+    }
+}
+
+/// Driver implementation for the GPUVM framework.
+///
+/// Implements [`DriverGpuVm`] to provide VM operation callbacks (map, unmap, remap)
+/// and associated types for buffer objects, virtual addresses, and contexts.
+pub(crate) struct GpuVmData {}
+
+/// GPU virtual address space.
+///
+/// Each VM can be mapped into a hardware address space slot.
+#[pin_data]
+pub(crate) struct Vm {
+    /// Data referenced by an AS when the VM is active
+    as_data: Arc<VmAsData>,
+    /// MMU manager.
+    mmu: Arc<Mmu>,
+    /// Platform device reference (needed to access the page table via devres).
+    pdev: ARef<platform::Device>,
+    /// DRM GPUVM core for managing virtual address space.
+    #[pin]
+    gpuvm_core: Mutex<GpuVmCore<GpuVmData>>,
+    /// Non-core part of the GPUVM. Can be used for stuff that doesn't modify the
+    /// internal mapping tree, like GpuVm::obtain()
+    gpuvm: ARef<GpuVm<GpuVmData>>,
+    /// VA range for this VM.
+    va_range: Range<u64>,
+}
+
+impl Vm {
+    /// Creates a new GPU virtual address space.
+    ///
+    /// The VM is initialized with a page table configured according to the GPU's
+    /// address translation capabilities and registered with the GPUVM framework.
+    pub(crate) fn new<Ctx: DeviceContext>(
+        pdev: &platform::Device,
+        ddev: &TyrDrmDevice<Ctx>,
+        mmu: ArcBorrow<'_, Mmu>,
+        gpu_info: &GpuInfo,
+    ) -> Result<Arc<Vm>> {
+        let va_bits = gpu_info.va_bits();
+        let pa_bits = gpu_info.pa_bits();
+
+        let range = 0..(1u64 << va_bits);
+        let reserve_range = 0..0u64;
+
+        // dummy_obj is used to initialize the GPUVM tree.
+        let dummy_obj = gem::new_dummy_object(ddev).inspect_err(|e| {
+            pr_err!("Failed to create dummy GEM object: {:?}\n", e);
+        })?;
+
+        let gpuvm_core = kernel::drm::gpuvm::GpuVm::new::<Error, _>(
+            c_str!("Tyr::GpuVm"),
+            ddev,
+            &*dummy_obj,
+            range.clone(),
+            reserve_range,
+            GpuVmData {},
+        )
+        .inspect_err(|e| {
+            pr_err!("Failed to create GpuVm: {:?}\n", e);
+        })?;
+        let gpuvm = ARef::from(&*gpuvm_core);
+
+        let as_data = Arc::pin_init(VmAsData::new(&mmu, pdev, va_bits, pa_bits), GFP_KERNEL)?;
+
+        let vm = Arc::pin_init(
+            pin_init!(Self{
+                as_data,
+                pdev: pdev.into(),
+                mmu: mmu.into(),
+                gpuvm,
+                gpuvm_core <- new_mutex!(gpuvm_core),
+                va_range: range,
+            }),
+            GFP_KERNEL,
+        )?;
+
+        Ok(vm)
+    }
+
+    /// Activate the VM in a hardware address space slot.
+    pub(crate) fn activate(&self) -> Result {
+        self.mmu
+            .activate_vm(self.as_data.as_arc_borrow())
+            .inspect_err(|e| {
+                pr_err!("Failed to activate VM: {:?}\n", e);
+            })
+    }
+
+    /// Deactivate the VM by evicting it from its address space slot.
+    fn deactivate(&self) -> Result {
+        self.mmu.deactivate_vm(&self.as_data).inspect_err(|e| {
+            pr_err!("Failed to deactivate VM: {:?}\n", e);
+        })
+    }
+
+    /// Kills the VM by deactivating it and unmapping all regions.
+    pub(crate) fn kill(&self) {
+        // TODO: Turn the VM into a state where it can't be used.
+        let _ = self.deactivate().inspect_err(|e| {
+            pr_err!("Failed to deactivate VM: {:?}\n", e);
+        });
+        let _ = self
+            .unmap_range(self.va_range.start, self.va_range.end - self.va_range.start)
+            .inspect_err(|e| {
+                pr_err!("Failed to unmap range during deactivate: {:?}\n", e);
+            });
+    }
+
+    /// Executes a virtual memory operation.
+    ///
+    /// This handles both map and unmap operations by coordinating between the
+    /// GPUVM framework and the hardware page table.
+    fn exec_op(
+        &self,
+        gpuvm_core: &mut GpuVmCore<GpuVmData>,
+        req: VmOpRequest,
+        resources: &mut VmOpResources,
+    ) -> Result {
+        let pt = self
+            .as_data
+            .page_table
+            // SAFETY: pdev is a bound device.
+            .access(unsafe { self.pdev.as_ref().as_bound() })
+            .inspect_err(|e| {
+                pr_err!("Failed to access page table while mapping pages: {:?}\n", e);
+            })?;
+
+        match req.op_type {
+            VmOpType::Map(args) => {
+                let mut pt_upd = PtUpdateContext::new(
+                    pt,
+                    &self.mmu,
+                    &self.as_data,
+                    req.region,
+                    PtOpType::Map(PtMapArgs {
+                        prot: args.flags.to_prot(),
+                    }),
+                    resources,
+                )?;
+
+                gpuvm_core.sm_map(OpMapRequest {
+                    addr: pt_upd.region.start,
+                    range: pt_upd.region.end - pt_upd.region.start,
+                    gem_offset: args.bo_offset,
+                    vm_bo: args.vm_bo,
+                    context: &mut pt_upd,
+                })
+                //PtUpdateContext drops here flushing the page table
+            }
+            VmOpType::Unmap => {
+                let mut pt_upd = PtUpdateContext::new(
+                    pt,
+                    &self.mmu,
+                    &self.as_data,
+                    req.region,
+                    PtOpType::Unmap,
+                    resources,
+                )?;
+
+                gpuvm_core.sm_unmap(
+                    pt_upd.region.start,
+                    pt_upd.region.end - pt_upd.region.start,
+                    &mut pt_upd,
+                )
+                //PtUpdateContext drops here flushing the page table
+            }
+        }
+    }
+
+    /// Maps a GEM buffer object range into the VM at the specified virtual address.
+    ///
+    /// This creates a mapping from GPU virtual address `va` to the physical pages
+    /// backing the GEM object, starting at `bo_offset` bytes into the object and
+    /// spanning `size` bytes. The mapping respects the access permissions and
+    /// caching behavior specified in `flags`.
+    pub(crate) fn map_bo_range(
+        &self,
+        bo: &Bo,
+        bo_offset: u64,
+        size: u64,
+        va: u64,
+        flags: VmMapFlags,
+    ) -> Result {
+        let req = VmOpRequest {
+            op_type: VmOpType::Map(VmMapArgs {
+                vm_bo: self.gpuvm.obtain(bo, ())?,
+                flags,
+                bo_offset,
+            }),
+            region: va..(va + size),
+        };
+        let mut resources = VmOpResources {
+            preallocated_gpuvas: [
+                Some(GpuVaAlloc::<GpuVmData>::new(GFP_KERNEL)?),
+                Some(GpuVaAlloc::<GpuVmData>::new(GFP_KERNEL)?),
+                Some(GpuVaAlloc::<GpuVmData>::new(GFP_KERNEL)?),
+            ],
+        };
+        let mut gpuvm_core = self.gpuvm_core.lock();
+
+        self.exec_op(gpuvm_core.as_mut().get_mut(), req, &mut resources)?;
+
+        // We flush the defer cleanup list now. Things will be different in
+        // the asynchronous VM_BIND path, where we want the cleanup to
+        // happen outside the DMA signalling path.
+        self.gpuvm.deferred_cleanup();
+        Ok(())
+    }
+
+    /// Unmaps a virtual address range from the VM.
+    ///
+    /// This removes any existing mappings in the specified range, freeing the
+    /// virtual address space for reuse.
+    pub(crate) fn unmap_range(&self, va: u64, size: u64) -> Result {
+        let req = VmOpRequest {
+            op_type: VmOpType::Unmap,
+            region: va..(va + size),
+        };
+        let mut resources = VmOpResources {
+            preallocated_gpuvas: [
+                Some(GpuVaAlloc::<GpuVmData>::new(GFP_KERNEL)?),
+                Some(GpuVaAlloc::<GpuVmData>::new(GFP_KERNEL)?),
+                None,
+            ],
+        };
+        let mut gpuvm_core = self.gpuvm_core.lock();
+
+        self.exec_op(gpuvm_core.as_mut().get_mut(), req, &mut resources)?;
+
+        // We flush the defer cleanup list now. Things will be different in
+        // the asynchronous VM_BIND path, where we want the cleanup to
+        // happen outside the DMA signalling path.
+        self.gpuvm.deferred_cleanup();
+        Ok(())
+    }
+}
+
+impl DriverGpuVm for GpuVmData {
+    type Driver = TyrDrmDriver;
+    type Object = Bo;
+    type VmBoData = ();
+    type VaData = ();
+    type SmContext<'ctx> = PtUpdateContext<'ctx>;
+
+    /// Indicates that a new mapping should be created.
+    fn sm_step_map<'op>(
+        &mut self,
+        op: OpMap<'op, Self>,
+        context: &mut Self::SmContext<'_>,
+    ) -> Result<OpMapped<'op, Self>, Error> {
+        let start_iova = op.addr();
+        let mut iova = start_iova;
+        let mut bytes_left_to_map = op.length();
+        let mut gem_offset = op.gem_offset();
+        let sgt = op.obj().sg_table().inspect_err(|e| {
+            pr_err!("Failed to get sg_table: {:?}\n", e);
+        })?;
+        let prot = match &context.op_type {
+            PtOpType::Map(args) => args.prot,
+            _ => {
+                return Err(EINVAL);
+            }
+        };
+
+        for sgt_entry in sgt.iter() {
+            let mut paddr = sgt_entry.dma_address();
+            let mut sgt_entry_length: u64 = sgt_entry.dma_len();
+
+            if bytes_left_to_map == 0 {
+                break;
+            }
+
+            if gem_offset > 0 {
+                // Skip the entire SGT entry if the gem_offset exceeds its length
+                let skip = sgt_entry_length.min(gem_offset);
+                paddr += skip;
+                sgt_entry_length -= skip;
+                gem_offset -= skip;
+            }
+
+            if sgt_entry_length == 0 {
+                continue;
+            }
+
+            if gem_offset != 0 {
+                pr_err!("Invalid gem_offset {} in page table mapping.\n", gem_offset);
+                return Err(EINVAL);
+            }
+            let len = sgt_entry_length.min(bytes_left_to_map);
+
+            let segment_mapped = match pt_map(context.pt, iova, paddr, len, prot) {
+                Ok(segment_mapped) => segment_mapped,
+                Err(e) => {
+                    // clean up any successful mappings from previous SGT entries.
+                    let total_mapped = iova - start_iova;
+                    if total_mapped > 0 {
+                        pt_unmap(context.pt, start_iova..(start_iova + total_mapped)).ok();
+                    }
+                    return Err(e);
+                }
+            };
+
+            // Since there could be a partial mapping, only advance by the actual amount mapped
+            bytes_left_to_map -= segment_mapped;
+            iova += segment_mapped;
+        }
+
+        let gpuva = context.preallocated_gpuva()?;
+        let op = op.insert(gpuva, pin_init::init_zeroed());
+
+        Ok(op)
+    }
+
+    /// Indicates that an existing mapping should be removed.
+    fn sm_step_unmap<'op>(
+        &mut self,
+        op: OpUnmap<'op, Self>,
+        context: &mut Self::SmContext<'_>,
+    ) -> Result<OpUnmapped<'op, Self>, Error> {
+        let start_iova = op.va().addr();
+        let length = op.va().length();
+
+        let region = start_iova..(start_iova + length);
+        pt_unmap(context.pt, region.clone()).inspect_err(|e| {
+            pr_err!(
+                "Failed to unmap region {:#x}..{:#x}: {:?}\n",
+                region.start,
+                region.end,
+                e
+            );
+        })?;
+
+        let (op_unmapped, _va_removed) = op.remove();
+
+        Ok(op_unmapped)
+    }
+
+    /// Indicates that an existing mapping should be split up.
+    fn sm_step_remap<'op>(
+        &mut self,
+        op: OpRemap<'op, Self>,
+        context: &mut Self::SmContext<'_>,
+    ) -> Result<OpRemapped<'op, Self>, Error> {
+        let unmap_start = if let Some(prev) = op.prev() {
+            prev.addr() + prev.length()
+        } else {
+            op.va_to_unmap().addr()
+        };
+
+        let unmap_end = if let Some(next) = op.next() {
+            next.addr()
+        } else {
+            op.va_to_unmap().addr() + op.va_to_unmap().length()
+        };
+
+        let unmap_length = unmap_end - unmap_start;
+
+        if unmap_length > 0 {
+            let region = unmap_start..(unmap_start + unmap_length);
+            pt_unmap(context.pt, region.clone()).inspect_err(|e| {
+                pr_err!(
+                    "Failed to unmap remap region {:#x}..{:#x}: {:?}\n",
+                    region.start,
+                    region.end,
+                    e
+                );
+            })?;
+        }
+
+        let prev_va = context.preallocated_gpuva()?;
+        let next_va = context.preallocated_gpuva()?;
+
+        let (op_remapped, _remap_ret) = op.remap(
+            [prev_va, next_va],
+            pin_init::init_zeroed(),
+            pin_init::init_zeroed(),
+        );
+
+        Ok(op_remapped)
+    }
+}
+
+/// This function selects the largest supported block size (currently 4KB or 2MB)
+/// that can be used for a mapping at the given address and size, respecting alignment constraints.
+///
+/// We can map multiple pages at once but we can't exceed the size of the
+// table entry itself. So, if mapping 4KB pages, figure out how many pages
+// can be mapped before we hit the 2MB boundary. Or, if mapping 2MB pages,
+// figure out how many pages can be mapped before hitting the 1GB boundary
+// Returns the page size (4KB or 2MB) and the number of pages that can be mapped at that size.
+fn get_pgsize(addr: u64, size: u64) -> (u64, u64) {
+    // Get the distance to the next boundary of 2MB block
+    let blk_offset_2m = addr.wrapping_neg() % (SZ_2M as u64);
+
+    // Use 4K blocks if the address is not 2MB aligned, or we have less than 2MB to map
+    if blk_offset_2m != 0 || size < SZ_2M as u64 {
+        let pgcount = if blk_offset_2m == 0 {
+            size / SZ_4K as u64
+        } else {
+            blk_offset_2m.min(size) / SZ_4K as u64
+        };
+        return (SZ_4K as u64, pgcount);
+    }
+
+    let blk_offset_1g = addr.wrapping_neg() % (SZ_1G as u64);
+    let blk_offset = if blk_offset_1g == 0 {
+        SZ_1G as u64
+    } else {
+        blk_offset_1g
+    };
+    let pgcount = blk_offset.min(size) / SZ_2M as u64;
+
+    (SZ_2M as u64, pgcount)
+}
+
+/// Maps a physical address range into the page table at the specified virtual address.
+///
+/// This function maps `len` bytes of physical memory starting at `paddr` to the
+/// virtual address `iova`, using the protection flags specified in `prot`. It
+/// automatically selects optimal page sizes to minimize page table overhead.
+///
+/// If the mapping fails partway through, all successfully mapped pages are
+/// unmapped before returning an error.
+///
+/// Returns the number of bytes successfully mapped.
+fn pt_map(
+    pt: &IoPageTable<ARM64LPAES1>,
+    iova: u64,
+    paddr: u64,
+    len: u64,
+    prot: u32,
+) -> Result<u64> {
+    let mut segment_mapped = 0u64;
+    while segment_mapped < len {
+        let remaining = len - segment_mapped;
+        let curr_iova = iova + segment_mapped;
+        let curr_paddr = paddr + segment_mapped;
+
+        let (pgsize, pgcount) = get_pgsize(curr_iova | curr_paddr, remaining);
+
+        // SAFETY: Exclusive access to the page table is ensured because
+        // the pt reference comes from PtUpdateContext, which is created
+        // during a VM update operation, ensuring the driver does not concurrently
+        // modify the page table.
+        let (mapped, result) = unsafe {
+            pt.map_pages(
+                curr_iova as usize,
+                (curr_paddr as usize).try_into().unwrap(),
+                pgsize as usize,
+                pgcount as usize,
+                prot,
+                GFP_KERNEL,
+            )
+        };
+
+        if let Err(e) = result {
+            pr_err!("pt.map_pages failed at iova {:#x}: {:?}\n", curr_iova, e);
+            if segment_mapped > 0 {
+                pt_unmap(pt, iova..(iova + segment_mapped)).ok();
+            }
+            return Err(e);
+        }
+
+        if mapped == 0 {
+            pr_err!("Failed to map any pages at iova {:#x}\n", curr_iova);
+            if segment_mapped > 0 {
+                pt_unmap(pt, iova..(iova + segment_mapped)).ok();
+            }
+            return Err(ENOMEM);
+        }
+
+        segment_mapped += mapped as u64;
+    }
+
+    Ok(segment_mapped)
+}
+
+/// Unmaps a virtual address range from the page table.
+///
+/// This function removes all page table entries in the specified range,
+/// automatically handling different page sizes that may be present.
+fn pt_unmap(pt: &IoPageTable<ARM64LPAES1>, range: Range<u64>) -> Result {
+    let mut iova = range.start;
+    let mut bytes_left_to_unmap = range.end - range.start;
+
+    while bytes_left_to_unmap > 0 {
+        let (pgsize, pgcount) = get_pgsize(iova, bytes_left_to_unmap);
+
+        // SAFETY: Exclusive access to the page table is ensured because
+        // the pt reference comes from PtUpdateContext, which was
+        // created while holding &mut Vm, preventing any other access to the
+        // page table for the duration of this operation.
+        let unmapped = unsafe { pt.unmap_pages(iova as usize, pgsize as usize, pgcount as usize) };
+
+        if unmapped == 0 {
+            pr_err!("Failed to unmap any bytes at iova {:#x}\n", iova);
+            return Err(EINVAL);
+        }
+
+        bytes_left_to_unmap -= unmapped as u64;
+        iova += unmapped as u64;
+    }
+
+    Ok(())
+}
-- 
2.52.0

