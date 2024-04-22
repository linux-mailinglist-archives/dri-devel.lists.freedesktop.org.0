Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856648AD971
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 01:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FD3112D3B;
	Mon, 22 Apr 2024 23:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FbZLotf0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16105112D3B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 23:54:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7E51E611FE;
 Mon, 22 Apr 2024 23:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4371DC113CC;
 Mon, 22 Apr 2024 23:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713830076;
 bh=s/cS+r5Skd0CLL3WqzoLK7BYfysJc2pEY9A2/bw6eTA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FbZLotf0Tj1r1KtOKY1SnjznK7bWkdQ22WQ+JDK1BqYKDSukMuVdcQaGT8N1zDkmo
 bIy3ryR2J8M3SGK0RfnIg5laAPO3MnKI3K/KU5HI2wwwna26iFndMwOj4RqDCXVlVC
 tIWFCvyEbh3rEdF3jB7bv+joRn7Imdg+Ekze7iA9V87iFLd8I0iceiWG+wmGo3K0bz
 mQb5SWhHDEkn1Bw75rTgSj3tILbN6MbnRuTuhq0BvdRddSmfS5f3nXNFaJmlsitDe5
 JQvU2/VGh6C9w1MkReuFjxZhv1psxCeQZnBxH0mVhTToApsPQPwDXzcTmhJ4LECvBo
 qIuZyOG5lYXMw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Sasha Levin <sashal@kernel.org>,
 stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 17/43] accel/ivpu: Remove d3hot_after_power_off WA
Date: Mon, 22 Apr 2024 19:14:03 -0400
Message-ID: <20240422231521.1592991-17-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422231521.1592991-1-sashal@kernel.org>
References: <20240422231521.1592991-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.7
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

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

[ Upstream commit e3caadf1f9dfc9d62b5ffc3bd73ebac0c8f26b3f ]

Always enter D3hot after entering D0i3 an all platforms.
This minimizes power usage.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240402104929.941186-3-jacek.lawrynowicz@linux.intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/ivpu/ivpu_drv.c     | 20 ++++++++++----------
 drivers/accel/ivpu/ivpu_drv.h     |  3 +--
 drivers/accel/ivpu/ivpu_hw_37xx.c |  4 +---
 drivers/accel/ivpu/ivpu_pm.c      |  7 ++-----
 4 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index b35c7aedca03e..bad1ccc81ad73 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #include <linux/firmware.h>
@@ -371,12 +371,15 @@ int ivpu_shutdown(struct ivpu_device *vdev)
 {
 	int ret;
 
-	ivpu_prepare_for_reset(vdev);
+	/* Save PCI state before powering down as it sometimes gets corrupted if NPU hangs */
+	pci_save_state(to_pci_dev(vdev->drm.dev));
 
 	ret = ivpu_hw_power_down(vdev);
 	if (ret)
 		ivpu_warn(vdev, "Failed to power down HW: %d\n", ret);
 
+	pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
+
 	return ret;
 }
 
@@ -543,11 +546,11 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	/* Power up early so the rest of init code can access VPU registers */
 	ret = ivpu_hw_power_up(vdev);
 	if (ret)
-		goto err_power_down;
+		goto err_shutdown;
 
 	ret = ivpu_mmu_global_context_init(vdev);
 	if (ret)
-		goto err_power_down;
+		goto err_shutdown;
 
 	ret = ivpu_mmu_init(vdev);
 	if (ret)
@@ -584,10 +587,8 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	ivpu_mmu_reserved_context_fini(vdev);
 err_mmu_gctx_fini:
 	ivpu_mmu_global_context_fini(vdev);
-err_power_down:
-	ivpu_hw_power_down(vdev);
-	if (IVPU_WA(d3hot_after_power_off))
-		pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
+err_shutdown:
+	ivpu_shutdown(vdev);
 err_xa_destroy:
 	xa_destroy(&vdev->submitted_jobs_xa);
 	xa_destroy(&vdev->context_xa);
@@ -610,9 +611,8 @@ static void ivpu_bo_unbind_all_user_contexts(struct ivpu_device *vdev)
 static void ivpu_dev_fini(struct ivpu_device *vdev)
 {
 	ivpu_pm_disable(vdev);
+	ivpu_prepare_for_reset(vdev);
 	ivpu_shutdown(vdev);
-	if (IVPU_WA(d3hot_after_power_off))
-		pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
 
 	ivpu_jobs_abort_all(vdev);
 	ivpu_job_done_consumer_fini(vdev);
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 069ace4adb2d1..e7a9e849940ea 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #ifndef __IVPU_DRV_H__
@@ -87,7 +87,6 @@
 struct ivpu_wa_table {
 	bool punit_disabled;
 	bool clear_runtime_mem;
-	bool d3hot_after_power_off;
 	bool interrupt_clear_with_0;
 	bool disable_clock_relinquish;
 	bool disable_d0i3_msg;
diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 32bb772e03cf9..5e392b6823764 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #include "ivpu_drv.h"
@@ -75,7 +75,6 @@ static void ivpu_hw_wa_init(struct ivpu_device *vdev)
 {
 	vdev->wa.punit_disabled = false;
 	vdev->wa.clear_runtime_mem = false;
-	vdev->wa.d3hot_after_power_off = true;
 
 	REGB_WR32(VPU_37XX_BUTTRESS_INTERRUPT_STAT, BUTTRESS_ALL_IRQ_MASK);
 	if (REGB_RD32(VPU_37XX_BUTTRESS_INTERRUPT_STAT) == BUTTRESS_ALL_IRQ_MASK) {
@@ -86,7 +85,6 @@ static void ivpu_hw_wa_init(struct ivpu_device *vdev)
 
 	IVPU_PRINT_WA(punit_disabled);
 	IVPU_PRINT_WA(clear_runtime_mem);
-	IVPU_PRINT_WA(d3hot_after_power_off);
 	IVPU_PRINT_WA(interrupt_clear_with_0);
 }
 
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index a15d30d0943af..2d706cb29a5a5 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #include <linux/highmem.h>
@@ -58,15 +58,12 @@ static int ivpu_suspend(struct ivpu_device *vdev)
 {
 	int ret;
 
-	/* Save PCI state before powering down as it sometimes gets corrupted if NPU hangs */
-	pci_save_state(to_pci_dev(vdev->drm.dev));
+	ivpu_prepare_for_reset(vdev);
 
 	ret = ivpu_shutdown(vdev);
 	if (ret)
 		ivpu_err(vdev, "Failed to shutdown VPU: %d\n", ret);
 
-	pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
-
 	return ret;
 }
 
-- 
2.43.0

