Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE04C32D3A
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 20:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E104910E2B4;
	Tue,  4 Nov 2025 19:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AC/4h4dA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20CD10E2B4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 19:38:02 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-429c4c65485so4515724f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 11:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762285081; x=1762889881; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uuJYmeFC0Ns6q+GffQxcvrYZjSVkJQ1qk5T/GyXRo8M=;
 b=AC/4h4dAeZgZcCgquORuVP4EvGuL3qfJYgd60E5qBw6+SZqhPSQyrEa2Z5BZ1VKY0N
 IQuod8uJDnylf2R1tAad/m65IRV86q3QIWuxFNA20GjD7gM9lcIkrCKzXCs5tTa45kMh
 xf3LFqRPhCQ26IlqWbsfzJV0U83eAnu4Cx92t6jwkRrFqSwTCCFFGJNaro4j5uG3iGHx
 gwJm6nYJLTUGhxdYfGqKpcf6H/acPZMMxAIi000VDZDKLU53SZaPQ82psVMNnPPchCu/
 nNls/+PompT/5BNgNtsg42L+NY1OPUjhm9facJjIkfPYr/o0cGpdqG8Uo2W72CWZeJBR
 0EQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762285081; x=1762889881;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uuJYmeFC0Ns6q+GffQxcvrYZjSVkJQ1qk5T/GyXRo8M=;
 b=riLfRo59/Cxi41qeXAAGDNRjSzXe31h1ISWoOBtfAJcQRQFQ7CZaUyDjPlvtH5/SfE
 uHvj/hMi8FDEpI0CvkRNGQVjEb8yMNZ6tH/WRYfwuFbJYFipBT3sQ8mNd8ZOtnwotm4+
 yo6NmevcDcKNP31jAEtCZMlgkToILdnK1trf9CvG3q3z2yeoTRgolSs6CVE7fEqEzbpk
 vd4DSgiRQJbO6A6KMrMDNq/zyjT5KX3oBoW+RK7tD2UdjFeNIkqF1EEOEY9CxRZ5y7X8
 Fg2mMAgHCiumr+e0tTtBR0oqNwuKBLzbpHtL8raiNWJFkJIguxc/t1dtgU8G2nL/SY97
 FhyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt1/P5FmztRomDMVKIm4zslnrJDcBZ+Z4jw5LbbZLjYJ14YbYoikPoULo2n5L2PiLKvYtNcjMs+bs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnQKJYfihbz6f/d+7KrecTfPja1nC/HyrNWqAcCrvv4xNjAIoV
 bGzWMpRufnwQuN+/W+EtSM8oO41cMbe4f5igVwljnuloowxgqNxYj6we
X-Gm-Gg: ASbGncswdbIKDEg1smeDNuvOjFFPSMrKd1/RpOP1rwPNWiF/D1c1MlDHPQaeGEH/Iz4
 KP7QUuImQmtfwMvsLLw7dE6QkbH0UjeMJ/4RgD/+8G8v6/1Kb3L1Lcsq1pCsaETdoZMAl+phn6I
 652wVepIGKiY37DSERJnGH+8D1XNOsajpayj5MVfRfmR4O7VP+znVP6M406QA59sNr0ZQKVx5rJ
 uF7s13MAMy4CwKQpKpfcEKfMF3oJE4eTy5rkxpmZSzcqGpklKgtcg6Dgm2JAQqfVcqL6Rz+vlQL
 g0mbZIy2c1a/0jR7/F02H61qS9qO/WkCKzmnjlLTPZbo6H6okfuEMDL6qJhpO57+K1p5V5+xh9r
 aS1uBzIG+p4Oc8p8o1ANGBeS/1272/YUEDVyzBGz2GbjoYtzqXTIFEbwKfM9hPfm3jfrIeY+bEO
 Udpl8YtEGmrFmsLgDQIAk7h582mOQZ
X-Google-Smtp-Source: AGHT+IEr7t1g0NxAiQFW6/+EQdEerO4M/416bPR5jQIpAdQF9dkOK+V+9PpJ6xeniW5e27RTsxa4bw==
X-Received: by 2002:a05:6000:2387:b0:427:151:3db6 with SMTP id
 ffacd0b85a97d-429e32f48bcmr414020f8f.24.1762285081045; 
 Tue, 04 Nov 2025 11:38:01 -0800 (PST)
Received: from archito ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775ce3ef38sm5549195e9.17.2025.11.04.11.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 11:38:00 -0800 (PST)
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org,
 Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
