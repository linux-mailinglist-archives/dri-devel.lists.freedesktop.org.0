Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A44D69588E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 06:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47AA10E1F0;
	Tue, 14 Feb 2023 05:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA75E10E0B0;
 Tue, 14 Feb 2023 05:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676352827; x=1707888827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UmwGrPjnRhFzP/OBAjzwoYLe01fRGSOwy7yvhaUNJI4=;
 b=jfp1Mj3STFI7X49TW1DR4pyZs2JWZAm+CYvFuy6kD/VGRVs2vCi7B2Y/
 1yHvCWkmUK9f1CuGrn/FvS2Wfi6WGnCzSUjEDg1+CuOyPlo2Mllw6lBnC
 oBnXm898O+O2wkr6AYWr3xWCu+CIZF2piQ51XpUo+8KbFqydYBq/u8R1Q
 x9zjsknAiezw/gSjDCKmiycuyveh5+Nw2nc0UK/fysselTB+AaJwYCuU2
 COa/CnKn0SQ0/m1I3Jmxzt/qB0o1C8dhgz2excmmmiJjEZM7TQHFXlwxq
 +BYZ1P0WMQ9zNskLFwF1dOstSA4KLDyin6oKAiBv0aS+jaRpEr8FpjNi7 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="358491796"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="358491796"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 21:33:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="669047081"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="669047081"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 21:33:46 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/hwmon: Enable PL1 limit when writing limit value
 to HW
Date: Mon, 13 Feb 2023 21:33:41 -0800
Message-Id: <20230214053342.1952226-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230214053342.1952226-1-ashutosh.dixit@intel.com>
References: <20230214053342.1952226-1-ashutosh.dixit@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, Anshuman Gupta <anshuman.gupta@intel.com>,
 dri-devel@lists.freedesktop.org, gwan-gyeong.mun@intel.com,
 Badal Nilawar <badal.nilawar@intel.com>, Riana Tauro <riana.tauro@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previous documentation suggested that the PL1 power limit is always enabled
in HW. However we now find this not to be the case on some platforms (such
as ATSM). Therefore enable the PL1 power limit (by setting the enable bit)
when writing the PL1 limit value to HW.

Bspec: 51864

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 85195d61f89c7..7c20a6f47b92e 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -385,10 +385,11 @@ hwm_power_max_write(struct hwm_drvdata *ddat, long val)
 
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
 	nval = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_power, SF_POWER);
+	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
 
 	hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
-					    PKG_PWR_LIM_1,
-					    REG_FIELD_PREP(PKG_PWR_LIM_1, nval));
+					    PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1,
+					    nval);
 	return 0;
 }
 
-- 
2.38.0

