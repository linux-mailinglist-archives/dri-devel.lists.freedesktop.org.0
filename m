Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3BD9D9B38
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 17:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C19910E92D;
	Tue, 26 Nov 2024 16:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qx5jpExc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913F710E2D2;
 Tue, 26 Nov 2024 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732637906; x=1764173906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QQSWyB5oBAxwn3kX+HGhXhRv88YOfA0vFD/WlVI7GC4=;
 b=Qx5jpExccq/NYuk8qZM0DRIBk2bGXGi1hZunuubHujexdK5vo06wflyv
 TRf5ZipuOULhKGISXjsUHuVh7K9q70sf5daqYge+Jq4iGLc6suFoHmajN
 J3a+IjsgX7uJ44XxVlPPkzj5bAFbdNkYNWWWKXaOTtEQEgTAsjxzIPbgw
 5//wQE8bd62K1EFVgOAHK4Z4y4dhzbcEBgyL27pKeGF/hlE3RCvswobRN
 ShuESmjXd5ZpMD1xDNzYUiCJR7lTLdYEuEu1TFM0B9XNc3Uq9H07BlEBO
 SFY+JM21VCuw9BZnhgMazeYCClM4OCBEL5KIRNbPm2YqD7ur3+AWfFNvZ A==;
X-CSE-ConnectionGUID: B7iiPe4NRoiPPX1fZDgcJg==
X-CSE-MsgGUID: e/vhpTl7TbyWOTf1Dh3eJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32181811"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32181811"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:18:25 -0800
X-CSE-ConnectionGUID: KT9tG5geRFK0eD+Z7c0XZw==
X-CSE-MsgGUID: HyVcWNnMQg+oD+L2xbHAbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="91606393"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:18:24 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 2/4] drm/i915/dp_mst: Expose a connector to kernel users
 after it's properly initialized
Date: Tue, 26 Nov 2024 18:18:57 +0200
Message-ID: <20241126161859.1858058-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20241126161859.1858058-1-imre.deak@intel.com>
References: <20241126161859.1858058-1-imre.deak@intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 29 ++++++++-------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index c59c2c14679c4..3c21805f5d1eb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1700,6 +1700,8 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 	if (!intel_connector)
 		return NULL;
 
+	connector = &intel_connector->base;
+
 	intel_connector->get_hw_state = mst_connector_get_hw_state;
 	intel_connector->sync_state = intel_dp_connector_sync_state;
 	intel_connector->mst_port = intel_dp;
@@ -1708,30 +1710,19 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 
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
-	ret = drm_connector_init(display->drm, connector, &mst_connector_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
+	ret = drm_connector_init_core(display->drm, connector, &mst_connector_funcs,
+				      DRM_MODE_CONNECTOR_DisplayPort, NULL);
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
 	drm_connector_helper_add(connector, &mst_connector_helper_funcs);
 
 	for_each_pipe(display, pipe) {
@@ -1752,6 +1743,8 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 		drm_dbg_kms(display->drm, "[%s:%d] HDCP MST init failed, skipping.\n",
 			    connector->name, connector->base.id);
 
+	drm_connector_add(connector);
+
 	return connector;
 
 err:
-- 
2.44.2

