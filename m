Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DFA376D67
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 01:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939F26EEA5;
	Fri,  7 May 2021 23:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7306EEAD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 23:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620430844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xpZNBVkzHWBgBpwD/437ZHXFplyvXE1pm0xa/Lj3R5Q=;
 b=HVGoHPMMxCrdv2y9PuPbJqyq7qy+Ye27QZJ8JgsxgEsjnlr7PmaTFNDJhb0G4VF1z+eJiU
 XyfDnGJt1deUk5cHGj3Kbyf6JGgiNtHWwJjbHCo2TFyyUedoxDEqzuCRG4fO3z/GkM2DF4
 lNpiFL2YOanONbFy5HC3CRhAbV8V2Iw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-Xu3iR-68M_G-dIN_2mDalQ-1; Fri, 07 May 2021 19:40:39 -0400
X-MC-Unique: Xu3iR-68M_G-dIN_2mDalQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05F9710060C3;
 Fri,  7 May 2021 23:40:38 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F8A110016F4;
 Fri,  7 May 2021 23:40:35 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [RFC v5 9/9] drm/nouveau/kms/nv50-: Add basic DPCD backlight support
 for nouveau
Date: Fri,  7 May 2021 19:39:47 -0400
Message-Id: <20210507233947.751846-10-lyude@redhat.com>
In-Reply-To: <20210507233947.751846-1-lyude@redhat.com>
References: <20210507233947.751846-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Rajeev Nandan <rajeevny@codeaurora.org>,
 Jani Nikula <jani.nikula@intel.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, greg.depoire@gmail.com,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 James Jones <jajones@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support for controlling panel backlights over eDP using VESA's
standard backlight control interface. Luckily, Nvidia was cool enough to
never come up with their own proprietary backlight control interface (at
least, not any that I or the laptop manufacturers I've talked to are aware
of), so this should work for any laptop panels which support the VESA
backlight control interface.

Note that we don't yet provide the panel backlight frequency to the DRM DP
backlight helpers. This should be fine for the time being, since it's not
required to get basic backlight controls working.

For reference: there's some mentions of PWM backlight values in
nouveau_reg.h, but I'm not sure these are the values we would want to use.
If we figure out how to get this information in the future, we'll have the
benefit of more granular backlight control.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: greg.depoire@gmail.com
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  28 ++++
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 166 ++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_connector.h |   9 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |   1 +
 4 files changed, 186 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index c46d0374b6e6..80ad2d6b7e4b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -31,6 +31,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/hdmi.h>
 #include <linux/component.h>
+#include <linux/iopoll.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -1648,15 +1649,30 @@ nv50_sor_update(struct nouveau_encoder *nv_encoder, u8 head,
 	core->func->sor->ctrl(core, nv_encoder->or, nv_encoder->ctrl, asyh);
 }
 
+/* TODO: Should we extend this to PWM-only backlights?
+ * As well, should we add a DRM helper for waiting for the backlight to acknowledge
+ * the panel backlight has been shut off? Intel doesn't seem to do this, and uses a
+ * fixed time delay from the vbios…
+ */
 static void
 nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
 	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
+	struct nouveau_backlight *backlight = nv_connector->backlight;
 	struct drm_dp_aux *aux = &nv_connector->aux;
+	int ret;
 	u8 pwr;
 
+	if (backlight && backlight->uses_dpcd) {
+		ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
+		if (ret < 0)
+			NV_ERROR(drm, "Failed to disable backlight on [CONNECTOR:%d:%s]: %d\n",
+				 nv_connector->base.base.id, nv_connector->base.name, ret);
+	}
+
 	if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
 		int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
 
@@ -1695,6 +1711,9 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 	struct drm_device *dev = encoder->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_connector *nv_connector;
+#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
+	struct nouveau_backlight *backlight;
+#endif
 	struct nvbios *bios = &drm->vbios;
 	bool hda = false;
 	u8 proto = NV507D_SOR_SET_CONTROL_PROTOCOL_CUSTOM;
@@ -1769,6 +1788,14 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 			proto = NV887D_SOR_SET_CONTROL_PROTOCOL_DP_B;
 
 		nv50_audio_enable(encoder, nv_crtc, nv_connector, state, mode);
+
+#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
+		backlight = nv_connector->backlight;
+		if (backlight && backlight->uses_dpcd)
+			drm_edp_backlight_enable(&nv_connector->aux, &backlight->edp_info,
+						 (u16)backlight->dev->props.brightness);
+#endif
+
 		break;
 	default:
 		BUG();
