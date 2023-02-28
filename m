Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235556A5263
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 05:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86A710E471;
	Tue, 28 Feb 2023 04:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE9F10E498;
 Tue, 28 Feb 2023 04:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677559421; x=1709095421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=baEJcjJ9+Z6mhR8/FHD0SvNtVFxCBiSdnZoPBDGgWWU=;
 b=CqBLpEghARoP85VkV4Z32Vl+Izx1nib+sqx22vfncbUs3BC2OBPxEGRK
 i6VbvVyG8B5Z3/U8aQjiv1oe9BneDB4hEh4KUIXMWyJaH9gFzgI97KKdb
 5GLwHe5e05RHous1r/b/dbAIKxBVp4ipfZWlHTjhe2yWzYHTXOOZ8EQ4C
 tbpAHClolv9DvyHFASQC6fQoN60wrh3OCOIToKYyPANjV/H5FCTa0guYL
 cpQS/dQJtni1U8voRamjkCdGVamxUiP05Euwgo4W5gXW4+SI8rKJnHLBN
 +F6yW6JLPchPAYYOi41u1u3ySZs+OQr3NzocK1/476e3iuAKhGNZYIDX0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="332771695"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="332771695"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 20:43:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="667314293"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="667314293"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 20:43:39 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/hwmon: Accept writes of value 0 to
 power1_max_interval
Date: Mon, 27 Feb 2023 20:43:34 -0800
Message-Id: <20230228044334.3630391-1-ashutosh.dixit@intel.com>
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
 Badal Nilawar <badal.nilawar@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The value shown by power1_max_interval in millisec is essentially:
	((1.x * power(2,y)) * 1000) >> 10
Where x and y are read from a HW register. On ATSM, x and y are 0 on
power-up so the value shown is 0.

Writes of 0 to power1_max_interval had previously been disallowed to avoid
computing ilog2(0) but this resulted in the corner-case bug
below. Therefore allow writes of 0 now but special case that write to
x = y = 0.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7754
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 7c20a6f47b92e..596dd2c070106 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -218,11 +218,15 @@ hwm_power1_max_interval_store(struct device *dev,
 	/* val in hw units */
 	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
 	/* Convert to 1.x * power(2,y) */
-	if (!val)
-		return -EINVAL;
-	y = ilog2(val);
-	/* x = (val - (1 << y)) >> (y - 2); */
-	x = (val - (1ul << y)) << x_w >> y;
+	if (!val) {
+		/* Avoid ilog2(0) */
+		y = 0;
+		x = 0;
+	} else {
+		y = ilog2(val);
+		/* x = (val - (1 << y)) >> (y - 2); */
+		x = (val - (1ul << y)) << x_w >> y;
+	}
 
 	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
 
-- 
2.38.0

