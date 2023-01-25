Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834F767A7FA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 01:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB9510E286;
	Wed, 25 Jan 2023 00:49:50 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B348F10E286;
 Wed, 25 Jan 2023 00:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674607787; x=1706143787;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jXOemcQFiVbJfQstZuCMRDxAHmky0pKSnyOJ25gyGL8=;
 b=dTz520uQquslkZTPuWSbDRTZE8dqKY9zWAViJjN/mzEaTKUq0qppsfZO
 kS7noEubyZehi4eo9IoOI3XY745a/4u2kEZ07n3CfVb1nxROb2gsjTmNV
 lc4FcN4bkJtZese7idm2ipCnQXwyi2DOqyf69Jo48UZKy4eC7AdTtBiVN
 yIuavE1ADP/CdrTLr3n6+AWkSkl5/Hj03+IlLJqwOlNI02KQgCcpbqHyL
 DBnWNW/eCuSLNSAeYnVVIOT4MTYrYZNywpMYLM56/tjWV0NJYwWBdArA0
 TdyuxJAGP2JM6xDILn+jb8NkzNARaP6lI0VsBMpR5u4ATAV82RgXsrJri Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="328538143"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="328538143"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 16:49:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="804817480"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="804817480"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2023 16:49:45 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Fix missing ecodes
Date: Tue, 24 Jan 2023 16:49:35 -0800
Message-Id: <20230125004935.1986479-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Michael Cheng <michael.cheng@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Bruce Chang <yu.bruce.chang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Error captures are tagged with an 'ecode'. This is a pseduo-unique magic
number that is meant to distinguish similar seeming bugs with
different underlying signatures. It is a combination of two ring state
registers. Unfortunately, the register state being used is only valid
in execlist mode. In GuC mode, the register state exists in a separate
list of arbitrary register address/value pairs rather than the named
entry structure. So, search through that list to find the two exciting
registers and copy them over to the structure's named members.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Fixes: a6f0f9cf330a ("drm/i915/guc: Plumb GuC-capture into gpu_coredump")
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Michael Cheng <michael.cheng@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Bruce Chang <yu.bruce.chang@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 1c1b85073b4bd..4e0b06ceed96d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -1571,6 +1571,27 @@ int intel_guc_capture_print_engine_node(struct drm_i915_error_state_buf *ebuf,
 
 #endif //CONFIG_DRM_I915_CAPTURE_ERROR
 
+static void guc_capture_find_ecode(struct intel_engine_coredump *ee)
+{
+	struct gcap_reg_list_info *reginfo;
+	struct guc_mmio_reg *regs;
+	i915_reg_t reg_ipehr = RING_IPEHR(0);
+	i915_reg_t reg_instdone = RING_INSTDONE(0);
+	int i;
+
+	if (!ee->guc_capture_node)
+		return;
+
+	reginfo = ee->guc_capture_node->reginfo + GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE;
+	regs = reginfo->regs;
+	for (i = 0; i < reginfo->num_regs; i++) {
+		if (regs[i].offset == reg_ipehr.reg)
+			ee->ipehr = regs[i].value;
+		if (regs[i].offset == reg_instdone.reg)
+			ee->instdone.instdone = regs[i].value;
+	}
+}
+
 void intel_guc_capture_free_node(struct intel_engine_coredump *ee)
 {
 	if (!ee || !ee->guc_capture_node)
@@ -1612,6 +1633,7 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
 			list_del(&n->link);
 			ee->guc_capture_node = n;
 			ee->capture = guc->capture;
+			guc_capture_find_ecode(ee);
 			return;
 		}
 	}
-- 
2.39.1

