Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665CA78403F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 14:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE86010E32D;
	Tue, 22 Aug 2023 12:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACA810E32D;
 Tue, 22 Aug 2023 12:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692705738; x=1724241738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hp+NZXqHkpxwllrzrSaGmzU2Ind1Fopscc+Rym/pSdE=;
 b=cxlvcfOw2qXq28Ig96Uhl2I596mIekryjmXylUQjik3wCJDrW1zzUG1f
 EJrDdQyl9l8LWdxq4P983Ldey0agce+xIzN13XiPFm1qV46UVTdVKKtO4
 w1I2Sgid9IFn5uzczXhyI0yctdy9BWguc2rFBCbdPVqMXAyt9oIZhSxvE
 eZySDwa6/m5AY/aIx/FF33jMVmkyMCAw1ilr4W6ykW0zZFQHyLQE7LTnA
 i0x8blE2hKrjh3C6vq+3f51Nwv+TbRheTlnP3eFAe/uu8hnJIlb5qAbrD
 +EJ6zD/MNxWTIyi3oT8xIs13BZjozAS9u0DDK80YYUcTHBoUPmHYs7QhF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354198250"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="354198250"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 05:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="910070686"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="910070686"
Received: from kainaats-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.230])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 05:02:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] Revert "drm/amd/display: implement force function in
 amdgpu_dm_connector_funcs"
Date: Tue, 22 Aug 2023 15:01:40 +0300
Message-Id: <e65f30aa1bd581308f916fd005999ebe66618fad.1692705543.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1692705543.git.jani.nikula@intel.com>
References: <cover.1692705543.git.jani.nikula@intel.com>
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
Cc: Chao-kai Wang <Stylon.Wang@amd.com>, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Wenchieh Chien <wenchieh.chien@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 0ba4a784a14592abed41873e339eab78ceb6e230.

drm_edid_override_connector_update() is *not* supposed to be used by
drivers directly.

From the documentation:

  Only to be used from drm_helper_probe_single_connector_modes() as a
  fallback for when DDC probe failed during drm_get_edid() and caused
  the override/firmware EDID to be skipped.

It's impossible to unify firmare and override EDID handling and property
updates if drivers mess with this directly.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Chao-kai Wang <Stylon.Wang@amd.com>
Cc: Daniel Wheeler <daniel.wheeler@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Wenchieh Chien <wenchieh.chien@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +------------------
 1 file changed, 1 insertion(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index adfe2fcb915c..25151085508f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6317,31 +6317,6 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
 	return 0;
 }
 
-void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
-{
-	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
-	struct dc_link *dc_link = aconnector->dc_link;
-	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
-	struct edid *edid;
-
-	if (!connector->edid_override)
-		return;
-
-	drm_edid_override_connector_update(&aconnector->base);
-	edid = aconnector->base.edid_blob_ptr->data;
-	aconnector->edid = edid;
-
-	/* Update emulated (virtual) sink's EDID */
-	if (dc_em_sink && dc_link) {
-		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
-		memmove(dc_em_sink->dc_edid.raw_edid, edid, (edid->extensions + 1) * EDID_LENGTH);
-		dm_helpers_parse_edid_caps(
-			dc_link,
-			&dc_em_sink->dc_edid,
-			&dc_em_sink->edid_caps);
-	}
-}
-
 static const struct drm_connector_funcs amdgpu_dm_connector_funcs = {
 	.reset = amdgpu_dm_connector_funcs_reset,
 	.detect = amdgpu_dm_connector_detect,
@@ -6352,8 +6327,7 @@ static const struct drm_connector_funcs amdgpu_dm_connector_funcs = {
 	.atomic_set_property = amdgpu_dm_connector_atomic_set_property,
 	.atomic_get_property = amdgpu_dm_connector_atomic_get_property,
 	.late_register = amdgpu_dm_connector_late_register,
-	.early_unregister = amdgpu_dm_connector_unregister,
-	.force = amdgpu_dm_connector_funcs_force
+	.early_unregister = amdgpu_dm_connector_unregister
 };
 
 static int get_modes(struct drm_connector *connector)
-- 
2.39.2

