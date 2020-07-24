Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AF322CBA2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 19:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D550D6E9CE;
	Fri, 24 Jul 2020 17:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90BB6E9B3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 17:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595610315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/rwBFqLdSk19RszDmYOuDL+4udbAMSNAztedf8ABTs=;
 b=AJwmvG5IhFOYmAv2oTYqeeQKcLzrVFxLf5b7akVgIS6z8w6pJMdp2Ijw2lv167/2dNzt6g
 g7scb8vRxNdm/VaI5W5+a4dUZCbyelcd/Sx6DTe+WuP+IToq2UOAu2b3/GfYsr+OEB7rmA
 Zq70Uz8ogVKAluFPzz8q76vUKVrqcrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-hZsInRsONSO0sEv-UjfjDg-1; Fri, 24 Jul 2020 13:05:11 -0400
X-MC-Unique: hZsInRsONSO0sEv-UjfjDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21EBE106B244;
 Fri, 24 Jul 2020 17:05:10 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-119-175.rdu2.redhat.com
 [10.10.119.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 035EB5C1BD;
 Fri, 24 Jul 2020 17:05:08 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/nouveau/kms/nv50-: Check MST display modes against
 available PBN
Date: Fri, 24 Jul 2020 13:04:57 -0400
Message-Id: <20200724170457.711072-3-lyude@redhat.com>
In-Reply-To: <20200724170457.711072-1-lyude@redhat.com>
References: <20200724170457.711072-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 James Jones <jajones@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While we already check whether a given atomic state can fit in the
available bandwidth for an MST topology, we don't currently bother to
prune display modes on MST connectors if said modes are impossible to
fit on the MST link irregardless of the current display state.

So, let's avoid reporting impossible-to-set modes to userspace by
validating the minimum bandwidth requirements of each display mode
against the maximum bandwidth supported by the MST connector.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 41 +++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_connector.c | 24 ++++++++++--
 drivers/gpu/drm/nouveau/nouveau_connector.h |  4 +-
 3 files changed, 53 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 4c2894d8e15b..7b8531edafa5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1056,24 +1056,38 @@ nv50_mstc_atomic_best_encoder(struct drm_connector *connector,
 	return &nv50_head(crtc)->msto->encoder;
 }
 
-static enum drm_mode_status
-nv50_mstc_mode_valid(struct drm_connector *connector,
-		     struct drm_display_mode *mode)
+static int
+nv50_mstc_mode_valid_ctx(struct drm_connector *connector,
+			 struct drm_display_mode *mode,
+			 struct drm_modeset_acquire_ctx *ctx,
+			 enum drm_mode_status *status)
 {
 	struct nv50_mstc *mstc = nv50_mstc(connector);
 	struct nouveau_encoder *outp = mstc->mstm->outp;
+	unsigned int clock;
+	int ret;
 
-	/* TODO: calculate the PBN from the dotclock and validate against the
-	 * MSTB's max possible PBN
-	 */
+	*status = nv50_dp_mode_valid(connector, outp, mode, &clock);
+	if (*status != MODE_OK)
+		return 0;
 
-	return nv50_dp_mode_valid(connector, outp, mode, NULL);
+	ret = drm_modeset_lock(&mstc->mstm->mgr.base.lock, ctx);
+	if (ret)
+		return ret;
+
+	if (drm_dp_calc_pbn_mode(clock, connector->display_info.bpc,
+				 false) > mstc->port->full_pbn)
+		*status = MODE_CLOCK_HIGH;
+
+	return 0;
 }
 
 static int
-nv50_mstc_get_modes(struct drm_connector *connector)
+nv50_mstc_get_modes_ctx(struct drm_connector *connector,
+			struct drm_modeset_acquire_ctx *ctx)
 {
 	struct nv50_mstc *mstc = nv50_mstc(connector);
+	struct drm_display_mode *mode;
 	int ret = 0;
 
 	mstc->edid = drm_dp_mst_get_edid(&mstc->connector, mstc->port->mgr, mstc->port);
@@ -1093,9 +1107,14 @@ nv50_mstc_get_modes(struct drm_connector *connector)
 	else
 		connector->display_info.bpc = 8;
 
+	mode = nouveau_conn_native_mode(&mstc->connector, ctx);
+	if (IS_ERR(mode))
+		return PTR_ERR(mode);
+
 	if (mstc->native)
 		drm_mode_destroy(mstc->connector.dev, mstc->native);
-	mstc->native = nouveau_conn_native_mode(&mstc->connector);
+	mstc->native = mode;
+
 	return ret;
 }
 
@@ -1156,8 +1175,8 @@ nv50_mstc_detect(struct drm_connector *connector,
 
 static const struct drm_connector_helper_funcs
 nv50_mstc_help = {
-	.get_modes = nv50_mstc_get_modes,
-	.mode_valid = nv50_mstc_mode_valid,
+	.get_modes_ctx = nv50_mstc_get_modes_ctx,
+	.mode_valid_ctx = nv50_mstc_mode_valid_ctx,
 	.atomic_best_encoder = nv50_mstc_atomic_best_encoder,
 	.atomic_check = nv50_mstc_atomic_check,
 	.detect_ctx = nv50_mstc_detect,
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index ab2c2b2cab10..9737c65e5627 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -51,7 +51,8 @@
 #include <nvif/event.h>
 
 struct drm_display_mode *
-nouveau_conn_native_mode(struct drm_connector *connector)
+nouveau_conn_native_mode(struct drm_connector *connector,
+			 struct drm_modeset_acquire_ctx *ctx)
 {
 	const struct drm_connector_helper_funcs *helper = connector->helper_private;
 	struct nouveau_drm *drm = nouveau_drm(connector->dev);
@@ -60,10 +61,24 @@ nouveau_conn_native_mode(struct drm_connector *connector)
 	int high_w = 0, high_h = 0, high_v = 0;
 
 	list_for_each_entry(mode, &connector->probed_modes, head) {
-		if (helper->mode_valid(connector, mode) != MODE_OK ||
-		    (mode->flags & DRM_MODE_FLAG_INTERLACE))
+		if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 			continue;
 
+		if (helper->mode_valid_ctx) {
+			enum drm_mode_status status;
+			int ret;
+
+			drm_WARN_ON(dev, !ctx);
+			ret = helper->mode_valid_ctx(connector, mode, ctx,
+						     &status);
+			if (ret < 0)
+				return ERR_PTR(ret);
+			if (status != MODE_OK)
+				continue;
+		} else if (helper->mode_valid(connector, mode) != MODE_OK) {
+			continue;
+		}
+
 		/* Use preferred mode if there is one.. */
 		if (mode->type & DRM_MODE_TYPE_PREFERRED) {
 			NV_DEBUG(drm, "native mode from preferred\n");
@@ -959,7 +974,8 @@ nouveau_connector_get_modes(struct drm_connector *connector)
 	 * the list of modes.
 	 */
 	if (!nv_connector->native_mode)
-		nv_connector->native_mode = nouveau_conn_native_mode(connector);
+		nv_connector->native_mode =
+			nouveau_conn_native_mode(connector, NULL);
 	if (ret == 0 && nv_connector->native_mode) {
 		struct drm_display_mode *mode;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index 9e062c7adec8..e85962d9ae66 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -194,7 +194,9 @@ int nouveau_conn_atomic_set_property(struct drm_connector *,
 int nouveau_conn_atomic_get_property(struct drm_connector *,
 				     const struct drm_connector_state *,
 				     struct drm_property *, u64 *);
-struct drm_display_mode *nouveau_conn_native_mode(struct drm_connector *);
+struct drm_display_mode *
+nouveau_conn_native_mode(struct drm_connector *connector,
+			 struct drm_modeset_acquire_ctx *ctx);
 enum drm_mode_status
 nouveau_conn_mode_clock_valid(const struct drm_display_mode *,
 			      const unsigned min_clock,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
