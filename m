Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 385F69F870E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A540C10EDD4;
	Thu, 19 Dec 2024 21:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e19zT+Y/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79D510EDD1;
 Thu, 19 Dec 2024 21:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734644099; x=1766180099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fMr0gHfz6sa5EQ21tkB+kWBVE2ogg60WQxOkhd1/Tgo=;
 b=e19zT+Y/wp7czZ1JGOyx//S++nf5JRGpJqU87tyhndLTF8V9zDVj50ym
 iGBARSTE6j/zXlFQLvPoNA7BfQKsV30AtThsi7+bzJF3lHySLYcDBhGmL
 TDUEp7nORprqg2cTE3IAAQTxepYQcHu3oPa8BAOmlMIuYHb1M+HquY/16
 53+leHQrJVJHhE3OxuZdzf+EiW3XEz0FV2IBQwo2UyixshqPzBN+CmZcJ
 2/pkvw8d7AhYW9hy7dJSNRMW5b9k4BENvFqMsRfSrsPyPygADO206GVxa
 BtwNr+75Xxl1B+wwE/g2W5LHvqmqjpQtntPJdJ74z+am+7P8klvfy8euT Q==;
X-CSE-ConnectionGUID: JuUt5Hz7RMOQJ1MlXNajTw==
X-CSE-MsgGUID: wFj8ZXt8R9m0abZUdhQJog==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35330569"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35330569"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:34:59 -0800
X-CSE-ConnectionGUID: LjuP+AHgShGyj8C6tochEQ==
X-CSE-MsgGUID: W8gpIwMtS+KduN/7RvoVVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98115668"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:34:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH v2 08/16] drm/i915/ddi: enable 128b/132b TRANS_DDI_FUNC_CTL
 mode for UHBR SST
Date: Thu, 19 Dec 2024 23:33:57 +0200
Message-Id: <9591645d5ca1982ed2b617465382a00be6be76cc.1734643485.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1734643485.git.jani.nikula@intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

128b/132b SST needs 128b/132b mode enabled in the TRANS_DDI_FUNC_CTL
register.

This is preparation for enabling 128b/132b SST. This path is not
reachable yet.

v2: Use the MST path instead of SST to also set transport select (Imre)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 4f9c50996446..ce34a619d48a 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -561,7 +561,8 @@ intel_ddi_transcoder_func_reg_val_get(struct intel_encoder *encoder,
 	} else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_ANALOG)) {
 		temp |= TRANS_DDI_MODE_SELECT_FDI_OR_128B132B;
 		temp |= (crtc_state->fdi_lanes - 1) << 1;
-	} else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)) {
+	} else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST) ||
+		   intel_dp_is_uhbr(crtc_state)) {
 		if (intel_dp_is_uhbr(crtc_state))
 			temp |= TRANS_DDI_MODE_SELECT_FDI_OR_128B132B;
 		else
-- 
2.39.5

