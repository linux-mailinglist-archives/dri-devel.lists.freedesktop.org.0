Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E2DB117A9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DFF10E443;
	Fri, 25 Jul 2025 05:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lcFi57bZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4D910E439;
 Fri, 25 Jul 2025 05:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419884; x=1784955884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ot51bRzTYqANItB4MwpxnEG5C8FmarjQ91Gi+PPlTuc=;
 b=lcFi57bZviClnHNXSIwtG99ugH+Ug2JOaB1eO+v1KsMSYisCfOT5W00L
 6tc287x1gvT/zb+DvlbJl00RKR49+gozu+xynxvix8WWhDhnpy4d0yvZI
 3926sY8hqalVzYqO6BaNcQheRYiEs50uX1wLUF8wTp1ZH44538s6F6pC6
 oMW0Mf0Sk4k748ZyHhjfUKwjMsPydKHhtUuO/vUkZOGLg5RAbkumEJO+8
 zE52JuCyA2ff6QcNLw95Zabm2NWQbNWg4r77N+AIOw7CldZwt/EsuUjxZ
 PEtYQJ/t9BGhenKhiRUhzn9vnN38KmUc2qgMbTFBXL1s8CbcHu+HRmEg4 w==;
X-CSE-ConnectionGUID: 8e28PSYRT3C9TKLEj61T5Q==
X-CSE-MsgGUID: 1YLz0XhISJ6vIy+QR9Bycw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299543"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299543"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:44 -0700
X-CSE-ConnectionGUID: WFDDirl+TMK6bDXxwXAUpw==
X-CSE-MsgGUID: jC4060jNTz2L3rlBMWOgEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956620"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:42 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 12/28] drm/i915/writeback: Fill encoder->get_config
Date: Fri, 25 Jul 2025 10:33:53 +0530
Message-Id: <20250725050409.2687242-13-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
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

Fill the encoder->get_config hook with relevant data which helps
verify state.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_writeback.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 91ca74de7652..674cc4ecf1b9 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -139,6 +139,14 @@ static const struct drm_writeback_connector_helper_funcs writeback_conn_helper_f
 	.get_connector_from_writeback = intel_get_connector_from_writeback,
 };
 
+static void
+intel_writeback_get_config(struct intel_encoder *encoder,
+			   struct intel_crtc_state *crtc_state)
+{
+	crtc_state->output_types |= BIT(INTEL_OUTPUT_WRITEBACK);
+	crtc_state->output_format = INTEL_OUTPUT_FORMAT_RGB;
+}
+
 static bool
 intel_writeback_get_hw_state(struct intel_encoder *encoder,
 			     enum pipe *pipe)
@@ -209,6 +217,7 @@ int intel_writeback_init(struct intel_display *display)
 	encoder->type = INTEL_OUTPUT_WRITEBACK;
 	encoder->pipe_mask = ~0;
 	encoder->cloneable = 0;
+	encoder->get_config = intel_writeback_get_config;
 	encoder->get_hw_state = intel_writeback_get_hw_state;
 
 	connector = &writeback_conn->connector;
-- 
2.34.1

