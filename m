Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2E773CC00
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 19:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D225410E133;
	Sat, 24 Jun 2023 17:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C6F10E056;
 Sat, 24 Jun 2023 17:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687627080; x=1719163080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pAYoh1LVoLdb5D8B77xFqwkY1qGH/zC9UKyHXrH/2y4=;
 b=bw/eRyITph3/3LThr0Wn5sh0O4BxGpZl4UYjxaWjQ0yLR79V3+dt/Ff0
 0Tprd2EY6j+C2/EfphQHH+3b/nibTRjtFLSaXtUw4dyUNcsHv9/1oJlMP
 Ji8NzNXdSYLWbvQR2MgwdU5PovaRaoLsjkgU0lhluH4LE6xqhNo6lgq2M
 MPLMs2M/b5WKWHL2059om1yo+W4y7tfpZwsPE7bDgWj0/LmellkuQTDZx
 3I3DH5Z2wZ3E0EojcGvEIXA8K2445wFDKzdsTGKWxu5WcJ9CPPhl7+D4W
 JbcegJ52R0qxSScjfHn4/XAB/QEMuDfYsL6tU4FY1UDcNuxIXU540ta6G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="340557476"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; d="scan'208";a="340557476"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2023 10:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="1045977427"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; d="scan'208";a="1045977427"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2023 10:17:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 5/6] drm/i915/gt: Enable read back on XEHP_FF_MODE2
Date: Sat, 24 Jun 2023 10:17:56 -0700
Message-Id: <20230624171757.3906095-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230624171757.3906095-1-lucas.demarchi@intel.com>
References: <20230624171757.3906095-1-lucas.demarchi@intel.com>
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

Contrary to GEN12_FF_MODE2, platforms using XEHP_FF_MODE2 are not
affected by Wa_1608008084, hence read back can be enabled.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 8ec3d14dcb08..848519b58e45 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -683,11 +683,8 @@ static void dg2_ctx_gt_tuning_init(struct intel_engine_cs *engine,
 	wa_mcr_masked_en(wal, CHICKEN_RASTER_2, TBIMR_FAST_CLIP);
 	wa_mcr_write_clr_set(wal, XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 			     REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f));
-	wa_mcr_add(wal,
-		   XEHP_FF_MODE2,
-		   FF_MODE2_TDS_TIMER_MASK,
-		   FF_MODE2_TDS_TIMER_128,
-		   0, false);
+	wa_mcr_write_clr_set(wal, XEHP_FF_MODE2, FF_MODE2_TDS_TIMER_MASK,
+			     FF_MODE2_TDS_TIMER_128);
 }
 
 static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
-- 
2.40.1

