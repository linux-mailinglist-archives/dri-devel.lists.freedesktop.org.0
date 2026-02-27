Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCsDFL/uoWm5xQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:21:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B83251BCA27
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AB710EBFF;
	Fri, 27 Feb 2026 19:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Jq5odVA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4477C10EBFE;
 Fri, 27 Feb 2026 19:21:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772220081; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=C6kMG6CKB6qTUaob9v5ajEWW2PzE6gKopQuKaaqT/fkMj1IIEpDfflkEy39ef69WdEaV/KCc4zERIq2jj8jb8wF65yLU9woVWjQ2KFht4btsWgTX/EPozCY3UeTIJMvy8R6/fnNjfKVIfFhFRhGLOpNEqnRaCBTH2BlRSMpXxVY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772220081;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=TbCg/jTWYrSU1uxg/nE401HfG7dQWXtj3RiNuAgMJUs=; 
 b=ihJlY2bret+9JH8azrbknTE9Tx8RUvjB+P80Cojz/ZGNlEhj4Qt9wRxNcx9ATYoc0A7rkIU9hgSy4e4L7saPzua9R9OgPUiOnAiIcmrXm3GmiGxOMRr4O6i0nqI48Lr9HvDlHQ9/7c3qjalu2nmZLzfDuBBSWn5tlQ+kRk3Mw/k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772220081; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=TbCg/jTWYrSU1uxg/nE401HfG7dQWXtj3RiNuAgMJUs=;
 b=Jq5odVA6N2fbr6lbN6ble8MfyCHJupk5L73erkd5nheT3hIUDgICGashPe/TopbO
 fZOULE5WUAaIHgQnL7v5d8ttLkh7PunFPLxhynxmCMUEe6lfBU8VYdVMVuM5PdePsy/
 Tw1x1935uW1WhrPPTIcltr6PvP++Szcuslgs1Yuc=
Received: by mx.zohomail.com with SMTPS id 177222007993146.23002789405052;
 Fri, 27 Feb 2026 11:21:19 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 27 Feb 2026 20:20:11 +0100
Subject: [PATCH v9 06/19] drm/i915: Implement the "color format" DRM property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-color-format-v9-6-658c3b9db7ef@collabora.com>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
In-Reply-To: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Werner Sembach <wse@tuxedocomputers.com>, 
 Andri Yngvason <andri@yngvason.is>, Marius Vlad <marius.vlad@collabora.com>
X-Mailer: b4 0.14.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,tuxedocomputers.com:email,collabora.com:mid,collabora.com:dkim,collabora.com:email,yngvason.is:email]
X-Rspamd-Queue-Id: B83251BCA27
X-Rspamd-Action: no action

This includes RGB, YUV420, YUV444 and Auto. Auto will pick RGB, unless
the mode being asked for is YUV420-only, in which case it picks YUV420.

Should the explicitly requested color format not be supported by the
sink, then an error is returned to userspace, so that it can make a
better choice.

Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Co-developed-by: Andri Yngvason <andri@yngvason.is>
Signed-off-by: Andri Yngvason <andri@yngvason.is>
Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/i915/display/intel_connector.c | 11 ++++
 drivers/gpu/drm/i915/display/intel_connector.h |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c        | 71 ++++++++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_dp.h        |  4 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c    | 55 +++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_hdmi.c      | 72 ++++++++++++++++++++------
 6 files changed, 185 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 7ef9338d67ab..fb443aa7e0c0 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -38,6 +38,10 @@
 #include "intel_hdcp.h"
 #include "intel_panel.h"
 
