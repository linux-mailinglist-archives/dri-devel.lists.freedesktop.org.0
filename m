Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CABBF13C02E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 13:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9426E970;
	Wed, 15 Jan 2020 12:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00EF6E94B;
 Wed, 15 Jan 2020 12:17:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1A77FAFCB;
 Wed, 15 Jan 2020 12:17:05 +0000 (UTC)
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
Subject: [PATCH v2 08/21] drm/nouveau: Convert to struct
 drm_crtc_helper_funcs.get_scanout_position()
Date: Wed, 15 Jan 2020 13:16:39 +0100
Message-Id: <20200115121652.7050-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115121652.7050-1-tzimmermann@suse.de>
References: <20200115121652.7050-1-tzimmermann@suse.de>
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
nouveau over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c   |  1 +
 drivers/gpu/drm/nouveau/dispnv50/head.c   |  1 +
 drivers/gpu/drm/nouveau/nouveau_display.c | 14 +++-----------
 drivers/gpu/drm/nouveau/nouveau_display.h |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c     |  1 -
 5 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 37c50ea8f847..17e9d1c078a0 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1258,6 +1258,7 @@ static const struct drm_crtc_helper_funcs nv04_crtc_helper_funcs = {
 	.mode_set_base = nv04_crtc_mode_set_base,
 	.mode_set_base_atomic = nv04_crtc_mode_set_base_atomic,
 	.disable = nv_crtc_disable,
+	.get_scanout_position = nouveau_display_scanoutpos,
 };
 
 static const uint32_t modeset_formats[] = {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index c9692df2b76c..1354d19d9a18 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -403,6 +403,7 @@ nv50_head_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state *state)
 static const struct drm_crtc_helper_funcs
 nv50_head_help = {
 	.atomic_check = nv50_head_atomic_check,
+	.get_scanout_position = nouveau_display_scanoutpos,
 };
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 53f9bceaf17a..86f99dc8fcef 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -136,21 +136,13 @@ nouveau_display_scanoutpos_head(struct drm_crtc *crtc, int *vpos, int *hpos,
 }
 
 bool
-nouveau_display_scanoutpos(struct drm_device *dev, unsigned int pipe,
+nouveau_display_scanoutpos(struct drm_crtc *crtc,
 			   bool in_vblank_irq, int *vpos, int *hpos,
 			   ktime_t *stime, ktime_t *etime,
 			   const struct drm_display_mode *mode)
 {
-	struct drm_crtc *crtc;
-
-	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-		if (nouveau_crtc(crtc)->index == pipe) {
-			return nouveau_display_scanoutpos_head(crtc, vpos, hpos,
-							       stime, etime);
-		}
-	}
-
-	return false;
+	return nouveau_display_scanoutpos_head(crtc, vpos, hpos,
+					       stime, etime);
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index 6e8e66882e45..71e2af693f7f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -63,7 +63,7 @@ int  nouveau_display_suspend(struct drm_device *dev, bool runtime);
 void nouveau_display_resume(struct drm_device *dev, bool runtime);
 int  nouveau_display_vblank_enable(struct drm_device *, unsigned int);
 void nouveau_display_vblank_disable(struct drm_device *, unsigned int);
-bool  nouveau_display_scanoutpos(struct drm_device *, unsigned int,
+bool  nouveau_display_scanoutpos(struct drm_crtc *,
 				 bool, int *, int *, ktime_t *,
 				 ktime_t *, const struct drm_display_mode *);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 2cd83849600f..9fb38a018240 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1123,7 +1123,6 @@ driver_stub = {
 
 	.enable_vblank = nouveau_display_vblank_enable,
 	.disable_vblank = nouveau_display_vblank_disable,
-	.get_scanout_position = nouveau_display_scanoutpos,
 	.get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
 
 	.ioctls = nouveau_ioctls,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
