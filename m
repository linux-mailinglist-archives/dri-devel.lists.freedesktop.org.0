Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE997A6E54
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523AA10E410;
	Tue, 19 Sep 2023 22:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CB810E40C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IB/UOO+ry7vmqCSm4AfJjhf4pfUzv9fJwJ5uY+01svk=;
 b=E1yHSNzn/RVJt4zIZuBsg9ETQ5LDyLJQN0ob9D2m5FQyxd2gPB9f3vLEIxEagPJn33SZ+i
 +kQjRM/yPy1wbCWsVnWZJoC1oocmhtUFbRihaeq4paTZ1vlmusBE53iGx/HYVW9mW74tXY
 +k0lmF2NRNJnicAGqmZngNlYJ5pAl/0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-c3enReCVOu2xRgESCR7nkQ-1; Tue, 19 Sep 2023 18:07:42 -0400
X-MC-Unique: c3enReCVOu2xRgESCR7nkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE5733822568;
 Tue, 19 Sep 2023 22:07:41 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5902C40C2064;
 Tue, 19 Sep 2023 22:07:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 42/44] drm/nouveau/kms/nv50-: create connectors based on
 nvkm info
Date: Tue, 19 Sep 2023 17:56:37 -0400
Message-ID: <20230919220442.202488-43-lyude@redhat.com>
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

- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv04/disp.c       |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   2 +-
 drivers/gpu/drm/nouveau/include/nvif/conn.h   |  15 ++
 drivers/gpu/drm/nouveau/include/nvif/if0011.h |  10 ++
 drivers/gpu/drm/nouveau/nouveau_connector.c   | 131 +++++++++---------
 drivers/gpu/drm/nouveau/nouveau_connector.h   |   3 +-
 drivers/gpu/drm/nouveau/nvif/conn.c           |  22 ++-
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  |  26 ++++
 8 files changed, 139 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index e9ac3fb27ff78..13705c5f14973 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -256,7 +256,7 @@ nv04_display_create(struct drm_device *dev)
 	for (i = 0; i < dcb->entries; i++) {
 		struct dcb_output *dcbent = &dcb->entry[i];
 
-		connector = nouveau_connector_create(dev, dcbent);
+		connector = nouveau_connector_create(dev, dcbent->connector);
 		if (IS_ERR(connector))
 			continue;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 26d59346703e3..e2fa748e66f16 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2788,7 +2788,7 @@ nv50_display_create(struct drm_device *dev)
 			continue;
 		}
 
-		connector = nouveau_connector_create(dev, dcbe);
+		connector = nouveau_connector_create(dev, dcbe->connector);
 		if (IS_ERR(connector)) {
 			nvif_outp_dtor(&outp->outp);
 			kfree(outp);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/conn.h b/drivers/gpu/drm/nouveau/include/nvif/conn.h
index 8a6017a358976..406c12a111f9d 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/conn.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/conn.h
@@ -7,6 +7,21 @@ struct nvif_disp;
 
 struct nvif_conn {
 	struct nvif_object object;
+	u32 id;
+
+	struct {
+		enum {
+			NVIF_CONN_VGA,
+			NVIF_CONN_TV,
+			NVIF_CONN_DVI_I,
+			NVIF_CONN_DVI_D,
+			NVIF_CONN_LVDS,
+			NVIF_CONN_LVDS_SPWG,
+			NVIF_CONN_HDMI,
+			NVIF_CONN_DP,
+			NVIF_CONN_EDP,
+		} type;
+	} info;
 };
 
 int nvif_conn_ctor(struct nvif_disp *, const char *name, int id, struct nvif_conn *);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0011.h b/drivers/gpu/drm/nouveau/include/nvif/if0011.h
index 0c25288a5a789..3ed0ddd75bd8f 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0011.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0011.h
@@ -7,6 +7,16 @@ union nvif_conn_args {
 		__u8 version;
 		__u8 id;	/* DCB connector table index. */
 		__u8 pad02[6];
+#define NVIF_CONN_V0_VGA       0x00
+#define NVIF_CONN_V0_TV        0x01
+#define NVIF_CONN_V0_DVI_I     0x02
+#define NVIF_CONN_V0_DVI_D     0x03
+#define NVIF_CONN_V0_LVDS      0x04
+#define NVIF_CONN_V0_LVDS_SPWG 0x05
+#define NVIF_CONN_V0_HDMI      0x06
+#define NVIF_CONN_V0_DP        0x07
+#define NVIF_CONN_V0_EDP       0x08
+		__u8 type;
 	} v0;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 73657736ce838..21cc8dfcb7add 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1275,15 +1275,13 @@ drm_conntype_from_dcb(enum dcb_connector_type dcb)
 }
 
 struct drm_connector *
