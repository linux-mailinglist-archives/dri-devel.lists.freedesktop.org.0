Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E589D375AB3
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEF16ED10;
	Thu,  6 May 2021 18:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCB06ED0D;
 Thu,  6 May 2021 18:57:13 +0000 (UTC)
IronPort-SDR: sRxvZtyxAkvLpCYjVuuoJVNlKg/CeAzpYQocj6v1sffbYLtYknPqPe0OoN8Z8EPnAQXpQkZT27
 GvQYppgsC/ZQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531011"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531011"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:12 -0700
IronPort-SDR: axxjpDIU1z9a35IStfWVVcHRqgdbMHDwljOqjviqmnG0X5DAcEiPQtsVXzDwFUnsfHq3uwaxlQ
 1eEM3aeXQhqQ==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583491"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 43/97] drm/i915/guc: Add lrc descriptor context lookup
 array
Date: Thu,  6 May 2021 12:13:57 -0700
Message-Id: <20210506191451.77768-44-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add lrc descriptor context lookup array which can resolve the
intel_context from the lrc descriptor index. In addition to lookup, it
can determine in the lrc descriptor context is currently registered with
the GuC by checking if an entry for a descriptor index is present.
Future patches in the series will make use of this array.

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  5 +++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 32 +++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index d84f37afb9d8..2eb6c497e43c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -6,6 +6,8 @@
 #ifndef _INTEL_GUC_H_
 #define _INTEL_GUC_H_
 
+#include "linux/xarray.h"
+
 #include "intel_uncore.h"
 #include "intel_guc_fw.h"
 #include "intel_guc_fwif.h"
@@ -47,6 +49,9 @@ struct intel_guc {
 	struct i915_vma *lrc_desc_pool;
 	void *lrc_desc_pool_vaddr;
 
+	/* guc_id to intel_context lookup */
+	struct xarray context_lookup;
+
 	/* Control params for fw initialization */
 	u32 params[GUC_CTL_MAX_DWORDS];
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 6acc1ef34f92..c2b6d27404b7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -65,8 +65,6 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
 	return rb_entry(rb, struct i915_priolist, node);
 }
 
-/* Future patches will use this function */
-__attribute__ ((unused))
 static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
 {
 	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
@@ -76,6 +74,15 @@ static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
 	return &base[index];
 }
 
+static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
+{
+	struct intel_context *ce = xa_load(&guc->context_lookup, id);
+
+	GEM_BUG_ON(id >= GUC_MAX_LRC_DESCRIPTORS);
+
+	return ce;
+}
+
 static int guc_lrc_desc_pool_create(struct intel_guc *guc)
 {
 	u32 size;
@@ -96,6 +103,25 @@ static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
 	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
 }
 
+static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
+{
+	struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
+
+	memset(desc, 0, sizeof(*desc));
+	xa_erase_irq(&guc->context_lookup, id);
+}
+
+static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
+{
+	return __get_context(guc, id);
+}
+
+static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
+					   struct intel_context *ce)
+{
+	xa_store_irq(&guc->context_lookup, id, ce, GFP_ATOMIC);
+}
+
 static void guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 {
 	/* Leaving stub as this function will be used in future patches */
@@ -404,6 +430,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	 */
 	GEM_BUG_ON(!guc->lrc_desc_pool);
 
+	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
+
 	return 0;
 }
 
-- 
2.28.0

