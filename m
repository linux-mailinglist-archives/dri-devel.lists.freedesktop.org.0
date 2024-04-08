Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6610A89B7CC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 08:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E9D112145;
	Mon,  8 Apr 2024 06:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835D410F9F0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 06:43:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-591-U-eJ-QBXN_OmDCw0hOp7bA-1; Mon,
 08 Apr 2024 02:43:06 -0400
X-MC-Unique: U-eJ-QBXN_OmDCw0hOp7bA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9939929AC004;
 Mon,  8 Apr 2024 06:43:06 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 944D240B4979;
 Mon,  8 Apr 2024 06:43:05 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau: fix devinit paths to only handle display on GSP.
Date: Mon,  8 Apr 2024 16:42:43 +1000
Message-ID: <20240408064243.2219527-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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

This reverts:
nouveau/gsp: don't check devinit disable on GSP.
and applies a further fix.

It turns out the open gpu driver, checks this register, but only for displa=
y.

Match that behaviour and only disable displays on turings.

Fixes: 5d4e8ae6e57b ("nouveau/gsp: don't check devinit disable on GSP.")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c | 12 ++++++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c  |  1 +
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c b/drivers/=
gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
index 7bcbc4895ec2..271bfa038f5b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
@@ -25,6 +25,7 @@
=20
 #include <subdev/bios.h>
 #include <subdev/bios/init.h>
+#include <subdev/gsp.h>
=20
 void
 gm107_devinit_disable(struct nvkm_devinit *init)
@@ -33,10 +34,13 @@ gm107_devinit_disable(struct nvkm_devinit *init)
 =09u32 r021c00 =3D nvkm_rd32(device, 0x021c00);
 =09u32 r021c04 =3D nvkm_rd32(device, 0x021c04);
=20
-=09if (r021c00 & 0x00000001)
-=09=09nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
-=09if (r021c00 & 0x00000004)
-=09=09nvkm_subdev_disable(device, NVKM_ENGINE_CE, 2);
+=09/* gsp only wants to enable/disable display */
+=09if (!nvkm_gsp_rm(device->gsp)) {
+=09=09if (r021c00 & 0x00000001)
+=09=09=09nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
+=09=09if (r021c00 & 0x00000004)
+=09=09=09nvkm_subdev_disable(device, NVKM_ENGINE_CE, 2);
+=09}
 =09if (r021c04 & 0x00000001)
 =09=09nvkm_subdev_disable(device, NVKM_ENGINE_DISP, 0);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/devinit/r535.c
index 11b4c9c274a1..666eb93b1742 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
@@ -41,6 +41,7 @@ r535_devinit_new(const struct nvkm_devinit_func *hw,
=20
 =09rm->dtor =3D r535_devinit_dtor;
 =09rm->post =3D hw->post;
+=09rm->disable =3D hw->disable;
=20
 =09ret =3D nv50_devinit_new_(rm, device, type, inst, pdevinit);
 =09if (ret)
--=20
2.44.0

