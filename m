Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E2F9CF1CC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 17:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D89810E2D1;
	Fri, 15 Nov 2024 16:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlWZjcNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BF810E187;
 Fri, 15 Nov 2024 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731688888; x=1763224888;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1MkKQOlRR6eQEXqw3+vcN6WiR3YDSGfckt5F1GJLyHY=;
 b=VlWZjcNzfPj+HRW0u6b+9xlLXF/V/S1wpsPkmtqmXv77oaPQwQjlxlNO
 oheast5a5vzMNpO/zh2BXjte9lL8zAJQgp52QziE8bYht/bzEZCce7O97
 WGZNkrKCgtSiqONWV+/TRFDpsq5n75QS+3f6OggEFXuXF7lgmnFhjcHBc
 PbinmNa3gzdMjdWbq2F14xl8aDQv94BptOrE8wKw5DS7mELvRa2bOWPBr
 BgssFe2rigUujzka5W7Hris73f0A3K6qSsglW4Eap+vtv99dH3941jhRb
 gWfLdrEFCLbQd1Qa64Ul8RkGj48ZCL9yFn46plPXot5urWwXngm2uk9ii g==;
X-CSE-ConnectionGUID: /SnVuNkJTSuEAq+kubvdzA==
X-CSE-MsgGUID: g6WoW4dgTcSzMh3tkJo7Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31087079"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31087079"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 08:41:27 -0800
X-CSE-ConnectionGUID: KkcCBGWTRPmWbEed8zLxqg==
X-CSE-MsgGUID: 1dk9/6uhSOWmwUoo+EWm0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="119554624"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 08:41:27 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/dp_mst: Fix error handling while adding a
 connector
Date: Fri, 15 Nov 2024 18:41:59 +0200
Message-ID: <20241115164159.1081675-4-imre.deak@intel.com>
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

After an error during adding an MST connector the MST port and the
intel_connector object could be leaked, fix this up.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index d91a1d1fb26f4..70daa9131c92d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1731,11 +1731,8 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 
 	ret = drm_connector_init_core(display->drm, connector, &intel_dp_mst_connector_funcs,
 				      DRM_MODE_CONNECTOR_DisplayPort);
-	if (ret) {
-		drm_dp_mst_put_port_malloc(port);
-		intel_connector_free(intel_connector);
-		return NULL;
-	}
+	if (ret)
+		goto err_put_port;
 
 	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
 	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
@@ -1750,12 +1747,12 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 
 		ret = drm_connector_attach_encoder(&intel_connector->base, enc);
 		if (ret)
-			goto err;
+			goto err_cleanup_connector;
 	}
 
 	ret = intel_dp_mst_add_properties(intel_dp, connector, pathprop);
 	if (ret)
-		goto err;
+		goto err_cleanup_connector;
 
 	ret = intel_dp_hdcp_init(dig_port, intel_connector);
 	if (ret)
@@ -1766,8 +1763,12 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 
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

