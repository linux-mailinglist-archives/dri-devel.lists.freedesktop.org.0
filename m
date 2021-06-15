Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F843A8252
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 16:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A537F6E415;
	Tue, 15 Jun 2021 14:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE8C6E328;
 Tue, 15 Jun 2021 14:14:40 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 966A3C800B8;
 Tue, 15 Jun 2021 16:14:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id fxxf88m0SUX0; Tue, 15 Jun 2021 16:14:38 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37F3949009F7CF2Abd5Da2787.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:9f7c:f2ab:d5da:2787])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 29B5DC80095;
 Tue, 15 Jun 2021 16:14:38 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 11/14] drm/i915/display: Add handling for new "active color
 range" property
Date: Tue, 15 Jun 2021 16:14:22 +0200
Message-Id: <20210615141426.6001-12-wse@tuxedocomputers.com>
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

This commit implements the "active color range" drm property for the Intel GPU
driver.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ++++
 drivers/gpu/drm/i915/display/intel_dp.c      | 2 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 5 +++++
 drivers/gpu/drm/i915/display/intel_hdmi.c    | 1 +
 4 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 2cf09599ddc3..09d7c3da105a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -10933,10 +10933,14 @@ static int intel_atomic_commit(struct drm_device *dev,
 			drm_connector_set_active_bpc_property(connector, new_crtc_state->pipe_bpp / 3);
 			drm_connector_set_active_color_format_property(connector,
 				convert_intel_output_format_into_drm_color_format(new_crtc_state->output_format));
+			drm_connector_set_active_color_range_property(connector,
+				new_crtc_state->limited_color_range? DRM_MODE_COLOR_RANGE_LIMITED_16_235
+								   : DRM_MODE_COLOR_RANGE_FULL);
 		}
 		else {
 			drm_connector_set_active_bpc_property(connector, 0);
 			drm_connector_set_active_color_format_property(connector, 0);
+			drm_connector_set_active_color_range_property(connector, DRM_MODE_COLOR_RANGE_UNSET);
 		}
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 01fdb9141592..d648582d0786 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4692,11 +4692,13 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connect
 		drm_connector_attach_max_bpc_property(connector, 6, 10);
 		drm_connector_attach_active_bpc_property(connector, 6, 10);
 		drm_connector_attach_active_color_format_property(connector);
+		drm_connector_attach_active_color_range_property(connector);
 	}
 	else if (DISPLAY_VER(dev_priv) >= 5) {
 		drm_connector_attach_max_bpc_property(connector, 6, 12);
 		drm_connector_attach_active_bpc_property(connector, 6, 12);
 		drm_connector_attach_active_color_format_property(connector);
+		drm_connector_attach_active_color_range_property(connector);
 	}
 
 	/* Register HDMI colorspace for case of lspcon */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 3e4237df3360..cb876175258f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -861,6 +861,11 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	if (connector->active_color_format_property)
 		drm_connector_attach_active_color_format_property(connector);
 
+	connector->active_color_range_property =
+		intel_dp->attached_connector->base.active_color_range_property;
+	if (connector->active_color_range_property)
+		drm_connector_attach_active_color_range_property(connector);
+
 	return connector;
 
 err:
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 367aba57b55f..dacac23a6c30 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2517,6 +2517,7 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *c
 		drm_connector_attach_max_bpc_property(connector, 8, 12);
 		drm_connector_attach_active_bpc_property(connector, 8, 12);
 		drm_connector_attach_active_color_format_property(connector);
+		drm_connector_attach_active_color_range_property(connector);
 	}
 }
 
-- 
2.25.1

