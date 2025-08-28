Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8C7B3AC3F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 23:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E515610EAD3;
	Thu, 28 Aug 2025 21:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 367 seconds by postgrey-1.36 at gabe;
 Thu, 28 Aug 2025 21:01:36 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3614D10EAD3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 21:01:36 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-103-Be-chznsMJCIctlWVnsw2Q-1; Thu,
 28 Aug 2025 16:55:24 -0400
X-MC-Unique: Be-chznsMJCIctlWVnsw2Q-1
X-Mimecast-MFC-AGG-ID: Be-chznsMJCIctlWVnsw2Q_1756414523
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 19B961956055; Thu, 28 Aug 2025 20:55:23 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.4])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BC85B1956095; Thu, 28 Aug 2025 20:55:20 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org,
	dakr@kernel.org
Subject: [PATCH 1/2] nouveau: fix disabling the nonstall irq due to storm code.
Date: Fri, 29 Aug 2025 06:55:16 +1000
Message-ID: <20250828205517.1553768-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z1Cm1uNbii3A-i0V1Ap6CkSPXB0xypmfljoeYgTgA6c_1756414523
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

Nouveau has code that when it gets an IRQ with no allowed handler
it disables it to avoid storms.

However with nonstall interrupts, we often disable them from
the drm driver, but still request their emission via the push submission.

Just don't disable nonstall irqs ever in normal operation, the
event handling code will filter them out, and the driver will
just enable/disable them at load time.

This fixes timeouts we've been seeing on/off for a long time,
but they became a lot more noticable on Blackwell.

This doesn't fix all of them, there is a subsequent fence emission
fix to fix the last few.

Fixes: 3ebd64aa3c4f ("drm/nouveau/intr: support multiple trees, and explici=
t interfaces")
Cc: stable@vger.kernel.org
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   |  2 ++
 .../gpu/drm/nouveau/nvkm/engine/fifo/ga100.c  | 22 ++++++++++++-------
 .../gpu/drm/nouveau/nvkm/engine/fifo/priv.h   |  2 ++
 .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    |  2 +-
 4 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/fifo/base.c
index fdffa0391b31..6fd4e60634fb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
@@ -350,6 +350,8 @@ nvkm_fifo_dtor(struct nvkm_engine *engine)
 =09nvkm_chid_unref(&fifo->chid);
=20
 =09nvkm_event_fini(&fifo->nonstall.event);
+=09if (fifo->func->nonstall_dtor)
+=09=09fifo->func->nonstall_dtor(fifo);
 =09mutex_destroy(&fifo->mutex);
=20
 =09if (fifo->func->dtor)
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/fifo/ga100.c
index e74493a4569e..81beae473122 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
@@ -517,19 +517,11 @@ ga100_fifo_nonstall_intr(struct nvkm_inth *inth)
 static void
 ga100_fifo_nonstall_block(struct nvkm_event *event, int type, int index)
 {
-=09struct nvkm_fifo *fifo =3D container_of(event, typeof(*fifo), nonstall.=
event);
-=09struct nvkm_runl *runl =3D nvkm_runl_get(fifo, index, 0);
-
-=09nvkm_inth_block(&runl->nonstall.inth);
 }
=20
 static void
 ga100_fifo_nonstall_allow(struct nvkm_event *event, int type, int index)
 {
-=09struct nvkm_fifo *fifo =3D container_of(event, typeof(*fifo), nonstall.=
event);
-=09struct nvkm_runl *runl =3D nvkm_runl_get(fifo, index, 0);
-
-=09nvkm_inth_allow(&runl->nonstall.inth);
 }
=20
 const struct nvkm_event_func
@@ -564,12 +556,25 @@ ga100_fifo_nonstall_ctor(struct nvkm_fifo *fifo)
 =09=09if (ret)
 =09=09=09return ret;
=20
+=09=09nvkm_inth_allow(&runl->nonstall.inth);
+
 =09=09nr =3D max(nr, runl->id + 1);
 =09}
=20
 =09return nr;
 }
=20
+void
+ga100_fifo_nonstall_dtor(struct nvkm_fifo *fifo)
+{
+=09struct nvkm_runl *runl;
+=09nvkm_runl_foreach(runl, fifo) {
+=09=09if (runl->nonstall.vector < 0)
+=09=09=09continue;
+=09=09nvkm_inth_block(&runl->nonstall.inth);
+=09}
+}
+
 int
 ga100_fifo_runl_ctor(struct nvkm_fifo *fifo)
 {
@@ -599,6 +604,7 @@ ga100_fifo =3D {
 =09.runl_ctor =3D ga100_fifo_runl_ctor,
 =09.mmu_fault =3D &tu102_fifo_mmu_fault,
 =09.nonstall_ctor =3D ga100_fifo_nonstall_ctor,
+=09.nonstall_dtor =3D ga100_fifo_nonstall_dtor,
 =09.nonstall =3D &ga100_fifo_nonstall,
 =09.runl =3D &ga100_runl,
 =09.runq =3D &ga100_runq,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h b/drivers/gpu/=
drm/nouveau/nvkm/engine/fifo/priv.h
index 5e81ae195329..fff1428ef267 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
@@ -41,6 +41,7 @@ struct nvkm_fifo_func {
 =09void (*start)(struct nvkm_fifo *, unsigned long *);
=20
 =09int (*nonstall_ctor)(struct nvkm_fifo *);
+=09void (*nonstall_dtor)(struct nvkm_fifo *);
 =09const struct nvkm_event_func *nonstall;
=20
 =09const struct nvkm_runl_func *runl;
@@ -200,6 +201,7 @@ u32 tu102_chan_doorbell_handle(struct nvkm_chan *);
=20
 int ga100_fifo_runl_ctor(struct nvkm_fifo *);
 int ga100_fifo_nonstall_ctor(struct nvkm_fifo *);
+void ga100_fifo_nonstall_dtor(struct nvkm_fifo *);
 extern const struct nvkm_event_func ga100_fifo_nonstall;
 extern const struct nvkm_runl_func ga100_runl;
 extern const struct nvkm_runq_func ga100_runq;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drive=
rs/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index 1ac5628c5140..b8be0a872e7a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -601,7 +601,7 @@ r535_fifo_new(const struct nvkm_fifo_func *hw, struct n=
vkm_device *device,
 =09rm->chan.func =3D &r535_chan;
 =09rm->nonstall =3D &ga100_fifo_nonstall;
 =09rm->nonstall_ctor =3D ga100_fifo_nonstall_ctor;
-
+=09rm->nonstall_dtor =3D ga100_fifo_nonstall_dtor;
 =09return nvkm_fifo_new_(rm, device, type, inst, pfifo);
 }
=20
--=20
2.50.1

