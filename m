Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199BBCCC92A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 16:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D18710EA24;
	Thu, 18 Dec 2025 15:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JeH0CZuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5EE10EA1B;
 Thu, 18 Dec 2025 15:52:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A07FF44082;
 Thu, 18 Dec 2025 15:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B709C116B1;
 Thu, 18 Dec 2025 15:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766073173;
 bh=GFVUOVKa2M6EOtqWngqafppHGGm/d16c6jpiQqgpjDA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JeH0CZuGQjhERkwiquP4qrS9JnZLgv3b4mkgKdmOohRXvHYzucfzFZtNR9NRnJxxM
 qD+vvbR9KqbT/tEOfg85yZkxEFkdkDoNyXMquaFmnCABkTj4l/wOfQyFKKC+DlpHFJ
 whZGQhZG514KqvaiNOyOYn5WRvyeoVNusG5cSFPUGbfoCCeXkXzPmTPUnukbL7c59N
 R/9Um15qo3+uJBOFW440IJwoWIzeytNus1mi0lZQ97OxIzv2mbuAIYL1+zcEKYskvC
 geVaY6XabTefuKSILW58qoffLy2RBqmko7zecyZvanUtWlJxlmEDo1xA9GFoMI19aF
 f4BF5OBne1epA==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com, jhubbard@nvidia.com, apopple@nvidia.com,
 joelagnelf@nvidia.com, aliceryhl@google.com, lossin@kernel.org
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/4] gpu: nova-core: fw: get rid of redundant Result in
 GspFirmware::new()
Date: Thu, 18 Dec 2025 16:50:48 +0100
Message-ID: <20251218155239.25243-2-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218155239.25243-1-dakr@kernel.org>
References: <20251218155239.25243-1-dakr@kernel.org>
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

In GspFirmware::new(), utilize pin_init_scope() to get rid of the Result
in the returned

	Result<impl PinInit<T, Error>>

