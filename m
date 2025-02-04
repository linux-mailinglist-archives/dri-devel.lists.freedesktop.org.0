Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E70A278C5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 18:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6653C10E045;
	Tue,  4 Feb 2025 17:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bh+2aICj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE0510E02D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 17:41:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 200F9A429DD;
 Tue,  4 Feb 2025 17:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE99C4CEE2;
 Tue,  4 Feb 2025 17:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738690864;
 bh=Gl/iMy07L7ow3BV29hzuFaThJj2GIkTe4wemZe/l8fI=;
 h=From:To:Cc:Subject:Date:From;
 b=bh+2aICjukwq/z+zkfsMO77amrDwuG1jCoDQFNGpD1CxYkcRNvORCAx4a7z47cY0f
 XImVMvOQnC8HTS6Ip1CBmfETb1UL39GfRZjkXg7uQUqXxxYP2/hd0VCfF0q9USLBnW
 UIf+OlY/tRDUCqpeKzV17L5PsxqTk9LM/Ps0PTDw2LLZ0+DqbbAKH0KaR/9M2Ekn3L
 9eTRIcOsb/NJpEkrgf56Ye9D8rDAgM+3WVa9CKv3M2YAn4m6c8aewGfNiDVc3kABBz
 OpE/00tZm1vbPuHXA7JwaEN5txy0V9dbUN0RP4Z87z33S439vCUNA8t3SQLgmPCCIv
 gB0YBIGOGXMpg==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com, min.ma@amd.com, lizhi.hou@amd.com,
 ogabbay@kernel.org
Cc: Renjith Pananchikkal <Renjith.Pananchikkal@amd.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/amdxdna: Add MODULE_FIRMWARE() declarations
Date: Tue,  4 Feb 2025 11:40:25 -0600
Message-ID: <20250204174031.3425762-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
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

From: Mario Limonciello <mario.limonciello@amd.com>

Initramfs building tools such as dracut will look for a MODULE_FIRMWARE()
declaration to determine which firmware to include in the initramfs
when a driver is included in the initramfs.

As amdxdna doesn't declare any firmware this causes the driver to fail
to load with -ENOENT when in the initramfs.  Add the missing declaration
for possible firmware.

Reported-by: Renjith Pananchikkal <Renjith.Pananchikkal@amd.com>
Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 97d4a032171f1..f5b8497cf5ad6 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -21,6 +21,11 @@
 
 #define AMDXDNA_AUTOSUSPEND_DELAY	5000 /* milliseconds */
 
+MODULE_FIRMWARE("amdnpu/1502_00/npu.sbin");
+MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
+MODULE_FIRMWARE("amdnpu/17f0_11/npu.sbin");
+MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
+
 /*
  * Bind the driver base on (vendor_id, device_id) pair and later use the
  * (device_id, rev_id) pair as a key to select the devices. The devices with
-- 
2.43.0

