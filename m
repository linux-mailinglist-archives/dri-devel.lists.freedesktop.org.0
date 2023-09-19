Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BBF7A6E28
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C7510E3E8;
	Tue, 19 Sep 2023 22:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ACA10E19C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iS6EvdtVlblKHwo04rlcd8LVooKEHO0MrU5Y9/FVT00=;
 b=bw1aGVLjJlKAYgoj8DktsUn/Zpt5SkyNBAVXJ2feOxKWdr3/XRyWTrHcwRAL3VCzZMktzM
 uadGgj2FCEDC43uqDSMdWcoHMtXzBNlUTxGpJSyQQvw4pBHoy1imPUuDa9xTgKRBwCa0/n
 sMvFHkjbRK2FD8j2Ocg8N0hODavxUZ8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-xlSlXk06OrGQek3SlUnkqw-1; Tue, 19 Sep 2023 18:06:54 -0400
X-MC-Unique: xlSlXk06OrGQek3SlUnkqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E995A3C02539;
 Tue, 19 Sep 2023 22:06:53 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AA9B40C2064;
 Tue, 19 Sep 2023 22:06:53 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 27/44] drm/nouveau/disp: add dp aux xfer method
Date: Tue, 19 Sep 2023 17:56:22 -0400
Message-ID: <20230919220442.202488-28-lyude@redhat.com>
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
Cc: Kees Cook <keescook@chromium.org>, Karol Herbst <kherbst@redhat.com>,
 Danilo Krummrich <me@dakr.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
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
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 32 +++++++++----------
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 12 +++++++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  2 ++
 drivers/gpu/drm/nouveau/nouveau_connector.c   | 12 ++-----
 drivers/gpu/drm/nouveau/nouveau_encoder.h     |  1 -
 drivers/gpu/drm/nouveau/nvif/outp.c           | 24 ++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 14 ++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 27 +++++++++++++---
 9 files changed, 94 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 11b11284a3218..ee53bc5d10042 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1704,14 +1704,13 @@ nv50_sor_destroy(struct drm_encoder *encoder)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 
-	nvif_outp_dtor(&nv_encoder->outp);
-
 	nv50_mstm_del(&nv_encoder->dp.mstm);
 	drm_encoder_cleanup(encoder);
 
 	if (nv_encoder->dcb->type == DCB_OUTPUT_DP)
 		mutex_destroy(&nv_encoder->dp.hpd_irq_lock);
 
+	nvif_outp_dtor(&nv_encoder->outp);
 	kfree(encoder);
 }
 