Subject: [PATCH v3 1/4] nova-core: Simplify `transmute` and `transmute_mut` in
 fwsec.rs
Date: Tue,  4 Nov 2025 20:37:48 +0100
Message-ID: <20251104193756.57726-1-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.2
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

This patch solves one of the existing mentions of COHA, a task
in the Nova task list about improving the `CoherentAllocation` API.
It uses the new `from_bytes` method from the `FromBytes` trait as
well as the `as_slice` and `as_slice_mut` methods from
`CoherentAllocation`.

Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>

---

I confirmed by talking to Alexandre Courbot, that the reading/writing
methods in `CoherentAllocation` can never be safe, so
this patch doesn't actually change `CoherentAllocation`, but rather
tries to solve one of the existing references to [COHA].

V1 -> V2: Split previous patch into two. One per reference to COHA.
          Improved comments. Let me know if they are okay now.
          Use of `{...}` syntax for the `if let`

V2 -> V3: Further splitting.
            Capitalization for existing comments has its own patch
          Fix typo. s/unitialized/uninitialized
          Rebase
---
 drivers/gpu/nova-core/firmware/fwsec.rs | 117 +++++++++++-------------
 1 file changed, 54 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index ce78c1563754..4f268fe09573 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -11,12 +11,12 @@
 //! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
 
 use core::marker::PhantomData;
-use core::mem::{align_of, size_of};
+use core::mem::size_of;
 use core::ops::Deref;
 
 use kernel::device::{self, Device};
 use kernel::prelude::*;
-use kernel::transmute::FromBytes;
+use kernel::transmute::{AsBytes, FromBytes};
 
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
@@ -70,6 +70,8 @@ struct FalconAppifDmemmapperV3 {
 }
 // SAFETY: any byte sequence is valid for this struct.
 unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for FalconAppifDmemmapperV3 {}
 
 #[derive(Debug)]
 #[repr(C, packed)]
@@ -82,6 +84,8 @@ struct ReadVbios {
 }
 // SAFETY: any byte sequence is valid for this struct.
 unsafe impl FromBytes for ReadVbios {}
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for ReadVbios {}
 
 #[derive(Debug)]
 #[repr(C, packed)]
@@ -94,6 +98,8 @@ struct FrtsRegion {
 }
 // SAFETY: any byte sequence is valid for this struct.
 unsafe impl FromBytes for FrtsRegion {}
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for FrtsRegion {}
 
 const NVFW_FRTS_CMD_REGION_TYPE_FB: u32 = 2;
 
@@ -104,6 +110,8 @@ struct FrtsCmd {
 }
 // SAFETY: any byte sequence is valid for this struct.
 unsafe impl FromBytes for FrtsCmd {}
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for FrtsCmd {}
 
 const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS: u32 = 0x15;
 const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB: u32 = 0x19;
@@ -147,26 +155,15 @@ impl FirmwareSignature<FwsecFirmware> for Bcrt30Rsa3kSignature {}
 ///
 /// # Safety
 ///
-/// Callers must ensure that the region of memory returned is not written for as long as the
-/// returned reference is alive.
-///
-/// TODO[TRSM][COHA]: Remove this and `transmute_mut` once `CoherentAllocation::as_slice` is
-/// available and we have a way to transmute objects implementing FromBytes, e.g.:
-/// https://lore.kernel.org/lkml/20250330234039.29814-1-christiansantoslima21@gmail.com/
-unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
-    fw: &'a DmaObject,
-    offset: usize,
-) -> Result<&'b T> {
-    if offset + size_of::<T>() > fw.size() {
-        return Err(EINVAL);
-    }
-    if (fw.start_ptr() as usize + offset) % align_of::<T>() != 0 {
-        return Err(EINVAL);
-    }
-
-    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
-    // large enough the contains an instance of `T`, which implements `FromBytes`.
-    Ok(unsafe { &*(fw.start_ptr().add(offset).cast::<T>()) })
+/// * Callers must ensure that the device does not read/write to/from memory while the returned
+///   reference is live.
+/// * Callers must ensure that this call does not race with a write to the same region while
+///   the returned reference is live.
+unsafe fn transmute<T: Sized + FromBytes>(fw: &DmaObject, offset: usize) -> Result<&T> {
+    // SAFETY: The safety requirements of the function guarantee the device won't read
+    // or write to memory while the reference is alive and that this call won't race
+    // with writes to the same memory region.
+    T::from_bytes(unsafe { fw.as_slice(offset, size_of::<T>())? }).ok_or(EINVAL)
 }
 
 /// Reinterpret the area starting from `offset` in `fw` as a mutable instance of `T` (which must
