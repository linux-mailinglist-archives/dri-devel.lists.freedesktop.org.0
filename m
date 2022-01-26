Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A2C49D3AB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D25310E94B;
	Wed, 26 Jan 2022 20:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EFA10E705;
 Wed, 26 Jan 2022 20:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643229387; x=1674765387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5kSZoar6nlEfqZa5tDaufHgc1xCfnJq/vZPkOM+Iu0k=;
 b=cH/pnI9UyaKoX82ht4fRnLN69Th4XjTdNPpPSNay4WNWT8woPzeZ10tE
 0ZJmtd1u23ecoDG+TEuSQIggk+OcmCmZH3Uf5O2tk4h19yBg+c5fwHUHv
 kw95sdLW7//uqCivg2zsBvuY9paTbzAaFArcfj+zHhd8gfT/bH2ttcRo+
 Z2iZnEizg1HWtd0qdbfHpLhzFwIEH1ZOOq0gl9nsj9O1Agl/9w/ve1XEP
 9Af19jiKJfXJrRKb34y/bgVH1/EYZszeOLFRXKUdXcVV5smc/z06iakI1
 luskz4wpASVxWl5lf5GUQo3meLOdXWa4yXyjrzGYw1PpumURByfS1s59E Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333000512"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333000512"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="581221528"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 12/19] drm/i915/guc: Replace check for golden context size
Date: Wed, 26 Jan 2022 12:36:55 -0800
Message-Id: <20220126203702.1784589-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220126203702.1784589-1-lucas.demarchi@intel.com>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the other places in this function, guc->ads_map is being protected
from access when it's not yet set. However the last check is actually
about guc->ads_golden_ctxt_size been set before.  These checks should
always match as the size is initialized on the first call to
guc_prep_golden_context(), but it's clearer if we have a single return
and check for guc->ads_golden_ctxt_size.

This is just a readability improvement, no change in behavior.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index dd9ec47eed16..8e4768289792 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -461,10 +461,10 @@ static int guc_prep_golden_context(struct intel_guc *guc)
 		addr_ggtt += alloc_size;
 	}
 
-	if (dma_buf_map_is_null(&guc->ads_map))
-		return total_size;
+	/* Make sure current size matches what we calculated previously */
+	if (guc->ads_golden_ctxt_size)
+		GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
 
-	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
 	return total_size;
 }
 
-- 
2.35.0

