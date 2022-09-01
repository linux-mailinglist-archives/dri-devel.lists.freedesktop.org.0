Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 191AE5A9735
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 14:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA4D10E6F9;
	Thu,  1 Sep 2022 12:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEA310E6F6;
 Thu,  1 Sep 2022 12:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662036464; x=1693572464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j0ifzWf/W+bIVDul8lJORZcfeXXvUFl5irA9uw0c4lk=;
 b=EE0xGdA7FXoFnlbuO2+BUUV/yuWCQQTL7pJYRKHa/id0zBSQ0LgxWUuE
 RWtBNENqH7Sqs4yDB9uV3YtRVgUV3tO2yTnzI+lsmALn/odqwdAQOeN4R
 qbyLAWDjGXA0dkohEcPyeIA79Z+jnVfjUogwjSDb4EBvFDc9J8lAdeGAj
 E+Oq1W/G1Y2NejQIKHnZjtR33VT/CFLF99dRR9Ez8oZdZHnEP/fMfEqRQ
 KwKtYxInt1CkXW2pN0+9mzaF37/nwgYO6GW5wm+mXL3Q3wnMmU5FAJpNo
 VXSASYTzDNdxo5VkeI80FFH+sdPclt4wV33JR3OkuezMqO3pQHAajjrd5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="296488477"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="296488477"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 05:47:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="642318126"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.142])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 05:47:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm/nouveau: convert to using is_hdmi and has_audio from
 display info
Date: Thu,  1 Sep 2022 15:47:04 +0300
Message-Id: <e2fa3e97b0989a50b9050d0518844d1f403385ea.1662036058.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1662036058.git.jani.nikula@intel.com>
References: <cover.1662036058.git.jani.nikula@intel.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, Jani Nikula <jani.nikula@intel.com>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the parsed results for is_hdmi and has_audio in display info over
calling drm_detect_hdmi_monitor() and drm_detect_monitor_audio(),
respectively.

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
index 33c97d510999..d0d9494b729c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -769,7 +769,7 @@ nv50_audio_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 				     (0x0100 << nv_crtc->index),
 	};
 
-	if (!drm_detect_monitor_audio(nv_connector->edid))
+	if (!nv_connector->base.display_info.has_audio)
 		return;
 
 	mutex_lock(&drm->audio.lock);
@@ -839,7 +839,7 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 	int ret;
 	int size;
 
-	if (!drm_detect_hdmi_monitor(nv_connector->edid))
+	if (!nv_connector->base.display_info.is_hdmi)
 		return;
 
 	hdmi = &nv_connector->base.display_info.hdmi;
@@ -1705,7 +1705,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 
 	if ((disp->disp->object.oclass == GT214_DISP ||
 	     disp->disp->object.oclass >= GF110_DISP) &&
-	    drm_detect_monitor_audio(nv_connector->edid))
+	    nv_connector->base.display_info.has_audio)
 		hda = true;
 	nv50_outp_acquire(nv_encoder, hda);
 
@@ -1721,7 +1721,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 			 */
 			if (mode->clock >= 165000 &&
 			    nv_encoder->dcb->duallink_possible &&
-			    !drm_detect_hdmi_monitor(nv_connector->edid))
+			    !nv_connector->base.display_info.is_hdmi)
 				proto = NV507D_SOR_SET_CONTROL_PROTOCOL_DUAL_TMDS;
 		} else {
 			proto = NV507D_SOR_SET_CONTROL_PROTOCOL_SINGLE_TMDS_B;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index c3c57be54e1c..8b5bc834f1b3 100644
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
index 1991bbb1d05c..2ef5fb8df4ed 100644
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
2.34.1

