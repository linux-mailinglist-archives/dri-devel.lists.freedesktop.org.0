Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F002C643E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7A96EBA0;
	Fri, 27 Nov 2020 12:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AE36EB9E;
 Fri, 27 Nov 2020 12:07:47 +0000 (UTC)
IronPort-SDR: CLdVgtSuKWXDkJPGVSR9kookmerSopCsgUzB+k4DXIOwQ7xDvkWGSViyAiSEBMZY7/2pO4UMU4
 rKpZWAQ+wJMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883337"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883337"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:07:29 -0800
IronPort-SDR: 2ooAzNBC7zzOKAHaPqBDW8nLlMXpeLrYzOZ637IELdGHWR26TAsVb1PxY27RvQKj9YL+jscPsx
 PE4f4lJxAolw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028489"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:07:28 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 002/162] drm/i915/selftest: assert we get 2M GTT pages
Date: Fri, 27 Nov 2020 12:04:38 +0000
Message-Id: <20201127120718.454037-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the LMEM case if we have suitable alignment and 2M physical pages we
should always get 2M GTT pages within the constraints of the hugepages
selftest. If we don't then something might be wrong in our construction
of the backing pages.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 .../gpu/drm/i915/gem/selftests/huge_pages.c   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index 0bf93947d89d..77a13527a7e6 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -368,6 +368,27 @@ static int igt_check_page_sizes(struct i915_vma *vma)
 		err = -EINVAL;
 	}
 
+
+	/*
+	 * The dma-api is like a box of chocolates when it comes to the
+	 * alignment of dma addresses, however for LMEM we have total control
+	 * and so can guarantee alignment, likewise when we allocate our blocks
+	 * they should appear in descending order, and if we know that we align
+	 * to the largest page size for the GTT address, we should be able to
+	 * assert that if we see 2M physical pages then we should also get 2M
+	 * GTT pages. If we don't then something might be wrong in our
+	 * construction of the backing pages.
+	 */
+	if (i915_gem_object_is_lmem(obj) &&
+	    IS_ALIGNED(vma->node.start, SZ_2M) &&
+	    vma->page_sizes.sg & SZ_2M &&
+	    vma->page_sizes.gtt < SZ_2M) {
+		pr_err("gtt pages mismatch for LMEM, expected 2M GTT pages, sg(%u), gtt(%u)\n",
+		       vma->page_sizes.sg, vma->page_sizes.gtt);
+		err = -EINVAL;
+	}
+
+
 	if (obj->mm.page_sizes.gtt) {
 		pr_err("obj->page_sizes.gtt(%u) should never be set\n",
 		       obj->mm.page_sizes.gtt);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
