Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE26568DF0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 17:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCCE11B047;
	Wed,  6 Jul 2022 15:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CADB11B030;
 Wed,  6 Jul 2022 15:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657122527; x=1688658527;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QV8x1RQbBNVTKvv7PD4zmV50TuSjnuBMYiT29PvDPOU=;
 b=MhPo5E5eAtaEPmQ6Ca6dzsUSnvbmPNwu9odpLCYW9rW1oWo3mFlUTJMZ
 zG/pgksYCNJJvaM7KD9D7XcqtFd5qeTqKH9EFa0F/OsppcutPE5a7kbrZ
 ESLAFHQar/kEe4lfvmTQUlNhtABZeIHWXOHtZw7sR8P96wlKAzpRCzYvl
 pyv9+6qxRRC0VMA1cvPMz2O4/UL21ryE1SO0n1yxBwVs9N3hjHpVdmQgK
 3N5l3F5bmUAqUsKKGW5BV+NHiPioiAhxJmD/20waHtWPb6CF+ACkhBdhA
 FBvfh0jUVaIP5vH1iwuMKONQ+O5hN7aApm1UIYnbNKsAqWO92Q4Ndgk99 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="264200156"
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="264200156"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 08:48:09 -0700
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="770091035"
Received: from bbarabas-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.226.109])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 08:48:08 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/selftests: Grab the runtime pm in shrink_thp
Date: Wed,  6 Jul 2022 16:47:38 +0100
Message-Id: <20220706154738.235204-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
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
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Since we are not holding a wakeref, shrinking a bound object is not
guaranteed.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6370
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index ef15967be51a..72ce2c9f42fd 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1623,6 +1623,7 @@ static int igt_shrink_thp(void *arg)
 	struct file *file;
 	unsigned int flags = PIN_USER;
 	unsigned int n;
+	intel_wakeref_t wf;
 	bool should_swap;
 	int err;
 
@@ -1659,9 +1660,11 @@ static int igt_shrink_thp(void *arg)
 		goto out_put;
 	}
 
+	wf = intel_runtime_pm_get(&i915->runtime_pm); /* active shrink */
+
 	err = i915_vma_pin(vma, 0, 0, flags);
 	if (err)
-		goto out_put;
+		goto out_wf;
 
 	if (obj->mm.page_sizes.phys < I915_GTT_PAGE_SIZE_2M) {
 		pr_info("failed to allocate THP, finishing test early\n");
@@ -1732,6 +1735,8 @@ static int igt_shrink_thp(void *arg)
 
 out_unpin:
 	i915_vma_unpin(vma);
+out_wf:
+	intel_runtime_pm_put(&i915->runtime_pm, wf);
 out_put:
 	i915_gem_object_put(obj);
 out_vm:
-- 
2.36.1

