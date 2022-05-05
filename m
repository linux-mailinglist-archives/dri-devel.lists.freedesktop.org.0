Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D72451CB5E
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB57F10EC7D;
	Thu,  5 May 2022 21:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EE410E24A;
 Thu,  5 May 2022 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651786702; x=1683322702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8yV0j1eu2Yc6vkn3Udf0Jhy0+YiBZBmraGKCzN/bw4c=;
 b=UoFMMr/pe+wuS4mA1b2vfBmUlLczjXZ9ZtyQU+Te9RrTP3B9v37mTwwr
 nrs+RA2mbHKb97wne/ca//uo983K7pDsTjEDAQ7hPlSBlB0iLX/vJEDM9
 3oMWlCm0lb02t4jEFX6uy6tOJsYGtqxE9GTZ74SK3xwrRdfjXZ432Mw2A
 xBZp6oSPrT6e5H2yJAKWTznFaaEFdq/CEwks5KpRpfkN0sfOePDExaBzm
 xKON27r1uWujsQGqY6FrEc5poornQ/m6SjE30BDe8qVm22Wbu951KVmXC
 eW8wIAuPFVryeb9OlnobBiupSEVkAspElBnWyMB9/96V2KWd4vb2+QCuj Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248166061"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="248166061"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="549553264"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 04/12] drm/i915/pvc: Read correct RP_STATE_CAP register
Date: Thu,  5 May 2022 14:38:04 -0700
Message-Id: <20220505213812.3979301-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505213812.3979301-1-matthew.d.roper@intel.com>
References: <20220505213812.3979301-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SoC registers, including RP_STATE_CAP, have moved to a new location
in GTTMMADR on Ponte Vecchio.  We need to update the register offset
accordingly.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 4 +++-
 drivers/gpu/drm/i915/i915_reg.h     | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 3476a11f294c..3bd8415a0f1b 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1075,7 +1075,9 @@ static u32 intel_rps_read_state_cap(struct intel_rps *rps)
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 	struct intel_uncore *uncore = rps_to_uncore(rps);
 
-	if (IS_XEHPSDV(i915))
+	if (IS_PONTEVECCHIO(i915))
+		return intel_uncore_read(uncore, PVC_RP_STATE_CAP);
+	else if (IS_XEHPSDV(i915))
 		return intel_uncore_read(uncore, XEHPSDV_RP_STATE_CAP);
 	else if (IS_GEN9_LP(i915))
 		return intel_uncore_read(uncore, BXT_RP_STATE_CAP);
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 9ccb67eec1bd..4a3d7b96ef43 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1846,6 +1846,7 @@
 #define BXT_RP_STATE_CAP        _MMIO(0x138170)
 #define GEN9_RP_STATE_LIMITS	_MMIO(0x138148)
 #define XEHPSDV_RP_STATE_CAP	_MMIO(0x250014)
+#define PVC_RP_STATE_CAP	_MMIO(0x281014)
 
 #define GT0_PERF_LIMIT_REASONS		_MMIO(0x1381a8)
 #define   GT0_PERF_LIMIT_REASONS_MASK	0xde3
-- 
2.35.1

