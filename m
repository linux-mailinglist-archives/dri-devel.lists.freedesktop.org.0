Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 682A16695DA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 12:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFEC10E9F0;
	Fri, 13 Jan 2023 11:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3695B10E9F0;
 Fri, 13 Jan 2023 11:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673610560; x=1705146560;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iJ3BteWUUY/wPfUSG0fIzGSR5XJxDaCLpZqayQBBMIE=;
 b=a9El6NQ0aMj7vg9otg/SP762Y6zL3GBEXuKwNglT7Ev+c94YWaC6HwfL
 WG2OxNCf0LCfOLdG8JpoGc8mpNxtLllaF/FfVBkt3JlWV2ZHflq5holfK
 RqKo4ejO7+MEeixzQnJn9oU5+aKCvBFULE+TX84Eu+yxILiI5iGTEbVZ0
 GDcpSMH830LelFjdqNnlKCJWoHs3klzUa8n6C9zC3lVaq60I+O7kxEse+
 6FJCpSCokeTpljtKm3mz1mM9TgBIKIaJOqPM8D+3s7tMvO7zNbdZX2rjA
 tzYQFF3fQKJYSptR2EO096PpB5JrRJkF+0h6oB44SoLUvXtpp3OiJMDJv w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="326031852"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="326031852"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 03:49:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="726675325"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="726675325"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 03:49:17 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/selftests: Unwind hugepages to drop wakeref on error
Date: Fri, 13 Jan 2023 12:49:03 +0100
Message-Id: <20230113114903.7824-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Nirmoy Das <nirmoy.das@intel.com>, chris.p.wilson@linux.intel.com,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org,
 andi.shyti@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@linux.intel.com>

Make sure that upon error after we have acquired the wakeref we do
release it again.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index c281b0ec9e05..295d6f2cc4ff 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1855,7 +1855,7 @@ static int igt_shrink_thp(void *arg)
 			I915_SHRINK_ACTIVE);
 	i915_vma_unpin(vma);
 	if (err)
-		goto out_put;
+		goto out_wf;
 
 	/*
 	 * Now that the pages are *unpinned* shrinking should invoke
@@ -1871,7 +1871,7 @@ static int igt_shrink_thp(void *arg)
 		pr_err("unexpected pages mismatch, should_swap=%s\n",
 		       str_yes_no(should_swap));
 		err = -EINVAL;
-		goto out_put;
+		goto out_wf;
 	}
 
 	if (should_swap == (obj->mm.page_sizes.sg || obj->mm.page_sizes.phys)) {
@@ -1883,7 +1883,7 @@ static int igt_shrink_thp(void *arg)
 
 	err = i915_vma_pin(vma, 0, 0, flags);
 	if (err)
-		goto out_put;
+		goto out_wf;
 
 	while (n--) {
 		err = cpu_check(obj, n, 0xdeadbeaf);
-- 
2.39.0

