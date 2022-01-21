Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8333496676
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 21:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3E810E620;
	Fri, 21 Jan 2022 20:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599F310E621;
 Fri, 21 Jan 2022 20:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642797767; x=1674333767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ec+/QIGQtHv/dwSc1g5GDVEhgDa48Tj473Sf4dnEFjY=;
 b=ms7OCjKlsi5jj07TZqqa9xTInmTPx5jdsxnOY4xJGERCH4UZNAGgyDHi
 dA2POl7O/jdGRJ8jsMe77kOndLhcpqepDneyK1dKFGQe2H4JWfNon6eQn
 OZV3E8ZWJWaKJg2I4RWfyMk20CCFDDtgIMSd8Iwv4WMUDqy9tmO0//yXI
 MkB9irhTp4naAGI8xtngIbmQYsrlEqhuV06ezEInADwnTQVlndLAxzdGJ
 gz3/RRrbStc4imnNhcvjp/8ibIhyXg/5+QTl7ZF1rtNDUl9xzsyIC5VOZ
 PcxpZcWWT4UIxG/my1bjBhMaKJBi+A0msqKZplsLTsgOU1tgC1JWD9ym1 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10234"; a="309065947"
X-IronPort-AV: E=Sophos;i="5.88,306,1635231600"; d="scan'208";a="309065947"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 12:42:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,306,1635231600"; d="scan'208";a="626855412"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 12:42:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/i915: Add request cancel low level trace point
Date: Fri, 21 Jan 2022 12:36:57 -0800
Message-Id: <20220121203658.28042-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121203658.28042-1-matthew.brost@intel.com>
References: <20220121203658.28042-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
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

