Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E0F139380
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 15:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF706E0B8;
	Mon, 13 Jan 2020 14:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C7289F6F;
 Mon, 13 Jan 2020 14:17:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BAC86B1B9;
 Mon, 13 Jan 2020 14:17:31 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH RESEND] drm/nouveau: Add HD-audio component notifier support
Date: Mon, 13 Jan 2020 15:17:21 +0100
Message-Id: <20200113141721.16123-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds the support for the notification of HD-audio hotplug
via the already existing drm_audio_component framework.  This allows
us more reliable hotplug notification and ELD transfer without
accessing HD-audio bus; it's more efficient, and more importantly, it
works without waking up the runtime PM.

The implementation is rather simplistic: nouveau driver provides the
get_eld ops for HD-audio, and it notifies the audio hotplug via
pin_eld_notify callback upon each nv50_audio_enable() and _disable()
call.  As the HD-audio pin assignment seems corresponding to the CRTC,
the crtc->index number is passed directly as the zero-based port
number.

The bind and unbind callbacks handle the device-link so that it
assures the PM call order.

Link: https://lore.kernel.org/r/20190722143815.7339-3-tiwai@suse.de
Reviewed-by: Lyude Paul <lyude@redhat.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

This is a re-submission of the same patch in the last year, applied on
top of the current linux-next.

Without this audio component support, the HD-audio HDMI codec won't
recognize the display hotplug at all due to the recent runtime PM
change.  So, please review and merge if it's OK.  Thanks.


 drivers/gpu/drm/nouveau/Kconfig         |   1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 111 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   7 ++
 3 files changed, 119 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 9c990266e876..7b5c4121374a 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -16,6 +16,7 @@ config DRM_NOUVEAU
 	select INPUT if ACPI && X86
 	select THERMAL if ACPI && X86
 	select ACPI_VIDEO if ACPI && X86
+	select SND_HDA_COMPONENT if SND_HDA_CORE
 	help
 	  Choose this option for open-source NVIDIA support.
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index fd31bff0c920..368749a883a1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -29,6 +29,7 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/hdmi.h>
+#include <linux/component.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_dp_helper.h>
@@ -476,12 +477,113 @@ nv50_dac_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	return 0;
 }
 
