Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C1291C3FD
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 18:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E621210EC98;
	Fri, 28 Jun 2024 16:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VovR+/hk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0CD10ECBC;
 Fri, 28 Jun 2024 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719593087; x=1751129087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wiDksbXlzwn+SKrr0sdcbtYUqqcHUC/ew4nBNErJNmg=;
 b=VovR+/hkRLZ78bLASutSfKbokZL5Lgp/ymP/RYQtY7klPeGUmLc+3NFf
 sDd18pAMv5ZcEMyHoskIQPV9rhV0Ln+YbkSV7GiyZjR5qKPnAvmQCfC3Z
 px4HwrIw92JL/k2NfDrHG3GXSeraWOqBzA9oiW8jRx3OCBJMRa1/J0Z1d
 TEEvGXZc4GiSD5h+Z9+KYY9Az7bbmcjIT9G8GdYAR2WoRjJOp6wALSClV
 qqneecsaO3WrNaYNzWCPY3OWIAquJJJpkE2bXXTx6mAAQ8GsmvQwsdb3V
 w0aTflRoGsPn6EU/MkStDuhS+5Js13ZFjbbr25YiLeJ1jWDwaMh4IyNCu A==;
X-CSE-ConnectionGUID: 8/9BCLvORU2d1RjMdj2meQ==
X-CSE-MsgGUID: OQ6xOOFiTgeVcUfyEW6RHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16620066"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="16620066"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:47 -0700
X-CSE-ConnectionGUID: m+3NWqElRuW0cSg13HhGtQ==
X-CSE-MsgGUID: ogapkglKRIm3BPu1OLmJ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="75519913"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:46 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 1/9] drm: Add helpers for q4 fixed point values
Date: Fri, 28 Jun 2024 19:44:42 +0300
Message-ID: <20240628164451.1177612-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240628164451.1177612-1-imre.deak@intel.com>
References: <20240628164451.1177612-1-imre.deak@intel.com>
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

Add helpers to convert between q4 fixed point and integer/fraction
values. Also add the format/argument macros required to printk q4 fixed
point variables. The q4 notation is based on the short variant described
by

https://en.wikipedia.org/wiki/Q_(number_format)

where only the number of fraction bits in the fixed point value are
defined, while the full size is deducted from the container type, that
is the size of int for these helpers. Using the fxp_ prefix, which makes
moving these helpers outside of drm to a more generic place easier, if
they prove to be useful.

These are needed by later patches dumping the Display Stream Compression
configuration in DRM core and in the i915 driver to replace the
corresponding bpp_x16 helpers defined locally in the driver.

v2: Use the more generic/descriptive fxp_q4 prefix instead of drm_x16.
   (Jani)

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c |  5 +++--
 include/drm/drm_fixed.h                 | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 79a615667aab1..d4c34f3641400 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -35,6 +35,7 @@
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_fixed.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_panel.h>
@@ -4151,9 +4152,9 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
 	int symbol_cycles;
 
 	if (lane_count == 0 || hactive == 0 || bpp_x16 == 0) {
-		DRM_DEBUG_KMS("Invalid BW overhead params: lane_count %d, hactive %d, bpp_x16 %d.%04d\n",
+		DRM_DEBUG_KMS("Invalid BW overhead params: lane_count %d, hactive %d, bpp_x16 " FXP_Q4_FMT "\n",
 			      lane_count, hactive,
-			      bpp_x16 >> 4, (bpp_x16 & 0xf) * 625);
+			      FXP_Q4_ARGS(bpp_x16));
 		return 0;
 	}
 
diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index 81572d32db0c2..ef8bc8d72039d 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -214,4 +214,27 @@ static inline s64 drm_fixp_exp(s64 x)
 	return sum;
 }
 
+static inline int fxp_q4_from_int(int val_int)
+{
+	return val_int << 4;
+}
+
+static inline int fxp_q4_to_int(int val_q4)
+{
+	return val_q4 >> 4;
+}
+
+static inline int fxp_q4_to_int_roundup(int val_q4)
+{
+	return (val_q4 + 0xf) >> 4;
+}
+
+static inline int fxp_q4_to_frac(int val_q4)
+{
+	return val_q4 & 0xf;
+}
+
+#define FXP_Q4_FMT		"%d.%04d"
+#define FXP_Q4_ARGS(val_q4)	fxp_q4_to_int(val_q4), (fxp_q4_to_frac(val_q4) * 625)
+
 #endif
-- 
2.43.3

