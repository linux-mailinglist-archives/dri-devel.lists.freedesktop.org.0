Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96B3D3B83F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 21:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12DF10E50B;
	Mon, 19 Jan 2026 20:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="Vw+7A19G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A141710E50A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 20:26:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768854417; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RMgmcLy4vcWFs307mUgy1s9XLcdLJw8nljPiVJeLZ3naVaSM1Ihyb/W6QsxCVR5hN6x8ic3rqD3JchzlwpTwbKO02SW17FKDIM8aF9q8HyhvmUdOohm6OEeAz/ibrVB4BrFyeQakpvD4y71gRHT/MEuM0pf3ywJ9w82KjTOq8tE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768854417;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PFxwGqkanV2+DGDiyGHfXjxrYR8nQju3fO8iQUC8Wog=; 
 b=k//aTYfVgaRSXCUAUqCgvFCnmxPI1QbXdPuzxf66r4aCQOfj5DoTbhEAepzckEytk+hBmvcx6MjpIT/Zd6WH3KhoN2sLxfmG4+QsS97eMPN9x0ClM7G3T9WA0emPNhDRHsYrOEvob3vbjPuC5gG8CatAIrjAFh+roM6WxohysGs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768854417; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=PFxwGqkanV2+DGDiyGHfXjxrYR8nQju3fO8iQUC8Wog=;
 b=Vw+7A19Goldk4EXOZuKJcsi1AqSIobajHKWghHyxzSTn9gk6T/S0tgpt5345lkph
 i03rpmeO8Xn/nMW07nN7+k2IvgSSiJt0UDMvudU1b6WB7IIwEdasEqjmokh8sXE6TsD
 hyDGJg3beCD009qOuCBxRk8dP4e51oUL4DHNKlYk=
Received: by mx.zohomail.com with SMTPS id 17688544158967.271306356357627;
 Mon, 19 Jan 2026 12:26:55 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, gary@garyguo.net,
 Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2] drm/tyr: use read_poll_timeout
Date: Mon, 19 Jan 2026 12:26:45 -0800
Message-ID: <20260119202645.362457-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
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

The L2 power-on sequence and soft reset in Tyr previously relied on fixed
sleeps followed by a single register check, since polling helpers were not
available in Rust at the time.

Now that read_poll_timeout() is available, poll the relevant registers
until the hardware reports readiness or a timeout is reached.

This avoids unnecessary delays on start-up.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- Changed the commit message prefix to drm/tyr
- Replace if-let-Err blocks with inspect_err()
- Remove redundant register read from issue_soft_reset() error path,
  to avoid nested error handling
- Link to v1: https://lore.kernel.org/rust-for-linux/20260115212355.201628-1-deborah.brouwer@collabora.com/

 drivers/gpu/drm/tyr/driver.rs | 22 ++++++++--------------
 drivers/gpu/drm/tyr/gpu.rs    | 18 +++++++++---------
 2 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index f0da58932702..2a45d0288825 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -8,6 +8,7 @@
 use kernel::devres::Devres;
 use kernel::drm;
 use kernel::drm::ioctl;
+use kernel::io::poll;
 use kernel::new_mutex;
 use kernel::of;
 use kernel::platform;
@@ -67,20 +68,13 @@ unsafe impl Sync for TyrData {}
 fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
     regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
 
-    // TODO: We cannot poll, as there is no support in Rust currently, so we
-    // sleep. Change this when read_poll_timeout() is implemented in Rust.
-    kernel::time::delay::fsleep(time::Delta::from_millis(100));
-
-    if regs::GPU_IRQ_RAWSTAT.read(dev, iomem)? & regs::GPU_IRQ_RAWSTAT_RESET_COMPLETED == 0 {
-        dev_err!(dev, "GPU reset failed with errno\n");
-        dev_err!(
-            dev,
-            "GPU_INT_RAWSTAT is {}\n",
-            regs::GPU_IRQ_RAWSTAT.read(dev, iomem)?
-        );
-
-        return Err(EIO);
-    }
+    poll::read_poll_timeout(
+        || regs::GPU_IRQ_RAWSTAT.read(dev, iomem),
+        |status| *status & regs::GPU_IRQ_RAWSTAT_RESET_COMPLETED != 0,
+        time::Delta::from_millis(1),
+        time::Delta::from_millis(100),
+    )
+    .inspect_err(|_| dev_err!(dev, "GPU reset failed."))?;
 
     Ok(())
 }
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 3072562e36e5..bfbf2a1d80e6 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -6,9 +6,10 @@
 use kernel::device::Bound;
 use kernel::device::Device;
 use kernel::devres::Devres;
+use kernel::io::poll;
 use kernel::platform;
 use kernel::prelude::*;
-use kernel::time;
+use kernel::time::Delta;
 use kernel::transmute::AsBytes;
 use kernel::uapi;
 
@@ -204,14 +205,13 @@ fn from(value: u32) -> Self {
 pub(crate) fn l2_power_on(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
     regs::L2_PWRON_LO.write(dev, iomem, 1)?;
 
-    // TODO: We cannot poll, as there is no support in Rust currently, so we
-    // sleep. Change this when read_poll_timeout() is implemented in Rust.
-    kernel::time::delay::fsleep(time::Delta::from_millis(100));
-
-    if regs::L2_READY_LO.read(dev, iomem)? != 1 {
-        dev_err!(dev, "Failed to power on the GPU\n");
-        return Err(EIO);
-    }
+    poll::read_poll_timeout(
+        || regs::L2_READY_LO.read(dev, iomem),
+        |status| *status == 1,
+        Delta::from_millis(1),
+        Delta::from_millis(100),
+    )
+    .inspect_err(|_| dev_err!(dev, "Failed to power on the GPU."))?;
 
     Ok(())
 }
-- 
2.52.0

