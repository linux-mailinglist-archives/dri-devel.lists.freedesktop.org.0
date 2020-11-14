Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 539722B29B3
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 01:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCB56E89F;
	Sat, 14 Nov 2020 00:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FC16E89C
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 00:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605312924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E8INF7tl1yx3+XNrmxSW5k6SwiXsOp9xi7w01VFV0XE=;
 b=J308W2JpOUaTV5wW7xDet2wY2PmNL+nFilQzYi+jNlLUMe5eTVDl6mDQglHV6XSHVeFhlc
 IC4f/gOzS++ta4vDOxJ8kfW+bgFoUxlx1b1wcU9bgJp4aST0xw9NBgJ2mOHTz3WBJcAA1S
 OgGayZoRxuIaLF4r9t8Ikx5zLqqKkpw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-XEEWzhIQNzKHxGUseF6ibw-1; Fri, 13 Nov 2020 19:15:22 -0500
X-MC-Unique: XEEWzhIQNzKHxGUseF6ibw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C57D71006701;
 Sat, 14 Nov 2020 00:15:20 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-115-66.rdu2.redhat.com [10.10.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F15760C15;
 Sat, 14 Nov 2020 00:14:59 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/nouveau/kms/nv50-: Fix locking for audio callbacks
Date: Fri, 13 Nov 2020 19:14:17 -0500
Message-Id: <20201114001417.155093-9-lyude@redhat.com>
In-Reply-To: <20201114001417.155093-1-lyude@redhat.com>
References: <20201114001417.155093-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 James Jones <jajones@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Noticed that I wasn't paying close enough attention the last time I looked
at our audio callbacks, as I completely missed the fact that we were
figuring out which audio-enabled connector goes to each encoder by checking
it's state, but without grabbing any of the appropriate modesetting locks
to do so.

That being said however: trying to grab modesetting locks in our audio
callbacks would be very painful due to the potential for locking inversion
between HDA and DRM. So, let's instead just copy what i915 does again - add
our own audio lock to protect audio related state, and store each audio
enabled connector in each nouveau_encoder struct so that we don't need to
check any atomic states.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c   | 66 ++++++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_drv.h     |  1 +
 drivers/gpu/drm/nouveau/nouveau_encoder.h |  7 ++-
 3 files changed, 43 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index b19d0d7a6de9..65a991846e96 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -607,34 +607,27 @@ nv50_audio_component_get_eld(struct device *kdev, int port, int dev_id,
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	struct drm_encoder *encoder;
 	struct nouveau_encoder *nv_encoder;
-	struct drm_connector *connector;
 	struct nouveau_crtc *nv_crtc;
-	struct drm_connector_list_iter conn_iter;
 	int ret = 0;
 
 	*enabled = false;
 
+	mutex_lock(&drm->audio.lock);
+
 	drm_for_each_encoder(encoder, drm->dev) {
 		struct nouveau_connector *nv_connector = NULL;
 
+		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST)
+			continue; /* TODO */
+
 		nv_encoder = nouveau_encoder(encoder);
+		nv_connector = nouveau_connector(nv_encoder->audio.connector);
+		nv_crtc = nouveau_crtc(nv_encoder->crtc);
 
-		drm_connector_list_iter_begin(drm_dev, &conn_iter);
-		drm_for_each_connector_iter(connector, &conn_iter) {
-			if (connector->state->best_encoder == encoder) {
-				nv_connector = nouveau_connector(connector);
-				break;
-			}
-		}
-		drm_connector_list_iter_end(&conn_iter);
-		if (!nv_connector)
+		if (!nv_crtc || nv_encoder->or != port || nv_crtc->index != dev_id)
 			continue;
 
-		nv_crtc = nouveau_crtc(nv_encoder->crtc);
-		if (!nv_crtc || nv_encoder->or != port ||
-		    nv_crtc->index != dev_id)
-			continue;
-		*enabled = nv_encoder->audio;
+		*enabled = nv_encoder->audio.enabled;
 		if (*enabled) {
 			ret = drm_eld_size(nv_connector->base.eld);
 			memcpy(buf, nv_connector->base.eld,
@@ -643,6 +636,8 @@ nv50_audio_component_get_eld(struct device *kdev, int port, int dev_id,
 		break;
 	}
 
+	mutex_unlock(&drm->audio.lock);
+
 	return ret;
 }
 
@@ -692,17 +687,22 @@ static const struct component_ops nv50_audio_component_bind_ops = {
 static void
 nv50_audio_component_init(struct nouveau_drm *drm)
 {
-	if (!component_add(drm->dev->dev, &nv50_audio_component_bind_ops))
-		drm->audio.component_registered = true;
+	if (component_add(drm->dev->dev, &nv50_audio_component_bind_ops))
+		return;
+
+	drm->audio.component_registered = true;
+	mutex_init(&drm->audio.lock);
 }
 
 static void
 nv50_audio_component_fini(struct nouveau_drm *drm)
 {
-	if (drm->audio.component_registered) {
-		component_del(drm->dev->dev, &nv50_audio_component_bind_ops);
-		drm->audio.component_registered = false;
-	}
+	if (!drm->audio.component_registered)
+		return;
+
+	component_del(drm->dev->dev, &nv50_audio_component_bind_ops);
+	drm->audio.component_registered = false;
+	mutex_destroy(&drm->audio.lock);
 }
 
 /******************************************************************************
@@ -725,11 +725,13 @@ nv50_audio_disable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc)
 				(0x0100 << nv_crtc->index),
 	};
 
-	if (!nv_encoder->audio)
-		return;
-
-	nv_encoder->audio = false;
-	nvif_mthd(&disp->disp->object, 0, &args, sizeof(args));
+	mutex_lock(&drm->audio.lock);
+	if (nv_encoder->audio.enabled) {
+		nv_encoder->audio.enabled = false;
+		nv_encoder->audio.connector = NULL;
+		nvif_mthd(&disp->disp->object, 0, &args, sizeof(args));
+	}
+	mutex_unlock(&drm->audio.lock);
 
 	nv50_audio_component_eld_notify(drm->audio.component, nv_encoder->or,
 					nv_crtc->index);
@@ -760,11 +762,16 @@ nv50_audio_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 	if (!drm_detect_monitor_audio(nv_connector->edid))
 		return;
 
+	mutex_lock(&drm->audio.lock);
+
 	memcpy(args.data, nv_connector->base.eld, sizeof(args.data));
 
 	nvif_mthd(&disp->disp->object, 0, &args,
 		  sizeof(args.base) + drm_eld_size(args.data));
-	nv_encoder->audio = true;
+	nv_encoder->audio.enabled = true;
+	nv_encoder->audio.connector = &nv_connector->base;
+
+	mutex_unlock(&drm->audio.lock);
 
 	nv50_audio_component_eld_notify(drm->audio.component, nv_encoder->or,
 					nv_crtc->index);
@@ -1633,8 +1640,6 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 	struct drm_dp_aux *aux = &nv_connector->aux;
 	u8 pwr;
 
-	nv_encoder->crtc = NULL;
-
 	if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
 		int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
 
@@ -1649,6 +1654,7 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 	nv50_audio_disable(encoder, nv_crtc);
 	nv50_hdmi_disable(&nv_encoder->base.base, nv_crtc);
 	nv50_outp_release(nv_encoder);
+	nv_encoder->crtc = NULL;
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 9d04d1b36434..d91bf9c78976 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -222,6 +222,7 @@ struct nouveau_drm {
 
 	struct {
 		struct drm_audio_component *component;
+		struct mutex lock;
 		bool component_registered;
 	} audio;
 };
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 0dea219a666e..1ffcc0a491fd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -53,7 +53,12 @@ struct nouveau_encoder {
 	 * actually programmed on the hw, not the proposed crtc */
 	struct drm_crtc *crtc;
 	u32 ctrl;
-	bool audio;
+
+	/* Protected by nouveau_drm.audio.lock */
+	struct {
+		bool enabled;
+		struct drm_connector *connector;
+	} audio;
 
 	struct drm_display_mode mode;
 	int last_dpms;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
