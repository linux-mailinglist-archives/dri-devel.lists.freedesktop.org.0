Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ED86B5906
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 07:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B378710EA5D;
	Sat, 11 Mar 2023 06:38:18 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7B310E0A1;
 Sat, 11 Mar 2023 06:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678516696; x=1710052696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7J7lRFZPUr3BHW7/m3oEBmgCduD9y0HNKFUPix8KbTs=;
 b=Q9WOomSWm3qP+nRhKN3On4PNOafiyae+bRCBUrywFbDT8bTuOMnQ/y6l
 qgk1QwC+ApqSvo+pWUtmO+yDCIjfQZlUtYK+i3AVdkqqys7BKLhpFXrkd
 72JPyQIXpvaINcvcVugfB30pljAEDDpK/b3jFo8yykqpgZSa/kclJv1+D
 mTG87wsyG422tMkLCsWVYcVmcSmQEroKd18Q3+hxQ36/4RyuswV/id27U
 JmtHuPa7LmwLpii4+0GOUJWEndFQHQ+1wHzf9YsOhJ6ICqBU6GUnImNUe
 jIZz+UJwrWjD5obplz/FxYTGLk/3PX3PKzhWPKNMrH3YGiYg5fc/Q65d6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="335579552"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; d="scan'208";a="335579552"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 22:38:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="678086694"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; d="scan'208";a="678086694"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 10 Mar 2023 22:38:15 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 1/3] drm/i915/guc: Fix missing ecodes
Date: Fri, 10 Mar 2023 22:37:12 -0800
Message-Id: <20230311063714.570389-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230311063714.570389-1-John.C.Harrison@Intel.com>
References: <20230311063714.570389-1-John.C.Harrison@Intel.com>
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
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>,
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

v2: if else if instead of if if (Alan)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
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
index 101d44de729b1..36196cbb24c6b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -1562,6 +1562,27 @@ int intel_guc_capture_print_engine_node(struct drm_i915_error_state_buf *ebuf,
 
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
+		else if (regs[i].offset == reg_instdone.reg)
+			ee->instdone.instdone = regs[i].value;
+	}
+}
+
 void intel_guc_capture_free_node(struct intel_engine_coredump *ee)
 {
 	if (!ee || !ee->guc_capture_node)
@@ -1601,6 +1622,7 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
 			list_del(&n->link);
 			ee->guc_capture_node = n;
 			ee->guc_capture = guc->capture;
+			guc_capture_find_ecode(ee);
 			return;
 		}
 	}
-- 
2.39.1

