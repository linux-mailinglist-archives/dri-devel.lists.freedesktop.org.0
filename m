Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA928A1B008
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 06:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F1210E8D9;
	Fri, 24 Jan 2025 05:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ho0cZbwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B56A10E8D9;
 Fri, 24 Jan 2025 05:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737697640; x=1769233640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kd3hrVmAUqnItnFt8dBJhULmBiM5p6+MAzsHwN9wa4s=;
 b=Ho0cZbwpPtRlQYFeJDW4QIJrGOeSl4MK5y93DYednmSGvD3s9w9pT63C
 b6txskzxarPpe0VCSMwp0It2qrmSjHRKcbtSgeXjbZJs6KCRgAurFbcsR
 ggoYALhCAX6+L6c2MJ3lxKcvsMGdNYygi36qotyg0+DE6ujlE9lsJ7Qem
 Aqhuulo1QdmiYTez3AMMrn3E8d9Cjwjx4NxMboglBH37gZfFiHu71LJM2
 qJEvr6aF1ZXvYNhr035Nc6BpnkWZyvXaanzLYfdPSUFifZ6CNROKzs8zV
 vqIdrX23ixFj5RqAFz8TKBa9+I3OCNbjoaDrtbtGa8bRd8aKPWs++BR0Y w==;
X-CSE-ConnectionGUID: AnkY73YoTAOCwe7i+WwguQ==
X-CSE-MsgGUID: 8QLBh6jgRCCgbXtRF2i3aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37429302"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="37429302"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:47:20 -0800
X-CSE-ConnectionGUID: xjb4Ymk8RGigrg9mVltImw==
X-CSE-MsgGUID: T0rfv8D1TnmQeL4TxRYRyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107525984"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 21:47:18 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ben.kao@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 2/7] drm/i915/backlight: Use proper interface based on eDP
 version
Date: Fri, 24 Jan 2025 11:16:26 +0530
Message-Id: <20250124054631.1796456-3-suraj.kandpal@intel.com>
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

eDP is supposed to use VESA interface when using revision 1.5 and above,
use Intel interface for backlight control otherwise. Add check to
use correct interface.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index c846ef4acf5b..09e82f24d030 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -604,6 +604,7 @@ static const struct intel_panel_bl_funcs intel_dp_vesa_bl_funcs = {
 int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(connector);
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_device *dev = connector->base.dev;
 	struct intel_panel *panel = &connector->panel;
 	bool try_intel_interface = false, try_vesa_interface = false;
@@ -640,6 +641,10 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
 		break;
 	}
 
+	/* For eDP 1.5 and above we are supposed to use VESA interface for brightness control */
+	if (intel_dp->edp_dpcd[0] >= DP_EDP_15)
+		try_vesa_interface = true;
+
 	/*
 	 * Since Intel has their own backlight control interface, the majority of machines out there
 	 * using DPCD backlight controls with Intel GPUs will be using this interface as opposed to
@@ -653,7 +658,8 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
 	 * backlight interface at all. This means that the only sensible way for us to detect both
 	 * interfaces is to probe for Intel's first, and VESA's second.
 	 */
-	if (try_intel_interface && intel_dp_aux_supports_hdr_backlight(connector)) {
+	if (try_intel_interface && intel_dp_aux_supports_hdr_backlight(connector) &&
+	    intel_dp->edp_dpcd[0] <= DP_EDP_14b) {
 		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Using Intel proprietary eDP backlight controls\n",
 			    connector->base.base.id, connector->base.name);
 		panel->backlight.funcs = &intel_dp_hdr_bl_funcs;
-- 
2.34.1

