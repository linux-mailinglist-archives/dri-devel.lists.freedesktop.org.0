Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660D58C6DDE
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489D110EC17;
	Wed, 15 May 2024 21:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2nbgnCT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF78C10E267;
 Wed, 15 May 2024 21:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715809380; x=1747345380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pHdJ8DpE5J2snIv+ddH+lWv1Pah7z5MpQ7nqg4bsPRU=;
 b=m2nbgnCTTN64mDrw1lQrybxUp+iQPr2pTYTD2eLJBsxKDwBLoGAuwpew
 qEl+1IpynWkQ7aUsxdkCKq7lxSoRUtnuWzN1PesTH51mq8sR0Cb2b2TeF
 aowo+PLAxW5kUIUej8pmNrrMwWZ4f3yLnS0BbilbgMwNPbnWr7Xk8kt+v
 SsPKluODin1BlP3jH56/9CKbRBX+pY/a+jJSR/kgSYlXXj8qRxzBMLKb/
 efuL/W+5+aqI21+M8zIRok1J3w9gQB5UC0o7hxbgtKKwuM1/OkVDV7bKB
 ZixiITpAS3onlKd3xq8C3BPWQLy+y5KSRcc04Dv3Mv7xzmlaD95LQktds g==;
X-CSE-ConnectionGUID: 3Gje12NDTuSi8pduzjJYFw==
X-CSE-MsgGUID: hciz58YQRJ+03lxw20gb2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11739164"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="11739164"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:42:59 -0700
X-CSE-ConnectionGUID: AIYkkAJtQny1Mf5CxnmwJg==
X-CSE-MsgGUID: 42B23p8fStKn0k1CAgoBIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35651132"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:42:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 3/8] drm/xe/lrc: Add helper to capture context timestamp
Date: Wed, 15 May 2024 14:42:53 -0700
Message-ID: <20240515214258.59209-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240515214258.59209-1-lucas.demarchi@intel.com>
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
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

