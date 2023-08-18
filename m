Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF53780E9C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 17:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE0610E539;
	Fri, 18 Aug 2023 15:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DF010E538;
 Fri, 18 Aug 2023 15:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692371386; x=1723907386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QIf7cmvMgsxITcSZw3NKztnF+1mW6wPmvSMIaMZOeKM=;
 b=QjPwQ5VBH0IUmIFZ2PIRxXhxrQN7K3xogWmae1iKAVGrO2vdAo9K0Au2
 UdX8BiUYXgxwr8oi/Yzzd7CPXt5DHILRjfyVRJOLth2Zqxom8ejC90HNP
 Ug/Nxu6+eM3jJFz40V0FNDVlJAewlrJoFpuyzGPu6gw+mitAdgIL8pPfq
 PxSVDT84d9vYAZtCpnOqM4L2rZQqYjZEmo5OwcmfowFfMdGp8ByVJMEB0
 waIf3LcVtzQZ3BybgQlW8fbKjZqEulyFGeyDM9zxxuYwHSnocM/ZPZBGG
 6G8N5wU1/M7m14sKi+bl0bliT64KvLC5Kr+1NynPW9Jlijd7SRZpBGUkU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="363276718"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="363276718"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 08:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="1065774148"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="1065774148"
Received: from kjeldbeg-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.202])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 08:09:16 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/4] drm/xe/vm: Use onion unwind for xe_vma_userptr_pin_pages()
Date: Fri, 18 Aug 2023 17:08:42 +0200
Message-ID: <20230818150845.96679-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818150845.96679-1-thomas.hellstrom@linux.intel.com>
References: <20230818150845.96679-1-thomas.hellstrom@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use onion error unwind since that makes the function easier to read
and extend. No functional change.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2e99f865d7ec..8bf7f62e6548 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -116,19 +116,17 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 		kthread_unuse_mm(vma->userptr.notifier.mm);
 		mmput(vma->userptr.notifier.mm);
 	}
-mm_closed:
 	if (ret)
-		goto out;
+		goto out_release_pages;
 
 	ret = sg_alloc_table_from_pages_segment(&vma->userptr.sgt, pages,
 						pinned, 0,
 						(u64)pinned << PAGE_SHIFT,
 						xe_sg_segment_size(xe->drm.dev),
 						GFP_KERNEL);
-	if (ret) {
-		vma->userptr.sg = NULL;
-		goto out;
-	}
+	if (ret)
+		goto out_release_pages;
+
 	vma->userptr.sg = &vma->userptr.sgt;
 
 	ret = dma_map_sgtable(xe->drm.dev, vma->userptr.sg,
@@ -136,11 +134,8 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 			      DMA_BIDIRECTIONAL,
 			      DMA_ATTR_SKIP_CPU_SYNC |
 			      DMA_ATTR_NO_KERNEL_MAPPING);
-	if (ret) {
-		sg_free_table(vma->userptr.sg);
-		vma->userptr.sg = NULL;
-		goto out;
-	}
+	if (ret)
+		goto out_free_sg;
 
 	for (i = 0; i < pinned; ++i) {
 		if (!read_only) {
@@ -152,17 +147,23 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 		mark_page_accessed(pages[i]);
 	}
 
-out:
 	release_pages(pages, pinned);
 	kvfree(pages);
 
-	if (!(ret < 0)) {
-		vma->userptr.notifier_seq = notifier_seq;
-		if (xe_vma_userptr_check_repin(vma) == -EAGAIN)
-			goto retry;
-	}
+	vma->userptr.notifier_seq = notifier_seq;
+	if (xe_vma_userptr_check_repin(vma) == -EAGAIN)
+		goto retry;
+
+	return 0;
 
-	return ret < 0 ? ret : 0;
+out_free_sg:
+	sg_free_table(vma->userptr.sg);
+	vma->userptr.sg = NULL;
+out_release_pages:
+	release_pages(pages, pinned);
+mm_closed:
+	kvfree(pages);
+	return ret;
 }
 
 static bool preempt_fences_waiting(struct xe_vm *vm)
-- 
2.41.0

