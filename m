Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD747A6E05
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3EE10E2B0;
	Tue, 19 Sep 2023 22:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D193A10E3C5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTYmWnS070r6wxVNb/nPHPb2WlkPnMLgZLbciDxNSCI=;
 b=GK9FAUYTJL5rE+XSVQK0QxYmIQ7R2/K+CI6ouLCMgvw/XSHOHa8S64lkvOJ5VqEvsAyI3i
 i1W5+HZECLgziC/7R/HyebxePLYzwuNCxccpdFTRjT4iNA6ZmGBpplBzBkQMz9+3PV46CI
 V81EflhzCrrshXy4LCYikudlWXOYiq4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-0H1XMuPyPwyinNJqEHcBhw-1; Tue, 19 Sep 2023 18:05:51 -0400
X-MC-Unique: 0H1XMuPyPwyinNJqEHcBhw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 658B2801779;
 Tue, 19 Sep 2023 22:05:51 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0481B40C2064;
 Tue, 19 Sep 2023 22:05:50 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 15/44] drm/nouveau/kms/nv50-: pull some common init out of
 OR-specific code
Date: Tue, 19 Sep 2023 17:56:10 -0400
Message-ID: <20230919220442.202488-16-lyude@redhat.com>
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

- cleanup before additional changes

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c   | 69 ++++++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_encoder.h |  2 +
 2 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 814d2be34d202..5c88d2e5321b1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -554,34 +554,27 @@ nv50_dac_func = {
 };
 
 static int
