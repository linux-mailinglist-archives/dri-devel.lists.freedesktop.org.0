Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0569679462
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 10:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A964110E640;
	Tue, 24 Jan 2023 09:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC1610E63E;
 Tue, 24 Jan 2023 09:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674553340; x=1706089340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t/tYgFt0j2KTLUSlTSql2GDfCdL/4lbg+MmsOCcHAtM=;
 b=mViMLGVLDoGZBkk+eDrmyaom2YOM+nGh3zkIOGgKN3EktnZx0WZqV3+f
 aoUvPBJFRlAzs6BP3Yn4XDMd5cNJWkDz7D/IRhEu38qjjnwGT3lZe4IMK
 nCJtK4Dx2IQFqn7AECFtCzp3zdBB4prqplLbuJNIGFnPYye6KjDJit6k7
 1wFJpkdvUrxKxvb51YK4+aRlURp7NMUFraVAVxXq/HcS1a34ZAajnSqr1
 k1YkwDXaXDTSLjZaEBPFiDhrvMwgOnngyd3FRFZm0lOKrBDj88B7kOvBN
 AKPQDXLGWmB9wmvzwRVl2MWs90AQtajrC1x3lhYc2InMiFRNBHVDHtl2n Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="328348567"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="328348567"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 01:42:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="662067723"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="662067723"
Received: from pesir-mobl.ger.corp.intel.com (HELO localhost) ([10.252.57.197])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 01:42:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/connector: move ELD and video/audio latencies to
 display info
