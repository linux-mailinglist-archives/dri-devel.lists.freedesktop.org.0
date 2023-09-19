Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038827A6E33
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A32710E3FA;
	Tue, 19 Sep 2023 22:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A29810E3F8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W3hZXI4bTcCi9P3/TwP/xL5zpSBC7q9ifuobu0Q9DeY=;
 b=h3yMTfFqJeS7HZglYLHtnnyszFX46uOBUC1HouCA49zkWKGyZqLGNkl7Lq2DIQatTtM9aG
 k+/8twMHxIm+ZnNRjtM038ooS2/uDI2Ht9/RwRk2vuAUbGaCBwYfEtndR0MrONQKJt8rw+
 nOuN7kS02TPhs1KCEAvhSljvSNXUlp0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-NHMr1TUVMey0i3dHFGyDsw-1; Tue, 19 Sep 2023 18:07:03 -0400
X-MC-Unique: NHMr1TUVMey0i3dHFGyDsw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 617963C02532;
 Tue, 19 Sep 2023 22:07:03 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E698C40C2064;
 Tue, 19 Sep 2023 22:07:02 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 31/44] drm/nouveau/kms/nv50-: fixup sink D3 before tearing
 down link
Date: Tue, 19 Sep 2023 17:56:26 -0400
Message-ID: <20230919220442.202488-32-lyude@redhat.com>
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

- fixes bug preventing this on SST
- implement for MST

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c   | 13 +++----------
 drivers/gpu/drm/nouveau/nouveau_dp.c      | 15 +++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_encoder.h |  1 +
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 1fcd1b36a2751..1ea4b113058cd 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1300,6 +1300,7 @@ nv50_mstm_cleanup(struct drm_atomic_state *state,
 	}
 
 	if (mstm->disabled) {
+		nouveau_dp_power_down(mstm->outp);
 		nvif_outp_release(&mstm->outp->outp);
 		mstm->disabled = false;
 	}
@@ -1551,7 +1552,6 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 #endif
 	struct drm_dp_aux *aux = &nv_connector->aux;
 	int ret;
-	u8 pwr;
 
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	if (backlight && backlight->uses_dpcd) {
@@ -1568,15 +1568,8 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 		nv_encoder->hdmi.enabled = false;
 	}
 
-	if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
-		ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
-
-		if (ret == 0) {
-			pwr &= ~DP_SET_POWER_MASK;
-			pwr |=  DP_SET_POWER_D3;
-			drm_dp_dpcd_writeb(aux, DP_SET_POWER, pwr);
-		}
-	}
+	if (nv_encoder->dcb->type == DCB_OUTPUT_DP)
+		nouveau_dp_power_down(nv_encoder);
 
 	nv_encoder->update(nv_encoder, nv_crtc->index, NULL, 0, 0);
 	nv50_audio_disable(encoder, nv_crtc);
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index f26769bca1950..1c0b992fe2416 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -284,6 +284,21 @@ nouveau_dp_detect(struct nouveau_connector *nv_connector,
 	return ret;
 }
 
+void
+nouveau_dp_power_down(struct nouveau_encoder *outp)
+{
+	struct drm_dp_aux *aux = &outp->conn->aux;
+	int ret;
+	u8 pwr;
+
+	ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
+	if (ret == 1) {
+		pwr &= ~DP_SET_POWER_MASK;
+		pwr |=  DP_SET_POWER_D3;
+		drm_dp_dpcd_writeb(aux, DP_SET_POWER, pwr);
+	}
+}
+
 bool
 nouveau_dp_link_check(struct nouveau_connector *nv_connector)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 123d0ecf5f586..ed31db58176c3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -155,6 +155,7 @@ enum nouveau_dp_status {
 };
 
 int nouveau_dp_detect(struct nouveau_connector *, struct nouveau_encoder *);
+void nouveau_dp_power_down(struct nouveau_encoder *);
 bool nouveau_dp_link_check(struct nouveau_connector *);
 void nouveau_dp_irq(struct work_struct *);
 enum drm_mode_status nv50_dp_mode_valid(struct nouveau_encoder *,
-- 
2.41.0

