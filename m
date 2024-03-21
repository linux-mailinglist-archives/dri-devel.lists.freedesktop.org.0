Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B93C88570D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 11:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD78010E57D;
	Thu, 21 Mar 2024 10:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4S1MkW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56ED10E579;
 Thu, 21 Mar 2024 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711015532; x=1742551532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NzQyvlwmE6EgDsTiQ9r1tri8UXlGotv9oWrKo4ADxko=;
 b=m4S1MkW2DPJiTEUczeK3MkXlVB6TKRdgI9l+boKbK7yd7h8e+ckJOt+0
 zYik5GXRPSQKRFSiSppSyVoZJpApGinqoUGqMGb4rO4HaXPmF2ASuopbR
 rkQdvfGFrr/ZEm208/jzCdICYrqnDzMAXiFZBRpuoFOOf0I0T1v9uWYGT
 IGXeOrfM/Zehm+S8/XoTu1aFhL//PQg55tr7w+dPn0cXLdiFgSEuWznCl
 VGPchn5jWZWXxaVRzOlZe8nmguT5yFgP/Re+zZd72aE6m2aQ7RH8yffD0
 BtLOFTfYj6ICGcANhNjo69m5cbqAlFVA1zMdfhIyxqfVTXuuA7sPYj9m+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="8945033"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="8945033"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:05:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="19155172"
Received: from amaslenx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.141])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:05:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH 3/4] drm/i915/bios: switch to struct drm_edid and struct
 drm_edid_product_id
Date: Thu, 21 Mar 2024 12:05:11 +0200
Message-Id: <0ea2df08465bfc63a0b4586ba7a50c7f8feda7af.1711015462.git.jani.nikula@intel.com>
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

To avoid accessing and parsing the raw EDID with drm_edid_raw(), switch
to the struct drm_edid based function to extract product id, and use the
drm printer function to debug log it.

The underlying assumption is that struct drm_edid_product_id and struct
lvds_pnp_id describe identical data, albeit with slightly different
member definitions.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 43 ++++++++++-------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index c7841b3eede8..5e111a8cce66 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -600,6 +600,9 @@ get_lvds_pnp_id(const struct bdb_lvds_lfp_data *data,
 		const struct bdb_lvds_lfp_data_ptrs *ptrs,
 		int index)
 {
+	/* These two are supposed to have the same layout in memory. */
+	BUILD_BUG_ON(sizeof(struct lvds_pnp_id) != sizeof(struct drm_edid_product_id));
+
 	return (const void *)data + ptrs->ptr[index].panel_pnp_id.offset;
 }
 
@@ -613,19 +616,6 @@ get_lfp_data_tail(const struct bdb_lvds_lfp_data *data,
 		return NULL;
 }
 
-static void dump_pnp_id(struct drm_i915_private *i915,
-			const struct lvds_pnp_id *pnp_id,
-			const char *name)
-{
-	u16 mfg_name = be16_to_cpu((__force __be16)pnp_id->mfg_name);
-	char vend[4];
-
-	drm_dbg_kms(&i915->drm, "%s PNPID mfg: %s (0x%x), prod: %u, serial: %u, week: %d, year: %d\n",
-		    name, drm_edid_decode_mfg_id(mfg_name, vend),
-		    pnp_id->mfg_name, pnp_id->product_code, pnp_id->serial,
-		    pnp_id->mfg_week, pnp_id->mfg_year + 1990);
-}
-
 static int opregion_get_panel_type(struct drm_i915_private *i915,
 				   const struct intel_bios_encoder_data *devdata,
 				   const struct drm_edid *drm_edid, bool use_fallback)
@@ -664,21 +654,21 @@ static int pnpid_get_panel_type(struct drm_i915_private *i915,
 {
 	const struct bdb_lvds_lfp_data *data;
 	const struct bdb_lvds_lfp_data_ptrs *ptrs;
-	const struct lvds_pnp_id *edid_id;
-	struct lvds_pnp_id edid_id_nodate;
-	const struct edid *edid = drm_edid_raw(drm_edid); /* FIXME */
+	struct drm_edid_product_id product_id, product_id_nodate;
+	struct drm_printer p;
 	int i, best = -1;
 
-	if (!edid)
+	if (!drm_edid)
 		return -1;
 
-	edid_id = (const void *)&edid->mfg_id[0];
+	drm_edid_get_product_id(drm_edid, &product_id);
 
-	edid_id_nodate = *edid_id;
-	edid_id_nodate.mfg_week = 0;
-	edid_id_nodate.mfg_year = 0;
+	product_id_nodate = product_id;
+	product_id_nodate.week_of_manufacture = 0;
+	product_id_nodate.year_of_manufacture = 0;
 
-	dump_pnp_id(i915, edid_id, "EDID");
+	p = drm_dbg_printer(&i915->drm, DRM_UT_KMS, "EDID");
+	drm_edid_print_product_id(&p, &product_id, true);
 
 	ptrs = bdb_find_section(i915, BDB_LVDS_LFP_DATA_PTRS);
 	if (!ptrs)
@@ -693,7 +683,7 @@ static int pnpid_get_panel_type(struct drm_i915_private *i915,
 			get_lvds_pnp_id(data, ptrs, i);
 
 		/* full match? */
-		if (!memcmp(vbt_id, edid_id, sizeof(*vbt_id)))
+		if (!memcmp(vbt_id, &product_id, sizeof(*vbt_id)))
 			return i;
 
 		/*
@@ -701,7 +691,7 @@ static int pnpid_get_panel_type(struct drm_i915_private *i915,
 		 * and the VBT entry does not specify a date.
 		 */
 		if (best < 0 &&
-		    !memcmp(vbt_id, &edid_id_nodate, sizeof(*vbt_id)))
+		    !memcmp(vbt_id, &product_id_nodate, sizeof(*vbt_id)))
 			best = i;
 	}
 
@@ -888,6 +878,7 @@ parse_lfp_data(struct drm_i915_private *i915,
 	const struct bdb_lvds_lfp_data_tail *tail;
 	const struct bdb_lvds_lfp_data_ptrs *ptrs;
 	const struct lvds_pnp_id *pnp_id;
+	struct drm_printer p;
 	int panel_type = panel->vbt.panel_type;
 
 	ptrs = bdb_find_section(i915, BDB_LVDS_LFP_DATA_PTRS);
@@ -902,7 +893,9 @@ parse_lfp_data(struct drm_i915_private *i915,
 		parse_lfp_panel_dtd(i915, panel, data, ptrs);
 
 	pnp_id = get_lvds_pnp_id(data, ptrs, panel_type);
-	dump_pnp_id(i915, pnp_id, "Panel");
+
+	p = drm_dbg_printer(&i915->drm, DRM_UT_KMS, "Panel");
+	drm_edid_print_product_id(&p, (const struct drm_edid_product_id *)pnp_id, false);
 
 	tail = get_lfp_data_tail(data, ptrs);
 	if (!tail)
-- 
2.39.2

