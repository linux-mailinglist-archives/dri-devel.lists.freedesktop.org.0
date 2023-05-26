Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABB77130BD
	for <lists+dri-devel@lfdr.de>; Sat, 27 May 2023 01:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459F510E1F7;
	Fri, 26 May 2023 23:54:59 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9440510E175;
 Fri, 26 May 2023 23:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685145296; x=1716681296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jt/bzZNlc/a19MhG99f7Q/ohKZLU/lbsJmdfyQwygvM=;
 b=Cws+Xw71OLyJibUN8cQTqjvJdAxgKqZmlv8RGpqVHnFk5fuEMBrHL1K3
 HBWKvSnytQx/x+jAL9yLYRa2E2Z/K86PGZxXb2JSgVNPOtJ/njcZ+F9/D
 l+m4WAg7EOJc33/H74owBIGmMjk61aSTXQ+o4OKrUKMYXdNXo0t4LynNf
 HKzs0l+H+nmUyIv/LQ89JhkZKZ2LAz7eo6c/BQNjT4KGtV6IyZiN6QgOV
 KjyaaiskQ/c/5BrSZLKA+dywKWelG+jyEfcCCbTxnyU0jEYZC8b6gtSp5
 WAlap8MpD4ijHBgwYcXs5Axo5L1kQrZZP0sa7O/ec9uXklqGf5Kyz0Lke g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356716171"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="356716171"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 16:54:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="829667557"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="829667557"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 26 May 2023 16:54:55 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 3/3] drm/i915/guc: Track all sent actions to GuC
Date: Fri, 26 May 2023 16:55:38 -0700
Message-Id: <20230526235538.2230780-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230526235538.2230780-1-John.C.Harrison@Intel.com>
References: <20230526235538.2230780-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

For easier debug of any unexpected error responses from GuC that
might be related to non-blocking fast requests, track action code (and
stack if under DEBUG_GUC config) for every H2G request.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/Kconfig.debug        |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 68 ++++++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h | 11 ++++
 3 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 47e845353ffad..2d21930d55015 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -157,6 +157,7 @@ config DRM_I915_SW_FENCE_CHECK_DAG
 config DRM_I915_DEBUG_GUC
 	bool "Enable additional driver debugging for GuC"
 	depends on DRM_I915
+	select STACKDEPOT
 	default n
 	help
 	  Choose this option to turn on extra driver debugging that may affect
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 3a71bb582089e..4aa903be1317b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -376,6 +376,24 @@ void intel_guc_ct_disable(struct intel_guc_ct *ct)
 	}
 }
 
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
+static void ct_track_lost_and_found(struct intel_guc_ct *ct, u32 fence, u32 action)
+{
+	unsigned int lost = fence % ARRAY_SIZE(ct->requests.lost_and_found);
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
+	unsigned long entries[SZ_32];
+	unsigned int n;
+
+	n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
+
+	/* May be called under spinlock, so avoid sleeping */
+	ct->requests.lost_and_found[lost].stack = stack_depot_save(entries, n, GFP_NOWAIT);
+#endif
+	ct->requests.lost_and_found[lost].fence = fence;
+	ct->requests.lost_and_found[lost].action = action;
+}
+#endif
+
 static u32 ct_get_next_fence(struct intel_guc_ct *ct)
 {
 	/* For now it's trivial */
@@ -447,6 +465,11 @@ static int ct_write(struct intel_guc_ct *ct,
 	}
 	GEM_BUG_ON(tail > size);
 
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
+	ct_track_lost_and_found(ct, fence,
+				FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
+#endif
+
 	/*
 	 * make sure H2G buffer update and LRC tail update (if this triggering a
 	 * submission) are visible before updating the descriptor tail
@@ -953,6 +976,43 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	return -EPIPE;
 }
 
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
+static bool ct_check_lost_and_found(struct intel_guc_ct *ct, u32 fence)
+{
+	unsigned int n;
+	char *buf = NULL;
+	bool found = false;
+
+	lockdep_assert_held(&ct->requests.lock);
+
+	for (n = 0; n < ARRAY_SIZE(ct->requests.lost_and_found); n++) {
+		if (ct->requests.lost_and_found[n].fence != fence)
+			continue;
+		found = true;
+
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
+		buf = kmalloc(SZ_4K, GFP_NOWAIT);
+		if (buf && stack_depot_snprint(ct->requests.lost_and_found[n].stack,
+					       buf, SZ_4K, 0)) {
+			CT_ERROR(ct, "Fence %u was used by action %#04x sent at\n%s",
+				 fence, ct->requests.lost_and_found[n].action, buf);
+			break;
+		}
+#endif
+		CT_ERROR(ct, "Fence %u was used by action %#04x\n",
+			 fence, ct->requests.lost_and_found[n].action);
+		break;
+	}
+	kfree(buf);
+	return found;
+}
+#else
+static bool ct_check_lost_and_found(struct intel_guc_ct *ct, u32 fence)
+{
+	return false;
+}
+#endif
+
 static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *response)
 {
 	u32 len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, response->msg[0]);
@@ -996,9 +1056,11 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 	if (!found) {
 		CT_ERROR(ct, "Unsolicited response message: len %u, data %#x (fence %u, last %u)\n",
 			 len, hxg[0], fence, ct->requests.last_fence);
-		list_for_each_entry(req, &ct->requests.pending, link)
-			CT_ERROR(ct, "request %u awaits response\n",
-				 req->fence);
+		if (!ct_check_lost_and_found(ct, fence)) {
+			list_for_each_entry(req, &ct->requests.pending, link)
+				CT_ERROR(ct, "request %u awaits response\n",
+					 req->fence);
+		}
 		err = -ENOKEY;
 	}
 	spin_unlock_irqrestore(&ct->requests.lock, flags);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index 818415b64f4d1..58e42901ff498 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -8,6 +8,7 @@
 
 #include <linux/interrupt.h>
 #include <linux/spinlock.h>
+#include <linux/stackdepot.h>
 #include <linux/workqueue.h>
 #include <linux/ktime.h>
 #include <linux/wait.h>
@@ -81,6 +82,16 @@ struct intel_guc_ct {
 
 		struct list_head incoming; /* incoming requests */
 		struct work_struct worker; /* handler for incoming requests */
+
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
+		struct {
+			u16 fence;
+			u16 action;
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
+			depot_stack_handle_t stack;
+#endif
+		} lost_and_found[SZ_16];
+#endif
 	} requests;
 
 	/** @stall_time: time of first time a CTB submission is stalled */
-- 
2.39.1

