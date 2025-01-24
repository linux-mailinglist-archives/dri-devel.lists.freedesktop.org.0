Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C9BA1B00C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 06:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B1910E8DF;
	Fri, 24 Jan 2025 05:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aYh9DOSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6E310E8DF;
 Fri, 24 Jan 2025 05:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737697646; x=1769233646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e/GL3gNQ6mhwbDuPhCaZDKd2U72rY6LFXI8UWX2ag14=;
 b=aYh9DOSjo8Zje8r7MDnpYGax+/VggIcMMMe9gbaRG1aPo2WIH46f642E
 Nzdq62w0DX8z0bYXV2MCLnidD4x/T46qNlaQAH5zSE3d8P1aXUSiNAZmD
 PFRkNo0em2GsH3/tmxNlxEDuLB+m1L/HZZ/aRkLrfi3vtL+HOTvOWhbvx
 x5kAWTo2GXKEw9jHMFvdpwT89kxEGiAFmTz/9asJSdo4R8wkiLM7sAoQp
 v/POKqmHkipa3Fh2QKBDHms6x1qMhjOZfeqSGai/ycSy45io+J0BOUck6
 P9U/ic79Mbe3AIQOJg/ox8oeof+7YBVKTmMKa0UI+LkvBLqOAKPT75ysU A==;
X-CSE-ConnectionGUID: GWmRrsC0TiuVpcImQJApeg==
X-CSE-MsgGUID: qWdKDvtJR2iDrLvMorLdug==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37429313"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="37429313"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:47:26 -0800
X-CSE-ConnectionGUID: f//7FZZBRD6OEPpXB1XmEA==
X-CSE-MsgGUID: heX1vmvxQYOJNlwSaWUsRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107526015"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 21:47:24 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ben.kao@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 4/7] drm/i915/backlight: Modify function to get VESA
 brightness in NITS
Date: Fri, 24 Jan 2025 11:16:28 +0530
Message-Id: <20250124054631.1796456-5-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124054631.1796456-1-suraj.kandpal@intel.com>
References: <20250124054631.1796456-1-suraj.kandpal@intel.com>
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

Modify vesa_get_brightness function to take into account nits_support
and based on that read the appropriate register and return the value.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index c5ff6e044866..ac9a69fe3f10 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -451,6 +451,26 @@ intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum pipe pi
 /* VESA backlight callbacks */
 static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, enum pipe unused)
 {
+	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
+	struct intel_panel *panel = &connector->panel;
+	u8 buf[3];
+	u32 val = 0;
+	int ret;
+
+	if (panel->backlight.edp.vesa.nits_support) {
+		ret = drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf,
+				     sizeof(buf));
+		if (ret < 0) {
+			drm_err(intel_dp->aux.drm_dev,
+				"[CONNECTOR:%d:%s] Failed to read brightness from DPCD\n",
+				connector->base.base.id, connector->base.name);
+			return 0;
+		}
+
+		val |= buf[0] | buf[1] << 8 | buf[2] << 16;
+		return val / 1000;
+	}
+
 	return connector->panel.backlight.level;
 }
 
-- 
2.34.1

