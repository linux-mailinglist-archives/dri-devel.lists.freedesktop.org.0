Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9921849CE15
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82A310E971;
	Wed, 26 Jan 2022 15:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809F710E944;
 Wed, 26 Jan 2022 15:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643210550; x=1674746550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DCBSYzFbTBiM8IPLqIlXiU77MAAwv243tlMlcxh67QY=;
 b=eRRZV4+HQWpu8+Ttj2odd4Omm0UXcWNtfnxT2Pqxao+CSfaI7ADE3VeP
 iHjcPcMPfYjGTGHsfbbY/EbQC88CuhHRnTGeiafXMA98Z33ng9wSiJnj8
 SGYgn8WLOxE9HynC6jX9t9t+Ax037zxmWqzkTTywyWA2pEEDtlfXHmq3H
 sLNxFFhtK+30UtHCmuyhbpTIC1mzMV1iXG8JBXSaAgsud6oHZeOwtKaxv
 oHsNY4phrQs++UkftNQpejBNaSugdHoXOpwPtaZZcWgjH3g1uBfrImcUG
 1oGOLQF/w4spQTz9RlhRLSV35SCrCRhZNVypNlCvUbtSIrQ/3m0Hi3jS+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309885299"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="309885299"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674386331"
Received: from jamesstx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.247.182])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:29 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 20/20] HAX: DG1 small BAR
Date: Wed, 26 Jan 2022 15:21:55 +0000
Message-Id: <20220126152155.3070602-21-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126152155.3070602-1-matthew.auld@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just for CI.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c  | 5 ++---
 drivers/gpu/drm/i915/gt/intel_region_lmem.c | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 98d63cb21e94..6e6a3f6685ab 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -437,9 +437,8 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 		if (!(ext_data.placement_mask & BIT(INTEL_REGION_SMEM)))
 			return -EINVAL;
 	} else {
-		if (!IS_DG1(i915) && (ext_data.n_placements > 1 ||
-				      ext_data.placements[0]->type !=
-				      INTEL_MEMORY_SYSTEM))
+		if (ext_data.n_placements > 1 ||
+		    ext_data.placements[0]->type != INTEL_MEMORY_SYSTEM)
 			ext_data.flags |= I915_BO_ALLOC_TOPDOWN;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index b788fc2b3df8..a99516d2b706 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -211,7 +211,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	lmem_size = intel_uncore_read64(uncore, GEN12_GSMBASE);
 
 	io_start = pci_resource_start(pdev, 2);
-	io_size = min(pci_resource_len(pdev, 2), lmem_size);
+	io_size = SZ_256M;
 	if (!io_size)
 		return ERR_PTR(-ENODEV);
 
-- 
2.34.1