+/*
+ * audio component binding for ELD notification
+ */
+static void
+nv50_audio_component_eld_notify(struct drm_audio_component *acomp, int port)
+{
+	if (acomp && acomp->audio_ops && acomp->audio_ops->pin_eld_notify)
+		acomp->audio_ops->pin_eld_notify(acomp->audio_ops->audio_ptr,
+						 port, -1);
+}
+
+static int
+nv50_audio_component_get_eld(struct device *kdev, int port, int pipe,
+			     bool *enabled, unsigned char *buf, int max_bytes)
+{
+	struct drm_device *drm_dev = dev_get_drvdata(kdev);
+	struct nouveau_drm *drm = nouveau_drm(drm_dev);
+	struct drm_encoder *encoder;
+	struct nouveau_encoder *nv_encoder;
+	struct nouveau_connector *nv_connector;
+	struct nouveau_crtc *nv_crtc;
+	int ret = 0;
+
+	*enabled = false;
+	drm_for_each_encoder(encoder, drm->dev) {
+		nv_encoder = nouveau_encoder(encoder);
+		nv_connector = nouveau_encoder_connector_get(nv_encoder);
+		nv_crtc = nouveau_crtc(encoder->crtc);
+		if (!nv_connector || !nv_crtc || nv_crtc->index != port)
+			continue;
+		*enabled = drm_detect_monitor_audio(nv_connector->edid);
+		if (*enabled) {
+			ret = drm_eld_size(nv_connector->base.eld);
+			memcpy(buf, nv_connector->base.eld,
+			       min(max_bytes, ret));
+		}
+		break;
+	}
+	return ret;
+}
+
+static const struct drm_audio_component_ops nv50_audio_component_ops = {
+	.get_eld = nv50_audio_component_get_eld,
+};
+
+static int
+nv50_audio_component_bind(struct device *kdev, struct device *hda_kdev,
+			  void *data)
+{
+	struct drm_device *drm_dev = dev_get_drvdata(kdev);
+	struct nouveau_drm *drm = nouveau_drm(drm_dev);
+	struct drm_audio_component *acomp = data;
+
+	if (WARN_ON(!device_link_add(hda_kdev, kdev, DL_FLAG_STATELESS)))
+		return -ENOMEM;
+
+	drm_modeset_lock_all(drm_dev);
+	acomp->ops = &nv50_audio_component_ops;
+	acomp->dev = kdev;
+	drm->audio.component = acomp;
+	drm_modeset_unlock_all(drm_dev);
+	return 0;
+}
+
+static void
+nv50_audio_component_unbind(struct device *kdev, struct device *hda_kdev,
+			    void *data)
+{
+	struct drm_device *drm_dev = dev_get_drvdata(kdev);
+	struct nouveau_drm *drm = nouveau_drm(drm_dev);
+	struct drm_audio_component *acomp = data;
+
+	drm_modeset_lock_all(drm_dev);
+	drm->audio.component = NULL;
+	acomp->ops = NULL;
+	acomp->dev = NULL;
+	drm_modeset_unlock_all(drm_dev);
+}
+
+static const struct component_ops nv50_audio_component_bind_ops = {
+	.bind   = nv50_audio_component_bind,
+	.unbind = nv50_audio_component_unbind,
+};
+
+static void
+nv50_audio_component_init(struct nouveau_drm *drm)
+{
+	if (!component_add(drm->dev->dev, &nv50_audio_component_bind_ops))
+		drm->audio.component_registered = true;
+}
+
+static void
+nv50_audio_component_fini(struct nouveau_drm *drm)
+{
+	if (drm->audio.component_registered) {
+		component_del(drm->dev->dev, &nv50_audio_component_bind_ops);
+		drm->audio.component_registered = false;
+	}
+}
+
 /******************************************************************************
  * Audio
  *****************************************************************************/
 static void
 nv50_audio_disable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc)
 {
+	struct nouveau_drm *drm = nouveau_drm(encoder->dev);
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nv50_disp *disp = nv50_disp(encoder->dev);
 	struct {
@@ -496,11 +598,14 @@ nv50_audio_disable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc)
 	};
 
 	nvif_mthd(&disp->disp->object, 0, &args, sizeof(args));
+
+	nv50_audio_component_eld_notify(drm->audio.component, nv_crtc->index);
 }
 
 static void
 nv50_audio_enable(struct drm_encoder *encoder, struct drm_display_mode *mode)
 {
+	struct nouveau_drm *drm = nouveau_drm(encoder->dev);
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
 	struct nouveau_connector *nv_connector;
@@ -527,6 +632,8 @@ nv50_audio_enable(struct drm_encoder *encoder, struct drm_display_mode *mode)
 
 	nvif_mthd(&disp->disp->object, 0, &args,
 		  sizeof(args.base) + drm_eld_size(args.data));
+
+	nv50_audio_component_eld_notify(drm->audio.component, nv_crtc->index);
 }
 
 /******************************************************************************
@@ -2302,6 +2409,8 @@ nv50_display_destroy(struct drm_device *dev)
 {
 	struct nv50_disp *disp = nv50_disp(dev);
 
+	nv50_audio_component_fini(nouveau_drm(dev));
+
 	nv50_core_del(&disp->core);
 
 	nouveau_bo_unmap(disp->sync);
@@ -2423,6 +2532,8 @@ nv50_display_create(struct drm_device *dev)
 	/* Disable vblank irqs aggressively for power-saving, safe on nv50+ */
 	dev->vblank_disable_immediate = true;
 
+	nv50_audio_component_init(drm);
+
 out:
 	if (ret)
 		nv50_display_destroy(dev);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index da8c46e09943..c2c332fbde97 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -58,6 +58,8 @@
 #include <drm/ttm/ttm_module.h>
 #include <drm/ttm/ttm_page_alloc.h>
 
+#include <drm/drm_audio_component.h>
+
 #include "uapi/drm/nouveau_drm.h"
 
 struct nouveau_channel;
@@ -211,6 +213,11 @@ struct nouveau_drm {
 	struct nouveau_svm *svm;
 
 	struct nouveau_dmem *dmem;
+
+	struct {
+		struct drm_audio_component *component;
+		bool component_registered;
+	} audio;
 };
 
 static inline struct nouveau_drm *
-- 
2.16.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
