Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA423A8254
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 16:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D8B6E420;
	Tue, 15 Jun 2021 14:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE986E3D8;
 Tue, 15 Jun 2021 14:14:39 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 54F8DC800A1;
 Tue, 15 Jun 2021 16:14:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id TrgvS9G5RKIs; Tue, 15 Jun 2021 16:14:38 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37F3949009F7CF2Abd5Da2787.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:9f7c:f2ab:d5da:2787])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id E6768C800B5;
 Tue, 15 Jun 2021 16:14:37 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 10/14] drm/amd/display: Add handling for new "active color
 range" property
Date: Tue, 15 Jun 2021 16:14:21 +0200
Message-Id: <20210615141426.6001-11-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615141426.6001-1-wse@tuxedocomputers.com>
References: <20210615141426.6001-1-wse@tuxedocomputers.com>
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
Cc: Werner Sembach <wse@tuxedocomputers.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit implements the "active color range" drm property for the AMD GPU
driver.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 +++++++++++++++++++
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  4 +++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b66336a1403e..705cd2e015af 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6732,6 +6732,33 @@ static int convert_dc_pixel_encoding_into_drm_color_format(enum dc_pixel_encodin
 	return 0;
 }
 
+static int convert_dc_color_space_into_drm_mode_color_range(enum dc_color_space color_space)
+{
+	if (color_space == COLOR_SPACE_SRGB ||
+	    color_space == COLOR_SPACE_XR_RGB ||
+	    color_space == COLOR_SPACE_MSREF_SCRGB ||
+	    color_space == COLOR_SPACE_2020_RGB_FULLRANGE ||
+	    color_space == COLOR_SPACE_ADOBERGB ||
+	    color_space == COLOR_SPACE_DCIP3 ||
+	    color_space == COLOR_SPACE_DOLBYVISION ||
+	    color_space == COLOR_SPACE_YCBCR601 ||
+	    color_space == COLOR_SPACE_XV_YCC_601 ||
+	    color_space == COLOR_SPACE_YCBCR709 ||
+	    color_space == COLOR_SPACE_XV_YCC_709 ||
+	    color_space == COLOR_SPACE_2020_YCBCR ||
+	    color_space == COLOR_SPACE_YCBCR709_BLACK ||
+	    color_space == COLOR_SPACE_DISPLAYNATIVE ||
+	    color_space == COLOR_SPACE_APPCTRL ||
+	    color_space == COLOR_SPACE_CUSTOMPOINTS)
+		return DRM_MODE_COLOR_RANGE_FULL;
+	if (color_space == COLOR_SPACE_SRGB_LIMITED ||
+	    color_space == COLOR_SPACE_2020_RGB_LIMITEDRANGE ||
+	    color_space == COLOR_SPACE_YCBCR601_LIMITED ||
+	    color_space == COLOR_SPACE_YCBCR709_LIMITED)
+		return DRM_MODE_COLOR_RANGE_LIMITED_16_235;
+	return DRM_MODE_COLOR_RANGE_UNSET;
+}
+
 static int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
 					  struct drm_crtc_state *crtc_state,
 					  struct drm_connector_state *conn_state)
@@ -7734,6 +7761,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 		drm_connector_attach_max_bpc_property(&aconnector->base, 8, 16);
 		drm_connector_attach_active_bpc_property(&aconnector->base, 8, 16);
 		drm_connector_attach_active_color_format_property(&aconnector->base);
+		drm_connector_attach_active_color_range_property(&aconnector->base);
 	}
 
 	/* This defaults to the max in the range, but we want 8bpc for non-edp. */
@@ -9116,11 +9144,15 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 				drm_connector_set_active_color_format_property(connector,
 					convert_dc_pixel_encoding_into_drm_color_format(
 					dm_new_crtc_state->stream->timing.pixel_encoding));
+				drm_connector_set_active_color_range_property(connector,
+					convert_dc_color_space_into_drm_mode_color_range(
+					dm_new_crtc_state->stream->output_color_space));
 			}
 		}
 		else {
 			drm_connector_set_active_bpc_property(connector, 0);
 			drm_connector_set_active_color_format_property(connector, 0);
+			drm_connector_set_active_color_range_property(connector, DRM_MODE_COLOR_RANGE_UNSET);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 13151d13aa73..b5d57bbbdd20 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -417,6 +417,10 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 	if (connector->active_color_format_property)
 		drm_connector_attach_active_color_format_property(&aconnector->base);
 
+	connector->active_color_range_property = master->base.active_color_range_property;
+	if (connector->active_color_range_property)
+		drm_connector_attach_active_color_range_property(&aconnector->base);
+
 	connector->vrr_capable_property = master->base.vrr_capable_property;
 	if (connector->vrr_capable_property)
 		drm_connector_attach_vrr_capable_property(connector);
-- 
2.25.1

