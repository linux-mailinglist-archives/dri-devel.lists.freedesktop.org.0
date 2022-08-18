Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1CE5990DF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC8310EA2F;
	Thu, 18 Aug 2022 23:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BCA10E3FE;
 Thu, 18 Aug 2022 23:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660863805; x=1692399805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EjUn1bYc5xIjpDdCKjXWHrwMEFf+1KyC1XaY5iWgbQg=;
 b=fcqEm9lBwkRfB5A0GDWMg+xt+VvmA0ldtuH2rwGkE6gNZaARnQzwK+Gr
 9rluuQOh/yyFH/1QyBLE7CDb4cMS3oVgJ+wpnLycW34ZHvzhpHKYxGFoZ
 S1+DpWiz25uvfMf8L5gK20fAdpBS3xpt6T1+Yc7AcnmXuC9CJo/xy290/
 wYHtTcTz/ueGp6K3B1AhqmwH7Mdh8dZ79z0Yiyo4ifyqZvSFOCiipg3VD
 TfrTYEKFG0QAz2mlSY9e+U2Fb0/kbhqjCVNlJ+otd2dsyLIBH4x5sDLwn
 KSGIOqimq++u9X/YdvrGu7no4Lv0nU8/QAyuynP7xn2ZG27TRYu8HSgup A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="293677575"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="293677575"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:03:25 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="641042883"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:03:25 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 12/15] drm/i915/huc: stall media submission until HuC is
 loaded
Date: Thu, 18 Aug 2022 16:02:40 -0700
Message-Id: <20220818230243.3921066-13-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
References: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tony Ye <tony.ye@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.h |  6 ++++++
 drivers/gpu/drm/i915/i915_request.c    | 24 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
index 49374f306a7f..209de60474a5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
@@ -77,6 +77,12 @@ static inline bool intel_huc_is_loaded_by_gsc(const struct intel_huc *huc)
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
index 62fad16a55e8..77f45a3cb01f 100644
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
+					     &rq->submitq);
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
-- 
2.37.2

