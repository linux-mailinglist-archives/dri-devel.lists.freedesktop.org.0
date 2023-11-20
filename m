Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B917F0A73
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 03:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CCB10E1D4;
	Mon, 20 Nov 2023 02:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7D110E1D4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 02:07:41 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-5ske6PDSOnyNBDT9uNJ2HA-1; Sun,
 19 Nov 2023 21:07:37 -0500
X-MC-Unique: 5ske6PDSOnyNBDT9uNJ2HA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C4641C05AAC;
 Mon, 20 Nov 2023 02:07:37 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C9F71121308;
 Mon, 20 Nov 2023 02:07:35 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau/gsp: fix getting max channel id for GSP
Date: Mon, 20 Nov 2023 12:07:33 +1000
Message-ID: <20231120020734.2505094-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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

The fence code uses the total number of channel ids to allocate a
bunch of memory for fencing. This is probably not the best way to
do this, but it's hard to fix right now.

The GSP code realises it can fit 8 channels into a USERD
page, so it claims it can support 256 channels max, but it then
allocates channel ids sparsely (0, 8, 16 etc).

This just exposes the multiplier to userspace so the fence code
gets things right, however I think this might all need more thought.

Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/274
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c | 7 ++++++-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h | 2 ++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/fifo/base.c
index 22443fe4a39f..8e36cdd0e5fb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
@@ -178,7 +178,12 @@ nvkm_fifo_info(struct nvkm_engine *engine, u64 mthd, u=
64 *data)
 =09=09return ret;
=20
 =09switch (mthd) {
-=09case NV_DEVICE_HOST_CHANNELS: *data =3D fifo->chid ? fifo->chid->nr : 0=
; return 0;
+=09case NV_DEVICE_HOST_CHANNELS:
+=09=09if (fifo->func->chid_total)
+=09=09=09*data =3D fifo->func->chid_total(fifo);
+=09=09else
+=09=09=09*data =3D fifo->chid ? fifo->chid->nr : 0;
+=09=09return 0;
 =09case NV_DEVICE_HOST_RUNLISTS:
 =09=09*data =3D 0;
 =09=09nvkm_runl_foreach(runl, fifo)
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h b/drivers/gpu/=
drm/nouveau/nvkm/engine/fifo/priv.h
index a0f3277605a5..c21e982b03a5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
@@ -17,6 +17,8 @@ struct nvkm_fifo_func {
=20
 =09int (*chid_nr)(struct nvkm_fifo *);
 =09int (*chid_ctor)(struct nvkm_fifo *, int nr);
+
+=09int (*chid_total)(struct nvkm_fifo *);
 =09int (*runq_nr)(struct nvkm_fifo *);
 =09int (*runl_ctor)(struct nvkm_fifo *);
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/fifo/r535.c
index b374d72fd1c1..1e9c0b113cb5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
@@ -641,6 +641,12 @@ r535_fifo_dtor(struct nvkm_fifo *fifo)
 =09kfree(fifo->func);
 }
=20
+static int
+r535_fifo_chid_total(struct nvkm_fifo *fifo)
+{
+=09return fifo->chid->nr * CHID_PER_USERD;
+}
+
 int
 r535_fifo_new(const struct nvkm_fifo_func *hw, struct nvkm_device *device,
 =09      enum nvkm_subdev_type type, int inst, struct nvkm_fifo **pfifo)
@@ -652,6 +658,7 @@ r535_fifo_new(const struct nvkm_fifo_func *hw, struct n=
vkm_device *device,
=20
 =09rm->dtor =3D r535_fifo_dtor;
 =09rm->runl_ctor =3D r535_fifo_runl_ctor;
+=09rm->chid_total =3D r535_fifo_chid_total;
 =09rm->runl =3D &r535_runl;
 =09rm->cgrp =3D hw->cgrp;
 =09rm->cgrp.func =3D &r535_cgrp;
--=20
2.42.0

