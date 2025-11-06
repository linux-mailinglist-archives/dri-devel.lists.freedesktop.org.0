Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82813C3DD0A
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D30410E9FE;
	Thu,  6 Nov 2025 23:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="cfPsFuj1";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Wjc1uQ3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD3F10E9FE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 23:24:30 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d2dZ53GBMz9tPr;
 Fri,  7 Nov 2025 00:24:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762471469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2RVNypdI0ZL+nFsFit0WdhuxHLthDwL94DW+f0yYzT8=;
 b=cfPsFuj1qz/2bL3Bbvnn3Vux6lixTi1sKSptwHwcJXq+hYCWGQ7JqSBGg3D2tsgM1IRSUn
 HQLFHn/7kglaMpceZoGTRkLidDjMJMKCVGE7nGZNs2w8fUZAJRFb2NXrYPjdkbLTwgdbRu
 6FfmT8kb/SeWYn19t+9qrmSeR9P0DJT5q9M1bUGBZIN0A2wJpMltxl5BA1dHclz4DraYuD
 HR7VK1WIwjFjbHYy7mvWk1m4X6xgip7pVLIV7m8KLJERvqQ6fNgshjBOgbf88txkRtV0KO
 /IPFMvA+wm0/n4UASjqfmEFrwzlh/kRCrlsB1w8IIB4IPbw8KFGWlN4+kQuZzg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762471467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2RVNypdI0ZL+nFsFit0WdhuxHLthDwL94DW+f0yYzT8=;
 b=Wjc1uQ3xUu0qKKzL/d6MdEJLgXMT1Ve2EU2g7MGQLZ04fYzSepHhxr3kjgQrTssYJDJZIk
 L58sE/2xP1j1cKTmPWbYowz0AsLwZfugroBiwAcbgpRQeKGOATOX1seySZMdYd89v46gMJ
 Ic23tezdWYnMZjmhim8Im4fc316pKnejYnZS6rtHt/YquOKEacVn/3Rp+kSrxnY1mwebmB
 w6Kd2xQCRn5WNvgP88Z9dH2PkSGC3NlE7A1YFv8eSPiSgH++bdIDvKjhZ7jeSmFPuDWVbJ
 LJivme8pCX0OaSdAFFka7Klfguf526vpNg1PD7FadS3/BzPviJEtHWaIio3RHg==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/imagination: Fix build on 32bit systems
Date: Fri,  7 Nov 2025 00:24:07 +0100
Message-ID: <20251106232413.465995-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 05b42a57da46a4b2821
X-MBO-RS-META: 4x5ig8zttjwc3y8dmymrjcb889rurnmx
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

Fix support for build on 32bit systems. Include linux/io-64-nonatomic-hi-lo.h
to provide non-atomic readq()/writeq()/ioread64()/iowrite64() accessors, and
use __ffs64() instead of plain ffs() on 64bit number SZ_1T.

This allows this driver to bind on Renesas R-Car H2 which contains
Rogue G6400 BVNC 1.39.4.1 .

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/imagination/Kconfig      | 2 +-
 drivers/gpu/drm/imagination/pvr_device.h | 1 +
 drivers/gpu/drm/imagination/pvr_mmu.h    | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 0482bfcefdde..6d177f0568cd 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -3,7 +3,7 @@
 
 config DRM_POWERVR
 	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
-	depends on (ARM64 || RISCV && 64BIT)
+	depends on ARM || ARM64 || RISCV
 	depends on DRM
 	depends on MMU
 	depends on PM
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index ab8f56ae15df..efdd355005c0 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -20,6 +20,7 @@
 #include <linux/compiler_types.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/math.h>
diff --git a/drivers/gpu/drm/imagination/pvr_mmu.h b/drivers/gpu/drm/imagination/pvr_mmu.h
index a8ecd460168d..6431e4314735 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.h
+++ b/drivers/gpu/drm/imagination/pvr_mmu.h
@@ -85,7 +85,7 @@ struct sg_table;
  *    notes on that constant apply here.
  */
 #define PVR_PAGE_TABLE_ADDR_SPACE_SIZE SZ_1T
-#define PVR_PAGE_TABLE_ADDR_BITS __ffs(PVR_PAGE_TABLE_ADDR_SPACE_SIZE)
+#define PVR_PAGE_TABLE_ADDR_BITS __ffs64(PVR_PAGE_TABLE_ADDR_SPACE_SIZE)
 #define PVR_PAGE_TABLE_ADDR_MASK (PVR_PAGE_TABLE_ADDR_SPACE_SIZE - 1)
 
 void pvr_mmu_flush_request_all(struct pvr_device *pvr_dev);
-- 
2.51.0