Date: Tue, 24 Jan 2023 11:41:54 +0200
Message-Id: <20230124094154.2282778-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124094154.2282778-1-jani.nikula@intel.com>
References: <20230124094154.2282778-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Emma Anholt <emma@anholt.net>, amd-gfx@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>, Pan@freedesktop.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>, jani.nikula@intel.com,
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xinhui <Xinhui.Pan@amd.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Robert Foss <robert.foss@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	freedreno@lists.freedesktop.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Information parsed from the display EDID should be stored in display
info. We can stop clearing ELD separately.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mediatek@lists.infradead.org
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Emma Anholt <emma@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Sorry about the crazy Cc list, but this touches a lot of drivers, and I
didn't want to blind side anyone.
---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  6 +--
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  6 +--
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  6 +--
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         | 12 ++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++---
 drivers/gpu/drm/bridge/analogix/anx7625.c     |  4 +-
 drivers/gpu/drm/bridge/ite-it66121.c          |  4 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  2 +-
 drivers/gpu/drm/drm_edid.c                    | 45 +++++++------------
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  2 +-
 drivers/gpu/drm/i915/display/intel_audio.c    | 22 ++++-----
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c             |  2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  3 +-
 drivers/gpu/drm/msm/dp/dp_audio.c             |  4 +-
 drivers/gpu/drm/radeon/dce6_afmt.c            | 12 ++---
 drivers/gpu/drm/radeon/evergreen_hdmi.c       | 12 ++---
 drivers/gpu/drm/radeon/radeon_audio.c         |  4 +-
 drivers/gpu/drm/sti/sti_hdmi.c                |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  2 +-
 include/drm/drm_connector.h                   | 39 +++++++++-------
 21 files changed, 99 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 9a24ed463abd..0c05838032c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -1257,11 +1257,11 @@ static void dce_v10_0_audio_write_latency_fields(struct drm_encoder *encoder,
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		interlace = 1;
-	if (connector->latency_present[interlace]) {
+	if (connector->display_info.latency_present[interlace]) {
 		tmp = REG_SET_FIELD(0, AZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_LIPSYNC,
-				    VIDEO_LIPSYNC, connector->video_latency[interlace]);
+				    VIDEO_LIPSYNC, connector->display_info.video_latency[interlace]);
 		tmp = REG_SET_FIELD(0, AZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_LIPSYNC,
-				    AUDIO_LIPSYNC, connector->audio_latency[interlace]);
+				    AUDIO_LIPSYNC, connector->display_info.audio_latency[interlace]);
 	} else {
 		tmp = REG_SET_FIELD(0, AZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_LIPSYNC,
 				    VIDEO_LIPSYNC, 0);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index c14b70350a51..896f0416b69f 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -1283,11 +1283,11 @@ static void dce_v11_0_audio_write_latency_fields(struct drm_encoder *encoder,
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		interlace = 1;
-	if (connector->latency_present[interlace]) {
+	if (connector->display_info.latency_present[interlace]) {
 		tmp = REG_SET_FIELD(0, AZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_LIPSYNC,
-				    VIDEO_LIPSYNC, connector->video_latency[interlace]);
+				    VIDEO_LIPSYNC, connector->display_info.video_latency[interlace]);
 		tmp = REG_SET_FIELD(0, AZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_LIPSYNC,
-				    AUDIO_LIPSYNC, connector->audio_latency[interlace]);
+				    AUDIO_LIPSYNC, connector->display_info.audio_latency[interlace]);
 	} else {
 		tmp = REG_SET_FIELD(0, AZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_LIPSYNC,
 				    VIDEO_LIPSYNC, 0);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 7f85ba5b726f..4aa797726bca 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -1158,11 +1158,11 @@ static void dce_v6_0_audio_write_latency_fields(struct drm_encoder *encoder,
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		interlace = 1;
 
-	if (connector->latency_present[interlace]) {
+	if (connector->display_info.latency_present[interlace]) {
 		tmp = REG_SET_FIELD(0, AZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_LIPSYNC,
-				VIDEO_LIPSYNC, connector->video_latency[interlace]);
+				VIDEO_LIPSYNC, connector->display_info.video_latency[interlace]);
 		tmp = REG_SET_FIELD(tmp, AZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_LIPSYNC,
-				AUDIO_LIPSYNC, connector->audio_latency[interlace]);
+				AUDIO_LIPSYNC, connector->display_info.audio_latency[interlace]);
 	} else {
 		tmp = REG_SET_FIELD(0, AZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_LIPSYNC,
 				VIDEO_LIPSYNC, 0);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index d421a268c9ff..c84421510a46 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -1195,11 +1195,11 @@ static void dce_v8_0_audio_write_latency_fields(struct drm_encoder *encoder,
 	}
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
-		if (connector->latency_present[1])
+		if (connector->display_info.latency_present[1])
 			tmp =
-			(connector->video_latency[1] <<
+			(connector->display_info.video_latency[1] <<
 			 AZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_LIPSYNC__VIDEO_LIPSYNC__SHIFT) |
-			(connector->audio_latency[1] <<
+			(connector->display_info.audio_latency[1] <<
 			 AZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_LIPSYNC__AUDIO_LIPSYNC__SHIFT);
 		else
 			tmp =
@@ -1208,11 +1208,11 @@ static void dce_v8_0_audio_write_latency_fields(struct drm_encoder *encoder,
 			(0 <<
 			 AZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_LIPSYNC__AUDIO_LIPSYNC__SHIFT);
 	} else {
-		if (connector->latency_present[0])
+		if (connector->display_info.latency_present[0])
 			tmp =
-			(connector->video_latency[0] <<
+			(connector->display_info.video_latency[0] <<
 			 AZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_LIPSYNC__VIDEO_LIPSYNC__SHIFT) |
-			(connector->audio_latency[0] <<
+			(connector->display_info.audio_latency[0] <<
 			 AZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_LIPSYNC__AUDIO_LIPSYNC__SHIFT);
 		else
 			tmp =
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c61c388bddf2..4db61c346280 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -894,8 +894,8 @@ static int amdgpu_dm_audio_component_get_eld(struct device *kdev, int port,
 			continue;
 
 		*enabled = true;
-		ret = drm_eld_size(connector->eld);
-		memcpy(buf, connector->eld, min(max_bytes, ret));
+		ret = drm_eld_size(connector->display_info.eld);
+		memcpy(buf, connector->display_info.eld, min(max_bytes, ret));
 
 		break;
 	}
@@ -5386,9 +5386,9 @@ static void fill_audio_info(struct audio_info *audio_info,
 	audio_info->flags.all = edid_caps->speaker_flags;
 
 	/* TODO: We only check for the progressive mode, check for interlace mode too */
-	if (drm_connector->latency_present[0]) {
-		audio_info->video_latency = drm_connector->video_latency[0];
-		audio_info->audio_latency = drm_connector->audio_latency[0];
+	if (drm_connector->display_info.latency_present[0]) {
+		audio_info->video_latency = drm_connector->display_info.video_latency[0];
+		audio_info->audio_latency = drm_connector->display_info.audio_latency[0];
 	}
 
 	/* TODO: For DP, video and audio latency should be calculated from DPCD caps */
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 6846199a2ee1..04a29950228c 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1982,8 +1982,8 @@ static int anx7625_audio_get_eld(struct device *dev, void *data,
 		memset(buf, 0, len);
 	} else {
 		dev_dbg(dev, "audio copy eld\n");
-		memcpy(buf, ctx->connector->eld,
-		       min(sizeof(ctx->connector->eld), len));
+		memcpy(buf, ctx->connector->display_info.eld,
+		       min(sizeof(ctx->connector->display_info.eld), len));
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index a2d723d6a4be..1a5e0741d33b 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1448,8 +1448,8 @@ static int it66121_audio_get_eld(struct device *dev, void *data,
 
 	mutex_lock(&ctx->lock);
 
-	memcpy(buf, ctx->connector->eld,
-	       min(sizeof(ctx->connector->eld), len));
+	memcpy(buf, ctx->connector->display_info.eld,
+	       min(sizeof(ctx->connector->display_info.eld), len));
 
 	mutex_unlock(&ctx->lock);
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index aa51c61a78c7..1f235960fd33 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -789,7 +789,7 @@ static u8 *hdmi_audio_get_eld(struct dw_hdmi *hdmi)
 	if (!hdmi->curr_conn)
 		return NULL;
 
-	return hdmi->curr_conn->eld;
+	return hdmi->curr_conn->display_info.eld;
 }
 
 static void dw_hdmi_gp_audio_enable(struct dw_hdmi *hdmi)
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 1ce3f153868d..a1b06b374af8 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5369,29 +5369,30 @@ drm_parse_hdr_metadata_block(struct drm_connector *connector, const u8 *db)
 static void
 drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
 {
+	struct drm_display_info *info = &connector->display_info;
 	u8 len = cea_db_payload_len(db);
 
 	if (len >= 6 && (db[6] & (1 << 7)))
-		connector->eld[DRM_ELD_SAD_COUNT_CONN_TYPE] |= DRM_ELD_SUPPORTS_AI;
+		info->eld[DRM_ELD_SAD_COUNT_CONN_TYPE] |= DRM_ELD_SUPPORTS_AI;
 
 	if (len >= 10 && hdmi_vsdb_latency_present(db)) {
-		connector->latency_present[0] = true;
-		connector->video_latency[0] = db[9];
-		connector->audio_latency[0] = db[10];
+		info->latency_present[0] = true;
+		info->video_latency[0] = db[9];
+		info->audio_latency[0] = db[10];
 	}
 
 	if (len >= 12 && hdmi_vsdb_i_latency_present(db)) {
-		connector->latency_present[1] = true;
-		connector->video_latency[1] = db[11];
-		connector->audio_latency[1] = db[12];
+		info->latency_present[1] = true;
+		info->video_latency[1] = db[11];
+		info->audio_latency[1] = db[12];
 	}
 
 	drm_dbg_kms(connector->dev,
 		    "[CONNECTOR:%d:%s] HDMI: latency present %d %d, video latency %d %d, audio latency %d %d\n",
 		    connector->base.id, connector->name,
-		    connector->latency_present[0], connector->latency_present[1],
-		    connector->video_latency[0], connector->video_latency[1],
-		    connector->audio_latency[0], connector->audio_latency[1]);
+		    info->latency_present[0], info->latency_present[1],
+		    info->video_latency[0], info->video_latency[1],
+		    info->audio_latency[0], info->audio_latency[1]);
 }
 
 static void
@@ -5453,18 +5454,6 @@ void drm_edid_get_monitor_name(const struct edid *edid, char *name, int bufsize)
 }
 EXPORT_SYMBOL(drm_edid_get_monitor_name);
 
-static void clear_eld(struct drm_connector *connector)
-{
-	memset(connector->eld, 0, sizeof(connector->eld));
-
-	connector->latency_present[0] = false;
-	connector->latency_present[1] = false;
-	connector->video_latency[0] = 0;
-	connector->audio_latency[0] = 0;
-	connector->video_latency[1] = 0;
-	connector->audio_latency[1] = 0;
-}
-
 /*
  * drm_edid_to_eld - build ELD from EDID
  * @connector: connector corresponding to the HDMI/DP sink
@@ -5479,7 +5468,7 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	const struct drm_display_info *info = &connector->display_info;
 	const struct cea_db *db;
 	struct cea_db_iter iter;
-	uint8_t *eld = connector->eld;
+	u8 *eld = connector->display_info.eld;
 	int total_sad_count = 0;
 	int mnl;
 
@@ -5659,16 +5648,17 @@ EXPORT_SYMBOL(drm_edid_to_speaker_allocation);
 int drm_av_sync_delay(struct drm_connector *connector,
 		      const struct drm_display_mode *mode)
 {
+	const struct drm_display_info *info = &connector->display_info;
 	int i = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 	int a, v;
 
-	if (!connector->latency_present[0])
+	if (!info->latency_present[0])
 		return 0;
-	if (!connector->latency_present[1])
+	if (!info->latency_present[1])
 		i = 0;
 
-	a = connector->audio_latency[i];
-	v = connector->video_latency[i];
+	a = info->audio_latency[i];
+	v = info->video_latency[i];
 
 	/*
 	 * HDMI/DP sink doesn't support audio or video?
@@ -6437,7 +6427,6 @@ static void update_display_info(struct drm_connector *connector,
 	const struct edid *edid;
 
 	drm_reset_display_info(connector);
-	clear_eld(connector);
 
 	if (!drm_edid)
 		return;
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index b7c11bdce2c8..22a0160977d7 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1640,7 +1640,7 @@ static int hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
 	struct hdmi_context *hdata = dev_get_drvdata(dev);
 	struct drm_connector *connector = &hdata->connector;
 
-	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+	memcpy(buf, connector->display_info.eld, min(sizeof(connector->display_info.eld), len));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 626c47e96a6d..f4241d46ba65 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -336,7 +336,7 @@ static void g4x_audio_codec_enable(struct intel_encoder *encoder,
 	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_connector *connector = conn_state->connector;
-	const u32 *eld = (const u32 *)connector->eld;
+	const u32 *eld = (const u32 *)connector->display_info.eld;
 	int eld_buffer_size, len, i;
 
 	intel_crtc_wait_for_next_vblank(crtc);
@@ -345,7 +345,7 @@ static void g4x_audio_codec_enable(struct intel_encoder *encoder,
 		     G4X_ELD_VALID | G4X_ELD_ADDRESS_MASK, 0);
 
 	eld_buffer_size = g4x_eld_buffer_size(i915);
-	len = min(drm_eld_size(connector->eld) / 4, eld_buffer_size);
+	len = min(drm_eld_size(connector->display_info.eld) / 4, eld_buffer_size);
 
 	for (i = 0; i < len; i++)
 		intel_de_write(i915, G4X_HDMIW_HDMIEDID, eld[i]);
@@ -620,7 +620,7 @@ static void hsw_audio_codec_enable(struct intel_encoder *encoder,
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_connector *connector = conn_state->connector;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
-	const u32 *eld = (const u32 *)connector->eld;
+	const u32 *eld = (const u32 *)connector->display_info.eld;
 	int eld_buffer_size, len, i;
 
 	mutex_lock(&i915->display.audio.mutex);
@@ -644,7 +644,7 @@ static void hsw_audio_codec_enable(struct intel_encoder *encoder,
 		     IBX_ELD_ADDRESS_MASK, 0);
 
 	eld_buffer_size = hsw_eld_buffer_size(i915, cpu_transcoder);
-	len = min(drm_eld_size(connector->eld) / 4, eld_buffer_size);
+	len = min(drm_eld_size(connector->display_info.eld) / 4, eld_buffer_size);
 
 	for (i = 0; i < len; i++)
 		intel_de_write(i915, HSW_AUD_EDID_DATA(cpu_transcoder), eld[i]);
@@ -748,7 +748,7 @@ static void ilk_audio_codec_enable(struct intel_encoder *encoder,
 	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_connector *connector = conn_state->connector;
-	const u32 *eld = (const u32 *)connector->eld;
+	const u32 *eld = (const u32 *)connector->display_info.eld;
 	enum port port = encoder->port;
 	enum pipe pipe = crtc->pipe;
 	int eld_buffer_size, len, i;
@@ -772,7 +772,7 @@ static void ilk_audio_codec_enable(struct intel_encoder *encoder,
 		     IBX_ELD_ADDRESS_MASK, 0);
 
 	eld_buffer_size = ilk_eld_buffer_size(i915, pipe);
-	len = min(drm_eld_size(connector->eld) / 4, eld_buffer_size);
+	len = min(drm_eld_size(connector->display_info.eld) / 4, eld_buffer_size);
 
 	for (i = 0; i < len; i++)
 		intel_de_write(i915, regs.hdmiw_hdmiedid, eld[i]);
@@ -837,15 +837,15 @@ void intel_audio_codec_enable(struct intel_encoder *encoder,
 	drm_dbg_kms(&i915->drm, "[CONNECTOR:%d:%s][ENCODER:%d:%s] Enable audio codec on pipe %c, %u bytes ELD\n",
 		    connector->base.id, connector->name,
 		    encoder->base.base.id, encoder->base.name,
-		    pipe_name(pipe), drm_eld_size(connector->eld));
+		    pipe_name(pipe), drm_eld_size(connector->display_info.eld));
 
 	/* FIXME precompute the ELD in .compute_config() */
-	if (!connector->eld[0])
+	if (!connector->display_info.eld[0])
 		drm_dbg_kms(&i915->drm,
 			    "Bogus ELD on [CONNECTOR:%d:%s]\n",
 			    connector->base.id, connector->name);
 
-	connector->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
+	connector->display_info.eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
 
 	if (i915->display.funcs.audio)
 		i915->display.funcs.audio->audio_codec_enable(encoder,
@@ -868,7 +868,7 @@ void intel_audio_codec_enable(struct intel_encoder *encoder,
 						      (int)port, (int)pipe);
 	}
 
-	intel_lpe_audio_notify(i915, pipe, port, connector->eld,
+	intel_lpe_audio_notify(i915, pipe, port, connector->display_info.eld,
 			       crtc_state->port_clock,
 			       intel_crtc_has_dp_encoder(crtc_state));
 }
@@ -1236,7 +1236,7 @@ static int i915_audio_component_get_eld(struct device *kdev, int port,
 	ret = 0;
 	*enabled = intel_encoder->audio_connector != NULL;
 	if (*enabled) {
-		eld = intel_encoder->audio_connector->eld;
+		eld = intel_encoder->audio_connector->display_info.eld;
 		ret = drm_eld_size(eld);
 		memcpy(buf, eld, min(max_bytes, ret));
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 21805c15d5eb..582bbc194305 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -1756,7 +1756,7 @@ static void intel_sdvo_enable_audio(struct intel_sdvo *intel_sdvo,
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	struct drm_connector *connector = conn_state->connector;
-	u8 *eld = connector->eld;
+	u8 *eld = connector->display_info.eld;
 
 	eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index b4feaabdb6a7..3fd448a6d8d1 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2432,7 +2432,7 @@ static int mtk_dp_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
 	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
 
 	if (mtk_dp->enabled)
-		memcpy(buf, mtk_dp->conn->eld, len);
+		memcpy(buf, mtk_dp->conn->display_info.eld, len);
 	else
 		memset(buf, 0, len);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0a8e0a13f516..edc96b32cf4c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1634,7 +1634,8 @@ static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 
 	if (hdmi->enabled)
-		memcpy(buf, hdmi->curr_conn->eld, min(sizeof(hdmi->curr_conn->eld), len));
+		memcpy(buf, hdmi->curr_conn->display_info.eld,
+		       min(sizeof(hdmi->curr_conn->display_info.eld), len));
 	else
 		memset(buf, 0, len);
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 6666783e1468..993b248fd9e9 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -499,8 +499,8 @@ static int dp_audio_get_eld(struct device *dev,
 		return -ENODEV;
 	}
 
-	memcpy(buf, dp_display->connector->eld,
-		min(sizeof(dp_display->connector->eld), len));
+	memcpy(buf, dp_display->connector->display_info.eld,
+	       min(sizeof(dp_display->connector->display_info.eld), len));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/radeon/dce6_afmt.c b/drivers/gpu/drm/radeon/dce6_afmt.c
index 4a1d5447eac1..cf92c108e377 100644
--- a/drivers/gpu/drm/radeon/dce6_afmt.c
+++ b/drivers/gpu/drm/radeon/dce6_afmt.c
@@ -134,15 +134,15 @@ void dce6_afmt_write_latency_fields(struct drm_encoder *encoder,
 		return;
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
-		if (connector->latency_present[1])
-			tmp = VIDEO_LIPSYNC(connector->video_latency[1]) |
-				AUDIO_LIPSYNC(connector->audio_latency[1]);
+		if (connector->display_info.latency_present[1])
+			tmp = VIDEO_LIPSYNC(connector->display_info.video_latency[1]) |
+				AUDIO_LIPSYNC(connector->display_info.audio_latency[1]);
 		else
 			tmp = VIDEO_LIPSYNC(0) | AUDIO_LIPSYNC(0);
 	} else {
-		if (connector->latency_present[0])
-			tmp = VIDEO_LIPSYNC(connector->video_latency[0]) |
-				AUDIO_LIPSYNC(connector->audio_latency[0]);
+		if (connector->display_info.latency_present[0])
+			tmp = VIDEO_LIPSYNC(connector->display_info.video_latency[0]) |
+				AUDIO_LIPSYNC(connector->display_info.audio_latency[0]);
 		else
 			tmp = VIDEO_LIPSYNC(0) | AUDIO_LIPSYNC(0);
 	}
diff --git a/drivers/gpu/drm/radeon/evergreen_hdmi.c b/drivers/gpu/drm/radeon/evergreen_hdmi.c
index 5f3078f8ab95..ef6e0f3003a3 100644
--- a/drivers/gpu/drm/radeon/evergreen_hdmi.c
+++ b/drivers/gpu/drm/radeon/evergreen_hdmi.c
@@ -102,15 +102,15 @@ void dce4_afmt_write_latency_fields(struct drm_encoder *encoder,
 	u32 tmp = 0;
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
-		if (connector->latency_present[1])
-			tmp = VIDEO_LIPSYNC(connector->video_latency[1]) |
-				AUDIO_LIPSYNC(connector->audio_latency[1]);
+		if (connector->display_info.latency_present[1])
+			tmp = VIDEO_LIPSYNC(connector->display_info.video_latency[1]) |
+				AUDIO_LIPSYNC(connector->display_info.audio_latency[1]);
 		else
 			tmp = VIDEO_LIPSYNC(255) | AUDIO_LIPSYNC(255);
 	} else {
-		if (connector->latency_present[0])
-			tmp = VIDEO_LIPSYNC(connector->video_latency[0]) |
-				AUDIO_LIPSYNC(connector->audio_latency[0]);
+		if (connector->display_info.latency_present[0])
+			tmp = VIDEO_LIPSYNC(connector->display_info.video_latency[0]) |
+				AUDIO_LIPSYNC(connector->display_info.audio_latency[0]);
 		else
 			tmp = VIDEO_LIPSYNC(255) | AUDIO_LIPSYNC(255);
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index d6ccaf24ee0c..8e075e18f8e8 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -769,8 +769,8 @@ static int radeon_audio_component_get_eld(struct device *kdev, int port,
 		if (!connector)
 			continue;
 		*enabled = true;
-		ret = drm_eld_size(connector->eld);
-		memcpy(buf, connector->eld, min(max_bytes, ret));
+		ret = drm_eld_size(connector->display_info.eld);
+		memcpy(buf, connector->display_info.eld, min(max_bytes, ret));
 		break;
 	}
 
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 8539fe1fedc4..bbffe0b379f5 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1220,7 +1220,7 @@ static int hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf, size
 	struct drm_connector *connector = hdmi->drm_connector;
 
 	DRM_DEBUG_DRIVER("\n");
-	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+	memcpy(buf, connector->display_info.eld, min(sizeof(connector->display_info.eld), len));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 14628864487a..05181e152168 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2411,7 +2411,7 @@ static int vc4_hdmi_audio_get_eld(struct device *dev, void *data,
 	struct drm_connector *connector = &vc4_hdmi->connector;
 
 	mutex_lock(&vc4_hdmi->mutex);
-	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+	memcpy(buf, connector->display_info.eld, min(sizeof(connector->display_info.eld), len));
 	mutex_unlock(&vc4_hdmi->mutex);
 
 	return 0;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 627bedc47511..30f51e8a7985 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -738,6 +738,29 @@ struct drm_display_info {
 	 * @quirks: EDID based quirks. Internal to EDID parsing.
 	 */
 	u32 quirks;
+
+#define MAX_ELD_BYTES	128
+	/**
+	 * @eld: EDID-like data, if present
+	 */
+	u8 eld[MAX_ELD_BYTES];
+
+	/**
+	 * @latency_present: AV delay info from ELD, if found
+	 */
+	bool latency_present[2];
+
+	/**
+	 * @video_latency: Video latency info from ELD, if found.
+	 * [0]: progressive, [1]: interlaced
+	 */
+	int video_latency[2];
+
+	/**
+	 * @audio_latency: audio latency info from ELD, if found
+	 * [0]: progressive, [1]: interlaced
+	 */
+	int audio_latency[2];
 };
 
 int drm_display_info_set_bus_formats(struct drm_display_info *info,
@@ -1685,22 +1708,6 @@ struct drm_connector {
 	 */
 	struct drm_encoder *encoder;
 
-#define MAX_ELD_BYTES	128
-	/** @eld: EDID-like data, if present */
-	uint8_t eld[MAX_ELD_BYTES];
-	/** @latency_present: AV delay info from ELD, if found */
-	bool latency_present[2];
-	/**
-	 * @video_latency: Video latency info from ELD, if found.
-	 * [0]: progressive, [1]: interlaced
-	 */
-	int video_latency[2];
-	/**
-	 * @audio_latency: audio latency info from ELD, if found
-	 * [0]: progressive, [1]: interlaced
-	 */
-	int audio_latency[2];
-
 	/**
 	 * @ddc: associated ddc adapter.
 	 * A connector usually has its associated ddc adapter. If a driver uses
-- 
2.34.1

