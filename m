Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D290B7A6E41
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED40110E400;
	Tue, 19 Sep 2023 22:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A24D10E402
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JgizHANM/TviVfoX4QYgokGs+c+QfBYkaIoLYwRW38I=;
 b=fSslO4vwgJuHrLCZYxIgZLJJcLSRStZtuEA1x3ZTspQ+Zngg60CW9+gld/yT4XCkfL1Phy
 s9+aSnNEJUMMyiikLYZJ2bHTVMSvZQxAMbdPVNLgIiyG4vhegV9uy8knkINHEUqiADNwb6
 xMcFQeJ/lHnnk+Zv4yjuH7fF5FDBu88=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-AwZGsYNdNlaYMrg7x0736A-1; Tue, 19 Sep 2023 18:07:26 -0400
X-MC-Unique: AwZGsYNdNlaYMrg7x0736A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B3D93C02532;
 Tue, 19 Sep 2023 22:07:26 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6A7540C2064;
 Tue, 19 Sep 2023 22:07:25 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 35/44] drm/nouveau/disp: add dp mst id get/put methods
Date: Tue, 19 Sep 2023 17:56:30 -0400
Message-ID: <20230919220442.202488-36-lyude@redhat.com>
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
 Danilo Krummrich <me@dakr.org>, open list <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 32 ++++++++++++++++---
 drivers/gpu/drm/nouveau/dispnv50/head.h       |  1 +
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c   | 14 ++++++++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 18 +++++++++++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  2 ++
 drivers/gpu/drm/nouveau/nvif/outp.c           | 29 +++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 15 +++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  2 ++
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 28 ++++++++++++++++
 9 files changed, 137 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index d8ed23ddd2e4c..d6de5ee89d543 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -869,6 +869,8 @@ struct nv50_msto {
 	struct nv50_mstc *mstc;
 	bool disabled;
 	bool enabled;
+
+	u32 display_id;
 };
 
 struct nouveau_encoder *nv50_real_outp(struct drm_encoder *encoder)
@@ -897,10 +899,17 @@ nv50_msto_cleanup(struct drm_atomic_state *state,
 		drm_atomic_get_old_mst_topology_state(state, mgr);
 	const struct drm_dp_mst_atomic_payload *old_payload =
 		drm_atomic_get_mst_payload_state(old_mst_state, msto->mstc->port);
+	struct nv50_mstc *mstc = msto->mstc;
+	struct nv50_mstm *mstm = mstc->mstm;
 
 	NV_ATOMIC(drm, "%s: msto cleanup\n", msto->encoder.name);
 
 	if (msto->disabled) {
+		if (msto->head->func->display_id) {
+			nvif_outp_dp_mst_id_put(&mstm->outp->outp, msto->display_id);
+			msto->display_id = 0;
+		}
+
 		msto->mstc = NULL;
 		msto->disabled = false;
 		drm_dp_remove_payload_part2(mgr, new_mst_state, old_payload, new_payload);
@@ -1041,6 +1050,11 @@ nv50_msto_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *st
 		nouveau_dp_train(mstm->outp, true, 0, 0);
 	}
 
+	if (head->func->display_id) {
+		if (!WARN_ON(nvif_outp_dp_mst_id_get(&mstm->outp->outp, &msto->display_id)))
+			head->func->display_id(head, msto->display_id);
+	}
+
 	if (mstm->outp->outp.or.link & 1)
 		proto = NV917D_SOR_SET_CONTROL_PROTOCOL_DP_A;
 	else
@@ -1061,6 +1075,9 @@ nv50_msto_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *s
 	struct nv50_mstc *mstc = msto->mstc;
 	struct nv50_mstm *mstm = mstc->mstm;
 
+	if (msto->head->func->display_id)
+		msto->head->func->display_id(msto->head, 0);
+
 	mstm->outp->update(mstm->outp, msto->head->base.index, NULL, 0, 0);
 	mstm->modified = true;
 	if (!--mstm->links)
@@ -1544,7 +1561,7 @@ static void
 nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
+	struct nv50_head *head = nv50_head(nv_encoder->crtc);
 	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
@@ -1563,7 +1580,7 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 #endif
 
 	if (nv_encoder->dcb->type == DCB_OUTPUT_TMDS && nv_encoder->hdmi.enabled) {
-		nvif_outp_hdmi(&nv_encoder->outp, nv_crtc->index,
+		nvif_outp_hdmi(&nv_encoder->outp, head->base.index,
 			       false, 0, 0, 0, false, false, false);
 		nv_encoder->hdmi.enabled = false;
 	}
@@ -1571,8 +1588,11 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 	if (nv_encoder->dcb->type == DCB_OUTPUT_DP)
 		nouveau_dp_power_down(nv_encoder);
 
-	nv_encoder->update(nv_encoder, nv_crtc->index, NULL, 0, 0);
-	nv50_audio_disable(encoder, nv_crtc);
+	if (head->func->display_id)
+		head->func->display_id(head, 0);
+
+	nv_encoder->update(nv_encoder, head->base.index, NULL, 0, 0);
+	nv50_audio_disable(encoder, &head->base);
 	nv_encoder->crtc = NULL;
 }
 
@@ -1585,6 +1605,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 		nv50_head_atom(drm_atomic_get_new_crtc_state(state, &nv_crtc->base));
 	struct drm_display_mode *mode = &asyh->state.adjusted_mode;
 	struct nv50_disp *disp = nv50_disp(encoder->dev);
+	struct nv50_head *head = nv50_head(&nv_crtc->base);
 	struct nvif_outp *outp = &nv_encoder->outp;
 	struct drm_device *dev = encoder->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
@@ -1682,6 +1703,9 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 		break;
 	}
 
