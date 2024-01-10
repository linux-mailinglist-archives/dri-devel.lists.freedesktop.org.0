Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDAF829202
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 02:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C830D10E546;
	Wed, 10 Jan 2024 01:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E447610E546
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 01:18:33 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-whklFtzLPHiLzAUd4BFuFg-1; Tue, 09 Jan 2024 20:18:30 -0500
X-MC-Unique: whklFtzLPHiLzAUd4BFuFg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F59282DFE0;
 Wed, 10 Jan 2024 01:18:29 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8964C2166B35;
 Wed, 10 Jan 2024 01:18:28 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau/gsp: handle engines in runl without nonstall
 interrupts.
Date: Wed, 10 Jan 2024 11:18:26 +1000
Message-ID: <20240110011826.3996289-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
Cc: nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

It appears on TU106 GPUs (2070), that some of the nvdec engines
are in the runlist but have no valid nonstall interrupt, nouveau
didn't handle that too well.

This should let nouveau/gsp work on those.

Cc: stable@vger.kernel.org # v6.7+
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c | 4 ++++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c  | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c   | 8 ++------
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/fifo/ga100.c
index c8ce7ff18713..e74493a4569e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
@@ -550,6 +550,10 @@ ga100_fifo_nonstall_ctor(struct nvkm_fifo *fifo)
 =09=09struct nvkm_engn *engn =3D list_first_entry(&runl->engns, typeof(*en=
gn), head);
=20
 =09=09runl->nonstall.vector =3D engn->func->nonstall(engn);
+
+=09=09/* if no nonstall vector just keep going */
+=09=09if (runl->nonstall.vector =3D=3D -1)
+=09=09=09continue;
 =09=09if (runl->nonstall.vector < 0) {
 =09=09=09RUNL_ERROR(runl, "nonstall %d", runl->nonstall.vector);
 =09=09=09return runl->nonstall.vector;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/fifo/r535.c
index b903785056b5..3454c7d29502 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
@@ -351,7 +351,7 @@ r535_engn_nonstall(struct nvkm_engn *engn)
 =09int ret;
=20
 =09ret =3D nvkm_gsp_intr_nonstall(subdev->device->gsp, subdev->type, subde=
v->inst);
-=09WARN_ON(ret < 0);
+=09WARN_ON(ret =3D=3D -ENOENT);
 =09return ret;
 }
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/base.c
index 04bceaa28a19..da1bebb896f7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -25,12 +25,8 @@ int
 nvkm_gsp_intr_nonstall(struct nvkm_gsp *gsp, enum nvkm_subdev_type type, i=
nt inst)
 {
 =09for (int i =3D 0; i < gsp->intr_nr; i++) {
-=09=09if (gsp->intr[i].type =3D=3D type && gsp->intr[i].inst =3D=3D inst) =
{
-=09=09=09if (gsp->intr[i].nonstall !=3D ~0)
-=09=09=09=09return gsp->intr[i].nonstall;
-
-=09=09=09return -EINVAL;
-=09=09}
+=09=09if (gsp->intr[i].type =3D=3D type && gsp->intr[i].inst =3D=3D inst)
+=09=09=09return gsp->intr[i].nonstall;
 =09}
=20
 =09return -ENOENT;
--=20
2.43.0

