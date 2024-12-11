Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AB99EDAC1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F281110EC57;
	Wed, 11 Dec 2024 23:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkzAxyRg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6458010EC57;
 Wed, 11 Dec 2024 23:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733958180; x=1765494180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GD3urlubJOUD/5fS+x121FKLyWU25hRdvB3HWimlS+E=;
 b=LkzAxyRg/5yGrAz5h25F8QRHgiBLmb5+WQiHSt4AZkKGNnVPILOs+FBK
 TKscWblUqMsNwTgqYnKI/H2RYCJqmCRAW8cTXQ2gflE0IiR/+e1w130wu
 vyOntxiAZNY82ICcNsx3LVNaL0eRyBGUq/S1UqkMMDx2rtWsMW1ob+Ivb
 b5dM52I6dgAVuOERmtiN95fjjTim68f4ZliUl83/0BhGdVV3ZLsReerUt
 2FLTrTzAve72qKCX0iWs1RfNS5JJj2xgS2c8lbZ+c+F7v3b/jEQwWs+lj
 EMtHhk70GCQTuo9GNt++xs9fqgWm5qT05qXu00Cn2zzVX0RSHXVGE747R Q==;
X-CSE-ConnectionGUID: hPhDg58NQg+QXb4x3JAT4w==
X-CSE-MsgGUID: 9g8Buq6LQ2ufpNu4gV91AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34401486"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34401486"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:02:59 -0800
X-CSE-ConnectionGUID: j+tH4RGoQY+QhBoAIFvneQ==
X-CSE-MsgGUID: R+K0wUnpSd6Xz30rCIz5iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126962510"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:02:57 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 05/11] drm/i915/dp_mst: Expose a connector to kernel users
 after it's properly initialized
Date: Thu, 12 Dec 2024 01:03:22 +0200
Message-ID: <20241211230328.4012496-6-imre.deak@intel.com>
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

v2: Rebase on the change which moves adding the connector to the
    connector list only later when calling
    drm_connector_dynamic_register().

Cc: Lyude Paul <lyude@redhat.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (v1)
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 27 +++++++--------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 123c4ece62688..debe4d0eee11f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1731,6 +1731,8 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 	if (!intel_connector)
 		return NULL;
 
+	connector = &intel_connector->base;
+
 	intel_connector->get_hw_state = mst_connector_get_hw_state;
 	intel_connector->sync_state = intel_dp_connector_sync_state;
 	intel_connector->mst_port = intel_dp;
@@ -1739,30 +1741,19 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 
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
+	ret = drm_connector_dynamic_init(display->drm, connector, &mst_connector_funcs,
+					 DRM_MODE_CONNECTOR_DisplayPort, NULL);
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
-- 
2.44.2