-nv50_dac_create(struct drm_connector *connector, struct dcb_output *dcbe)
+nv50_dac_create(struct nouveau_encoder *nv_encoder)
 {
+	struct drm_connector *connector = &nv_encoder->conn->base;
 	struct nouveau_drm *drm = nouveau_drm(connector->dev);
-	struct nv50_disp *disp = nv50_disp(connector->dev);
 	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
 	struct nvkm_i2c_bus *bus;
-	struct nouveau_encoder *nv_encoder;
 	struct drm_encoder *encoder;
+	struct dcb_output *dcbe = nv_encoder->dcb;
 	int type = DRM_MODE_ENCODER_DAC;
 
-	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
-	if (!nv_encoder)
-		return -ENOMEM;
-	nv_encoder->dcb = dcbe;
-
 	bus = nvkm_i2c_bus_find(i2c, dcbe->i2c_index);
 	if (bus)
 		nv_encoder->i2c = &bus->i2c;
 
 	encoder = to_drm_encoder(nv_encoder);
-	encoder->possible_crtcs = dcbe->heads;
-	encoder->possible_clones = 0;
 	drm_encoder_init(connector->dev, encoder, &nv50_dac_func, type,
 			 "dac-%04x-%04x", dcbe->hasht, dcbe->hashm);
 	drm_encoder_helper_add(encoder, &nv50_dac_help);
 
 	drm_connector_attach_encoder(connector, encoder);
-	return nvif_outp_ctor(disp->disp, nv_encoder->base.base.name, dcbe->id, &nv_encoder->outp);
+	return 0;
 }
 
 /*
@@ -1726,13 +1719,14 @@ bool nv50_has_mst(struct nouveau_drm *drm)
 }
 
 static int
-nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
+nv50_sor_create(struct nouveau_encoder *nv_encoder)
 {
+	struct drm_connector *connector = &nv_encoder->conn->base;
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_drm *drm = nouveau_drm(connector->dev);
 	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
-	struct nouveau_encoder *nv_encoder;
 	struct drm_encoder *encoder;
+	struct dcb_output *dcbe = nv_encoder->dcb;
 	struct nv50_disp *disp = nv50_disp(connector->dev);
 	int type, ret;
 
@@ -1745,15 +1739,9 @@ nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
 		break;
 	}
 
-	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
-	if (!nv_encoder)
-		return -ENOMEM;
-	nv_encoder->dcb = dcbe;
 	nv_encoder->update = nv50_sor_update;
 
 	encoder = to_drm_encoder(nv_encoder);
-	encoder->possible_crtcs = dcbe->heads;
-	encoder->possible_clones = 0;
 	drm_encoder_init(connector->dev, encoder, &nv50_sor_func, type,
 			 "sor-%04x-%04x", dcbe->hasht, dcbe->hashm);
 	drm_encoder_helper_add(encoder, &nv50_sor_help);
@@ -1797,7 +1785,7 @@ nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
 			nv_encoder->i2c = &bus->i2c;
 	}
 
-	return nvif_outp_ctor(disp->disp, nv_encoder->base.base.name, dcbe->id, &nv_encoder->outp);
+	return 0;
 }
 
 /******************************************************************************
@@ -1897,8 +1885,9 @@ nv50_pior_func = {
 };
 
 static int
-nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
+nv50_pior_create(struct nouveau_encoder *nv_encoder)
 {
+	struct drm_connector *connector = &nv_encoder->conn->base;
 	struct drm_device *dev = connector->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nv50_disp *disp = nv50_disp(dev);
@@ -1906,8 +1895,8 @@ nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	struct nvkm_i2c_bus *bus = NULL;
 	struct nvkm_i2c_aux *aux = NULL;
 	struct i2c_adapter *ddc;
-	struct nouveau_encoder *nv_encoder;
 	struct drm_encoder *encoder;
+	struct dcb_output *dcbe = nv_encoder->dcb;
 	int type;
 
 	switch (dcbe->type) {
@@ -1925,16 +1914,10 @@ nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
 		return -ENODEV;
 	}
 
-	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
-	if (!nv_encoder)
-		return -ENOMEM;
-	nv_encoder->dcb = dcbe;
 	nv_encoder->i2c = ddc;
 	nv_encoder->aux = aux;
 
 	encoder = to_drm_encoder(nv_encoder);
-	encoder->possible_crtcs = dcbe->heads;
-	encoder->possible_clones = 0;
 	drm_encoder_init(connector->dev, encoder, &nv50_pior_func, type,
 			 "pior-%04x-%04x", dcbe->hasht, dcbe->hashm);
 	drm_encoder_helper_add(encoder, &nv50_pior_help);
@@ -1944,7 +1927,7 @@ nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	disp->core->func->pior->get_caps(disp, nv_encoder, ffs(dcbe->or) - 1);
 	nv50_outp_dump_caps(drm, nv_encoder);
 
-	return nvif_outp_ctor(disp->disp, nv_encoder->base.base.name, dcbe->id, &nv_encoder->outp);
+	return 0;
 }
 
 /******************************************************************************
@@ -2797,26 +2780,46 @@ nv50_display_create(struct drm_device *dev)
 
 	/* create encoder/connector objects based on VBIOS DCB table */
 	for (i = 0, dcbe = &dcb->entry[0]; i < dcb->entries; i++, dcbe++) {
+		struct nouveau_encoder *outp;
+
+		outp = kzalloc(sizeof(*outp), GFP_KERNEL);
+		if (!outp)
+			break;
+
+		ret = nvif_outp_ctor(disp->disp, "kmsOutp", dcbe->id, &outp->outp);
+		if (ret) {
+			kfree(outp);
+			continue;
+		}
+
 		connector = nouveau_connector_create(dev, dcbe);
-		if (IS_ERR(connector))
+		if (IS_ERR(connector)) {
+			nvif_outp_dtor(&outp->outp);
+			kfree(outp);
 			continue;
+		}
+
+		outp->base.base.possible_crtcs = dcbe->heads;
+		outp->base.base.possible_clones = 0;
+		outp->dcb = dcbe;
+		outp->conn = nouveau_connector(connector);
 
 		if (dcbe->location == DCB_LOC_ON_CHIP) {
 			switch (dcbe->type) {
 			case DCB_OUTPUT_TMDS:
 			case DCB_OUTPUT_LVDS:
 			case DCB_OUTPUT_DP:
-				ret = nv50_sor_create(connector, dcbe);
+				ret = nv50_sor_create(outp);
 				break;
 			case DCB_OUTPUT_ANALOG:
-				ret = nv50_dac_create(connector, dcbe);
+				ret = nv50_dac_create(outp);
 				break;
 			default:
 				ret = -ENODEV;
 				break;
 			}
 		} else {
-			ret = nv50_pior_create(connector, dcbe);
+			ret = nv50_pior_create(outp);
 		}
 
 		if (ret) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index bcba1a14cfab6..b1554ad9d929b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -49,6 +49,8 @@ struct nouveau_encoder {
 	struct nvif_outp outp;
 	int or;
 
+	struct nouveau_connector *conn;
+
 	struct i2c_adapter *i2c;
 	struct nvkm_i2c_aux *aux;
 
-- 
2.41.0

