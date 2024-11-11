Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515709C3722
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 04:47:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3A310E419;
	Mon, 11 Nov 2024 03:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455E310E419
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 03:47:55 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-428-PLEafD1iOK6bkVwbLzmkhw-1; Sun,
 10 Nov 2024 22:41:32 -0500
X-MC-Unique: PLEafD1iOK6bkVwbLzmkhw-1
X-Mimecast-MFC-AGG-ID: PLEafD1iOK6bkVwbLzmkhw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 72FA919560BA; Mon, 11 Nov 2024 03:41:31 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.106])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F337019560A3; Mon, 11 Nov 2024 03:41:29 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH 1/2] nouveau: handle EBUSY and EAGAIN for GSP aux errors.
Date: Mon, 11 Nov 2024 13:41:24 +1000
Message-ID: <20241111034126.2028401-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NsLFUjYqD0BcCiFAvhAIxONM6fEW2Uqjk7vLXV5jULk_1731296491
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

The upper layer transfer functions expect EBUSY as a return
for when retries should be done.

Fix the AUX error translation, but also check for both errors
in a few places.

Fixes: eb284f4b3781 ("drm/nouveau/dp: Honor GSP link training retry timeout=
s")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/disp/r535.c
index 027867c2a8c5..8f9aa3463c3c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
@@ -992,7 +992,7 @@ r535_dp_train_target(struct nvkm_outp *outp, u8 target,=
 bool mst, u8 link_nr, u8
 =09=09ctrl->data =3D data;
=20
 =09=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl)=
);
-=09=09if (ret =3D=3D -EAGAIN && ctrl->retryTimeMs) {
+=09=09if ((ret =3D=3D -EAGAIN || ret =3D=3D -EBUSY) && ctrl->retryTimeMs) =
{
 =09=09=09/*
 =09=09=09 * Device (likely an eDP panel) isn't ready yet, wait for the tim=
e specified
 =09=09=09 * by GSP before retrying again
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index cf58f9da9139..d586aea30898 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -78,7 +78,7 @@ r535_rpc_status_to_errno(uint32_t rpc_status)
 =09switch (rpc_status) {
 =09case 0x55: /* NV_ERR_NOT_READY */
 =09case 0x66: /* NV_ERR_TIMEOUT_RETRY */
-=09=09return -EAGAIN;
+=09=09return -EBUSY;
 =09case 0x51: /* NV_ERR_NO_MEMORY */
 =09=09return -ENOMEM;
 =09default:
@@ -601,7 +601,7 @@ r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *obje=
ct, void *argv, u32 repc)
=20
 =09if (rpc->status) {
 =09=09ret =3D ERR_PTR(r535_rpc_status_to_errno(rpc->status));
-=09=09if (PTR_ERR(ret) !=3D -EAGAIN)
+=09=09if (PTR_ERR(ret) !=3D -EAGAIN && PTR_ERR(ret) !=3D -EBUSY)
 =09=09=09nvkm_error(&gsp->subdev, "RM_ALLOC: 0x%x\n", rpc->status);
 =09} else {
 =09=09ret =3D repc ? rpc->params : NULL;
@@ -660,7 +660,7 @@ r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *objec=
t, void **argv, u32 repc)
=20
 =09if (rpc->status) {
 =09=09ret =3D r535_rpc_status_to_errno(rpc->status);
-=09=09if (ret !=3D -EAGAIN)
+=09=09if (ret !=3D -EAGAIN && ret !=3D -EBUSY)
 =09=09=09nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x f=
ailed: 0x%08x\n",
 =09=09=09=09   object->client->object.handle, object->handle, rpc->cmd, rp=
c->status);
 =09}
--=20
2.47.0