@@ -1764,22 +1763,22 @@ nv50_sor_create(struct nouveau_encoder *nv_encoder)
 	nv50_outp_dump_caps(drm, nv_encoder);
 
 	if (dcbe->type == DCB_OUTPUT_DP) {
-		struct nvkm_i2c_aux *aux =
-			nvkm_i2c_aux_find(i2c, dcbe->i2c_index);
-
 		mutex_init(&nv_encoder->dp.hpd_irq_lock);
 
-		if (aux) {
-			if (disp->disp->object.oclass < GF110_DISP) {
-				/* HW has no support for address-only
-				 * transactions, so we're required to
-				 * use custom I2C-over-AUX code.
-				 */
-				nv_encoder->i2c = &aux->i2c;
-			} else {
-				nv_encoder->i2c = &nv_connector->aux.ddc;
-			}
-			nv_encoder->aux = aux;
+		if (disp->disp->object.oclass < GF110_DISP) {
+			/* HW has no support for address-only
+			 * transactions, so we're required to
+			 * use custom I2C-over-AUX code.
+			 */
+			struct nvkm_i2c_aux *aux;
+
+			aux = nvkm_i2c_aux_find(i2c, dcbe->i2c_index);
+			if (!aux)
+				return -EINVAL;
+
+			nv_encoder->i2c = &aux->i2c;
+		} else {
+			nv_encoder->i2c = &nv_connector->aux.ddc;
 		}
 
 		if (nv_connector->type != DCB_CONNECTOR_eDP &&
@@ -1925,7 +1924,6 @@ nv50_pior_create(struct nouveau_encoder *nv_encoder)
 	}
 
 	nv_encoder->i2c = ddc;
-	nv_encoder->aux = aux;
 
 	encoder = to_drm_encoder(nv_encoder);
 	drm_encoder_init(connector->dev, encoder, &nv50_pior_func, type,
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index ee4cec541a90e..94f1e55b0ce6c 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -32,6 +32,7 @@ union nvif_outp_args {
 #define NVIF_OUTP_V0_HDA_ELD       0x61
 
 #define NVIF_OUTP_V0_DP_AUX_PWR    0x70
+#define NVIF_OUTP_V0_DP_AUX_XFER   0x71
 #define NVIF_OUTP_V0_DP_RETRAIN    0x73
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
@@ -182,6 +183,17 @@ union nvif_outp_dp_aux_pwr_args {
 	} v0;
 };
 
+union nvif_outp_dp_aux_xfer_args {
+	struct nvif_outp_dp_aux_xfer_v0 {
+		__u8  version;
+		__u8  pad01;
+		__u8  type;
+		__u8  size;
+		__u32 addr;
+		__u8  data[16];
+	} v0;
+};
+
 union nvif_outp_dp_retrain_args {
 	struct nvif_outp_dp_retrain_vn {
 	} vn;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index 0ddaec9416eed..dd4dd0e2a7a1d 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -56,7 +56,9 @@ int nvif_outp_hdmi(struct nvif_outp *, int head, bool enable, u8 max_ac_packet,
 
 int nvif_outp_infoframe(struct nvif_outp *, u8 type, struct nvif_outp_infoframe_v0 *, u32 size);
 int nvif_outp_hda_eld(struct nvif_outp *, int head, void *data, u32 size);
+
 int nvif_outp_dp_aux_pwr(struct nvif_outp *, bool enable);
+int nvif_outp_dp_aux_xfer(struct nvif_outp *, u8 type, u8 *size, u32 addr, u8 *data);
 int nvif_outp_dp_retrain(struct nvif_outp *);
 int nvif_outp_dp_mst_vcpi(struct nvif_outp *, int head,
 			  u8 start_slot, u8 num_slots, u16 pbn, u16 aligned_pbn);
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index c079686fa2408..063cefe26be20 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1226,23 +1226,17 @@ nouveau_connector_aux_xfer(struct drm_dp_aux *obj, struct drm_dp_aux_msg *msg)
 	struct nouveau_connector *nv_connector =
 		container_of(obj, typeof(*nv_connector), aux);
 	struct nouveau_encoder *nv_encoder;
-	struct nvkm_i2c_aux *aux;
 	u8 size = msg->size;
 	int ret;
 
 	nv_encoder = find_encoder(&nv_connector->base, DCB_OUTPUT_DP);
-	if (!nv_encoder || !(aux = nv_encoder->aux))
+	if (!nv_encoder)
 		return -ENODEV;
 	if (WARN_ON(msg->size > 16))
 		return -E2BIG;
 
-	ret = nvkm_i2c_aux_acquire(aux);
-	if (ret)
-		return ret;
-
-	ret = nvkm_i2c_aux_xfer(aux, false, msg->request, msg->address,
-				msg->buffer, &size);
-	nvkm_i2c_aux_release(aux);
+	ret = nvif_outp_dp_aux_xfer(&nv_encoder->outp,
+				    msg->request, &size, msg->address, msg->buffer);
 	if (ret >= 0) {
 		msg->reply = ret;
 		return size;
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index b3a9415ba879c..aacdf2814abaa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -52,7 +52,6 @@ struct nouveau_encoder {
 	struct nouveau_connector *conn;
 
 	struct i2c_adapter *i2c;
-	struct nvkm_i2c_aux *aux;
 
 	/* different to drm_encoder.crtc, this reflects what's
 	 * actually programmed on the hw, not the proposed crtc */
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index dbb0986f05558..df6e89379982c 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -76,6 +76,30 @@ nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 	return ret;
 }
 
+int
+nvif_outp_dp_aux_xfer(struct nvif_outp *outp, u8 type, u8 *psize, u32 addr, u8 *data)
+{
+	struct nvif_outp_dp_aux_xfer_v0 args;
+	u8 size = *psize;
+	int ret;
+
+	args.version = 0;
+	args.type = type;
+	args.size = size;
+	args.addr = addr;
+	memcpy(args.data, data, size);
+	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_AUX_XFER, &args, sizeof(args));
+	NVIF_DEBUG(&outp->object, "[DP_AUX_XFER type:%d size:%d addr:%05x] %d size:%d (ret: %d)",
+		   args.type, size, args.addr, ret, args.size, ret);
+	if (ret < 0)
+		return ret;
+
+	*psize = args.size;
+
+	memcpy(data, args.data, size);
+	return ret;
+}
+
 int
 nvif_outp_dp_aux_pwr(struct nvif_outp *outp, bool enable)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index 99fe7ef07a443..49fbb32f50223 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -41,6 +41,19 @@
  */
 #define AMPERE_IED_HACK(disp) ((disp)->engine.subdev.device->card_type >= GA100)
 
+static int
+nvkm_dp_aux_xfer(struct nvkm_outp *outp, u8 type, u32 addr, u8 *data, u8 *size)
+{
+	int ret = nvkm_i2c_aux_acquire(outp->dp.aux);
+
+	if (ret)
+		return ret;
+
+	ret = nvkm_i2c_aux_xfer(outp->dp.aux, false, type, addr, data, size);
+	nvkm_i2c_aux_release(outp->dp.aux);
+	return ret;
+}
+
 static int
 nvkm_dp_aux_pwr(struct nvkm_outp *outp, bool pu)
 {
@@ -823,6 +836,7 @@ nvkm_dp_func = {
 	.bl.get = nvkm_outp_bl_get,
 	.bl.set = nvkm_outp_bl_set,
 	.dp.aux_pwr = nvkm_dp_aux_pwr,
+	.dp.aux_xfer = nvkm_dp_aux_xfer,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 513794a278a91..a2391b224ea49 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -107,6 +107,7 @@ struct nvkm_outp_func {
 
 	struct {
 		int (*aux_pwr)(struct nvkm_outp *, bool pu);
+		int (*aux_xfer)(struct nvkm_outp *, u8 type, u32 addr, u8 *data, u8 *size);
 	} dp;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 6ca364e953bd7..cd92db9028a3d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -25,6 +25,8 @@
 #include "head.h"
 #include "ior.h"
 
+#include <subdev/i2c.h>
+
 #include <nvif/if0012.h>
 
 static int
@@ -68,6 +70,20 @@ nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE]
 	return 0;
 }
 
+static int
+nvkm_uoutp_mthd_dp_aux_xfer(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_dp_aux_xfer_args *args = argv;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+		return -ENOSYS;
+	if (!outp->func->dp.aux_xfer)
+		return -EINVAL;
+
+	return outp->func->dp.aux_xfer(outp, args->v0.type, args->v0.addr,
+					     args->v0.data, &args->v0.size);
+}
+
 static int
 nvkm_uoutp_mthd_dp_aux_pwr(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -429,7 +445,7 @@ nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
+nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc, bool *invalid)
 {
 	switch (mthd) {
 	case NVIF_OUTP_V0_DETECT     : return nvkm_uoutp_mthd_detect     (outp, argv, argc);
@@ -440,11 +456,13 @@ nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc
 	case NVIF_OUTP_V0_BL_GET     : return nvkm_uoutp_mthd_bl_get     (outp, argv, argc);
 	case NVIF_OUTP_V0_BL_SET     : return nvkm_uoutp_mthd_bl_set     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_PWR : return nvkm_uoutp_mthd_dp_aux_pwr (outp, argv, argc);
+	case NVIF_OUTP_V0_DP_AUX_XFER: return nvkm_uoutp_mthd_dp_aux_xfer(outp, argv, argc);
 	default:
 		break;
 	}
 
-	return 1;
+	*invalid = true;
+	return 0;
 }
 
 static int
@@ -452,12 +470,13 @@ nvkm_uoutp_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
 	struct nvkm_outp *outp = nvkm_uoutp(object);
 	struct nvkm_disp *disp = outp->disp;
+	bool invalid = false;
 	int ret;
 
 	mutex_lock(&disp->super.mutex);
 
-	ret = nvkm_uoutp_mthd_noacquire(outp, mthd, argv, argc);
-	if (ret <= 0)
+	ret = nvkm_uoutp_mthd_noacquire(outp, mthd, argv, argc, &invalid);
+	if (!invalid)
 		goto done;
 
 	if (outp->ior)
-- 
2.41.0

