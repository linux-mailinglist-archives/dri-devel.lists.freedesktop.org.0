Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC3E3B7D68
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 08:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436B26E93A;
	Wed, 30 Jun 2021 06:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B98B6E92D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 06:28:08 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 929821F4313E;
 Wed, 30 Jun 2021 07:28:06 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 11/16] drm/panfrost: Disable the AS on unhandled page faults
Date: Wed, 30 Jun 2021 08:27:46 +0200
Message-Id: <20210630062751.2832545-12-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210630062751.2832545-1-boris.brezillon@collabora.com>
References: <20210630062751.2832545-1-boris.brezillon@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we don't do that, we have to wait for the job timeout to expire
before the fault jobs gets killed.

v3:
* Make sure the AS is re-enabled when new jobs are submitted to the
  context

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c    | 34 ++++++++++++++++++++--
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index d37bc09809e8..cb5aadf7ae90 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -97,6 +97,7 @@ struct panfrost_device {
 	spinlock_t as_lock;
 	unsigned long as_in_use_mask;
 	unsigned long as_alloc_mask;
+	unsigned long as_faulty_mask;
 	struct list_head as_lru_list;
 
 	struct panfrost_job_slot *js;
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 2a9bf30edc9d..959da770295c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -154,6 +154,7 @@ u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
 	as = mmu->as;
 	if (as >= 0) {
 		int en = atomic_inc_return(&mmu->as_count);
+		u32 mask = BIT(as) | BIT(16 + as);
 
 		/*
 		 * AS can be retained by active jobs or a perfcnt context,
@@ -162,6 +163,18 @@ u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
 		WARN_ON(en >= (NUM_JOB_SLOTS + 1));
 
 		list_move(&mmu->list, &pfdev->as_lru_list);
+
+		if (pfdev->as_faulty_mask & mask) {
+			/* Unhandled pagefault on this AS, the MMU was
+			 * disabled. We need to re-enable the MMU after
+			 * clearing+unmasking the AS interrupts.
+			 */
+			mmu_write(pfdev, MMU_INT_CLEAR, mask);
+			mmu_write(pfdev, MMU_INT_MASK, ~pfdev->as_faulty_mask);
+			pfdev->as_faulty_mask &= ~mask;
+			panfrost_mmu_enable(pfdev, mmu);
+		}
+
 		goto out;
 	}
 
@@ -211,6 +224,7 @@ void panfrost_mmu_reset(struct panfrost_device *pfdev)
 	spin_lock(&pfdev->as_lock);
 
 	pfdev->as_alloc_mask = 0;
+	pfdev->as_faulty_mask = 0;
 
 	list_for_each_entry_safe(mmu, mmu_tmp, &pfdev->as_lru_list, list) {
 		mmu->as = -1;
@@ -661,7 +675,7 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
 		if ((status & mask) == BIT(as) && (exception_type & 0xF8) == 0xC0)
 			ret = panfrost_mmu_map_fault_addr(pfdev, as, addr);
 
-		if (ret)
+		if (ret) {
 			/* terminal fault, print info about the fault */
 			dev_err(pfdev->dev,
 				"Unhandled Page fault in AS%d at VA 0x%016llX\n"
@@ -679,14 +693,28 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
 				access_type, access_type_name(pfdev, fault_status),
 				source_id);
 
+			spin_lock(&pfdev->as_lock);
+			/* Ignore MMU interrupts on this AS until it's been
+			 * re-enabled.
+			 */
+			pfdev->as_faulty_mask |= mask;
+
+			/* Disable the MMU to kill jobs on this AS. */
+			panfrost_mmu_disable(pfdev, as);
+			spin_unlock(&pfdev->as_lock);
+		}
+
 		status &= ~mask;
 
 		/* If we received new MMU interrupts, process them before returning. */
 		if (!status)
-			status = mmu_read(pfdev, MMU_INT_RAWSTAT);
+			status = mmu_read(pfdev, MMU_INT_RAWSTAT) & ~pfdev->as_faulty_mask;
 	}
 
-	mmu_write(pfdev, MMU_INT_MASK, ~0);
+	spin_lock(&pfdev->as_lock);
+	mmu_write(pfdev, MMU_INT_MASK, ~pfdev->as_faulty_mask);
+	spin_unlock(&pfdev->as_lock);
+
 	return IRQ_HANDLED;
 };
 
-- 
2.31.1

