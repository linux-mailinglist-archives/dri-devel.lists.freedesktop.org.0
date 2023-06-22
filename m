Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC6273A841
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 20:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A9D10E5A5;
	Thu, 22 Jun 2023 18:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761FF10E5A0;
 Thu, 22 Jun 2023 18:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687458487; x=1718994487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gGSmBZm4ElPK4e6h2HF7hxSWk/W6Y+2f5EQJGNikYlA=;
 b=Yul5WSiR/K5FnmnCCFrGvNkXyjWIvinw024tqm+z1i8yXQXk3zpd+TOs
 8LIJBgPMl/CNBlaSiPymqw/4juEAaZgk2881wpcQ0ybF2qUcjablx3v9y
 sv7gTto5fDJ9hjsnBsi/yYvbQr8ORdU/MZKH2fOg08paI0gh8TFWistyC
 ZBZYyTe4hUb1EYgbjVhk+Ej7329qp3bjYmMd53DeAE/Ya5JCUowxuivBB
 zrMsciTplwXmyGT7Zmv3rw7vPKFh9l52LrVfefLgTAyFN08oMjaMwBvjj
 jdQI4yKJAOGBVi5bVzPc/bUbff+4wdTjZ7skUtBTc2D3cVRkW5+UOLq3Y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="359437779"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="359437779"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 11:27:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="780345387"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="780345387"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 11:27:45 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/gt: Drop read from GEN8_L3CNTLREG in ICL
 workaround
Date: Thu, 22 Jun 2023 11:27:31 -0700
Message-Id: <20230622182731.3765039-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622182731.3765039-1-lucas.demarchi@intel.com>
References: <20230622182731.3765039-1-lucas.demarchi@intel.com>
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
 Matt Roper <matthew.d.roper@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that non-masked registers are already read before programming the
context reads, the additional read became redudant, so remove it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index a013f245a790..7d90fb376e8e 100644
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

