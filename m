Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAF0142547
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC766E85D;
	Mon, 20 Jan 2020 08:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF2F6E837;
 Mon, 20 Jan 2020 08:23:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CDAC6B25F;
 Mon, 20 Jan 2020 08:23:39 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com,
 maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
 robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
 vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
 bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH v3 12/22] drm/msm: Convert to struct
 drm_crtc_helper_funcs.get_scanout_position()
Date: Mon, 20 Jan 2020 09:23:04 +0100
Message-Id: <20200120082314.14756-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200120082314.14756-1-tzimmermann@suse.de>
References: <20200120082314.14756-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The callback struct drm_driver.get_scanout_position() is deprecated in
favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert
mem over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 67 +++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 61 ---------------------
 2 files changed, 67 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 05cc04f729d6..4decf19847a8 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -405,6 +405,72 @@ static void mdp5_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	spin_unlock_irqrestore(&mdp5_crtc->lm_lock, flags);
 }
 
+static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_encoder *encoder;
+
+	drm_for_each_encoder(encoder, dev)
+		if (encoder->crtc == crtc)
+			return encoder;
+
+	return NULL;
+}
+
+static bool mdp5_crtc_get_scanout_position(struct drm_crtc *crtc,
+					   bool in_vblank_irq,
+					   int *vpos, int *hpos,
+					   ktime_t *stime, ktime_t *etime,
+					   const struct drm_display_mode *mode)
+{
+	unsigned int pipe = crtc->index;
+	struct drm_encoder *encoder;
+	int line, vsw, vbp, vactive_start, vactive_end, vfp_end;
+
+
+	encoder = get_encoder_from_crtc(crtc);
+	if (!encoder) {
+		DRM_ERROR("no encoder found for crtc %d\n", pipe);
+		return false;
+	}
+
+	vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
+	vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
+
+	/*
+	 * the line counter is 1 at the start of the VSYNC pulse and VTOTAL at
+	 * the end of VFP. Translate the porch values relative to the line
+	 * counter positions.
+	 */
+
+	vactive_start = vsw + vbp + 1;
+
+	vactive_end = vactive_start + mode->crtc_vdisplay;
+
+	/* last scan line before VSYNC */
+	vfp_end = mode->crtc_vtotal;
+
+	if (stime)
+		*stime = ktime_get();
+
+	line = mdp5_encoder_get_linecount(encoder);
+
+	if (line < vactive_start)
+		line -= vactive_start;
+	else if (line > vactive_end)
+		line = line - vfp_end - vactive_start;
+	else
+		line -= vactive_start;
+
+	*vpos = line;
+	*hpos = 0;
+
+	if (etime)
+		*etime = ktime_get();
+
+	return true;
+}
+
 static void mdp5_crtc_atomic_disable(struct drm_crtc *crtc,
 				     struct drm_crtc_state *old_state)
 {
@@ -1063,6 +1129,7 @@ static const struct drm_crtc_helper_funcs mdp5_crtc_helper_funcs = {
 	.atomic_flush = mdp5_crtc_atomic_flush,
 	.atomic_enable = mdp5_crtc_atomic_enable,
 	.atomic_disable = mdp5_crtc_atomic_disable,
+	.get_scanout_position = mdp5_crtc_get_scanout_position,
 };
 
 static void mdp5_crtc_vblank_irq(struct mdp_irq *irq, uint32_t irqstatus)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index e43ecd4be10a..8b72ac44ce55 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -595,66 +595,6 @@ static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
 	return NULL;
 }
 
-static bool mdp5_get_scanoutpos(struct drm_device *dev, unsigned int pipe,
-				bool in_vblank_irq, int *vpos, int *hpos,
-				ktime_t *stime, ktime_t *etime,
-				const struct drm_display_mode *mode)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct drm_crtc *crtc;
-	struct drm_encoder *encoder;
-	int line, vsw, vbp, vactive_start, vactive_end, vfp_end;
-
-	crtc = priv->crtcs[pipe];
-	if (!crtc) {
-		DRM_ERROR("Invalid crtc %d\n", pipe);
-		return false;
-	}
-
-	encoder = get_encoder_from_crtc(crtc);
-	if (!encoder) {
-		DRM_ERROR("no encoder found for crtc %d\n", pipe);
-		return false;
-	}
-
-	vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
-	vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
-
-	/*
-	 * the line counter is 1 at the start of the VSYNC pulse and VTOTAL at
-	 * the end of VFP. Translate the porch values relative to the line
-	 * counter positions.
-	 */
-
-	vactive_start = vsw + vbp + 1;
-
-	vactive_end = vactive_start + mode->crtc_vdisplay;
-
-	/* last scan line before VSYNC */
-	vfp_end = mode->crtc_vtotal;
-
-	if (stime)
-		*stime = ktime_get();
-
-	line = mdp5_encoder_get_linecount(encoder);
-
-	if (line < vactive_start) {
-		line -= vactive_start;
-	} else if (line > vactive_end) {
-		line = line - vfp_end - vactive_start;
-	} else {
-		line -= vactive_start;
-	}
-
-	*vpos = line;
-	*hpos = 0;
-
-	if (etime)
-		*etime = ktime_get();
-
-	return true;
-}
-
 static u32 mdp5_get_vblank_counter(struct drm_device *dev, unsigned int pipe)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -763,7 +703,6 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	dev->mode_config.max_height = 0xffff;
 
 	dev->driver->get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos;
-	dev->driver->get_scanout_position = mdp5_get_scanoutpos;
 	dev->driver->get_vblank_counter = mdp5_get_vblank_counter;
 	dev->max_vblank_count = 0; /* max_vblank_count is set on each CRTC */
 	dev->vblank_disable_immediate = true;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
