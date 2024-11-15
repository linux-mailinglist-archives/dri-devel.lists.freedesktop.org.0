Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 280499CD59D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 03:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9861E10E0FD;
	Fri, 15 Nov 2024 02:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
 by gabe.freedesktop.org (Postfix) with SMTP id 7DA7210E0FD;
 Fri, 15 Nov 2024 02:50:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
 by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id BA7A061A027B0; 
 Fri, 15 Nov 2024 10:50:02 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: balasubramani.vivekanandan@intel.com, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>, matthew.brost@intel.com,
 francois.dugast@intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] drm/xe/hw_engine_group: Fix bad free in
 xe_hw_engine_setup_groups()
Date: Fri, 15 Nov 2024 10:49:42 +0800
Message-Id: <20241115024941.3737042-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
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

Clang static checker(scan-build) warning：
drivers/gpu/drm/xe/xe_hw_engine_group.c: line 134, column 2
Argument to kfree() is a constant address (18446744073709551604), which
is not memory allocated by malloc().

kfree() can only handle NULL pointers instead of negitave error codes.
When hw_engine_group_alloc() failed, there is a bad kfree call for
negitave error codes in xe_hw_engine_setup_groups().

Free 'group' when alloc_workqueue() failed in hw_engine_group_alloc(), and
remove wrong kfree() in xe_hw_engine_setup_groups() to fix this problem.
It's safe to remove these kfree() because drmm_add_action_or_reset()
can free these by calling hw_engine_group_free().

Fixes: d16ef1a18e39 ("drm/xe/exec: Switch hw engine group execution mode upon job submission")
Fixes: f784750c670f ("drm/xe/hw_engine_group: Introduce xe_hw_engine_group")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
v2:
 - remove wrong destroy_workqueue() and kfree() in v1 patch
v1:
 - https://lore.kernel.org/all/20241114063942.3448607-1-suhui@nfschina.com/

 drivers/gpu/drm/xe/xe_hw_engine_group.c | 32 +++++++------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 82750520a90a..3bfa002734ad 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -58,8 +58,10 @@ hw_engine_group_alloc(struct xe_device *xe)
 		return ERR_PTR(-ENOMEM);
 
 	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", 0, 0);
-	if (!group->resume_wq)
+	if (!group->resume_wq) {
+		kfree(group);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	init_rwsem(&group->mode_sem);
 	INIT_WORK(&group->resume_work, hw_engine_group_resume_lr_jobs_func);
@@ -84,25 +86,18 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
 	enum xe_hw_engine_id id;
 	struct xe_hw_engine_group *group_rcs_ccs, *group_bcs, *group_vcs_vecs;
 	struct xe_device *xe = gt_to_xe(gt);
-	int err;
 
 	group_rcs_ccs = hw_engine_group_alloc(xe);
-	if (IS_ERR(group_rcs_ccs)) {
-		err = PTR_ERR(group_rcs_ccs);
-		goto err_group_rcs_ccs;
-	}
+	if (IS_ERR(group_rcs_ccs))
+		return PTR_ERR(group_rcs_ccs);
 
 	group_bcs = hw_engine_group_alloc(xe);
-	if (IS_ERR(group_bcs)) {
-		err = PTR_ERR(group_bcs);
-		goto err_group_bcs;
-	}
+	if (IS_ERR(group_bcs))
+		return PTR_ERR(group_bcs);
 
 	group_vcs_vecs = hw_engine_group_alloc(xe);
-	if (IS_ERR(group_vcs_vecs)) {
-		err = PTR_ERR(group_vcs_vecs);
-		goto err_group_vcs_vecs;
-	}
+	if (IS_ERR(group_vcs_vecs))
+		return PTR_ERR(group_vcs_vecs);
 
 	for_each_hw_engine(hwe, gt, id) {
 		switch (hwe->class) {
@@ -125,15 +120,6 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
 	}
 
 	return 0;
-
-err_group_vcs_vecs:
-	kfree(group_vcs_vecs);
-err_group_bcs:
-	kfree(group_bcs);
-err_group_rcs_ccs:
-	kfree(group_rcs_ccs);
-
-	return err;
 }
 
 /**
-- 
2.30.2

