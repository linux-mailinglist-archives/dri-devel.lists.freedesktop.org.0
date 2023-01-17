Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA4966DDA8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 13:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35F510E538;
	Tue, 17 Jan 2023 12:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD18C10E543;
 Tue, 17 Jan 2023 12:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673958762; x=1705494762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MeMXKj5o+Ike3f9M4ooda+PrHav/S+5sUnjX4zwSNj4=;
 b=SO5JHfdvLU3h4k3nSytbZmhjBOhWh4DzYFNhIYwkH2wxDNv/YwbQChqU
 nUpKTuo8sAaLrTW+/lbwQdjwybmZHvpzaZlUdbBRolH5I0+AuCduMYzmx
 5A7UN8D8q7tCFjqRd/3c8lFTpuG3yghel+vWGaIrhp8YUrhI6ZzWRAAWB
 TsC2NCz0wSBN/F9lUsxqMVWLIIxGRzmEPbxWwLmv6wP7qAs7+9qIgIgZi
 iLfWrqhiumDF1Q1ZOg4akLxI3u2zTDCZM2aOdKq1KIBocv398Cy7cosTk
 3PQfv6tnb/3UDpi0hrNwZPZhQz/iYfq3CyDJj1Y2o0ny6OAPW2LfX3Xqu g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="387034033"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="387034033"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 04:32:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="636856858"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="636856858"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 04:32:38 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/selftests: Unwind hugepages to drop wakeref on
 error
Date: Tue, 17 Jan 2023 13:32:34 +0100
Message-Id: <20230117123234.26487-1-nirmoy.das@intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 chris.p.wilson@linux.intel.com, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@linux.intel.com>

Make sure that upon error after we have acquired the wakeref we do
release it again.

v2: add another missing "goto out_wf"(Andi).

Fixes: 027c38b4121e ("drm/i915/selftests: Grab the runtime pm in shrink_thp")
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index c281b0ec9e05..defece0bcb81 100644
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
@@ -1871,19 +1871,19 @@ static int igt_shrink_thp(void *arg)
 		pr_err("unexpected pages mismatch, should_swap=%s\n",
 		       str_yes_no(should_swap));
 		err = -EINVAL;
-		goto out_put;
+		goto out_wf;
 	}
 
 	if (should_swap == (obj->mm.page_sizes.sg || obj->mm.page_sizes.phys)) {
 		pr_err("unexpected residual page-size bits, should_swap=%s\n",
 		       str_yes_no(should_swap));
 		err = -EINVAL;
-		goto out_put;
+		goto out_wf;
 	}
 
 	err = i915_vma_pin(vma, 0, 0, flags);
 	if (err)
-		goto out_put;
+		goto out_wf;
 
 	while (n--) {
 		err = cpu_check(obj, n, 0xdeadbeaf);
-- 
2.39.0

