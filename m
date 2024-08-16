Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF77955112
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 20:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6697F10E823;
	Fri, 16 Aug 2024 18:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="RphIE0n/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CFA10E823
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 18:53:12 +0000 (UTC)
Delivered-To: boris.brezillon@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723834385; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PvjJLdJGrEwGkNxiG1NN0bediiICmKLJEmiksHZksCtL82OQXZKQDJuYZ7ynwVsAcT8WIdc1POVTKM0doCFK4HOxfGnVyeaEMkGnLKI87yZx+aTwwR4hLvsIXCq5MPvDUJoSivDF15IT/WCSm7idGV6wbDfZCf76/ca8VEsUGIA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723834385;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ztxF76TZgv+brVRtCdzY0Nv6BgqovuZ4B6bXmanbuPU=; 
 b=J6EemvsK5sLdNa6WAmnPmPpW7drPukskC6zUJifF0bglGNR049dRhjMhOPOazJPX7bUocGCU1H85S6VsIRted2wiSWwB9AYRk0NyE8JIzMIdF9GSsbvNjWSR47uvxRDEF09aoV1QSuCRuhzHUmk9+IWZtORWtqHG7eAb+3FHlaY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723834385; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ztxF76TZgv+brVRtCdzY0Nv6BgqovuZ4B6bXmanbuPU=;
 b=RphIE0n/lgyC6M88Ej/FBUfrrvNnKpg1yxCCKN0ywfX/RZ+WQKhzmQxmnL7YHjV+
 3Hs/HoVT+fzRsTUUQppWUH7Ak1jX+PshN6oDNTkLCpkS+jK2VyeKQZ79/yKeee37Jlg
 UTlLABgh+99a+4fFigTcRa/ghK0HTBZfd4N7pi6Q=
Received: by mx.zohomail.com with SMTPS id 1723834383348713.5360808921143;
 Fri, 16 Aug 2024 11:53:03 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: flush FW AS caches in slow reset path
Date: Fri, 16 Aug 2024 19:52:49 +0100
Message-ID: <20240816185250.344080-1-adrian.larumbe@collabora.com>
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

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c  |  8 +++++++-
 drivers/gpu/drm/panthor/panthor_mmu.c | 19 ++++++++++++++++---
 drivers/gpu/drm/panthor/panthor_mmu.h |  1 +
 3 files changed, 24 insertions(+), 4 deletions(-)

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
index d47972806d50..a77ee5ce691d 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -874,14 +874,27 @@ static int panthor_vm_flush_range(struct panthor_vm *vm, u64 iova, u64 size)
 	if (!drm_dev_enter(&ptdev->base, &cookie))
 		return 0;
 
-	/* Flush the PTs only if we're already awake */
-	if (pm_runtime_active(ptdev->base.dev))
-		ret = mmu_hw_do_operation(vm, iova, size, AS_COMMAND_FLUSH_PT);
+	/*
+	 * If we made it this far, that means the device is awake, because
+	 * upon device suspension, all active VMs are given an AS id of -1
+	 */
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

