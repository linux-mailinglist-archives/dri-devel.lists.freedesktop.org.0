Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8904C03703
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 22:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CB310E949;
	Thu, 23 Oct 2025 20:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d8q5nohi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266E210E940
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 20:51:56 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-63c45c11be7so2350493a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 13:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761252714; x=1761857514; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/DPBx+VpLdJYC28+zIXvWQItkrfqNP0uWnOQyMoNV9I=;
 b=d8q5nohi6ycJrtG0g4aziRA3DIo9FOusylUdKVisXBJZXTwrsp/4PaFRrJQtyaF5Zy
 18eCp2kqVJ8qiYhnLhsQXxlnEz1WsHcIGpNyGiuV2w8+GOumbgRjkZ3NP0y3bzXKqukC
 V91/YWhPK5G6dMGYsAUrgm0/0FqsIYqmJduqTvuuL/2MuXr4K6YRj3+1tzQbfvVZMMgm
 RhjXFUeGyVxOFrDD6YYGPiT+BNInMRymoRBeEP8oSy8yeqstjMOREgsf7Q+NxKlQaevZ
 CZbaMHbOQL0KFmSf8ZeQdoVMcblN2MIrxvPdNFW9TZv7vO0gCP1A0eopG7f8y/lIswq2
 aDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761252714; x=1761857514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/DPBx+VpLdJYC28+zIXvWQItkrfqNP0uWnOQyMoNV9I=;
 b=pef5hHWQGfx6y570xC3s377S4jcTjxrPQhwYvo2tS4OPgUfh7knZM5tTLqUiOQdvVy
 zwMJzSt2P955zfb5YJcLrKlgV1JfU8XHYYjUBL3Yf2ns6+vKYpLvIu4lo0x1yJ5d3K+V
 8nY1DsXNKz33I/2W8m3APML9mkTqjWcO5ZvQPpgpY1kr81mynUzSkW707e3R6E//QGrO
 yRL7S5lX+CgGAWjlYQtr2kkfBnOMOffsADhz3yA0pAFQRLqzLB37BXYcPJU87mANRB9r
 CaDBbrSE08n9Omc7Ce4aVsHUAzJZxKurJL3NZsX/HtGL58gF3NrzPG42AF6+RhoHzA/G
 duig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu/aUhXcghhlj/x56e8ETasCmtIR/Kd7gMQwYHi2/dA5FoOoNxPrhddBroqBqcm5205twbJz5mxX0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCVZmso5ZwGZu1S0MQpSQvCX2ue6S6Fur7WlBTNrJO8r6MhvRw
 0aQo2WzJT47ZGXeCZeHQ41paIybpBBvnSXQogt++5/a5SsR1Vjwao0XC
X-Gm-Gg: ASbGncu8N0bcJogPAqtAfWEFpKfA4NMovWr5h8uS6CoHYbmqpTZMfGpzAFlsBFX4GCV
 0Rq30TyzwZWu457tDjDmVXdNwdDk8oy+HpJErGpMjzQEkz1ErHRk7y/mSRpeZLIwyZdrv4Ni/g5
 oE0R/RfVFzc+oxRS0579IAr0TFT+BS4Zct0P16lefJ2h/dp1p3Zr0SnJSx7BtfYJ/xj1Rr1oiCm
 VQkS5p9M0in8l1GZvO84P+/PneTfwUbx4h5mNSaJ49rLONkYG/ngr6BSoh96NTy4sZsoYKyBOwr
 iB0x57v2S2PriB8fVcnl1OpdbN3dmzy42klvzM9g5jUQcF1xWYSwLjvVQx661F4lExdgeNpb992
 T/pLpR0GimK0hqxqZqwasLvlt9zWiKSfPRQ61OgIaeKWsVpyORq65VKtgFLGHfzNcV+kQcA5y7R
 FYVCEGjIEGPfRKCLCxNg==
X-Google-Smtp-Source: AGHT+IElvfU33Lmr81xAhhsBvHVkVfrWPuYa9W4pML5y67Llk+0+RGk0cOgxbDzkB4XKg1UV2rHjTQ==
X-Received: by 2002:a05:6402:51d1:b0:634:b4cb:c892 with SMTP id
 4fb4d7f45d1cf-63e600995c8mr72861a12.32.1761252714148; 
 Thu, 23 Oct 2025 13:51:54 -0700 (PDT)
Received: from archito ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3ebb3299sm2564120a12.2.2025.10.23.13.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 13:51:53 -0700 (PDT)
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
Subject: [PATCH v2 1/3] nova-core: Simplify `transmute` and `transmute_mut` in
 fwsec.rs
Date: Thu, 23 Oct 2025 22:51:35 +0200
Message-ID: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.1
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

 drivers/gpu/nova-core/firmware/fwsec.rs | 129 +++++++++++-------------
 1 file changed, 60 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 8edbb5c0572c..507ef3868565 100644
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
@@ -35,7 +35,7 @@ struct FalconAppifHdrV1 {
     entry_size: u8,
     entry_count: u8,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FalconAppifHdrV1 {}
 
 #[repr(C, packed)]
@@ -44,7 +44,7 @@ struct FalconAppifV1 {
     id: u32,
     dmem_base: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FalconAppifV1 {}
 
 #[derive(Debug)]
@@ -68,8 +68,10 @@ struct FalconAppifDmemmapperV3 {
     ucode_cmd_mask1: u32,
     multi_tgt_tbl: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
+// SAFETY: This struct doesn't contain unitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for FalconAppifDmemmapperV3 {}
 
 #[derive(Debug)]
 #[repr(C, packed)]
@@ -80,8 +82,10 @@ struct ReadVbios {
     size: u32,
     flags: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for ReadVbios {}
+// SAFETY: This struct doesn't contain unitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for ReadVbios {}
 
 #[derive(Debug)]
 #[repr(C, packed)]
@@ -92,8 +96,10 @@ struct FrtsRegion {
     size: u32,
     ftype: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FrtsRegion {}
+// SAFETY: This struct doesn't contain unitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for FrtsRegion {}
 
 const NVFW_FRTS_CMD_REGION_TYPE_FB: u32 = 2;
 
@@ -102,8 +108,10 @@ struct FrtsCmd {
     read_vbios: ReadVbios,
     frts_region: FrtsRegion,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FrtsCmd {}
+// SAFETY: This struct doesn't contain unitialized bytes and doesn't have interior mutability.
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
         for i in 0..hdr.entry_count as usize {
-            let app: &FalconAppifV1 =
             // SAFETY: we have exclusive access to `dma_object`.
-            unsafe {
+            let app: &FalconAppifV1 = unsafe {
                 transmute(
                     &dma_object,
-                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize
+                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize,
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
-                        hdr: size_of::<FrtsRegion>() as u32,
-                        addr: (frts_addr >> 12) as u32,
-                        size: (frts_size >> 12) as u32,
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
+                    hdr: size_of::<FrtsRegion>() as u32,
+                    addr: (frts_addr >> 12) as u32,
+                    size: (frts_size >> 12) as u32,
+                    ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
+                };
+            }
 
             // Return early as we found and patched the DMEMMAPPER region.
             return Ok(Self(dma_object, PhantomData));
-- 
2.51.1

