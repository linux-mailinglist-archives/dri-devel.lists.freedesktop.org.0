Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD8A81C3F1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 05:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A7E10E749;
	Fri, 22 Dec 2023 04:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D486910E73E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 04:33:28 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-Uxw0Wx3DNzWtRGcAucl1Xg-1; Thu, 21 Dec 2023 23:33:24 -0500
X-MC-Unique: Uxw0Wx3DNzWtRGcAucl1Xg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 496FA80CB60;
 Fri, 22 Dec 2023 04:33:24 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AAF22026D66;
 Fri, 22 Dec 2023 04:33:23 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 08/11] nouveau/gsp: don't free ctrl messages on errors
Date: Fri, 22 Dec 2023 14:31:57 +1000
Message-ID: <20231222043308.3090089-9-airlied@gmail.com>
In-Reply-To: <20231222043308.3090089-1-airlied@gmail.com>
References: <20231222043308.3090089-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It looks like for some messages the upper layers need to get access to the
results of the message so we can interpret it.

Rework the ctrl push interface to not free things and cleanup properly
whereever it errors out.

Requested-by: Lyude
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  17 +--
 .../gpu/drm/nouveau/nvkm/engine/disp/r535.c   | 108 +++++++++++-------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |  36 +++---
 3 files changed, 100 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gp=
u/drm/nouveau/include/nvkm/subdev/gsp.h
index 2fa0445d8928..d1437c08645f 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -187,7 +187,7 @@ struct nvkm_gsp {
 =09=09void (*rpc_done)(struct nvkm_gsp *gsp, void *repv);
=20
 =09=09void *(*rm_ctrl_get)(struct nvkm_gsp_object *, u32 cmd, u32 argc);
-=09=09void *(*rm_ctrl_push)(struct nvkm_gsp_object *, void *argv, u32 repc=
);
+=09=09int (*rm_ctrl_push)(struct nvkm_gsp_object *, void **argv, u32 repc)=
;
 =09=09void (*rm_ctrl_done)(struct nvkm_gsp_object *, void *repv);
=20
 =09=09void *(*rm_alloc_get)(struct nvkm_gsp_object *, u32 oclass, u32 argc=
);
@@ -265,7 +265,7 @@ nvkm_gsp_rm_ctrl_get(struct nvkm_gsp_object *object, u3=
2 cmd, u32 argc)
 =09return object->client->gsp->rm->rm_ctrl_get(object, cmd, argc);
 }
