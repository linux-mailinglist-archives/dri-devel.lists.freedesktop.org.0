Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13D2C9EF4A
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 13:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C76210E789;
	Wed,  3 Dec 2025 12:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="l91svvNR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4F510E12F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 12:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764764281;
 bh=Ddyqk/LqDyM6oygnRyhwcDmnd+VnL04x1nhsAjL16iY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l91svvNRHxiXfVU592rAd6whOTp9F1fu8uh99bm28IeO5eYOqpzP2dkbMBZKZI4JI
 CLfvR0PZL4jVdfpK98nbgiK+5Ci7+58wEIg17zYKeWuYU3kvsE3GuO9eq/XvShbkEB
 oAFr3gSYeQH0L9dI5bZHTt6M9sinJnXtjtGJq+1NN6CMfCSHzn62uaM/A6QUVrmCjw
 fdHecFrFrZEjYyOgdvSPsYYxNP3iboYzFj5FJ0auHohf2CJdFM1XS9VNMqQMMRIuxy
 4qaQmKgx5l6tFngo+rz+LF3Sw43Ix/l5qON3z10fVVusCnNUHsm1qzUvoO+4dBipf8
 yGZTJcTjAVTXA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E343817E1339;
 Wed,  3 Dec 2025 13:18:00 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com
Subject: [PATCH v3 2/3] drm/panthor: Make sure caches are flushed/invalidated
 when an AS is recycled
Date: Wed,  3 Dec 2025 13:17:49 +0100
Message-ID: <20251203121750.404340-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251203121750.404340-1-boris.brezillon@collabora.com>
References: <20251203121750.404340-1-boris.brezillon@collabora.com>
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

When we re-assign a slot to a different VM, we need to make sure the
old VM caches are flushed before doing the switch. Specialize
panthor_mmu_as_disable() so we can skip the slot programmation while
still getting the cache flushing, and call this helper from
panthor_vm_active() when an idle slot is recycled.

v2:
- Collect R-bs

Fixes: 6e2d3b3e8589 ("drm/panthor: Add support for atomic page table updates")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 8ba5259e3d28..3644af1a8e56 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -585,7 +585,8 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
 
-static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
+static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr,
+				  bool recycle_slot)
 {
 	int ret;
 
@@ -595,6 +596,12 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	if (ret)
 		return ret;
 
+	/* If the slot is going to be used immediately, don't bother changing
+	 * the config.
+	 */
+	if (recycle_slot)
+		return 0;
+
 	gpu_write64(ptdev, AS_TRANSTAB(as_nr), 0);
 	gpu_write64(ptdev, AS_MEMATTR(as_nr), 0);
 	gpu_write64(ptdev, AS_TRANSCFG(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
@@ -714,6 +721,11 @@ int panthor_vm_active(struct panthor_vm *vm)
 
 		drm_WARN_ON(&ptdev->base, refcount_read(&lru_vm->as.active_cnt));
 		as = lru_vm->as.id;
+
+		ret = panthor_mmu_as_disable(ptdev, as, true);
+		if (ret)
+			goto out_unlock;
+
 		panthor_vm_release_as_locked(lru_vm);
 	}
 
@@ -853,7 +865,7 @@ static void panthor_vm_declare_unusable(struct panthor_vm *vm)
 	vm->unusable = true;
 	mutex_lock(&ptdev->mmu->as.slots_lock);
 	if (vm->as.id >= 0 && drm_dev_enter(&ptdev->base, &cookie)) {
-		panthor_mmu_as_disable(ptdev, vm->as.id);
+		panthor_mmu_as_disable(ptdev, vm->as.id, false);
 		drm_dev_exit(cookie);
 	}
 	mutex_unlock(&ptdev->mmu->as.slots_lock);
@@ -1780,7 +1792,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 			ptdev->mmu->as.slots[as].vm->unhandled_fault = true;
 
 		/* Disable the MMU to kill jobs on this AS. */
-		panthor_mmu_as_disable(ptdev, as);
+		panthor_mmu_as_disable(ptdev, as, false);
 		mutex_unlock(&ptdev->mmu->as.slots_lock);
 
 		status &= ~mask;
@@ -1809,7 +1821,8 @@ void panthor_mmu_suspend(struct panthor_device *ptdev)
 		struct panthor_vm *vm = ptdev->mmu->as.slots[i].vm;
 
 		if (vm) {
-			drm_WARN_ON(&ptdev->base, panthor_mmu_as_disable(ptdev, i));
+			drm_WARN_ON(&ptdev->base,
+				    panthor_mmu_as_disable(ptdev, i, false));
 			panthor_vm_release_as_locked(vm);
 		}
 	}
@@ -1930,7 +1943,7 @@ static void panthor_vm_free(struct drm_gpuvm *gpuvm)
 		int cookie;
 
 		if (drm_dev_enter(&ptdev->base, &cookie)) {
-			panthor_mmu_as_disable(ptdev, vm->as.id);
+			panthor_mmu_as_disable(ptdev, vm->as.id, false);
 			drm_dev_exit(cookie);
 		}
 
@@ -2790,7 +2803,8 @@ void panthor_mmu_unplug(struct panthor_device *ptdev)
 		struct panthor_vm *vm = ptdev->mmu->as.slots[i].vm;
 
 		if (vm) {
-			drm_WARN_ON(&ptdev->base, panthor_mmu_as_disable(ptdev, i));
+			drm_WARN_ON(&ptdev->base,
+				    panthor_mmu_as_disable(ptdev, i, false));
 			panthor_vm_release_as_locked(vm);
 		}
 	}
-- 
2.51.1

