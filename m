Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3311AA8529A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 06:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F269C10EAC2;
	Fri, 11 Apr 2025 04:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUOhhUwY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B38A10EAD7;
 Fri, 11 Apr 2025 04:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744345769; x=1775881769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tbNhe/Pi2ICeJWB/Eoicw5OlExaShCsV3D27EkfxHHI=;
 b=VUOhhUwYlGNAlYoPPXmhl1hZMRfkLm5DYnrglbdDxppTZ5iZDFMMlwMB
 f/AoQQeMbIZPJmZObNanUwks1Xs1yCCvlmlEAyHP7HNvT1JQ9nmhrQMgz
 O6+OHJ40qxSKc9imxOPiLvnAH45meQhqpKHFwwUNoQy+/23ZELww4TQX+
 1DTb8aofMYdeEoydEUQ3qnx9iv1V+IWsta5v8VXtepZgb75zc4UG8CAWv
 mxxLTfcrQLymB5HDMWEWFjGfEreEtHK5OcCV8z410SvZzE6mAegHp9SW6
 YfAiz8TMeMGjOBLwL8MAq0HrWWBYtQmGDM+plbn2T8ufpVDo5KIy2YKPO g==;
X-CSE-ConnectionGUID: euWjqpTxTBS+gQCZDAd23w==
X-CSE-MsgGUID: V0cbhq/HQFCy4TMo/39F/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57259952"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="57259952"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 21:29:29 -0700
X-CSE-ConnectionGUID: wt56ThlpTgSwmD7k29zB9w==
X-CSE-MsgGUID: KJvm/AcRSEWTstzJdL2r7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="160057100"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 10 Apr 2025 21:29:26 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 10/13] drm/dp: Enable backlight control using luminance
Date: Fri, 11 Apr 2025 09:59:06 +0530
Message-Id: <20250411042909.2626807-11-suraj.kandpal@intel.com>
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

Add flag to enable brightness control via luminance value
when enabling edp backlight.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 0a2ec1147006..b204ed48976d 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4030,6 +4030,9 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 	else
 		dpcd_buf = DP_EDP_BACKLIGHT_CONTROL_MODE_PWM;
 
+	if (bl->luminance_set)
+		dpcd_buf |= DP_EDP_PANEL_LUMINANCE_CONTROL_ENABLE;
+
 	if (bl->pwmgen_bit_count) {
 		ret = drm_dp_dpcd_write_byte(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
 		if (ret < 0)
-- 
2.34.1