=20
-static inline void *
+static inline int
 nvkm_gsp_rm_ctrl_push(struct nvkm_gsp_object *object, void *argv, u32 repc=
)
 {
 =09return object->client->gsp->rm->rm_ctrl_push(object, argv, repc);
@@ -275,21 +275,24 @@ static inline void *
 nvkm_gsp_rm_ctrl_rd(struct nvkm_gsp_object *object, u32 cmd, u32 repc)
 {
 =09void *argv =3D nvkm_gsp_rm_ctrl_get(object, cmd, repc);
+=09int ret;
=20
 =09if (IS_ERR(argv))
 =09=09return argv;
=20
-=09return nvkm_gsp_rm_ctrl_push(object, argv, repc);
+=09ret =3D nvkm_gsp_rm_ctrl_push(object, &argv, repc);
+=09if (ret)
+=09=09return ERR_PTR(ret);
+=09return argv;
 }
=20
 static inline int
 nvkm_gsp_rm_ctrl_wr(struct nvkm_gsp_object *object, void *argv)
 {
-=09void *repv =3D nvkm_gsp_rm_ctrl_push(object, argv, 0);
-
-=09if (IS_ERR(repv))
-=09=09return PTR_ERR(repv);
+=09int ret =3D nvkm_gsp_rm_ctrl_push(object, &argv, 0);
=20
+=09if (ret)
+=09=09return ret;
 =09return 0;
 }
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/disp/r535.c
index 1c8c4cca0957..1b4f988df7ed 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
@@ -282,7 +282,7 @@ r535_sor_bl_get(struct nvkm_ior *sor)
 {
 =09struct nvkm_disp *disp =3D sor->disp;
 =09NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_PARAMS *ctrl;
-=09int lvl;
+=09int ret, lvl;
=20
 =09ctrl =3D nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
 =09=09=09=09    NV0073_CTRL_CMD_SPECIFIC_GET_BACKLIGHT_BRIGHTNESS,
@@ -292,9 +292,11 @@ r535_sor_bl_get(struct nvkm_ior *sor)
=20
 =09ctrl->displayId =3D BIT(sor->asy.outp->index);
=20
-=09ctrl =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
-=09if (IS_ERR(ctrl))
-=09=09return PTR_ERR(ctrl);
+=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+=09if (ret) {
+=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+=09=09return ret;
+=09}
=20
 =09lvl =3D ctrl->brightness;
 =09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
@@ -649,9 +651,11 @@ r535_conn_new(struct nvkm_disp *disp, u32 id)
 =09ctrl->subDeviceInstance =3D 0;
 =09ctrl->displayId =3D BIT(id);
=20
-=09ctrl =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
-=09if (IS_ERR(ctrl))
-=09=09return (void *)ctrl;
+=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+=09if (ret) {
+=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+=09=09return ERR_PTR(ret);
+=09}
=20
 =09list_for_each_entry(conn, &disp->conns, head) {
 =09=09if (conn->index =3D=3D ctrl->data[0].index) {
@@ -686,7 +690,7 @@ r535_outp_acquire(struct nvkm_outp *outp, bool hda)
 =09struct nvkm_disp *disp =3D outp->disp;
 =09struct nvkm_ior *ior;
 =09NV0073_CTRL_DFP_ASSIGN_SOR_PARAMS *ctrl;
-=09int or;
+=09int ret, or;
=20
 =09ctrl =3D nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
 =09=09=09=09    NV0073_CTRL_CMD_DFP_ASSIGN_SOR, sizeof(*ctrl));
@@ -699,9 +703,11 @@ r535_outp_acquire(struct nvkm_outp *outp, bool hda)
 =09if (hda)
 =09=09ctrl->flags |=3D NVDEF(NV0073_CTRL, DFP_ASSIGN_SOR_FLAGS, AUDIO, OPT=
IMAL);
=20
-=09ctrl =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
-=09if (IS_ERR(ctrl))
-=09=09return PTR_ERR(ctrl);
+=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+=09if (ret) {
+=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+=09=09return ret;
+=09}
=20
 =09for (or =3D 0; or < ARRAY_SIZE(ctrl->sorAssignListWithTag); or++) {
 =09=09if (ctrl->sorAssignListWithTag[or].displayMask & BIT(outp->index)) {
@@ -727,6 +733,7 @@ static int
 r535_disp_head_displayid(struct nvkm_disp *disp, int head, u32 *displayid)
 {
 =09NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS *ctrl;
+=09int ret;
=20
 =09ctrl =3D nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
 =09=09=09=09    NV0073_CTRL_CMD_SYSTEM_GET_ACTIVE, sizeof(*ctrl));
@@ -736,9 +743,11 @@ r535_disp_head_displayid(struct nvkm_disp *disp, int h=
ead, u32 *displayid)
 =09ctrl->subDeviceInstance =3D 0;
 =09ctrl->head =3D head;
=20
-=09ctrl =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
-=09if (IS_ERR(ctrl))
-=09=09return PTR_ERR(ctrl);
+=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+=09if (ret) {
+=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+=09=09return ret;
+=09}
=20
 =09*displayid =3D ctrl->displayId;
 =09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
@@ -772,9 +781,11 @@ r535_outp_inherit(struct nvkm_outp *outp)
 =09=09=09ctrl->subDeviceInstance =3D 0;
 =09=09=09ctrl->displayId =3D displayid;
=20
-=09=09=09ctrl =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ct=
rl));
-=09=09=09if (IS_ERR(ctrl))
+=09=09=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ct=
rl));
+=09=09=09if (ret) {
+=09=09=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
 =09=09=09=09return NULL;
+=09=09=09}
=20
 =09=09=09id =3D ctrl->index;
 =09=09=09proto =3D ctrl->protocol;
@@ -825,6 +836,7 @@ r535_outp_dfp_get_info(struct nvkm_outp *outp)
 {
 =09NV0073_CTRL_DFP_GET_INFO_PARAMS *ctrl;
 =09struct nvkm_disp *disp =3D outp->disp;
+=09int ret;
=20
 =09ctrl =3D nvkm_gsp_rm_ctrl_get(&disp->rm.objcom, NV0073_CTRL_CMD_DFP_GET=
_INFO, sizeof(*ctrl));
 =09if (IS_ERR(ctrl))
@@ -832,9 +844,11 @@ r535_outp_dfp_get_info(struct nvkm_outp *outp)
=20
 =09ctrl->displayId =3D BIT(outp->index);
=20
-=09ctrl =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
-=09if (IS_ERR(ctrl))
-=09=09return PTR_ERR(ctrl);
+=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+=09if (ret) {
+=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+=09=09return ret;
+=09}
=20
 =09nvkm_debug(&disp->engine.subdev, "DFP %08x: flags:%08x flags2:%08x\n",
 =09=09   ctrl->displayId, ctrl->flags, ctrl->flags2);
@@ -858,9 +872,11 @@ r535_outp_detect(struct nvkm_outp *outp)
 =09ctrl->subDeviceInstance =3D 0;
 =09ctrl->displayMask =3D BIT(outp->index);
=20
-=09ctrl =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
-=09if (IS_ERR(ctrl))
-=09=09return PTR_ERR(ctrl);
+=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+=09if (ret) {
+=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+=09=09return ret;
+=09}
=20
 =09if (ctrl->displayMask & BIT(outp->index)) {
 =09=09ret =3D r535_outp_dfp_get_info(outp);
@@ -895,6 +911,7 @@ r535_dp_mst_id_get(struct nvkm_outp *outp, u32 *pid)
 {
 =09NV0073_CTRL_CMD_DP_TOPOLOGY_ALLOCATE_DISPLAYID_PARAMS *ctrl;
 =09struct nvkm_disp *disp =3D outp->disp;
+=09int ret;
=20
 =09ctrl =3D nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
 =09=09=09=09    NV0073_CTRL_CMD_DP_TOPOLOGY_ALLOCATE_DISPLAYID,
@@ -904,9 +921,11 @@ r535_dp_mst_id_get(struct nvkm_outp *outp, u32 *pid)
=20
 =09ctrl->subDeviceInstance =3D 0;
 =09ctrl->displayId =3D BIT(outp->index);
-=09ctrl =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
-=09if (IS_ERR(ctrl))
-=09=09return PTR_ERR(ctrl);
+=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+=09if (ret) {
+=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+=09=09return ret;
+=09}
=20
 =09*pid =3D ctrl->displayIdAssigned;
 =09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
@@ -964,9 +983,11 @@ r535_dp_train_target(struct nvkm_outp *outp, u8 target=
, bool mst, u8 link_nr, u8
 =09    !(outp->dp.dpcd[DPCD_RC03] & DPCD_RC03_TPS4_SUPPORTED))
 =09    ctrl->cmd |=3D NVDEF(NV0073_CTRL, DP_CMD, POST_LT_ADJ_REQ_GRANTED, =
YES);
=20
-=09ctrl =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
-=09if (IS_ERR(ctrl))
-=09=09return PTR_ERR(ctrl);
+=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+=09if (ret) {
+=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+=09=09return ret;
+=09}
=20
 =09ret =3D ctrl->err ? -EIO : 0;
 =09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
@@ -1036,9 +1057,11 @@ r535_dp_aux_xfer(struct nvkm_outp *outp, u8 type, u3=
2 addr, u8 *data, u8 *psize)
 =09ctrl->size =3D !ctrl->bAddrOnly ? (size - 1) : 0;
 =09memcpy(ctrl->data, data, size);
=20
-=09ctrl =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
-=09if (IS_ERR(ctrl))
+=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+=09if (ret) {
+=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
 =09=09return PTR_ERR(ctrl);
+=09}
=20
 =09memcpy(data, ctrl->data, size);
 =09*psize =3D ctrl->size;
@@ -1111,10 +1134,13 @@ r535_tmds_edid_get(struct nvkm_outp *outp, u8 *data=
, u16 *psize)
 =09ctrl->subDeviceInstance =3D 0;
 =09ctrl->displayId =3D BIT(outp->index);
=20
-=09ctrl =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
-=09if (IS_ERR(ctrl))
-=09=09return PTR_ERR(ctrl);
+=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+=09if (ret) {
+=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+=09=09return ret;
+=09}
=20
+=09ret =3D -E2BIG;
 =09if (ctrl->bufferSize <=3D *psize) {
 =09=09memcpy(data, ctrl->edidBuffer, ctrl->bufferSize);
 =09=09*psize =3D ctrl->bufferSize;
@@ -1153,9 +1179,11 @@ r535_outp_new(struct nvkm_disp *disp, u32 id)
 =09ctrl->subDeviceInstance =3D 0;
 =09ctrl->displayId =3D BIT(id);
=20
-=09ctrl =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
-=09if (IS_ERR(ctrl))
-=09=09return PTR_ERR(ctrl);
+=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+=09if (ret) {
+=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+=09=09return ret;
+=09}
=20
 =09switch (ctrl->type) {
 =09case NV0073_CTRL_SPECIFIC_OR_TYPE_NONE:
@@ -1229,9 +1257,11 @@ r535_outp_new(struct nvkm_disp *disp, u32 id)
=20
 =09=09ctrl->sorIndex =3D ~0;
=20
-=09=09ctrl =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl)=
);
-=09=09if (IS_ERR(ctrl))
-=09=09=09return PTR_ERR(ctrl);
+=09=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl)=
);
+=09=09if (ret) {
+=09=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+=09=09=09return ret;
+=09=09}
=20
 =09=09switch (NVVAL_GET(ctrl->maxLinkRate, NV0073_CTRL_CMD, DP_GET_CAPS, M=
AX_LINK_RATE)) {
 =09=09case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_1_62:
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index 54c1fbccc013..e2810fd1a36f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -599,13 +599,13 @@ r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *ob=
ject, void *argv, u32 repc)
=20
 =09if (rpc->status) {
 =09=09ret =3D ERR_PTR(r535_rpc_status_to_errno(rpc->status));
-=09=09if (ret !=3D -EAGAIN)
+=09=09if (PTR_ERR(ret) !=3D -EAGAIN)
 =09=09=09nvkm_error(&gsp->subdev, "RM_ALLOC: 0x%x\n", rpc->status);
 =09} else {
 =09=09ret =3D repc ? rpc->params : NULL;
 =09}
=20
-=09if (IS_ERR_OR_NULL(ret))
+=09if (ret)
 =09=09nvkm_gsp_rpc_done(gsp, rpc);
=20
 =09return ret;
@@ -639,30 +639,34 @@ r535_gsp_rpc_rm_ctrl_done(struct nvkm_gsp_object *obj=
ect, void *repv)
 {
 =09rpc_gsp_rm_control_v03_00 *rpc =3D container_of(repv, typeof(*rpc), par=
ams);
=20
+=09if (!repv)
+=09=09return;
 =09nvkm_gsp_rpc_done(object->client->gsp, rpc);
 }
=20
-static void *
-r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void *argv, u32 =
repc)
+static int
+r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **argv, u32=
 repc)
 {
-=09rpc_gsp_rm_control_v03_00 *rpc =3D container_of(argv, typeof(*rpc), par=
ams);
+=09rpc_gsp_rm_control_v03_00 *rpc =3D container_of((*argv), typeof(*rpc), =
params);
 =09struct nvkm_gsp *gsp =3D object->client->gsp;
-=09void *ret;
+=09int ret =3D 0;
=20
 =09rpc =3D nvkm_gsp_rpc_push(gsp, rpc, true, repc);
-=09if (IS_ERR_OR_NULL(rpc))
-=09=09return rpc;
+=09if (IS_ERR_OR_NULL(rpc)) {
+=09=09*argv =3D NULL;
+=09=09return PTR_ERR(rpc);
+=09}
=20
 =09if (rpc->status) {
-=09=09ret =3D ERR_PTR(r535_rpc_status_to_errno(rpc->status));
+=09=09ret =3D r535_rpc_status_to_errno(rpc->status);
 =09=09if (ret !=3D -EAGAIN)
 =09=09=09nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x f=
ailed: 0x%08x\n",
 =09=09=09=09   object->client->object.handle, object->handle, rpc->cmd, rp=
c->status);
-=09} else {
-=09=09ret =3D repc ? rpc->params : NULL;
 =09}
=20
-=09if (IS_ERR_OR_NULL(ret))
+=09if (repc)
+=09=09*argv =3D rpc->params;
+=09else
 =09=09nvkm_gsp_rpc_done(gsp, rpc);
=20
 =09return ret;
@@ -860,9 +864,11 @@ r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
 =09if (IS_ERR(ctrl))
 =09=09return PTR_ERR(ctrl);
=20
-=09ctrl =3D nvkm_gsp_rm_ctrl_push(&gsp->internal.device.subdevice, ctrl, s=
izeof(*ctrl));
-=09if (WARN_ON(IS_ERR(ctrl)))
-=09=09return PTR_ERR(ctrl);
+=09ret =3D nvkm_gsp_rm_ctrl_push(&gsp->internal.device.subdevice, &ctrl, s=
izeof(*ctrl));
+=09if (WARN_ON(ret)) {
+=09=09nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
+=09=09return ret;
+=09}
=20
 =09for (unsigned i =3D 0; i < ctrl->tableLen; i++) {
 =09=09enum nvkm_subdev_type type;
--=20
2.43.0

