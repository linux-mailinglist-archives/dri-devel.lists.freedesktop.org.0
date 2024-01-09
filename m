Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C378F828F7A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 23:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C6B10E511;
	Tue,  9 Jan 2024 22:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5341310E4E1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 18:11:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e4582ed74so25202325e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 10:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yngvason.is; s=google; t=1704823914; x=1705428714; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1K35iyXrIjP9JEaVNwNgowQ2gmFwtnlNnPCP001WTzs=;
 b=T9ErnVxmP3A7CbGfOx5/rcrNiR+1zok+b70FkTq3omeJifjvUx0Rs4zrHR33DY2WG8
 0P0DNB84PsNW206wNkrHelewbYD7rrI5dfAFydVOHUaLtezZAioGd6uCOfFcXnvjNFEn
 cUXVy82V+yRWCeSjYcbIuk7SXGEq4yFUZbLdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704823914; x=1705428714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1K35iyXrIjP9JEaVNwNgowQ2gmFwtnlNnPCP001WTzs=;
 b=MS/YV/Ln+rYS0l7BuZypf9xVqlIuNfyCX5q9Dszq4DFkXnjj1R7CzANCypYWm8mCHH
 fsdeVyA6aRRHU6pDuAQoVrLF0KeAbpzUClqjk4db6Dxi1Mcd/sC0h2FRfcuC+hXHtymG
 rsXTDCvTw+RjqoDI/R6/RDDSs/qWvAjuoD+2HKqbMYD64AeaIaRIgWONfpbNNVxSA3Fc
 vb6AH67UqkV6V92zGLB1XtMkNjVYiodTBwcU3BRpl9UjgNGY+hS7yNu5M9xFafDYoxaW
 ASDifgqHjDmIKSXxFWL5mVU+2HHbF2DtoplHwCML9wIzGyTgFAFUubLpenNERupXos7+
 UZNQ==
X-Gm-Message-State: AOJu0YwOMLXSVg4ESsRW00Ay1exhyjf0kcaiyUYMbjuXXCZDpM173iwk
 9tz5AcuEM6bMBw5zA3eXLUlCWRsk9ZNKBw==
X-Google-Smtp-Source: AGHT+IHCvkhLBDjMnPPg6VS4Uza9HPKoHPU28wAqqAGezxMnCAYYxMWKNpbjFIpaRNQwjFu2XbHG4A==
X-Received: by 2002:a05:600c:5251:b0:40c:24b1:8d07 with SMTP id
 fc17-20020a05600c525100b0040c24b18d07mr1582485wmb.192.1704823913857; 
 Tue, 09 Jan 2024 10:11:53 -0800 (PST)
Received: from andri-workstation.turninn.appdynamic.com
 ([2a01:8280:aa07:ad:7285:c2ff:fef0:4baf])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a05600c3b9900b0040e527602c8sm2104579wms.9.2024.01.09.10.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 10:11:53 -0800 (PST)
From: Andri Yngvason <andri@yngvason.is>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH 7/7] drm/i915/display: Add handling for new "preferred color
 format" property
Date: Tue,  9 Jan 2024 18:11:04 +0000
Message-ID: <20240109181104.1670304-8-andri@yngvason.is>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109181104.1670304-1-andri@yngvason.is>
References: <20240109181104.1670304-1-andri@yngvason.is>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Jan 2024 22:13:19 +0000
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
Cc: amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Werner Sembach <wse@tuxedocomputers.com>,
 Andri Yngvason <andri@yngvason.is>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Werner Sembach <wse@tuxedocomputers.com>

