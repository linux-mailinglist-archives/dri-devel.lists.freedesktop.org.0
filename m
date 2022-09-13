Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 307255B7D77
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 01:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFAB10E662;
	Tue, 13 Sep 2022 23:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20F210E661;
 Tue, 13 Sep 2022 23:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663111350; x=1694647350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Sf6v9qiysvNilNLhs4/zCGSqTJg8SYdCWMwocvSwVM=;
 b=XG2cBOY55NQmZS5K7ckBahqqPCT/MerntsrMjjbnCEu5ykLmaD1G6SNc
 a/et4Y9IkphRp5wDwP2oC0S+uQXDxStyGy4ZDaV0Ot8hQTot8QWee+hEq
 hJ6n15MBOy3HmGV7TylQCv1B1lsiJCgClGbHJzDoDwTxoXt5uuqUWnb8V
 5ia1s0OWhDyauTUsqhJs424LoGNiw/tY7w17oUhmPgZirEOTtcJdTa/KG
 bwpr/wHIcnV3LHVeYuedQ2t0SFFcsUmS/OO0u5rmvZjQmcu5F1cYZLnjW
 S3te6zh612f8tbRcRn5QnasG//sePct5+ti5uAsn0m5tcpBFAaEty9GUN Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="299640983"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="299640983"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 16:22:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="647142454"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 16:22:29 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/huc: stall media submission until HuC is loaded
Date: Tue, 13 Sep 2022 16:22:12 -0700
Message-Id: <20220913232212.894826-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913005739.798337-13-daniele.ceraolospurio@intel.com>
References: <20220913005739.798337-13-daniele.ceraolospurio@intel.com>
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
Cc: Tony Ye <tony.ye@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wait on the fence to be signalled to avoid the submissions finding HuC
not yet loaded.

v2: use dedicaded wait_queue_entry for waiting in HuC load, as submitq
can't be re-used for it.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tony Ye <tony.ye@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com> #v1
Acked-by: Tony Ye <tony.ye@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.h |  6 ++++++
 drivers/gpu/drm/i915/i915_request.c    | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_request.h    |  5 +++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
index 915d281c1c72..52db03620c60 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
@@ -81,6 +81,12 @@ static inline bool intel_huc_is_loaded_by_gsc(const struct intel_huc *huc)
 	return huc->fw.loaded_via_gsc;
 }
 
+static inline bool intel_huc_wait_required(struct intel_huc *huc)
+{
+	return intel_huc_is_used(huc) && intel_huc_is_loaded_by_gsc(huc) &&
+	       !intel_huc_is_authenticated(huc);
+}
+
 void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p);
 
 #endif
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 62fad16a55e8..f949a9495758 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1621,6 +1621,20 @@ i915_request_await_object(struct i915_request *to,
 	return ret;
 }
 
+static void i915_request_await_huc(struct i915_request *rq)
+{
+	struct intel_huc *huc = &rq->context->engine->gt->uc.huc;
+
+	/* don't stall kernel submissions! */
+	if (!rcu_access_pointer(rq->context->gem_context))
+		return;
+
+	if (intel_huc_wait_required(huc))
+		i915_sw_fence_await_sw_fence(&rq->submit,
+					     &huc->delayed_load.fence,
+					     &rq->hucq);
+}
+
 static struct i915_request *
 __i915_request_ensure_parallel_ordering(struct i915_request *rq,
 					struct intel_timeline *timeline)
@@ -1702,6 +1716,16 @@ __i915_request_add_to_timeline(struct i915_request *rq)
 	struct intel_timeline *timeline = i915_request_timeline(rq);
 	struct i915_request *prev;
 
+	/*
+	 * Media workloads may require HuC, so stall them until HuC loading is
+	 * complete. Note that HuC not being loaded when a user submission
+	 * arrives can only happen when HuC is loaded via GSC and in that case
+	 * we still expect the window between us starting to accept submissions
+	 * and HuC loading completion to be small (a few hundred ms).
+	 */
+	if (rq->engine->class == VIDEO_DECODE_CLASS)
+		i915_request_await_huc(rq);
+
 	/*
 	 * Dependency tracking and request ordering along the timeline
 	 * is special cased so that we can eliminate redundant ordering
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 47041ec68df8..f5e1bb5e857a 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -348,6 +348,11 @@ struct i915_request {
 #define	GUC_PRIO_FINI	0xfe
 	u8 guc_prio;
 
+	/**
+	 * @hucq: wait queue entry used to wait on the HuC load to complete
+	 */
+	wait_queue_entry_t hucq;
+
 	I915_SELFTEST_DECLARE(struct {
 		struct list_head link;
 		unsigned long delay;
-- 
2.37.2

