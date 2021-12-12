Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6EC471B1F
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 16:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A9910F53E;
	Sun, 12 Dec 2021 15:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16E910F539;
 Sun, 12 Dec 2021 15:11:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10195"; a="238425218"
X-IronPort-AV: E=Sophos;i="5.88,200,1635231600"; d="scan'208";a="238425218"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 07:11:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,200,1635231600"; d="scan'208";a="504599037"
Received: from nipunpan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.53.91])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 07:11:32 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 02/12] drm/i915: Introduce to_gt() helper
Date: Sun, 12 Dec 2021 17:11:27 +0200
Message-Id: <20211212151127.118001-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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
index a0f54a69b11d..8c8dd0f521ac 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1077,6 +1077,11 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
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

