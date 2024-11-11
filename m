Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2DB9C371E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 04:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5F610E037;
	Mon, 11 Nov 2024 03:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Mon, 11 Nov 2024 03:47:43 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6363410E41A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 03:47:43 +0000 (UTC)
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-292-NG3JTZAbOR-mnJPY7ykctg-1; Sun,
 10 Nov 2024 22:41:34 -0500
X-MC-Unique: NG3JTZAbOR-mnJPY7ykctg-1
X-Mimecast-MFC-AGG-ID: NG3JTZAbOR-mnJPY7ykctg
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E162D19560B4; Mon, 11 Nov 2024 03:41:33 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.106])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 56FCF19560A3; Mon, 11 Nov 2024 03:41:31 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH 2/2] nouveau/dp: handle retries for AUX CH transfers with GSP.
Date: Mon, 11 Nov 2024 13:41:25 +1000
Message-ID: <20241111034126.2028401-2-airlied@gmail.com>
In-Reply-To: <20241111034126.2028401-1-airlied@gmail.com>
References: <20241111034126.2028401-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lJp3UzNQWVIh57rEStnHM4DgqaaRXZNLpvZBPFlqUXk_1731296494
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

From: Dave Airlie <airlied@redhat.com>

eb284f4b3781 drm/nouveau/dp: Honor GSP link training retry timeouts

tried to fix a problem with panel retires, however it appears
the auxch also needs the same treatment, so add the same retry
wrapper around it.

This fixes some eDP panels after a suspend/resume cycle.

Fixes: eb284f4b3781 ("drm/nouveau/dp: Honor GSP link training retry timeout=
s")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/r535.c   | 57 +++++++++++--------
 1 file changed, 34 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/disp/r535.c
index 8f9aa3463c3c..99110ab2f44d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
@@ -1060,33 +1060,44 @@ r535_dp_aux_xfer(struct nvkm_outp *outp, u8 type, u=
32 addr, u8 *data, u8 *psize)
 =09NV0073_CTRL_DP_AUXCH_CTRL_PARAMS *ctrl;
 =09u8 size =3D *psize;
 =09int ret;
+=09int retries;
=20
-=09ctrl =3D nvkm_gsp_rm_ctrl_get(&disp->rm.objcom, NV0073_CTRL_CMD_DP_AUXC=
H_CTRL, sizeof(*ctrl));
-=09if (IS_ERR(ctrl))
-=09=09return PTR_ERR(ctrl);
+=09for (retries =3D 0; retries < 3; ++retries) {
+=09=09ctrl =3D nvkm_gsp_rm_ctrl_get(&disp->rm.objcom, NV0073_CTRL_CMD_DP_A=
UXCH_CTRL, sizeof(*ctrl));
+=09=09if (IS_ERR(ctrl))
+=09=09=09return PTR_ERR(ctrl);
=20
-=09ctrl->subDeviceInstance =3D 0;
-=09ctrl->displayId =3D BIT(outp->index);
-=09ctrl->bAddrOnly =3D !size;
-=09ctrl->cmd =3D type;
-=09if (ctrl->bAddrOnly) {
-=09=09ctrl->cmd =3D NVDEF_SET(ctrl->cmd, NV0073_CTRL, DP_AUXCH_CMD, REQ_TY=
PE, WRITE);
-=09=09ctrl->cmd =3D NVDEF_SET(ctrl->cmd, NV0073_CTRL, DP_AUXCH_CMD,  I2C_M=
OT, FALSE);
-=09}
-=09ctrl->addr =3D addr;
-=09ctrl->size =3D !ctrl->bAddrOnly ? (size - 1) : 0;
-=09memcpy(ctrl->data, data, size);
+=09=09ctrl->subDeviceInstance =3D 0;
+=09=09ctrl->displayId =3D BIT(outp->index);
+=09=09ctrl->bAddrOnly =3D !size;
+=09=09ctrl->cmd =3D type;
+=09=09if (ctrl->bAddrOnly) {
+=09=09=09ctrl->cmd =3D NVDEF_SET(ctrl->cmd, NV0073_CTRL, DP_AUXCH_CMD, REQ=
_TYPE, WRITE);
+=09=09=09ctrl->cmd =3D NVDEF_SET(ctrl->cmd, NV0073_CTRL, DP_AUXCH_CMD,  I2=
C_MOT, FALSE);
+=09=09}
+=09=09ctrl->addr =3D addr;
+=09=09ctrl->size =3D !ctrl->bAddrOnly ? (size - 1) : 0;
+=09=09memcpy(ctrl->data, data, size);
=20
-=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
-=09if (ret) {
-=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
-=09=09return ret;
+=09=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl)=
);
+=09=09if ((ret =3D=3D -EAGAIN || ret =3D=3D -EBUSY) && ctrl->retryTimeMs) =
{
+=09=09=09/*
+=09=09=09 * Device (likely an eDP panel) isn't ready yet, wait for the tim=
e specified
+=09=09=09 * by GSP before retrying again
+=09=09=09 */
+=09=09=09nvkm_debug(&disp->engine.subdev,
+=09=09=09=09   "Waiting %dms for GSP LT panel delay before retrying in AUX=
\n",
+=09=09=09=09   ctrl->retryTimeMs);
+=09=09=09msleep(ctrl->retryTimeMs);
+=09=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+=09=09} else {
+=09=09=09memcpy(data, ctrl->data, size);
+=09=09=09*psize =3D ctrl->size;
+=09=09=09ret =3D ctrl->replyType;
+=09=09=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+=09=09=09break;
+=09=09}
 =09}
-
-=09memcpy(data, ctrl->data, size);
-=09*psize =3D ctrl->size;
-=09ret =3D ctrl->replyType;
-=09nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
 =09return ret;
 }
=20
--=20
2.47.0

