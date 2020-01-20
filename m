Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F3C142553
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DCA6FA6C;
	Mon, 20 Jan 2020 08:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19796E82C;
 Mon, 20 Jan 2020 08:23:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 380D5B261;
 Mon, 20 Jan 2020 08:23:43 +0000 (UTC)
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
Subject: [PATCH v3 16/22] drm/sti: Convert to CRTC VBLANK callbacks
Date: Mon, 20 Jan 2020 09:23:08 +0100
Message-Id: <20200120082314.14756-17-tzimmermann@suse.de>
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

VBLANK callbacks in struct drm_driver are deprecated in favor of
their equivalents in struct drm_crtc_funcs. Convert sti over.

v2:
	* remove unnecessary include of sti_crtc.h from sti_drv.c

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
---
 drivers/gpu/drm/sti/sti_crtc.c | 11 ++++++++---
 drivers/gpu/drm/sti/sti_crtc.h |  2 --
 drivers/gpu/drm/sti/sti_drv.c  |  4 ----
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_crtc.c
index dc64fbfc4e61..49e6cb8f5836 100644
--- a/drivers/gpu/drm/sti/sti_crtc.c
+++ b/drivers/gpu/drm/sti/sti_crtc.c
@@ -279,12 +279,13 @@ int sti_crtc_vblank_cb(struct notifier_block *nb,
 	return 0;
 }
 
-int sti_crtc_enable_vblank(struct drm_device *dev, unsigned int pipe)
+static int sti_crtc_enable_vblank(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	struct sti_private *dev_priv = dev->dev_private;
 	struct sti_compositor *compo = dev_priv->compo;
 	struct notifier_block *vtg_vblank_nb = &compo->vtg_vblank_nb[pipe];
-	struct drm_crtc *crtc = &compo->mixer[pipe]->drm_crtc;
 	struct sti_vtg *vtg = compo->vtg[pipe];
 
 	DRM_DEBUG_DRIVER("\n");
@@ -297,8 +298,10 @@ int sti_crtc_enable_vblank(struct drm_device *dev, unsigned int pipe)
 	return 0;
 }
 
-void sti_crtc_disable_vblank(struct drm_device *drm_dev, unsigned int pipe)
+static void sti_crtc_disable_vblank(struct drm_crtc *crtc)
 {
+	struct drm_device *drm_dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	struct sti_private *priv = drm_dev->dev_private;
 	struct sti_compositor *compo = priv->compo;
 	struct notifier_block *vtg_vblank_nb = &compo->vtg_vblank_nb[pipe];
@@ -330,6 +333,8 @@ static const struct drm_crtc_funcs sti_crtc_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
 	.late_register = sti_crtc_late_register,
+	.enable_vblank = sti_crtc_enable_vblank,
+	.disable_vblank = sti_crtc_disable_vblank,
 };
 
 bool sti_crtc_is_main(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/sti/sti_crtc.h b/drivers/gpu/drm/sti/sti_crtc.h
index df489ab14e2b..1132b4586712 100644
--- a/drivers/gpu/drm/sti/sti_crtc.h
+++ b/drivers/gpu/drm/sti/sti_crtc.h
@@ -15,8 +15,6 @@ struct sti_mixer;
 
 int sti_crtc_init(struct drm_device *drm_dev, struct sti_mixer *mixer,
 		  struct drm_plane *primary, struct drm_plane *cursor);
-int sti_crtc_enable_vblank(struct drm_device *dev, unsigned int pipe);
-void sti_crtc_disable_vblank(struct drm_device *dev, unsigned int pipe);
 int sti_crtc_vblank_cb(struct notifier_block *nb,
 		       unsigned long event, void *data);
 bool sti_crtc_is_main(struct drm_crtc *drm_crtc);
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index a39fc36f815b..50870d8cbb76 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -21,7 +21,6 @@
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 
-#include "sti_crtc.h"
 #include "sti_drv.h"
 #include "sti_plane.h"
 
@@ -146,9 +145,6 @@ static struct drm_driver sti_driver = {
 	.dumb_create = drm_gem_cma_dumb_create,
 	.fops = &sti_driver_fops,
 
-	.enable_vblank = sti_crtc_enable_vblank,
-	.disable_vblank = sti_crtc_disable_vblank,
-
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
