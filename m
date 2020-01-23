Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2E4146A58
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 15:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D516FD11;
	Thu, 23 Jan 2020 14:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99026FCD6;
 Thu, 23 Jan 2020 13:59:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A4AAB24A;
 Thu, 23 Jan 2020 13:59:55 +0000 (UTC)
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
Subject: [PATCH v4 09/22] drm/nouveau: Convert to CRTC VBLANK callbacks
Date: Thu, 23 Jan 2020 14:59:30 +0100
Message-Id: <20200123135943.24140-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123135943.24140-1-tzimmermann@suse.de>
References: <20200123135943.24140-1-tzimmermann@suse.de>
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
their equivalents in struct drm_crtc_funcs. Convert nouvean over.

v4:
	* add argument names in function declaration

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c   |  3 +++
 drivers/gpu/drm/nouveau/dispnv50/head.c   |  4 ++++
 drivers/gpu/drm/nouveau/nouveau_display.c | 14 ++------------
 drivers/gpu/drm/nouveau/nouveau_display.h |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_drm.c     |  4 ----
 5 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 17e9d1c078a0..1f08de4241e0 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1248,6 +1248,9 @@ static const struct drm_crtc_funcs nv04_crtc_funcs = {
 	.set_config = drm_crtc_helper_set_config,
 	.page_flip = nv04_crtc_page_flip,
 	.destroy = nv_crtc_destroy,
+	.enable_vblank = nouveau_display_vblank_enable,
+	.disable_vblank = nouveau_display_vblank_disable,
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
 };
 
 static const struct drm_crtc_helper_funcs nv04_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 41852dd8fdbd..8f6455697ba7 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -29,6 +29,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_vblank.h>
 #include "nouveau_connector.h"
 void
 nv50_head_flush_clr(struct nv50_head *head,
@@ -482,6 +483,9 @@ nv50_head_func = {
 	.page_flip = drm_atomic_helper_page_flip,
 	.atomic_duplicate_state = nv50_head_atomic_duplicate_state,
 	.atomic_destroy_state = nv50_head_atomic_destroy_state,
+	.enable_vblank = nouveau_display_vblank_enable,
+	.disable_vblank = nouveau_display_vblank_disable,
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
 };
 
 struct nv50_head *
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 86f99dc8fcef..700817dc4fa0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -54,15 +54,10 @@ nouveau_display_vblank_handler(struct nvif_notify *notify)
 }
 
 int
-nouveau_display_vblank_enable(struct drm_device *dev, unsigned int pipe)
+nouveau_display_vblank_enable(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc;
 	struct nouveau_crtc *nv_crtc;
 
-	crtc = drm_crtc_from_index(dev, pipe);
-	if (!crtc)
-		return -EINVAL;
-
 	nv_crtc = nouveau_crtc(crtc);
 	nvif_notify_get(&nv_crtc->vblank);
 
@@ -70,15 +65,10 @@ nouveau_display_vblank_enable(struct drm_device *dev, unsigned int pipe)
 }
 
 void
-nouveau_display_vblank_disable(struct drm_device *dev, unsigned int pipe)
+nouveau_display_vblank_disable(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc;
 	struct nouveau_crtc *nv_crtc;
 
-	crtc = drm_crtc_from_index(dev, pipe);
-	if (!crtc)
-		return;
-
 	nv_crtc = nouveau_crtc(crtc);
 	nvif_notify_put(&nv_crtc->vblank);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index 26d34f1a77da..de004018ab5c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -61,8 +61,8 @@ int  nouveau_display_init(struct drm_device *dev, bool resume, bool runtime);
 void nouveau_display_fini(struct drm_device *dev, bool suspend, bool runtime);
 int  nouveau_display_suspend(struct drm_device *dev, bool runtime);
 void nouveau_display_resume(struct drm_device *dev, bool runtime);
-int  nouveau_display_vblank_enable(struct drm_device *, unsigned int);
-void nouveau_display_vblank_disable(struct drm_device *, unsigned int);
+int  nouveau_display_vblank_enable(struct drm_crtc *crtc);
+void nouveau_display_vblank_disable(struct drm_crtc *crtc);
 bool nouveau_display_scanoutpos(struct drm_crtc *crtc,
 				bool in_vblank_irq, int *vpos, int *hpos,
 				ktime_t *stime, ktime_t *etime,
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index fcc036a08965..6b1629c14dd7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1120,10 +1120,6 @@ driver_stub = {
 	.debugfs_init = nouveau_drm_debugfs_init,
 #endif
 
-	.enable_vblank = nouveau_display_vblank_enable,
-	.disable_vblank = nouveau_display_vblank_disable,
-	.get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
-
 	.ioctls = nouveau_ioctls,
 	.num_ioctls = ARRAY_SIZE(nouveau_ioctls),
 	.fops = &nouveau_driver_fops,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
