Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53877A6E12
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF63610E3E4;
	Tue, 19 Sep 2023 22:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C586010E2B0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zuJ3jnKNTFUAJqytceJuqkiGcaTyti9vonsNzPzidqM=;
 b=DqTbxXNFA5erVaqQkp+4227PIETtAB6O1l6uc7+/j3OOPsBh75/0UJabSa+GNSj6XS0SYn
 upevw28gN97K/3PfUa76azyDjqayS135SSLMQakpPFOsrxhAZ2TmbRPkf5JRRA8XWyMKJi
 JFHRBqjctEDWuPq+aE1WJ/9xgXwXfCQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-0MlIU321OcO1eNZrIXNOXA-1; Tue, 19 Sep 2023 18:05:57 -0400
X-MC-Unique: 0MlIU321OcO1eNZrIXNOXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1531C185A78E;
 Tue, 19 Sep 2023 22:05:57 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EDF740C2064;
 Tue, 19 Sep 2023 22:05:56 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 18/44] drm/nouveau/kms/nv50-: move audio enable post-modeset
Date: Tue, 19 Sep 2023 17:56:13 -0400
Message-ID: <20230919220442.202488-19-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <me@dakr.org>,
 open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

- adds tracking for post-UPDATE modeset operations, similar to mst[mo]'s
- audio won't work on RM without this
- we should probably have been doing this anyway

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 35 ++++++++++++++++++++++---
 drivers/gpu/drm/nouveau/dispnv50/disp.h |  3 +++
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 8fa3bb8c2f41e..99aa8d208711c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -707,6 +707,18 @@ nv50_audio_supported(struct drm_encoder *encoder)
 	    disp->disp->object.oclass == GT206_DISP)
 		return false;
 
+	if (encoder->encoder_type != DRM_MODE_ENCODER_DPMST) {
+		struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+
+		switch (nv_encoder->dcb->type) {
+		case DCB_OUTPUT_TMDS:
+		case DCB_OUTPUT_DP:
+			break;
+		default:
+			return false;
+		}
+	}
+
 	return true;
 }
 
@@ -829,8 +841,6 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 		size = 0;
 
 	nvif_outp_infoframe(&nv_encoder->outp, NVIF_OUTP_INFOFRAME_V0_VSI, &args.infoframe, size);
-
-	nv50_audio_enable(encoder, nv_crtc, nv_connector, state, mode);
 }
 
 /******************************************************************************
@@ -1660,8 +1670,6 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 		else
 			proto = NV887D_SOR_SET_CONTROL_PROTOCOL_DP_B;
 
-		nv50_audio_enable(encoder, nv_crtc, nv_connector, state, mode);
-
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 		backlight = nv_connector->backlight;
 		if (backlight && backlight->uses_dpcd)
@@ -1939,7 +1947,9 @@ nv50_disp_atomic_commit_core(struct drm_atomic_state *state, u32 *interlock)
 	struct drm_dp_mst_topology_state *mst_state;
 	struct nouveau_drm *drm = nouveau_drm(state->dev);
 	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_atom *atom = nv50_atom(state);
 	struct nv50_core *core = disp->core;
+	struct nv50_outp_atom *outp;
 	struct nv50_mstm *mstm;
 	int i;
 
@@ -1962,6 +1972,21 @@ nv50_disp_atomic_commit_core(struct drm_atomic_state *state, u32 *interlock)
 		if (mstm->modified)
 			nv50_mstm_cleanup(state, mst_state, mstm);
 	}
+
+	list_for_each_entry(outp, &atom->outp, head) {
+		if (outp->encoder->encoder_type != DRM_MODE_ENCODER_DPMST) {
+			struct nouveau_encoder *nv_encoder = nouveau_encoder(outp->encoder);
+
+			if (outp->enabled) {
+				nv50_audio_enable(outp->encoder, nouveau_crtc(nv_encoder->crtc),
+						  nv_encoder->conn, NULL, NULL);
+				outp->enabled = outp->disabled = false;
+			} else {
+				if (outp->disabled)
+					outp->disabled = false;
+			}
+		}
+	}
 }
 
 static void
@@ -2053,6 +2078,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 
 		if (outp->clr.mask) {
 			help->atomic_disable(encoder, state);
+			outp->disabled = true;
 			interlock[NV50_DISP_INTERLOCK_CORE] |= 1;
 			if (outp->flush_disable) {
 				nv50_disp_atomic_commit_wndw(state, interlock);
@@ -2092,6 +2118,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 
 		if (outp->set.mask) {
 			help->atomic_enable(encoder, state);
+			outp->enabled = true;
 			interlock[NV50_DISP_INTERLOCK_CORE] = 1;
 		}
 	}
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 9d66c9c726c35..42209f5b06f91 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -85,6 +85,9 @@ struct nv50_outp_atom {
 	struct drm_encoder *encoder;
 	bool flush_disable;
 
+	bool disabled;
+	bool enabled;
+
 	union nv50_outp_atom_mask {
 		struct {
 			bool ctrl:1;
-- 
2.41.0