@@ -174,22 +171,18 @@ unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
 ///
 /// # Safety
 ///
-/// Callers must ensure that the region of memory returned is not read or written for as long as
-/// the returned reference is alive.
-unsafe fn transmute_mut<'a, 'b, T: Sized + FromBytes>(
-    fw: &'a mut DmaObject,
+/// * Callers must ensure that the device does not read/write to/from memory while the returned
+///   slice is live.
+/// * Callers must ensure that this call does not race with a read or write to the same region
+///   while the returned slice is live.
+unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
+    fw: &mut DmaObject,
     offset: usize,
-) -> Result<&'b mut T> {
-    if offset + size_of::<T>() > fw.size() {
-        return Err(EINVAL);
-    }
-    if (fw.start_ptr_mut() as usize + offset) % align_of::<T>() != 0 {
-        return Err(EINVAL);
-    }
-
-    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
-    // large enough the contains an instance of `T`, which implements `FromBytes`.
-    Ok(unsafe { &mut *(fw.start_ptr_mut().add(offset).cast::<T>()) })
+) -> Result<&mut T> {
+    // SAFETY: The safety requirements of the function guarantee the device won't read
+    // or write to memory while the reference is alive and that this call won't race
+    // with writes or reads to the same memory region.
+    T::from_bytes_mut(unsafe { fw.as_slice_mut(offset, size_of::<T>())? }).ok_or(EINVAL)
 }
 
 /// The FWSEC microcode, extracted from the BIOS and to be run on the GSP falcon.
@@ -260,32 +253,35 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
 
         // Find the DMEM mapper section in the firmware.
         for i in 0..usize::from(hdr.entry_count) {
-            let app: &FalconAppifV1 =
             // SAFETY: we have exclusive access to `dma_object`.
-            unsafe {
+            let app: &FalconAppifV1 = unsafe {
                 transmute(
                     &dma_object,
-                    hdr_offset + usize::from(hdr.header_size) + i * usize::from(hdr.entry_size)
+                    hdr_offset + usize::from(hdr.header_size) + i * usize::from(hdr.entry_size),
                 )
             }?;
 
             if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
                 continue;
             }
+            let dmem_base = app.dmem_base;
 
             // SAFETY: we have exclusive access to `dma_object`.
             let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
-                transmute_mut(
-                    &mut dma_object,
-                    (desc.imem_load_size + app.dmem_base) as usize,
-                )
+                transmute_mut(&mut dma_object, (desc.imem_load_size + dmem_base) as usize)
             }?;
 
+            dmem_mapper.init_cmd = match cmd {
+                FwsecCommand::Frts { .. } => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS,
+                FwsecCommand::Sb => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB,
+            };
+            let cmd_in_buffer_offset = dmem_mapper.cmd_in_buffer_offset;
+
             // SAFETY: we have exclusive access to `dma_object`.
             let frts_cmd: &mut FrtsCmd = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset) as usize,
+                    (desc.imem_load_size + cmd_in_buffer_offset) as usize,
                 )
             }?;
 
@@ -296,24 +292,19 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
                 size: 0,
                 flags: 2,
             };
-
-            dmem_mapper.init_cmd = match cmd {
-                FwsecCommand::Frts {
-                    frts_addr,
-                    frts_size,
-                } => {
-                    frts_cmd.frts_region = FrtsRegion {
-                        ver: 1,
-                        hdr: u32::try_from(size_of::<FrtsRegion>())?,
-                        addr: u32::try_from(frts_addr >> 12)?,
-                        size: u32::try_from(frts_size >> 12)?,
-                        ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
-                    };
-
-                    NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS
-                }
-                FwsecCommand::Sb => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB,
-            };
+            if let FwsecCommand::Frts {
+                frts_addr,
+                frts_size,
+            } = cmd
+            {
+                frts_cmd.frts_region = FrtsRegion {
+                    ver: 1,
+                    hdr: u32::try_from(size_of::<FrtsRegion>())?,
+                    addr: u32::try_from(frts_addr >> 12)?,
+                    size: u32::try_from(frts_size >> 12)?,
+                    ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
+                };
+            }
 
             // Return early as we found and patched the DMEMMAPPER region.
             return Ok(Self(dma_object, PhantomData));
-- 
2.51.2

