Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD88D689E8A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 16:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4774B10E7ED;
	Fri,  3 Feb 2023 15:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8592010E7ED;
 Fri,  3 Feb 2023 15:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675439653; x=1706975653;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tI/lvEIUjklskP31NFna3SiKvQVYHWgixX1v1UFK9H4=;
 b=X3xGQ5lVpTZd3BDTqjLmzFZONwHd8fUdY/8RRXzEo5AXsOUuyNrnVuoX
 2A1JfrgYnneXIDfO1VYNzzRsCefbzPNlpA5ksZc4EjJTqr2nTk2487sBp
 nEYcS6hpPXZ8BDpvq/WZ/e8n2ZLO39yq5Wgh0it87ZjC+4ZGPHkMfOxZM
 uXKrSUV6v6VEllOlkdVPa9vU9pfp+djbNFlzQqgJiRpmC9pvC0mfP5GvR
 wB+UP1JT3YlxYXsYvg/F/UMlDROkXeGU7DOroJeroVs1IxLkZWljvy3S9
 9kkpk9hthnV4dVnIFdh0c2RoHnhyBDnb0qK7tkkIJmo6k3GVVjnz8qVJy A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="393367291"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="393367291"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 07:53:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="696197465"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="696197465"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 07:53:13 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/hwmon: Enable PL1 power limit
Date: Fri,  3 Feb 2023 07:53:09 -0800
Message-Id: <20230203155309.1042297-1-ashutosh.dixit@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previous documentation suggested that PL1 power limit is always
enabled. However we now find this not to be the case on some
platforms (such as ATSM). Therefore enable PL1 power limit during hwmon
initialization.

Bspec: 51864

v2: Add Bspec reference (Gwan-gyeong)
v3: Add Fixes tag

Fixes: 99f55efb79114 ("drm/i915/hwmon: Power PL1 limit and TDP setting")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
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

