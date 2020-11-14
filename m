Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C762B299B
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 01:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024956E894;
	Sat, 14 Nov 2020 00:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DE66E88E
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 00:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605312890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGkzEocpJQgnn92LLjUv4TE+8BenGiBZDziya3hNDas=;
 b=FdFfFfVg+Ah7AXvAEmIdxQezdZRanspzGL4huQvnV2xUWf6vRRCYUUKKYmJ/HCa89wkxew
 8pLdFjJeWK198I27e/81g/7NwGVtKB42615vgY0afkdfS7IIzjtS6R4l8pxfmRBNzre123
 lmFwiqu8hzxp4fal5jwNyJRn/Mw2bAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-ttXDmmrMNrKf25wLPcCB6w-1; Fri, 13 Nov 2020 19:14:43 -0500
X-MC-Unique: ttXDmmrMNrKf25wLPcCB6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69E01107AD64;
 Sat, 14 Nov 2020 00:14:42 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-115-66.rdu2.redhat.com [10.10.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B3A760C15;
 Sat, 14 Nov 2020 00:14:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/nouveau/kms/nv50-: Remove (nv_encoder->crtc) checks
 in ->disable callbacks
Date: Fri, 13 Nov 2020 19:14:11 -0500
Message-Id: <20201114001417.155093-3-lyude@redhat.com>
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

Noticed these in both the disable (which we'll be getting rid of in a
moment) and the atomic disable callbacks: both callback types check whether
or not there's actually a CRTC assigned to the given encoder. However, as
->atomic_disable and ->disable will never be called without a CRTC assigned
to the given encoder there's no point in this check. So just remove it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 37 ++++++++++++-------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 36d6b6093d16..073ac66b2922 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -460,8 +460,8 @@ nv50_dac_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nv50_core *core = nv50_disp(encoder->dev)->core;
 	const u32 ctrl = NVDEF(NV507D, DAC_SET_CONTROL, OWNER, NONE);
-	if (nv_encoder->crtc)
-		core->func->dac->ctrl(core, nv_encoder->or, ctrl, NULL);
+
+	core->func->dac->ctrl(core, nv_encoder->or, ctrl, NULL);
 	nv_encoder->crtc = NULL;
 	nv50_outp_release(nv_encoder);
 }
@@ -1620,28 +1620,25 @@ nv50_sor_disable(struct drm_encoder *encoder,
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
 	struct nouveau_connector *nv_connector =
 		nv50_outp_get_old_connector(nv_encoder, state);
+	struct drm_dp_aux *aux = &nv_connector->aux;
+	u8 pwr;
 
 	nv_encoder->crtc = NULL;
 
-	if (nv_crtc) {
-		struct drm_dp_aux *aux = &nv_connector->aux;
-		u8 pwr;
+	if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
+		int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
 
-		if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
-			int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
-
-			if (ret == 0) {
-				pwr &= ~DP_SET_POWER_MASK;
-				pwr |=  DP_SET_POWER_D3;
-				drm_dp_dpcd_writeb(aux, DP_SET_POWER, pwr);
-			}
+		if (ret == 0) {
+			pwr &= ~DP_SET_POWER_MASK;
+			pwr |=  DP_SET_POWER_D3;
+			drm_dp_dpcd_writeb(aux, DP_SET_POWER, pwr);
 		}
-
-		nv_encoder->update(nv_encoder, nv_crtc->index, NULL, 0, 0);
-		nv50_audio_disable(encoder, nv_crtc);
-		nv50_hdmi_disable(&nv_encoder->base.base, nv_crtc);
-		nv50_outp_release(nv_encoder);
 	}
+
+	nv_encoder->update(nv_encoder, nv_crtc->index, NULL, 0, 0);
+	nv50_audio_disable(encoder, nv_crtc);
+	nv50_hdmi_disable(&nv_encoder->base.base, nv_crtc);
+	nv50_outp_release(nv_encoder);
 }
 
 static void
@@ -1877,8 +1874,8 @@ nv50_pior_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nv50_core *core = nv50_disp(encoder->dev)->core;
 	const u32 ctrl = NVDEF(NV507D, PIOR_SET_CONTROL, OWNER, NONE);
-	if (nv_encoder->crtc)
-		core->func->pior->ctrl(core, nv_encoder->or, ctrl, NULL);
+
+	core->func->pior->ctrl(core, nv_encoder->or, ctrl, NULL);
 	nv_encoder->crtc = NULL;
 	nv50_outp_release(nv_encoder);
 }
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
