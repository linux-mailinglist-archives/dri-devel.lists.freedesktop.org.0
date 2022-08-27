Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 320325A39CB
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 21:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28CE10ED30;
	Sat, 27 Aug 2022 19:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3598910ED31;
 Sat, 27 Aug 2022 19:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661629533; x=1693165533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vc4x2DdBiL7x1R+vGJX/p9tEHwv85Nk81El/oWV4R0E=;
 b=O8SYyfEapzFdyBqmAuJsqDk4BQJKgskx431FBNEA4lKy2xiJQiEX+9P9
 endlbXpYRNgK+xU6fic3QC1LvavRPQzp2WCfLO8k7W2Xk4Ihg6eT/XDYM
 pa4J+rxIReALE27ymNZRotWH/eQCRYgOSJqmHhzQGwBqevHkJ7wYYrK00
 rEtKt685OThSHvJG4qXI+83WOC5I9AhYaJ0PHKvexR6eBOVuEptXbHuTh
 /uK3RZ/oPKPVupldkpjMSEGs5q6yc964Beb3AkqK345SjaqcEh0hEdkg6
 QnA9gqJ6hNFqWleveYoD6jTJ0NA/9gpWIIdCMmo8dhvPJBoOLCxgVCxeu Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10452"; a="320800552"
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="320800552"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 12:45:32 -0700
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="587696725"
Received: from hluxenbu-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.44.75])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 12:45:28 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 03/17] drm/i915/gem: expose
 i915_gem_object_max_page_size() in i915_gem_object.h
Date: Sat, 27 Aug 2022 21:43:49 +0200
Message-Id: <20220827194403.6495-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220827194403.6495-1-andi.shyti@linux.intel.com>
References: <20220827194403.6495-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Ramalingam C <ramalingampc2008@gmail.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

To reuse i915_gem_object_max_page_size() in upcoming
implementation, expose it in i915_gem_object.h

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 16 +++++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 ++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 33673fe7ee0ac..b0aebcc52f83c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -15,8 +15,17 @@
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
 
-static u32 object_max_page_size(struct intel_memory_region **placements,
-				unsigned int n_placements)
+/**
+ * i915_gem_object_max_page_size() - max of min_page_size of the regions
+ * @placements:  list of regions
+ * @n_placements: number of the placements
+ *
+ * Calculates the max of the min_page_size of a list of placements passed in.
+ *
+ * Return: max of the min_page_size
+ */
+u32 i915_gem_object_max_page_size(struct intel_memory_region **placements,
+				  unsigned int n_placements)
 {
 	u32 max_page_size = 0;
 	int i;
@@ -99,7 +108,8 @@ __i915_gem_object_create_user_ext(struct drm_i915_private *i915, u64 size,
 
 	i915_gem_flush_free_objects(i915);
 
-	size = round_up(size, object_max_page_size(placements, n_placements));
+	size = round_up(size, i915_gem_object_max_page_size(placements,
+							    n_placements));
 	if (size == 0)
 		return ERR_PTR(-EINVAL);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 6f0a3ce355670..650de22248435 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -47,6 +47,8 @@ static inline bool i915_gem_object_size_2big(u64 size)
 }
 
 void i915_gem_init__objects(struct drm_i915_private *i915);
+u32 i915_gem_object_max_page_size(struct intel_memory_region **placements,
+				  unsigned int n_placements);
 
 void i915_objects_module_exit(void);
 int i915_objects_module_init(void);
-- 
2.34.1