@@ -2294,6 +2321,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 	nv50_crc_atomic_start_reporting(state);
 	if (!flushed)
 		nv50_crc_atomic_release_notifier_contexts(state);
+
 	drm_atomic_helper_commit_hw_done(state);
 	drm_atomic_helper_cleanup_planes(dev, state);
 	drm_atomic_helper_commit_cleanup_done(state);
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 72f35a2babcb..1cbd71abc80a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -42,11 +42,6 @@
 static struct ida bl_ida;
 #define BL_NAME_SIZE 15 // 12 for name + 2 for digits + 1 for '\0'
 
-struct nouveau_backlight {
-	struct backlight_device *dev;
-	int id;
-};
-
 static bool
 nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
 			   struct nouveau_backlight *bl)
@@ -148,6 +143,98 @@ static const struct backlight_ops nv50_bl_ops = {
 	.update_status = nv50_set_intensity,
 };
 
+/*
+ * eDP brightness callbacks need to happen under lock, since we need to
+ * enable/disable the backlight ourselves for modesets
+ */
+static int
+nv50_edp_get_brightness(struct backlight_device *bd)
+{
+	struct drm_connector *connector = dev_get_drvdata(bd->dev.parent);
+	struct drm_device *dev = connector->dev;
+	struct drm_crtc *crtc;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret = 0;
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry:
+	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, &ctx);
+	if (ret == -EDEADLK)
+		goto deadlock;
+	else if (ret < 0)
+		goto out;
+
+	crtc = connector->state->crtc;
+	if (!crtc)
+		goto out;
+
+	ret = drm_modeset_lock(&crtc->mutex, &ctx);
+	if (ret == -EDEADLK)
+		goto deadlock;
+	else if (ret < 0)
+		goto out;
+
+	if (!crtc->state->active)
+		goto out;
+
+	ret = bd->props.brightness;
+out:
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+	return ret;
+deadlock:
+	drm_modeset_backoff(&ctx);
+	goto retry;
+}
+
+static int
+nv50_edp_set_brightness(struct backlight_device *bd)
+{
+	struct drm_connector *connector = dev_get_drvdata(bd->dev.parent);
+	struct nouveau_connector *nv_connector = nouveau_connector(connector);
+	struct drm_device *dev = connector->dev;
+	struct drm_crtc *crtc;
+	struct drm_dp_aux *aux = &nv_connector->aux;
+	struct nouveau_backlight *nv_bl = nv_connector->backlight;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret = 0;
+
+	drm_modeset_acquire_init(&ctx, 0);
+retry:
+	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, &ctx);
+	if (ret == -EDEADLK)
+		goto deadlock;
+	else if (ret < 0)
+		goto out;
+
+	crtc = connector->state->crtc;
+	if (!crtc)
+		goto out;
+
+	ret = drm_modeset_lock(&crtc->mutex, &ctx);
+	if (ret == -EDEADLK)
+		goto deadlock;
+	else if (ret < 0)
+		goto out;
+
+	if (crtc->state->active)
+		ret = drm_edp_backlight_set_level(aux, &nv_bl->edp_info, bd->props.brightness);
+
+out:
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+	return ret;
+deadlock:
+	drm_modeset_backoff(&ctx);
+	goto retry;
+}
+
+static const struct backlight_ops nv50_edp_bl_ops = {
+	.get_brightness = nv50_edp_get_brightness,
+	.update_status = nv50_edp_set_brightness,
+};
+
 static int
 nva3_get_intensity(struct backlight_device *bd)
 {
@@ -194,8 +281,13 @@ static const struct backlight_ops nva3_bl_ops = {
 	.update_status = nva3_set_intensity,
 };
 
+/* FIXME: perform backlight probing for eDP _before_ this, this only gets called after connector
+ * registration which happens after the initial modeset
+ */
 static int
-nv50_backlight_init(struct nouveau_encoder *nv_encoder,
+nv50_backlight_init(struct nouveau_backlight *bl,
+		    struct nouveau_connector *nv_conn,
+		    struct nouveau_encoder *nv_encoder,
 		    struct backlight_properties *props,
 		    const struct backlight_ops **ops)
 {
@@ -205,6 +297,41 @@ nv50_backlight_init(struct nouveau_encoder *nv_encoder,
 	if (!nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(ffs(nv_encoder->dcb->or) - 1)))
 		return -ENODEV;
 
+	if (nv_conn->type == DCB_CONNECTOR_eDP) {
+		int ret;
+		u16 current_level;
+		u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
+		u8 current_mode;
+
+		ret = drm_dp_dpcd_read(&nv_conn->aux, DP_EDP_DPCD_REV, edp_dpcd,
+				       EDP_DISPLAY_CTL_CAP_SIZE);
+		if (ret < 0)
+			return ret;
+
+		if (drm_edp_backlight_supported(edp_dpcd)) {
+			NV_DEBUG(drm, "DPCD backlight controls supported on %s\n",
+				 nv_conn->base.name);
+
+			ret = drm_edp_backlight_init(&nv_conn->aux, &bl->edp_info, 0, edp_dpcd,
+						     &current_level, &current_mode);
+			if (ret < 0)
+				return ret;
+
+			ret = drm_edp_backlight_enable(&nv_conn->aux, &bl->edp_info, current_level);
+			if (ret < 0) {
+				NV_ERROR(drm, "Failed to enable backlight on %s: %d\n",
+					 nv_conn->base.name, ret);
+				return ret;
+			}
+
+			*ops = &nv50_edp_bl_ops;
+			props->brightness = current_level;
+			props->max_brightness = bl->edp_info.max;
+			bl->uses_dpcd = true;
+			return 0;
+		}
+	}
+
 	if (drm->client.device.info.chipset <= 0xa0 ||
 	    drm->client.device.info.chipset == 0xaa ||
 	    drm->client.device.info.chipset == 0xac)
@@ -245,6 +372,10 @@ nouveau_backlight_init(struct drm_connector *connector)
 	if (!nv_encoder)
 		return 0;
 
+	bl = kzalloc(sizeof(*bl), GFP_KERNEL);
+	if (!bl)
+		return -ENOMEM;
+
 	switch (device->info.family) {
 	case NV_DEVICE_INFO_V0_CURIE:
 		ret = nv40_backlight_init(nv_encoder, &props, &ops);
@@ -257,20 +388,19 @@ nouveau_backlight_init(struct drm_connector *connector)
 	case NV_DEVICE_INFO_V0_VOLTA:
 	case NV_DEVICE_INFO_V0_TURING:
 	case NV_DEVICE_INFO_V0_AMPERE: //XXX: not confirmed
-		ret = nv50_backlight_init(nv_encoder, &props, &ops);
+		ret = nv50_backlight_init(bl, nouveau_connector(connector),
+					  nv_encoder, &props, &ops);
 		break;
 	default:
-		return 0;
+		ret = 0;
+		goto fail_alloc;
 	}
 
-	if (ret == -ENODEV)
-		return 0;
-	else if (ret)
-		return ret;
-
-	bl = kzalloc(sizeof(*bl), GFP_KERNEL);
-	if (!bl)
-		return -ENOMEM;
+	if (ret) {
+		if (ret == -ENODEV)
+			ret = 0;
+		goto fail_alloc;
+	}
 
 	if (!nouveau_get_backlight_name(backlight_name, bl)) {
 		NV_ERROR(drm, "Failed to retrieve a unique name for the backlight interface\n");
@@ -287,7 +417,9 @@ nouveau_backlight_init(struct drm_connector *connector)
 	}
 
 	nouveau_connector(connector)->backlight = bl;
-	bl->dev->props.brightness = bl->dev->ops->get_brightness(bl->dev);
+	if (!bl->dev->props.brightness)
+		bl->dev->props.brightness =
+			bl->dev->ops->get_brightness(bl->dev);
 	backlight_update_status(bl->dev);
 
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index d0b859c4a80e..40f90e353540 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -46,7 +46,14 @@ struct nvkm_i2c_port;
 struct dcb_output;
 
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
-struct nouveau_backlight;
+struct nouveau_backlight {
+	struct backlight_device *dev;
+
+	struct drm_edp_backlight_info edp_info;
+	bool uses_dpcd : 1;
+
+	int id;
+};
 #endif
 
 #define nouveau_conn_atom(p)                                                   \
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 1ffcc0a491fd..77c2fed76e8b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -30,6 +30,7 @@
 #include <subdev/bios/dcb.h>
 
 #include <drm/drm_encoder_slave.h>
+#include <drm/drm_dp_helper.h>
 #include <drm/drm_dp_mst_helper.h>
 #include "dispnv04/disp.h"
 struct nv50_head_atom;
-- 
2.30.2

