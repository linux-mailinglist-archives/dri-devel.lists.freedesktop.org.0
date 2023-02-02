Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C71F687369
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 03:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D356E10E2C5;
	Thu,  2 Feb 2023 02:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3859E10E2C5;
 Thu,  2 Feb 2023 02:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675306375; x=1706842375;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uW0z229tf91qjQEZ/ehiOsk1bYwQ2jFArhf/kKxcZ8Q=;
 b=EdTWOqosEnB9abdKxug9GnIJH9hhNZiheXr+bKe6iHp+PTUIQF8ibjE6
 /zjgJISUoYht9tnQGyvMugnLkuNJMwrYBOdOs2o2HfbTtP3B6seqs58TY
 XCQ6noJuF7zYR6PXCzVVQeGJZcEZVHGn8eUXfUgrSo0QvzQRKVQpa6EmJ
 rrrEL3HnS34Nv6UNBy0tVNGWOINCQthgRDolf4VJ5dU0A8Zai+G6DY3gG
 xss9kgf0FnwBwZEPKCNd0ckNxptTFfBlLI9IcOLgf80SR78aZWECWqdee
 +rirHD3l0DCr1d2vraDNmpmz1QpWq6CESLnLwaLF2nlFECIoIV7TYMzxU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="326987845"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; d="scan'208";a="326987845"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 18:52:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="993905757"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; d="scan'208";a="993905757"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 18:52:54 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/hwmon: Enable PL1 power limit
Date: Wed,  1 Feb 2023 18:52:49 -0800
Message-Id: <20230202025249.905942-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previous documentation suggested that PL1 power limit is always
enabled. However we now find this not to be the case on some
platforms (such as ATSM). Therefore enable PL1 power limit during hwmon
initialization.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 1225bc432f0d5..4683a5b96eff1 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -687,6 +687,11 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 		for_each_gt(gt, i915, i)
 			hwm_energy(&hwmon->ddat_gt[i], &energy);
 	}
+
+	/* Enable PL1 power limit */
+	if (i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
+		hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
+						    PKG_PWR_LIM_1_EN, PKG_PWR_LIM_1_EN);
 }
 
 void i915_hwmon_register(struct drm_i915_private *i915)
-- 
2.38.0

