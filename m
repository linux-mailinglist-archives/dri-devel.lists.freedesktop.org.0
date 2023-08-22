Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3347784703
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 18:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2D210E3AB;
	Tue, 22 Aug 2023 16:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB81910E377;
 Tue, 22 Aug 2023 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692721320; x=1724257320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0jD/51uCMBhvag5p0cWlk8xZ35i+sBa63wjjnRG+2/k=;
 b=XwzxfzfJo+8gB/f/0bqbOMosX92HLGRdbzzvVU/AdxpkUtPuR/27AL9t
 jYamJrjyvkjrUrHRkL4wn8oE+bD37i/+FnuPVV44dsGsOx0n/BmJfdEOd
 l9kVSfDOGJDGtALuOGw1bC9/E93iiQS/xVcy5DdKPcaqY1cFHdHXSjjB8
 cvw/kbKIUK7mZE/kOB6EDy0W00+zHaKoQ4ssnClwB1mxEpdp3yzOxWeFm
 ucbUZT8Dy0IJ3blo+sQ2/DRv5FLXfAaEhqfoHGJVEGOjmIfazHpvAxAg2
 pUydW2WW0ZSLNGuCHkns+jQjSYcWAgOWOPoroO9CgmoTwnLGHoUQhDOgT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354260384"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="354260384"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 09:22:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826373911"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="826373911"
Received: from kahchuno-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.65])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 09:21:58 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/xe/vm: Use onion unwind for
 xe_vma_userptr_pin_pages()
Date: Tue, 22 Aug 2023 18:21:33 +0200
Message-ID: <20230822162136.25895-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822162136.25895-1-thomas.hellstrom@linux.intel.com>
References: <20230822162136.25895-1-thomas.hellstrom@linux.intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

