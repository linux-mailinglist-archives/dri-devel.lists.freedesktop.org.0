Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB312B2995
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 01:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458D66E88E;
	Sat, 14 Nov 2020 00:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552C56E88E
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 00:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605312890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zX/lOizOAw84oOm8YVDOgdLRrRhztNZDoBEcaMzLu30=;
 b=X0667OPnqoRfE93O2LelK7yR5jFhNCi1f/z8Um9Ja39nGLJJzC3KrJ5LiXZdIlfQd+uF+K
 7IRI2pOeojd0qLkulsV0nlvaymwH1K5Y7NYMsTti+ODLEHm1zyMCiTqE+BCXdgqReO947q
 ns2CKG27X1NG7uhbShrTQfJW3uOglx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-_hMgUGPlN06ApkJ90zbi6g-1; Fri, 13 Nov 2020 19:14:46 -0500
X-MC-Unique: _hMgUGPlN06ApkJ90zbi6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 151B91868401;
 Sat, 14 Nov 2020 00:14:45 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-115-66.rdu2.redhat.com [10.10.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E74EE60C15;
 Sat, 14 Nov 2020 00:14:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/nouveau/kms/nv50-: Rename
 encoder->atomic_(enable|disable) callbacks
Date: Fri, 13 Nov 2020 19:14:12 -0500
Message-Id: <20201114001417.155093-4-lyude@redhat.com>
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

No functional changes, just change the function names to match the
callbacks they provide.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 33 ++++++++++++-------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 073ac66b2922..a47be145827e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -455,7 +455,7 @@ nv50_outp_get_old_connector(struct nouveau_encoder *outp,
  * DAC
  *****************************************************************************/
 static void
-nv50_dac_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
+nv50_dac_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nv50_core *core = nv50_disp(encoder->dev)->core;
@@ -467,7 +467,7 @@ nv50_dac_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 }
 
 static void
-nv50_dac_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
+nv50_dac_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
@@ -525,8 +525,8 @@ nv50_dac_detect(struct drm_encoder *encoder, struct drm_connector *connector)
 static const struct drm_encoder_helper_funcs
 nv50_dac_help = {
 	.atomic_check = nv50_outp_atomic_check,
-	.atomic_enable = nv50_dac_enable,
-	.atomic_disable = nv50_dac_disable,
+	.atomic_enable = nv50_dac_atomic_enable,
+	.atomic_disable = nv50_dac_atomic_disable,
 	.detect = nv50_dac_detect
 };
 
@@ -1055,7 +1055,7 @@ nv50_dp_bpc_to_depth(unsigned int bpc)
 }
 
 static void
-nv50_msto_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
+nv50_msto_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nv50_head *head = nv50_head(encoder->crtc);
 	struct nv50_head_atom *armh = nv50_head_atom(head->base.base.state);
@@ -1101,7 +1101,7 @@ nv50_msto_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 }
 
 static void
-nv50_msto_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
+nv50_msto_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nv50_msto *msto = nv50_msto(encoder);
 	struct nv50_mstc *mstc = msto->mstc;
@@ -1118,8 +1118,8 @@ nv50_msto_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 
 static const struct drm_encoder_helper_funcs
 nv50_msto_help = {
-	.atomic_disable = nv50_msto_disable,
-	.atomic_enable = nv50_msto_enable,
+	.atomic_disable = nv50_msto_atomic_disable,
+	.atomic_enable = nv50_msto_atomic_enable,
 	.atomic_check = nv50_msto_atomic_check,
 };
 
@@ -1613,8 +1613,7 @@ nv50_sor_update(struct nouveau_encoder *nv_encoder, u8 head,
 }
 
 static void
-nv50_sor_disable(struct drm_encoder *encoder,
-		 struct drm_atomic_state *state)
+nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
@@ -1642,7 +1641,7 @@ nv50_sor_disable(struct drm_encoder *encoder,
 }
 
 static void
-nv50_sor_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
+nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
@@ -1747,8 +1746,8 @@ nv50_sor_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 static const struct drm_encoder_helper_funcs
 nv50_sor_help = {
 	.atomic_check = nv50_outp_atomic_check,
-	.atomic_enable = nv50_sor_enable,
-	.atomic_disable = nv50_sor_disable,
+	.atomic_enable = nv50_sor_atomic_enable,
+	.atomic_disable = nv50_sor_atomic_disable,
 };
 
 static void
@@ -1869,7 +1868,7 @@ nv50_pior_atomic_check(struct drm_encoder *encoder,
 }
 
 static void
-nv50_pior_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
+nv50_pior_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nv50_core *core = nv50_disp(encoder->dev)->core;
@@ -1881,7 +1880,7 @@ nv50_pior_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 }
 
 static void
-nv50_pior_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
+nv50_pior_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
@@ -1923,8 +1922,8 @@ nv50_pior_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 static const struct drm_encoder_helper_funcs
 nv50_pior_help = {
 	.atomic_check = nv50_pior_atomic_check,
-	.atomic_enable = nv50_pior_enable,
-	.atomic_disable = nv50_pior_disable,
+	.atomic_enable = nv50_pior_atomic_enable,
+	.atomic_disable = nv50_pior_atomic_disable,
 };
 
 static void
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
