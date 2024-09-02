Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CFE96884F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 15:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F412D10E2E6;
	Mon,  2 Sep 2024 13:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="h/FiAcy4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F8910E2E6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 13:02:58 +0000 (UTC)
Delivered-To: boris.brezillon@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725282168; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IxgM0rh5k+5c0zWm/1wUlrPWmfd01Ti2fghY3yP6waDWq4Uu+2WgJHe/KNOkV+kVN37JFZb8uJiT7Kn0qR59S12UPX4MYsfoa9gs9C740WKHvE3drMO/T5G6i/P9Fw/0kth9D2fURvsGf0885v2Jme4LTcKzSJoinx1Nrops+Fk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725282168;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9+L0GBf3vPT32fi0AGa2zryyQeNV2ow2e2t/sljkbPk=; 
 b=OKA+gqAW1tPsYld9LGM46zvEnSOk5XA7LNB/zHRIlLblyr9HTmycB/BeyNbk3DZIExu/EO8u72bt1j6yeoy3nhkX8/qpL+8ESbKUOl0+wEXlrzSkmzZr5pUSHmw8k2hYXZEdJeCbXTD86EvmEsDR5bTynrWRFrrGfLOoRWDnGdA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725282168; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=9+L0GBf3vPT32fi0AGa2zryyQeNV2ow2e2t/sljkbPk=;
 b=h/FiAcy4Mn2EhJVJSeRC+BX1smhHHV5OundPhflhfnHnCd2hz4IJPPkn/1Qy+SL9
 CTWSP5554x66TWNPJoNOT6fEe1/OTy+PNn7B2OE1bu7w08WEq+gKoG3782Fpw3bOCoU
 KKuBUpPgSs6N3EcgfIrdev65s1MSc5zGJWh/sNqA=
Received: by mx.zohomail.com with SMTPS id 1725282165489611.5287835344354;
 Mon, 2 Sep 2024 06:02:45 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>,
 Grant Likely <grant.likely@linaro.org>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/panthor: flush FW AS caches in slow reset path
Date: Mon,  2 Sep 2024 14:02:35 +0100
Message-ID: <20240902130237.3440720-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In the off-chance that waiting for the firmware to signal its booted status
timed out in the fast reset path, one must flush the cache lines for the
entire FW VM address space before reloading the regions, otherwise stale
values eventually lead to a scheduler job timeout.

Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
Cc: stable@vger.kernel.org
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c  |  8 +++++++-
 drivers/gpu/drm/panthor/panthor_mmu.c | 21 ++++++++++++++++++---
 drivers/gpu/drm/panthor/panthor_mmu.h |  1 +
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 857f3f11258a..ef232c0c2049 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1089,6 +1089,12 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
 		panthor_fw_stop(ptdev);
 		ptdev->fw->fast_reset = false;
 		drm_err(&ptdev->base, "FW fast reset failed, trying a slow reset");
+
+		ret = panthor_vm_flush_all(ptdev->fw->vm);
+		if (ret) {
+			drm_err(&ptdev->base, "FW slow reset failed (couldn't flush FW's AS l2cache)");
+			return ret;
+		}
 	}
 
 	/* Reload all sections, including RO ones. We're not supposed
@@ -1099,7 +1105,7 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
 
 	ret = panthor_fw_start(ptdev);
 	if (ret) {
-		drm_err(&ptdev->base, "FW slow reset failed");
+		drm_err(&ptdev->base, "FW slow reset failed (couldn't start the FW )");
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index d47972806d50..bbc12728437f 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -576,6 +576,12 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	if (as_nr < 0)
 		return 0;
 
+	/*
+	 * If the AS number is greater than zero, then we can be sure
+	 * the device is up and running, so we don't need to explicitly
+	 * power it up
+	 */
+
 	if (op != AS_COMMAND_UNLOCK)
 		lock_region(ptdev, as_nr, iova, size);
 
@@ -874,14 +880,23 @@ static int panthor_vm_flush_range(struct panthor_vm *vm, u64 iova, u64 size)
 	if (!drm_dev_enter(&ptdev->base, &cookie))
 		return 0;
 
-	/* Flush the PTs only if we're already awake */
-	if (pm_runtime_active(ptdev->base.dev))
-		ret = mmu_hw_do_operation(vm, iova, size, AS_COMMAND_FLUSH_PT);
+	ret = mmu_hw_do_operation(vm, iova, size, AS_COMMAND_FLUSH_PT);
 
 	drm_dev_exit(cookie);
 	return ret;
 }
 
+/**
+ * panthor_vm_flush_all() - Flush L2 caches for the entirety of a VM's AS
+ * @vm: VM whose cache to flush
+ *
+ * Return: 0 on success, a negative error code if flush failed.
+ */
+int panthor_vm_flush_all(struct panthor_vm *vm)
+{
+	return panthor_vm_flush_range(vm, vm->base.mm_start, vm->base.mm_range);
+}
+
 static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
 {
 	struct panthor_device *ptdev = vm->ptdev;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index f3c1ed19f973..6788771071e3 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -31,6 +31,7 @@ panthor_vm_get_bo_for_va(struct panthor_vm *vm, u64 va, u64 *bo_offset);
 int panthor_vm_active(struct panthor_vm *vm);
 void panthor_vm_idle(struct panthor_vm *vm);
 int panthor_vm_as(struct panthor_vm *vm);
+int panthor_vm_flush_all(struct panthor_vm *vm);
 
 struct panthor_heap_pool *
 panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
-- 
2.46.0

