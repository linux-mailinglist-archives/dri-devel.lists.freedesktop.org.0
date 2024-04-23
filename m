Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA438AFCF1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 01:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682D5113782;
	Tue, 23 Apr 2024 23:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igFRaaVm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E3C113779;
 Tue, 23 Apr 2024 23:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713916586; x=1745452586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7RUNRWAw/Jy7CMiXad5RP36prd47GeoL5Kr9KYHcVyc=;
 b=igFRaaVm6TbQM1aYcqVmP2Dtd9/gjvJF0L6r6EAR/Ck8CED7+dtgYcNv
 KP3SMMZ63/WKyEi0tukmYSwsl+ZFso0fBAwWbUnlEpZrCDggHd6Z0iPos
 CX9IaGG+6fhBNE/Kw2hNFQuIkYxeATLUXRWCAuEA+j6qD3Cs8zC4WlS5b
 SAjxjILtniw7Z6LzTm2b0jV0TOBV9fKegUed5DI3gzWeE2XYkRqM4q8zq
 Kl7TPD+7ubFzJxKMzX5H5UHSPKxgCCmnsuuPwJvp+XTvZcDBEdQLaWst/
 KYF71tg3zQYBXQEs0XHzDMNfQAmEXiw8aw9l3072d5mjCa2ls7EnjSbV1 g==;
X-CSE-ConnectionGUID: Q9EU1oUHSSyo+WgixpJyuA==
X-CSE-MsgGUID: LpiJBwDDSmm+IexUV2HKtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27040647"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="27040647"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:56:25 -0700
X-CSE-ConnectionGUID: 5Z0GZCwIRheQa5YEUPes7Q==
X-CSE-MsgGUID: pOM/PbVwTzq+sTwk/MM75Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29170909"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:56:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 1/6] drm/xe/lrc: Add helper to capture context timestamp
Date: Tue, 23 Apr 2024 16:56:46 -0700
Message-ID: <20240423235652.1959945-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423235652.1959945-1-lucas.demarchi@intel.com>
References: <20240423235652.1959945-1-lucas.demarchi@intel.com>
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
 drivers/gpu/drm/xe/xe_lrc.c             | 11 +++++++++++
 drivers/gpu/drm/xe/xe_lrc.h             | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_lrc_types.h       |  3 +++
 4 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 1825d8f79db6..8780e6c6b649 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -11,6 +11,7 @@
 #define CTX_RING_TAIL			(0x06 + 1)
 #define CTX_RING_START			(0x08 + 1)
 #define CTX_RING_CTL			(0x0a + 1)
+#define CTX_TIMESTAMP			(0x22 + 1)
 #define CTX_PDP0_UDW			(0x30 + 1)
 #define CTX_PDP0_LDW			(0x32 + 1)
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 615bbc372ac6..4bfd8f9c3b46 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -751,6 +751,7 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	lrc->tile = gt_to_tile(hwe->gt);
 	lrc->ring.size = ring_size;
 	lrc->ring.tail = 0;
+	lrc->ctx_timestamp = 0;
 
 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
 			     hwe->fence_irq, hwe->name);
@@ -786,6 +787,7 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 			xe_drm_client_add_bo(vm->xef->client, lrc->bo);
 	}
 
+	xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP, 0);
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc));
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, 0);
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
@@ -1444,3 +1446,12 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
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
index d32fa31faa2c..dcbc6edd80da 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -60,4 +60,18 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
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
index b716df0dfb4e..5765d771b901 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -41,6 +41,9 @@ struct xe_lrc {
 
 	/** @fence_ctx: context for hw fence */
 	struct xe_hw_fence_ctx fence_ctx;
+
+	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
+	u32 ctx_timestamp;
 };
 
 struct xe_lrc_snapshot;
-- 
2.43.0