+static const u32 supported_colorformats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
+					  BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
+					  BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
+
 static void intel_connector_modeset_retry_work_fn(struct work_struct *work)
 {
 	struct intel_connector *connector = container_of(work, typeof(*connector),
@@ -321,6 +325,13 @@ intel_attach_dp_colorspace_property(struct drm_connector *connector)
 		drm_connector_attach_colorspace_property(connector);
 }
 
+void
+intel_attach_colorformat_property(struct drm_connector *connector)
+{
+	if (!drm_mode_create_color_format_property(connector, supported_colorformats))
+		drm_connector_attach_color_format_property(connector);
+}
+
 void
 intel_attach_scaling_mode_property(struct drm_connector *connector)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_connector.h b/drivers/gpu/drm/i915/display/intel_connector.h
index 0aa86626e646..fe6149d1d559 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.h
+++ b/drivers/gpu/drm/i915/display/intel_connector.h
@@ -31,6 +31,7 @@ void intel_attach_broadcast_rgb_property(struct drm_connector *connector);
 void intel_attach_aspect_ratio_property(struct drm_connector *connector);
 void intel_attach_hdmi_colorspace_property(struct drm_connector *connector);
 void intel_attach_dp_colorspace_property(struct drm_connector *connector);
+void intel_attach_colorformat_property(struct drm_connector *connector);
 void intel_attach_scaling_mode_property(struct drm_connector *connector);
 void intel_connector_queue_modeset_retry_work(struct intel_connector *connector);
 void intel_connector_cancel_modeset_retry_work(struct intel_connector *connector);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 025e906b63a9..926df8b56a67 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1178,7 +1178,7 @@ dfp_can_convert(struct intel_dp *intel_dp,
 	return false;
 }
 
-static enum intel_output_format
+enum intel_output_format
 intel_dp_output_format(struct intel_connector *connector,
 		       enum intel_output_format sink_format)
 {
@@ -3324,17 +3324,24 @@ intel_dp_compute_output_format(struct intel_encoder *encoder,
 	struct intel_connector *connector = intel_dp->attached_connector;
 	const struct drm_display_info *info = &connector->base.display_info;
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
-	bool ycbcr_420_only;
+	enum drm_connector_color_format actual_format;
 	int ret;
 
-	ycbcr_420_only = drm_mode_is_420_only(info, adjusted_mode);
+	if ((conn_state->color_format == DRM_CONNECTOR_COLOR_FORMAT_YCBCR420 &&
+	     drm_mode_is_420(info, adjusted_mode)) ||
+	    (conn_state->color_format == DRM_CONNECTOR_COLOR_FORMAT_AUTO &&
+	     drm_mode_is_420_only(info, adjusted_mode)))
+		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_YCBCR420;
+	else if (conn_state->color_format == DRM_CONNECTOR_COLOR_FORMAT_YCBCR444)
+		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_YCBCR444;
+	else
+		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_RGB;
 
-	if (ycbcr_420_only && !connector->base.ycbcr_420_allowed) {
+	if (crtc_state->sink_format == INTEL_OUTPUT_FORMAT_YCBCR420 &&
+	    !connector->base.ycbcr_420_allowed) {
 		drm_dbg_kms(display->drm,
-			    "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB.\n");
-		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_RGB;
-	} else {
-		crtc_state->sink_format = intel_dp_sink_format(connector, adjusted_mode);
+			"YCbCr 4:2:0 mode requested but unsupported by connector.\n");
+		return -EINVAL;
 	}
 
 	crtc_state->output_format = intel_dp_output_format(connector, crtc_state->sink_format);
@@ -3342,9 +3349,20 @@ intel_dp_compute_output_format(struct intel_encoder *encoder,
 	ret = intel_dp_compute_link_config(encoder, crtc_state, conn_state,
 					   respect_downstream_limits);
 	if (ret) {
-		if (crtc_state->sink_format == INTEL_OUTPUT_FORMAT_YCBCR420 ||
-		    !connector->base.ycbcr_420_allowed ||
-		    !drm_mode_is_420_also(info, adjusted_mode))
+		/*
+		 * If no valid link config can be found due to bandwidth constraints,
+		 * degrade from RGB/YCbCr 4:4:4 to YCbCr 4:2:0 if permitted by
+		 * the source and sink.
+		 */
+		if (!connector->base.ycbcr_420_allowed)
+			return ret;
+		/* No point in trying YCbCr420 a second time. */
+		if (crtc_state->sink_format == INTEL_OUTPUT_FORMAT_YCBCR420)
+			return ret;
+		if (!drm_mode_is_420(info, adjusted_mode))
+			return ret;
+		/* If a non-AUTO color format is chosen, don't fall back. */
+		if (conn_state->color_format)
 			return ret;
 
 		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_YCBCR420;
@@ -3352,9 +3370,36 @@ intel_dp_compute_output_format(struct intel_encoder *encoder,
 								   crtc_state->sink_format);
 		ret = intel_dp_compute_link_config(encoder, crtc_state, conn_state,
 						   respect_downstream_limits);
+		if (ret)
+			return ret;
 	}
 
-	return ret;
+	if (conn_state->color_format == DRM_CONNECTOR_COLOR_FORMAT_AUTO)
+		return 0;
+
+	switch (crtc_state->sink_format) {
+	case INTEL_OUTPUT_FORMAT_RGB:
+		actual_format = DRM_CONNECTOR_COLOR_FORMAT_RGB444;
+		break;
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		actual_format = DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
+		break;
+	case INTEL_OUTPUT_FORMAT_YCBCR420:
+		actual_format = DRM_CONNECTOR_COLOR_FORMAT_YCBCR420;
+		break;
+	default:
+		drm_dbg_kms(display->drm, "Intel format %d has no connector equivalent\n",
+			    crtc_state->sink_format);
+		return -EINVAL;
+	}
+
+	if (actual_format != conn_state->color_format) {
+		drm_dbg_kms(display->drm, "Requested connector color format %d, got %d\n",
+			    conn_state->color_format, actual_format);
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 void
@@ -6828,6 +6873,8 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *_connec
 		intel_attach_dp_colorspace_property(&connector->base);
 	}
 
+	intel_attach_colorformat_property(&connector->base);
+
 	if (intel_dp_has_gamut_metadata_dip(&dp_to_dig_port(intel_dp)->base))
 		drm_connector_attach_hdr_output_metadata_property(&connector->base);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index b0bbd5981f57..ebc63156e73f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -203,6 +203,10 @@ bool intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 			       const struct drm_dp_desc *desc, bool is_branch,
 			       struct intel_connector *connector);
+enum intel_output_format
+intel_dp_output_format(struct intel_connector *connector,
+		       enum intel_output_format sink_format);
+
 bool intel_dp_has_gamut_metadata_dip(struct intel_encoder *encoder);
 
 bool intel_dp_link_params_valid(struct intel_dp *intel_dp, int link_rate,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index fb5396a46d1b..5c95d718b5b3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -702,10 +702,13 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 	struct intel_atomic_state *state = to_intel_atomic_state(conn_state->state);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 	struct intel_dp *intel_dp = to_primary_dp(encoder);
+	enum drm_connector_color_format actual_format;
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
 	const struct drm_display_mode *adjusted_mode =
 		&pipe_config->hw.adjusted_mode;
+	const struct drm_display_info *info =
+		&connector->base.display_info;
 	int num_joined_pipes;
 	int ret = -EINVAL;
 
@@ -716,10 +719,53 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 	if (adjusted_mode->flags & DRM_MODE_FLAG_DBLSCAN)
 		return -EINVAL;
 
-	pipe_config->sink_format = INTEL_OUTPUT_FORMAT_RGB;
-	pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
+	if ((conn_state->color_format == DRM_CONNECTOR_COLOR_FORMAT_YCBCR420 &&
+	     drm_mode_is_420(info, adjusted_mode)) ||
+	    (conn_state->color_format == DRM_CONNECTOR_COLOR_FORMAT_AUTO &&
+	     drm_mode_is_420_only(info, adjusted_mode))) {
+		pipe_config->sink_format = INTEL_OUTPUT_FORMAT_YCBCR420;
+	} else if (conn_state->color_format == DRM_CONNECTOR_COLOR_FORMAT_YCBCR444) {
+		pipe_config->sink_format = INTEL_OUTPUT_FORMAT_YCBCR444;
+	} else if (conn_state->color_format == DRM_CONNECTOR_COLOR_FORMAT_AUTO ||
+		   conn_state->color_format == DRM_CONNECTOR_COLOR_FORMAT_RGB444) {
+		pipe_config->sink_format = INTEL_OUTPUT_FORMAT_RGB;
+	} else {
+		drm_dbg_kms(display->drm, "Requested format %d unsupported.\n",
+			    conn_state->color_format);
+		return -EINVAL;
+	}
+
+	if (pipe_config->sink_format == INTEL_OUTPUT_FORMAT_YCBCR420 &&
+	    !connector->base.ycbcr_420_allowed) {
+		drm_dbg_kms(display->drm,
+			    "YCbCr 4:2:0 mode requested but unsupported by connector.\n");
+		return -EINVAL;
+	}
+
+	pipe_config->output_format = intel_dp_output_format(connector, pipe_config->sink_format);
 	pipe_config->has_pch_encoder = false;
 
+	/* Validate that the right format was picked if explicitly requested */
+	if (conn_state->color_format != DRM_CONNECTOR_COLOR_FORMAT_AUTO) {
+		switch (pipe_config->output_format) {
+		case INTEL_OUTPUT_FORMAT_RGB:
+			actual_format = DRM_CONNECTOR_COLOR_FORMAT_RGB444;
+			break;
+		case INTEL_OUTPUT_FORMAT_YCBCR444:
+			actual_format = DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
+			break;
+		case INTEL_OUTPUT_FORMAT_YCBCR420:
+			actual_format = DRM_CONNECTOR_COLOR_FORMAT_YCBCR420;
+			break;
+		}
+
+		if (actual_format != conn_state->color_format) {
+			drm_dbg_kms(display->drm, "Requested connector color format %d, got %d\n",
+				    conn_state->color_format, actual_format);
+			return -EINVAL;
+		}
+	}
+
 	for_each_joiner_candidate(connector, adjusted_mode, num_joined_pipes) {
 		if (num_joined_pipes > 1)
 			pipe_config->joiner_pipes = GENMASK(crtc->pipe + num_joined_pipes - 1,
@@ -1690,6 +1736,11 @@ static int mst_topology_add_connector_properties(struct intel_dp *intel_dp,
 	if (connector->base.max_bpc_property)
 		drm_connector_attach_max_bpc_property(&connector->base, 6, 12);
 
+	connector->base.color_format_property =
+		intel_dp->attached_connector->base.color_format_property;
+	if (connector->base.color_format_property)
+		intel_attach_colorformat_property(&connector->base);
+
 	return drm_connector_set_path_property(&connector->base, pathprop);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 05e898d10a2b..6b685d9a458e 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2270,33 +2270,73 @@ static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	const struct drm_display_info *info = &connector->base.display_info;
-	bool ycbcr_420_only = drm_mode_is_420_only(info, adjusted_mode);
+	enum drm_connector_color_format req_fmt = conn_state->color_format;
+	enum drm_connector_color_format actual_fmt;
 	int ret;
 
-	crtc_state->sink_format =
-		intel_hdmi_sink_format(crtc_state, connector, ycbcr_420_only);
-
-	if (ycbcr_420_only && crtc_state->sink_format != INTEL_OUTPUT_FORMAT_YCBCR420) {
-		drm_dbg_kms(display->drm,
-			    "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB.\n");
-		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_RGB;
-	}
+	if (!req_fmt)
+		crtc_state->sink_format =
+			intel_hdmi_sink_format(crtc_state, connector,
+					       drm_mode_is_420_only(info, adjusted_mode));
+	else if (req_fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR444)
+		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_YCBCR444;
+	else
+		crtc_state->sink_format =
+			intel_hdmi_sink_format(crtc_state, connector,
+					       req_fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR420);
 
 	crtc_state->output_format = intel_hdmi_output_format(crtc_state);
 	ret = intel_hdmi_compute_clock(encoder, crtc_state, respect_downstream_limits);
 	if (ret) {
-		if (crtc_state->sink_format == INTEL_OUTPUT_FORMAT_YCBCR420 ||
-		    !crtc_state->has_hdmi_sink ||
-		    !connector->base.ycbcr_420_allowed ||
-		    !drm_mode_is_420_also(info, adjusted_mode))
+		/*
+		 * If no valid link config can be found due to bandwidth constraints,
+		 * degrade from RGB/YCbCr 4:4:4 to YCbCr 4:2:0 if permitted by
+		 * the source and sink.
+		 */
+		if (!connector->base.ycbcr_420_allowed)
+			return ret;
+		/* No point in trying YCbCr420 a second time. */
+		if (crtc_state->sink_format == INTEL_OUTPUT_FORMAT_YCBCR420)
+			return ret;
+		if (!drm_mode_is_420(info, adjusted_mode))
+			return ret;
+		/* If a non-AUTO color format is chosen, don't fall back. */
+		if (req_fmt)
 			return ret;
 
 		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_YCBCR420;
 		crtc_state->output_format = intel_hdmi_output_format(crtc_state);
 		ret = intel_hdmi_compute_clock(encoder, crtc_state, respect_downstream_limits);
+		if (ret)
+			return ret;
 	}
 
-	return ret;
+	if (req_fmt == DRM_CONNECTOR_COLOR_FORMAT_AUTO)
+		return 0;
+
+	switch (crtc_state->sink_format) {
+	case INTEL_OUTPUT_FORMAT_RGB:
+		actual_fmt = DRM_CONNECTOR_COLOR_FORMAT_RGB444;
+		break;
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		actual_fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
+		break;
+	case INTEL_OUTPUT_FORMAT_YCBCR420:
+		actual_fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR420;
+		break;
+	default:
+		drm_dbg_kms(display->drm, "Intel format %d has no connector equivalent\n",
+			    crtc_state->sink_format);
+		return -EINVAL;
+	}
+
+	if (req_fmt != actual_fmt) {
+		drm_dbg_kms(display->drm, "Requested connector color format %d, got %d\n",
+			    req_fmt, actual_fmt);
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static bool intel_hdmi_is_cloned(const struct intel_crtc_state *crtc_state)
@@ -2689,8 +2729,10 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *_
 	if (DISPLAY_VER(display) >= 10)
 		drm_connector_attach_hdr_output_metadata_property(&connector->base);
 
-	if (!HAS_GMCH(display))
+	if (!HAS_GMCH(display)) {
 		drm_connector_attach_max_bpc_property(&connector->base, 8, 12);
+		intel_attach_colorformat_property(&connector->base);
+	}
 }
 
 /*

-- 
2.53.0

