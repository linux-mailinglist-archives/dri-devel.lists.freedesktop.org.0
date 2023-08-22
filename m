Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E95784706
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 18:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7279D10E3B3;
	Tue, 22 Aug 2023 16:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8821510E3AF;
 Tue, 22 Aug 2023 16:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692721325; x=1724257325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2oWVQLHysGu8GlasoBP3+HFcF0VUw3Oh59Ie6V+Hqyg=;
 b=YjqZXAeRUeleSwCTdCjjBGricZPtwFQ+ks/0KUP0I1phRkunrtX0wUP2
 5cAqk1WiU86qbqh7Xv7T+lavDjoG1xlSdxl4Bx1ta9PaG0RaFPIBS7gYJ
 INoDTdyLcqMTBK3XPn2Q6Q3HBaNO+E95Era0RjDCKYnWCyaIHcZ0c2Ne6
 OovloLfV6VpTQMNsLOnVKRs/OfM6yhuKVyNVq+gs7ajVp49h+P0Dcxmr4
 8mHm3E4hzK+lUJ1Uox+KN+ZFnypoWyCw2IPGosNZzwSD6nmE/pXtqkXdW
 mjQpG5RiMYuVPl6S1nRy6nO77l/NHGdZ4Lt8fRifSyZeHMJhS+Q/gBLjp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354260396"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="354260396"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 09:22:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826373925"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="826373925"
Received: from kahchuno-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.65])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 09:22:03 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/xe/vm: Perform accounting of userptr pinned pages
Date: Tue, 22 Aug 2023 18:21:35 +0200
Message-ID: <20230822162136.25895-4-thomas.hellstrom@linux.intel.com>
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

Account these pages against RLIMIT_MEMLOCK following how RDMA does this
with CAP_IPC_LOCK bypassing the limit.

v2:
- Change the naming of the accounting functions and WARN if we try
  to account anything but userptr pages. (Matthew Brost)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 52 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 037ac42f74a5..a645cfa131ca 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -34,6 +34,41 @@
 
 #define TEST_VM_ASYNC_OPS_ERROR
 
+/*
+ * Perform userptr PIN accounting against RLIMIT_MEMLOCK for now, similarly
+ * to how RDMA does this.
+ */
+static int
+xe_vma_userptr_mlock_reserve(struct xe_vma *vma, unsigned long num_pages)
+{
+	unsigned long lock_limit, new_pinned;
+	struct mm_struct *mm = vma->userptr.notifier.mm;
+
+	/* TODO: Convert to xe_assert() */
+	XE_WARN_ON(!xe_vma_is_userptr(vma));
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
+static void
+xe_vma_userptr_mlock_release(struct xe_vma *vma, unsigned long num_pages)
+{
+	/* TODO: Convert to xe_assert() */
+	XE_WARN_ON(!xe_vma_is_userptr(vma));
+
+	atomic64_sub(num_pages, &vma->userptr.notifier.mm->pinned_vm);
+}
+
 /**
  * xe_vma_userptr_check_repin() - Advisory check for repin needed
  * @vma: The userptr vma
@@ -90,9 +125,17 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 					    !read_only);
 		pages = vma->userptr.pinned_pages;
 	} else {
+		if (xe_vma_is_pinned(vma)) {
+			ret = xe_vma_userptr_mlock_reserve(vma, num_pages);
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
@@ -188,6 +231,9 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 mm_closed:
 	kvfree(pages);
 	vma->userptr.pinned_pages = NULL;
+out_account:
+	if (xe_vma_is_pinned(vma))
+		xe_vma_userptr_mlock_release(vma, num_pages);
 	return ret;
 }
 
@@ -1010,6 +1056,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 			unpin_user_pages_dirty_lock(vma->userptr.pinned_pages,
 						    vma->userptr.num_pinned,
 						    !read_only);
+			xe_vma_userptr_mlock_release(vma, xe_vma_size(vma) >>
+						     PAGE_SHIFT);
 			kvfree(vma->userptr.pinned_pages);
 		}
 
-- 
2.41.0

