Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82003780E9E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 17:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B009F10E536;
	Fri, 18 Aug 2023 15:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5508910E536;
 Fri, 18 Aug 2023 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692371408; x=1723907408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0GSZIKQay1eKaY6Vrv4xVJOGJZkh1ZLl7nt4sDwTX14=;
 b=gdNEpenFHGp45xnoHs4WD9X7ZRU1oVuOfNrRygIy6zvPwBDxOMfPIfMs
 xZwY/UDX64IrOyJYrw82tJb5fzbo4pmlya4kvwGMGgbpqNE7tFoO+YZE8
 lsTS+tMqwJFkap0R4KZAx+EGJcdyg4dTO1IreVB2AhDpcygmamBkypSiy
 7dzh47JFl3jRVoTeiEFIq6K/4QkyIXv+PchD5v+m81DW2A2qsHzT9W6ON
 p7ZgAXIzmbfLqJabrhUbge32jEuUE9ST/ZNcKZEB/7C6qVIXv/BnQRw0E
 rpm92BkfF00HFx+lQ/6ytQPUgHD2M0VmVEnk3LOdg7Bjq5ZYopE0u5aDx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="363276805"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="363276805"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 08:09:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="1065774199"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="1065774199"
Received: from kjeldbeg-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.202])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 08:09:29 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/4] drm/xe/vm: Perform accounting of userptr pinned pages
Date: Fri, 18 Aug 2023 17:08:44 +0200
Message-ID: <20230818150845.96679-4-thomas.hellstrom@linux.intel.com>
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

Account these pages against RLIMIT_MEMLOCK following how RDMA does this
with CAP_IPC_LOCK bypassing the limit.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 43 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ecbcad696b60..d9c000689002 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -34,6 +34,33 @@
 
 #define TEST_VM_ASYNC_OPS_ERROR
 
+/*
+ * Perform userptr PIN accounting against RLIMIT_MEMLOCK for now, similarly
+ * to how RDMA does this.
+ */
+static int xe_vma_mlock_alloc(struct xe_vma *vma, unsigned long num_pages)
+{
+	unsigned long lock_limit, new_pinned;
+	struct mm_struct *mm = vma->userptr.notifier.mm;
+
+	if (!can_do_mlock())
+		return -EPERM;
+
+	lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
+	new_pinned = atomic64_add_return(num_pages, &mm->pinned_vm);
+	if (new_pinned > lock_limit && !capable(CAP_IPC_LOCK)) {
+		atomic64_sub(num_pages, &mm->pinned_vm);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void xe_vma_mlock_free(struct xe_vma *vma, unsigned long num_pages)
+{
+	atomic64_sub(num_pages, &vma->userptr.notifier.mm->pinned_vm);
+}
+
 /**
  * xe_vma_userptr_check_repin() - Advisory check for repin needed
  * @vma: The userptr vma
@@ -89,9 +116,17 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 					    !read_only);
 		pages = vma->userptr.pinned_pages;
 	} else {
+		if (xe_vma_is_pinned(vma)) {
+			ret = xe_vma_mlock_alloc(vma, num_pages);
+			if (ret)
+				return ret;
+		}
+
 		pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
-		if (!pages)
-			return -ENOMEM;
+		if (!pages) {
+			ret = -ENOMEM;
+			goto out_account;
+		}
 	}
 
 	pinned = ret = 0;
@@ -187,6 +222,9 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 mm_closed:
 	kvfree(pages);
 	vma->userptr.pinned_pages = NULL;
+out_account:
+	if (xe_vma_is_pinned(vma))
+		xe_vma_mlock_free(vma, num_pages);
 	return ret;
 }
 
@@ -1004,6 +1042,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 			unpin_user_pages_dirty_lock(vma->userptr.pinned_pages,
 						    vma->userptr.num_pinned,
 						    !read_only);
+			xe_vma_mlock_free(vma, xe_vma_size(vma) >> PAGE_SHIFT);
 			kvfree(vma->userptr.pinned_pages);
 		}
 
-- 
2.41.0

