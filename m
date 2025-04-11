Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5F5A85289
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 06:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078FB10EACA;
	Fri, 11 Apr 2025 04:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9z3f1QA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D46410EAC8;
 Fri, 11 Apr 2025 04:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744345754; x=1775881754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=60JvWY1m2xvrwXP/Zrx3Gq88uih8rmFiEAfVzm8gqjk=;
 b=C9z3f1QAoF6wYFnUzyRRZClNg4k3JE1MLlYbBHRSaAg705tfvQ71TVcl
 BmEtkNYGyCXu9SqBDZt4zHmGvKhs+bNsTgO6Ent1BKSpUblbcHjis+nmg
 o80r8SM1gpevkgUszaF5Hg27CFbENowc+1ZXOiZZentp+GVeZDWbXpSrE
 Dd3fJxYFgSeHETygLTBL9mb438DC4yeaccq6tEgMj8oZDEKL4POV0yz4W
 rncsmCYLWx+g4kA+KPOsxv24Dc8VFeOt986ufhSnONWCEIqBzz1gZBwun
 d12xONWVLkLNw4jpFObg+trb1JevG6PvWCbnO/Kwn6AtANDrTv+1sxro3 A==;
X-CSE-ConnectionGUID: Mpc1TDseS0mfvNpv4hs1xA==
X-CSE-MsgGUID: /j6VZYBLQ3Gu53gjMD8DYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57259927"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="57259927"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 21:29:13 -0700
X-CSE-ConnectionGUID: nvDvERCwRSmtWCGEzO+mWg==
X-CSE-MsgGUID: gq2okXnTR7SwLVQI8Npf4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="160057026"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 10 Apr 2025 21:29:11 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 04/13] drm/dp: Move from u16 to u32 for max in
 drm_edp_backlight_info
Date: Fri, 11 Apr 2025 09:59:00 +0530
Message-Id: <20250411042909.2626807-5-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411042909.2626807-1-suraj.kandpal@intel.com>
References: <20250411042909.2626807-1-suraj.kandpal@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use u32 instead of u16 for max variable in drm_edp_backlight_info
since it can now hold max luminance range value which is u32.
We will set this max with max_luminance value when luminance_set is
true.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 10 +++++++---
 include/drm/display/drm_dp_helper.h     |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 3b309ac5190b..1322bdfb6c8b 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4270,9 +4270,13 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
 		return -EINVAL;
 	}
 
-	ret = drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz, edp_dpcd);
-	if (ret < 0)
-		return ret;
+	if (bl->luminance_set) {
+		bl->max = lr->max_luminance;
+	} else {
+		ret = drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz, edp_dpcd);
+		if (ret < 0)
+			return ret;
+	}
 
 	ret = drm_edp_backlight_probe_state(aux, bl, current_mode);
 	if (ret < 0)
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 6f53921f5dce..39d644495f3e 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -839,7 +839,7 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk quirk)
 struct drm_edp_backlight_info {
 	u8 pwmgen_bit_count;
 	u8 pwm_freq_pre_divider;
-	u16 max;
+	u32 max;
 
 	bool lsb_reg_used : 1;
 	bool aux_enable : 1;
-- 
2.34.1

