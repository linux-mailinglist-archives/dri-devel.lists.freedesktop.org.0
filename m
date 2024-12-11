Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 026309EDACD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5704010EC67;
	Wed, 11 Dec 2024 23:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0Nmo74G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7170610EC58;
 Wed, 11 Dec 2024 23:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733958188; x=1765494188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9hpvom8gqM7VbLowtit27JJWQ8Psc7stb5VXmDwJz/0=;
 b=j0Nmo74GkKUl13diUfQdW3NVdy5UDxNyobhY6nGzatE5sd9K+mqKZf+z
 OD1mZ032HPkMFL8unc4phSPfWMmhBeCOKrCOiMxx2CwpHU5gEVxSxo3Ic
 AMYrK2mEmq4DaOCQx+zFP4dsg+vI1o7fPDb0rkYYVR6IPNdjU+wJeIa9l
 g1Lf/6Ua6RZxgHhSyat1b8tCf0TLoXdQpwc3+/semVo8oouRZVwU2adxo
 /d6u4W6CCMzR3pOie9rxaVElUhv2ebGi7K3VtalKKfjeRbNrhhnyzh8dt
 maRVpKTZOjvVddMNojAVEjqZWgJw1I7GJjxnpZ9P3XQzvEFWBKgrf6ax2 A==;
X-CSE-ConnectionGUID: nAJNv0HETlqmDS4XbQQ+nw==
X-CSE-MsgGUID: YTIbN3FkTQSqIlGs2n8XyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34401517"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34401517"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:03:08 -0800
X-CSE-ConnectionGUID: DFqF02aYSyqhsq47oQrGdQ==
X-CSE-MsgGUID: +cHKP3haQ3aERcOaY/Pqtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126962728"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:03:05 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 10/11] drm/i915/dp_mst: Fix error handling while adding a
 connector
Date: Thu, 12 Dec 2024 01:03:27 +0200
Message-ID: <20241211230328.4012496-11-imre.deak@intel.com>
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

After an error during adding an MST connector the MST port and the
intel_connector object could be leaked, fix this up.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index debe4d0eee11f..99f08e31fd6e0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1743,11 +1743,8 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_connector_dynamic_init(display->drm, connector, &mst_connector_funcs,
 					 DRM_MODE_CONNECTOR_DisplayPort, NULL);
-	if (ret) {
-		drm_dp_mst_put_port_malloc(port);
-		intel_connector_free(intel_connector);
-		return NULL;
-	}
+	if (ret)
+		goto err_put_port;
 
 	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
 	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
@@ -1762,12 +1759,12 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 
 		ret = drm_connector_attach_encoder(&intel_connector->base, enc);
 		if (ret)
-			goto err;
+			goto err_cleanup_connector;
 	}
 
 	ret = mst_topology_add_connector_properties(intel_dp, connector, pathprop);
 	if (ret)
-		goto err;
+		goto err_cleanup_connector;
 
 	ret = intel_dp_hdcp_init(dig_port, intel_connector);
 	if (ret)
@@ -1776,8 +1773,12 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 
 	return connector;
 
-err:
+err_cleanup_connector:
 	drm_connector_cleanup(connector);
+err_put_port:
+	drm_dp_mst_put_port_malloc(port);
+	intel_connector_free(intel_connector);
+
 	return NULL;
 }
 
-- 
2.44.2

