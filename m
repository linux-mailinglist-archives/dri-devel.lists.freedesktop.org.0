Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E1D9D985C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD6210E898;
	Tue, 26 Nov 2024 13:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4QMS2/h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECF010E898;
 Tue, 26 Nov 2024 13:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627237; x=1764163237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0xK8PgVaWLm13p+IP2nCbuHAxbcKIkAkwOLhhppbNJs=;
 b=m4QMS2/hBk6DSXTCbb0mqdwMn9YGm9W0yzgZdjZm5A5EvrvYtJwAnp+d
 RwcipyLmN3Sv+Y2Q2qMokm+L4Nti6IlZV2/HgIks0o5r05FMejFDTQj8a
 BcU4+F7MAiLIkITemZbkm8jxynWMcD4ccM7E9sA2GTsCKM573EIPQTC65
 cPlCu2JRwmaTakL3WsXuGTChhTytfLHsVGo/3t7PRUEMjplo9L8+PiHpy
 JYm+2IQP3OaqU7m6PN8O40tZPCTWD+0soFjYNnsEPBCRvbAJ0aLc0BPB1
 PMmZ2G2f8+e/pUrqLid8GAqvsSZbo2MbZyQ7SqSWrwdU0FQFNOupXFTaU A==;
X-CSE-ConnectionGUID: dzdwA2a2QguL5D+TadAN+Q==
X-CSE-MsgGUID: BaUKCq+rSPO2iJUeSpDotA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170373"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170373"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:20:37 -0800
X-CSE-ConnectionGUID: eNz5cvNXTc25HSOFi0m/VA==
X-CSE-MsgGUID: oqEDXcglRlOCoHMQlCbWnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114874917"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:20:32 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 17/25] drm/i915/color: Add new color callbacks for Xelpd
Date: Tue, 26 Nov 2024 18:57:22 +0530
Message-ID: <20241126132730.1192571-18-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241126132730.1192571-1-uma.shankar@intel.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
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

Since we intend to add plane color callbacks from Xelpd(D13 and beyond),
create a different structure for it.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 26c51334f3b7..c2da5aea5d56 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3847,6 +3847,17 @@ static const struct intel_color_funcs tgl_color_funcs = {
 	.get_config = skl_get_config,
 };
 
+static const struct intel_color_funcs xelpd_color_funcs = {
+	.color_check = icl_color_check,
+	.color_commit_noarm = icl_color_commit_noarm,
+	.color_commit_arm = icl_color_commit_arm,
+	.load_luts = icl_load_luts,
+	.read_luts = icl_read_luts,
+	.lut_equal = icl_lut_equal,
+	.read_csc = icl_read_csc,
+	.get_config = skl_get_config,
+};
+
 static const struct intel_color_funcs icl_color_funcs = {
 	.color_check = icl_color_check,
 	.color_commit_noarm = icl_color_commit_noarm,
@@ -4278,7 +4289,9 @@ void intel_color_init_hooks(struct intel_display *display)
 		else
 			display->funcs.color = &i9xx_color_funcs;
 	} else {
-		if (DISPLAY_VER(display) >= 12)
+		if (DISPLAY_VER(display) >= 13)
+			display->funcs.color = &xelpd_color_funcs;
+		else if (DISPLAY_VER(display) == 12)
 			display->funcs.color = &tgl_color_funcs;
 		else if (DISPLAY_VER(display) == 11)
 			display->funcs.color = &icl_color_funcs;
-- 
2.42.0

