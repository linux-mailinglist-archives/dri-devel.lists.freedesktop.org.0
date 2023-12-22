Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3B081C3F2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 05:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92DD10E74A;
	Fri, 22 Dec 2023 04:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7198610E741
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 04:33:31 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-l1PDDIiuMwahk4PlS7zXWg-1; Thu, 21 Dec 2023 23:33:29 -0500
X-MC-Unique: l1PDDIiuMwahk4PlS7zXWg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4C38830FD8;
 Fri, 22 Dec 2023 04:33:28 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3B0D2026D66;
 Fri, 22 Dec 2023 04:33:27 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 11/11] drm/nouveau/dp: Honor GSP link training retry timeouts
Date: Fri, 22 Dec 2023 14:32:00 +1000
Message-ID: <20231222043308.3090089-12-airlied@gmail.com>
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

From: Lyude Paul <lyude@redhat.com>

Turns out that one of the ways that Nvidia's driver handles the pre-LT
timeout for eDP panels is by providing a retry timeout in their link
training callbacks that we're expected to wait for. Up until now we didn't
pay any attention to this parameter.

So, start honoring the timeout if link training fails - and retry up to 3
times. The "3 times" bit comes from OpenRM's link training code.

[airlied: this fixes the panel on one of my laptops]
Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/r535.c   | 62 ++++++++++++-------
 1 file changed, 40 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/disp/r535.c
index 1b4f988df7ed..b287ab19a51f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
@@ -957,40 +957,58 @@ r535_dp_train_target(struct nvkm_outp *outp, u8 targe=
t, bool mst, u8 link_nr, u8
 {
 =09struct nvkm_disp *disp =3D outp->disp;
 =09NV0073_CTRL_DP_CTRL_PARAMS *ctrl;
-=09int ret;
-
-=09ctrl =3D nvkm_gsp_rm_ctrl_get(&disp->rm.objcom, NV0073_CTRL_CMD_DP_CTRL=
, sizeof(*ctrl));
-=09if (IS_ERR(ctrl))
-=09=09return PTR_ERR(ctrl);
+=09int ret, retries;
+=09u32 cmd, data;
=20
-=09ctrl->subDeviceInstance =3D 0;
-=09ctrl->displayId =3D BIT(outp->index);
-=09ctrl->cmd =3D NVDEF(NV0073_CTRL, DP_CMD, SET_LANE_COUNT, TRUE) |
-=09=09    NVDEF(NV0073_CTRL, DP_CMD, SET_LINK_BW, TRUE) |
-=09=09    NVDEF(NV0073_CTRL, DP_CMD, TRAIN_PHY_REPEATER, YES);
-=09ctrl->data =3D NVVAL(NV0073_CTRL, DP_DATA, SET_LANE_COUNT, link_nr) |
-=09=09     NVVAL(NV0073_CTRL, DP_DATA, SET_LINK_BW, link_bw) |
-=09=09     NVVAL(NV0073_CTRL, DP_DATA, TARGET, target);
+=09cmd =3D NVDEF(NV0073_CTRL, DP_CMD, SET_LANE_COUNT, TRUE) |
+=09      NVDEF(NV0073_CTRL, DP_CMD, SET_LINK_BW, TRUE) |
+=09      NVDEF(NV0073_CTRL, DP_CMD, TRAIN_PHY_REPEATER, YES);
+=09data =3D NVVAL(NV0073_CTRL, DP_DATA, SET_LANE_COUNT, link_nr) |
+=09       NVVAL(NV0073_CTRL, DP_DATA, SET_LINK_BW, link_bw) |
+=09       NVVAL(NV0073_CTRL, DP_DATA, TARGET, target);
=20
 =09if (mst)
-=09=09ctrl->cmd |=3D NVDEF(NV0073_CTRL, DP_CMD, SET_FORMAT_MODE, MULTI_STR=
EAM);
+=09=09cmd |=3D NVDEF(NV0073_CTRL, DP_CMD, SET_FORMAT_MODE, MULTI_STREAM);
=20
 =09if (outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP)
-=09=09ctrl->cmd |=3D NVDEF(NV0073_CTRL, DP_CMD, SET_ENHANCED_FRAMING, TRUE=
);
+=09=09cmd |=3D NVDEF(NV0073_CTRL, DP_CMD, SET_ENHANCED_FRAMING, TRUE);
=20
 =09if (target =3D=3D 0 &&
 =09     (outp->dp.dpcd[DPCD_RC02] & 0x20) &&
 =09    !(outp->dp.dpcd[DPCD_RC03] & DPCD_RC03_TPS4_SUPPORTED))
-=09    ctrl->cmd |=3D NVDEF(NV0073_CTRL, DP_CMD, POST_LT_ADJ_REQ_GRANTED, =
YES);
+=09    cmd |=3D NVDEF(NV0073_CTRL, DP_CMD, POST_LT_ADJ_REQ_GRANTED, YES);
=20
-=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
-=09if (ret) {
-=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
-=09=09return ret;
+=09/* We should retry up to 3 times, but only if GSP asks politely */
+=09for (retries =3D 0; retries < 3; ++retries) {
+=09=09ctrl =3D nvkm_gsp_rm_ctrl_get(&disp->rm.objcom, NV0073_CTRL_CMD_DP_C=
TRL,
+=09=09=09=09=09    sizeof(*ctrl));
+=09=09if (IS_ERR(ctrl))
+=09=09=09return PTR_ERR(ctrl);
+
+=09=09ctrl->subDeviceInstance =3D 0;
+=09=09ctrl->displayId =3D BIT(outp->index);
+=09=09ctrl->retryTimeMs =3D 0;
+=09=09ctrl->cmd =3D cmd;
+=09=09ctrl->data =3D data;
+
+=09=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl)=
);
+=09=09if (ret =3D=3D -EAGAIN && ctrl->retryTimeMs) {
+=09=09=09/* Device (likely an eDP panel) isn't ready yet, wait for the tim=
e specified
+=09=09=09 * by GSP before retrying again */
+=09=09=09nvkm_debug(&disp->engine.subdev,
+=09=09=09=09   "Waiting %dms for GSP LT panel delay before retrying\n",
+=09=09=09=09   ctrl->retryTimeMs);
+=09=09=09msleep(ctrl->retryTimeMs);
+=09=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+=09=09} else {
+=09=09=09/* GSP didn't say to retry, or we were successful */
+=09=09=09if (ctrl->err)
+=09=09=09=09ret =3D -EIO;
+=09=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+=09=09=09break;
+=09=09}
 =09}
=20
-=09ret =3D ctrl->err ? -EIO : 0;
-=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
 =09return ret;
 }
=20
--=20
2.43.0

