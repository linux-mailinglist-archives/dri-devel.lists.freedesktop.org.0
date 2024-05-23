Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCEF8CDDD7
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 01:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A9510F5BF;
	Thu, 23 May 2024 23:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnSO+x1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FF610F5BC;
 Thu, 23 May 2024 23:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716508748; x=1748044748;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bhx0bySx4hwOfsnD3E/UaYeTsUSPU11jGU8DRq6SVec=;
 b=BnSO+x1FW1rKGAbs79KYC4JajauNu7IyQyYOOie+UYX8nTKPeXKIqYSA
 24jpDJ1wF+D1aZBD7pJzcXpKjcunE/A3C5YPVHujvt5BoSjmLTDInRSUl
 DJruZrSN+4/RY+bwz+BImyZnz+ViNDCc4wmfVlEpnZHYMX+sj19JUiAfe
 ks3+1mJeBjfsC4IzY3wGd8Mvv3O17RjZknBteg1vYF84zSQlC77aXxBqN
 JruSLLoXNMWq0ehYqnulVqZxUbuMVwo29wFCITknNuepQD+EQlFeXLO6b
 4e5DkZ60wO7L+FC9roa/kRj0Rc7uSi1xeEEBp+0j/NsuUZmQibXO4QXqA A==;
X-CSE-ConnectionGUID: 177ogQ0uS+en5UNXWVTevQ==
X-CSE-MsgGUID: aPTolw2FTxieYdtyg8+QPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12695123"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="12695123"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 16:59:07 -0700
X-CSE-ConnectionGUID: qr773CKuRjapYpP1URQa/A==
X-CSE-MsgGUID: V3OIqiQxR4OkixesWdGQUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33920643"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.206])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 16:59:05 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2] drm/i915: Increase FLR timeout from 3s to 9s
Date: Fri, 24 May 2024 01:58:53 +0200
Message-ID: <20240523235853.171796-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following the guidelines it takes 3 seconds to perform an FLR
reset. Let's give it a bit more slack because this time can
change depending on the platform and on the firmware

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
Hi,

In this second version I removed patch 2 that was ignoring the
FLR reset timeouts, until we develop a proper patch.

This first patch is basically the same as v1. Thanks Nirmoy for
your review.

Andi

 drivers/gpu/drm/i915/intel_uncore.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 729409a4bada..2eba289d88ad 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2614,11 +2614,18 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
 static void driver_initiated_flr(struct intel_uncore *uncore)
 {
 	struct drm_i915_private *i915 = uncore->i915;
-	const unsigned int flr_timeout_ms = 3000; /* specs recommend a 3s wait */
+	unsigned int flr_timeout_ms;
 	int ret;
 
 	drm_dbg(&i915->drm, "Triggering Driver-FLR\n");
 
+	/*
+	 * The specification recommends a 3 seconds FLR reset timeout. To be
+	 * cautious, we will extend this to 9 seconds, three times the specified
+	 * timeout.
+	 */
+	flr_timeout_ms = 9000;
+
 	/*
 	 * Make sure any pending FLR requests have cleared by waiting for the
 	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
-- 
2.45.1

