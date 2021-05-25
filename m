Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5FE390AE5
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 22:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796AD6EB21;
	Tue, 25 May 2021 20:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4BB6EB07;
 Tue, 25 May 2021 20:57:57 +0000 (UTC)
IronPort-SDR: THJ6HNRzYFgCg2kkVqYKlCYbg3QIRPw4sUM0TbkKOfVUBNLenlQzOaBI6CvhsHRxs/vSttaktZ
 ACPbxXGqtgKA==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="287876025"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="287876025"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 13:57:55 -0700
IronPort-SDR: 8yT2tjoqKEzwr65h3fl3dlHFaKNiLdE3kWxxVpAQlsp8vHjtvX5u7Iv5Mzem8vQL6SMvTmeVJi
 dwVoJmaPqHIg==
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="443603563"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 13:57:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 14/17] drm/i915/guc: Ensure H2G buffer updates visible before
 tail update
Date: Tue, 25 May 2021 14:15:38 -0700
Message-Id: <20210525211541.87696-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210525211541.87696-1-matthew.brost@intel.com>
References: <20210525211541.87696-1-matthew.brost@intel.com>
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
Cc: Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ensure H2G buffer updates are visible before descriptor tail updates by
inserting a barrier between the H2G buffer update and the tail. The
barrier is simple wmb() for SMEM and is register write for LMEM. This is
needed if more than 1 H2G can be inflight at once.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index e44f06fbf87a..732a8ffa52dc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -328,6 +328,18 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
 	return ++ct->requests.last_fence;
 }
 
+static void write_barrier(struct intel_guc_ct *ct) {
+	struct intel_guc *guc = ct_to_guc(ct);
+	struct intel_gt *gt = guc_to_gt(guc);
+
+	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
+		GEM_BUG_ON(guc->send_regs.fw_domains);
+		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
+	} else {
+		wmb();
+	}
+}
+
 /**
  * DOC: CTB Host to GuC request
  *
@@ -411,6 +423,12 @@ static int ct_write(struct intel_guc_ct *ct,
 	}
 	GEM_BUG_ON(tail > size);
 
+	/*
+	 * make sure H2G buffer update and LRC tail update (if this triggering a
+	 * submission) are visible before updating the descriptor tail
+	 */
+	write_barrier(ct);
+
 	/* now update desc tail (back in bytes) */
 	desc->tail = tail * 4;
 	return 0;
-- 
2.28.0

