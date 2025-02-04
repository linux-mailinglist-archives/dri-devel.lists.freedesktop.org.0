Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA669A2722A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 13:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C4410E632;
	Tue,  4 Feb 2025 12:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dlsdGHnl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53AA10E631;
 Tue,  4 Feb 2025 12:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738673435; x=1770209435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xpaM+PVmSy30BdODRQ7drxZgehdL49/vwqJYtgNMcvw=;
 b=dlsdGHnlIrgV5L0h3/HmOv+kQ2Fw2asO3+BAZVAV/8WcXdJBuCyuBoVt
 T9h7Lu9cTxk7XrlxJboNTkE33Y50APHnnVEYXprjGvZfTyWnnlwUSPtjc
 wnsSjRv6MR4yOJ9apf7qQbIV2ww972jYVwhXh2mkzbp5Yf+Rnbkw2yHgh
 D+jvrt2809eY9FvGfxDGbdfEgS0vkRZHMqQJrSbHlhAmTOjg6+7EmQS+l
 +Th0G35JNDYmZcYclVFksLSAhaaH+7aAQk4splokqFGckQoFgDvu/62Xb
 kMSG8U/NvOsVsX3dJ1otIafXn2gO7nFtSQnURHM6wx8+v7ChA60WEhZMr g==;
X-CSE-ConnectionGUID: JkViFI5YQd2z0xdz7VOQhQ==
X-CSE-MsgGUID: bunvMd9mRw2F6rKOc4llug==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42853189"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="42853189"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 04:50:35 -0800
X-CSE-ConnectionGUID: 4KgY/0GNQO2ZtfUEtYdsNA==
X-CSE-MsgGUID: iz6TCmzMTtSzBp1wiSIAjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111441971"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 04 Feb 2025 04:50:31 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, jani.nikula@intel.com, arun.r.murthy@intel.com,
 ben.kao@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 3/7] drm/i915/backlight: Check Luminance based brightness
 control for VESA
Date: Tue,  4 Feb 2025 18:20:05 +0530
Message-Id: <20250204125009.2609726-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204125009.2609726-1-suraj.kandpal@intel.com>
References: <20250204125009.2609726-1-suraj.kandpal@intel.com>
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

Check if we are capable of controlling brightness via luminance
which is dependent on PANEL_LUMINANCE_OVERRIDE being set.

--v2
-Prefer using luminance rather than nits [Jani]
-Fix commit message

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Tested-by: Ben Kao <ben.kao@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h    | 1 +
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index cb51b7936f93..3b64ad724b29 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -412,6 +412,7 @@ struct intel_panel {
 		union {
 			struct {
 				struct drm_edp_backlight_info info;
+				bool luminance_control_support;
 			} vesa;
 			struct {
 				bool sdr_uses_aux;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 09e82f24d030..84126e7d1716 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -575,6 +575,15 @@ intel_dp_aux_supports_vesa_backlight(struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(connector);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
+	struct intel_panel *panel = &connector->panel;
+
+	if ((intel_dp->edp_dpcd[2] & DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE)) {
+		drm_dbg_kms(display->drm,
+			    "[CONNECTOR:%d:%s] AUX Luminance Based Backlight Control Supported!\n",
+			    connector->base.base.id, connector->base.name);
+		panel->backlight.edp.vesa.luminance_control_support = true;
+		return true;
+	}
 
 	if (drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
 		drm_dbg_kms(display->drm,
-- 
2.34.1

