Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMF3EWccpmmeKQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:25:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29C61E69A8
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E6E10E5EF;
	Mon,  2 Mar 2026 23:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="NN/Ya5xh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7545A10E5EB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 23:25:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772493917; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Xz9CsfWF04VO9NsCc+UEzSlKvCXLUz96V7iHj2N2bijlVLnNpVxeD+2IYXWkXNJgj8dlD7Ipm6huJXz3A1wltpLil6kEiajbo7Lh6uLnfdOb7s9RWuMppc9M3anRhfJPClref3NyZGqDDSjysT9iowTRLkMc4iGGw2xrrfdSHgk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772493917;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=C32/793HUwnhDhmtZbP0UrL6eruYeypJqjr0eEA1ZoU=; 
 b=BJK3sHPx3bH5jkTkf+xLMPmCMMX1RFXW8hz2LSrPqxCFlzhi0V42stxLWgg1iN9wBMaLr1MyYYK1FazY6T9gkMIPACM5evPG0DQiObId9UT9T2nTA49uonbwDYoflgXRnjJq6VlQ774ApMPBsCwPRd7aaLgRf43XQ0RMQQtQHlg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772493917; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=C32/793HUwnhDhmtZbP0UrL6eruYeypJqjr0eEA1ZoU=;
 b=NN/Ya5xh23hJpGkUmoFxHOFGfFHcgha9Uj3JFDZ/rYdOMghg8+f8/Hd6c9XEt3ne
 EmHAyhzeIfAYSJezMAayGkn2a1MNnoXiH5CCJt6s4bFlBF6VE4e6hpW7KwhfA4vOtXD
 imynZ9WtLOb/W4waZZj5A1UgWgmtpvDafKEs3Yg8=
Received: by mx.zohomail.com with SMTPS id 1772493915268485.92865944506116;
 Mon, 2 Mar 2026 15:25:15 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, beata.michalska@arm.com, lyude@redhat.com,
 work@onurozkan.dev, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 08/12] drm/tyr: add MMU module
Date: Mon,  2 Mar 2026 15:24:56 -0800
Message-ID: <20260302232500.244489-9-deborah.brouwer@collabora.com>
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
X-Rspamd-Queue-Id: E29C61E69A8
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

Add a Memory Management Unit (MMU) driver for Tyr. The MMU wraps a
SlotManager for allocating hardware address space slots. The underlying
AddressSpaceManager performs MMU operations including enabling/disabling
address spaces, flushing page tables, and locking regions for page table
updates.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- Add documentation.
- Propagate errors returned by as_flush/disable().
- Refactor VmAsData to use in-place pinned initialization for the page table. 
- Make struct AddressSpaceConfig private.

 drivers/gpu/drm/tyr/driver.rs            |   3 +
 drivers/gpu/drm/tyr/mmu.rs               | 123 ++++++
 drivers/gpu/drm/tyr/mmu/address_space.rs | 493 +++++++++++++++++++++++
 drivers/gpu/drm/tyr/tyr.rs               |   1 +
 4 files changed, 620 insertions(+)
 create mode 100644 drivers/gpu/drm/tyr/mmu.rs
 create mode 100644 drivers/gpu/drm/tyr/mmu/address_space.rs

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 781502c6db36..7174ab2fd011 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -43,6 +43,7 @@
     gem::BoData,
     gpu,
     gpu::GpuInfo,
+    mmu::Mmu,
     regs, //
 };
 
@@ -146,6 +147,8 @@ fn probe(
         let uninit_ddev = UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref())?;
         let platform: ARef<platform::Device> = pdev.into();
 
