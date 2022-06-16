Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E316F54E078
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 14:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF41B11A4CC;
	Thu, 16 Jun 2022 12:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BE011A4CA;
 Thu, 16 Jun 2022 12:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655380926; x=1686916926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PEuYITZyekUpRv06ICS0xq5uHHXXbQ2IDmi40zHEslM=;
 b=CNJElQu4KcThIh51Z6m5nfJesoPwc6Pxacuvhcwh5F9Y2DlMo+z4KYeY
 kcuuKPhWu4sm3y6W2E18u78G/1SxXPMMvtQyUnIBYRs6zmj3EMzEzQfnF
 As1n6Oyrc8xmPX7/QawUF54XZC0VtFRXQwL2XUM71gobLl5aq52eg3U7C
 GhTwaE/ZPahMQ/cytgbPyZvWyIHD0W/edqJkFqyy0rN2u/ysXmYbTpepn
 f3JOMZ2iTTYxjBK5AyIDhyVH0HZj/KOdKpo9WOEtq0p4U8+btrnZfBLC+
 ZKTSOA6fALzKWRmB3Syz1ceEXqqoIkyisRTyySRTc8PkNizW51mzHjosR A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="343189638"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="343189638"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:49 -0700
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="713330950"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:45 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 8/9] drm/i915/xehpsdv: Store lmem region in gt
Date: Thu, 16 Jun 2022 17:31:05 +0530
Message-Id: <20220616120106.24353-9-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220616120106.24353-1-anshuman.gupta@intel.com>
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
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
Cc: tilak.tangudu@intel.com, Andi Shyti <andi.shyti@intel.com>,
 tvrtko.ursulin@intel.com, Anshuman Gupta <anshuman.gupta@intel.com>,
 jon.ewins@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Store a pointer to respective local memory region in intel_gt so it can be
used when memory local to a GT needs to be allocated.

Cc: Andi Shyti <andi.shyti@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c       | 1 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index f33290358c51..7a535f670ae1 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -91,6 +91,7 @@ static int intel_gt_probe_lmem(struct intel_gt *gt)
 	GEM_BUG_ON(!HAS_REGION(i915, id));
 	GEM_BUG_ON(i915->mm.regions[id]);
 	i915->mm.regions[id] = mem;
+	gt->lmem = mem;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index df708802889d..cd7744eaaeaa 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -23,6 +23,7 @@
 #include "intel_gt_buffer_pool_types.h"
 #include "intel_hwconfig.h"
 #include "intel_llc_types.h"
+#include "intel_memory_region.h"
 #include "intel_reset_types.h"
 #include "intel_rc6_types.h"
 #include "intel_rps_types.h"
@@ -202,6 +203,8 @@ struct intel_gt {
 	 */
 	phys_addr_t phys_addr;
 
+	struct intel_memory_region *lmem;
+
 	struct intel_gt_info {
 		unsigned int id;
 
-- 
2.26.2

