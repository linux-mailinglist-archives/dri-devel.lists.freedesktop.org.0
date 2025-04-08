Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4533BA7F3E6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 07:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723F710E5BE;
	Tue,  8 Apr 2025 05:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izuzUjRi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF36110E5C1;
 Tue,  8 Apr 2025 05:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744088497; x=1775624497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bqpgvLOIEq0CE2TB7KPcQnzffvFwa7AxsMfOEjbSSkI=;
 b=izuzUjRi+8gd7BSBwBPsLt9tl9U0Bd86ig2peo/tCyGyWDSd/r/f0ckb
 ybzkxiw4by/Kp2ZcWEAtWJ4TeQ90+odF7Mpg3+16Gehd8JVWf9kxawveS
 TTd0sD1BTeL/r/hYlzjM47LYrimmeMMA20dBROFxib7/FN/tPCqPTxif2
 ThcqbctYfHLe101pOmlBXZXOjwRg/bsRt1mdfGrEgITghYuh34fNdBn1W
 i0uHSh7iKfYXr/SF3Cx9vcl88WIDvgCZu/YtzLXroxoBR8aN0PgR5KZOP
 13s2eHmODQ4T5tvfcTxKU3OcdaoKu4jOLvTzhyp3LR1fETVYgWRL5bSrq g==;
X-CSE-ConnectionGUID: E23wl8GxSKiJzTKfDtz+0g==
X-CSE-MsgGUID: XszvnATdQ3ivj0ogcjSnjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="67975307"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="67975307"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 22:01:37 -0700
X-CSE-ConnectionGUID: XZH9VH/KSB+fnD+z+owRzA==
X-CSE-MsgGUID: NpzRMYsCTJqEHWMxuEvleg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="133015465"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 07 Apr 2025 22:01:35 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 2/2] drm/i915/backlight: Modify condition to use panel
 luminance
Date: Tue,  8 Apr 2025 10:31:38 +0530
Message-Id: <20250408050138.2382452-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408050138.2382452-1-suraj.kandpal@intel.com>
References: <20250408050138.2382452-1-suraj.kandpal@intel.com>
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

According to our internal spec we need to now check if both
panel luminance and smooth brightness are available in panel for
us to be able to change brightness using luminance value.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 8173de8aec63..20ab90acb351 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -663,7 +663,8 @@ intel_dp_aux_supports_vesa_backlight(struct intel_connector *connector)
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct intel_panel *panel = &connector->panel;
 
-	if ((intel_dp->edp_dpcd[3] & DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE)) {
+	if ((intel_dp->edp_dpcd[3] & DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE) &&
+	    (intel_dp->edp_dpcd[3] & DP_EDP_SMOOTH_BRIGHTNESS_CAPABLE)) {
 		drm_dbg_kms(display->drm,
 			    "[CONNECTOR:%d:%s] AUX Luminance Based Backlight Control Supported!\n",
 			    connector->base.base.id, connector->base.name);
-- 
2.34.1

