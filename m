Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94C0B3CB49
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 15:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516CF10E258;
	Sat, 30 Aug 2025 13:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dHgpK3Dk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9056310E258;
 Sat, 30 Aug 2025 13:33:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3822340756;
 Sat, 30 Aug 2025 13:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E047C4CEEB;
 Sat, 30 Aug 2025 13:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756560787;
 bh=KUIODrG5XQbfWzpU1LZ2DKCpjNZtci4G0uQgtBgcg9s=;
 h=From:To:Cc:Subject:Date:From;
 b=dHgpK3Dk9vWGGZQT7+D0Qs22b9zbsd/0e8CFxzCfuX13v1wUZwvsqjD1C98qsZuy8
 43hjI/ICkx8wKMbQBK5CAx9vg7P9vxDIVkjpB6bnsMzxe9PNpXtvqmkEVk7PZ1K/nx
 ij96aOdk3oAUIkDB0D2MZy96BsXwswDyF0i0NWY2dn1rG/GsUaLIGN9Rm2uri4Gbxj
 0qBs1HUIui6u9ev5pNPrDok0SQ7ji12ofS2UXgoCkyGXOFIFQvqjYjqll+dtQCyLmu
 TPOJ/d585TZmsx6rDQB5abtjQDaAUwkRuQmeAgsyUAHeDy0EgPkpkFgr/LM5bB5EPD
 fkYasutry9Ytg==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] gpu: nova-core: take advantage of pci::Device::unbind()
Date: Sat, 30 Aug 2025 15:32:53 +0200
Message-ID: <20250830133255.62380-1-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
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

Now that we have pci::Device::unbind() we can unregister the sysmem
flush page with a direct access the I/O resource, i.e. without RCU read
side critical section.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/driver.rs |  4 ++++
 drivers/gpu/nova-core/gpu.rs    | 20 ++++++++++----------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 274989ea1fb4..02514e1e2529 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -54,4 +54,8 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
 
         Ok(this)
     }
+
+    fn unbind(pdev: &pci::Device<Core>, this: Pin<&Self>) {
+        this.gpu.unbind(pdev);
+    }
 }
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8caecaf7dfb4..2db9afdc6087 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -163,7 +163,7 @@ fn new(bar: &Bar0) -> Result<Spec> {
 }
 
 /// Structure holding the resources required to operate the GPU.
-#[pin_data(PinnedDrop)]
+#[pin_data]
 pub(crate) struct Gpu {
     spec: Spec,
     /// MMIO mapping of PCI BAR 0
@@ -174,15 +174,6 @@ pub(crate) struct Gpu {
     sysmem_flush: SysmemFlush,
 }
 
-#[pinned_drop]
-impl PinnedDrop for Gpu {
-    fn drop(self: Pin<&mut Self>) {
-        // Unregister the sysmem flush page before we release it.
-        self.bar
-            .try_access_with(|b| self.sysmem_flush.unregister(b));
-    }
-}
-
 impl Gpu {
     /// Helper function to load and run the FWSEC-FRTS firmware and confirm that it has properly
     /// created the WPR2 region.
@@ -309,4 +300,13 @@ pub(crate) fn new(
             sysmem_flush,
         }))
     }
+
+    pub(crate) fn unbind(&self, pdev: &pci::Device<device::Bound>) {
+        // Unregister the sysmem flush page before we release it.
+        kernel::warn_on!(self.bar.access(pdev.as_ref()).map_or(true, |bar| {
+            self.sysmem_flush.unregister(bar);
+
+            false
+        }));
+    }
 }

base-commit: 09f90256e8902793f594517ef440698585eb3595
-- 
2.51.0

