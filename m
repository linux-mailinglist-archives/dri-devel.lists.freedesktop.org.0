Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB186EB196
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 20:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A90F10EEB8;
	Fri, 21 Apr 2023 18:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0D510EEB5;
 Fri, 21 Apr 2023 18:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682101578; x=1713637578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AXWGZZ6zBKOPvb7eg/A0U+T496YlNxQ5QoHD0SqsiZQ=;
 b=EHphwoqYE0j51HXfmBK+JAS2QuJ2PEzSe0JYCE5TcS4EjT0WKv7r6UmF
 LjvCWFbLBy6U1oEUyt8XjWS5Kgm+Dmznn5UN2RnpQFlCW1lwuETCWJ8In
 pafxZjJSef/X8K+jhZiO8vpND/M1duFH4W2j6mToynoESBLCwfdj0yB+m
 xrCsvbFBLmX3soHC+lgGADTxTyyAoYjDz0Lxo196m7pMb1XOAJyjSAkBk
 wKVrJl3B3crE1V1HC5hxu9vqgO776NFmIWL2MESKuYnAFla4pKDoYLrmj
 XU1/0GvbSyZN59GxbMwfaooFwsmCQs/Xw0ZtrW5/NjD2+uaztxGlGL3NG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="346072208"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="346072208"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 11:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="756983851"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="756983851"
Received: from ameghere-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.194])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 11:26:12 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>, Fei Yang <fei.yang@intel.com>
Subject: [PATCH v2 2/2] drm/i915/mtl: fix mocs selftest
Date: Fri, 21 Apr 2023 20:25:35 +0200
Message-Id: <20230421182535.292670-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421182535.292670-1-andi.shyti@linux.intel.com>
References: <20230421182535.292670-1-andi.shyti@linux.intel.com>
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Lucas Martins De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

Media GT has a different base for MOCS register, need to apply
gsi_offset to the mmio address if not using the intel_uncore_r/w
functions for register access.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_mocs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
index ca009a6a13bdb..a8446ab825012 100644
--- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
@@ -131,13 +131,14 @@ static int read_mocs_table(struct i915_request *rq,
 			   const struct drm_i915_mocs_table *table,
 			   u32 *offset)
 {
+	struct intel_gt *gt = rq->engine->gt;
 	u32 addr;
 
 	if (!table)
 		return 0;
 
 	if (HAS_GLOBAL_MOCS_REGISTERS(rq->engine->i915))
-		addr = global_mocs_offset();
+		addr = global_mocs_offset() + gt->uncore->gsi_offset;
 	else
 		addr = mocs_offset(rq->engine);
 
-- 
2.40.0

