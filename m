Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBA986EC09
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 23:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B1F10ED78;
	Fri,  1 Mar 2024 22:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aeiatVOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868D510ED6E;
 Fri,  1 Mar 2024 22:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709333352; x=1740869352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GifNcnItbOhdzeX3AKpyvdmQlRjwyF1Lkip9nwSS/9Y=;
 b=aeiatVORuLuz7Uv9kGMZ/IRkvo/1VyxyUbRzJqhMlLWTJnC+rjAJfsnr
 blIYPhWgdNHSD5wLZa4oZPgVwvX5Fr3WQR3ICALfyal6rOIpTyb06KSmk
 ejdMMjMzSvRljcCUEHycVWW2jtqQ0mTmtWGgsVWOIwrnSonOhZh9tV8fW
 xz/9IbVFoa2506gwvyqvVwpMCXX3kp0bCZEqrjqTfpbYj8gzEN/RAoH5V
 DrDvnZPutO6Myu9MGTrf/ed+H5oI5V26KD49stufs0aXIgrtSY1Cadzn2
 HrL6B3AG/MypaE3TaSVKiDTCMEKoIdnUXWHCMx6tlk+QLtQSFg4eWiCl7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3752204"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="3752204"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 14:49:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; d="scan'208";a="45870701"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 14:49:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 3/4] drm/xe: Get page on user fence creation
Date: Fri,  1 Mar 2024 14:49:18 -0800
Message-Id: <20240301224919.271153-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301224919.271153-1-matthew.brost@intel.com>
References: <20240301224919.271153-1-matthew.brost@intel.com>
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

Attempt to get page on user fence creation and kmap_local_page on
signaling. Should reduce latency and can ensure 64 bit atomicity
compared to copy_to_user.

v2:
 - Prefault page and drop ref (Thomas)
 - Use set_page_dirty_lock (Thomas)
 - try_cmpxchg64 loop (Thomas)
v3:
 - Initialize use_page (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 54 +++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index c20e1f9ad267..bf348d50a0b6 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -6,6 +6,7 @@
 #include "xe_sync.h"
 
 #include <linux/dma-fence-array.h>
+#include <linux/highmem.h>
 #include <linux/kthread.h>
 #include <linux/sched/mm.h>
 #include <linux/uaccess.h>
@@ -28,6 +29,7 @@ struct xe_user_fence {
 	u64 __user *addr;
 	u64 value;
 	int signalled;
+	bool use_page;
 };
 
 static void user_fence_destroy(struct kref *kref)
@@ -53,7 +55,9 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 					       u64 value)
 {
 	struct xe_user_fence *ufence;
+	struct page *page;
 	u64 __user *ptr = u64_to_user_ptr(addr);
+	int ret;
 
 	if (!access_ok(ptr, sizeof(ptr)))
 		return ERR_PTR(-EFAULT);
@@ -69,19 +73,55 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 	ufence->mm = current->mm;
 	mmgrab(ufence->mm);
 
+	/* Prefault page */
+	ret = get_user_pages_fast(addr, 1, FOLL_WRITE, &page);
+	if (ret == 1) {
+		ufence->use_page = true;
+		put_page(page);
+	} else {
+		ufence->use_page = false;
+	}
+
 	return ufence;
 }
 
 static void user_fence_worker(struct work_struct *w)
 {
 	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
-
-	if (mmget_not_zero(ufence->mm)) {
-		kthread_use_mm(ufence->mm);
-		if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
-			XE_WARN_ON("Copy to user failed");
-		kthread_unuse_mm(ufence->mm);
-		mmput(ufence->mm);
+	struct mm_struct *mm = ufence->mm;
+
+	if (mmget_not_zero(mm)) {
+		kthread_use_mm(mm);
+		if (ufence->use_page) {
+			struct page *page;
+			int ret;
+
+			ret = get_user_pages_fast((unsigned long)ufence->addr,
+						  1, FOLL_WRITE, &page);
+			if (ret == 1) {
+				u64 *ptr;
+				u64 old = 0;
+				void *va;
+
+				va = kmap_local_page(page);
+				ptr = va + offset_in_page(ufence->addr);
+				while (!try_cmpxchg64(ptr, &old, ufence->value))
+					continue;
+				kunmap_local(va);
+
+				set_page_dirty_lock(page);
+				put_page(page);
+			} else {
+				ufence->use_page = false;
+			}
+		}
+		if (!ufence->use_page) {
+			if (copy_to_user(ufence->addr, &ufence->value,
+					 sizeof(ufence->value)))
+				drm_warn(&ufence->xe->drm, "copy_to_user failed\n");
+		}
+		kthread_unuse_mm(mm);
+		mmput(mm);
 	}
 
 	wake_up_all(&ufence->xe->ufence_wq);
-- 
2.34.1

