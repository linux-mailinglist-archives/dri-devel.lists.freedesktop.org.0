Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD3B82C3EF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 17:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9646310E125;
	Fri, 12 Jan 2024 16:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A8C10E0CB;
 Fri, 12 Jan 2024 16:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705078211; x=1736614211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nifqKiDfFO+liY3Ml1I1zDRExYkmjtBY13GnYwpbdM8=;
 b=jO0uaQgRooGK9zrXPA8b7frY8Z8G0zwhmCwBDhRWD2kU+wwd09/yNX1U
 po5egDX8+eC1tfjeidnGDv9yI2imBIzHuG24qPVimnB7TWL4QX1PtH0rq
 XHhY5am8VtcPjsrRKoRgy+1QUvXzSeubQsiub3QlYmDKI6f0CpjemJhNj
 OYVE1896Zd7aH0W33ApEf+8dtADplqZ8djo/V+llDYsqyO7kbnVND31dQ
 7cFmR80fPO4strnMtYYuMcGied1hrt67IplBVcGl57wko2B9rpbaY66M+
 cetoTJCmiBBTBBOllxqzrPOLnuYKtYOmkWVvXyRiB/8IFzTo4vqKo3J5O A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="12583269"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="12583269"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:50:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="776044178"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="776044178"
Received: from tsenx-mobl.ger.corp.intel.com (HELO localhost) ([10.252.38.158])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:50:08 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/nouveau: convert to using is_hdmi and has_audio from
 display info
Date: Fri, 12 Jan 2024 18:49:53 +0200
Message-Id: <924db0d9debec057fe15e820bc470a966a3401b0.1705078136.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705078136.git.jani.nikula@intel.com>
References: <cover.1705078136.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Danilo Krummrich <dakr@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the parsed results for is_hdmi and has_audio in display info over
calling drm_detect_hdmi_monitor() and drm_detect_monitor_audio(),
respectively.

Conveniently, this also removes the need to use edid_blob_ptr.

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
index 8d37a694b772..908b1042669c 100644
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
+		    !nv_connector->base.display_info.is_hdmi)
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

