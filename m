Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CD46EC02B
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A23710E40D;
	Sun, 23 Apr 2023 14:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFCC10E404;
 Sun, 23 Apr 2023 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/W4Otev8naKI+sTtsOTBF0+9f4KzatyGi8o5pO95DCc=; b=pccns+OHh+ISutnzDBzunpavg5
 2jNNXAWTA3OhX/+/uK59iGeX89oRWnewx768uhx1o6BKUrJNxIjW+b1a+DtS5ZSKCUWFtEKnX21f1
 SPVY/Hghr7FjxlcNuYexPZuiSIop9McU/7Z1LmdCQGfdY/ZK1ime3A/8vefdoZeTtQckJlJ4TuywT
 JVEScpNQqXPJDmxkUW9sHzVxVtasQzZTOkKZ0aBtfY7qAZtDXkb6Q0nYEOQ3GCNgJJMgdnpSd1KVU
 PNWQQ7FD7BxUqH8cbfKv73KTbY9ZIpVecTnoQqQzqcRxLjEqGTWe5rjpdmnnKjP9p7/bwo0+905e+
 +cS9yeaw==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaTI-00ANVs-GJ; Sun, 23 Apr 2023 16:13:44 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 32/40] drm/amd/display: add support for plane degamma TF
 and LUT properties
Date: Sun, 23 Apr 2023 13:10:44 -0100
Message-Id: <20230423141051.702990-33-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423141051.702990-1-mwen@igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

We only set CRTC degamma if we don't have plane degamma LUT or TF to
configure. We return -EINVAL if we don't have plane degamma settings, so
we can continue and check CRTC degamma.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 71 +++++++++++++++++--
 3 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1dac311cab67..c0321272c129 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5043,7 +5043,9 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
 	 * Always set input transfer function, since plane state is refreshed
 	 * every time.
 	 */
-	ret = amdgpu_dm_update_plane_color_mgmt(dm_crtc_state, dc_plane_state);
+	ret = amdgpu_dm_update_plane_color_mgmt(dm_crtc_state,
+						plane_state,
+						dc_plane_state);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index b9840c1f3cdf..bcf74b7391c9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -912,6 +912,7 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
 int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
 				     struct dc_state *ctx);
 int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
+				      struct drm_plane_state *plane_state,
 				      struct dc_plane_state *dc_plane_state);
 
 void amdgpu_dm_update_connector_after_detect(
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 518082222fff..693168cc1d9c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -868,9 +868,59 @@ static int map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
 	return 0;
 }
 
+#ifdef CONFIG_STEAM_DECK
+static int
+__set_dm_plane_degamma(struct drm_plane_state *plane_state,
+		       struct dc_plane_state *dc_plane_state)
+{
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
+	const struct drm_color_lut *degamma_lut;
+	enum drm_transfer_function drm_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
+	uint32_t degamma_size;
+	bool has_degamma_lut;
+	int ret;
+
+	degamma_lut = __extract_blob_lut(dm_plane_state->degamma_lut, &degamma_size);
+
+	has_degamma_lut = degamma_lut &&
+			  !__is_lut_linear(degamma_lut, degamma_size);
+
+	drm_tf = dm_plane_state->degamma_tf;
+
+	/* If we don't have plane degamma LUT nor TF to set on DC, we have
+	 * nothing to do here, return.
+	 */
+	if (!has_degamma_lut && drm_tf == DRM_TRANSFER_FUNCTION_DEFAULT)
+		return -EINVAL;
+
+	dc_plane_state->in_transfer_func->tf = drm_tf_to_dc_tf(drm_tf);
+
+	if (has_degamma_lut) {
+		ASSERT(degamma_size == MAX_COLOR_LUT_ENTRIES);
+
+		dc_plane_state->in_transfer_func->type =
+			TF_TYPE_DISTRIBUTED_POINTS;
+
+		ret = __set_input_tf(dc_plane_state->in_transfer_func,
+				   degamma_lut, degamma_size);
+		if (ret)
+			return ret;
+       } else {
+		dc_plane_state->in_transfer_func->type =
+			TF_TYPE_PREDEFINED;
+
+		if (!mod_color_calculate_degamma_params(NULL,
+		    dc_plane_state->in_transfer_func, NULL, false))
+			return -ENOMEM;
+	}
+	return 0;
+}
+#endif
+
 /**
  * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
  * @crtc: amdgpu_dm crtc state
+ * @plane_state: DRM plane state
  * @dc_plane_state: target DC surface
  *
  * Update the underlying dc_stream_state's input transfer function (ITF) in
@@ -881,13 +931,28 @@ static int map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
  * 0 on success. -ENOMEM if mem allocation fails.
  */
 int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
+				      struct drm_plane_state *plane_state,
 				      struct dc_plane_state *dc_plane_state)
 {
 	bool has_crtc_cm_degamma;
 	int ret;
 
+	/* Initially, we can just bypass the DGM block. */
+	dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;
+	dc_plane_state->in_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
+
+	/* After, we start to update values according to color props */
 	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
-	if (has_crtc_cm_degamma){
+
+#ifdef CONFIG_STEAM_DECK
+	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
+	if (ret != -EINVAL)
+		return ret;
+
+	/* As we don't have plane degamma, check if we have CRTC degamma
+	 * waiting for mapping to pre-blending degamma block */
+#endif
+	if (has_crtc_cm_degamma) {
 		/* AMD HW doesn't have post-blending degamma caps. When DRM
 		 * CRTC atomic degamma is set, we maps it to DPP degamma block
 		 * (pre-blending) or, on legacy gamma, we use DPP degamma to
@@ -897,10 +962,6 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
 		if (ret)
 			return ret;
-	} else {
-		/* ...Otherwise we can just bypass the DGM block. */
-		dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;
-		dc_plane_state->in_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
 	}
 
 	return 0;
-- 
2.39.2

