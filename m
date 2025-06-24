Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBC3AE6630
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 15:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255D710E5A9;
	Tue, 24 Jun 2025 13:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jmf4RyL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6847810E5A0;
 Tue, 24 Jun 2025 13:23:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5A2BC61155;
 Tue, 24 Jun 2025 13:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3F9C4CEF1;
 Tue, 24 Jun 2025 13:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750771423;
 bh=ZVZeCz4080DuWECCuNctinG1lnDgPZZ/aLY+BEgOEdk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jmf4RyL+KGvSwmMtbJUU7LLL96BXOQThddSvDyhOBNjokAc6Sr1RBuZInnrJcnK+I
 F3zSSAjsIM97MYCvkQsk8aCHR58q1Rf99pYzr/Ns/hD/on8w849g66BiJFrRotvimL
 P8IpFahfMfC+RSXSd4xbIHoR/HI7SoDTF+6hPbHEzrRKxhGZw+05KWooljgn/X118B
 IBErOuGK0ULd9DwhXhOtgbjN7MRkAwZxeEX36NN4XG9eoNgeTg1BtAeN3jgYBtuHXI
 3X8exuN8iQ5FmMOysZtHZlg+Fk1Yf1TQmZJEyMWT7ps/NfuDWhqKK2v9atYykXp7Jf
 qSYddzVnT1o7Q==
From: Danilo Krummrich <dakr@kernel.org>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 2/2] gpu: nova-core: consider `clippy::cast_lossless`
Date: Tue, 24 Jun 2025 15:23:23 +0200
Message-ID: <20250624132337.2242-2-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624132337.2242-1-dakr@kernel.org>
References: <20250624132337.2242-1-dakr@kernel.org>
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

Fix all warnings caused by `clippy::cast_lossless`, which is going to be
enabled by [1].

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/r/20250615-ptr-as-ptr-v12-5-f43b024581e8@gmail.com [1]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/falcon.rs           | 2 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 2 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs     | 4 ++--
 drivers/gpu/nova-core/fb/hal/tu102.rs     | 2 +-
 drivers/gpu/nova-core/firmware/fwsec.rs   | 2 +-
 drivers/gpu/nova-core/regs.rs             | 8 ++++----
 drivers/gpu/nova-core/vbios.rs            | 8 ++++----
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 1affffb109ec..1d21ea129890 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -427,7 +427,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
                 fw.dma_handle_with_offset(load_offsets.src_start as usize)?,
             ),
         };
-        if dma_start % DMA_LEN as bindings::dma_addr_t > 0 {
+        if dma_start % bindings::dma_addr_t::from(DMA_LEN) > 0 {
             dev_err!(
                 self.dev,
                 "DMA transfer start addresses must be a multiple of {}",
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 664327f75cf4..0344cd33e6ea 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -78,7 +78,7 @@ fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) ->
         .set_value(params.pkc_data_offset)
         .write(bar, E::BASE);
     regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default()
-        .set_value(params.engine_id_mask as u32)
+        .set_value(u32::from(params.engine_id_mask))
         .write(bar, E::BASE);
     regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::default()
         .set_ucode_id(params.ucode_id)
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index 4827721c9860..871c42bf033a 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -11,8 +11,8 @@
 use super::tu102::FLUSH_SYSMEM_ADDR_SHIFT;
 
 pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
-    (regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08() as u64) << FLUSH_SYSMEM_ADDR_SHIFT
-        | (regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).adr_63_40() as u64)
+    u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT
+        | u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).adr_63_40())
             << FLUSH_SYSMEM_ADDR_SHIFT_HI
 }
 
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index 6f8ae58e9481..b022c781caf4 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -10,7 +10,7 @@
 pub(super) const FLUSH_SYSMEM_ADDR_SHIFT: u32 = 8;
 
 pub(super) fn read_sysmem_flush_page_gm107(bar: &Bar0) -> u64 {
-    (regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08() as u64) << FLUSH_SYSMEM_ADDR_SHIFT
+    u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT
 }
 
 pub(super) fn write_sysmem_flush_page_gm107(bar: &Bar0, addr: u64) -> Result {
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 047aab76470e..0dff3cfa90af 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -346,7 +346,7 @@ pub(crate) fn new(
         let desc = bios.fwsec_image().header(dev)?;
         let ucode_signed = if desc.signature_count != 0 {
             let sig_base_img = (desc.imem_load_size + desc.pkc_data_offset) as usize;
-            let desc_sig_versions = desc.signature_versions as u32;
+            let desc_sig_versions = u32::from(desc.signature_versions);
             let reg_fuse_version =
                 falcon.signature_reg_fuse_version(bar, desc.engine_id_mask, desc.ucode_id)?;
             dev_dbg!(
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 707f87d6828d..e8b8aabce3f3 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -68,7 +68,7 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
 impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
-        let size = ((self.lower_mag() as u64) << (self.lower_scale() as u64))
+        let size = (u64::from(self.lower_mag()) << u64::from(self.lower_scale()))
             * kernel::sizes::SZ_1M as u64;
 
         if self.ecc_mode_enabled() {
@@ -87,7 +87,7 @@ pub(crate) fn usable_fb_size(self) -> u64 {
 impl NV_PFB_PRI_MMU_WPR2_ADDR_LO {
     /// Returns the lower (inclusive) bound of the WPR2 region.
     pub(crate) fn lower_bound(self) -> u64 {
-        (self.lo_val() as u64) << 12
+        u64::from(self.lo_val()) << 12
     }
 }
 
@@ -100,7 +100,7 @@ impl NV_PFB_PRI_MMU_WPR2_ADDR_HI {
     ///
     /// A value of zero means the WPR2 region is not set.
     pub(crate) fn higher_bound(self) -> u64 {
-        (self.hi_val() as u64) << 12
+        u64::from(self.hi_val()) << 12
     }
 }
 
@@ -158,7 +158,7 @@ impl NV_PDISP_VGA_WORKSPACE_BASE {
     /// Returns the base address of the VGA workspace, or `None` if none exists.
     pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
         if self.status_valid() {
-            Some((self.addr() as u64) << 16)
+            Some(u64::from(self.addr()) << 16)
         } else {
             None
         }
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index feb80c847077..663fc50e8b66 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -494,10 +494,10 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
         if data.len() >= 30 {
             // Read size_of_block at offset 0x1A.
             size_of_block = Some(
-                (data[29] as u32) << 24
-                    | (data[28] as u32) << 16
-                    | (data[27] as u32) << 8
-                    | (data[26] as u32),
+                u32::from(data[29]) << 24
+                    | u32::from(data[28]) << 16
+                    | u32::from(data[27]) << 8
+                    | u32::from(data[26]),
             );
         }
 
-- 
2.49.0

