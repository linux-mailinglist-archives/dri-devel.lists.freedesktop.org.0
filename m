Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151AEAF0F18
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E443210E696;
	Wed,  2 Jul 2025 09:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JN75fcWx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BA910E694;
 Wed,  2 Jul 2025 09:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447306; x=1782983306;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1FZJPIszIbveP4/cEIP9e7uZaTmsEv/87tnmoxOsTHY=;
 b=JN75fcWxKau8ZgIJimaoxrUi8U+rAbF7Cg9kvFRkWCxM3jT1Z6HoLAQb
 GKsJtpyLz0Lb+2aFe2OA2HLi4R7HCjvhiWUHt+1PebDEeSMVkFLfCbe0F
 +JIwKDFNHKoq099GNuZJLkR1fMAGHvwtn/LeHDphiI4iQYviKeVXOUQM+
 PMs/sYK2Kd24JTphHYyhJjMAwdxmz08CNgcpcY3lBhvefecjjUHVWikyN
 +B+5LAkOI10eLTYPhD9vTOEeCJPUB/DW7CSspeSkqT+uZ2r5uv2OvEe0M
 HKc3b7Z3Kb3nXfkobhsO1iNIUtQq8r4mZC/oq5I5MehoZimfOR7jub0Gv w==;
X-CSE-ConnectionGUID: a6+u+O2rRmmfYJB5JKBtCw==
X-CSE-MsgGUID: uLakkOb8Sg+r7cLBFdVScQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427157"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64427157"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:08:26 -0700
X-CSE-ConnectionGUID: jJDOBFjrRJGNdZTwxYJr4A==
X-CSE-MsgGUID: qwNOC+3dSoWupx6VD7CJYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536608"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:08:22 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 13/24] drm/i915/color: Add callbacks to set plane CTM
Date: Wed,  2 Jul 2025 14:49:25 +0530
Message-ID: <20250702091936.3004854-14-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250702091936.3004854-1-uma.shankar@intel.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add callback to intel color functions for setting plane CTM.

v2: adapt to struct intel_display
v3: add dsb support

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 7c53572f729b..f7237d00be7a 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -33,6 +33,7 @@
 #include "intel_dsb.h"
 #include "intel_vrr.h"
 #include "skl_universal_plane.h"
+#include "skl_universal_plane_regs.h"
 
 #define PLANE_DEGAMMA_SIZE 128
 #define PLANE_GAMMA_SIZE 32
@@ -91,6 +92,10 @@ struct intel_color_funcs {
 	 * Read config other than LUTs and CSCs, before them. Optional.
 	 */
 	void (*get_config)(struct intel_crtc_state *crtc_state);
+
+	/* Plane CSC*/
+	void (*load_plane_csc_matrix)(struct intel_dsb *dsb,
+				      const struct intel_plane_state *plane_state);
 };
 
 #define CTM_COEFF_SIGN	(1ULL << 63)
@@ -3971,7 +3976,10 @@ static void
 intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
 				  const struct intel_plane_state *plane_state)
 {
-	/* CTM programming */
+	struct intel_display *display = to_intel_display(plane_state);
+
+	if (display->funcs.color->load_plane_csc_matrix)
+		display->funcs.color->load_plane_csc_matrix(dsb, plane_state);
 }
 
 void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
-- 
2.42.0

