Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7E186EC0A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 23:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A336710ED7C;
	Fri,  1 Mar 2024 22:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRnSrpos";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB55310ED6F;
 Fri,  1 Mar 2024 22:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709333353; x=1740869353;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XltqW6vAZ7JzWd8rMGWQu+HNePLzg41nm+jv31gYHVA=;
 b=FRnSrposHqodkBTSFjpEIda1qEd+7fukPDCtVfGrue9dMLXIsEeOms5D
 ZmsUK64EJb+irehCHR6T01vt2YHpBwkO+La8HLXhf7YysZhzgVIgqtjql
 yVfF1gowthwBQCJn8z6TbsloTNXmNU+B5N1GSTPXNzN+Ce67B7MeeE6Lc
 SQXnHqbrohB0Gg20CWDKA4RPNTcd0KRQvQu6fzXSaWhV66ot13juClYGn
 9b7AA0Ct1udL6rzrDXQkxHyFhvUKL0frb1+f21Z09iT70v32AylhvmLel
 cNc1JfDB08sEbOscVTRCGXND8pY2+hwblrtj+aiYy1TWokfmHJ2yqvtUT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3752205"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="3752205"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 14:49:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; d="scan'208";a="45870703"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 14:49:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 4/4] drm/xe: Use get_user / put_user with memory barriers
 for ufence
Date: Fri,  1 Mar 2024 14:49:19 -0800
Message-Id: <20240301224919.271153-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301224919.271153-1-matthew.brost@intel.com>
References: <20240301224919.271153-1-matthew.brost@intel.com>
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

Better aligns with atomic semantics than copy to/from user.

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c            | 6 +++---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index bf348d50a0b6..d6d2c8c19f71 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -116,9 +116,9 @@ static void user_fence_worker(struct work_struct *w)
 			}
 		}
 		if (!ufence->use_page) {
-			if (copy_to_user(ufence->addr, &ufence->value,
-					 sizeof(ufence->value)))
-				drm_warn(&ufence->xe->drm, "copy_to_user failed\n");
+			if (put_user(ufence->value, ufence->addr))
+				drm_warn(&ufence->xe->drm, "put_user failed\n");
+			smp_mb();
 		}
 		kthread_unuse_mm(mm);
 		mmput(mm);
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index f69721339201..af5b9a634c21 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -17,11 +17,13 @@
 
 static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
 {
+	u64 __user *ptr = u64_to_user_ptr(addr);
 	u64 rvalue;
 	int err;
 	bool passed;
 
-	err = copy_from_user(&rvalue, u64_to_user_ptr(addr), sizeof(rvalue));
+	smp_mb();
+	err = get_user(rvalue, ptr);
 	if (err)
 		return -EFAULT;
 
-- 
2.34.1

