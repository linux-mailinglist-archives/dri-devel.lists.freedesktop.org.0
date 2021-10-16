Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D684304B8
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 21:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5746A6E509;
	Sat, 16 Oct 2021 19:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978D06E504;
 Sat, 16 Oct 2021 19:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1634409871; bh=jLUq6oGrOGn4w7bDrYmKsRIuapPzeZOwLUULZBLAFxo=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding;
 b=r4oSv+IrKTA3ShNBB1wV9dy2gWLCJMBvuF9OLT/nFIpzEVpcBR/6fxOD7k3sqGdup
 DUj2OrkQKP52u7k37VSKns9SJiMgRaivvLZp0py6ia3IzZBjwvMtABm4BAMs+djgx2
 rjMtf2y6WE9KIdqZDkKk62eJ5jG7f8iTquZkcWq4=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sat, 16 Oct 2021 20:44:03 +0200 (CEST)
X-EA-Auth: MMyhc0qBMvcFUjzQeQalt796U20LXx/W6vSX1zWFmT3OeIPryVtaWeP6qD+hsFcHRFRmzWHOZwb29SPRZb1fvnP+PpHaaaQX
From: Claudio Suarez <cssk@net-c.es>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, ville.syrjala@linux.intel.com
Cc: Claudio Suarez <cssk@net-c.es>
Subject: [PATCH v2 12/13] drm/nouveau: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Date: Sat, 16 Oct 2021 20:42:25 +0200
Message-Id: <20211016184226.3862-13-cssk@net-c.es>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211016184226.3862-1-cssk@net-c.es>
References: <20211016184226.3862-1-cssk@net-c.es>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Once EDID is parsed, the monitor HDMI support information is available
through drm_display_info.is_hdmi. Retriving the same information with
drm_detect_hdmi_monitor() is less efficient. Change to
drm_display_info.is_hdmi

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 ++--
 drivers/gpu/drm/nouveau/dispnv50/head.c | 8 +-------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index d7b9f7f8c9e3..b3c7199aa63d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -844,7 +844,7 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 	int ret;
 	int size;
 
-	if (!drm_detect_hdmi_monitor(nv_connector->edid))
+	if (!nv_connector->base.display_info.is_hdmi)
 		return;
 
 	hdmi = &nv_connector->base.display_info.hdmi;
@@ -1745,7 +1745,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 			 */
 			if (mode->clock >= 165000 &&
 			    nv_encoder->dcb->duallink_possible &&
-			    !drm_detect_hdmi_monitor(nv_connector->edid))
+			    !nv_connector->base.display_info.is_hdmi)
 				proto = NV507D_SOR_SET_CONTROL_PROTOCOL_DUAL_TMDS;
 		} else {
 			proto = NV507D_SOR_SET_CONTROL_PROTOCOL_SINGLE_TMDS_B;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index d66f97280282..29d6c010ac13 100644
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
-- 
2.33.0


