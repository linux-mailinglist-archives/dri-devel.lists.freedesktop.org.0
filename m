Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6B551CB6D
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2585910FA95;
	Thu,  5 May 2022 21:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEAA10FA4F;
 Thu,  5 May 2022 21:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651786703; x=1683322703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v+dlkCGO0R59epjoLpaeVSSMdbYmC5IUf0K+rlQvmKU=;
 b=CVUGG7o5GyS7F9TN3VziUmkDvdY0LO0fdZa0oaRN2S2LUmv9cGtDtCT2
 pFTEQty9P3/M9XglWQ00ve/R0/sgqEwOXWQTzj6aJGvU24/QgwF+jheAn
 OEOqdHQN/BDtAXuZW8Sefwf1iNe/tuEPnKScU7lkIdgUFv8t+rCNbYJbH
 mO/+q6+iiWMtx68EKlg5UVuR6YQo7bO4zmuIyDM4u4G/czXPjx7aNwk7X
 t6fG6Bs4a8g3sRvAib10Ono5+WEgA4oPk3j41ltS4YCoaljQWaGkZr08m
 EaA+3HKfxSb4lNiHufheYxfwnVYBQEE5ukqvMSCOvmCAOkf8gzQjOwNLk g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268405999"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268405999"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="549553298"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 12/12] drm/i915/pvc: read fuses for link copy engines
Date: Thu,  5 May 2022 14:38:12 -0700
Message-Id: <20220505213812.3979301-13-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505213812.3979301-1-matthew.d.roper@intel.com>
References: <20220505213812.3979301-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas De Marchi <lucas.demarchi@intel.com>

The new Link Copy engines in PVC may be fused off according to the
mslice_mask. Each bit of the MEML3_EN_MASK we read from the
GEN10_MIRROR_FUSE3 register disables a pair of link copy engines.

v2 (Tvrtko):
 - Minor cosmetic changes: s/u8/unsigned long/, use instance local
   variable.  (Tvrtko)

Bspec: 44483
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index c6e93db134b1..1adbf34c3632 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -686,6 +686,34 @@ static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
 	}
 }
 
+static void engine_mask_apply_copy_fuses(struct intel_gt *gt)
+{
+	struct drm_i915_private *i915 = gt->i915;
+	struct intel_gt_info *info = &gt->info;
+	unsigned long meml3_mask;
+	unsigned long quad;
+
+	meml3_mask = intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3);
+	meml3_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK, meml3_mask);
+
+	/*
+	 * Link Copy engines may be fused off according to meml3_mask. Each
+	 * bit is a quad that houses 2 Link Copy and two Sub Copy engines.
+	 */
+	for_each_clear_bit(quad, &meml3_mask, GEN12_MAX_MSLICES) {
+		unsigned int instance = quad * 2 + 1;
+		intel_engine_mask_t mask = GENMASK(_BCS(instance + 1),
+						   _BCS(instance));
+
+		if (mask & info->engine_mask) {
+			drm_dbg(&i915->drm, "bcs%u fused off\n", instance);
+			drm_dbg(&i915->drm, "bcs%u fused off\n", instance + 1);
+
+			info->engine_mask &= ~mask;
+		}
+	}
+}
+
 /*
  * Determine which engines are fused off in our particular hardware.
  * Note that we have a catch-22 situation where we need to be able to access
@@ -768,6 +796,7 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 	GEM_BUG_ON(vebox_mask != VEBOX_MASK(gt));
 
 	engine_mask_apply_compute_fuses(gt);
+	engine_mask_apply_copy_fuses(gt);
 
 	return info->engine_mask;
 }
-- 
2.35.1

