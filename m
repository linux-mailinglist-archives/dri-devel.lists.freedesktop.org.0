Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9962A2D2B21
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C38890F5;
	Tue,  8 Dec 2020 12:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B73890F5;
 Tue,  8 Dec 2020 12:34:43 +0000 (UTC)
IronPort-SDR: 2Bzmh/o8cOLSbWOP+8f0CzlCRmyhIqv4edUE21WAi4zcOU9YSPNOjcRbIz4Evt1Y9gL9IzJI+7
 wzEnv4Xc0Igw==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="235479472"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="235479472"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 04:34:43 -0800
IronPort-SDR: ikCAj0pvivCDbhtlzTpOgJvIoGDWQFz1951upmcwh3eyhfvYxOjaiFqmICXydEdNezh5iQDO0I
 lN99XVDBj5Fw==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="437357369"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.246.199])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 04:34:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] drm/i915/dsi: use VBT data for rc_model_size
Date: Tue,  8 Dec 2020 14:33:55 +0200
Message-Id: <06004e7116eb71cd10a618a04660bc37d11a7846.1607429866.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1607429866.git.jani.nikula@intel.com>
References: <cover.1607429866.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, manasi.d.navare@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stop overriding the VBT defined value for rc_model_size.

Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index 676e40172fe9..a9439b415603 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -1535,9 +1535,6 @@ static int gen11_dsi_dsc_compute_config(struct intel_encoder *encoder,
 
 	vdsc_cfg->convert_rgb = true;
 
-	/* FIXME: initialize from VBT */
-	vdsc_cfg->rc_model_size = DSC_RC_MODEL_SIZE_CONST;
-
 	ret = intel_dsc_compute_params(encoder, crtc_state);
 	if (ret)
 		return ret;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
