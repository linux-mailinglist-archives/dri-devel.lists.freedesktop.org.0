Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AD578403C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 14:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D20A10E337;
	Tue, 22 Aug 2023 12:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC5F10E32A;
 Tue, 22 Aug 2023 12:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692705725; x=1724241725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iEE3gFYgIvOtnPfnbrq1fdhKUUxUxXK3HPwffxlpaT0=;
 b=QKk8LcEYvtIhLilnWFDWTxifuL9iG37oyv9ZK5ivr+AzXvTD9UoZvHXE
 WxMwNIfLUfo9iB/5iSylWLaUiExyhPP3us5yUQJmSr4+3PFhAGw3gMvmC
 wADlQulViry484BUOMLK/2VPAmrs9ENQuAOBekZf+d08kWWhjc3oGbK8e
 c/RbXGlzGfggoIkFrH5oYuZO8zgdD3irfHnbIkZvYXsseonSEEEjLBndc
 gRUZzUfnr12Rn5CQSabxeiKtWHeAx1kghnGWWcL2X/nAEK2jhrEG51AIZ
 5KCvXcvaBu+5LBg8/lTca0tI2ebkSfA6HmaV+uRmnjVW5QJihbf0BMMI/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354198202"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="354198202"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 05:02:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="910070645"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="910070645"
Received: from kainaats-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.230])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 05:02:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] Revert "drm/amd/display: assign edid_blob_ptr with edid
 from debugfs"
Date: Tue, 22 Aug 2023 15:01:38 +0300
Message-Id: <3dc80275904322ca7066a96dbc46b6e8c1b9f76d.1692705543.git.jani.nikula@intel.com>
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

This reverts commit 550e5d23f14784e2a625c25fe0c9d498589c9256.

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
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3e132438bc13..c7c1260b7b6e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6370,20 +6370,11 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 	struct edid *edid;
 
 	if (!aconnector->base.edid_blob_ptr) {
-		/* if connector->edid_override valid, pass
-		 * it to edid_override to edid_blob_ptr
-		 */
-		int count;
-
-		count = drm_edid_override_connector_update(&aconnector->base);
-
-		if (!aconnector->base.edid_blob_ptr) {
-			DRM_ERROR("No EDID firmware found on connector: %s ,forcing to OFF!\n",
-					aconnector->base.name);
+		DRM_ERROR("No EDID firmware found on connector: %s ,forcing to OFF!\n",
+				aconnector->base.name);
 
-			aconnector->base.force = DRM_FORCE_OFF;
-			return;
-		}
+		aconnector->base.force = DRM_FORCE_OFF;
+		return;
 	}
 
 	edid = (struct edid *) aconnector->base.edid_blob_ptr->data;
-- 
2.39.2

