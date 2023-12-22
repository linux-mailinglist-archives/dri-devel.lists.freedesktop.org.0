Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1F081C3F0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 05:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466A010E741;
	Fri, 22 Dec 2023 04:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8235D10E73A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 04:33:26 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-A9bP8Wl6N2-K0PCnHhy8AQ-1; Thu, 21 Dec 2023 23:33:23 -0500
X-MC-Unique: A9bP8Wl6N2-K0PCnHhy8AQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8894832D1A;
 Fri, 22 Dec 2023 04:33:22 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA06C2026D66;
 Fri, 22 Dec 2023 04:33:21 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 07/11] nouveau/gsp: convert gsp errors to generic errors
Date: Fri, 22 Dec 2023 14:31:56 +1000
Message-ID: <20231222043308.3090089-8-airlied@gmail.com>
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

This should let the upper layers retry as needed on EAGAIN.

There may be other values we will care about in the future, but
this covers our present needs.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 26 +++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index 774ca47b019f..54c1fbccc013 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -70,6 +70,20 @@ struct r535_gsp_msg {
=20
 #define GSP_MSG_HDR_SIZE offsetof(struct r535_gsp_msg, data)
=20
+static int
+r535_rpc_status_to_errno(uint32_t rpc_status)
+{
+       switch (rpc_status) {
+       case 0x55: /* NV_ERR_NOT_READY */
+       case 0x66: /* NV_ERR_TIMEOUT_RETRY */
+              return -EAGAIN;
+       case 0x51: /* NV_ERR_NO_MEMORY */
+               return -ENOMEM;
+       default:
+               return -EINVAL;
+       }
+}
+
 static void *
 r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
 {
@@ -584,8 +598,9 @@ r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *obje=
ct, void *argv, u32 repc)
 =09=09return rpc;
=20
 =09if (rpc->status) {
-=09=09nvkm_error(&gsp->subdev, "RM_ALLOC: 0x%x\n", rpc->status);
-=09=09ret =3D ERR_PTR(-EINVAL);
+=09=09ret =3D ERR_PTR(r535_rpc_status_to_errno(rpc->status));
+=09=09if (ret !=3D -EAGAIN)
+=09=09=09nvkm_error(&gsp->subdev, "RM_ALLOC: 0x%x\n", rpc->status);
 =09} else {
 =09=09ret =3D repc ? rpc->params : NULL;
 =09}
@@ -639,9 +654,10 @@ r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *obje=
ct, void *argv, u32 repc)
 =09=09return rpc;
=20
 =09if (rpc->status) {
-=09=09nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x fail=
ed: 0x%08x\n",
-=09=09=09   object->client->object.handle, object->handle, rpc->cmd, rpc->=
status);
-=09=09ret =3D ERR_PTR(-EINVAL);
+=09=09ret =3D ERR_PTR(r535_rpc_status_to_errno(rpc->status));
+=09=09if (ret !=3D -EAGAIN)
+=09=09=09nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x f=
ailed: 0x%08x\n",
+=09=09=09=09   object->client->object.handle, object->handle, rpc->cmd, rp=
c->status);
 =09} else {
 =09=09ret =3D repc ? rpc->params : NULL;
 =09}
--=20
2.43.0

