Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNFmO2kcpmmeKQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:25:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8D31E69BE
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F52910E5F8;
	Mon,  2 Mar 2026 23:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="QMDNwQ6J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AD310E5F7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 23:25:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772493919; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gPJlKNFhjwd43fO+/FRbLfqP2q6VqqAc1oHpPnmt746ZEutuA36053OB2VJWzjMBGZMEx0BiCTbWZO9zSqcf6ZvjLoy2b01yz7Ip5dxkL4+bHlIsWPXN4WlmfH/4veH4BgVk8t62p/QNm/IBzAYcO2cXqMXLNQy3BGK3FTfmISU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772493919;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=264dLKRntvF+qsPDCyZrVTLrgbsp20t1nd9qxbYnRDs=; 
 b=bNLTpsRCY5Ex3NebAF1CjxeGMAtWKX1Paj2idTLLxOGd9Mi/0dY+ZAxorE2tlM8Va5x/sRO3iyxMFyg4u5mSdp9f/ogwM94qOYSH1eM9FFaSD8EAuwaHyWA8nwHZHpNAoXiVbkenGFInRLPo/5OY4rVXdnUE6j7OIs7FYP3iC+o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772493919; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=264dLKRntvF+qsPDCyZrVTLrgbsp20t1nd9qxbYnRDs=;
 b=QMDNwQ6J0O0xKYx8PucuC1i/VdvHHUwlRTF8mlDvF840poCRD/BO5dgcqSp6pbAF
 Ku7mkGekhfAOhuVmmwUdlAU8F7p3kdvrNBvkyhfYVkFTi4dV0Cqs+GN4AbjC7HiFHbZ
 5PZyux6bX+RTaLQhh/4IYjp1qlMtYowwmF5G8Nyg=
Received: by mx.zohomail.com with SMTPS id 1772493918080986.5558213758512;
 Mon, 2 Mar 2026 15:25:18 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, beata.michalska@arm.com, lyude@redhat.com,
 work@onurozkan.dev, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 12/12] drm/tyr: add firmware loading and MCU boot support
Date: Mon,  2 Mar 2026 15:25:00 -0800
Message-ID: <20260302232500.244489-13-deborah.brouwer@collabora.com>
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
X-Rspamd-Queue-Id: 9F8D31E69BE
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

Add firmware loading and management for the Mali CSF GPU. This introduces
the fw module that loads the Mali GPU firmware binary, parses it into
sections, and maps those sections into the MCU VM at the required
virtual addresses.

On probe, the firmware is loaded, its sections are mapped and populated,
the MCU VM is activated, and the MCU is booted.

Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- Add missing RUST_FW_LOADER_ABSTRACTIONS.
- Set explicit allocation strategy option for kernel buffer objects.
- Stop using KBox for fw sections.
- Add bounds check for firmware copying.

 drivers/gpu/drm/tyr/Kconfig   |   1 +
 drivers/gpu/drm/tyr/driver.rs |  16 +-
 drivers/gpu/drm/tyr/fw.rs     | 270 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/gem.rs    |   3 -
 drivers/gpu/drm/tyr/mmu.rs    |   1 -
 drivers/gpu/drm/tyr/slot.rs   |   1 -
 drivers/gpu/drm/tyr/tyr.rs    |   1 +
 drivers/gpu/drm/tyr/vm.rs     |   1 -
 8 files changed, 287 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/tyr/fw.rs

diff --git a/drivers/gpu/drm/tyr/Kconfig b/drivers/gpu/drm/tyr/Kconfig
index e5db8fa5dd57..14da410f0d84 100644
--- a/drivers/gpu/drm/tyr/Kconfig
+++ b/drivers/gpu/drm/tyr/Kconfig
@@ -18,6 +18,7 @@ config DRM_TYR
 	depends on MMU
 	select DRM_TYR_STATIC_DEPS
 	select IOMMU_IO_PGTABLE_LPAE
