Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD65643A98
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 02:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F5A10E2DB;
	Tue,  6 Dec 2022 01:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A584810E2E1;
 Tue,  6 Dec 2022 01:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670289325; x=1701825325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bgrbJsm9g7IrbAOBeVSAn6lKw5+isSFPshYyDiVkzrM=;
 b=U1Wlx+eXZeuOmj4pAjvrwt4GElmG/z/41CD55K3lYgsVfAZM/3caKT9h
 SuVRvc3MXgSeVDPo8i3gIQP6uh4MliAYOj4w+MB8sfWOl2tmO4iR4IsYc
 Ha0IJ5rexA0DoYYnU5+fV3/cfBEs2fRuTJm4H9XOpfwzEIpy2woMrEOfl
 eMnKXoyLj1cpb4RrEXgG9xlDLb4+FIyTsjzoKA6WwzOnob7451Z51WolO
 5mb2NaKMvw3Y8HFM990UM0rU7gtaOREZ4flFYdFyvEbK65nDfitf0IpGR
 AkfOXjjSIIFN5BGKul1EWlW/fGXREKLMisBDfKe/TdYb4b6gAS0/MRPue Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="317650473"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="317650473"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 17:15:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="974890722"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="974890722"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 17:15:25 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 5/6] drm/i915/gsc: Disable GSC engine and power well if FW
 is not selected
Date: Mon,  5 Dec 2022 17:19:07 -0800
Message-Id: <20221206011908.2745508-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221206011908.2745508-1-daniele.ceraolospurio@intel.com>
References: <20221206011908.2745508-1-daniele.ceraolospurio@intel.com>
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
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John C Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jonathan Cavitt <jonathan.cavitt@intel.com>

The GSC CS is only used for communicating with the GSC FW, so no need to
initialize it if we're not going to use the FW. If we're not using
neither the engine nor the microcontoller, then we can also disable the
power well.

IMPORTANT: lack of GSC FW breaks media C6 due to opposing requirements
between CS setup and forcewake idleness. See in-code comment for detail.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: John C Harrison <John.C.Harrison@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 18 ++++++++++++++++++
 drivers/gpu/drm/i915/intel_uncore.c       |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index c33e0d72d670..99c4b866addd 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -894,6 +894,24 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 	engine_mask_apply_compute_fuses(gt);
 	engine_mask_apply_copy_fuses(gt);
 
+	/*
+	 * The only use of the GSC CS is to load and communicate with the GSC
+	 * FW, so we have no use for it if we don't have the FW.
+	 *
+	 * IMPORTANT: in cases where we don't have the GSC FW, we have a
+	 * catch-22 situation that breaks media C6 due to 2 requirements:
+	 * 1) once turned on, the GSC power well will not go to sleep unless the
+	 *    GSC FW is loaded.
+	 * 2) to enable idling (which is required for media C6) we need to
+	 *    initialize the IDLE_MSG register for the GSC CS and do at least 1
+	 *    submission, which will wake up the GSC power well.
+	 */
+	if (__HAS_ENGINE(info->engine_mask, GSC0) && !intel_uc_wants_gsc_uc(&gt->uc)) {
+		drm_notice(&gt->i915->drm,
+			   "No GSC FW selected, disabling GSC CS and media C6\n");
+		info->engine_mask &= ~BIT(GSC0);
+	}
+
 	return info->engine_mask;
 }
 
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 3bfb4af0df78..cb45e4a4ace4 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2701,6 +2701,9 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
 		if (fw_domains & BIT(domain_id))
 			fw_domain_fini(uncore, domain_id);
 	}
+
+	if ((fw_domains & BIT(FW_DOMAIN_ID_GSC)) && !HAS_ENGINE(gt, GSC0))
+		fw_domain_fini(uncore, FW_DOMAIN_ID_GSC);
 }
 
 /*
-- 
2.37.3

