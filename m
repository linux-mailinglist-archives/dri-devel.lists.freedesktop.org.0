Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF28510D2B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 02:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5B610ED31;
	Wed, 27 Apr 2022 00:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED6C10ECAE;
 Wed, 27 Apr 2022 00:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651019197; x=1682555197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lj5EEEgJrE1Ey3LYhwrYg2cSsvNeYBOUeIVQV/GF7gg=;
 b=mjGzkYXv0K2MTgJxwL46AkBia2xPzfHcp1qIfM8caBw85egfU15ME9oB
 iP8AdewiTaLcdyaOzyQ/TKzFmAmEKcVDIS5IUEMvFiQPcplFGOiuu5gcD
 ZQHsrF231UKPQC+3cH/zcDPbenlUorwTdIqxbkpwK2GTsUC5OUXEOsbjo
 zch/cp6sydACkWkm8jOg8LxXgIC1/ZAveTN3nQEKxIg5M4jzLGJbXu14q
 AgE810t8cLNd0i6WxPe2cL3OItMw/Iwn6WihCF6uP7Ib2lo6pz0S5OiCv
 kuZ+mKI/iZ3cBKT3MgF83oKBOCN6cOt/KiDJMEtUI4R2Z3igZdvbFp52S Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="247695774"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="247695774"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 17:26:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="730524684"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 17:26:36 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/huc: Don't fail the probe if HuC init fails
Date: Tue, 26 Apr 2022 17:26:17 -0700
Message-Id: <20220427002617.1767295-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427002617.1767295-1-daniele.ceraolospurio@intel.com>
References: <20220427002617.1767295-1-daniele.ceraolospurio@intel.com>
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
 dri-devel@lists.freedesktop.org
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
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c  | 11 ++---------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 76a7df7f136fc..3d2e7a6d7c1b7 100644
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