-nouveau_connector_create(struct drm_device *dev,
-			 const struct dcb_output *dcbe)
+nouveau_connector_create(struct drm_device *dev, int index)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_display *disp = nouveau_display(dev);
 	struct nouveau_connector *nv_connector = NULL;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
-	int index = dcbe->connector;
 	int type, ret = 0;
 	bool dummy;
 
@@ -1305,70 +1303,76 @@ nouveau_connector_create(struct drm_device *dev,
 	nv_connector->index = index;
 	INIT_WORK(&nv_connector->irq_work, nouveau_dp_irq);
 
-	/* attempt to parse vbios connector type and hotplug gpio */
-	nv_connector->dcb = olddcb_conn(dev, index);
-	if (nv_connector->dcb) {
-		u32 entry = ROM16(nv_connector->dcb[0]);
-		if (olddcb_conntab(dev)[3] >= 4)
-			entry |= (u32)ROM16(nv_connector->dcb[2]) << 16;
-
-		nv_connector->type = nv_connector->dcb[0];
-		if (drm_conntype_from_dcb(nv_connector->type) ==
-					  DRM_MODE_CONNECTOR_Unknown) {
-			NV_WARN(drm, "unknown connector type %02x\n",
-				nv_connector->type);
-			nv_connector->type = DCB_CONNECTOR_NONE;
+	if (disp->disp.conn_mask & BIT(nv_connector->index)) {
+		ret = nvif_conn_ctor(&disp->disp, nv_connector->base.name, nv_connector->index,
+				     &nv_connector->conn);
+		if (ret) {
+			kfree(nv_connector);
+			return ERR_PTR(ret);
 		}
 
-		/* Gigabyte NX85T */
-		if (nv_match_device(dev, 0x0421, 0x1458, 0x344c)) {
-			if (nv_connector->type == DCB_CONNECTOR_HDMI_1)
-				nv_connector->type = DCB_CONNECTOR_DVI_I;
+		switch (nv_connector->conn.info.type) {
+		case NVIF_CONN_VGA      : type = DCB_CONNECTOR_VGA; break;
+		case NVIF_CONN_DVI_I    : type = DCB_CONNECTOR_DVI_I; break;
+		case NVIF_CONN_DVI_D    : type = DCB_CONNECTOR_DVI_D; break;
+		case NVIF_CONN_LVDS     : type = DCB_CONNECTOR_LVDS; break;
+		case NVIF_CONN_LVDS_SPWG: type = DCB_CONNECTOR_LVDS_SPWG; break;
+		case NVIF_CONN_DP       : type = DCB_CONNECTOR_DP; break;
+		case NVIF_CONN_EDP      : type = DCB_CONNECTOR_eDP; break;
+		case NVIF_CONN_HDMI     : type = DCB_CONNECTOR_HDMI_0; break;
+		default:
+			WARN_ON(1);
+			return NULL;
 		}
 
-		/* Gigabyte GV-NX86T512H */
-		if (nv_match_device(dev, 0x0402, 0x1458, 0x3455)) {
-			if (nv_connector->type == DCB_CONNECTOR_HDMI_1)
-				nv_connector->type = DCB_CONNECTOR_DVI_I;
-		}
+		nv_connector->type = type;
 	} else {
-		nv_connector->type = DCB_CONNECTOR_NONE;
-	}
+		u8 *dcb = olddcb_conn(dev, nv_connector->index);
 
-	/* no vbios data, or an unknown dcb connector type - attempt to
-	 * figure out something suitable ourselves
-	 */
-	if (nv_connector->type == DCB_CONNECTOR_NONE) {
-		struct nouveau_drm *drm = nouveau_drm(dev);
-		struct dcb_table *dcbt = &drm->vbios.dcb;
-		u32 encoders = 0;
-		int i;
-
-		for (i = 0; i < dcbt->entries; i++) {
-			if (dcbt->entry[i].connector == nv_connector->index)
-				encoders |= (1 << dcbt->entry[i].type);
+		if (dcb)
+			nv_connector->type = dcb[0];
+		else
+			nv_connector->type = DCB_CONNECTOR_NONE;
+
+		/* attempt to parse vbios connector type and hotplug gpio */
+		if (nv_connector->type != DCB_CONNECTOR_NONE) {
+			if (drm_conntype_from_dcb(nv_connector->type) ==
+						  DRM_MODE_CONNECTOR_Unknown) {
+				NV_WARN(drm, "unknown connector type %02x\n",
+					nv_connector->type);
+				nv_connector->type = DCB_CONNECTOR_NONE;
+			}
 		}
 
-		if (encoders & (1 << DCB_OUTPUT_DP)) {
-			if (encoders & (1 << DCB_OUTPUT_TMDS))
-				nv_connector->type = DCB_CONNECTOR_DP;
-			else
-				nv_connector->type = DCB_CONNECTOR_eDP;
-		} else
-		if (encoders & (1 << DCB_OUTPUT_TMDS)) {
-			if (encoders & (1 << DCB_OUTPUT_ANALOG))
-				nv_connector->type = DCB_CONNECTOR_DVI_I;
-			else
-				nv_connector->type = DCB_CONNECTOR_DVI_D;
-		} else
-		if (encoders & (1 << DCB_OUTPUT_ANALOG)) {
-			nv_connector->type = DCB_CONNECTOR_VGA;
-		} else
-		if (encoders & (1 << DCB_OUTPUT_LVDS)) {
-			nv_connector->type = DCB_CONNECTOR_LVDS;
-		} else
-		if (encoders & (1 << DCB_OUTPUT_TV)) {
-			nv_connector->type = DCB_CONNECTOR_TV_0;
+		/* no vbios data, or an unknown dcb connector type - attempt to
+		 * figure out something suitable ourselves
+		 */
+		if (nv_connector->type == DCB_CONNECTOR_NONE &&
+		    !WARN_ON(drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)) {
+			struct dcb_table *dcbt = &drm->vbios.dcb;
+			u32 encoders = 0;
+			int i;
+
+			for (i = 0; i < dcbt->entries; i++) {
+				if (dcbt->entry[i].connector == nv_connector->index)
+					encoders |= (1 << dcbt->entry[i].type);
+			}
+
+			if (encoders & (1 << DCB_OUTPUT_TMDS)) {
+				if (encoders & (1 << DCB_OUTPUT_ANALOG))
+					nv_connector->type = DCB_CONNECTOR_DVI_I;
+				else
+					nv_connector->type = DCB_CONNECTOR_DVI_D;
+			} else
+			if (encoders & (1 << DCB_OUTPUT_ANALOG)) {
+				nv_connector->type = DCB_CONNECTOR_VGA;
+			} else
+			if (encoders & (1 << DCB_OUTPUT_LVDS)) {
+				nv_connector->type = DCB_CONNECTOR_LVDS;
+			} else
+			if (encoders & (1 << DCB_OUTPUT_TV)) {
+				nv_connector->type = DCB_CONNECTOR_TV_0;
+			}
 		}
 	}
 
@@ -1414,14 +1418,7 @@ nouveau_connector_create(struct drm_device *dev,
 	drm_connector_helper_add(connector, &nouveau_connector_helper_funcs);
 	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
 
-	if (nv_connector->dcb && (disp->disp.conn_mask & BIT(nv_connector->index))) {
-		ret = nvif_conn_ctor(&disp->disp, nv_connector->base.name, nv_connector->index,
-				     &nv_connector->conn);
-		if (ret) {
-			kfree(nv_connector);
-			return ERR_PTR(ret);
-		}
-
+	if (nvif_object_constructed(&nv_connector->conn.object)) {
 		ret = nvif_conn_event_ctor(&nv_connector->conn, "kmsHotplug",
 					   nouveau_connector_hotplug,
 					   NVIF_CONN_EVENT_V0_PLUG | NVIF_CONN_EVENT_V0_UNPLUG,
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index 35bcb541722b8..a2df4918340cb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -121,7 +121,6 @@ struct nouveau_connector {
 	struct drm_connector base;
 	enum dcb_connector_type type;
 	u8 index;
-	u8 *dcb;
 
 	struct nvif_conn conn;
 	u64 hpd_pending;
@@ -200,7 +199,7 @@ nouveau_crtc_connector_get(struct nouveau_crtc *nv_crtc)
 }
 
 struct drm_connector *
-nouveau_connector_create(struct drm_device *, const struct dcb_output *);
+nouveau_connector_create(struct drm_device *, int id);
 void nouveau_connector_hpd(struct nouveau_connector *, u64 bits);
 
 extern int nouveau_tv_disable;
diff --git a/drivers/gpu/drm/nouveau/nvif/conn.c b/drivers/gpu/drm/nouveau/nvif/conn.c
index 879569d4ba4cc..9ee18cb992644 100644
--- a/drivers/gpu/drm/nouveau/nvif/conn.c
+++ b/drivers/gpu/drm/nouveau/nvif/conn.c
@@ -63,5 +63,25 @@ nvif_conn_ctor(struct nvif_disp *disp, const char *name, int id, struct nvif_con
 	ret = nvif_object_ctor(&disp->object, name ?: "nvifConn", id, NVIF_CLASS_CONN,
 			       &args, sizeof(args), &conn->object);
 	NVIF_ERRON(ret, &disp->object, "[NEW conn id:%d]", id);
-	return ret;
+	if (ret)
+		return ret;
+
+	conn->id = id;
+
+	switch (args.type) {
+	case NVIF_CONN_V0_VGA      : conn->info.type = NVIF_CONN_VGA; break;
+	case NVIF_CONN_V0_TV       : conn->info.type = NVIF_CONN_TV; break;
+	case NVIF_CONN_V0_DVI_I    : conn->info.type = NVIF_CONN_DVI_I; break;
+	case NVIF_CONN_V0_DVI_D    : conn->info.type = NVIF_CONN_DVI_D; break;
+	case NVIF_CONN_V0_LVDS     : conn->info.type = NVIF_CONN_LVDS; break;
+	case NVIF_CONN_V0_LVDS_SPWG: conn->info.type = NVIF_CONN_LVDS_SPWG; break;
+	case NVIF_CONN_V0_HDMI     : conn->info.type = NVIF_CONN_HDMI; break;
+	case NVIF_CONN_V0_DP       : conn->info.type = NVIF_CONN_DP; break;
+	case NVIF_CONN_V0_EDP      : conn->info.type = NVIF_CONN_EDP; break;
+	default:
+		break;
+	}
+
+	return 0;
+
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 971cccc0892cc..c6eeb8e44c15f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -142,6 +142,32 @@ nvkm_uconn_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	ret = -EBUSY;
 	spin_lock(&disp->client.lock);
 	if (!conn->object.func) {
+		switch (conn->info.type) {
+		case DCB_CONNECTOR_VGA      : args->v0.type = NVIF_CONN_V0_VGA; break;
+		case DCB_CONNECTOR_TV_0     :
+		case DCB_CONNECTOR_TV_1     :
+		case DCB_CONNECTOR_TV_3     : args->v0.type = NVIF_CONN_V0_TV; break;
+		case DCB_CONNECTOR_DMS59_0  :
+		case DCB_CONNECTOR_DMS59_1  :
+		case DCB_CONNECTOR_DVI_I    : args->v0.type = NVIF_CONN_V0_DVI_I; break;
+		case DCB_CONNECTOR_DVI_D    : args->v0.type = NVIF_CONN_V0_DVI_D; break;
+		case DCB_CONNECTOR_LVDS     : args->v0.type = NVIF_CONN_V0_LVDS; break;
+		case DCB_CONNECTOR_LVDS_SPWG: args->v0.type = NVIF_CONN_V0_LVDS_SPWG; break;
+		case DCB_CONNECTOR_DMS59_DP0:
+		case DCB_CONNECTOR_DMS59_DP1:
+		case DCB_CONNECTOR_DP       :
+		case DCB_CONNECTOR_mDP      :
+		case DCB_CONNECTOR_USB_C    : args->v0.type = NVIF_CONN_V0_DP; break;
+		case DCB_CONNECTOR_eDP      : args->v0.type = NVIF_CONN_V0_EDP; break;
+		case DCB_CONNECTOR_HDMI_0   :
+		case DCB_CONNECTOR_HDMI_1   :
+		case DCB_CONNECTOR_HDMI_C   : args->v0.type = NVIF_CONN_V0_HDMI; break;
+		default:
+			WARN_ON(1);
+			ret = -EINVAL;
+			break;
+		}
+
 		nvkm_object_ctor(&nvkm_uconn, oclass, &conn->object);
 		*pobject = &conn->object;
 		ret = 0;
-- 
2.41.0

