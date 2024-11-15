Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6522C9CF1CB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 17:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7301210E187;
	Fri, 15 Nov 2024 16:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OiC1CjOG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9C810E187;
 Fri, 15 Nov 2024 16:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731688886; x=1763224886;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XE3pjKFvnanpPAnLUf4NhqTKLERyg2ySPRgM3P2OwNg=;
 b=OiC1CjOGG95YeJJ3EQOATTHpzTlYeoF8hy0cDpNv3Qv4mzuT0arxOM5+
 Ln5KOsLnhqTNsXOBTUnQZB7jrrNTEinu1CEuU37RUC6jsb+1LCTnjg+9g
 At/X6sD3Eg3EJxV4EL45VSaq5F0a2UpS0lWVqaXG5M+GU1HQb86oNPFj7
 ZbsL0h7OYDmelWq+74Fy2tv0jPDi0AqSCfFjk1y0nE3Iz2pybQaux465l
 WxB2V/Mjrqd7JnmK/g7HfP36lxgZSouX3TP7Z/aaatw0CIHUWObt6RrdG
 VSPNBNpXZ2+OV5YE++y+RNv+MPHFMDknU6zKKgJZQnRlvVUP3+WBXvU81 A==;
X-CSE-ConnectionGUID: gfZdZ5VkRiqQvul9fGas/A==
X-CSE-MsgGUID: RAw6lLS8Sg6FO2txFq6Xaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31087077"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31087077"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 08:41:26 -0800
X-CSE-ConnectionGUID: xrkSQVCFRXeOWtmNy8y+XQ==
X-CSE-MsgGUID: wuJDh/l7RBqm9MbxIjD7aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="119554622"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 08:41:26 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915/dp_mst: Expose a connector to kernel users after
 it's properly initialized
Date: Fri, 15 Nov 2024 18:41:58 +0200
Message-ID: <20241115164159.1081675-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20241115164159.1081675-1-imre.deak@intel.com>
References: <20241115164159.1081675-1-imre.deak@intel.com>
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
look-ups.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 29 ++++++++-------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index f058360a26413..d91a1d1fb26f4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1719,6 +1719,8 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	if (!intel_connector)
 		return NULL;
 
+	connector = &intel_connector->base;
+
 	intel_connector->get_hw_state = intel_dp_mst_get_hw_state;
 	intel_connector->sync_state = intel_dp_connector_sync_state;
 	intel_connector->mst_port = intel_dp;
@@ -1727,30 +1729,19 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 
 	intel_dp_init_modeset_retry_work(intel_connector);
 
-	/*
-	 * TODO: The following drm_connector specific initialization belongs
-	 * to DRM core, however it happens atm too late in
-	 * drm_connector_init(). That function will also expose the connector
-	 * to in-kernel users, so it can't be called until the connector is
-	 * sufficiently initialized; init the device pointer used by the
-	 * following DSC setup, until a fix moving this to DRM core.
-	 */
-	intel_connector->base.dev = mgr->dev;
-
-	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
-	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
-	intel_connector->dp.dsc_hblank_expansion_quirk =
-		detect_dsc_hblank_expansion_quirk(intel_connector);
-
-	connector = &intel_connector->base;
-	ret = drm_connector_init(display->drm, connector, &intel_dp_mst_connector_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
+	ret = drm_connector_init_core(display->drm, connector, &intel_dp_mst_connector_funcs,
+				      DRM_MODE_CONNECTOR_DisplayPort);
 	if (ret) {
 		drm_dp_mst_put_port_malloc(port);
 		intel_connector_free(intel_connector);
 		return NULL;
 	}
 
+	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
+	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
+	intel_connector->dp.dsc_hblank_expansion_quirk =
+		detect_dsc_hblank_expansion_quirk(intel_connector);
+
 	drm_connector_helper_add(connector, &intel_dp_mst_connector_helper_funcs);
 
 	for_each_pipe(display, pipe) {
@@ -1771,6 +1762,8 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 		drm_dbg_kms(display->drm, "[%s:%d] HDCP MST init failed, skipping.\n",
 			    connector->name, connector->base.id);
 
+	drm_connector_add(connector);
+
 	return connector;
 
 err:
-- 
2.44.2

