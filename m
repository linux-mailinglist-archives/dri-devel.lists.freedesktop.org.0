Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C0355FF6A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1DF11AE94;
	Wed, 29 Jun 2022 12:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AE011ACF1;
 Wed, 29 Jun 2022 12:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656504920; x=1688040920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w/7Wizdsg2FNApQtkLbaXt+tX5h+Lc6JfdHdCHJYlxk=;
 b=FiRFn1Zx/Ndrf3DcpTaVz+VVUAXc2Hm8fkuisw36S9ejf4GBlTCzpZVB
 XUmwjJCDTgxmpU0HRYBtjy/xYqLZ/zVMbH6/q4X4m4mYIW/OsIwWaijiN
 R6oKByb1Nzl5QTHf41ti4mAPR6x/cs1HVhqRZUDMUYf+Plucb/NoKvgrV
 uqRk51DezCm21sOOEgfjKstWPCCJ9zZOPYZPbXKyai3tPTpF/aby1Imay
 zbHU/Occ2m9C3MMEDC3atCX5gX+PPfAT42WHLPt0C5ZdBSrNI8k5pQGHJ
 R0Ts1GZYuDcCsgnCPIEtyNlfO/fwcIRvbzBRhmTmk24P4L5sVJ/WcAUgd A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="262421496"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="262421496"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 05:15:19 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="595215182"
Received: from nwalsh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.202.136])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 05:15:17 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 13/13] drm/i915: turn on small BAR support
Date: Wed, 29 Jun 2022 13:14:27 +0100
Message-Id: <20220629121427.353800-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629121427.353800-1-matthew.auld@intel.com>
References: <20220629121427.353800-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Jordan Justen <jordan.l.justen@intel.com>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the uAPI in place we should now have enough in place to ensure a
working system on small BAR configurations.

v2: (Nirmoy & Thomas):
  - s/full BAR/Resizable BAR/ which is hopefully more easily
    understood by users.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_region_lmem.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index d09b996a9759..fa7b86f83e7b 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -112,12 +112,6 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 		flat_ccs_base = intel_gt_mcr_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
 		flat_ccs_base = (flat_ccs_base >> XEHP_CCS_BASE_SHIFT) * SZ_64K;
 
-		/* FIXME: Remove this when we have small-bar enabled */
-		if (pci_resource_len(pdev, 2) < lmem_size) {
-			drm_err(&i915->drm, "System requires small-BAR support, which is currently unsupported on this kernel\n");
-			return ERR_PTR(-EINVAL);
-		}
-
 		if (GEM_WARN_ON(lmem_size < flat_ccs_base))
 			return ERR_PTR(-EIO);
 
@@ -170,6 +164,10 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	drm_info(&i915->drm, "Local memory available: %pa\n",
 		 &lmem_size);
 
+	if (io_size < lmem_size)
+		drm_info(&i915->drm, "Using a reduced BAR size of %lluMiB. Consider enabling 'Resizable BAR' or similar, if available in the BIOS.\n",
+			 (u64)io_size >> 20);
+
 	return mem;
 
 err_region_put:
-- 
2.36.1