This commit implements the "preferred color format" drm property for the
Intel GPU driver.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Co-developed-by: Andri Yngvason <andri@yngvason.is>
Signed-off-by: Andri Yngvason <andri@yngvason.is>
Tested-by: Andri Yngvason <andri@yngvason.is>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 16 ++++++++++------
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  5 +++++
 drivers/gpu/drm/i915/display/intel_hdmi.c   | 12 +++++++++---
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c40fe8a847614..f241798660d0b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2698,21 +2698,23 @@ intel_dp_compute_output_format(struct intel_encoder *encoder,
 	struct intel_connector *connector = intel_dp->attached_connector;
 	const struct drm_display_info *info = &connector->base.display_info;
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
-	bool ycbcr_420_only;
+	bool ycbcr_420_output;
 	int ret;
 
-	ycbcr_420_only = drm_mode_is_420_only(info, adjusted_mode);
+	ycbcr_420_output = drm_mode_is_420_only(info, adjusted_mode) ||
+			   (conn_state->preferred_color_format == DRM_COLOR_FORMAT_YCBCR420 &&
+			    drm_mode_is_420_also(&connector->base.display_info, adjusted_mode));
 
-	if (ycbcr_420_only && !connector->base.ycbcr_420_allowed) {
+	crtc_state->sink_format = ycbcr_420_output ? INTEL_OUTPUT_FORMAT_YCBCR420 :
+						     INTEL_OUTPUT_FORMAT_RGB;
+
+	if (ycbcr_420_output && !connector->base.ycbcr_420_allowed) {
 		drm_dbg_kms(&i915->drm,
 			    "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB.\n");
 		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_RGB;
-	} else {
-		crtc_state->sink_format = intel_dp_sink_format(connector, adjusted_mode);
 	}
 
 	crtc_state->output_format = intel_dp_output_format(connector, crtc_state->sink_format);
-
 	ret = intel_dp_compute_link_config(encoder, crtc_state, conn_state,
 					   respect_downstream_limits);
 	if (ret) {
@@ -5912,9 +5914,11 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connect
 	intel_attach_broadcast_rgb_property(connector);
 	if (HAS_GMCH(dev_priv)) {
 		drm_connector_attach_max_bpc_property(connector, 6, 10);
+		drm_connector_attach_preferred_color_format_property(connector);
 		drm_connector_attach_active_color_format_property(connector);
 	} else if (DISPLAY_VER(dev_priv) >= 5) {
 		drm_connector_attach_max_bpc_property(connector, 6, 12);
+		drm_connector_attach_preferred_color_format_property(connector);
 		drm_connector_attach_active_color_format_property(connector);
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index e7574ca0604e6..4a850eb9b8d4d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1210,6 +1210,11 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 		drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP MST init failed, skipping.\n",
 			    connector->name, connector->base.id);
 
+	connector->preferred_color_format_property =
+		intel_dp->attached_connector->base.preferred_color_format_property;
+	if (connector->preferred_color_format_property)
+		drm_connector_attach_preferred_color_format_property(connector);
+
 	connector->active_color_format_property =
 		intel_dp->attached_connector->base.active_color_format_property;
 	if (connector->active_color_format_property)
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index ce0221f90de92..3030589d245d7 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2214,19 +2214,24 @@ static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	const struct drm_display_info *info = &connector->base.display_info;
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
-	bool ycbcr_420_only = drm_mode_is_420_only(info, adjusted_mode);
+	bool ycbcr_420_output;
 	int ret;
 
+	ycbcr_420_output = drm_mode_is_420_only(info, adjusted_mode) ||
+			   (conn_state->preferred_color_format == DRM_COLOR_FORMAT_YCBCR420 &&
+			    drm_mode_is_420_also(&connector->base.display_info, adjusted_mode));
+
 	crtc_state->sink_format =
-		intel_hdmi_sink_format(crtc_state, connector, ycbcr_420_only);
+		intel_hdmi_sink_format(crtc_state, connector, ycbcr_420_output);
 
-	if (ycbcr_420_only && crtc_state->sink_format != INTEL_OUTPUT_FORMAT_YCBCR420) {
+	if (ycbcr_420_output && crtc_state->sink_format != INTEL_OUTPUT_FORMAT_YCBCR420) {
 		drm_dbg_kms(&i915->drm,
 			    "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB.\n");
 		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_RGB;
 	}
 
 	crtc_state->output_format = intel_hdmi_output_format(crtc_state);
+
 	ret = intel_hdmi_compute_clock(encoder, crtc_state, respect_downstream_limits);
 	if (ret) {
 		if (crtc_state->sink_format == INTEL_OUTPUT_FORMAT_YCBCR420 ||
@@ -2613,6 +2618,7 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *c
 
 	if (!HAS_GMCH(dev_priv)) {
 		drm_connector_attach_max_bpc_property(connector, 8, 12);
+		drm_connector_attach_preferred_color_format_property(connector);
 		drm_connector_attach_active_color_format_property(connector);
 	}
 }
-- 
2.43.0

