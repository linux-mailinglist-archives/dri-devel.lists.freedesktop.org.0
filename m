Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C81CA70D9C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 00:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D18C10E620;
	Tue, 25 Mar 2025 23:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ifYujVim";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78D410E620;
 Tue, 25 Mar 2025 23:23:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7EF0C61141;
 Tue, 25 Mar 2025 23:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463AEC4CEE9;
 Tue, 25 Mar 2025 23:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742944977;
 bh=yMKjqA8+nvwGclcEzRzPOItFlMyNrbXdEhrynmZPv24=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ifYujVimCKe1BZVrKrSJ9a74YPfb1RAiND2hccz9thEj+06K88NkZC1rzXSm1+G5B
 qdLy3AwnwRQFW9hLerTM9Mcd8U396AP3ITHKy9vE8gkAV5SFLb5m8SAQ8vmMQHv4wz
 CYDfkf7hbUdkMHVq+vZGscYaZwmAFncRvQy5d6N3FbeE21lz7dBnUfzVDoZGr5wqtV
 xFM+EdimsRsnxR2rM9uYBh7h2YifVd741b4s+2Hvmu5UtfsMDm12p9fCF+FFUaC/Rg
 W3XFfpsHZvrXVlCZ7+fPJped1z7g0xmVgvB9FMG6arxozszWbEu+dokkXoW4AUwXdW
 ITXPe84E/+vsA==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ajanulgu@redhat.com,
 lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] gpu: nova-core: register auxiliary device for nova-drm
Date: Wed, 26 Mar 2025 00:21:48 +0100
Message-ID: <20250325232222.5326-2-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325232222.5326-1-dakr@kernel.org>
References: <20250325232222.5326-1-dakr@kernel.org>
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

Register an auxiliary device for nova-drm.

For now always use zero for the auxiliary device' ID; we don't use it yet
anyways. However, once it lands, we should switch to XArray.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/Kconfig      | 1 +
 drivers/gpu/nova-core/driver.rs    | 9 ++++++++-
 drivers/gpu/nova-core/nova_core.rs | 2 ++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index ad0c06756516..67f99b6a023a 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -1,5 +1,6 @@
 config NOVA_CORE
 	tristate "Nova Core GPU driver"
+	depends on AUXILIARY_BUS
 	depends on PCI
 	depends on RUST
 	depends on RUST_FW_LOADER_ABSTRACTIONS
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index a08fb6599267..9ed39637d43f 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{bindings, c_str, device::Core, pci, prelude::*};
+use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*};
 
 use crate::gpu::Gpu;
 
@@ -8,6 +8,7 @@
 pub(crate) struct NovaCore {
     #[pin]
     pub(crate) gpu: Gpu,
+    _reg: auxiliary::Registration,
 }
 
 const BAR0_SIZE: usize = 8;
@@ -38,6 +39,12 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         let this = KBox::pin_init(
             try_pin_init!(Self {
                 gpu <- Gpu::new(pdev, bar)?,
+                _reg: auxiliary::Registration::new(
+                    pdev.as_ref(),
+                    c_str!("nova-drm"),
+                    0, // TODO: Once it lands, use XArray, for now we don't use the ID.
+                    crate::MODULE_NAME
+                )?,
             }),
             GFP_KERNEL,
         )?;
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index a91cd924054b..618632f0abcc 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -8,6 +8,8 @@
 mod regs;
 mod util;
 
+pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
+
 kernel::module_pci_driver! {
     type: driver::NovaCore,
     name: "NovaCore",
-- 
2.49.0

