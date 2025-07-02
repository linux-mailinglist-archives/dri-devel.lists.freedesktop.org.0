Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD41AF0F1B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8016810E688;
	Wed,  2 Jul 2025 09:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="biurktMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31DC10E68C;
 Wed,  2 Jul 2025 09:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447310; x=1782983310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DMKfstrLzycst1YhpLMVAWi/09qmf6r/s10P2e06/vg=;
 b=biurktMNwoHhT73TwcOW4MHF9+YGj9mBLrF1IB9+UAuZxaTNHsBUk1Ty
 mNIOCr3G7RGheOGmRh1q1xHb+ro0XljdrX4Z2AyIqgH/18vG01fltacKi
 BotrV3JOPkYBASwAFp3QlyMH1gxRg7Mgr/zQxQFcPlOvFTEjCtXQJSNPq
 TNtc9OrMXSTKCzZcvySFC1iR2cfF95kzSLVxklDGLLIKFaOy00dLsXhch
 REIX1rNrxIts6FPm/NRY0Et9AmODPl3CMFiZG8x4ln1zBLpbrhFAWY4Sq
 z6cE+udfB3AgrbalcgyYfaFmDjOvTfZWHGa6o8kZJTbbZqm2B9b7LgaTy g==;
X-CSE-ConnectionGUID: Qw3XpuycQ5+fWxklPsrkgg==
X-CSE-MsgGUID: G4XYR+GuT6mz39TW0TMJHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427172"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64427172"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:08:30 -0700
X-CSE-ConnectionGUID: q2zZ7kmlRtmrEGgZVlqajw==
X-CSE-MsgGUID: m+9yShPgQLu0lEOkyPxEOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536633"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:08:26 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 14/24] drm/i915/color: Add new color callbacks for Xelpd
Date: Wed,  2 Jul 2025 14:49:26 +0530
Message-ID: <20250702091936.3004854-15-uma.shankar@intel.com>
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

Since we intend to add plane color callbacks from Xelpd(D13 and beyond),
create a different structure for it.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index f7237d00be7a..9684eee96ef9 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3893,6 +3893,17 @@ static const struct intel_color_funcs tgl_color_funcs = {
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
@@ -4170,7 +4181,9 @@ void intel_color_init_hooks(struct intel_display *display)
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

