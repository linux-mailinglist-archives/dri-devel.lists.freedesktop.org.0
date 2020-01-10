Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB9C1369D6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 10:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033906EA06;
	Fri, 10 Jan 2020 09:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34976E9F2;
 Fri, 10 Jan 2020 09:21:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 886F8B2B4;
 Fri, 10 Jan 2020 09:21:43 +0000 (UTC)
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
Subject: [PATCH 15/23] drm/msm: Convert to CRTC VBLANK callbacks
Date: Fri, 10 Jan 2020 10:21:19 +0100
Message-Id: <20200110092127.27847-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200110092127.27847-1-tzimmermann@suse.de>
References: <20200110092127.27847-1-tzimmermann@suse.de>
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

VBLANK callbacks in struct drm_driver are deprecated in favor of
their equivalents in struct drm_crtc_funcs. Convert msm over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 ++
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |  2 ++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 15 ++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 34 -----------------------
 drivers/gpu/drm/msm/msm_drv.c             | 10 ++++---
 drivers/gpu/drm/msm/msm_drv.h             |  3 ++
 6 files changed, 28 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f197dce54576..b177d5052c5e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1281,6 +1281,8 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.atomic_destroy_state = dpu_crtc_destroy_state,
 	.late_register = dpu_crtc_late_register,
 	.early_unregister = dpu_crtc_early_unregister,
+	.enable_vblank  = msm_crtc_enable_vblank,
+	.disable_vblank = msm_crtc_disable_vblank,
 };
 
 static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index f34dca5d4532..c9239b07fe4f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -481,6 +481,8 @@ static const struct drm_crtc_funcs mdp4_crtc_funcs = {
 	.reset = drm_atomic_helper_crtc_reset,
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank  = msm_crtc_enable_vblank,
+	.disable_vblank = msm_crtc_disable_vblank,
 };
 
 static const struct drm_crtc_helper_funcs mdp4_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 4decf19847a8..70c326d330f6 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -471,6 +471,17 @@ static bool mdp5_crtc_get_scanout_position(struct drm_crtc *crtc,
 	return true;
 }
 
+static u32 mdp5_crtc_get_vblank_counter(struct drm_crtc *crtc)
+{
+	struct drm_encoder *encoder;
+
+	encoder = get_encoder_from_crtc(crtc);
+	if (!encoder)
+		return 0;
+
+	return mdp5_encoder_get_framecount(encoder);
+}
+
 static void mdp5_crtc_atomic_disable(struct drm_crtc *crtc,
 				     struct drm_crtc_state *old_state)
 {
@@ -1120,6 +1131,10 @@ static const struct drm_crtc_funcs mdp5_crtc_funcs = {
 	.cursor_set = mdp5_crtc_cursor_set,
 	.cursor_move = mdp5_crtc_cursor_move,
 	.atomic_print_state = mdp5_crtc_atomic_print_state,
+	.get_vblank_counter = mdp5_crtc_get_vblank_counter,
+	.enable_vblank  = msm_crtc_enable_vblank,
+	.disable_vblank = msm_crtc_disable_vblank,
+	.get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
 };
 
 static const struct drm_crtc_helper_funcs mdp5_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 8b72ac44ce55..6650f478b226 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -583,38 +583,6 @@ static int get_clk(struct platform_device *pdev, struct clk **clkp,
 	return 0;
 }
 
-static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
-{
-	struct drm_device *dev = crtc->dev;
-	struct drm_encoder *encoder;
-
-	drm_for_each_encoder(encoder, dev)
-		if (encoder->crtc == crtc)
-			return encoder;
-
-	return NULL;
-}
-
-static u32 mdp5_get_vblank_counter(struct drm_device *dev, unsigned int pipe)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct drm_crtc *crtc;
-	struct drm_encoder *encoder;
-
-	if (pipe >= priv->num_crtcs)
-		return 0;
-
-	crtc = priv->crtcs[pipe];
-	if (!crtc)
-		return 0;
-
-	encoder = get_encoder_from_crtc(crtc);
-	if (!encoder)
-		return 0;
-
-	return mdp5_encoder_get_framecount(encoder);
-}
-
 struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -702,8 +670,6 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	dev->mode_config.max_width = 0xffff;
 	dev->mode_config.max_height = 0xffff;
 
-	dev->driver->get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos;
-	dev->driver->get_vblank_counter = mdp5_get_vblank_counter;
 	dev->max_vblank_count = 0; /* max_vblank_count is set on each CRTC */
 	dev->vblank_disable_immediate = true;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c84f0a8b3f2c..c5e044136fe5 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -660,8 +660,10 @@ static void msm_irq_uninstall(struct drm_device *dev)
 	kms->funcs->irq_uninstall(kms);
 }
 
-static int msm_enable_vblank(struct drm_device *dev, unsigned int pipe)
+int msm_crtc_enable_vblank(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
@@ -670,8 +672,10 @@ static int msm_enable_vblank(struct drm_device *dev, unsigned int pipe)
 	return vblank_ctrl_queue_work(priv, pipe, true);
 }
 
-static void msm_disable_vblank(struct drm_device *dev, unsigned int pipe)
+void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
@@ -996,8 +1000,6 @@ static struct drm_driver msm_driver = {
 	.irq_preinstall     = msm_irq_preinstall,
 	.irq_postinstall    = msm_irq_postinstall,
 	.irq_uninstall      = msm_irq_uninstall,
-	.enable_vblank      = msm_enable_vblank,
-	.disable_vblank     = msm_disable_vblank,
 	.gem_free_object_unlocked = msm_gem_free_object,
 	.gem_vm_ops         = &vm_ops,
 	.dumb_create        = msm_gem_dumb_create,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 71547e756e29..108625cd553d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -232,6 +232,9 @@ struct drm_atomic_state *msm_atomic_state_alloc(struct drm_device *dev);
 void msm_atomic_state_clear(struct drm_atomic_state *state);
 void msm_atomic_state_free(struct drm_atomic_state *state);
 
+int msm_crtc_enable_vblank(struct drm_crtc *crtc);
+void msm_crtc_disable_vblank(struct drm_crtc *crtc);
+
 int msm_gem_init_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma, int npages);
 void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
