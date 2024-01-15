Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C706F82DA66
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 14:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE0A10E2C9;
	Mon, 15 Jan 2024 13:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D3410E2C8;
 Mon, 15 Jan 2024 13:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705326252; x=1736862252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3vesQA5HuKEGXzRYvAj+khf+j3tigs6jVMxffs4GfxI=;
 b=GSEpsyR0W2PujsPZIUN3tI3t05/ZsqeZl45OQSkLrtQeszEbGrdc/lAp
 +0rpoq/UQbKHezCF4CM8zejZ8xLUEBxD7NlZ6NDXlSZR4YTwfeC4wyDd3
 1tNNzuLBThsTuMU01FFvcw6N0Z9+7UOg0AeD2DjH0hSa3Hu+dWJT5Fv4w
 SufDYNdF6gUzUBjwmpP31jR1viEzgR4f5+LrDGwfrzPEwZLkeHOS6lPs6
 YC3VSFLPt0zYOWxoAqiNQd+vvVRGFwnHb49anxfq57zawxk/FTrR6Il3X
 xnGetARnUJjTJyZP4uP0L4E5g8UJWuVs7vjGyuQ3IxuKtGHnwZAfr/GQY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="6370167"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="6370167"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 05:44:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="783812790"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="783812790"
Received: from srigaut-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.55.155])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 05:44:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/nouveau: convert to using is_hdmi and has_audio from
 display info
Date: Mon, 15 Jan 2024 15:44:03 +0200
Message-Id: <20240115134403.526197-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <924db0d9debec057fe15e820bc470a966a3401b0.1705078136.git.jani.nikula@intel.com>
References: <924db0d9debec057fe15e820bc470a966a3401b0.1705078136.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Cc: Danilo Krummrich <dakr@redhat.com>, Ilia Mirkin <imirkin@alum.mit.edu>,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the parsed results for is_hdmi and has_audio in display info over
calling drm_detect_hdmi_monitor() and drm_detect_monitor_audio(),
respectively.

Conveniently, this also removes the need to use edid_blob_ptr.

v2: Reverse a backwards if condition (Ilia)

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 8 ++++----
 drivers/gpu/drm/nouveau/dispnv50/head.c     | 8 +-------
 drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 8d37a694b772..a34e3113fc6c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -750,7 +750,7 @@ nv50_audio_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nvif_outp *outp = &nv_encoder->outp;
 
-	if (!nv50_audio_supported(encoder) || !drm_detect_monitor_audio(nv_connector->edid))
+	if (!nv50_audio_supported(encoder) || !nv_connector->base.display_info.has_audio)
 		return;
 
 	mutex_lock(&drm->audio.lock);
@@ -1764,7 +1764,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 	if ((disp->disp->object.oclass == GT214_DISP ||
 	     disp->disp->object.oclass >= GF110_DISP) &&
 	    nv_encoder->dcb->type != DCB_OUTPUT_LVDS &&
-	    drm_detect_monitor_audio(nv_connector->edid))
+	    nv_connector->base.display_info.has_audio)
 		hda = true;
 
 	if (!nvif_outp_acquired(outp))
@@ -1773,7 +1773,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 	switch (nv_encoder->dcb->type) {
 	case DCB_OUTPUT_TMDS:
 		if (disp->disp->object.oclass != NV50_DISP &&
-		    drm_detect_hdmi_monitor(nv_connector->edid))
+		    nv_connector->base.display_info.is_hdmi)
 			nv50_hdmi_enable(encoder, nv_crtc, nv_connector, state, mode, hda);
 
 		if (nv_encoder->outp.or.link & 1) {
@@ -1786,7 +1786,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 			 */
 			if (mode->clock >= 165000 &&
 			    nv_encoder->dcb->duallink_possible &&
-			    !drm_detect_hdmi_monitor(nv_connector->edid))
+			    !nv_connector->base.display_info.is_hdmi)
 				proto = NV507D_SOR_SET_CONTROL_PROTOCOL_DUAL_TMDS;
 		} else {
 			proto = NV507D_SOR_SET_CONTROL_PROTOCOL_SINGLE_TMDS_B;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 83355dbc15ee..d7c74cc43ba5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -127,14 +127,8 @@ nv50_head_atomic_check_view(struct nv50_head_atom *armh,
 	struct drm_display_mode *omode = &asyh->state.adjusted_mode;
 	struct drm_display_mode *umode = &asyh->state.mode;
 	int mode = asyc->scaler.mode;
-	struct edid *edid;
 	int umode_vdisplay, omode_hdisplay, omode_vdisplay;
 
-	if (connector->edid_blob_ptr)
-		edid = (struct edid *)connector->edid_blob_ptr->data;
-	else
-		edid = NULL;
-
 	if (!asyc->scaler.full) {
 		if (mode == DRM_MODE_SCALE_NONE)
 			omode = umode;
@@ -162,7 +156,7 @@ nv50_head_atomic_check_view(struct nv50_head_atom *armh,
 	 */
 	if ((asyc->scaler.underscan.mode == UNDERSCAN_ON ||
 	    (asyc->scaler.underscan.mode == UNDERSCAN_AUTO &&
-	     drm_detect_hdmi_monitor(edid)))) {
+	     connector->display_info.is_hdmi))) {
 		u32 bX = asyc->scaler.underscan.hborder;
 		u32 bY = asyc->scaler.underscan.vborder;
 		u32 r = (asyh->view.oH << 19) / asyh->view.oW;
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 856b3ef5edb8..938832a6af15 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1034,7 +1034,7 @@ get_tmds_link_bandwidth(struct drm_connector *connector)
 	unsigned duallink_scale =
 		nouveau_duallink && nv_encoder->dcb->duallink_possible ? 2 : 1;
 
-	if (drm_detect_hdmi_monitor(nv_connector->edid)) {
+	if (nv_connector->base.display_info.is_hdmi) {
 		info = &nv_connector->base.display_info;
 		duallink_scale = 1;
 	}
-- 
2.39.2

