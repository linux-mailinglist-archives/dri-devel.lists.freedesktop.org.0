Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6C566964A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 13:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD1D10E9F5;
	Fri, 13 Jan 2023 12:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F3E10E9F2;
 Fri, 13 Jan 2023 12:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673611260; x=1705147260;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qwYLpR4n8sk5JMoA5wDMP1VNX/CMdZQ/eU37IeEfbHo=;
 b=e6CuCExZa+RJAhZYRsYYvOCVD5A5hXAcaKaPEV4+Ucr+oHsL7STMaDh6
 sRMuc0Eorg4/OzC9J0PfgnakY6RgkafSrKLbEky9Sp1K/QkApXWZ/3cf/
 /WZuj83uKhiVYxTosMU6VhFbzS+YNE2jcGCf1ta7dcd8lAoEmO66NIkMe
 xIPWRffzGhzSelywsjp1V52t/ziOYZshDCSnvrWV+nLw6+iUsyMOvDLCd
 SIhbKPheBRVB4mU0NUL1cQSMjmWwDLoROZWf3qcjEfwk0n8nh+urxtIpG
 KkGcEpxN3nzMVaEH0T7MXhYZ3V1zE8l0HUBcsqgUjextWbVkhrtJ6PC/3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="322675898"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="322675898"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 04:01:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="721506758"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="721506758"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 04:00:58 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/selftests: Unwind hugepages to drop wakeref on error
Date: Fri, 13 Jan 2023 13:00:53 +0100
Message-Id: <20230113120053.29618-1-nirmoy.das@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 matthew.auld@intel.com, andi.shyti@linux.intel.com,
 chris.p.wilson@linux.intel.com, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@linux.intel.com>

Make sure that upon error after we have acquired the wakeref we do
release it again.

Fixes: 027c38b4121e ("drm/i915/selftests: Grab the runtime pm in shrink_thp")
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Cc: <stable@vger.kernel.org> # v6.0+
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

