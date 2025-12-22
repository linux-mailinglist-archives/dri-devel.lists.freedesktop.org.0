Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCE3CD5F5F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 13:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB82F10E166;
	Mon, 22 Dec 2025 12:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WxPgH3Tb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC5610E166;
 Mon, 22 Dec 2025 12:20:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5E8CF6001D;
 Mon, 22 Dec 2025 12:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C72C4CEF1;
 Mon, 22 Dec 2025 12:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766406011;
 bh=xUbDYRMhRGvhEuJm/NydkAH3/SfSiO2L4qbftyB1Grc=;
 h=From:Date:Subject:To:Cc:From;
 b=WxPgH3TbeDo3foUeQiDX3qnI3FSvuoqS+1+kd1cDo+3NE16ffUv3jBWNNRc48qOcv
 ynhfbYuuaT/xtHNUZ2drLfkvsT4dmE1qeUR7mILlRA7Pvcd7loR2HGyfLoGcNGsZG7
 tlonpH0G5or+dDWmWvt+hVUz74KWXmRWoEITbLW3LkhNRnVrStT3xnj24WtQDrtbUx
 3pwKsebO5+uZpLG4x0WNDLOl+uEF8cwuDrJTM2ue8jJdFtbG8dRrZRT9D1lG7na7pv
 ng3Bg+avHb852oZ3IfBjQm1qH4imaLsaoBFjVP58kOB2NqupVFlb0sbzI22hYFktgW
 JJ+9oQBldRWZA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:20:05 +0100
Subject: [PATCH] gpu: nova-core: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-cstr-nova-v1-1-0e2353d5debe@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQpAQBCA4VfRnG3ZEcmryGGNwTgs7SAl725x/
 Orvv0A5CCvUyQWBD1FZfIRNE6DJ+ZGN9NGAGRYWEQ3pFoxfDmfI5q5isn1WVhD7NfAg5/dq2t+
 6dzPT9g7gvh+naKmVbQAAAA==
X-Change-ID: 20251222-cstr-nova-c13a8ec1d068
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766406007; l=3053;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=dUjHOkrrvsSc1u9P7jrlnCVchHjcZqseOJZTYW8zbyk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFOoY1nRi3XD+xbrraMdWOBTctqzUO+id/xxlMbErl10DPk89P1KTUKoGzzK9QYDvmuWu4vLYBL
 b6NB0ILdiOQA=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
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

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/gpu/drm/nova/driver.rs  | 12 +++++-------
 drivers/gpu/nova-core/driver.rs |  5 ++---
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 2246d8e104e0..d24ade17f7a0 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -1,8 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{
-    auxiliary, c_str, device::Core, drm, drm::gem, drm::ioctl, prelude::*, sync::aref::ARef,
-};
+use kernel::{auxiliary, device::Core, drm, drm::gem, drm::ioctl, prelude::*, sync::aref::ARef};
 
 use crate::file::File;
 use crate::gem::NovaObject;
@@ -24,12 +22,12 @@ pub(crate) struct NovaData {
     major: 0,
     minor: 0,
     patchlevel: 0,
-    name: c_str!("nova"),
-    desc: c_str!("Nvidia Graphics"),
+    name: c"nova",
+    desc: c"Nvidia Graphics",
 };
 
-const NOVA_CORE_MODULE_NAME: &CStr = c_str!("NovaCore");
-const AUXILIARY_NAME: &CStr = c_str!("nova-drm");
+const NOVA_CORE_MODULE_NAME: &CStr = c"NovaCore";
+const AUXILIARY_NAME: &CStr = c"nova-drm";
 
 kernel::auxiliary_device_table!(
     AUX_TABLE,
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index b8b0cc0f2d93..5a4cc047bcfc 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -2,7 +2,6 @@
 
 use kernel::{
     auxiliary,
-    c_str,
     device::Core,
     devres::Devres,
     dma::Device,
@@ -82,7 +81,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
             unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
 
             let bar = Arc::pin_init(
-                pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
+                pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0"),
                 GFP_KERNEL,
             )?;
 
@@ -90,7 +89,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
                 gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?),
                 _reg <- auxiliary::Registration::new(
                     pdev.as_ref(),
-                    c_str!("nova-drm"),
+                    c"nova-drm",
                     0, // TODO[XARR]: Once it lands, use XArray; for now we don't use the ID.
                     crate::MODULE_NAME
                 ),

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251222-cstr-nova-c13a8ec1d068

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

