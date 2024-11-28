Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682A79DBD03
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 21:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F1310E286;
	Thu, 28 Nov 2024 20:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGtAJQlS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A5E10E286
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 20:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732826709; x=1764362709;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1LrchDCjEdNm4I8cUzhajgos7MSsh00JuB3wx7lQfPA=;
 b=HGtAJQlSCdU/n0i+zh50X6Yv5cCSNA0KQHuDUcZoMrBy4Oh/yJvNi/IG
 fVxtuHhTcrtOQO0zcV4VTLvDl9fyZ58H6MUTBKatWHeU2dxWZ7wX/uuqn
 dGKMbweBOYWk4cDTxrAZvnvwH4qQFNO0Wi0eNoRBWvggS1if6jey62DJE
 qrt7oTmXPo69labTUbWHRwc0NG+wM9t8bgKTUBTY8kzoOH79LR/MSptlL
 jDr0eljwQxoKRrrM2iAH8UH2iqMS0sI4aQPuM3Ol7Q1dkpa0aONimPcGG
 YVEeD3YjRIBUFsebSuhYO0FmJ9BnB5JbDZvuU+6uwNDbyy0oGt2TFayav g==;
X-CSE-ConnectionGUID: rsDrp3SlSIOPEcC0FrS0eA==
X-CSE-MsgGUID: z2IO/zkyS/21Nmpyqd0wEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32810608"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="32810608"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 12:45:08 -0800
X-CSE-ConnectionGUID: A0a2q+oeSqmE+RzyZbI8Lg==
X-CSE-MsgGUID: KcAqwsdSRXG54JfaQ8xkSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="123275468"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 12:45:08 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com
Subject: [PATCH] drm/xe: Avoid evicting object of the same vm in none fault
 mode
Date: Thu, 28 Nov 2024 15:58:41 -0500
Message-Id: <20241128205841.1820680-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

BO validation during vm_bind could trigger memory eviction when
system runs under memory pressure. Right now we blindly evict
BOs of all VMs. This scheme has a problem when system runs in
none recoverable page fault mode: even though the vm_bind could
be successful by evicting BOs, the later the rebinding of the
evicted BOs would fail. So it is better to report an out-of-
memory failure at vm_bind time than at time of rebinding where
xekmd currently doesn't have a good mechanism to report error
to user space.

This patch implemented a scheme to only evict objects of other
VMs during vm_bind time. Object of the same VM will skip eviction.
If we failed to find enough memory for vm_bind, we report error
to user space at vm_bind time.

This scheme is not needed for recoverable page fault mode under
what we can dynamically fault-in pages on demand.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2492750505d69..c005c96b88167 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2359,13 +2359,15 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 				 bool validate)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
+	bool preempt_mode = xe_vm_in_preempt_fence_mode(vm);
 	int err = 0;
 
 	if (bo) {
 		if (!bo->vm)
 			err = drm_exec_lock_obj(exec, &bo->ttm.base);
 		if (!err && validate)
-			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
+			err = xe_bo_validate(bo, vm, !preempt_mode);
 	}
 
 	return err;
-- 
2.26.3

