Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CD8744339
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD70310E4D8;
	Fri, 30 Jun 2023 20:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3D010E193;
 Fri, 30 Jun 2023 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688157332; x=1719693332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R4J5T660X5S0N5SIGEiy7XRtb/az+Hd1jUhoI/NuBMw=;
 b=CDMRFvS8+emHuHlEP701A26OoKEg2OsmY1mtcDkmBACvy8zglYS/eeQr
 Du6cCsCYpXXdWdDNl9mBaPG2tprKw5YAAFiG7Qbrb+Zn6kpmH3Nrpf9J3
 oz1Sh0iLWLI+dQX41+k4LJFAWOQZ2kBWzIwg8B9XGPvd7QGVlk/EHyjVQ
 kh8HYJauVQAVES8LCQboiGluoCWowWdO/3zGcAAvzr7WVobb5rDHzkJNb
 HpskeK5RQkEhwrNi9GzQ40hxB+wASeq5TyrELo3vYei4slEZrRQjO9m++
 1nm+CtNA7MmRUT8SBL8Qe3tu9CGM/XX4JfDWihEjmKTSY44C4FAI7gwMt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="393213914"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="393213914"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 13:35:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="807904256"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="807904256"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 13:35:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 4/7] drm/i915/gt: Drop read from GEN8_L3CNTLREG in ICL
 workaround
Date: Fri, 30 Jun 2023 13:35:06 -0700
Message-Id: <20230630203509.1635216-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230630203509.1635216-1-lucas.demarchi@intel.com>
References: <20230630203509.1635216-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that non-masked registers are already read before programming the
context reads, the additional read became redudant, so remove it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Kenneth Graunke <kenneth@whitecape.org>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 0a9c3be4817c..b07f84c3fa21 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -637,10 +637,7 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
 				     struct i915_wa_list *wal)
 {
 	/* Wa_1406697149 (WaDisableBankHangMode:icl) */
-	wa_write(wal,
-		 GEN8_L3CNTLREG,
-		 intel_uncore_read(engine->uncore, GEN8_L3CNTLREG) |
-		 GEN8_ERRDETBCTRL);
+	wa_write(wal, GEN8_L3CNTLREG, GEN8_ERRDETBCTRL);
 
 	/* WaForceEnableNonCoherent:icl
 	 * This is not the same workaround as in early Gen9 platforms, where
-- 
2.40.1

