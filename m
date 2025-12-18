Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126CCCCC936
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 16:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB1C10EA36;
	Thu, 18 Dec 2025 15:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lzH6VXSa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441B010EA26;
 Thu, 18 Dec 2025 15:53:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B668660008;
 Thu, 18 Dec 2025 15:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA34FC19421;
 Thu, 18 Dec 2025 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766073179;
 bh=mAqob5mbv6FapcPS/iSYQO3lcLOl40s89j9fmY+JxAo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lzH6VXSaSYuzW+LM5rHFjXy9bUhqsaHVxwYEUqlZwBYk6+ZIauHjc4tYlHr9Yzf3u
 UfxCd230qworoQfHVYyjcU1dxlgT5x8evbKGdbuIpKO0mMFHWzyIpEjHzriS2K3RTx
 6g6DG21lveBY/IrymygKwRMyIcX1svj5Enh3XLqNEdpnQZIIP9KS7FBru+7qEoqVnQ
 9s3SpEvxRofLo27TiLo2pB1bPjwNK/SjSsMWDUMg+vudQmJFT/1cHUB47vH1qIeZXK
 H3/dR48VYxI1bl+QBXRJWaHpp2hKwu7roF/lxc7NxLJ4lXkI9UJ/c1veerQpBtHFaq
 4m6nRKTSNUemA==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com, jhubbard@nvidia.com, apopple@nvidia.com,
 joelagnelf@nvidia.com, aliceryhl@google.com, lossin@kernel.org
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 3/4] gpu: nova-core: gsp: get rid of redundant Result in
 Gsp::new()
Date: Thu, 18 Dec 2025 16:50:50 +0100
Message-ID: <20251218155239.25243-4-dakr@kernel.org>
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

In Gsp::new(), utilize pin_init_scope() to get rid of the Result in the
returned

	Result<impl PinInit<T, Error>>

which is unnecessarily redundant.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/gpu.rs |  2 +-
 drivers/gpu/nova-core/gsp.rs | 78 ++++++++++++++++++------------------
 2 files changed, 41 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 629c9d2dc994..50d76092fbdd 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -281,7 +281,7 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
 
-            gsp <- Gsp::new(pdev)?,
+            gsp <- Gsp::new(pdev),
 
             _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index fb6f74797178..8bc86e1bcac5 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -119,43 +119,45 @@ pub(crate) struct Gsp {
 
 impl Gsp {
     // Creates an in-place initializer for a `Gsp` manager for `pdev`.
-    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
-        let dev = pdev.as_ref();
-        let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
-            dev,
-            GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
-            GFP_KERNEL | __GFP_ZERO,
-        )?;
-
-        // Initialise the logging structures. The OpenRM equivalents are in:
-        // _kgspInitLibosLoggingStructures (allocates memory for buffers)
-        // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
-        let loginit = LogBuffer::new(dev)?;
-        dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
-
-        let logintr = LogBuffer::new(dev)?;
-        dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
-
-        let logrm = LogBuffer::new(dev)?;
-        dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-
-        let cmdq = Cmdq::new(dev)?;
-
-        let rmargs = CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
-            dev,
-            1,
-            GFP_KERNEL | __GFP_ZERO,
-        )?;
-        dma_write!(rmargs[0] = fw::GspArgumentsCached::new(&cmdq))?;
-        dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
-
-        Ok(try_pin_init!(Self {
-            libos,
-            loginit,
-            logintr,
-            logrm,
-            rmargs,
-            cmdq,
-        }))
+    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
+        pin_init::pin_init_scope(move || {
+            let dev = pdev.as_ref();
+            let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
+                dev,
+                GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
+                GFP_KERNEL | __GFP_ZERO,
+            )?;
+
+            // Initialise the logging structures. The OpenRM equivalents are in:
+            // _kgspInitLibosLoggingStructures (allocates memory for buffers)
+            // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
+            let loginit = LogBuffer::new(dev)?;
+            dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
+
+            let logintr = LogBuffer::new(dev)?;
+            dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
+
+            let logrm = LogBuffer::new(dev)?;
+            dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
+
+            let cmdq = Cmdq::new(dev)?;
+
+            let rmargs = CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
+                dev,
+                1,
+                GFP_KERNEL | __GFP_ZERO,
+            )?;
+            dma_write!(rmargs[0] = fw::GspArgumentsCached::new(&cmdq))?;
+            dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
+
+            Ok(try_pin_init!(Self {
+                libos,
+                loginit,
+                logintr,
+                logrm,
+                rmargs,
+                cmdq,
+            }))
+        })
     }
 }
-- 
2.52.0

