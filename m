Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715F58C8D69
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 22:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1312210EF83;
	Fri, 17 May 2024 20:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RnEv3WJO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CCB10EF70;
 Fri, 17 May 2024 20:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715978591; x=1747514591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jAAH7nca/REOs/C6Nd0bQTUOEodfvlodNhpWGM+TVfo=;
 b=RnEv3WJOSl71dEEGAEAoZHHZ5kVtBIRmgq3nO3a5ej/2mEO3A303rhcs
 EMTRmvHwDayoPYh9l+Ribe+0PuYeWhOTZYhGLqqhPuhsoefsAolZdboYx
 XqEQgfVrtH8m99JDWfDamRz23IgIMRhEpYDaE7HRtiNDwVWiUHLy98BtP
 0daQga2L/akzlP4ITGSpiR5X+0jhEYW6fb5Yef8lPpcf9pUeTeyNmSJAe
 mra7m1q+ggBealDwXfps1fc5DByZgKiarpITDIRCp9mP8z8oQXP1OySCH
 qDe5cjFNAX8RiE7OA0UnbOvtzdD5UTdwW+UvWzPBe5vg/P1U75hXTsQfU Q==;
X-CSE-ConnectionGUID: Ssqit79XQ8SifQMZ2Hx3bQ==
X-CSE-MsgGUID: lQSA/knhSYac33LURs6tEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12027916"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="12027916"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 13:43:10 -0700
X-CSE-ConnectionGUID: lzXoQudATgO5H+OM7e5OeQ==
X-CSE-MsgGUID: YrgdTVU+Qbmw1F5oUeJ4IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="55125242"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 13:43:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 3/8] drm/xe/lrc: Add helper to capture context timestamp
Date: Fri, 17 May 2024 13:43:05 -0700
Message-ID: <20240517204310.88854-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517204310.88854-1-lucas.demarchi@intel.com>
References: <20240517204310.88854-1-lucas.demarchi@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Add a helper to capture CTX_TIMESTAMP from the context image so it can
be used to calculate the runtime.

v2: Add kernel-doc to clarify expectation from caller

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  1 +
 drivers/gpu/drm/xe/xe_lrc.c             | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h             | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_lrc_types.h       |  3 +++
 4 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index e6ca8bbda8f4..045dfd09db99 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -11,6 +11,7 @@
 #define CTX_RING_TAIL			(0x06 + 1)
 #define CTX_RING_START			(0x08 + 1)
 #define CTX_RING_CTL			(0x0a + 1)
+#define CTX_TIMESTAMP			(0x22 + 1)
 #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
 #define CTX_PDP0_UDW			(0x30 + 1)
 #define CTX_PDP0_LDW			(0x32 + 1)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 9b0a4078add3..f679cb9aaea7 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -844,6 +844,7 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	lrc->tile = gt_to_tile(hwe->gt);
 	lrc->ring.size = ring_size;
 	lrc->ring.tail = 0;
+	lrc->ctx_timestamp = 0;
 
 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
 			     hwe->fence_irq, hwe->name);
@@ -898,6 +899,8 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 				     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
 	}
 
+	xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP, 0);
+
 	if (xe->info.has_asid && vm)
 		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
 
@@ -1576,3 +1579,12 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
 		xe_bo_put(snapshot->lrc_bo);
 	kfree(snapshot);
 }
+
+u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
+{
+	*old_ts = lrc->ctx_timestamp;
+
+	lrc->ctx_timestamp = xe_lrc_read_ctx_reg(lrc, CTX_TIMESTAMP);
+
+	return lrc->ctx_timestamp;
+}
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index e0e841963c23..b9da1031083b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -66,4 +66,18 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
 void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
 void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
 
+/**
+ * xe_lrc_update_timestamp - readout LRC timestamp and update cached value
+ * @lrc: logical ring context for this exec queue
+ * @old_ts: pointer where to save the previous timestamp
+ *
+ * Read the current timestamp for this LRC and update the cached value. The
+ * previous cached value is also returned in @old_ts so the caller can calculate
+ * the delta between 2 updates. Note that this is not intended to be called from
+ * any place, but just by the paths updating the drm client utilization.
+ *
+ * Returns the current LRC timestamp
+ */
+u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index cdbf03faef15..0fa055da6b27 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -45,6 +45,9 @@ struct xe_lrc {
 
 	/** @fence_ctx: context for hw fence */
 	struct xe_hw_fence_ctx fence_ctx;
+
+	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
+	u32 ctx_timestamp;
 };
 
 struct xe_lrc_snapshot;
-- 
2.43.0

