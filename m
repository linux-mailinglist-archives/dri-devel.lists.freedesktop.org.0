Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E16DD28B48
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 22:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E908B10E0F5;
	Thu, 15 Jan 2026 21:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="VMs1QUwe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E9F10E7CF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:24:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768512251; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SRUekTuoFWRkThkxBRHxYgFliPmUoiudx0TUuB8uNpwSmyxgZrPfh4JcKOStfleosqNys7T8PTQmoEjyEiHGJpOnYmcn6rD3zfWkPJD4Eqj/p1O+CBN+oSZRWPMPp44MNFJ39BV5+wu96bNIQYS5nkxygaMuP2Bs5grHNqe6Pro=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768512251;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=apVx10litEU5NRZ976fAK7erWPUCl1kRu+PsI7BVNAQ=; 
 b=QpHc8oeJLxJcPaWy+PIkrv5EaJ+OII+iM6SGQJXSRcoP2i0YsAyP4G9xvF0C9erNOTrd8tN2SzQ4Gqzbwuf4Do6Flqt2+7Ukf0n3ly0b0tHJxfn+62TlZYhBird6fKKJd0MGFFqNw9oq8y/h+CtXi8HVhEHUDN/Kvr75yxS81T0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768512251; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=apVx10litEU5NRZ976fAK7erWPUCl1kRu+PsI7BVNAQ=;
 b=VMs1QUwelnT6ctQNoN4KkoVakrJBlFbrCWr71wRttyqhyD5x6fkO4HxfCLyUYGSd
 UVpPSbthAE0YglrocKzgojlqD5sfcZvB1IWwor5SCsidm0kZmS/togPHlNPYXRmmbtW
 3xdoe6GbYE6lr77vyUoXlKh++CnQ/Ox+Te8wPboc=
Received: by mx.zohomail.com with SMTPS id 1768512249736575.2065195390869;
 Thu, 15 Jan 2026 13:24:09 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com,
 Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] rust: drm: tyr: use read_poll_timeout
Date: Thu, 15 Jan 2026 13:23:55 -0800
Message-ID: <20260115212355.201628-1-deborah.brouwer@collabora.com>
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
 drivers/gpu/drm/tyr/driver.rs | 18 +++++++++---------
 drivers/gpu/drm/tyr/gpu.rs    | 16 +++++++++-------
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index f0da58932702..60d01e3f101b 100644
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
@@ -67,19 +68,18 @@ unsafe impl Sync for TyrData {}
 fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
     regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
 
-    // TODO: We cannot poll, as there is no support in Rust currently, so we
-    // sleep. Change this when read_poll_timeout() is implemented in Rust.
-    kernel::time::delay::fsleep(time::Delta::from_millis(100));
-
-    if regs::GPU_IRQ_RAWSTAT.read(dev, iomem)? & regs::GPU_IRQ_RAWSTAT_RESET_COMPLETED == 0 {
-        dev_err!(dev, "GPU reset failed with errno\n");
+    if let Err(e) = poll::read_poll_timeout(
+        || regs::GPU_IRQ_RAWSTAT.read(dev, iomem),
+        |status| *status & regs::GPU_IRQ_RAWSTAT_RESET_COMPLETED != 0,
+        time::Delta::from_millis(1),
+        time::Delta::from_millis(100),
+    ) {
         dev_err!(
             dev,
-            "GPU_INT_RAWSTAT is {}\n",
+            "GPU reset failed, GPU_IRQ_RAWSTAT is {}\n",
             regs::GPU_IRQ_RAWSTAT.read(dev, iomem)?
         );
-
-        return Err(EIO);
+        return Err(e);
     }
 
     Ok(())
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 6c582910dd5d..2ec56f763cc6 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -4,9 +4,10 @@
 use kernel::device::Bound;
 use kernel::device::Device;
 use kernel::devres::Devres;
+use kernel::io::poll;
 use kernel::platform;
 use kernel::prelude::*;
-use kernel::time;
+use kernel::time::Delta;
 use kernel::transmute::AsBytes;
 
 use crate::driver::IoMem;
@@ -206,13 +207,14 @@ fn from(value: u32) -> Self {
 pub(crate) fn l2_power_on(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
     regs::L2_PWRON_LO.write(dev, iomem, 1)?;
 
-    // TODO: We cannot poll, as there is no support in Rust currently, so we
-    // sleep. Change this when read_poll_timeout() is implemented in Rust.
-    kernel::time::delay::fsleep(time::Delta::from_millis(100));
-
-    if regs::L2_READY_LO.read(dev, iomem)? != 1 {
+    if let Err(e) = poll::read_poll_timeout(
+        || regs::L2_READY_LO.read(dev, iomem),
+        |status| *status == 1,
+        Delta::from_millis(1),
+        Delta::from_millis(100),
+    ) {
         dev_err!(dev, "Failed to power on the GPU\n");
-        return Err(EIO);
+        return Err(e);
     }
 
     Ok(())
-- 
2.52.0

