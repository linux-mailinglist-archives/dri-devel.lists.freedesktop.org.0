Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FE887EB6D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 15:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A0510F81A;
	Mon, 18 Mar 2024 14:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D8E4D10F81A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 14:51:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 074D2DA7;
 Mon, 18 Mar 2024 07:52:11 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.12.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 089643F67D;
 Mon, 18 Mar 2024 07:51:34 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] drm/panthor: Don't use virt_to_pfn()
Date: Mon, 18 Mar 2024 14:51:19 +0000
Message-Id: <20240318145119.368582-1-steven.price@arm.com>
X-Mailer: git-send-email 2.34.1
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

virt_to_pfn() isn't available on x86 (except to xen) so breaks
COMPILE_TEST builds. Avoid its use completely by instead storing the
struct page pointer allocated in panthor_device_init() and using
page_to_pfn() instead.

Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 10 ++++++----
 drivers/gpu/drm/panthor/panthor_device.h |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 69deb8e17778..3c30da03fa48 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -154,6 +154,7 @@ int panthor_device_init(struct panthor_device *ptdev)
 {
 	struct resource *res;
 	struct page *p;
+	u32 *dummy_page_virt;
 	int ret;
 
 	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
@@ -172,9 +173,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (!p)
 		return -ENOMEM;
 
-	ptdev->pm.dummy_latest_flush = page_address(p);
+	ptdev->pm.dummy_latest_flush = p;
+	dummy_page_virt = page_address(p);
 	ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_free_page,
-				       ptdev->pm.dummy_latest_flush);
+				       dummy_page_virt);
 	if (ret)
 		return ret;
 
@@ -184,7 +186,7 @@ int panthor_device_init(struct panthor_device *ptdev)
 	 * happens while the dummy page is mapped. Zero cannot be used because
 	 * that means 'always flush'.
 	 */
-	*ptdev->pm.dummy_latest_flush = 1;
+	*dummy_page_virt = 1;
 
 	INIT_WORK(&ptdev->reset.work, panthor_device_reset_work);
 	ptdev->reset.wq = alloc_ordered_workqueue("panthor-reset-wq", 0);
@@ -353,7 +355,7 @@ static vm_fault_t panthor_mmio_vm_fault(struct vm_fault *vmf)
 		if (active)
 			pfn = __phys_to_pfn(ptdev->phys_addr + CSF_GPU_LATEST_FLUSH_ID);
 		else
-			pfn = virt_to_pfn(ptdev->pm.dummy_latest_flush);
+			pfn = page_to_pfn(ptdev->pm.dummy_latest_flush);
 		break;
 
 	default:
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 51c9d61b6796..c84c27dcc92c 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -160,7 +160,7 @@ struct panthor_device {
 		 * Used to replace the real LATEST_FLUSH page when the GPU
 		 * is suspended.
 		 */
-		u32 *dummy_latest_flush;
+		struct page *dummy_latest_flush;
 	} pm;
 };
 
-- 
2.39.2

