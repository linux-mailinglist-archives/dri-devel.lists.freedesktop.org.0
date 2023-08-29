Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAE278C937
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F72310E42F;
	Tue, 29 Aug 2023 16:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754D910E3F6;
 Tue, 29 Aug 2023 15:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324795; x=1724860795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jnrtTbHIlA7jcWZk+QTlZV5oxEPc3BTZwd7i8EI2OzI=;
 b=dTNHFYM8QqxqUPqubs+5oUkDKR93cZJ0MMpyr2nG6A4sX678Jc8/TLCA
 Hz6AfU6Vo461ZLU77Ah3I6qi2PfyjQbNx4eWWj0+YrvK2RO2+51tAx2Ca
 w9vo+6/zIfUYVSIPIo7O4t9jC9xdghHDxkv8r6MVK3mr5B074LracGKnR
 1QjSRRLl01YkRNT7x9XGU3oCGzSWVC63rjuDxmqndqCcccMLQVCyNuma4
 oK7q8sPAeysdI04mo2BAXXdy88/wrjvG9w5c7RFMBvLDaD2TSLpLv9qjj
 f+buIKw6FklTCMhwiwbogaUPuM2rTy21wJGegkC0uFoDar3o9aPFxHcAG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769456"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769456"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555123"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555123"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:34 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 26/33] drm/i915/color: Add color functions for ADL
Date: Tue, 29 Aug 2023 21:34:15 +0530
Message-ID: <20230829160422.1251087-27-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register color callbacks for ADL and beyond. While we have to register
new callbacks for pre-blending color operations, re-use callbacks for
post-blend operations.

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index df2fc8f98dc9..3f3c1ac10330 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3704,6 +3704,16 @@ static const struct intel_color_funcs i9xx_color_funcs = {
 	.get_config = i9xx_get_config,
 };
 
+static const struct intel_color_funcs xelpd_color_funcs = {
+	.color_check = icl_color_check,
+	.color_commit_noarm = icl_color_commit_noarm,
+	.color_commit_arm = icl_color_commit_arm,
+	.load_luts = icl_load_luts,
+	.read_luts = icl_read_luts,
+	.lut_equal = icl_lut_equal,
+	.read_csc = icl_read_csc,
+};
+
 static const struct intel_color_funcs tgl_color_funcs = {
 	.color_check = icl_color_check,
 	.color_commit_noarm = icl_color_commit_noarm,
@@ -4141,7 +4151,9 @@ void intel_color_init_hooks(struct drm_i915_private *i915)
 		else
 			i915->display.funcs.color = &i9xx_color_funcs;
 	} else {
-		if (DISPLAY_VER(i915) >= 12)
+		if (DISPLAY_VER(i915) >= 13)
+			i915->display.funcs.color = &xelpd_color_funcs;
+		else if (DISPLAY_VER(i915) == 12)
 			i915->display.funcs.color = &tgl_color_funcs;
 		else if (DISPLAY_VER(i915) == 11)
 			i915->display.funcs.color = &icl_color_funcs;
-- 
2.38.1

