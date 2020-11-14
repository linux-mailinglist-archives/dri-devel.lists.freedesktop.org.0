Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E0C2B299C
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 01:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0E96E898;
	Sat, 14 Nov 2020 00:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6519E6E894
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 00:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605312898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4XGOGKrv5MBItvud46SaXVExHId/XnbVEiiuSNA/wpQ=;
 b=OErhXWxNN7TjqIoolz/fpStoIuYwGU75YE/rm634+bQYD5j4bOomYt7HDfw24PgwWYFj25
 j8IOkG/4bV9YXoNMOdtBee/qe+3d76ifaNmTtVKx2I2hfZRrk3tJBrbySevW9x8L7ONt7A
 ExGvblgbpWidClovi7B7RS42tSpYl90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-PstjRLT1Nhaeq6Lrbu-Dqg-1; Fri, 13 Nov 2020 19:14:56 -0500
X-MC-Unique: PstjRLT1Nhaeq6Lrbu-Dqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EAEA57240;
 Sat, 14 Nov 2020 00:14:55 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-115-66.rdu2.redhat.com [10.10.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F218760C15;
 Sat, 14 Nov 2020 00:14:51 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/nouveau/kms/nv50-: Lookup current encoder/crtc from
 atomic state
Date: Fri, 13 Nov 2020 19:14:15 -0500
Message-Id: <20201114001417.155093-7-lyude@redhat.com>
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

Despite being an atomic driver, nouveau has a lot of leftover code that
relies on retrieving information regarding the new atomic state from
members of drm_encoder and drm_crtc. The first field being used,
drm_encoder.crtc, is deprecated for atomic drivers. The second field being
used is drm_crtc.state, which is only really sensible to use outside of an
atomic modeset.

So, add some helpers to lookup the current crtc for a given outp from the
atomic state. Then, convert most of the code in dispnv50/disp.c to use said
new helper, along with the relevant DRM atomic helpers for retrieving the
new encoder/crtc combinations for a new atomic state.

Note that we don't get rid of the nouveau_encoder.crtc field entirely for
three reasons:

- Legacy modesetting for pre-nv50 still uses it
- It doesn't cause any locking issues
- We need it for the HDA callbacks, as grabbing atomic modesetting locks in
  those would be a mess.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 59 ++++++++++++++++---------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 2c0749fac9dc..63fff3988f19 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -449,6 +449,22 @@ nv50_outp_get_old_connector(struct drm_atomic_state *state, struct nouveau_encod
 	return NULL;
 }
 
+static struct nouveau_crtc *
+nv50_outp_get_new_crtc(const struct drm_atomic_state *state, const struct nouveau_encoder *outp)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+	const u32 mask = drm_encoder_mask(&outp->base.base);
+	int i;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		if (crtc_state->encoder_mask & mask)
+			return nouveau_crtc(crtc);
+	}
+
+	return NULL;
+}
+
 /******************************************************************************
  * DAC
  *****************************************************************************/
@@ -468,8 +484,9 @@ static void
 nv50_dac_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
-	struct nv50_head_atom *asyh = nv50_head_atom(nv_crtc->base.state);
+	struct nouveau_crtc *nv_crtc = nv50_outp_get_new_crtc(state, nv_encoder);
+	struct nv50_head_atom *asyh =
+		nv50_head_atom(drm_atomic_get_new_crtc_state(state, &nv_crtc->base));
 	struct nv50_core *core = nv50_disp(encoder->dev)->core;
 	u32 ctrl = 0;
 
@@ -490,7 +507,7 @@ nv50_dac_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 	core->func->dac->ctrl(core, nv_encoder->or, ctrl, asyh);
 	asyh->or.depth = 0;
 
-	nv_encoder->crtc = encoder->crtc;
+	nv_encoder->crtc = &nv_crtc->base;
 }
 
 static enum drm_connector_status
@@ -719,13 +736,12 @@ nv50_audio_disable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc)
 }
 
 static void
-nv50_audio_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
+nv50_audio_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
+		  struct nouveau_connector *nv_connector, struct drm_atomic_state *state,
 		  struct drm_display_mode *mode)
 {
 	struct nouveau_drm *drm = nouveau_drm(encoder->dev);
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
-	struct nouveau_connector *nv_connector;
 	struct nv50_disp *disp = nv50_disp(encoder->dev);
 	struct __packed {
 		struct {
@@ -741,7 +757,6 @@ nv50_audio_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
 				     (0x0100 << nv_crtc->index),
 	};
 
-	nv_connector = nv50_outp_get_new_connector(state, nv_encoder);
 	if (!drm_detect_monitor_audio(nv_connector->edid))
 		return;
 
@@ -778,12 +793,12 @@ nv50_hdmi_disable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc)
 }
 
 static void