+	if (head->func->display_id)
+		head->func->display_id(head, BIT(nv_encoder->dcb->id));
+
 	nv_encoder->update(nv_encoder, nv_crtc->index, asyh, proto, depth);
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.h b/drivers/gpu/drm/nouveau/dispnv50/head.h
index 41c8788dfb312..e9d17037ffcfc 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.h
@@ -49,6 +49,7 @@ struct nv50_head_func {
 	int (*procamp)(struct nv50_head *, struct nv50_head_atom *);
 	int (*or)(struct nv50_head *, struct nv50_head_atom *);
 	void (*static_wndw_map)(struct nv50_head *, struct nv50_head_atom *);
+	int (*display_id)(struct nv50_head *, u32 display_id);
 };
 
 extern const struct nv50_head_func head507d;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
index 543f08ceaad6d..53b1248c40ec8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -27,6 +27,19 @@
 
 #include <nvhw/class/clc57d.h>
 
+static int
+headc57d_display_id(struct nv50_head *head, u32 display_id)
+{
+	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	int ret;
+
+	if ((ret = PUSH_WAIT(push, 2)))
+		return ret;
+
+	PUSH_NVSQ(push, NVC57D, 0x2020 + (head->base.index * 0x400), display_id);
+	return 0;
+}
+
 static int
 headc57d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
@@ -250,4 +263,5 @@ headc57d = {
 	.or = headc57d_or,
 	/* TODO: flexible window mappings */
 	.static_wndw_map = headc37d_static_wndw_map,
+	.display_id = headc57d_display_id,
 };
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 6fb297b65ae87..502f342e0d775 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -37,6 +37,8 @@ union nvif_outp_args {
 #define NVIF_OUTP_V0_DP_TRAIN      0x73
 #define NVIF_OUTP_V0_DP_DRIVE      0x74
 #define NVIF_OUTP_V0_DP_SST        0x75
+#define NVIF_OUTP_V0_DP_MST_ID_GET 0x76
+#define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
 union nvif_outp_detect_args {
@@ -234,6 +236,22 @@ union nvif_outp_dp_sst_args {
 	} v0;
 };
 
+union nvif_outp_dp_mst_id_put_args {
+	struct nvif_outp_dp_mst_id_put_v0 {
+		__u8  version;
+		__u8  pad01[3];
+		__u32 id;
+	} v0;
+};
+
+union nvif_outp_dp_mst_id_get_args {
+	struct nvif_outp_dp_mst_id_get_v0 {
+		__u8  version;
+		__u8  pad01[3];
+		__u32 id;
+	} v0;
+};
+
 union nvif_outp_dp_mst_vcpi_args {
 	struct nvif_outp_dp_mst_vcpi_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index 881cbed5f0ee3..2d86838ed5598 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -69,6 +69,8 @@ int nvif_outp_dp_train(struct nvif_outp *, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 		       bool retrain);
 int nvif_outp_dp_drive(struct nvif_outp *, u8 link_nr, u8 pe[4], u8 vs[4]);
 int nvif_outp_dp_sst(struct nvif_outp *, int head, u32 watermark, u32 hblanksym, u32 vblanksym);
+int nvif_outp_dp_mst_id_get(struct nvif_outp *, u32 *id);
+int nvif_outp_dp_mst_id_put(struct nvif_outp *, u32 id);
 int nvif_outp_dp_mst_vcpi(struct nvif_outp *, int head,
 			  u8 start_slot, u8 num_slots, u16 pbn, u16 aligned_pbn);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 952103aa93b78..97e5855c2cf54 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -46,6 +46,35 @@ nvif_outp_dp_mst_vcpi(struct nvif_outp *outp, int head,
 	return ret;
 }
 
+int
+nvif_outp_dp_mst_id_put(struct nvif_outp *outp, u32 id)
+{
+	struct nvif_outp_dp_mst_id_get_v0 args;
+	int ret;
+
+	args.version = 0;
+	args.id = id;
+	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_MST_ID_PUT, &args, sizeof(args));
+	NVIF_ERRON(ret, &outp->object, "[DP_MST_ID_PUT id:%08x]", args.id);
+	return ret;
+}
+
+int
+nvif_outp_dp_mst_id_get(struct nvif_outp *outp, u32 *id)
+{
+	struct nvif_outp_dp_mst_id_get_v0 args;
+	int ret;
+
+	args.version = 0;
+	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_MST_ID_GET, &args, sizeof(args));
+	NVIF_ERRON(ret, &outp->object, "[DP_MST_ID_GET] id:%08x", args.id);
+	if (ret)
+		return ret;
+
+	*id = args.id;
+	return 0;
+}
+
 int
 nvif_outp_dp_sst(struct nvif_outp *outp, int head, u32 watermark, u32 hblanksym, u32 vblanksym)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index 77a91d42b977a..aaa7796946ceb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -41,6 +41,19 @@
  */
 #define AMPERE_IED_HACK(disp) ((disp)->engine.subdev.device->card_type >= GA100)
 
