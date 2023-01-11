Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E64926665C5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 22:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B87310E82D;
	Wed, 11 Jan 2023 21:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF4D10E15C;
 Wed, 11 Jan 2023 21:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673473351; x=1705009351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ynOfPpxf3NG2KNI2l03MKyf13JpykPsGMmGRVNuWd78=;
 b=TPKjEEv1d6Rn0d2JHWcv3PDcrQ3//CKbQ0/HAQ5LY1J2y7dmdum6LUpI
 5wPj6nE3pm2mAK/WrupLicsI+k/ddK1hkH5HDqo21HPhAn8k94Cfj7gbe
 tOP1P1n3vMUjaWDYW66x3igbUSpr18CaWKtbNnIU9aC9/Wjq3+yct6qa7
 5utmFkP3Es8ofJMUwRQQX2NL+wGwb2w1r5P+SocSj/Q/T36yVdEuhMibX
 XnfzzaZR/kL5N+Hsf7ntvyf+VEAneZqYPSlEdiew1TvihHgY3Te6UPzl1
 Gw2HGWnZpF+Z/MeXKXsPFy89fE5q4CQw2h6KK9R4aluP4hnBUoR1X2bUR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="322244758"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="322244758"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 13:42:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607530444"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="607530444"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga003.jf.intel.com with ESMTP; 11 Jan 2023 13:42:30 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 9/9] drm/i915/pxp: Enable PXP with MTL-GSC-CS
Date: Wed, 11 Jan 2023 13:42:26 -0800
Message-Id: <20230111214226.907536-10-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
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
Cc: Juston Li <justonli@chromium.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable PXP with MTL-GSC-CS: add the has_pxp into device info
and increase the timeouts for new GSC-CS + firmware specs.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c              | 1 +
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index bc1af7e8f398..0cac8cce1f7b 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1148,6 +1148,7 @@ static const struct intel_device_info mtl_info = {
 	.has_guc_deprivilege = 1,
 	.has_mslice_steering = 0,
 	.has_snoop = 1,
+	.has_pxp = 1,
 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
 	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
 	.require_force_probe = 1,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index 7bb06e67b155..e4e60e3b9216 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -56,7 +56,7 @@ static int pxp_wait_for_session_state(struct intel_pxp *pxp, u32 id, bool in_pla
 				      reg,
 				      mask,
 				      in_play ? mask : 0,
-				      100);
+				      250);
 
 	intel_runtime_pm_put(uncore->rpm, wakeref);
 
-- 
2.39.0