-nv50_hdmi_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
+nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
+		 struct nouveau_connector *nv_connector, struct drm_atomic_state *state,
 		 struct drm_display_mode *mode)
 {
 	struct nouveau_drm *drm = nouveau_drm(encoder->dev);
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
 	struct nv50_disp *disp = nv50_disp(encoder->dev);
 	struct {
 		struct nv50_disp_mthd_v1 base;
@@ -798,7 +813,6 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
 		.pwr.state = 1,
 		.pwr.rekey = 56, /* binary driver, and tegra, constant */
 	};
-	struct nouveau_connector *nv_connector;
 	struct drm_hdmi_info *hdmi;
 	u32 max_ac_packet;
 	union hdmi_infoframe avi_frame;
@@ -808,7 +822,6 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
 	int ret;
 	int size;
 
-	nv_connector = nv50_outp_get_new_connector(state, nv_encoder);
 	if (!drm_detect_hdmi_monitor(nv_connector->edid))
 		return;
 
@@ -854,7 +867,7 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
 		+ args.pwr.vendor_infoframe_length;
 	nvif_mthd(&disp->disp->object, 0, &args, size);
 
-	nv50_audio_enable(encoder, state, mode);
+	nv50_audio_enable(encoder, nv_crtc, nv_connector, state, mode);
 
 	/* If SCDC is supported by the downstream monitor, update
 	 * divider / scrambling settings to what we programmed above.
@@ -895,6 +908,7 @@ struct nv50_mstc {
 struct nv50_msto {
 	struct drm_encoder encoder;
 
+	/* head is statically assigned on msto creation */
 	struct nv50_head *head;
 	struct nv50_mstc *mstc;
 	bool disabled;
@@ -1055,9 +1069,10 @@ nv50_dp_bpc_to_depth(unsigned int bpc)
 static void
 nv50_msto_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
-	struct nv50_head *head = nv50_head(encoder->crtc);
-	struct nv50_head_atom *asyh = nv50_head_atom(head->base.base.state);
 	struct nv50_msto *msto = nv50_msto(encoder);
+	struct nv50_head *head = msto->head;
+	struct nv50_head_atom *asyh =
+		nv50_head_atom(drm_atomic_get_new_crtc_state(state, &head->base.base));
 	struct nv50_mstc *mstc = NULL;
 	struct nv50_mstm *mstm = NULL;
 	struct drm_connector *connector;
@@ -1640,8 +1655,9 @@ static void
 nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
-	struct nv50_head_atom *asyh = nv50_head_atom(nv_crtc->base.state);
+	struct nouveau_crtc *nv_crtc = nv50_outp_get_new_crtc(state, nv_encoder);
+	struct nv50_head_atom *asyh =
+		nv50_head_atom(drm_atomic_get_new_crtc_state(state, &nv_crtc->base));
 	struct drm_display_mode *mode = &asyh->state.adjusted_mode;
 	struct {
 		struct nv50_disp_mthd_v1 base;
@@ -1662,7 +1678,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 	u8 depth = NV837D_SOR_SET_CONTROL_PIXEL_DEPTH_DEFAULT;
 
 	nv_connector = nv50_outp_get_new_connector(state, nv_encoder);
-	nv_encoder->crtc = encoder->crtc;
+	nv_encoder->crtc = &nv_crtc->base;
 
 	if ((disp->disp->object.oclass == GT214_DISP ||
 	     disp->disp->object.oclass >= GF110_DISP) &&
@@ -1688,7 +1704,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 			proto = NV507D_SOR_SET_CONTROL_PROTOCOL_SINGLE_TMDS_B;
 		}
 
-		nv50_hdmi_enable(&nv_encoder->base.base, state, mode);
+		nv50_hdmi_enable(&nv_encoder->base.base, nv_crtc, nv_connector, state, mode);
 		break;
 	case DCB_OUTPUT_LVDS:
 		proto = NV507D_SOR_SET_CONTROL_PROTOCOL_LVDS_CUSTOM;
@@ -1729,7 +1745,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 		else
 			proto = NV887D_SOR_SET_CONTROL_PROTOCOL_DP_B;
 
-		nv50_audio_enable(encoder, state, mode);
+		nv50_audio_enable(encoder, nv_crtc, nv_connector, state, mode);
 		break;
 	default:
 		BUG();
@@ -1879,8 +1895,9 @@ static void
 nv50_pior_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
-	struct nv50_head_atom *asyh = nv50_head_atom(nv_crtc->base.state);
+	struct nouveau_crtc *nv_crtc = nv50_outp_get_new_crtc(state, nv_encoder);
+	struct nv50_head_atom *asyh =
+		nv50_head_atom(drm_atomic_get_new_crtc_state(state, &nv_crtc->base));
 	struct nv50_core *core = nv50_disp(encoder->dev)->core;
 	u32 ctrl = 0;
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
