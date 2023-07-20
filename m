Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDD975B4CF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 18:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67BC10E5E5;
	Thu, 20 Jul 2023 16:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94AE10E5E5;
 Thu, 20 Jul 2023 16:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689871523; x=1721407523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AsY9xtxLi3uXO72mll3hlrmZQj4IJpAF/cnKAmSU6XQ=;
 b=gdnb2Ab5N4d7nI7nyICuw1NSvn3nDl1P/NYd6/ZBp9MhijFod4GLLw/n
 ZeX/vvqncB+3tdALtnaofSIPmQJ9kURRSTMmkvojmjeC7Z1iX84BErZ0Y
 Pz+pJwibqeLdoFGYjHB/fg8Kg00SPHXKh1i7paIXc6Uu+WealugCN7ljQ
 vNFQlTs0LfUsBEkcrEog9REpgWciEsuw1AdAVlDL6Cu/iu7sNk9U7G1ZE
 TYEfQEUQto57vw9J1vf2960Js6HEd6F8gPTJz9+WDb0otiXKVsWu7VUfI
 HA0vFkqS2uSAM79fehuvfNe59QrTtz3lyeegaqkjH0f+S80mSPfUEEO/P w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="356783626"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="356783626"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 09:45:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="759633168"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="759633168"
Received: from sdene1-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.32.238])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 09:45:20 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v6 2/9] drm/i915: Add the has_aux_ccs device property
Date: Thu, 20 Jul 2023 18:44:47 +0200
Message-Id: <20230720164454.757075-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230720164454.757075-1-andi.shyti@linux.intel.com>
References: <20230720164454.757075-1-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We always assumed that a device might either have AUX or FLAT
CCS, but this is an approximation that is not always true as it
requires some further per device checks.

Add the "has_aux_ccs" flag in the intel_device_info structure in
order to have a per device flag indicating of the AUX CCS.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: <stable@vger.kernel.org> # v5.8+
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 4 ++--
 drivers/gpu/drm/i915/i915_drv.h          | 1 +
 drivers/gpu/drm/i915/i915_pci.c          | 5 ++++-
 drivers/gpu/drm/i915/intel_device_info.h | 1 +
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 563efee055602..0d4d5e0407a2d 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -267,7 +267,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 		else if (engine->class == COMPUTE_CLASS)
 			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
-		if (!HAS_FLAT_CCS(rq->engine->i915))
+		if (HAS_AUX_CCS(rq->engine->i915))
 			count = 8 + 4;
 		else
 			count = 8;
@@ -307,7 +307,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 	if (mode & EMIT_INVALIDATE) {
 		cmd += 2;
 
-		if (!HAS_FLAT_CCS(rq->engine->i915) &&
+		if (HAS_AUX_CCS(rq->engine->i915) &&
 		    (rq->engine->class == VIDEO_DECODE_CLASS ||
 		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
 			aux_inv = rq->engine->mask &
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 682ef2b5c7d59..e9cc048b5727a 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -848,6 +848,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
  * stored in lmem to support the 3D and media compression formats.
  */
 #define HAS_FLAT_CCS(i915)   (INTEL_INFO(i915)->has_flat_ccs)
+#define HAS_AUX_CCS(i915)    (INTEL_INFO(i915)->has_aux_ccs)
 
 #define HAS_GT_UC(i915)	(INTEL_INFO(i915)->has_gt_uc)
 
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index fcacdc21643cf..c9ff1d11a9fce 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -643,7 +643,8 @@ static const struct intel_device_info jsl_info = {
 	TGL_CACHELEVEL, \
 	.has_global_mocs = 1, \
 	.has_pxp = 1, \
-	.max_pat_index = 3
+	.max_pat_index = 3, \
+	.has_aux_ccs = 1
 
 static const struct intel_device_info tgl_info = {
 	GEN12_FEATURES,
@@ -775,6 +776,7 @@ static const struct intel_device_info dg2_info = {
 
 static const struct intel_device_info ats_m_info = {
 	DG2_FEATURES,
+	.has_aux_ccs = 1,
 	.require_force_probe = 1,
 	.tuning_thread_rr_after_dep = 1,
 };
@@ -827,6 +829,7 @@ static const struct intel_device_info mtl_info = {
 	.__runtime.media.ip.ver = 13,
 	PLATFORM(INTEL_METEORLAKE),
 	.extra_gt_list = xelpmp_extra_gt,
+	.has_aux_ccs = 1,
 	.has_flat_ccs = 0,
 	.has_gmd_id = 1,
 	.has_guc_deprivilege = 1,
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index dbfe6443457b5..93485507506cc 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -151,6 +151,7 @@ enum intel_ppgtt_type {
 	func(has_reset_engine); \
 	func(has_3d_pipeline); \
 	func(has_4tile); \
+	func(has_aux_ccs); \
 	func(has_flat_ccs); \
 	func(has_global_mocs); \
 	func(has_gmd_id); \
-- 
2.40.1

