Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0260F73CC02
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 19:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ED010E134;
	Sat, 24 Jun 2023 17:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9AF10E07D;
 Sat, 24 Jun 2023 17:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687627080; x=1719163080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EnzMAs93HE4/VbPPBqLe1SLEbsU1YIjB3MLZiLNtOu8=;
 b=NpqemAqfAjpVLkGD88tnDWvoJJRW6g3iGX4fQ/l6RuRoOWAa+PshnEnI
 RcWkQ7lS8IrSuZq/gBVSQdlaCiHGEpOVJa2OnARYePA4btzfy8s1lnXnA
 hmWLHCxvwPFRWbTK0AIrcfPFafLjNfKOmMw61jRflmIICCa26huNtKuRN
 VvXXn1x/iaNmVPl1YK5vZt3pFJQhZj9d3qxy6dDDwfqLiHDaU2TV+RE9p
 r0JrFYnyb1Ml4/PtI+4YmIhNGdCfBGXbBnpCJ26Vn/VRUOMYLcjOCSwpO
 A1hAPqqyxb3el+Em5m+20/7b6lyAfC0PixPCdVkvo+Yhfqzi/Ff10yKiS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="340557474"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; d="scan'208";a="340557474"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2023 10:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="1045977424"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; d="scan'208";a="1045977424"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2023 10:17:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/6] drm/i915/gt: Drop read from GEN8_L3CNTLREG in ICL
 workaround
Date: Sat, 24 Jun 2023 10:17:55 -0700
Message-Id: <20230624171757.3906095-5-lucas.demarchi@intel.com>
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

Now that non-masked registers are already read before programming the
context reads, the additional read became redudant, so remove it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Kenneth Graunke <kenneth@whitecape.org>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 9291c2b4ca0e..8ec3d14dcb08 100644
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

