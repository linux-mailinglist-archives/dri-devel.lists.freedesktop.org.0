Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D6A51AFB6
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 22:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816F410E9C5;
	Wed,  4 May 2022 20:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59F110E722;
 Wed,  4 May 2022 20:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651697312; x=1683233312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zCQ2iCX/sVnu4HHGRJ0ht9P+lnCysKtqVz+IpbQvRRg=;
 b=T4WHAEUvIgOYo53jn2R1PyDacBbBjX7smwxkWp9k+7/31p3nHPRo/pzS
 ggZHtCWIFN/ZI0fIf9siiytoSWbOfJeSCYSopha3OOFW96ST1CHNm14G2
 SvIfAUktDiMG1OhQuroW+E6TII0hMqaQcT2WUtIwX8hQ4/TmDqM3lZG4Q
 fHmBZ1LK4HOxIPvrb501d+CAVO2N+aL3LrJnbLXJFF3R5HqcYbIrpYuHJ
 JJHCSrFLw0goSf4z+x5Exsmm8SCDrVN4UhesVF3vmnGlpS+ZpDCeAgebA
 qQIgI2tWeg7gNFpc8Nr6od+JG1i1+ZA1qzArdXZegJ4ZrV3e+CEr9dY+Y A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="267489095"
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="267489095"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 13:48:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="811292784"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 13:48:32 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/i915/huc: Don't fail the probe if HuC init fails
Date: Wed,  4 May 2022 13:48:16 -0700
Message-Id: <20220504204816.2082588-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504204816.2082588-1-daniele.ceraolospurio@intel.com>
References: <20220504204816.2082588-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previous patch introduced new failure cases in the HuC init flow
that can be hit by simply changing the config, so we want to avoid
failing the probe in those scenarios. HuC load failure is already
considered a non-fatal error and we have a way to report to userspace
if the HuC is not available via a dedicated getparam, so no changes
in expectation there.
The error message in the HuC init code has also been lowered to info to
avoid throwing error message for an expected behavior.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c  | 11 ++---------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index c36e2bf9b0f29..3bb8838e325a4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -113,7 +113,7 @@ int intel_huc_init(struct intel_huc *huc)
 	return 0;
 
 out:
-	i915_probe_error(i915, "failed with %d\n", err);
+	drm_info(&i915->drm, "HuC init failed with %d\n", err);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 0dce94f896a8c..ecf149c5fdb02 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -323,17 +323,10 @@ static int __uc_init(struct intel_uc *uc)
 	if (ret)
 		return ret;
 
-	if (intel_uc_uses_huc(uc)) {
-		ret = intel_huc_init(huc);
-		if (ret)
-			goto out_guc;
-	}
+	if (intel_uc_uses_huc(uc))
+		intel_huc_init(huc);
 
 	return 0;
-
-out_guc:
-	intel_guc_fini(guc);
-	return ret;
 }
 
 static void __uc_fini(struct intel_uc *uc)
-- 
2.25.1

