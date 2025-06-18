Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF4AADE19F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 05:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D741E10E1AD;
	Wed, 18 Jun 2025 03:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8477E10E1AD
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 03:22:54 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-70-qnOhr5xRPOW0AQQU5Il0fg-1; Tue,
 17 Jun 2025 23:22:50 -0400
X-MC-Unique: qnOhr5xRPOW0AQQU5Il0fg-1
X-Mimecast-MFC-AGG-ID: qnOhr5xRPOW0AQQU5Il0fg_1750216970
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DAC38180034E; Wed, 18 Jun 2025 03:22:49 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.24.91])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8379D19560A3; Wed, 18 Jun 2025 03:22:46 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau/gsp/fbsr: split fbsr suspend into two paths and
 reorder.
Date: Wed, 18 Jun 2025 13:22:44 +1000
Message-ID: <20250618032244.487604-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ceVUo5MxR4TnxBC93UlKMeACBmQowNF0XxBpCjfr9QM_1750216970
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
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

This is a fix/part revert for c21b039715ce

drm/nouveau/gsp: add hals for fbsr.suspend/resume()

For some undetermined reasons the above commit has caused a regression,
after a few s/r cycles, we start to get channel timeouts with robust
context 38 error (not defined in openrm).

Reordering this earlier seems to work for 535, but 570 wants to have
the suspend/resume data address for some reason.

This moves the suspend earlier but also splits the path in two
for r570. It seems to fix the issue.

It should also be noted that openrm doesn't do this, it keeps
the order the same, so there is something that doesn't make sense.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  | 18 ++++++++++++------
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c | 13 ++++++++++++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |  1 +
 4 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gp=
u/drm/nouveau/include/nvkm/subdev/gsp.h
index 226c7ec56b8e..e678a7389662 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -146,6 +146,7 @@ struct nvkm_gsp {
 =09=09struct nvkm_gsp_radix3 radix3;
 =09=09struct nvkm_gsp_mem meta;
 =09=09struct sg_table fbsr;
+=09=09u64 fbsr_size;
 =09} sr;
=20
 =09struct {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index baf42339f93e..8c69b654a489 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1719,6 +1719,9 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 =09=09u32 len =3D rm->api->gsp->sr_data_size(gsp);
 =09=09GspFwSRMeta *sr;
=20
+=09=09ret =3D rm->api->fbsr->suspend(gsp);
+=09=09if (ret)
+=09=09=09return ret;
 =09=09ret =3D nvkm_gsp_sg(gsp->subdev.device, len, &gsp->sr.sgt);
 =09=09if (ret)
 =09=09=09return ret;
@@ -1737,12 +1740,15 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 =09=09sr->sysmemAddrOfSuspendResumeData =3D gsp->sr.radix3.lvl0.addr;
 =09=09sr->sizeOfSuspendResumeData =3D len;
=20
-=09=09ret =3D rm->api->fbsr->suspend(gsp);
-=09=09if (ret) {
-=09=09=09nvkm_gsp_mem_dtor(&gsp->sr.meta);
-=09=09=09nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
-=09=09=09nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
-=09=09=09return ret;
+=09=09if (rm->api->fbsr->suspend2) {
+=09=09=09ret =3D rm->api->fbsr->suspend2(gsp);
+=09=09=09if (ret) {
+=09=09=09=09nvkm_gsp_mem_dtor(&gsp->sr.meta);
+=09=09=09=09nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
+=09=09=09=09nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
+=09=09=09=09gsp->rm->api->fbsr->resume(gsp);
+=09=09=09=09return ret;
+=09=09=09}
 =09=09}
 =09}
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drive=
rs/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
index 2945d5b4e570..d47dc5aa5e2b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
@@ -132,8 +132,18 @@ r570_fbsr_suspend(struct nvkm_gsp *gsp)
 =09if (ret)
 =09=09return ret;
=20
+=09gsp->sr.fbsr_size =3D size;
+=09return 0;
+}
+
+static int
+r570_fbsr_suspend2(struct nvkm_gsp *gsp)
+{
+=09struct nvkm_subdev *subdev =3D &gsp->subdev;
+=09struct nvkm_device *device =3D subdev->device;
+=09int ret;
 =09/* Initialise FBSR on RM. */
-=09ret =3D r570_fbsr_init(gsp, &gsp->sr.fbsr, size);
+=09ret =3D r570_fbsr_init(gsp, &gsp->sr.fbsr, gsp->sr.fbsr_size);
 =09if (ret) {
 =09=09nvkm_gsp_sg_free(device, &gsp->sr.fbsr);
 =09=09return ret;
@@ -145,5 +155,6 @@ r570_fbsr_suspend(struct nvkm_gsp *gsp)
 const struct nvkm_rm_api_fbsr
 r570_fbsr =3D {
 =09.suspend =3D r570_fbsr_suspend,
+=09.suspend2 =3D r570_fbsr_suspend2,
 =09.resume =3D r570_fbsr_resume,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 393ea775941f..c71904c3f9cc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -79,6 +79,7 @@ struct nvkm_rm_api {
=20
 =09const struct nvkm_rm_api_fbsr {
 =09=09int (*suspend)(struct nvkm_gsp *);
+=09=09int (*suspend2)(struct nvkm_gsp *);
 =09=09void (*resume)(struct nvkm_gsp *);
 =09} *fbsr;
=20
--=20
2.49.0

