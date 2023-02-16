Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAEC699A94
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 17:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D26A10EE20;
	Thu, 16 Feb 2023 16:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5071310EE13;
 Thu, 16 Feb 2023 16:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676566381; x=1708102381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qeLDDJ7AghdjK7aE5kixMFDGXs0hb6Ovtv9Mj14GC0c=;
 b=JgHXT/UCJGk4UfePv0gcTW8J3tbUuxpTj0ihAjISGoeLhLO8hqAVRWsX
 KzqwUgPTC35xJx0fR3Io31pZSuGobaWHiebGv/z2JHVuP5Z+y4rT4XExP
 3eLX0RvtjI67bZSaq+VfIoiEPGlilyNVxvnZ7bpwaMDSmueXf+wjjEZW9
 T3vi2frOyZoCFW4uhHLGwb3vHFsg5aDRBBjdljIV1J5HzfyTV/dUUJLSS
 hjtEzYPU1fUs6qB3VpMuNLev31CNXVSfZJMfc4o8NkxOW7MOm3DOS1hJg
 gcbxqDHLC29HuN5CfSs8XLDDd6oRHfSCWrM9IArp5iZGGXFHuLuRWRxmL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333961935"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="333961935"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 08:49:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="915738627"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="915738627"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 08:49:48 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/hwmon: Enable PL1 limit when writing limit value
 to HW
Date: Thu, 16 Feb 2023 08:49:44 -0800
Message-Id: <20230216164944.2366150-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230216164944.2366150-1-ashutosh.dixit@intel.com>
References: <20230216164944.2366150-1-ashutosh.dixit@intel.com>
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

Previous documentation suggested that the PL1 power limit is always enabled
in HW. However we now find this not to be the case on some platforms (such
as ATSM). Therefore enable the PL1 power limit (by setting the enable bit)
when writing the PL1 limit value to HW.

Bspec: 51864

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

