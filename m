Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DC7B3E81B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 17:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD72E10E486;
	Mon,  1 Sep 2025 15:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ASpIzDXv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F237A10E481;
 Mon,  1 Sep 2025 15:02:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C3CDB60010;
 Mon,  1 Sep 2025 15:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6629FC4CEF0;
 Mon,  1 Sep 2025 15:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756738936;
 bh=lnc+um8VArbYMljrTCJrSlQx6rW9NJXP+JTcHgg6lmI=;
 h=From:To:Cc:Subject:Date:From;
 b=ASpIzDXviCLx1/5FGjw5eIOO7ADuGSeKnYiKHwpSUldf2FuOYxr6RKp73YTT7ldkc
 VOb6UOUa+pY0LzP/dqoyv/G8iabVr0Ktmy1kk/G7NCA8X5aU2/N88dPVkHDRAX0e8n
 PEmZXiOVdf2zjFxii58l6q4AF/3vgOnql+P9hTUF1ddYi8GRCdFl7erlvFbdd3T8rV
 Kf/ck7bIMPDDhgFRh/McZEiQB2wiz9DIU44COIRkjIxi3XjYZrn5C3bnDayfP4Abbo
 Vy64mkYm8uQYwiMTSs9US6g2VKrLJXuBDdHeVYVjUNd7AtRGce1pjlk5ftWAHw9Oau
 5C2vddgNVP76A==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2] gpu: nova-core: take advantage of pci::Device::unbind()
Date: Mon,  1 Sep 2025 17:01:53 +0200
Message-ID: <20250901150207.63094-1-dakr@kernel.org>
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
Changes in v2:
  - Use Device<Core>.
  - Add doc-comment.
---
 drivers/gpu/nova-core/driver.rs |  4 ++++
 drivers/gpu/nova-core/gpu.rs    | 22 ++++++++++++----------
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 274989ea1fb4..02b3edd7bbdc 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -54,4 +54,8 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
 
         Ok(this)
     }
+
+    fn unbind(pdev: &pci::Device<Core>, this: Pin<&Self>) {
+        this.gpu.unbind(pdev.as_ref());
+    }
 }
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8caecaf7dfb4..80a54e303663 100644
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
@@ -309,4 +300,15 @@ pub(crate) fn new(
             sysmem_flush,
         }))
     }
+
+    /// Called when the corresponding [`Device`](device::Device) is unbound.
+    ///
+    /// Note: This method must only be called from `Driver::unbind`.
+    pub(crate) fn unbind(&self, dev: &device::Device<device::Core>) {
+        kernel::warn_on!(self
+            .bar
+            .access(dev)
+            .inspect(|bar| self.sysmem_flush.unregister(bar))
+            .is_err());
+    }
 }

base-commit: 09f90256e8902793f594517ef440698585eb3595
-- 
2.51.0

