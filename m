Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AAC744340
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D8710E4EB;
	Fri, 30 Jun 2023 20:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EABD10E4E2;
 Fri, 30 Jun 2023 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688157332; x=1719693332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n1h3n/g1kHN4DndS8Sj2FI3KUmIxNNgPONk09gPI3Ac=;
 b=RZ9DkIXmnH6kBdjo3q+AwnEvtd+tJ8FpRLDbaWcQjC2A56DsUn9JxwI4
 tSLUnZIY78cZsZLMbxRRb5Wx5eWGGXwVcLa3QcDuxmy2v6gpyjUe0G1WJ
 fzcG5kWUJYUzbjbRQRhPOPN9qXqkAYPBm8f1jt618ZoQgV/eSNhLW+vw9
 g1jJxstAVFOu9w435xrcwuO3nl1Vrih+3f2Df3psXn/SmCI3TM0fAmnVU
 HWx/Z3gCPlrJccNDNDZOQC1AMzlyUadISQ+O1ZArYNBUtFfY1XepAp+NH
 /Y73IywIeQU0daGiWhEqYOi0XbL8ZHCCO26PJ+o4cEcBIaAcRZDfhv4uQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="393213917"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="393213917"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 13:35:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="807904261"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="807904261"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 13:35:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 5/7] drm/i915/gt: Enable read back on XEHP_FF_MODE2
Date: Fri, 30 Jun 2023 13:35:07 -0700
Message-Id: <20230630203509.1635216-6-lucas.demarchi@intel.com>
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

Contrary to GEN12_FF_MODE2, platforms using XEHP_FF_MODE2 are not
affected by Wa_1608008084, hence read back can be enabled.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Kenneth Graunke <kenneth@whitecape.org>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index b07f84c3fa21..e2025c363949 100644
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

