Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E6F75BAFE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 01:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84B710E1C8;
	Thu, 20 Jul 2023 23:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1E810E1C4;
 Thu, 20 Jul 2023 23:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689894318; x=1721430318;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/f5SRw1wJ5gxlvFCkv9vZMs/K3hYOn3PluhojMmTGbI=;
 b=WdVKoI/p9kCVVLZHuyoAwlOZ1QgNlOYlvSTMGPt95+xr/RmedzHpYheN
 fwXm+RNBnO87YFV3apewa/ZaLwTPnQ3kMEgZqeCezJoxS5J/wbPpJKzrT
 pJ8nTVC7RRfya2qWsMJykO7gpcAR0Dav9GQKjIIWBcGjJeC7Gw4AZFg+K
 ii6zPZl7fRr53MBpVRDFgcLXm1BKgZJI8+BIBU2fo8OIEXUYR7+dQbHYU
 w5eypIiqODIaFaLBBJ1xa9hHI1mia7Uton2FgkrpA++OU0HNnscZH6kCo
 7VbyvC89qLLOyxEx6M5SWHyIwOjlWzAQqJ6yqMxvUxlBlo0o8scb9ffe5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433108630"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="433108630"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 16:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="701832106"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="701832106"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 16:05:17 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/huc: silence injected failure in the load via GSC
 path
Date: Thu, 20 Jul 2023 16:05:05 -0700
Message-ID: <20230720230505.224659-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
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

If we can't load the HuC due to an injected failure, we don't want
to throw and error and trip CI. Using the gt_probe_error macro for
logging ensure that the error is only printed if it wasn't explicitly
injected.

Link: https://gitlab.freedesktop.org/drm/intel/-/issues/7061
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index 1ce07d7e8769..88215b5efe72 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -9,6 +9,7 @@
 #include <drm/i915_component.h>
 
 #include "gem/i915_gem_lmem.h"
+#include "gt/intel_gt_print.h"
 
 #include "i915_drv.h"
 
@@ -174,7 +175,7 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
 			/* load huc via pxp */
 			ret = intel_huc_fw_load_and_auth_via_gsc(&uc->huc);
 			if (ret < 0)
-				drm_err(&i915->drm, "failed to load huc via gsc %d\n", ret);
+				gt_probe_error(pxp->ctrl_gt, "failed to load huc via gsc %d\n", ret);
 		}
 	}
 
-- 
2.41.0