which is unnecessarily redundant.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 132 +++++++++++++-------------
 drivers/gpu/nova-core/gsp/boot.rs     |   5 +-
 2 files changed, 68 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 0549805282ab..e034268be3c5 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -153,82 +153,84 @@ pub(crate) struct GspFirmware {
 impl GspFirmware {
     /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
     /// tables expected by the GSP bootloader to load it.
-    pub(crate) fn new<'a, 'b>(
+    pub(crate) fn new<'a>(
         dev: &'a device::Device<device::Bound>,
         chipset: Chipset,
-        ver: &'b str,
-    ) -> Result<impl PinInit<Self, Error> + 'a> {
-        let fw = super::request_firmware(dev, chipset, "gsp", ver)?;
+        ver: &'a str,
+    ) -> impl PinInit<Self, Error> + 'a {
+        pin_init::pin_init_scope(move || {
+            let fw = super::request_firmware(dev, chipset, "gsp", ver)?;
 
-        let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
+            let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
 
-        let sigs_section = match chipset.arch() {
-            Architecture::Ampere => ".fwsignature_ga10x",
-            Architecture::Ada => ".fwsignature_ad10x",
-            _ => return Err(ENOTSUPP),
-        };
-        let signatures = elf::elf64_section(fw.data(), sigs_section)
-            .ok_or(EINVAL)
-            .and_then(|data| DmaObject::from_data(dev, data))?;
+            let sigs_section = match chipset.arch() {
+                Architecture::Ampere => ".fwsignature_ga10x",
+                Architecture::Ada => ".fwsignature_ad10x",
+                _ => return Err(ENOTSUPP),
+            };
+            let signatures = elf::elf64_section(fw.data(), sigs_section)
+                .ok_or(EINVAL)
+                .and_then(|data| DmaObject::from_data(dev, data))?;
 
-        let size = fw_section.len();
+            let size = fw_section.len();
 
-        // Move the firmware into a vmalloc'd vector and map it into the device address
-        // space.
-        let fw_vvec = VVec::with_capacity(fw_section.len(), GFP_KERNEL)
-            .and_then(|mut v| {
-                v.extend_from_slice(fw_section, GFP_KERNEL)?;
-                Ok(v)
-            })
-            .map_err(|_| ENOMEM)?;
+            // Move the firmware into a vmalloc'd vector and map it into the device address
+            // space.
+            let fw_vvec = VVec::with_capacity(fw_section.len(), GFP_KERNEL)
+                .and_then(|mut v| {
+                    v.extend_from_slice(fw_section, GFP_KERNEL)?;
+                    Ok(v)
+                })
+                .map_err(|_| ENOMEM)?;
 
-        let bl = super::request_firmware(dev, chipset, "bootloader", ver)?;
-        let bootloader = RiscvFirmware::new(dev, &bl)?;
+            let bl = super::request_firmware(dev, chipset, "bootloader", ver)?;
+            let bootloader = RiscvFirmware::new(dev, &bl)?;
 
-        Ok(try_pin_init!(Self {
-            fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
-            level2 <- {
-                // Allocate the level 2 page table, map the firmware onto it, and map it into the
-                // device address space.
-                VVec::<u8>::with_capacity(
-                    fw.iter().count() * core::mem::size_of::<u64>(),
-                    GFP_KERNEL,
-                )
-                .map_err(|_| ENOMEM)
-                .and_then(|level2| map_into_lvl(&fw, level2))
-                .map(|level2| SGTable::new(dev, level2, DataDirection::ToDevice, GFP_KERNEL))?
-            },
-            level1 <- {
-                // Allocate the level 1 page table, map the level 2 page table onto it, and map it
-                // into the device address space.
-                VVec::<u8>::with_capacity(
-                    level2.iter().count() * core::mem::size_of::<u64>(),
-                    GFP_KERNEL,
-                )
-                .map_err(|_| ENOMEM)
-                .and_then(|level1| map_into_lvl(&level2, level1))
-                .map(|level1| SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KERNEL))?
-            },
-            level0: {
-                // Allocate the level 0 page table as a device-visible DMA object, and map the
-                // level 1 page table onto it.
+            Ok(try_pin_init!(Self {
+                fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
+                level2 <- {
+                    // Allocate the level 2 page table, map the firmware onto it, and map it into
+                    // the device address space.
+                    VVec::<u8>::with_capacity(
+                        fw.iter().count() * core::mem::size_of::<u64>(),
+                        GFP_KERNEL,
+                    )
+                    .map_err(|_| ENOMEM)
+                    .and_then(|level2| map_into_lvl(&fw, level2))
+                    .map(|level2| SGTable::new(dev, level2, DataDirection::ToDevice, GFP_KERNEL))?
+                },
+                level1 <- {
+                    // Allocate the level 1 page table, map the level 2 page table onto it, and map
+                    // it into the device address space.
+                    VVec::<u8>::with_capacity(
+                        level2.iter().count() * core::mem::size_of::<u64>(),
+                        GFP_KERNEL,
+                    )
+                    .map_err(|_| ENOMEM)
+                    .and_then(|level1| map_into_lvl(&level2, level1))
+                    .map(|level1| SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KERNEL))?
+                },
+                level0: {
+                    // Allocate the level 0 page table as a device-visible DMA object, and map the
+                    // level 1 page table onto it.
 
-                // Level 0 page table data.
-                let mut level0_data = kvec![0u8; GSP_PAGE_SIZE]?;
+                    // Level 0 page table data.
+                    let mut level0_data = kvec![0u8; GSP_PAGE_SIZE]?;
 
-                // Fill level 1 page entry.
-                let level1_entry = level1.iter().next().ok_or(EINVAL)?;
-                let level1_entry_addr = level1_entry.dma_address();
-                let dst = &mut level0_data[..size_of_val(&level1_entry_addr)];
-                dst.copy_from_slice(&level1_entry_addr.to_le_bytes());
+                    // Fill level 1 page entry.
+                    let level1_entry = level1.iter().next().ok_or(EINVAL)?;
+                    let level1_entry_addr = level1_entry.dma_address();
+                    let dst = &mut level0_data[..size_of_val(&level1_entry_addr)];
+                    dst.copy_from_slice(&level1_entry_addr.to_le_bytes());
 
-                // Turn the level0 page table into a [`DmaObject`].
-                DmaObject::from_data(dev, &level0_data)?
-            },
-            size,
-            signatures,
-            bootloader,
-        }))
+                    // Turn the level0 page table into a [`DmaObject`].
+                    DmaObject::from_data(dev, &level0_data)?
+                },
+                size,
+                signatures,
+                bootloader,
+            }))
+        })
     }
 
     /// Returns the DMA handle of the radix3 level 0 page table.
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 54937606b5b0..a53d80620468 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -139,10 +139,7 @@ pub(crate) fn boot(
 
         let bios = Vbios::new(dev, bar)?;
 
-        let gsp_fw = KBox::pin_init(
-            GspFirmware::new(dev, chipset, FIRMWARE_VERSION)?,
-            GFP_KERNEL,
-        )?;
+        let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
-- 
2.52.0

