Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBED3970EE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0CB6E9D3;
	Tue,  1 Jun 2021 10:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83206E9D7;
 Tue,  1 Jun 2021 10:06:02 +0000 (UTC)
IronPort-SDR: Ghd2cIc984dFDds5nR22f4FMTmBnJCca4/G3XLFKqr+jgErXyG0TABeS3su+gF3p0BbslNj2Gd
 E3jkYdUbD+kw==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="183197763"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="183197763"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:56 -0700
IronPort-SDR: NlQfD4GCOmcyzwP63hqSXSlCFoAlcIY87pm5X07CUKynuXkx9mQ3PxRAI2MUUur7gb2SvYjclh
 t1+Ddb2KMmEg==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="399245248"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:55 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/i915/xelpd: Enable Pipe Degamma
Date: Tue,  1 Jun 2021 16:11:33 +0530
Message-Id: <20210601104135.29020-8-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601104135.29020-1-uma.shankar@intel.com>
References: <20210601104135.29020-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>, bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable Pipe Degamma for XE_LPD. Extend the legacy implementation
to incorparate the extended lut size for XE_LPD.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 18b51b9cc2aa..a8b771f22880 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -829,6 +829,12 @@ static void glk_load_degamma_lut(const struct intel_crtc_state *crtc_state)
 	enum pipe pipe = crtc->pipe;
 	int i, lut_size = INTEL_INFO(dev_priv)->color.degamma_lut_size;
 	const struct drm_color_lut *lut = crtc_state->hw.degamma_lut->data;
+	u32 extended_lut_size = 0;
+
+	if (DISPLAY_VER(dev_priv) >= 13)
+		extended_lut_size = 131;
+	else
+		extended_lut_size = 35;
 
 	/*
 	 * When setting the auto-increment bit, the hardware seems to
@@ -841,8 +847,8 @@ static void glk_load_degamma_lut(const struct intel_crtc_state *crtc_state)
 
 	for (i = 0; i < lut_size; i++) {
 		/*
-		 * First 33 entries represent range from 0 to 1.0
-		 * 34th and 35th entry will represent extended range
+		 * First lut_size entries represent range from 0 to 1.0
+		 * 3 additional lut entries will represent extended range
 		 * inputs 3.0 and 7.0 respectively, currently clamped
 		 * at 1.0. Since the precision is 16bit, the user
 		 * value can be directly filled to register.
@@ -858,7 +864,7 @@ static void glk_load_degamma_lut(const struct intel_crtc_state *crtc_state)
 	}
 
 	/* Clamp values > 1.0. */
-	while (i++ < 35)
+	while (i++ < extended_lut_size)
 		intel_de_write(dev_priv, PRE_CSC_GAMC_DATA(pipe), 1 << 16);
 
 	intel_de_write(dev_priv, PRE_CSC_GAMC_INDEX(pipe), 0);
-- 
2.26.2

