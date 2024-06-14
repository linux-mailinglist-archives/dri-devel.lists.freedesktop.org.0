Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8C69091CF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 19:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDDA10EE08;
	Fri, 14 Jun 2024 17:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjSjebgH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D3F10EE04;
 Fri, 14 Jun 2024 17:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718386745; x=1749922745;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5oZVYWWLsyioEUvj9LeelwE00zfhIiW48GtVJ66kGdQ=;
 b=SjSjebgHFosP9CKeMQWUw3axQv0O1GNaiz4FPam9CjWM8r6cc7Wz4Eh6
 NftMbVKFfmwscnhljQxuidoEgp5XOI33Tcg1gT1/dIZ25u5v6wMF1NS15
 FN3Rq21i7HWOoj/vacsQVRWGsJjritjLe7vNdcdU0/6RDxocY4xtuA6IK
 5/75F303yTY7GTWsJfkl5aq2nzMpRh46eenMXRm+kKuU/KmhrVcHuAtXx
 p606J37V9LSW1IpK2b1/YfEHJnJLYFhysojQlsQApSVlurCX7ajJNTXNr
 k4pzoGYPu4uOW73IvBBdASTxj51Y3IolX1Hs+LfrbUqgk42e4ASO0QLv+ Q==;
X-CSE-ConnectionGUID: TOeljRaiTXisqtW5nPJmRQ==
X-CSE-MsgGUID: F9IG69XRQ4eaFxvkD3ryxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19069302"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="19069302"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:39:05 -0700
X-CSE-ConnectionGUID: +5/aaQsPQ2yNuECuL9uTQQ==
X-CSE-MsgGUID: 4wpbkhnYRviEYgcIRBVabw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40712430"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:39:03 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] drm: Add helpers for x16 fixed point values
Date: Fri, 14 Jun 2024 20:39:01 +0300
Message-ID: <20240614173911.3743172-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240614173911.3743172-1-imre.deak@intel.com>
References: <20240614173911.3743172-1-imre.deak@intel.com>
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

Add helpers to convert between x16 fixed point and integer/fraction
values. Also add the format/argument macros required to printk x16
fixed point variables.

These are needed by later patches dumping the Display Stream Compression
configuration in DRM core and in the i915 driver to replace the
corresponding bpp_x16 helpers defined locally in the driver.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c |  5 +++--
 include/drm/drm_fixed.h                 | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 79a615667aab1..806f9c9764995 100644
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
+		DRM_DEBUG_KMS("Invalid BW overhead params: lane_count %d, hactive %d, bpp_x16 " DRM_X16_FMT "\n",
 			      lane_count, hactive,
-			      bpp_x16 >> 4, (bpp_x16 & 0xf) * 625);
+			      DRM_X16_ARGS(bpp_x16));
 		return 0;
 	}
 
diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index 81572d32db0c2..0fe2a7f50d54e 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -214,4 +214,27 @@ static inline s64 drm_fixp_exp(s64 x)
 	return sum;
 }
 
+static inline int drm_x16_from_int(int val_int)
+{
+	return val_int << 4;
+}
+
+static inline int drm_x16_to_int(int val_x16)
+{
+	return val_x16 >> 4;
+}
+
+static inline int drm_x16_to_int_roundup(int val_x16)
+{
+	return (val_x16 + 0xf) >> 4;
+}
+
+static inline int drm_x16_to_frac(int val_x16)
+{
+	return val_x16 & 0xf;
+}
+
+#define DRM_X16_FMT		"%d.%04d"
+#define DRM_X16_ARGS(val_x16)	drm_x16_to_int(val_x16), (drm_x16_to_frac(val_x16) * 625)
+
 #endif
-- 
2.43.3

