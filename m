Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FFFD21AA3
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 23:54:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1014E10E25D;
	Wed, 14 Jan 2026 22:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kEGNPL/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEA910E0F6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 22:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768431266;
 bh=38HM0MWnZEGyo0InC/kV6GVqGzBel3yKXLC3wnBLgSs=;
 h=From:Date:Subject:To:Cc:From;
 b=kEGNPL/unH7DnONvk3VRfrnHiH6Ul55Mdzyv5pDUuaGfMnyFbLyPWmDaKQfTBqBrJ
 iiVr/hFk4zuuNZHCXZqGDW7xiRecUV2xoK+Ab4g0z4fDMwRWNhbd6hgTopL3Ircs0o
 gDFNbPoFXD0hnMQPaxgKYcCAGpqxaWi3PHV5/OgA3U4qFQoW+5scLxfvW4JDzaG6p1
 6k6FhYOm1SjWrAwFNBl4OfXjw3DLRtAL7NUu9YQZEZ6YV0TEPYwSVafxFwxd6sCwnG
 yEhHAk4m+hl5oz3rILF46K3l7yRomeSjvCbZvKsDStvZOcdTFaZL4w9JA3EYs1RulY
 36Ts7+rJ/I2SQ==
Received: from [192.168.0.79] (unknown
 [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A1D9717E01E7;
 Wed, 14 Jan 2026 23:54:23 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 14 Jan 2026 19:53:42 -0300
Subject: [PATCH] rust/drm: tyr: Convert to the register!() macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
X-B4-Tracking: v=1; b=H4sIAHUeaGkC/yXNTQ6CMBCG4as0XVvSoVB+Yoz3MCwqDDgGiraVa
 Ah3t8ry/ZJ5ZuUeHaHnNVu5w4U8zTYGHBhvb8YOKKiLzVOZagmyFOHjhMOBfEAn0FSg+hJTpSS
 PJw+HPb3/3KXZ2+HzFdWwj3xC781frdkxojlIqSDPiqxMQJcFaClA3GcczWBx7M92oY5M0s7T6
 ffhajyKGBOFmi06gUq4NuPNtn0BdU62mMsAAAA=
X-Change-ID: 20260108-tyr-register-ea913f8e2330
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.3
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

Replace regs::Register with kernel::register. This allow us to more
succinctly express the register set by introducing the ability to describe
fields and their documentation and to auto-generate the accessors. In
particular, this is very helpful as it does away with a lot of manual masks
and shifts.

A future commit will eliminate HI/LO pairs once there is support for 64bit
reads and writes in kernel::register.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
Note that this patch depends on a rebased version of Joel's patch at [0].

That version is stale, so I ended up rebasing it locally myself for the
purpose of developing this patch and gathering some reviews on the list. In
other words, the current patch does not apply for the time being, but will
once a v7 for Joel's series is out.

[0]: https://lore.kernel.org/rust-for-linux/20251003154748.1687160-1-joelagnelf@nvidia.com/
---
 drivers/gpu/drm/tyr/driver.rs |  15 ++-
 drivers/gpu/drm/tyr/gpu.rs    |  55 ++++----
 drivers/gpu/drm/tyr/regs.rs   | 302 ++++++++++++++++++++++++++++++++----------
 3 files changed, 267 insertions(+), 105 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 0389c558c036..8e06db5320bf 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -66,19 +66,20 @@ unsafe impl Send for TyrData {}
 unsafe impl Sync for TyrData {}
 
 fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
-    regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
+    let io = iomem.access(dev)?;
+
+    regs::GpuCommand::default()
+        .set_command(regs::GPU_CMD_SOFT_RESET)
+        .write(io);
 
     // TODO: We cannot poll, as there is no support in Rust currently, so we
     // sleep. Change this when read_poll_timeout() is implemented in Rust.
     kernel::time::delay::fsleep(time::Delta::from_millis(100));
 
-    if regs::GPU_IRQ_RAWSTAT.read(dev, iomem)? & regs::GPU_IRQ_RAWSTAT_RESET_COMPLETED == 0 {
+    let rawstat = regs::GpuIrqRawstat::read(io);
+    if !rawstat.reset_completed() {
         dev_err!(dev, "GPU reset failed with errno\n");
-        dev_err!(
-            dev,
-            "GPU_INT_RAWSTAT is {}\n",
-            regs::GPU_IRQ_RAWSTAT.read(dev, iomem)?
-        );
+        dev_err!(dev, "GPU_INT_RAWSTAT is {}\n", u32::from(rawstat));
 
         return Err(EIO);
     }
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 6c582910dd5d..7c698fb1e36a 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -44,34 +44,36 @@ pub(crate) struct GpuInfo {
 
 impl GpuInfo {
     pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
-        let gpu_id = regs::GPU_ID.read(dev, iomem)?;
-        let csf_id = regs::GPU_CSF_ID.read(dev, iomem)?;
-        let gpu_rev = regs::GPU_REVID.read(dev, iomem)?;
-        let core_features = regs::GPU_CORE_FEATURES.read(dev, iomem)?;
-        let l2_features = regs::GPU_L2_FEATURES.read(dev, iomem)?;
-        let tiler_features = regs::GPU_TILER_FEATURES.read(dev, iomem)?;
-        let mem_features = regs::GPU_MEM_FEATURES.read(dev, iomem)?;
-        let mmu_features = regs::GPU_MMU_FEATURES.read(dev, iomem)?;
-        let thread_features = regs::GPU_THREAD_FEATURES.read(dev, iomem)?;
-        let max_threads = regs::GPU_THREAD_MAX_THREADS.read(dev, iomem)?;
-        let thread_max_workgroup_size = regs::GPU_THREAD_MAX_WORKGROUP_SIZE.read(dev, iomem)?;
-        let thread_max_barrier_size = regs::GPU_THREAD_MAX_BARRIER_SIZE.read(dev, iomem)?;
-        let coherency_features = regs::GPU_COHERENCY_FEATURES.read(dev, iomem)?;
-
-        let texture_features = regs::GPU_TEXTURE_FEATURES0.read(dev, iomem)?;
-
-        let as_present = regs::GPU_AS_PRESENT.read(dev, iomem)?;
-
-        let shader_present = u64::from(regs::GPU_SHADER_PRESENT_LO.read(dev, iomem)?);
+        let io = (*iomem).access(dev)?;
+
+        let gpu_id = regs::GpuId::read(io).into();
+        let csf_id = regs::CsfId::read(io).into();
+        let gpu_rev = regs::RevIdr::read(io).into();
+        let core_features = regs::CoreFeatures::read(io).into();
+        let l2_features = regs::L2Features::read(io).into();
+        let tiler_features = regs::TilerFeatures::read(io).into();
+        let mem_features = regs::MemFeatures::read(io).into();
+        let mmu_features = regs::MmuFeatures::read(io).into();
+        let thread_features = regs::ThreadFeatures::read(io).into();
+        let max_threads = regs::ThreadMaxThreads::read(io).into();
+        let thread_max_workgroup_size = regs::ThreadMaxWorkgroupSize::read(io).into();
+        let thread_max_barrier_size = regs::ThreadMaxBarrierSize::read(io).into();
+        let coherency_features = regs::CoherencyFeatures::read(io).into();
+
+        let texture_features = regs::TextureFeatures::read(io, 0).into();
+
+        let as_present = regs::AsPresent::read(io).into();
+
+        let shader_present = u64::from(u32::from(regs::ShaderPresentLo::read(io)));
         let shader_present =
-            shader_present | u64::from(regs::GPU_SHADER_PRESENT_HI.read(dev, iomem)?) << 32;
+            shader_present | u64::from(u32::from(regs::ShaderPresentHi::read(io))) << 32;
 
-        let tiler_present = u64::from(regs::GPU_TILER_PRESENT_LO.read(dev, iomem)?);
+        let tiler_present = u64::from(u32::from(regs::TilerPresentLo::read(io)));
         let tiler_present =
-            tiler_present | u64::from(regs::GPU_TILER_PRESENT_HI.read(dev, iomem)?) << 32;
+            tiler_present | u64::from(u32::from(regs::TilerPresentHi::read(io))) << 32;
 
-        let l2_present = u64::from(regs::GPU_L2_PRESENT_LO.read(dev, iomem)?);
-        let l2_present = l2_present | u64::from(regs::GPU_L2_PRESENT_HI.read(dev, iomem)?) << 32;
+        let l2_present = u64::from(u32::from(regs::L2PresentLo::read(io)));
+        let l2_present = l2_present | u64::from(u32::from(regs::L2PresentHi::read(io))) << 32;
 
         Ok(Self {
             gpu_id,
@@ -204,13 +206,14 @@ fn from(value: u32) -> Self {
 
 /// Powers on the l2 block.
 pub(crate) fn l2_power_on(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
-    regs::L2_PWRON_LO.write(dev, iomem, 1)?;
+    let io = (*iomem).access(dev)?;
+    regs::L2PwrOnLo::default().set_l2_pwron_lo(1).write(io);
 
     // TODO: We cannot poll, as there is no support in Rust currently, so we
     // sleep. Change this when read_poll_timeout() is implemented in Rust.
     kernel::time::delay::fsleep(time::Delta::from_millis(100));
 
-    if regs::L2_READY_LO.read(dev, iomem)? != 1 {
+    if regs::L2ReadyLo::read(io).l2_ready_lo() != 1 {
         dev_err!(dev, "Failed to power on the GPU\n");
         return Err(EIO);
     }
diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index f46933aaa221..a4e05ff463c0 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -8,44 +8,62 @@
 #![allow(dead_code)]
 
 use kernel::bits::bit_u32;
-use kernel::device::Bound;
-use kernel::device::Device;
-use kernel::devres::Devres;
 use kernel::prelude::*;
+use kernel::register;
 
-use crate::driver::IoMem;
-
-/// Represents a register in the Register Set
-///
-/// TODO: Replace this with the Nova `register!()` macro when it is available.
-/// In particular, this will automatically give us 64bit register reads and
-/// writes.
-pub(crate) struct Register<const OFFSET: usize>;
-
-impl<const OFFSET: usize> Register<OFFSET> {
-    #[inline]
-    pub(crate) fn read(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<u32> {
-        let value = (*iomem).access(dev)?.read32(OFFSET);
-        Ok(value)
-    }
-
-    #[inline]
-    pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u32) -> Result {
-        (*iomem).access(dev)?.write32(value, OFFSET);
-        Ok(())
-    }
-}
-
-pub(crate) const GPU_ID: Register<0x0> = Register;
-pub(crate) const GPU_L2_FEATURES: Register<0x4> = Register;
-pub(crate) const GPU_CORE_FEATURES: Register<0x8> = Register;
-pub(crate) const GPU_CSF_ID: Register<0x1c> = Register;
-pub(crate) const GPU_REVID: Register<0x280> = Register;
-pub(crate) const GPU_TILER_FEATURES: Register<0xc> = Register;
-pub(crate) const GPU_MEM_FEATURES: Register<0x10> = Register;
-pub(crate) const GPU_MMU_FEATURES: Register<0x14> = Register;
-pub(crate) const GPU_AS_PRESENT: Register<0x18> = Register;
-pub(crate) const GPU_IRQ_RAWSTAT: Register<0x20> = Register;
+register!(GpuId @ 0x0, "Information about the GPU architecture and release version" {
+    3:0     version_status as u32, "Status of the GPU release";
+    11:4    version_minor as u32, "Minor release version number";
+    15:12   version_major as u32, "Major release version number";
+    19:16   product_major as u32, "Product identifier";
+    23:20   arch_rev as u32, "Architecture patch revision";
+    27:24   arch_minor as u32, "Architecture minor revision";
+    31:28   arch_major as u32, "Architecture major revision";
+});
+
+register!(L2Features @ 0x4, "Level 2 cache features" {
+    7:0     line_size as u32, "L2 cache line size";
+    15:8    associativity as u32, "L2 cache associativity";
+    23:16   cache_size as u32, "L2 cache slice size";
+    31:24   bus_width as u32, "L2 cache bus width";
+});
+
+register!(CoreFeatures @ 0x8, "Information about the features of a shader core" {
+    7:0     core_variant as u32, "Shader core variant";
+});
+
+register!(CsfId @ 0x1c, "Version of the CSF hardware and MMU subsystem" {
+    3:0     mcu_rev as u32, "MCU revision ID";
+    9:4     mcu_minor as u32, "MCU minor revision number";
+    15:10   mcu_major as u32, "MCU major revision number";
+    19:16   cshw_rev as u32, "CSHW revision ID";
+    25:20   cshw_minor as u32, "CSHW minor revision number";
+    31:26   cshw_major as u32, "CSHW major revision number";
+});
+
+register!(RevIdr @ 0x280, "Extra revision information" {
+    31:0    revision as u32, "Revision information";
+});
+
+register!(TilerFeatures @ 0xc, "Tiler features" {
+    5:0     bin_size as u32, "Log of the tiler's bin size";
+    11:8    max_levels as u32, "Maximum number of available levels";
+});
+
+register!(MemFeatures @ 0x10, "Memory features" {
+    0:0     coherent_core_group as bool, "Core group is coherent";
+    1:1     coherent_super_group as bool, "Core supergroup is coherent";
+    11:8    l2_slices as u32, "L2 slice count";
+});
+
+register!(MmuFeatures @ 0x14, "MMU features" {
+    7:0     va_bits as u32, "Number of bits supported in virtual addresses";
+    15:8    pa_bits as u32, "Number of bits supported in physical addresses";
+});
+
+register!(AsPresent @ 0x18, "Address spaces present" {
+    31:0    as_present as u32, "Bitmask of present address spaces";
+});
 
 pub(crate) const GPU_IRQ_RAWSTAT_FAULT: u32 = bit_u32(0);
 pub(crate) const GPU_IRQ_RAWSTAT_PROTECTED_FAULT: u32 = bit_u32(1);
@@ -56,53 +74,193 @@ pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u3
 pub(crate) const GPU_IRQ_RAWSTAT_DOORBELL_STATUS: u32 = bit_u32(18);
 pub(crate) const GPU_IRQ_RAWSTAT_MCU_STATUS: u32 = bit_u32(19);
 
-pub(crate) const GPU_IRQ_CLEAR: Register<0x24> = Register;
-pub(crate) const GPU_IRQ_MASK: Register<0x28> = Register;
-pub(crate) const GPU_IRQ_STAT: Register<0x2c> = Register;
-pub(crate) const GPU_CMD: Register<0x30> = Register;
+register!(GpuIrqRawstat @ 0x20, "Raw unmasked interrupt status for the GPU" {
+    0:0     fault as bool, "A GPU fault has occourred";
+    1:1     protected_fault as bool, "Indicates a protected memory fault has occurred";
+    8:8     reset_completed as bool, "Indicates that a GPU reset has completed";
+    9:9     power_changed_single as bool, "Set when a single power domain has powered up or down";
+    10:10   power_changed_all as bool, "Set when all pending power domain changes are completed ";
+    17:17   clean_caches_completed as bool, "Indicates that a cache clean operation has completed";
+    18:18   doorbell_status as bool, "Mirrors the doorbell interrupt line to the CPU";
+    19:19   mcu_status as bool, "The MCU requires attention";
+});
+
+register!(GpuIrqClear @ 0x24, "Clears pending GPU interrupts" {
+    0:0     fault as bool, "Clear the fault interrupt";
+    1:1     protected_fault as bool, "Clear the protected_fault interrupt";
+    8:8     reset_completed as bool, "Clear the reset_completed interrupt";
+    9:9     power_changed_single as bool, "Clear the power_changed_single interrupt";
+    10:10   power_changed_all as bool, "Clear the power_changed_all interrupt";
+    17:17   clean_caches_completed as bool, "Clear the clean_caches_completed interrupt";
+    18:18   doorbell_status as bool, "Clear the doorbell_status interrupt";
+    19:19   mcu_status as bool, "Clear the mcu_status interrupt";
+});
+
+register!(GpuIrqMask @ 0x28, "Enabled GPU interrupts" {
+    0:0     fault as bool, "Enable the fault interrupt";
+    1:1     protected_fault as bool, "Enable the protected_fault interrupt";
+    8:8     reset_completed as bool, "Enable the reset_completed interrupt";
+    9:9     power_changed_single as bool, "Enable the power_changed_single interrupt";
+    10:10   power_changed_all as bool, "Enable the power_changed_all interrupt";
+    17:17   clean_caches_completed as bool, "Enable the clean_caches_completed interrupt";
+    18:18   doorbell_status as bool, "Enable the doorbell_status interrupt";
+    19:19   mcu_status as bool, "Enable the mcu_status interrupt";
+});
+
+register!(GpuIrqStatus @ 0x2c, "Masked GPU interrupt status" {
+    0:0     fault as bool, "The fault interrupt is pending";
+    1:1     protected_fault as bool, "The protected_fault interrupt is pending";
+    8:8     reset_completed as bool, "The reset_completed interrupt is pending";
+    9:9     power_changed_single as bool, "The power_changed_single interrupt is pending";
+    10:10   power_changed_all as bool, "The power_changed_all interrupt is pending";
+    17:17   clean_caches_completed as bool, "The clean_caches_completed interrupt is pending";
+    18:18   doorbell_status as bool, "The doorbell_status interrupt is pending";
+    19:19   mcu_status as bool, "The mcu_status interrupt is pending";
+});
+
 pub(crate) const GPU_CMD_SOFT_RESET: u32 = 1 | (1 << 8);
 pub(crate) const GPU_CMD_HARD_RESET: u32 = 1 | (2 << 8);
-pub(crate) const GPU_THREAD_FEATURES: Register<0xac> = Register;
-pub(crate) const GPU_THREAD_MAX_THREADS: Register<0xa0> = Register;
-pub(crate) const GPU_THREAD_MAX_WORKGROUP_SIZE: Register<0xa4> = Register;
-pub(crate) const GPU_THREAD_MAX_BARRIER_SIZE: Register<0xa8> = Register;
-pub(crate) const GPU_TEXTURE_FEATURES0: Register<0xb0> = Register;
-pub(crate) const GPU_SHADER_PRESENT_LO: Register<0x100> = Register;
-pub(crate) const GPU_SHADER_PRESENT_HI: Register<0x104> = Register;
-pub(crate) const GPU_TILER_PRESENT_LO: Register<0x110> = Register;
-pub(crate) const GPU_TILER_PRESENT_HI: Register<0x114> = Register;
-pub(crate) const GPU_L2_PRESENT_LO: Register<0x120> = Register;
-pub(crate) const GPU_L2_PRESENT_HI: Register<0x124> = Register;
-pub(crate) const L2_READY_LO: Register<0x160> = Register;
-pub(crate) const L2_READY_HI: Register<0x164> = Register;
-pub(crate) const L2_PWRON_LO: Register<0x1a0> = Register;
-pub(crate) const L2_PWRON_HI: Register<0x1a4> = Register;
-pub(crate) const L2_PWRTRANS_LO: Register<0x220> = Register;
-pub(crate) const L2_PWRTRANS_HI: Register<0x204> = Register;
-pub(crate) const L2_PWRACTIVE_LO: Register<0x260> = Register;
-pub(crate) const L2_PWRACTIVE_HI: Register<0x264> = Register;
-
-pub(crate) const MCU_CONTROL: Register<0x700> = Register;
+
+register!(GpuCommand @ 0x30, "GPU command register" {
+    7:0     command as u32, "GPU-specific command to execute";
+    31:8    payload as u32, "Payload for the command";
+});
+
+register!(ThreadFeatures @ 0xac, "Thread features of the GPU's threading system" {
+    21:0    max_registers as u32, "Total number of registers per core";
+    23:22   implementation_technology as u32;
+    31:24   max_task_queue as u32, "Maximum number of compute tasks waiting";
+
+});
+
+register!(ThreadMaxThreads @ 0xa0, "Maximum number of threads per core" {
+    31:0    max_threads as u32, "Maximum number of threads per core";
+});
+
+register!(ThreadMaxWorkgroupSize @ 0xa4, "Maximum number of threads per workgroup" {
+    31:0    max_workgroup_size as u32, "Maximum number of threads per workgroup";
+});
+
+register!(ThreadMaxBarrierSize @ 0xa8, "Maximum number of threads per barrier" {
+    31:0    max_barrier_size as u32, "Maximum number of threads per barrier";
+});
+
+register!(TextureFeatures @ 0xb0 [4], "Bitmap of supported texture formats" {});
+
+register!(ShaderPresentLo @ 0x100, "Bitmap of shader cores present in the hardware (lower 32 bits)" {
+    31:0    shader_present_lo as u32, "Bitmap of shader cores present in the hardware (lower 32 bits)";
+});
+
+register!(ShaderPresentHi @ 0x104, "Bitmap of shader cores present in the hardware (higher 32 bits)" {
+    31:0    shader_present_hi as u32, "Bitmap of shader cores present in the hardware (higher 32 bits)";
+});
+
+register!(TilerPresentLo @ 0x110, "Bitmap of tiler cores present in the hardware (lower 32 bits)" {
+    31:0    tiler_present_lo as u32, "Bitmap of tiler cores present in the hardware (lower 32 bits)";
+});
+
+register!(TilerPresentHi @ 0x114, "Bitmap of tiler cores present in the hardware (higher 32 bits)" {
+    31:0    tiler_present_hi as u32, "Bitmap of tiler cores present in the hardware (higher 32 bits)";
+});
+
+register!(L2PresentLo @ 0x120, "Bitmap of L2 caches present in the hardware (lower 32 bits)" {
+    31:0    l2_present_lo as u32, "Bitmap of L2 caches present in the hardware (lower 32 bits)";
+});
+
+register!(L2PresentHi @ 0x124, "Bitmap of L2 caches present in the hardware (higher 32 bits)" {
+    31:0    l2_present_hi as u32, "Bitmap of L2 caches present in the hardware (higher 32 bits)";
+});
+
+register!(L2ReadyLo @ 0x160, "Bitmap of L2 caches ready (lower 32 bits)" {
+    31:0    l2_ready_lo as u32, "Bitmap of L2 caches ready (lower 32 bits)";
+});
+
+register!(L2ReadyHi @ 0x164, "Bitmap of L2 caches ready (higher 32 bits)" {
+    31:0    l2_ready_hi as u32, "Bitmap of L2 caches ready (higher 32 bits)";
+});
+
+register!(L2PwrOnLo @ 0x1a0, "Bitmap of L2 caches power on requests (lower 32 bits)" {
+    31:0    l2_pwron_lo as u32, "Bitmap of L2 caches power on requests (lower 32 bits)";
+});
+
+register!(L2PwrOnHi @ 0x1a4, "Bitmap of L2 caches power on requests (higher 32 bits)" {
+    31:0    l2_pwron_hi as u32, "Bitmap of L2 caches power on requests (higher 32 bits)";
+});
+
+register!(L2PwrTransLo @ 0x200, "Bitmap of L2 caches in power transition (lower 32 bits)" {
+    31:0    l2_pwrtrans_lo as u32, "Bitmap of L2 caches in power transition (lower 32 bits)";
+});
+
+register!(L2PwrTransHi @ 0x204, "Bitmap of L2 caches in power transition (higher 32 bits)" {
+    31:0    l2_pwrtrans_hi as u32, "Bitmap of L2 caches in power transition (higher 32 bits)";
+});
+
+register!(L2PowerActiveLo @ 0x260, "Bitmap of L2 caches active (lower 32 bits)" {
+    31:0    l2_pwractive_lo as u32, "Bitmap of L2 caches active (lower 32 bits)";
+});
+
+register!(L2PowerActiveHi @ 0x264, "Bitmap of L2 caches active (higher 32 bits)" {
+    31:0    l2_pwractive_hi as u32, "Bitmap of L2 caches active (higher 32 bits)";
+});
+
 pub(crate) const MCU_CONTROL_ENABLE: u32 = 1;
 pub(crate) const MCU_CONTROL_AUTO: u32 = 2;
 pub(crate) const MCU_CONTROL_DISABLE: u32 = 0;
 
-pub(crate) const MCU_STATUS: Register<0x704> = Register;
+register!(McuControl @ 0x700, "Controls the execution state of the MCU subsystem" {
+    1:0     req as u32, "Request state change";
+});
+
 pub(crate) const MCU_STATUS_DISABLED: u32 = 0;
 pub(crate) const MCU_STATUS_ENABLED: u32 = 1;
 pub(crate) const MCU_STATUS_HALT: u32 = 2;
 pub(crate) const MCU_STATUS_FATAL: u32 = 3;
 
-pub(crate) const GPU_COHERENCY_FEATURES: Register<0x300> = Register;
+register!(McuStatus @ 0x704, "Reports the current execution state of the MCU subsystem" {
+    1:0     status as u32, "Current MCU status";
+});
+
+register!(CoherencyFeatures @ 0x300, "GPU coherency features" {
+    0:0     ace_lite as bool, "ACE-Lite protocol supported";
+    1:1     ace as bool, "ACE protocol supported";
+});
+
+register!(JobIrqRawstat @ 0x1000, "Raw unmasked interrupt status for firmware interrupts" {
+    30:0    csg as u32, "CSG request";
+    31:31   glb as bool, "GLB request";
+});
+
+register!(JobIrqClear @ 0x1004, "Clears pending firmware interrupts" {
+    30:0    csg as u32, "Clear CSG requests";
+    31:31   glb as bool, "Clear GLB request";
+});
+
+register!(JobIrqMask @ 0x1008, "Enabled firmware interrupts" {
+    30:0    csg as u32, "Enable CSG requests";
+    31:31   glb as bool, "Enable GLB request";
+});
+
+register!(JobIrqStatus @ 0x100c, "Masked firmware interrupt status" {
+    30:0    csg as u32, "Pending CSG requests";
+    31:31   glb as bool, "Pending GLB request";
+});
+
+register!(MmuIrqRawstat @ 0x2000, "Raw unmasked interrupt status for MMU interrupts" {
+    15:0    page_fault as u32, "Bitmask indicating which address spaces page-faulted";
+    31:31   command_completed as bool, "Bitmask indicating whether a command completed in a given AS";
+});
 
-pub(crate) const JOB_IRQ_RAWSTAT: Register<0x1000> = Register;
-pub(crate) const JOB_IRQ_CLEAR: Register<0x1004> = Register;
-pub(crate) const JOB_IRQ_MASK: Register<0x1008> = Register;
-pub(crate) const JOB_IRQ_STAT: Register<0x100c> = Register;
+register!(MmuIrqClear @ 0x2004, "Clears pending MMU interrupts" {
+    15:0    page_fault as u32, "Clear page-fault interrupts for the given address spaces";
+    31:31   command_completed as bool, "Clear command-completed interrupt for the given address spaces";
+});
 
-pub(crate) const JOB_IRQ_GLOBAL_IF: u32 = bit_u32(31);
+register!(MmuIrqMask @ 0x2008, "Enabled MMU interrupts" {
+    15:0    page_fault as u32, "Enable page-fault interrupts for the given address spaces";
+    31:31   command_completed as bool, "Enable command-completed interrupt for the given address spaces";
+});
 
-pub(crate) const MMU_IRQ_RAWSTAT: Register<0x2000> = Register;
-pub(crate) const MMU_IRQ_CLEAR: Register<0x2004> = Register;
-pub(crate) const MMU_IRQ_MASK: Register<0x2008> = Register;
-pub(crate) const MMU_IRQ_STAT: Register<0x200c> = Register;
+register!(MmuIrqStatus @ 0x200c, "Masked MMU interrupt status" {
+    15:0    page_fault as u32, "Pending page-fault interrupts for the given address spaces";
+    31:31   command_completed as bool, "Pending command-completed interrupt for the given address spaces";
+});

---
base-commit: f10c325a345fef0a688a2bcdfab1540d1c924148
change-id: 20260108-tyr-register-ea913f8e2330
prerequisite-message-id: <20251003154748.1687160-1-joelagnelf@nvidia.com>
prerequisite-patch-id: 027ea340650912c31c3b3e2e2ba60f390b449218

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

