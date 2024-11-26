Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 454699D9B37
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 17:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B1810E939;
	Tue, 26 Nov 2024 16:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CD7vKpFa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BA010E922;
 Tue, 26 Nov 2024 16:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732637907; x=1764173907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vgjCUVKKAtc9E5nz/fvWhQGfTvHZkzM7RqJvm7mTr98=;
 b=CD7vKpFaWIlcmDMavh4CaWyc42EV1uJkW6zRdG3sAdfkeOrFkE11I/1C
 TS2xIIW2NJKQQFGMuhITD3jdvaJIjgyyYBofH8gUUj9Fd3FPqUCuIIgZ5
 gbE0FHkRlAczO6lT1fdSDiRLtOPBL3jZYfZOn9ZnFFTjFWjQZM34+9esy
 rwr46a7rIc/InPYY7I6OUeBYalAt+QVo1SyOHZDFtsxMy8EU1FlCWZSWK
 t5XxQY/hvoKgiHupnx5r7k+jLrXL8WFI4xZthbmj5Jlwj9M5DcDruk6n/
 rBCPq303pHTwJh9PQ77GmYGL+Wcp6TqR8E0Vrahpre5tlLGqMm45OiB2X Q==;
X-CSE-ConnectionGUID: qw1Lf0qvSkeQmGgXcdAyvg==
X-CSE-MsgGUID: FXBfSV57SESWQS+bxZ51Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32181819"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32181819"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:18:27 -0800
X-CSE-ConnectionGUID: o7kWOl8YRp6qH7ZW+oONuA==
X-CSE-MsgGUID: cVIpuK3bRF63PqYCga0pSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="91606400"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:18:26 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 3/4] drm/i915/dp_mst: Fix error handling while adding a
 connector
Date: Tue, 26 Nov 2024 18:18:58 +0200
Message-ID: <20241126161859.1858058-4-imre.deak@intel.com>
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

After an error during adding an MST connector the MST port and the
intel_connector object could be leaked, fix this up.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 3c21805f5d1eb..b019c65703578 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1712,11 +1712,8 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_connector_init_core(display->drm, connector, &mst_connector_funcs,
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
@@ -1731,12 +1728,12 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 
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
@@ -1747,8 +1744,12 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 
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

