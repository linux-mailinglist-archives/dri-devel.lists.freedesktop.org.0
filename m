Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3654F88570F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 11:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471DB10E592;
	Thu, 21 Mar 2024 10:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gag2YAaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC06A10E587;
 Thu, 21 Mar 2024 10:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711015536; x=1742551536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kUTssbkm4aVrlhr7htJ+4E0DZyVtxrnJ+yYtkyy0Yw0=;
 b=gag2YAaDNKVMVqEXKWT+g8cHdHIDtHpfKBDwoJLmTFSYEE9PRxkjpboX
 sLyGyFlr0eo0cnS+ABKhNPZwn48XP//ZyUv5QcSUDkn/i2IxUJH1SicZH
 ad4jluqskh6teagb9VhKiYKaMBemOryLP/WaqhEhxZ+pf173DQhWfE5Hv
 HMzQQrxl8WA3e0n4uwyfHMg3WvIZAYSjGPVAil+0FEiLIRwhHFjdOv94I
 OWSLjYp7IVpGa5+BQAhXUPsFpq/idcmgFW9lhnPOhf0hK428kVg8t6/VC
 sAy65b+9bM3drFyp19zJ9yFr8burrcHk2ITUVbIFqO26t9bTZugBaheJ+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5824282"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5824282"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="19180219"
Received: from amaslenx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.141])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:05:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH 4/4] drm/i915/bios: return drm_edid_product_id from
 get_lvds_pnp_id()
Date: Thu, 21 Mar 2024 12:05:12 +0200
Message-Id: <ab886be7dffab621f813d0860fd1f7ccadf1c60a.1711015462.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1711015462.git.jani.nikula@intel.com>
References: <cover.1711015462.git.jani.nikula@intel.com>
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

Use a more suitable type to avoid the cast.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 5e111a8cce66..300c1acf5de2 100644
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

