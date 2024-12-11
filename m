Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4D59EDAC4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31DA10EC5B;
	Wed, 11 Dec 2024 23:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F291Z76u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057FF10EC58;
 Wed, 11 Dec 2024 23:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733958182; x=1765494182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xWx7D6gil7lDx+/G2SLm0hD2VCU/iLv8P+tC+OVl/ko=;
 b=F291Z76udXJsp7d5El/MxIOIIqq0JJ8gSt9ThSB/wnBVJ+rSgRR++Bp/
 q4iikQ4D+LLN5kjCi6YIDPbpCpf5dVR5Sd16Ea1SSMH3NJM7gR8DDr+KL
 Hf+C7U8Qo3DECCAY95nBTM2Fu4VHjPxhAZHvCcIjhHLbRMeV5UZEmlgN4
 Xz6AYj5GtzOLBvO0R1Xi7dAsbGEVFiyflEUy1ZljTdI9PDzFCXI0b0yAs
 RoWTA0ZCs2DEcZoM31a9RQtqUs06MCqUuRGkM3Q3IZfC0+ETmwDYqNvUL
 not+rkxnYZln7z7LM1v2nVWkvEeqvUG+1dDIS9hz0nrifhc3QB43U60XB A==;
X-CSE-ConnectionGUID: EEIwU1f4QBGpdop2JtJvVg==
X-CSE-MsgGUID: X848dY8zTTimftXLVLPs2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34401492"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34401492"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:03:01 -0800
X-CSE-ConnectionGUID: joAzLjU/SJuSKrzxd+/RQA==
X-CSE-MsgGUID: Vrm6wAwIR46MeXOzjoQetQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126962511"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:02:58 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v3 06/11] drm/amd/dp_mst: Expose a connector to kernel users
 after it's properly initialized
Date: Thu, 12 Dec 2024 01:03:23 +0200
Message-ID: <20241211230328.4012496-7-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20241211230328.4012496-1-imre.deak@intel.com>
References: <20241211230328.4012496-1-imre.deak@intel.com>
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

After a connector is added to the drm_mode_config::connector_list, it's
visible to any in-kernel users looking up connectors via the above list.
Make sure that the connector is properly initialized before such
look-ups, by initializing the connector with
drm_connector_dynamic_register() - which doesn't add the connector to
the list - and registering it with drm_connector_dynamic_register() -
which adds the connector to the list - after the initialization is
complete.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 6e43594906130..d398bc74e6677 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -590,11 +590,12 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 	amdgpu_dm_set_mst_status(&aconnector->mst_status,
 			MST_PROBE, true);
 
-	if (drm_connector_init(
+	if (drm_connector_dynamic_init(
 		dev,
 		connector,
 		&dm_dp_mst_connector_funcs,
-		DRM_MODE_CONNECTOR_DisplayPort)) {
+		DRM_MODE_CONNECTOR_DisplayPort,
+		NULL)) {
 		kfree(aconnector);
 		return NULL;
 	}
-- 
2.44.2

