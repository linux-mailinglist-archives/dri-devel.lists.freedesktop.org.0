Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE01E2B2999
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 01:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BF76E890;
	Sat, 14 Nov 2020 00:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892276E88F
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 00:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605312893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=11hQwBPlsCZV5GGrdpBwlm+h5FT31oVkjYoyTNZHUAA=;
 b=hdZhQactd3DG/2xIvazNNEm+j/930NNeQSnbNgPRS7klvGFdY7WN5u3vUo5QyfFcXTSPyX
 sFJ1E6a0eOnKaDpCE1Wy3uir3hciiw0GIZIiUj0LrSXkIOKme9bVVzBiBLY4aZQLg8+sJm
 AB5x4XobPYp1t3dl9zJuzeKd5nz6fP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-D-7FNU-XM7KyrVVI0f6J_w-1; Fri, 13 Nov 2020 19:14:51 -0500
X-MC-Unique: D-7FNU-XM7KyrVVI0f6J_w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FEF785C705;
 Sat, 14 Nov 2020 00:14:50 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-115-66.rdu2.redhat.com [10.10.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5194060C15;
 Sat, 14 Nov 2020 00:14:49 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/nouveau/kms/nv50-: Reverse args for
 nv50_outp_get_(old|new)_connector()
Date: Fri, 13 Nov 2020 19:14:14 -0500
Message-Id: <20201114001417.155093-6-lyude@redhat.com>
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

Just to be more consistent with the order of args that DRM helpers like
drm_atomic_get_new_crtc_state() use.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c   | 15 ++++++---------
 drivers/gpu/drm/nouveau/nouveau_encoder.h |  6 ++----
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index cbcf3ef517dc..2c0749fac9dc 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -418,8 +418,7 @@ nv50_outp_atomic_check(struct drm_encoder *encoder,
 }
 
 struct nouveau_connector *
-nv50_outp_get_new_connector(struct nouveau_encoder *outp,
-			    struct drm_atomic_state *state)
+nv50_outp_get_new_connector(struct drm_atomic_state *state, struct nouveau_encoder *outp)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *connector_state;
@@ -435,8 +434,7 @@ nv50_outp_get_new_connector(struct nouveau_encoder *outp,
 }
 
 struct nouveau_connector *
-nv50_outp_get_old_connector(struct nouveau_encoder *outp,
-			    struct drm_atomic_state *state)
+nv50_outp_get_old_connector(struct drm_atomic_state *state, struct nouveau_encoder *outp)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *connector_state;
@@ -743,7 +741,7 @@ nv50_audio_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
 				     (0x0100 << nv_crtc->index),
 	};
 
-	nv_connector = nv50_outp_get_new_connector(nv_encoder, state);
+	nv_connector = nv50_outp_get_new_connector(state, nv_encoder);
 	if (!drm_detect_monitor_audio(nv_connector->edid))
 		return;
 
@@ -810,7 +808,7 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
 	int ret;
 	int size;
 
-	nv_connector = nv50_outp_get_new_connector(nv_encoder, state);
+	nv_connector = nv50_outp_get_new_connector(state, nv_encoder);
 	if (!drm_detect_hdmi_monitor(nv_connector->edid))
 		return;
 
@@ -1616,8 +1614,7 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
-	struct nouveau_connector *nv_connector =
-		nv50_outp_get_old_connector(nv_encoder, state);
+	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
 	struct drm_dp_aux *aux = &nv_connector->aux;
 	u8 pwr;
 
@@ -1664,7 +1661,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 	u8 proto = NV507D_SOR_SET_CONTROL_PROTOCOL_CUSTOM;
 	u8 depth = NV837D_SOR_SET_CONTROL_PIXEL_DEPTH_DEFAULT;
 
-	nv_connector = nv50_outp_get_new_connector(nv_encoder, state);
+	nv_connector = nv50_outp_get_new_connector(state, nv_encoder);
 	nv_encoder->crtc = encoder->crtc;
 
 	if ((disp->disp->object.oclass == GT214_DISP ||
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 21937f1c7dd9..0dea219a666e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -141,11 +141,9 @@ enum drm_mode_status nv50_dp_mode_valid(struct drm_connector *,
 					unsigned *clock);
 
 struct nouveau_connector *
-nv50_outp_get_new_connector(struct nouveau_encoder *outp,
-			    struct drm_atomic_state *state);
+nv50_outp_get_new_connector(struct drm_atomic_state *state, struct nouveau_encoder *outp);
 struct nouveau_connector *
-nv50_outp_get_old_connector(struct nouveau_encoder *outp,
-			    struct drm_atomic_state *state);
+nv50_outp_get_old_connector(struct drm_atomic_state *state, struct nouveau_encoder *outp);
 
 int nv50_mstm_detect(struct nouveau_encoder *encoder);
 void nv50_mstm_remove(struct nv50_mstm *mstm);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
