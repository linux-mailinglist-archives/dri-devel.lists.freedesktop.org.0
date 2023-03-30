Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EED6D09F7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C7710EEE9;
	Thu, 30 Mar 2023 15:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A2410EEE1;
 Thu, 30 Mar 2023 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680190827; x=1711726827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1tpAD2lJHHTbfmMOk8wfEQn/PwAZtGTK00t9XCICJu8=;
 b=BDLOfWDp3jh2Kqt5F3vUJV1tUYbjJfDej/N/2VPRkNNaIMh/hg/KhrT0
 9DRIH8CMlXfPIxH0VSY2Fw17ucY1E/GZ8+AvHv3PWi2mqwqV4HQdZRLVY
 71SsJYdPQLX6mOZft7WNCQL5ckYJmYeK50bNXbl8Lde68cn7zWWwtznjR
 VdcpZXDz/fbClCm4IlQqe8pEGvBTzVHkwkQgA1S6prCQ95EQJq7pjjHEy
 mXDjB8ylgFfiSXIj1umemJvwC5Cf7kf9gugcV+AP5vJwIGU7+xoy/3rf6
 cNDLhB+VwVWrJ3OSnYiVPEq1ULBqwzCP4frMn0Wja3uwBxUSvr2fS3EF3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427480527"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="427480527"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="795702262"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="795702262"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/12] drm/nouveau: convert to using is_hdmi and has_audio
 from display info
Date: Thu, 30 Mar 2023 18:39:39 +0300
Message-Id: <21b080fbe1a70066f5f4dc2ab3a397dcbf5e8b92.1680190534.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680190534.git.jani.nikula@intel.com>
References: <cover.1680190534.git.jani.nikula@intel.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, jani.nikula@intel.com,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the parsed results for is_hdmi and has_audio in display info over
calling drm_detect_hdmi_monitor() and drm_detect_monitor_audio(),
respectively.

Conveniently, this also removes the need to use edid_blob_ptr.

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 8 ++++----
 drivers/gpu/drm/nouveau/dispnv50/head.c     | 8 +-------
 drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index ed9d374147b8..6c41e0316043 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -713,7 +713,7 @@ nv50_audio_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nvif_outp *outp = &nv_encoder->outp;
 
-	if (!nv50_audio_supported(encoder) || !drm_detect_monitor_audio(nv_connector->edid))
+	if (!nv50_audio_supported(encoder) || !nv_connector->base.display_info.has_audio)
 		return;
 
 	mutex_lock(&drm->audio.lock);
@@ -1555,13 +1555,13 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 
 	if ((disp->disp->object.oclass == GT214_DISP ||
 	     disp->disp->object.oclass >= GF110_DISP) &&
-	    drm_detect_monitor_audio(nv_connector->edid))
+	    nv_connector->base.display_info.has_audio)
 		hda = true;
 
 	switch (nv_encoder->dcb->type) {
 	case DCB_OUTPUT_TMDS:
 		if (disp->disp->object.oclass == NV50_DISP ||
-		    !drm_detect_hdmi_monitor(nv_connector->edid))
+		    !nv_connector->base.display_info.is_hdmi)
 			nvif_outp_acquire_tmds(outp, nv_crtc->index, false, 0, 0, 0, false);
 		else
 			nv50_hdmi_enable(encoder, nv_crtc, nv_connector, state, mode, hda);
@@ -1576,7 +1576,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 			 */
 			if (mode->clock >= 165000 &&
 			    nv_encoder->dcb->duallink_possible &&
-			    !drm_detect_hdmi_monitor(nv_connector->edid))
+			    !nv_connector->base.display_info.is_hdmi)
 				proto = NV507D_SOR_SET_CONTROL_PROTOCOL_DUAL_TMDS;
 		} else {
 			proto = NV507D_SOR_SET_CONTROL_PROTOCOL_SINGLE_TMDS_B;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 5f490fbf1877..628db44af891 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -126,14 +126,8 @@ nv50_head_atomic_check_view(struct nv50_head_atom *armh,
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
@@ -161,7 +155,7 @@ nv50_head_atomic_check_view(struct nv50_head_atom *armh,
 	 */
 	if ((asyc->scaler.underscan.mode == UNDERSCAN_ON ||
 	    (asyc->scaler.underscan.mode == UNDERSCAN_AUTO &&
-	     drm_detect_hdmi_monitor(edid)))) {
+	     connector->display_info.is_hdmi))) {
 		u32 bX = asyc->scaler.underscan.hborder;
 		u32 bY = asyc->scaler.underscan.vborder;
 		u32 r = (asyh->view.oH << 19) / asyh->view.oW;
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 086b66b60d91..3143d2083c6d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1012,7 +1012,7 @@ get_tmds_link_bandwidth(struct drm_connector *connector)
 	unsigned duallink_scale =
 		nouveau_duallink && nv_encoder->dcb->duallink_possible ? 2 : 1;
 
-	if (drm_detect_hdmi_monitor(nv_connector->edid)) {
+	if (nv_connector->base.display_info.is_hdmi) {
 		info = &nv_connector->base.display_info;
 		duallink_scale = 1;
 	}
-- 
2.39.2