+	select RUST_FW_LOADER_ABSTRACTIONS
 	depends on IOMMU_SUPPORT
 	default n
 	help
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 7174ab2fd011..7bbdeb75740c 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -40,6 +40,7 @@
 
 use crate::{
     file::TyrDrmFileData,
+    fw::Firmware,
     gem::BoData,
     gpu,
     gpu::GpuInfo,
@@ -63,6 +64,8 @@ pub(crate) struct TyrPlatformDriverData {
 pub(crate) struct TyrDrmDeviceData {
     pub(crate) pdev: ARef<platform::Device>,
 
+    pub(crate) fw: Arc<Firmware>,
+
     #[pin]
     clks: Mutex<Clocks>,
 
@@ -147,10 +150,21 @@ fn probe(
         let uninit_ddev = UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref())?;
         let platform: ARef<platform::Device> = pdev.into();
 
-        let _mmu = Mmu::new(pdev, iomem.as_arc_borrow(), &gpu_info)?;
+        let mmu = Mmu::new(pdev, iomem.as_arc_borrow(), &gpu_info)?;
+
+        let firmware = Firmware::new(
+            pdev,
+            iomem.as_arc_borrow(),
+            &uninit_ddev,
+            mmu.as_arc_borrow(),
+            &gpu_info,
+        )?;
+
+        firmware.boot()?;
 
         let data = try_pin_init!(TyrDrmDeviceData {
                 pdev: platform.clone(),
+                fw: firmware,
                 clks <- new_mutex!(Clocks {
                     core: core_clk,
                     stacks: stacks_clk,
diff --git a/drivers/gpu/drm/tyr/fw.rs b/drivers/gpu/drm/tyr/fw.rs
new file mode 100644
index 000000000000..b62e5ed69c4d
--- /dev/null
+++ b/drivers/gpu/drm/tyr/fw.rs
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+//! Firmware loading and management for Mali CSF GPU.
+//!
+//! This module handles loading the Mali GPU firmware binary, parsing it into sections,
+//! and mapping those sections into the MCU's virtual address space. Each firmware section
+//! has specific properties (read/write/execute permissions, cache modes) and must be loaded
+//! at specific virtual addresses expected by the MCU.
+//!
+//! See [`Firmware`] for the main firmware management interface and [`Section`] for
+//! individual firmware sections.
+//!
+//! [`Firmware`]: crate::fw::Firmware
+//! [`Section`]: crate::fw::Section
+
+use kernel::{
+    bits::genmask_u32,
+    devres::Devres,
+    drm::{
+        gem::BaseObject,
+        Uninit, //
+    },
+    impl_flags,
+    io::{
+        poll,
+        Io, //
+    },
+    platform,
+    prelude::*,
+    str::CString,
+    sync::{
+        Arc,
+        ArcBorrow, //
+    },
+    time,
+    types::ARef, //
+};
+
+use crate::{
+    driver::{
+        IoMem,
+        TyrDrmDevice, //
+    },
+    fw::parser::{
+        FwParser,
+        ParsedSection, //
+    },
+    gem,
+    gem::{
+        KernelBo,
+        KernelBoVaAlloc, //
+    },
+    gpu::{
+        GpuId,
+        GpuInfo, //
+    },
+    mmu::Mmu,
+    regs,
+    vm::Vm, //
+};
+
+mod parser;
+
+impl_flags!(
+    #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
+    pub(super) struct SectionFlags(u32);
+
+    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
+    pub(super) enum SectionFlag {
+        Read = 1 << 0,
+        Write = 1 << 1,
+        Exec = 1 << 2,
+        CacheModeNone = 0 << 3,
+        CacheModeCached = 1 << 3,
+        CacheModeUncachedCoherent = 2 << 3,
+        CacheModeCachedCoherent = 3 << 3,
+        Prot = 1 << 5,
+        Shared = 1 << 30,
+        Zero = 1 << 31,
+    }
+);
+
+pub(super) const CACHE_MODE_MASK: SectionFlags = SectionFlags(genmask_u32(3..=4));
+
+pub(super) const CSF_MCU_SHARED_REGION_START: u32 = 0x04000000;
+
+impl SectionFlags {
+    fn cache_mode(&self) -> SectionFlags {
+        *self & CACHE_MODE_MASK
+    }
+}
+
+impl TryFrom<u32> for SectionFlags {
+    type Error = Error;
+
+    fn try_from(value: u32) -> Result<Self, Self::Error> {
+        let valid_flags = SectionFlags::from(SectionFlag::Read)
+            | SectionFlags::from(SectionFlag::Write)
+            | SectionFlags::from(SectionFlag::Exec)
+            | CACHE_MODE_MASK
+            | SectionFlags::from(SectionFlag::Prot)
+            | SectionFlags::from(SectionFlag::Shared)
+            | SectionFlags::from(SectionFlag::Zero);
+
+        if value & valid_flags.0 != value {
+            Err(EINVAL)
+        } else {
+            Ok(Self(value))
+        }
+    }
+}
+
+/// A parsed section of the firmware binary.
+struct Section {
+    // Raw firmware section data for reset purposes
+    #[expect(dead_code)]
+    data: KVec<u8>,
+
+    // Keep the BO backing this firmware section so that both the
+    // GPU mapping and CPU mapping remain valid until the Section is dropped.
+    #[expect(dead_code)]
+    mem: gem::KernelBo,
+}
+
+/// Loaded firmware with sections mapped into MCU VM.
+pub(crate) struct Firmware {
+    /// Platform device reference (needed to access the MCU JOB_IRQ registers).
+    pdev: ARef<platform::Device>,
+
+    /// Iomem need to access registers.
+    iomem: Arc<Devres<IoMem>>,
+
+    /// MCU VM.
+    vm: Arc<Vm>,
+
+    /// List of firmware sections.
+    #[expect(dead_code)]
+    sections: KVec<Section>,
+}
+
+impl Drop for Firmware {
+    fn drop(&mut self) {
+        // AS slots retain a VM ref, we need to kill the circular ref manually.
+        self.vm.kill();
+    }
+}
+
+impl Firmware {
+    fn init_section_mem(mem: &mut KernelBo, data: &KVec<u8>) -> Result {
+        if data.is_empty() {
+            return Ok(());
+        }
+
+        let vmap = mem.bo.vmap::<0>()?;
+        let size = mem.bo.size();
+
+        if data.len() > size {
+            pr_err!("fw section {} bigger than BO {}\n", data.len(), size);
+            return Err(EINVAL);
+        }
+
+        for (i, &byte) in data.iter().enumerate() {
+            vmap.try_write8(byte, i)?;
+        }
+
+        Ok(())
+    }
+
+    fn request(
+        ddev: &TyrDrmDevice<Uninit>,
+        gpu_info: &GpuInfo,
+    ) -> Result<kernel::firmware::Firmware> {
+        let gpu_id = GpuId::from(gpu_info.gpu_id);
+
+        let path = CString::try_from_fmt(fmt!(
+            "arm/mali/arch{}.{}/mali_csffw.bin",
+            gpu_id.arch_major,
+            gpu_id.arch_minor
+        ))?;
+
+        kernel::firmware::Firmware::request(&path, ddev.as_ref())
+    }
+
+    fn load(
+        ddev: &TyrDrmDevice<Uninit>,
+        gpu_info: &GpuInfo,
+    ) -> Result<(kernel::firmware::Firmware, KVec<ParsedSection>)> {
+        let fw = Self::request(ddev, gpu_info)?;
+        let mut parser = FwParser::new(fw.data());
+
+        let parsed_sections = parser.parse()?;
+
+        Ok((fw, parsed_sections))
+    }
+
+    /// Load firmware and map sections into MCU VM.
+    pub(crate) fn new(
+        pdev: &platform::Device,
+        iomem: ArcBorrow<'_, Devres<IoMem>>,
+        ddev: &TyrDrmDevice<Uninit>,
+        mmu: ArcBorrow<'_, Mmu>,
+        gpu_info: &GpuInfo,
+    ) -> Result<Arc<Firmware>> {
+        let vm = Vm::new(pdev, ddev, mmu, gpu_info)?;
+
+        let (fw, parsed_sections) = Self::load(ddev, gpu_info)?;
+
+        vm.activate()?;
+
+        let mut sections = KVec::new();
+        for parsed in parsed_sections {
+            let size = (parsed.va.end - parsed.va.start) as usize;
+            let va = u64::from(parsed.va.start);
+
+            let mut mem = KernelBo::new(
+                ddev,
+                vm.as_arc_borrow(),
+                size.try_into().unwrap(),
+                KernelBoVaAlloc::Explicit(va),
+                parsed.vm_map_flags,
+            )?;
+
+            let section_start = parsed.data_range.start as usize;
+            let section_end = parsed.data_range.end as usize;
+            let mut data = KVec::new();
+
+            // Ensure that the firmware slice is not out of bounds.
+            let fw_data = fw.data();
+            let bytes = fw_data.get(section_start..section_end).ok_or(EINVAL)?;
+            data.extend_from_slice(bytes, GFP_KERNEL)?;
+
+            Self::init_section_mem(&mut mem, &data)?;
+
+            sections.push(Section { data, mem }, GFP_KERNEL)?;
+        }
+
+        let firmware = Arc::new(
+            Firmware {
+                pdev: pdev.into(),
+                iomem: iomem.into(),
+                vm,
+                sections,
+            },
+            GFP_KERNEL,
+        )?;
+
+        Ok(firmware)
+    }
+
+    pub(crate) fn boot(&self) -> Result {
+        // SAFETY: Boot is currently only called in the probe path, so we're sure we have a bound
+        // device.
+        let dev = unsafe { self.pdev.as_ref().as_bound() };
+
+        regs::MCU_CONTROL.write(dev, &self.iomem, regs::MCU_CONTROL_AUTO)?;
+
+        if let Err(e) = poll::read_poll_timeout(
+            || regs::MCU_STATUS.read(dev, &self.iomem),
+            |status| *status == regs::MCU_STATUS_ENABLED,
+            time::Delta::from_millis(1),
+            time::Delta::from_millis(100),
+        ) {
+            let status = regs::MCU_STATUS.read(dev, &self.iomem)?;
+            pr_err!("MCU failed to boot, status: {}", status);
+            return Err(e);
+        }
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index f3bb58ef5eae..ed4eeb4e6d69 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -94,7 +94,6 @@ pub(crate) fn new_dummy_object<Ctx: DeviceContext>(ddev: &TyrDrmDevice<Ctx>) ->
 /// a [`KernelBo`]. An automatic VA allocation strategy will be added in the future.
 pub(crate) enum KernelBoVaAlloc {
     /// Explicit VA address specified by the caller.
-    #[expect(dead_code)]
     Explicit(u64),
 }
 
@@ -107,7 +106,6 @@ pub(crate) enum KernelBoVaAlloc {
 /// When dropped, the buffer is automatically unmapped from the GPU VA space.
 pub(crate) struct KernelBo {
     /// The underlying GEM buffer object.
-    #[expect(dead_code)]
     pub(crate) bo: ARef<Bo>,
     /// The GPU VM this buffer is mapped into.
     vm: Arc<Vm>,
@@ -121,7 +119,6 @@ impl KernelBo {
     /// This function allocates a new shmem-backed GEM object and immediately maps
     /// it into the specified GPU virtual memory space. The mapping is automatically
     /// cleaned up when the [`KernelBo`] is dropped.
-    #[expect(dead_code)]
     pub(crate) fn new<Ctx: DeviceContext>(
         ddev: &TyrDrmDevice<Ctx>,
         vm: ArcBorrow<'_, Vm>,
diff --git a/drivers/gpu/drm/tyr/mmu.rs b/drivers/gpu/drm/tyr/mmu.rs
index 2c7ac1fb1ac2..52a6bbbb179a 100644
--- a/drivers/gpu/drm/tyr/mmu.rs
+++ b/drivers/gpu/drm/tyr/mmu.rs
@@ -12,7 +12,6 @@
 //!
 //! [`AddressSpaceManager`]: address_space::AddressSpaceManager
 //! [`SlotManager`]: crate::slot::SlotManager
-#![allow(dead_code)]
 
 use core::ops::Range;
 
diff --git a/drivers/gpu/drm/tyr/slot.rs b/drivers/gpu/drm/tyr/slot.rs
index debba75f6204..53abb9eeb970 100644
--- a/drivers/gpu/drm/tyr/slot.rs
+++ b/drivers/gpu/drm/tyr/slot.rs
@@ -20,7 +20,6 @@
 //!
 //! [SlotOperations]: crate::slot::SlotOperations
 //! [SlotManager]: crate::slot::SlotManager
-#![allow(dead_code)]
 
 use core::{
     mem::take,
diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
index b3244670dd79..18b0668bb217 100644
--- a/drivers/gpu/drm/tyr/tyr.rs
+++ b/drivers/gpu/drm/tyr/tyr.rs
@@ -9,6 +9,7 @@
 
 mod driver;
 mod file;
+mod fw;
 mod gem;
 mod gpu;
 mod mmu;
diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
index f19acebdd66b..936c3049812b 100644
--- a/drivers/gpu/drm/tyr/vm.rs
+++ b/drivers/gpu/drm/tyr/vm.rs
@@ -6,7 +6,6 @@
 //! the illusion of owning the entire virtual address (VA) range, similar to CPU virtual memory.
 //! Each virtual memory (VM) area is backed by ARM64 LPAE Stage 1 page tables and can be
 //! mapped into hardware address space (AS) slots for GPU execution.
-#![allow(dead_code)]
 
 use core::ops::Range;
 
-- 
2.52.0

