Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFA3A7A9F8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 21:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BB610EA6C;
	Thu,  3 Apr 2025 19:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8j/FwGX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B35F10EA6B;
 Thu,  3 Apr 2025 19:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743707152; x=1775243152;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HdISfgb4oMSAsFrQV4Fxpf9OU1QKqFGGdHkFELMdJII=;
 b=V8j/FwGX4Sgj21ig1W5Z8IVRjQ6AHkR0GYkDsOYwOrEwDQzAEDAuSPb0
 HHivQNfZIjX7tDppzWPQ7DEO7R21VvHKdSF8Hy60kF4w4fQynbR+oOr5g
 saqgqgaMoC9TcqqbZu+oAHjdCP+C6Kn0bCIhq1XC9xRDXuNkzRh+674DX
 InlpiLnPkM4a80ZpC/yOa3P96EqPTXeHyf+0KlIO97l/oGqK9S7kAOCE4
 7VfZoV6W0viB6U6/DxYyq9raJw340bM/EhekCdaJq81t0Xx1wIb1U4iaa
 +tF4phj1p+pR0LDBwWE6wwVgeVrMNb4sq8yBDTZXPQdW8HgXVGoRCe6Rv w==;
X-CSE-ConnectionGUID: Y8NtJjD8QqazUyu71y0qrg==
X-CSE-MsgGUID: c8m1KMRCRqeZJUT+SZsRAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="56502166"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="56502166"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 12:05:51 -0700
X-CSE-ConnectionGUID: 5ZtGGJxsRaq+a5l6RyK23Q==
X-CSE-MsgGUID: BAHpTNDAQQu2GMOEYA8Wzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="132304411"
Received: from sowmya001-nuc10i7fnh (HELO localhost.localdomain)
 ([10.223.165.176])
 by orviesa005.jf.intel.com with ESMTP; 03 Apr 2025 12:05:50 -0700
From: shantam.yashashvi@intel.com
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	shantam.yashashvi@intel.com
Subject: drm/i915: Add DSC/FEC support info to debugfs
Date: Fri,  4 Apr 2025 00:34:48 +0530
Message-Id: <20250403190448.29795-1-shantam.yashashvi@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Shantam Yashashvi <shantam.yashashvi@intel.com>

Signed-off-by: Shantam Yashashvi <shantam.yashashvi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 057a8ce0c2c97..b8d3a438a34d9 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -276,6 +276,7 @@ static void intel_connector_info(struct seq_file *m,
 	struct intel_encoder *encoder =
 		to_intel_encoder(conn_state->best_encoder);
 	const struct drm_display_mode *mode;
+	struct intel_dp *intel_dp;
 
 	seq_printf(m, "[CONNECTOR:%d:%s]: status: %s\n",
 		   connector->base.id, connector->name,
@@ -301,6 +302,16 @@ static void intel_connector_info(struct seq_file *m,
 			intel_dp_mst_info(m, intel_connector);
 		else
 			intel_dp_info(m, intel_connector);
+
+		/* Add DSC and FEC Support Information for DisplayPort / eDP Connectors */
+		intel_dp = intel_attached_dp(intel_connector);
+		if (intel_dp){
+			seq_printf(m, "\tDSC_Sink_Support: %s\n",
+                str_yes_no(drm_dp_sink_supports_dsc(intel_connector->dp.dsc_dpcd)));
+			if (!intel_dp_is_edp(intel_dp))
+				    seq_printf(m, "\tFEC_Sink_Support: %s\n",
+				        str_yes_no(drm_dp_sink_supports_fec(intel_connector->dp.fec_capability)));
+		}
 		break;
 	case DRM_MODE_CONNECTOR_HDMIA:
 		if (encoder->type == INTEL_OUTPUT_HDMI ||
-- 
2.25.1

