Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCF2CCC930
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 16:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F5510EA1D;
	Thu, 18 Dec 2025 15:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BkBB5tBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A9010EA33;
 Thu, 18 Dec 2025 15:52:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C453560010;
 Thu, 18 Dec 2025 15:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01138C116C6;
 Thu, 18 Dec 2025 15:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766073176;
 bh=gP/NY4VcXW0E9tzTPCUNhKx98dDbfmaXHBU2kHHZSmM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BkBB5tBAZy+q0QB7G58o/DIVVEqWtHlvApA7ZlCNKFSoUEZB/enREzDJvK5oEdPLF
 lX0E0ZJ1rH39QIlitGkG/zbItC7yOx+f99rI65VVCU/4xTI9iKvIrTO/G0RoF55YR0
 MH2kdsUoJDIBNFrMUJDsUtbju/g+7WgBYU0fw9YpthJWXEEC9V/BVw4M5ZFkuEjNam
 MuGgVTKGVbUavh/sp3ZINz0Cu7sogP4V77TLNiCVd8linj5dXmiCAUf0dSx/wF9u2Q
 c+R41M8hG0VVSYev2iUNxkhxWu2ZdUXbqnG8jkwzTJ1qQjXcqSthMJGIclmNqtrccf
 1PGd5OXHDc6iQ==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com, jhubbard@nvidia.com, apopple@nvidia.com,
 joelagnelf@nvidia.com, aliceryhl@google.com, lossin@kernel.org
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/4] gpu: nova-core: fw: move appropriate code into pin
 initializer
Date: Thu, 18 Dec 2025 16:50:49 +0100
Message-ID: <20251218155239.25243-3-dakr@kernel.org>
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

Relocate the code that technically fits in the pin initializer into the
initializer itself.

While, thanks to pin_init_scope(), it is also possible to keep it as is,
moving appropriate code into the initializer has the advantage that it
structures the dependencies of fields naturally.

For instance, intermediate data that is only needed for a single field
goes into the initializer block of this field, making it obvious that it
is not needed by anything else.

On the other hand, intermediate data that is needed for multiple fields
to initialize remains above the initializer, naturally indicating that
it is needed my multiple fields.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 34 ++++++++++++++-------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index e034268be3c5..da97814cf859 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -159,18 +159,9 @@ pub(crate) fn new<'a>(
         ver: &'a str,
     ) -> impl PinInit<Self, Error> + 'a {
         pin_init::pin_init_scope(move || {
-            let fw = super::request_firmware(dev, chipset, "gsp", ver)?;
+            let firmware = super::request_firmware(dev, chipset, "gsp", ver)?;
 
-            let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
-
-            let sigs_section = match chipset.arch() {
-                Architecture::Ampere => ".fwsignature_ga10x",
-                Architecture::Ada => ".fwsignature_ad10x",
-                _ => return Err(ENOTSUPP),
-            };
-            let signatures = elf::elf64_section(fw.data(), sigs_section)
-                .ok_or(EINVAL)
-                .and_then(|data| DmaObject::from_data(dev, data))?;
+            let fw_section = elf::elf64_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
 
             let size = fw_section.len();
 
@@ -183,9 +174,6 @@ pub(crate) fn new<'a>(
                 })
                 .map_err(|_| ENOMEM)?;
 
-            let bl = super::request_firmware(dev, chipset, "bootloader", ver)?;
-            let bootloader = RiscvFirmware::new(dev, &bl)?;
-
             Ok(try_pin_init!(Self {
                 fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
                 level2 <- {
@@ -227,8 +215,22 @@ pub(crate) fn new<'a>(
                     DmaObject::from_data(dev, &level0_data)?
                 },
                 size,
-                signatures,
-                bootloader,
+                signatures: {
+                    let sigs_section = match chipset.arch() {
+                        Architecture::Ampere => ".fwsignature_ga10x",
+                        Architecture::Ada => ".fwsignature_ad10x",
+                        _ => return Err(ENOTSUPP),
+                    };
+
+                    elf::elf64_section(firmware.data(), sigs_section)
+                        .ok_or(EINVAL)
+                        .and_then(|data| DmaObject::from_data(dev, data))?
+                },
+                bootloader: {
+                    let bl = super::request_firmware(dev, chipset, "bootloader", ver)?;
+
+                    RiscvFirmware::new(dev, &bl)?
+                },
             }))
         })
     }
-- 
2.52.0

