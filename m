Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B76D361C61
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 11:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE26A6EB46;
	Fri, 16 Apr 2021 09:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5F56EB3E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 09:00:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D82B5AF42;
 Fri, 16 Apr 2021 09:00:55 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
 broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
 emil.l.velikov@gmail.com, geert+renesas@glider.be, hdegoede@redhat.com,
 bluescreen_avenger@verizon.net, gregkh@linuxfoundation.org
Subject: [PATCH v4 9/9] drm/simpledrm: Acquire memory aperture for framebuffer
Date: Fri, 16 Apr 2021 11:00:48 +0200
Message-Id: <20210416090048.11492-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210416090048.11492-1-tzimmermann@suse.de>
References: <20210416090048.11492-1-tzimmermann@suse.de>
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
Cc: virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We register the simplekms device with the DRM platform helpers. A
native driver for the graphics hardware will kick-out the simpledrm
driver before taking over the device.

The original generic platform device from the simple-framebuffer boot
code will be unregistered. The native driver will use whatever native
hardware device it received.

v4:
	* convert to drm_aperture_acquire_from_firmware()
v3:
	* use platform_device_unregister() and handle detachment
	  like hot-unplug event (Daniel)
v2:
	* adapt to aperture changes
	* use drm_dev_unplug() and drm_dev_enter/exit()
	* don't split error string

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
---
 drivers/gpu/drm/tiny/simpledrm.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 9d522473cd7c..2bdb477d9326 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -6,6 +6,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
@@ -517,14 +518,23 @@ static int simpledrm_device_init_fb(struct simpledrm_device *sdev)
 
 static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
 {
+	struct drm_device *dev = &sdev->dev;
 	struct platform_device *pdev = sdev->pdev;
 	struct resource *mem;
 	void __iomem *screen_base;
+	int ret;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem)
 		return -EINVAL;
 
+	ret = devm_aperture_acquire_from_firmware(dev, mem->start, resource_size(mem));
+	if (ret) {
+		drm_err(dev, "could not acquire memory range [0x%llx:0x%llx]: error %d\n",
+			mem->start, mem->end, ret);
+		return ret;
+	}
+
 	screen_base = devm_ioremap_wc(&pdev->dev, mem->start,
 				      resource_size(mem));
 	if (!screen_base)
@@ -625,12 +635,18 @@ simpledrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	void *vmap = shadow_plane_state->map[0].vaddr; /* TODO: Use mapping abstraction properly */
+	struct drm_device *dev = &sdev->dev;
+	int idx;
 
 	if (!fb)
 		return;
 
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
 	drm_fb_blit_dstclip(sdev->screen_base, sdev->pitch,
 			    sdev->format->format, vmap, fb);
+	drm_dev_exit(idx);
 }
 
 static void
@@ -658,7 +674,9 @@ simpledrm_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	void *vmap = shadow_plane_state->map[0].vaddr; /* TODO: Use mapping abstraction properly */
 	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_device *dev = &sdev->dev;
 	struct drm_rect clip;
+	int idx;
 
 	if (!fb)
 		return;
@@ -666,8 +684,13 @@ simpledrm_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &clip))
 		return;
 
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
 	drm_fb_blit_rect_dstclip(sdev->screen_base, sdev->pitch,
 				 sdev->format->format, vmap, fb, &clip);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_simple_display_pipe_funcs
@@ -847,7 +870,7 @@ static int simpledrm_remove(struct platform_device *pdev)
 	struct simpledrm_device *sdev = platform_get_drvdata(pdev);
 	struct drm_device *dev = &sdev->dev;
 
-	drm_dev_unregister(dev);
+	drm_dev_unplug(dev);
 
 	return 0;
 }
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
