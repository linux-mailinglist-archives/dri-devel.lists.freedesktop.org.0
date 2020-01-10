Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBF31369F5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 10:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BA36E99C;
	Fri, 10 Jan 2020 09:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180EC6E9E1;
 Fri, 10 Jan 2020 09:21:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B5A11B294;
 Fri, 10 Jan 2020 09:21:48 +0000 (UTC)
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
Subject: [PATCH 21/23] drm/vkms: Convert to CRTC VBLANK callbacks
Date: Fri, 10 Jan 2020 10:21:25 +0100
Message-Id: <20200110092127.27847-22-tzimmermann@suse.de>
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
their equivalents in struct drm_crtc_funcs. Convert vkms over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 9 ++++++---
 drivers/gpu/drm/vkms/vkms_drv.c  | 1 -
 drivers/gpu/drm/vkms/vkms_drv.h  | 4 ----
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 74f703b8d22a..ac85e17428f8 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -76,10 +76,12 @@ static void vkms_disable_vblank(struct drm_crtc *crtc)
 	hrtimer_cancel(&out->vblank_hrtimer);
 }
 
-bool vkms_get_vblank_timestamp(struct drm_device *dev, unsigned int pipe,
-			       int *max_error, ktime_t *vblank_time,
-			       bool in_vblank_irq)
+static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
+				      int *max_error, ktime_t *vblank_time,
+				      bool in_vblank_irq)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
@@ -154,6 +156,7 @@ static const struct drm_crtc_funcs vkms_crtc_funcs = {
 	.atomic_destroy_state   = vkms_atomic_crtc_destroy_state,
 	.enable_vblank		= vkms_enable_vblank,
 	.disable_vblank		= vkms_disable_vblank,
+	.get_vblank_timestamp	= vkms_get_vblank_timestamp,
 	.get_crc_sources	= vkms_get_crc_sources,
 	.set_crc_source		= vkms_set_crc_source,
 	.verify_crc_source	= vkms_verify_crc_source,
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 25bd7519295f..860de052e820 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -103,7 +103,6 @@ static struct drm_driver vkms_driver = {
 	.dumb_create		= vkms_dumb_create,
 	.gem_vm_ops		= &vkms_gem_vm_ops,
 	.gem_free_object_unlocked = vkms_gem_free_object,
-	.get_vblank_timestamp	= vkms_get_vblank_timestamp,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = vkms_prime_import_sg_table,
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 7d52e24564db..eda04ffba7b1 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -111,10 +111,6 @@ struct vkms_gem_object {
 int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 		   struct drm_plane *primary, struct drm_plane *cursor);
 
-bool vkms_get_vblank_timestamp(struct drm_device *dev, unsigned int pipe,
-			       int *max_error, ktime_t *vblank_time,
-			       bool in_vblank_irq);
-
 int vkms_output_init(struct vkms_device *vkmsdev, int index);
 
 struct drm_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