+static int
+nvkm_dp_mst_id_put(struct nvkm_outp *outp, u32 id)
+{
+	return 0;
+}
+
+static int
+nvkm_dp_mst_id_get(struct nvkm_outp *outp, u32 *pid)
+{
+	*pid = BIT(outp->index);
+	return 0;
+}
+
 static int
 nvkm_dp_aux_xfer(struct nvkm_outp *outp, u8 type, u32 addr, u8 *data, u8 *size)
 {
@@ -614,6 +627,8 @@ nvkm_dp_func = {
 	.dp.aux_xfer = nvkm_dp_aux_xfer,
 	.dp.train = nvkm_dp_train,
 	.dp.drive = nvkm_dp_drive,
+	.dp.mst_id_get = nvkm_dp_mst_id_get,
+	.dp.mst_id_put = nvkm_dp_mst_id_put,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index cda17941de89a..3ec7318d9144e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -109,6 +109,8 @@ struct nvkm_outp_func {
 		int (*rates)(struct nvkm_outp *);
 		int (*train)(struct nvkm_outp *, bool retrain);
 		int (*drive)(struct nvkm_outp *, u8 lanes, u8 pe[4], u8 vs[4]);
+		int (*mst_id_get)(struct nvkm_outp *, u32 *id);
+		int (*mst_id_put)(struct nvkm_outp *, u32 id);
 	} dp;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 225f88fbdae0f..ad52d9ed594af 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -45,6 +45,32 @@ nvkm_uoutp_mthd_dp_mst_vcpi(struct nvkm_outp *outp, void *argv, u32 argc)
 	return 0;
 }
 
+static int
+nvkm_uoutp_mthd_dp_mst_id_put(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_dp_mst_id_put_args *args = argv;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+	        return -ENOSYS;
+	if (!outp->func->dp.mst_id_put)
+	        return -EINVAL;
+
+	return outp->func->dp.mst_id_put(outp, args->v0.id);
+}
+
+static int
+nvkm_uoutp_mthd_dp_mst_id_get(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_dp_mst_id_get_args *args = argv;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+	        return -ENOSYS;
+	if (!outp->func->dp.mst_id_get)
+	        return -EINVAL;
+
+	return outp->func->dp.mst_id_get(outp, &args->v0.id);
+}
+
 static int
 nvkm_uoutp_mthd_dp_sst(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -482,6 +508,8 @@ nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 	case NVIF_OUTP_V0_DP_TRAIN     : return nvkm_uoutp_mthd_dp_train     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_DRIVE     : return nvkm_uoutp_mthd_dp_drive     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_SST       : return nvkm_uoutp_mthd_dp_sst       (outp, argv, argc);
+	case NVIF_OUTP_V0_DP_MST_ID_GET: return nvkm_uoutp_mthd_dp_mst_id_get(outp, argv, argc);
+	case NVIF_OUTP_V0_DP_MST_ID_PUT: return nvkm_uoutp_mthd_dp_mst_id_put(outp, argv, argc);
 	case NVIF_OUTP_V0_DP_MST_VCPI  : return nvkm_uoutp_mthd_dp_mst_vcpi  (outp, argv, argc);
 	default:
 		break;
-- 
2.41.0