+        let _mmu = Mmu::new(pdev, iomem.as_arc_borrow(), &gpu_info)?;
+
         let data = try_pin_init!(TyrDrmDeviceData {
                 pdev: platform.clone(),
                 clks <- new_mutex!(Clocks {
diff --git a/drivers/gpu/drm/tyr/mmu.rs b/drivers/gpu/drm/tyr/mmu.rs
new file mode 100644
index 000000000000..2c7ac1fb1ac2
--- /dev/null
+++ b/drivers/gpu/drm/tyr/mmu.rs
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+//! Memory Management Unit (MMU) driver for the Tyr GPU.
+//!
+//! This module manages GPU address spaces and virtual memory (VM) operations through
+//! hardware MMU slots. It provides functionality for flushing page tables and
+//! managing VM updates for active address spaces.
+//!
+//! The MMU coordinates with the [`AddressSpaceManager`] to handle hardware
+//! address space allocation and page table operations, using [`SlotManager`]
+//! to track which address spaces are currently active in hardware slots.
+//!
+//! [`AddressSpaceManager`]: address_space::AddressSpaceManager
+//! [`SlotManager`]: crate::slot::SlotManager
+#![allow(dead_code)]
+
+use core::ops::Range;
+
+use kernel::{
+    devres::Devres,
+    new_mutex,
+    platform,
+    prelude::*,
+    sync::{
+        Arc,
+        ArcBorrow,
+        Mutex, //
+    }, //
+};
+
+use crate::{
+    driver::IoMem,
+    gpu::GpuInfo,
+    mmu::address_space::{
+        AddressSpaceManager,
+        VmAsData, //
+    },
+    regs::MAX_AS_REGISTERS,
+    slot::SlotManager, //
+};
+
+pub(crate) mod address_space;
+
+pub(crate) type AsSlotManager = SlotManager<AddressSpaceManager, MAX_AS_REGISTERS>;
+
+/// MMU component of the GPU.
+///
+/// This is used to bind VM objects to an AS (Address Space) slot
+/// and make the VM active on the GPU.
+///
+/// All operations acquire an internal lock, allowing concurrent access from multiple
+/// threads. Methods may block if another thread holds the lock.
+#[pin_data]
+pub(crate) struct Mmu {
+    /// Manages the allocation of hardware MMU slots to GPU address spaces.
+    ///
+    /// Tracks which address spaces are currently active in hardware slots and
+    /// coordinates address space operations like flushing and VM updates.
+    ///
+    /// This mutex also protects individual [`Seat`]s that are wrapped with
+    /// `LockedBy<Seat, SlotManager<...>>` to share the same lock protection.
+    ///
+    /// [`Seat`]: crate::slot::Seat
+    #[pin]
+    pub(crate) as_manager: Mutex<AsSlotManager>,
+}
+
+impl Mmu {
+    /// Create an MMU component for this device.
+    pub(crate) fn new(
+        pdev: &platform::Device,
+        iomem: ArcBorrow<'_, Devres<IoMem>>,
+        gpu_info: &GpuInfo,
+    ) -> Result<Arc<Mmu>> {
+        let slot_count = gpu_info.as_present.count_ones().try_into()?;
+        let as_manager = AddressSpaceManager::new(pdev, iomem, gpu_info.as_present)?;
+        let mmu_init = try_pin_init!(Self{
+            as_manager <- new_mutex!(SlotManager::new(as_manager, slot_count)?),
+        });
+        Arc::pin_init(mmu_init, GFP_KERNEL)
+    }
+
+    /// Make a VM active.
+    ///
+    /// This implies assigning the VM to an AS slot through the slot manager.
+    pub(crate) fn activate_vm(&self, vm: ArcBorrow<'_, VmAsData>) -> Result {
+        self.as_manager.lock().activate_vm(vm)
+    }
+
+    /// Make the VM inactive.
+    ///
+    /// Evicts the VM from its AS slot through the slot manager.
+    pub(crate) fn deactivate_vm(&self, vm: &VmAsData) -> Result {
+        self.as_manager.lock().deactivate_vm(vm)
+    }
+
+    /// Flush caches after a VM update.
+    ///
+    /// If the VM is no longer resident, this is a NOP, otherwise, the
+    /// AS manager will flush the GPU and MMU Translation Lookaside Buffer (TLB) caches.
+    pub(crate) fn flush_vm(&self, vm: &VmAsData) -> Result {
+        self.as_manager.lock().flush_vm(vm)
+    }
+
+    /// Flags the start of a VM update.
+    ///
+    /// If the VM is resident, any GPU access on the memory range being
+    /// updated will be blocked until `Mmu::end_vm_update()` is called.
+    /// This guarantees the atomicity of a VM update.
+    /// If the VM is not resident, this is a NOP.
+    pub(crate) fn start_vm_update(&self, vm: &VmAsData, region: &Range<u64>) -> Result {
+        self.as_manager.lock().start_vm_update(vm, region)
+    }
+
+    /// Flags the end of a VM update.
+    ///
+    /// If the VM is resident, this will let GPU accesses on the updated
+    /// range go through, in case any of them were blocked.
+    /// If the VM is not resident, this is a NOP.
+    pub(crate) fn end_vm_update(&self, vm: &VmAsData) -> Result {
+        self.as_manager.lock().end_vm_update(vm)
+    }
+}
diff --git a/drivers/gpu/drm/tyr/mmu/address_space.rs b/drivers/gpu/drm/tyr/mmu/address_space.rs
new file mode 100644
index 000000000000..05ada3274466
--- /dev/null
+++ b/drivers/gpu/drm/tyr/mmu/address_space.rs
@@ -0,0 +1,493 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+//! GPU address space management and hardware operations.
+//!
+//! This module manages GPU hardware address spaces (AS), including configuration,
+//! command submission, and page table update regions. It handles the hardware
+//! interaction for MMU operations through MMIO register access.
+//!
+//! The [`AddressSpaceManager`] implements [`SlotOperations`] to integrate with
+//! the slot management system, enabling and configuring address spaces in the
+//! hardware slots as needed.
+//!
+//! [`SlotOperations`]: crate::slot::SlotOperations
+
+use core::ops::Range;
+
+use kernel::{
+    bits::*,
+    device::{
+        Bound,
+        Device, //
+    },
+    devres::Devres,
+    error::Result,
+    io,
+    iommu::pgtable::{
+        Config,
+        IoPageTable,
+        ARM64LPAES1, //
+    },
+    platform,
+    prelude::*,
+    sizes::{
+        SZ_2M,
+        SZ_4K, //
+    },
+    sync::{
+        aref::ARef,
+        Arc,
+        ArcBorrow,
+        LockedBy, //
+    },
+    time::Delta, //
+};
+
+use crate::{
+    driver::IoMem,
+    mmu::{
+        AsSlotManager,
+        Mmu, //
+    },
+    regs::*,
+    slot::{
+        Seat,
+        SlotOperations, //
+    }, //
+};
+
+/// Hardware address space configuration registers.
+///
+/// Contains register values for configuring a GPU MMU address space.
+#[derive(Clone, Copy)]
+struct AddressSpaceConfig {
+    /// Translation configuration.
+    ///
+    /// Controls address translation mode, address range restrictions, translation table
+    /// walk attributes, and access permission settings for this address space.
+    transcfg: u64,
+
+    /// Translation table base address.
+    ///
+    /// The address of the top level of a translation table structure.
+    transtab: u64,
+
+    /// Memory attributes.
+    ///
+    /// Defines memory attribute indirection entries that control cacheability
+    /// and other memory access properties for the address space.
+    memattr: u64,
+}
+
+/// Virtual memory (VM) address space data for GPU MMU operations.
+///
+/// Contains all resources and information needed by the [`AddressSpaceManager`]
+/// to activate a VM in a hardware address space slot.
+///
+/// On activation, we will pass an [`Arc`]<[`VmAsData`]> that will be stored in
+/// the slot to make sure the page table and the underlying resources
+/// (pages) used by the AS slot won't go away while the MMU points to
+/// those.
+///
+/// The `as_seat` field uses [`LockedBy`] to ensure safe concurrent access to
+/// the slot assignment state, protected by the [`AsSlotManager`] lock.
+#[pin_data]
+pub(crate) struct VmAsData {
+    /// Tracks this VM's binding to a hardware address space slot.
+    as_seat: LockedBy<Seat, AsSlotManager>,
+
+    /// Virtual address bits for this address space.
+    va_bits: u8,
+
+    /// Page table.
+    ///
+    /// Managed by devres to ensure proper cleanup. The page table maps
+    /// GPU virtual addresses to physical addresses for this VM.
+    #[pin]
+    pub(crate) page_table: Devres<IoPageTable<ARM64LPAES1>>,
+}
+
+impl VmAsData {
+    /// Creates a new VM address space data structure.
+    ///
+    /// Initializes the page table for the address space.
+    pub(crate) fn new<'a>(
+        mmu: &'a Mmu,
+        pdev: &'a platform::Device,
+        va_bits: u32,
+        pa_bits: u32,
+    ) -> impl pin_init::PinInit<VmAsData, Error> + 'a {
+        // SAFETY: pdev is a bound device.
+        let dev = unsafe { pdev.as_ref().as_bound() };
+
+        let pt_config = Config {
+            quirks: 0,
+            pgsize_bitmap: SZ_4K | SZ_2M,
+            ias: va_bits,
+            oas: pa_bits,
+            coherent_walk: false,
+        };
+
+        let page_table_init = IoPageTable::new(dev, pt_config);
+
+        try_pin_init!(Self {
+            as_seat: LockedBy::new(&mmu.as_manager, Seat::NoSeat),
+            va_bits: va_bits as u8,
+            page_table <- page_table_init,
+        }? Error)
+    }
+
+    /// Computes the hardware configuration for this address space.
+    ///
+    /// The caller must ensure that the address space is evicted and cleaned up
+    /// before the `VmAsData` is dropped.
+    fn as_config(&self, dev: &Device<Bound>) -> Result<AddressSpaceConfig> {
+        let pt = self.page_table.access(dev)?;
+
+        Ok(AddressSpaceConfig {
+            transcfg: AS_TRANSCFG_PTW_MEMATTR_WB
+                | AS_TRANSCFG_PTW_RA
+                | AS_TRANSCFG_ADRMODE_AARCH64_4K
+                | as_transcfg_ina_bits(u64::from(55 - self.va_bits)),
+            // SAFETY: Caller ensures proper cleanup.
+            transtab: unsafe { pt.ttbr() },
+            memattr: mair_to_memattr(pt.mair()),
+        })
+    }
+}
+
+/// Converts AArch64 MAIR register value to GPU memory attributes.
+fn mair_to_memattr(mair: u64) -> u64 {
+    let mut memattr: u64 = 0;
+
+    for i in 0..8 {
+        let in_attr = (mair >> (8 * i)) as u8;
+        let outer = in_attr >> 4;
+        let inner = in_attr & 0xf;
+
+        // For caching to be enabled, inner and outer caching policy
+        // have to be both write-back, if one of them is write-through
+        // or non-cacheable, we just choose non-cacheable. Device
+        // memory is also translated to non-cacheable.
+        let out_attr = if (outer & 3 == 0) || (outer & 4 == 0) || (inner & 4 == 0) {
+            AS_MEMATTR_AARCH64_INNER_OUTER_NC
+                | AS_MEMATTR_AARCH64_SH_MIDGARD_INNER
+                | as_memattr_aarch64_inner_alloc_expl(false, false)
+        } else {
+            // Use SH_CPU_INNER mode so SH_IS, which is used when
+            // IOMMU_CACHE is set, actually maps to the standard
+            // definition of inner-shareable and not Mali's
+            // internal-shareable mode.
+            //
+            // TODO: this assumes a non-coherent system.
+            AS_MEMATTR_AARCH64_INNER_OUTER_WB
+                | AS_MEMATTR_AARCH64_SH_MIDGARD_INNER
+                | as_memattr_aarch64_inner_alloc_expl(inner & 1 != 0, inner & 2 != 0)
+        };
+
+        memattr |= (u64::from(out_attr)) << (8 * i);
+    }
+
+    memattr
+}
+
+/// Manages GPU hardware address spaces via MMIO register operations.
+///
+/// Coordinates all hardware-level address space operations including enabling,
+/// disabling, flushing, and updating address spaces. Implements [`SlotOperations`]
+/// to integrate with the generic slot management system.
+///
+/// [`SlotOperations`]: crate::slot::SlotOperations
+pub(crate) struct AddressSpaceManager {
+    /// Platform device reference for DMA and device operations.
+    pdev: ARef<platform::Device>,
+
+    /// Memory-mapped I/O region for GPU register access.
+    iomem: Arc<Devres<IoMem>>,
+
+    /// Bitmask of available address space slots from GPU_AS_PRESENT register.
+    as_present: u32,
+}
+
+impl SlotOperations for AddressSpaceManager {
+    /// VM address space data stored in each hardware slot.
+    type SlotData = Arc<VmAsData>;
+
+    /// Activates an address space in a hardware slot.
+    fn activate(&mut self, slot_idx: usize, slot_data: &Self::SlotData) -> Result {
+        let as_config = slot_data.as_config(self.dev())?;
+        self.as_enable(slot_idx, &as_config)
+    }
+
+    /// Evicts an address space from a hardware slot.
+    fn evict(&mut self, slot_idx: usize, _slot_data: &Self::SlotData) -> Result {
+        if self.iomem.try_access().is_some() {
+            self.as_flush(slot_idx)?;
+            self.as_disable(slot_idx)?;
+        }
+        Ok(())
+    }
+}
+
+impl AddressSpaceManager {
+    /// Creates a new address space manager.
+    ///
+    /// Initializes the manager with references to the platform device and
+    /// I/O memory region, along with the bitmask of available AS slots.
+    pub(super) fn new(
+        pdev: &platform::Device,
+        iomem: ArcBorrow<'_, Devres<IoMem>>,
+        as_present: u32,
+    ) -> Result<AddressSpaceManager> {
+        Ok(Self {
+            pdev: pdev.into(),
+            iomem: iomem.into(),
+            as_present,
+        })
+    }
+
+    /// Returns a reference to the bound device.
+    fn dev(&self) -> &Device<Bound> {
+        // SAFETY: pdev is a bound device.
+        unsafe { self.pdev.as_ref().as_bound() }
+    }
+
+    /// Validates that an AS slot number is within range and present in hardware.
+    ///
+    /// Checks that the slot index is less than [`MAX_AS_REGISTERS`] and that
+    /// the corresponding bit is set in the `as_present` mask read from the GPU.
+    ///
+    /// Returns [`EINVAL`] if the slot is out of range or not present in hardware.
+    fn validate_as_slot(&self, as_nr: usize) -> Result {
+        if as_nr >= MAX_AS_REGISTERS {
+            pr_err!(
+                "AS slot {} out of valid range (max {})\n",
+                as_nr,
+                MAX_AS_REGISTERS
+            );
+            return Err(EINVAL);
+        }
+
+        if (self.as_present & (1 << as_nr)) == 0 {
+            pr_err!(
+                "AS slot {} not present in hardware (AS_PRESENT={:#x})\n",
+                as_nr,
+                self.as_present
+            );
+            return Err(EINVAL);
+        }
+
+        Ok(())
+    }
+
+    /// Waits for an AS slot to become ready (not active).
+    ///
+    /// Returns an error if polling times out after 10ms or if register access fails.
+    fn as_wait_ready(&self, as_nr: usize) -> Result {
+        let op = || as_status(as_nr)?.read(self.dev(), &self.iomem);
+        let cond = |status: &u32| -> bool { *status & AS_STATUS_ACTIVE == 0 };
+        let _ =
+            io::poll::read_poll_timeout(op, cond, Delta::from_millis(0), Delta::from_millis(10))?;
+
+        Ok(())
+    }
+
+    /// Sends a command to an AS slot.
+    ///
+    /// Returns an error if waiting for ready times out or if register write fails.
+    fn as_send_cmd(&mut self, as_nr: usize, cmd: u32) -> Result {
+        self.as_wait_ready(as_nr)?;
+        as_command(as_nr)?.write(self.dev(), &self.iomem, cmd)?;
+        Ok(())
+    }
+
+    /// Sends a command to an AS slot and waits for completion.
+    ///
+    /// Returns an error if sending the command fails or if waiting for completion times out.
+    fn as_send_cmd_and_wait(&mut self, as_nr: usize, cmd: u32) -> Result {
+        self.as_send_cmd(as_nr, cmd)?;
+        self.as_wait_ready(as_nr)?;
+        Ok(())
+    }
+
+    /// Enables an AS slot with the provided configuration.
+    ///
+    /// Returns an error if the slot is invalid or if register writes/commands fail.
+    fn as_enable(&mut self, as_nr: usize, as_config: &AddressSpaceConfig) -> Result {
+        self.validate_as_slot(as_nr)?;
+
+        let transtab = as_config.transtab;
+        let transcfg = as_config.transcfg;
+        let memattr = as_config.memattr;
+
+        let transtab_lo = (transtab & 0xffffffff) as u32;
+        let transtab_hi = (transtab >> 32) as u32;
+
+        let transcfg_lo = (transcfg & 0xffffffff) as u32;
+        let transcfg_hi = (transcfg >> 32) as u32;
+
+        let memattr_lo = (memattr & 0xffffffff) as u32;
+        let memattr_hi = (memattr >> 32) as u32;
+
+        let dev = self.dev();
+        as_transtab_lo(as_nr)?.write(dev, &self.iomem, transtab_lo)?;
+        as_transtab_hi(as_nr)?.write(dev, &self.iomem, transtab_hi)?;
+
+        as_transcfg_lo(as_nr)?.write(dev, &self.iomem, transcfg_lo)?;
+        as_transcfg_hi(as_nr)?.write(dev, &self.iomem, transcfg_hi)?;
+
+        as_memattr_lo(as_nr)?.write(dev, &self.iomem, memattr_lo)?;
+        as_memattr_hi(as_nr)?.write(dev, &self.iomem, memattr_hi)?;
+
+        self.as_send_cmd_and_wait(as_nr, AS_COMMAND_UPDATE)?;
+
+        Ok(())
+    }
+
+    /// Disables an AS slot and clears its configuration.
+    ///
+    /// Returns an error if the slot is invalid or if register writes/commands fail.
+    fn as_disable(&mut self, as_nr: usize) -> Result {
+        self.validate_as_slot(as_nr)?;
+
+        // Flush AS before disabling
+        self.as_send_cmd_and_wait(as_nr, AS_COMMAND_FLUSH_MEM)?;
+
+        let dev = self.dev();
+        as_transtab_lo(as_nr)?.write(dev, &self.iomem, 0)?;
+        as_transtab_hi(as_nr)?.write(dev, &self.iomem, 0)?;
+
+        as_memattr_lo(as_nr)?.write(dev, &self.iomem, 0)?;
+        as_memattr_hi(as_nr)?.write(dev, &self.iomem, 0)?;
+
+        as_transcfg_lo(as_nr)?.write(dev, &self.iomem, AS_TRANSCFG_ADRMODE_UNMAPPED as u32)?;
+        as_transcfg_hi(as_nr)?.write(dev, &self.iomem, 0)?;
+
+        self.as_send_cmd_and_wait(as_nr, AS_COMMAND_UPDATE)?;
+
+        Ok(())
+    }
+
+    /// Starts an atomic translation table update for a memory region.
+    ///
+    /// Returns an error if the slot is invalid or if register writes/commands fail.
+    fn as_start_update(&mut self, as_nr: usize, region: &Range<u64>) -> Result {
+        self.validate_as_slot(as_nr)?;
+
+        // The locked region is a naturally aligned power of 2 block encoded as
+        // log2 minus 1.
+        //
+        // Calculate the desired start/end and look for the highest bit which
+        // differs. The smallest naturally aligned block must include this bit
+        // change, the desired region starts with this bit (and subsequent bits)
+        // zeroed and ends with the bit (and subsequent bits) set to one.
+        let region_width = core::cmp::max(
+            64 - (region.start ^ (region.end - 1)).leading_zeros() as u8,
+            AS_LOCK_REGION_MIN_SIZE.trailing_zeros() as u8,
+        ) - 1;
+
+        // Mask off the low bits of region.start, which would be ignored by the
+        // hardware anyways.
+        let region_start =
+            region.start & genmask_checked_u64(u32::from(region_width)..=63).ok_or(EINVAL)?;
+
+        let region = (u64::from(region_width)) | region_start;
+
+        let region_lo = (region & 0xffffffff) as u32;
+        let region_hi = (region >> 32) as u32;
+
+        // Lock the region that needs to be updated.
+        let dev = self.dev();
+        as_lockaddr_lo(as_nr)?.write(dev, &self.iomem, region_lo)?;
+        as_lockaddr_hi(as_nr)?.write(dev, &self.iomem, region_hi)?;
+
+        self.as_send_cmd(as_nr, AS_COMMAND_LOCK)
+    }
+
+    /// Completes an atomic translation table update.
+    ///
+    /// Returns an error if the slot is invalid or if the flush command fails.
+    fn as_end_update(&mut self, as_nr: usize) -> Result {
+        self.validate_as_slot(as_nr)?;
+        self.as_send_cmd_and_wait(as_nr, AS_COMMAND_FLUSH_PT)
+    }
+
+    /// Flushes the translation table cache for an AS slot.
+    ///
+    /// Returns an error if the slot is invalid or if the flush command fails.
+    fn as_flush(&mut self, as_nr: usize) -> Result {
+        self.validate_as_slot(as_nr)?;
+        self.as_send_cmd(as_nr, AS_COMMAND_FLUSH_PT)
+    }
+}
+
+impl AsSlotManager {
+    /// Locks a region for translation table updates if the VM has an active slot.
+    ///
+    /// If the VM is currently assigned to a hardware slot, locks the specified
+    /// memory region to make translation table updates atomic. GPU accesses to the
+    /// region will be blocked until [`end_vm_update`] is called.
+    ///
+    /// If the VM is not resident in a hardware slot, this is a no-op.
+    pub(super) fn start_vm_update(&mut self, vm: &VmAsData, region: &Range<u64>) -> Result {
+        let seat = vm.as_seat.access(self);
+        match seat.slot() {
+            Some(slot) => {
+                let as_nr = slot as usize;
+                self.as_start_update(as_nr, region)
+            }
+            _ => Ok(()),
+        }
+    }
+
+    /// Completes translation table updates and unlocks the region.
+    ///
+    /// If the VM is currently assigned to a hardware slot, flushes the translation
+    /// table cache and unlocks the region that was locked by [`start_vm_update`],
+    /// allowing GPU accesses to proceed with the updated translation tables.
+    ///
+    /// If the VM is not resident in a hardware slot, this is a no-op.
+    pub(super) fn end_vm_update(&mut self, vm: &VmAsData) -> Result {
+        let seat = vm.as_seat.access(self);
+        match seat.slot() {
+            Some(slot) => {
+                let as_nr = slot as usize;
+                self.as_end_update(as_nr)
+            }
+            _ => Ok(()),
+        }
+    }
+
+    /// Flushes translation table cache if the VM has an active slot.
+    ///
+    /// If the VM is currently assigned to a hardware slot, invalidates cached
+    /// translation table entries to ensure subsequent GPU accesses use updated translations.
+    ///
+    /// If the VM is not resident in a hardware slot, this is a no-op.
+    pub(super) fn flush_vm(&mut self, vm: &VmAsData) -> Result {
+        let seat = vm.as_seat.access(self);
+        match seat.slot() {
+            Some(slot) => {
+                let as_nr = slot as usize;
+                self.as_flush(as_nr)
+            }
+            _ => Ok(()),
+        }
+    }
+
+    /// Activates a VM by assigning it to a hardware slot.
+    ///
+    /// Allocates a hardware address space slot for the VM and configures
+    /// it with the VM's translation table and memory attributes.
+    pub(super) fn activate_vm(&mut self, vm: ArcBorrow<'_, VmAsData>) -> Result {
+        self.activate(&vm.as_seat, vm.into())
+    }
+
+    /// Deactivates a VM by evicting it from its hardware slot.
+    ///
+    /// Flushes any pending operations and clears the hardware slot's
+    /// configuration, freeing the slot for use by other VMs.
+    pub(super) fn deactivate_vm(&mut self, vm: &VmAsData) -> Result {
+        self.evict(&vm.as_seat)
+    }
+}
diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
index 20b38120e20e..9f9f31ea02e3 100644
--- a/drivers/gpu/drm/tyr/tyr.rs
+++ b/drivers/gpu/drm/tyr/tyr.rs
@@ -11,6 +11,7 @@
 mod file;
 mod gem;
 mod gpu;
+mod mmu;
 mod regs;
 mod slot;
 
-- 
2.52.0

