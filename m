Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6E146EF0D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDB310EA4E;
	Thu,  9 Dec 2021 16:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3DC89F47;
 Thu,  9 Dec 2021 13:25:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="262199598"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="262199598"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 05:25:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="463232674"
Received: from achlenov-mobl2.ccr.corp.intel.com (HELO intel.com)
 ([10.252.52.59])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 05:25:32 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 02/11] drm/i915: Introduce to_gt() helper
Date: Thu,  9 Dec 2021 15:25:03 +0200
Message-Id: <20211209132512.47241-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211209132512.47241-1-andi.shyti@linux.intel.com>
References: <20211209132512.47241-1-andi.shyti@linux.intel.com>
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Andi Shyti <andi@etezian.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michał Winiarski <michal.winiarski@intel.com>

To allow further refactoring and abstract away the fact that GT is
stored inside i915 private.
No functional changes.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c | 7 +------
 drivers/gpu/drm/i915/i915_drv.h                | 5 +++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
index acc49c56a9f3..9db3dcbd917f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
@@ -9,11 +9,6 @@
 #include "intel_engine_pm.h"
 #include "intel_gt_buffer_pool.h"
 
-static struct intel_gt *to_gt(struct intel_gt_buffer_pool *pool)
-{
-	return container_of(pool, struct intel_gt, buffer_pool);
-}
-
 static struct list_head *
 bucket_for_size(struct intel_gt_buffer_pool *pool, size_t sz)
 {
@@ -141,7 +136,7 @@ static struct intel_gt_buffer_pool_node *
 node_create(struct intel_gt_buffer_pool *pool, size_t sz,
 	    enum i915_map_type type)
 {
-	struct intel_gt *gt = to_gt(pool);
+	struct intel_gt *gt = container_of(pool, struct intel_gt, buffer_pool);
 	struct intel_gt_buffer_pool_node *node;
 	struct drm_i915_gem_object *obj;
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index ae7dc7862b5d..c6f34ac353ff 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1080,6 +1080,11 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
 	return pci_get_drvdata(pdev);
 }
 
+static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
+{
+	return &i915->gt;
+}
+
 /* Simple iterator over all initialised engines */
 #define for_each_engine(engine__, dev_priv__, id__) \
 	for ((id__) = 0; \
-- 
2.34.1

