Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D2249831A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 16:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640D810EB60;
	Mon, 24 Jan 2022 15:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0C610EA79;
 Mon, 24 Jan 2022 15:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643036868; x=1674572868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ec+/QIGQtHv/dwSc1g5GDVEhgDa48Tj473Sf4dnEFjY=;
 b=XQCAn/gyMzCH49yDx1H4PvfVOr1lCfslvmeRtDI1HD/5GTSRbZjqA1Cb
 2cLQcMFwqQQj/mAJKVD0PUZeny3uG6xY5LMfoGJmSqMlXz9gJ8nUWBeyA
 eZV5GgzpfHPlqTx/74eGKUSXoYa/vAlQPmvqNRlFsKDBVxl7xqXtthYQe
 YphW8uKcM3+HoZaXK5vLYig6B6v9iVehzMJ4YRfj0wsdyCqqwzPDcUUUD
 Rems5IBDRcjU7L9DT4hH6B8baxvgriQ4k37g9tmykoFG0rmh9X7lM1H/r
 Mc9iRQ5saBInXUWA2lVBpXEoS8oE2u+WS2K4hPdruvEm5+JK0nFAHLSh5 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="246282838"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="246282838"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:07:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="532104893"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:07:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/i915: Add request cancel low level trace point
Date: Mon, 24 Jan 2022 07:01:54 -0800
Message-Id: <20220124150157.15758-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124150157.15758-1-matthew.brost@intel.com>
References: <20220124150157.15758-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add request cancel trace point guarded by
CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINT.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.h |  1 +
 drivers/gpu/drm/i915/i915_trace.h       | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index d8c74bbf9aae2..3aed4d77f116c 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -124,6 +124,7 @@ intel_context_is_pinned(struct intel_context *ce)
 static inline void intel_context_cancel_request(struct intel_context *ce,
 						struct i915_request *rq)
 {
+	trace_i915_request_cancel(rq);
 	GEM_BUG_ON(!ce->ops->cancel_request);
 	return ce->ops->cancel_request(ce, rq);
 }
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 37b5c9e9d260e..d0a11a8bb0ca3 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -324,6 +324,11 @@ DEFINE_EVENT(i915_request, i915_request_add,
 );
 
 #if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
+DEFINE_EVENT(i915_request, i915_request_cancel,
+	     TP_PROTO(struct i915_request *rq),
+	     TP_ARGS(rq)
+);
+
 DEFINE_EVENT(i915_request, i915_request_guc_submit,
 	     TP_PROTO(struct i915_request *rq),
 	     TP_ARGS(rq)
@@ -497,6 +502,11 @@ DEFINE_EVENT(intel_context, intel_context_do_unpin,
 
 #else
 #if !defined(TRACE_HEADER_MULTI_READ)
+static inline void
+trace_i915_request_cancel(struct i915_request *rq)
+{
+}
+
 static inline void
 trace_i915_request_guc_submit(struct i915_request *rq)
 {
-- 
2.34.1

