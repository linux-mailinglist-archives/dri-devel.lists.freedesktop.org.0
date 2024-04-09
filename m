Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188E089D5E1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 11:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4BB112C2D;
	Tue,  9 Apr 2024 09:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWRLoQsC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7430B112C2C;
 Tue,  9 Apr 2024 09:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712655999; x=1744191999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DiuNeppxbU1EX6XrKXjQsUFj2/iovhCJzpATxlsSWAY=;
 b=jWRLoQsCzDtJlrfQzuFX9avo8LC2YLGao3B6k7O80XSdlG4HhGBz2hRm
 vgyv3cdgKwu+7yx16NRIaAbeCUQgA4dJFTv3B+E1h+2+tTo0f8EEQW0+3
 FoXHsxPxZ3w1QBrB6pvMcnFct0JijH7bG0J6s7XRl999Byjiw33PnjhZG
 ajVJNyKzPbPm1NzH8yplDt3yTegs9Gv2oT0/QZufer4BiC3swAPE26ViU
 EJSzmeFzPFzSWfHe/WdNkc5AaAhdsLk+N2yOdDNo1FGjL/wi0aloriQy5
 csaro/1xCo3zFnOwV2+U7LWkP1yG4bON2V/ftp69zO7NBQxJDsDGP5gF8 A==;
X-CSE-ConnectionGUID: IU1Dw9d+RNm+fFTnabZsQg==
X-CSE-MsgGUID: 0lSrLGVUTwWSuqZRXt26PQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11758386"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="11758386"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 02:46:39 -0700
X-CSE-ConnectionGUID: 5IDVEoXZTNaUtj/8cjLgYg==
X-CSE-MsgGUID: rMiAXusPRMawbon1fJiOCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24662275"
Received: from mserban-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 02:46:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Melissa Wen <mwen@igalia.com>, ville.syrjala@linux.intel.com
Subject: [PATCH v2 4/4] drm/i915/bios: return drm_edid_product_id from
 get_lvds_pnp_id()
Date: Tue,  9 Apr 2024 12:46:12 +0300
Message-Id: <4dc7bfc48e65d29829843941a70c8bf97b87abcc.1712655867.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712655867.git.jani.nikula@intel.com>
References: <cover.1712655867.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use a more suitable type to avoid the cast.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Acked-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 3d89e4b39fed..661842a3c2e6 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -595,7 +595,7 @@ get_lvds_fp_timing(const struct bdb_lvds_lfp_data *data,
 	return (const void *)data + ptrs->ptr[index].fp_timing.offset;
 }
 
-static const struct lvds_pnp_id *
+static const struct drm_edid_product_id *
 get_lvds_pnp_id(const struct bdb_lvds_lfp_data *data,
 		const struct bdb_lvds_lfp_data_ptrs *ptrs,
 		int index)
@@ -679,7 +679,7 @@ static int pnpid_get_panel_type(struct drm_i915_private *i915,
 		return -1;
 
 	for (i = 0; i < 16; i++) {
-		const struct lvds_pnp_id *vbt_id =
+		const struct drm_edid_product_id *vbt_id =
 			get_lvds_pnp_id(data, ptrs, i);
 
 		/* full match? */
@@ -877,7 +877,7 @@ parse_lfp_data(struct drm_i915_private *i915,
 	const struct bdb_lvds_lfp_data *data;
 	const struct bdb_lvds_lfp_data_tail *tail;
 	const struct bdb_lvds_lfp_data_ptrs *ptrs;
-	const struct lvds_pnp_id *pnp_id;
+	const struct drm_edid_product_id *pnp_id;
 	struct drm_printer p;
 	int panel_type = panel->vbt.panel_type;
 
@@ -895,7 +895,7 @@ parse_lfp_data(struct drm_i915_private *i915,
 	pnp_id = get_lvds_pnp_id(data, ptrs, panel_type);
 
 	p = drm_dbg_printer(&i915->drm, DRM_UT_KMS, "Panel");
-	drm_edid_print_product_id(&p, (const struct drm_edid_product_id *)pnp_id, false);
+	drm_edid_print_product_id(&p, pnp_id, false);
 
 	tail = get_lfp_data_tail(data, ptrs);
 	if (!tail)
-- 
2.39.2

