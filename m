Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B315A25210D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 21:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224A36E595;
	Tue, 25 Aug 2020 19:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6B289FE8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 19:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598385052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qfLxCMnsO7JIC/eaKaw8p9wTENERe+wpNdDpM58At2g=;
 b=TreslPxvqNzpXhXOT9QUZ7rmaJf9eIFPKBWlknIa6eT0h/FpGA2pDKlgedMgmkHdC1Khxp
 jXqO8gEQmWIYNFL+VCUXNleL6TDvpnULZ1wKjxPOhFIl6esqnqEZsmZj+ZIlid8znP6xus
 O+AKtbH9UAIAnjD7JH3ttLY42XbgumU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-uFUVSosFNqashnZ4lCz8gg-1; Tue, 25 Aug 2020 15:50:48 -0400
X-MC-Unique: uFUVSosFNqashnZ4lCz8gg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EC5F81F024;
 Tue, 25 Aug 2020 19:50:46 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-227.rdu2.redhat.com
 [10.10.120.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DC005D9D3;
 Tue, 25 Aug 2020 19:50:45 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [RFC v4 02/20] drm/nouveau/kms/nv50-: Remove open-coded
 drm_dp_read_desc()
Date: Tue, 25 Aug 2020 15:50:09 -0400
Message-Id: <20200825195027.74681-3-lyude@redhat.com>
In-Reply-To: <20200825195027.74681-1-lyude@redhat.com>
References: <20200825195027.74681-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Noticed this while going through our DP code - we use an open-coded
version of drm_dp_read_desc() instead of just using the helper, so
change that. This will also let us use quirks in the future if we end up
needing them.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 30 +++++++--------------
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  4 ++-
 3 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 7674025a4bfe8..e12957e6faa7c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -435,7 +435,8 @@ nouveau_connector_ddc_detect(struct drm_connector *connector)
 
 		switch (nv_encoder->dcb->type) {
 		case DCB_OUTPUT_DP:
-			ret = nouveau_dp_detect(nv_encoder);
+			ret = nouveau_dp_detect(nouveau_connector(connector),
+						nv_encoder);
 			if (ret == NOUVEAU_DP_MST)
 				return NULL;
 			else if (ret == NOUVEAU_DP_SST)
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index ee778ddc95fae..c4e9c21d4dd2b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -36,27 +36,9 @@ MODULE_PARM_DESC(mst, "Enable DisplayPort multi-stream (default: enabled)");
 static int nouveau_mst = 1;
 module_param_named(mst, nouveau_mst, int, 0400);
 
-static void
-nouveau_dp_probe_oui(struct drm_device *dev, struct nvkm_i2c_aux *aux, u8 *dpcd)
-{
-	struct nouveau_drm *drm = nouveau_drm(dev);
-	u8 buf[3];
-
-	if (!(dpcd[DP_DOWN_STREAM_PORT_COUNT] & DP_OUI_SUPPORT))
-		return;
-
-	if (!nvkm_rdaux(aux, DP_SINK_OUI, buf, 3))
-		NV_DEBUG(drm, "Sink OUI: %02hx%02hx%02hx\n",
-			     buf[0], buf[1], buf[2]);
-
-	if (!nvkm_rdaux(aux, DP_BRANCH_OUI, buf, 3))
-		NV_DEBUG(drm, "Branch OUI: %02hx%02hx%02hx\n",
-			     buf[0], buf[1], buf[2]);
-
-}
-
 int
-nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
+nouveau_dp_detect(struct nouveau_connector *nv_connector,
+		  struct nouveau_encoder *nv_encoder)
 {
 	struct drm_device *dev = nv_encoder->base.base.dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
@@ -89,7 +71,13 @@ nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
 	NV_DEBUG(drm, "maximum: %dx%d\n",
 		 nv_encoder->dp.link_nr, nv_encoder->dp.link_bw);
 
-	nouveau_dp_probe_oui(dev, aux, dpcd);
+	ret = drm_dp_read_desc(&nv_connector->aux, &nv_encoder->dp.desc,
+			       drm_dp_is_branch(dpcd));
+	if (ret) {
+		NV_ERROR(drm, "Failed to read DP descriptor on %s: %d\n",
+			 nv_connector->base.name, ret);
+		return ret;
+	}
 
 	ret = nv50_mstm_detect(nv_encoder->dp.mstm, dpcd, nouveau_mst);
 	if (ret == 1)
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index a72c412ac8b14..6424cdcb4913f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -33,6 +33,7 @@
 #include <drm/drm_dp_mst_helper.h>
 #include "dispnv04/disp.h"
 struct nv50_head_atom;
+struct nouveau_connector;
 
 #define NV_DPMS_CLEARED 0x80
 
@@ -64,6 +65,7 @@ struct nouveau_encoder {
 			struct nv50_mstm *mstm;
 			int link_nr;
 			int link_bw;
+			struct drm_dp_desc desc;
 		} dp;
 	};
 
@@ -104,7 +106,7 @@ enum nouveau_dp_status {
 	NOUVEAU_DP_MST,
 };
 
-int nouveau_dp_detect(struct nouveau_encoder *);
+int nouveau_dp_detect(struct nouveau_connector *, struct nouveau_encoder *);
 enum drm_mode_status nv50_dp_mode_valid(struct drm_connector *,
 					struct nouveau_encoder *,
 					const struct drm_display_mode *,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
