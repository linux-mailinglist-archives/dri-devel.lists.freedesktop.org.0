Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6CA53434F
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 20:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329E610ECDC;
	Wed, 25 May 2022 18:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196FE10ECE0;
 Wed, 25 May 2022 18:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653504261; x=1685040261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1nkUKV9WwACOAorroszWc5bsTumPXcR2Tk4CQx9UpIE=;
 b=JuoYz5JBzya4ZTasjVcaYLAGuu0uRcDlXfZadCMZYz3n1UhehQBpaxee
 aXiDqqLsHv9SpMeQA/I5KtB7F3OjyuGLRSSBmrB2IRiuR0r41oVU/pYcz
 LgB56MszqW9C6Izh3fYPXSm6qHDKTjRN95BVqJnZGmjfGc08jWz8iw3bF
 4wUI8s8p5KJPjXiUmYhjWty963odktS4cHdfsCbEPoJs2iND5ZJYWQEh9
 rU+BaVepIJCc1di04oK3Jj4oe0uRMUiINM/iQypuIJxhb3TNwF1oFjt6C
 BiCOHH2s5aeCIxcC96QjOutg2uf51kRJKE0qYoj4UWvEaIaE9JHAiviWI g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="274013513"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="274013513"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 11:44:18 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="578465326"
Received: from daithiby-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.5.16])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 11:44:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/10] drm/i915: turn on small BAR support
Date: Wed, 25 May 2022 19:43:36 +0100
Message-Id: <20220525184337.491763-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220525184337.491763-1-matthew.auld@intel.com>
References: <20220525184337.491763-1-matthew.auld@intel.com>
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
index e9c12e0d6f59..6c6f8cbd7321 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -111,12 +111,6 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 		flat_ccs_base = intel_gt_read_register(gt, XEHPSDV_FLAT_CCS_BASE_ADDR);
 		flat_ccs_base = (flat_ccs_base >> XEHPSDV_CCS_BASE_SHIFT) * SZ_64K;
 
-		/* FIXME: Remove this when we have small-bar enabled */
-		if (pci_resource_len(pdev, 2) < lmem_size) {
-			drm_err(&i915->drm, "System requires small-BAR support, which is currently unsupported on this kernel\n");
-			return ERR_PTR(-EINVAL);
-		}
-
 		if (GEM_WARN_ON(lmem_size < flat_ccs_base))
 			return ERR_PTR(-EIO);
 
@@ -169,6 +163,10 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	drm_info(&i915->drm, "Local memory available: %pa\n",
 		 &lmem_size);
 
+	if (io_size < lmem_size)
+		drm_info(&i915->drm, "Using a reduced BAR size of %lluMiB. Consider enabling the full BAR size if available in the BIOS.\n",
+			 (u64)io_size >> 20);
+
 	return mem;
 
 err_region_put:
-- 
2.34.3

