Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H72NqaGgWmzGwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 06:24:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4D6D4A4A
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 06:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF94710E543;
	Tue,  3 Feb 2026 05:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9425010E53E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 05:24:50 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-524-bIWHdaoVPDqfRLzJwX5zAQ-1; Tue,
 03 Feb 2026 00:24:46 -0500
X-MC-Unique: bIWHdaoVPDqfRLzJwX5zAQ-1
X-Mimecast-MFC-AGG-ID: bIWHdaoVPDqfRLzJwX5zAQ_1770096285
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3007E1956048; Tue,  3 Feb 2026 05:24:45 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.75])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 08CE11800285; Tue,  3 Feb 2026 05:24:41 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH 2/3] nouveau: add a third state to the fini handler.
Date: Tue,  3 Feb 2026 15:21:12 +1000
Message-ID: <20260203052431.2219998-3-airlied@gmail.com>
In-Reply-To: <20260203052431.2219998-1-airlied@gmail.com>
References: <20260203052431.2219998-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jK8KF9tDNgrc5VwAT7pqyYWYhQ45QzMn3ppVeSEGTFU_1770096285
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 6A4D6D4A4A
X-Rspamd-Action: no action

From: Dave Airlie <airlied@redhat.com>

This is just refactoring to allow the lower layers to distinguish
between suspend and runtime suspend.

GSP 570 needs to set a flag with the GPU is going into GCOFF,
this flag taken from the opengpu driver is set whenever runtime
suspend is enterning GCOFF but not for normal suspend paths.

This just refactors the code, a subsequent patch use the information.

Signed-off-by: Dave Airlie <airlied@redhat.com>
Fixes: 53dac0623853 ("drm/nouveau/gsp: add support for 570.144")
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/nouveau/include/nvif/client.h |  2 +-
 drivers/gpu/drm/nouveau/include/nvif/driver.h |  2 +-
 .../drm/nouveau/include/nvkm/core/device.h    |  3 ++-
 .../drm/nouveau/include/nvkm/core/engine.h    |  2 +-
 .../drm/nouveau/include/nvkm/core/object.h    |  5 +++--
 .../drm/nouveau/include/nvkm/core/oproxy.h    |  2 +-
 .../drm/nouveau/include/nvkm/core/subdev.h    |  4 ++--
 .../nouveau/include/nvkm/core/suspend_state.h | 11 ++++++++++
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_nvif.c        | 10 +++++++--
 drivers/gpu/drm/nouveau/nvif/client.c         |  4 ++--
 drivers/gpu/drm/nouveau/nvkm/core/engine.c    |  4 ++--
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     |  4 ++--
 drivers/gpu/drm/nouveau/nvkm/core/object.c    | 20 +++++++++++++----
 drivers/gpu/drm/nouveau/nvkm/core/oproxy.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c    | 18 ++++++++++++---
 drivers/gpu/drm/nouveau/nvkm/core/uevent.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/ce/ga100.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/device/base.c | 22 ++++++++++++++-----
 .../gpu/drm/nouveau/nvkm/engine/device/pci.c  |  4 ++--
 .../gpu/drm/nouveau/nvkm/engine/device/priv.h |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/device/user.c |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/base.c   |  4 ++--
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.c   |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/falcon.c  |  4 ++--
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  |  6 ++---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c |  4 ++--
 .../gpu/drm/nouveau/nvkm/engine/gr/gf100.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.h |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c |  4 ++--
 .../gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/sec2/base.c   |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/xtensa.c  |  4 ++--
 .../gpu/drm/nouveau/nvkm/subdev/acr/base.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/bar/base.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/clk/base.c    |  2 +-
 .../drm/nouveau/nvkm/subdev/devinit/base.c    |  4 ++--
 .../gpu/drm/nouveau/nvkm/subdev/fault/base.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/fault/user.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gpio/base.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/base.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  8 +++----
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/i2c/base.c    |  2 +-
 .../drm/nouveau/nvkm/subdev/instmem/base.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/base.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/pmu/base.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/therm/base.c  |  6 ++---
 .../gpu/drm/nouveau/nvkm/subdev/timer/base.c  |  2 +-
 56 files changed, 139 insertions(+), 84 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/suspend_state=
.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/client.h b/drivers/gpu/dr=
m/nouveau/include/nvif/client.h
index 03f1d564eb12..b698c74306f8 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/client.h
@@ -11,7 +11,7 @@ struct nvif_client {
=20
 int  nvif_client_ctor(struct nvif_client *parent, const char *name, struct=
 nvif_client *);
 void nvif_client_dtor(struct nvif_client *);
-int  nvif_client_suspend(struct nvif_client *);
+int  nvif_client_suspend(struct nvif_client *, bool);
 int  nvif_client_resume(struct nvif_client *);
=20
 /*XXX*/
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driver.h b/drivers/gpu/dr=
m/nouveau/include/nvif/driver.h
index 7b08ff769039..61c8a177b28f 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driver.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driver.h
@@ -8,7 +8,7 @@ struct nvif_driver {
 =09const char *name;
 =09int (*init)(const char *name, u64 device, const char *cfg,
 =09=09    const char *dbg, void **priv);
-=09int (*suspend)(void *priv);
+=09int (*suspend)(void *priv, bool runtime);
 =09int (*resume)(void *priv);
 =09int (*ioctl)(void *priv, void *data, u32 size, void **hack);
 =09void __iomem *(*map)(void *priv, u64 handle, u32 size);
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/g=
pu/drm/nouveau/include/nvkm/core/device.h
index 99579e7b9376..954a89d43bad 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
@@ -2,6 +2,7 @@
 #ifndef __NVKM_DEVICE_H__
 #define __NVKM_DEVICE_H__
 #include <core/oclass.h>
+#include <core/suspend_state.h>
 #include <core/intr.h>
 enum nvkm_subdev_type;
=20
@@ -93,7 +94,7 @@ struct nvkm_device_func {
 =09void *(*dtor)(struct nvkm_device *);
 =09int (*preinit)(struct nvkm_device *);
 =09int (*init)(struct nvkm_device *);
-=09void (*fini)(struct nvkm_device *, bool suspend);
+=09void (*fini)(struct nvkm_device *, enum nvkm_suspend_state suspend);
 =09int (*irq)(struct nvkm_device *);
 =09resource_size_t (*resource_addr)(struct nvkm_device *, enum nvkm_bar_id=
);
 =09resource_size_t (*resource_size)(struct nvkm_device *, enum nvkm_bar_id=
);
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h b/drivers/g=
pu/drm/nouveau/include/nvkm/core/engine.h
index 738899fcf30b..1e97be6c6564 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h
@@ -20,7 +20,7 @@ struct nvkm_engine_func {
 =09int (*oneinit)(struct nvkm_engine *);
 =09int (*info)(struct nvkm_engine *, u64 mthd, u64 *data);
 =09int (*init)(struct nvkm_engine *);
-=09int (*fini)(struct nvkm_engine *, bool suspend);
+=09int (*fini)(struct nvkm_engine *, enum nvkm_suspend_state suspend);
 =09int (*reset)(struct nvkm_engine *);
 =09int (*nonstall)(struct nvkm_engine *);
 =09void (*intr)(struct nvkm_engine *);
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h b/drivers/g=
pu/drm/nouveau/include/nvkm/core/object.h
index 10107ef3ca49..54d356154274 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
@@ -2,6 +2,7 @@
 #ifndef __NVKM_OBJECT_H__
 #define __NVKM_OBJECT_H__
 #include <core/oclass.h>
+#include <core/suspend_state.h>
 struct nvkm_event;
 struct nvkm_gpuobj;
 struct nvkm_uevent;
@@ -27,7 +28,7 @@ enum nvkm_object_map {
 struct nvkm_object_func {
 =09void *(*dtor)(struct nvkm_object *);
 =09int (*init)(struct nvkm_object *);
-=09int (*fini)(struct nvkm_object *, bool suspend);
+=09int (*fini)(struct nvkm_object *, enum nvkm_suspend_state suspend);
 =09int (*mthd)(struct nvkm_object *, u32 mthd, void *data, u32 size);
 =09int (*ntfy)(struct nvkm_object *, u32 mthd, struct nvkm_event **);
 =09int (*map)(struct nvkm_object *, void *argv, u32 argc,
@@ -49,7 +50,7 @@ int nvkm_object_new(const struct nvkm_oclass *, void *dat=
a, u32 size,
 void nvkm_object_del(struct nvkm_object **);
 void *nvkm_object_dtor(struct nvkm_object *);
 int nvkm_object_init(struct nvkm_object *);
-int nvkm_object_fini(struct nvkm_object *, bool suspend);
+int nvkm_object_fini(struct nvkm_object *, enum nvkm_suspend_state);
 int nvkm_object_mthd(struct nvkm_object *, u32 mthd, void *data, u32 size)=
;
 int nvkm_object_ntfy(struct nvkm_object *, u32 mthd, struct nvkm_event **)=
;
 int nvkm_object_map(struct nvkm_object *, void *argv, u32 argc,
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/oproxy.h b/drivers/g=
pu/drm/nouveau/include/nvkm/core/oproxy.h
index 0e70a9afba33..cf66aee4d111 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/oproxy.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/oproxy.h
@@ -13,7 +13,7 @@ struct nvkm_oproxy {
 struct nvkm_oproxy_func {
 =09void (*dtor[2])(struct nvkm_oproxy *);
 =09int  (*init[2])(struct nvkm_oproxy *);
-=09int  (*fini[2])(struct nvkm_oproxy *, bool suspend);
+=09int  (*fini[2])(struct nvkm_oproxy *, enum nvkm_suspend_state suspend);
 };
=20
 void nvkm_oproxy_ctor(const struct nvkm_oproxy_func *,
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h b/drivers/g=
pu/drm/nouveau/include/nvkm/core/subdev.h
index bce6e1ba09ea..bd6b1b658e40 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
@@ -40,7 +40,7 @@ struct nvkm_subdev_func {
 =09int (*oneinit)(struct nvkm_subdev *);
 =09int (*info)(struct nvkm_subdev *, u64 mthd, u64 *data);
 =09int (*init)(struct nvkm_subdev *);
-=09int (*fini)(struct nvkm_subdev *, bool suspend);
+=09int (*fini)(struct nvkm_subdev *, enum nvkm_suspend_state suspend);
 =09void (*intr)(struct nvkm_subdev *);
 };
=20
@@ -65,7 +65,7 @@ void nvkm_subdev_unref(struct nvkm_subdev *);
 int  nvkm_subdev_preinit(struct nvkm_subdev *);
 int  nvkm_subdev_oneinit(struct nvkm_subdev *);
 int  nvkm_subdev_init(struct nvkm_subdev *);
-int  nvkm_subdev_fini(struct nvkm_subdev *, bool suspend);
+int  nvkm_subdev_fini(struct nvkm_subdev *, enum nvkm_suspend_state suspen=
d);
 int  nvkm_subdev_info(struct nvkm_subdev *, u64, u64 *);
 void nvkm_subdev_intr(struct nvkm_subdev *);
=20
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/suspend_state.h b/dr=
ivers/gpu/drm/nouveau/include/nvkm/core/suspend_state.h
new file mode 100644
index 000000000000..134120fb71f4
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/suspend_state.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_SUSPEND_STATE_H__
+#define __NVKM_SUSPEND_STATE_H__
+
+enum nvkm_suspend_state {
+=09NVKM_POWEROFF,
+=09NVKM_SUSPEND,
+=09NVKM_RUNTIME_SUSPEND,
+};
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouvea=
u/nouveau_drm.c
index 1527b801f013..dc469e571c0a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -983,7 +983,7 @@ nouveau_do_suspend(struct nouveau_drm *drm, bool runtim=
e)
 =09}
=20
 =09NV_DEBUG(drm, "suspending object tree...\n");
-=09ret =3D nvif_client_suspend(&drm->_client);
+=09ret =3D nvif_client_suspend(&drm->_client, runtime);
 =09if (ret)
 =09=09goto fail_client;
=20
diff --git a/drivers/gpu/drm/nouveau/nouveau_nvif.c b/drivers/gpu/drm/nouve=
au/nouveau_nvif.c
index adb802421fda..eeb4ebbc16bf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_nvif.c
+++ b/drivers/gpu/drm/nouveau/nouveau_nvif.c
@@ -62,10 +62,16 @@ nvkm_client_resume(void *priv)
 }
=20
 static int
-nvkm_client_suspend(void *priv)
+nvkm_client_suspend(void *priv, bool runtime)
 {
 =09struct nvkm_client *client =3D priv;
-=09return nvkm_object_fini(&client->object, true);
+=09enum nvkm_suspend_state state;
+
+=09if (runtime)
+=09=09state =3D NVKM_RUNTIME_SUSPEND;
+=09else
+=09=09state =3D NVKM_SUSPEND;
+=09return nvkm_object_fini(&client->object, state);
 }
=20
 static int
diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouvea=
u/nvif/client.c
index fdf5054ed7d8..36d3c99786bd 100644
--- a/drivers/gpu/drm/nouveau/nvif/client.c
+++ b/drivers/gpu/drm/nouveau/nvif/client.c
@@ -30,9 +30,9 @@
 #include <nvif/if0000.h>
=20
 int
-nvif_client_suspend(struct nvif_client *client)
+nvif_client_suspend(struct nvif_client *client, bool runtime)
 {
-=09return client->driver->suspend(client->object.priv);
+=09return client->driver->suspend(client->object.priv, runtime);
 }
=20
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/engine.c b/drivers/gpu/drm/n=
ouveau/nvkm/core/engine.c
index 36a31e9eea22..5bf62940d7be 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/engine.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/engine.c
@@ -41,7 +41,7 @@ nvkm_engine_reset(struct nvkm_engine *engine)
 =09if (engine->func->reset)
 =09=09return engine->func->reset(engine);
=20
-=09nvkm_subdev_fini(&engine->subdev, false);
+=09nvkm_subdev_fini(&engine->subdev, NVKM_POWEROFF);
 =09return nvkm_subdev_init(&engine->subdev);
 }
=20
@@ -98,7 +98,7 @@ nvkm_engine_info(struct nvkm_subdev *subdev, u64 mthd, u6=
4 *data)
 }
=20
 static int
-nvkm_engine_fini(struct nvkm_subdev *subdev, bool suspend)
+nvkm_engine_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state suspe=
nd)
 {
 =09struct nvkm_engine *engine =3D nvkm_engine(subdev);
 =09if (engine->func->fini)
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/no=
uveau/nvkm/core/ioctl.c
index 45051a1249da..b8fc9be67851 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -141,7 +141,7 @@ nvkm_ioctl_new(struct nvkm_client *client,
 =09=09=09}
 =09=09=09ret =3D -EEXIST;
 =09=09}
-=09=09nvkm_object_fini(object, false);
+=09=09nvkm_object_fini(object, NVKM_POWEROFF);
 =09}
=20
 =09nvkm_object_del(&object);
@@ -160,7 +160,7 @@ nvkm_ioctl_del(struct nvkm_client *client,
 =09nvif_ioctl(object, "delete size %d\n", size);
 =09if (!(ret =3D nvif_unvers(ret, &data, &size, args->none))) {
 =09=09nvif_ioctl(object, "delete\n");
-=09=09nvkm_object_fini(object, false);
+=09=09nvkm_object_fini(object, NVKM_POWEROFF);
 =09=09nvkm_object_del(&object);
 =09}
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm/n=
ouveau/nvkm/core/object.c
index 390c265cf8af..af9f00f74c28 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
@@ -142,13 +142,25 @@ nvkm_object_bind(struct nvkm_object *object, struct n=
vkm_gpuobj *gpuobj,
 }
=20
 int
-nvkm_object_fini(struct nvkm_object *object, bool suspend)
+nvkm_object_fini(struct nvkm_object *object, enum nvkm_suspend_state suspe=
nd)
 {
-=09const char *action =3D suspend ? "suspend" : "fini";
+=09const char *action;
 =09struct nvkm_object *child;
 =09s64 time;
 =09int ret;
=20
+=09switch (suspend) {
+=09case NVKM_POWEROFF:
+=09default:
+=09=09action =3D "fini";
+=09=09break;
+=09case NVKM_SUSPEND:
+=09=09action =3D "suspend";
+=09=09break;
+=09case NVKM_RUNTIME_SUSPEND:
+=09=09action =3D "runtime";
+=09=09break;
+=09}
 =09nvif_debug(object, "%s children...\n", action);
 =09time =3D ktime_to_us(ktime_get());
 =09list_for_each_entry_reverse(child, &object->tree, head) {
@@ -212,11 +224,11 @@ nvkm_object_init(struct nvkm_object *object)
=20
 fail_child:
 =09list_for_each_entry_continue_reverse(child, &object->tree, head)
-=09=09nvkm_object_fini(child, false);
+=09=09nvkm_object_fini(child, NVKM_POWEROFF);
 fail:
 =09nvif_error(object, "init failed with %d\n", ret);
 =09if (object->func->fini)
-=09=09object->func->fini(object, false);
+=09=09object->func->fini(object, NVKM_POWEROFF);
 =09return ret;
 }
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c b/drivers/gpu/drm/n=
ouveau/nvkm/core/oproxy.c
index 5db80d1780f0..7c9edf752768 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
@@ -87,7 +87,7 @@ nvkm_oproxy_uevent(struct nvkm_object *object, void *argv=
, u32 argc,
 }
=20
 static int
-nvkm_oproxy_fini(struct nvkm_object *object, bool suspend)
+nvkm_oproxy_fini(struct nvkm_object *object, enum nvkm_suspend_state suspe=
nd)
 {
 =09struct nvkm_oproxy *oproxy =3D nvkm_oproxy(object);
 =09int ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/subdev.c b/drivers/gpu/drm/n=
ouveau/nvkm/core/subdev.c
index 6c20e827a069..d184655757ee 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
@@ -51,12 +51,24 @@ nvkm_subdev_info(struct nvkm_subdev *subdev, u64 mthd, =
u64 *data)
 }
=20
 int
-nvkm_subdev_fini(struct nvkm_subdev *subdev, bool suspend)
+nvkm_subdev_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state suspe=
nd)
 {
 =09struct nvkm_device *device =3D subdev->device;
-=09const char *action =3D suspend ? "suspend" : subdev->use.enabled ? "fin=
i" : "reset";
+=09const char *action;
 =09s64 time;
=20
+=09switch (suspend) {
+=09case NVKM_POWEROFF:
+=09default:
+=09=09action =3D subdev->use.enabled ? "fini": "reset";
+=09=09break;
+=09case NVKM_SUSPEND:
+=09=09action =3D "suspend";
+=09=09break;
+=09case NVKM_RUNTIME_SUSPEND:
+=09=09action =3D "runtime";
+=09=09break;
+=09}
 =09nvkm_trace(subdev, "%s running...\n", action);
 =09time =3D ktime_to_us(ktime_get());
=20
@@ -186,7 +198,7 @@ void
 nvkm_subdev_unref(struct nvkm_subdev *subdev)
 {
 =09if (refcount_dec_and_mutex_lock(&subdev->use.refcount, &subdev->use.mut=
ex)) {
-=09=09nvkm_subdev_fini(subdev, false);
+=09=09nvkm_subdev_fini(subdev, NVKM_POWEROFF);
 =09=09mutex_unlock(&subdev->use.mutex);
 =09}
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/uevent.c b/drivers/gpu/drm/n=
ouveau/nvkm/core/uevent.c
index cc254c390a57..46beb6e470ee 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
@@ -73,7 +73,7 @@ nvkm_uevent_mthd(struct nvkm_object *object, u32 mthd, vo=
id *argv, u32 argc)
 }
=20
 static int
-nvkm_uevent_fini(struct nvkm_object *object, bool suspend)
+nvkm_uevent_fini(struct nvkm_object *object, enum nvkm_suspend_state suspe=
nd)
 {
 =09struct nvkm_uevent *uevent =3D nvkm_uevent(object);
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c b/drivers/gpu/d=
rm/nouveau/nvkm/engine/ce/ga100.c
index 1c0c60138706..1a3caf697608 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
@@ -46,7 +46,7 @@ ga100_ce_nonstall(struct nvkm_engine *engine)
 }
=20
 int
-ga100_ce_fini(struct nvkm_engine *engine, bool suspend)
+ga100_ce_fini(struct nvkm_engine *engine, enum nvkm_suspend_state suspend)
 {
 =09nvkm_inth_block(&engine->subdev.inth);
 =09return 0;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h b/drivers/gpu/dr=
m/nouveau/nvkm/engine/ce/priv.h
index 34fd2657134b..f07b45853310 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
@@ -14,7 +14,7 @@ extern const struct nvkm_object_func gv100_ce_cclass;
=20
 int ga100_ce_oneinit(struct nvkm_engine *);
 int ga100_ce_init(struct nvkm_engine *);
-int ga100_ce_fini(struct nvkm_engine *, bool);
+int ga100_ce_fini(struct nvkm_engine *, enum nvkm_suspend_state);
 int ga100_ce_nonstall(struct nvkm_engine *);
=20
 u32 gb202_ce_grce_mask(struct nvkm_device *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/device/base.c
index 2517b65d8faa..b101e14f841e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2936,13 +2936,25 @@ nvkm_device_engine(struct nvkm_device *device, int =
type, int inst)
 }
=20
 int
-nvkm_device_fini(struct nvkm_device *device, bool suspend)
+nvkm_device_fini(struct nvkm_device *device, enum nvkm_suspend_state suspe=
nd)
 {
-=09const char *action =3D suspend ? "suspend" : "fini";
+=09const char *action;
 =09struct nvkm_subdev *subdev;
 =09int ret;
 =09s64 time;
=20
+=09switch (suspend) {
+=09case NVKM_POWEROFF:
+=09default:
+=09=09action =3D "fini";
+=09=09break;
+=09case NVKM_SUSPEND:
+=09=09action =3D "suspend";
+=09=09break;
+=09case NVKM_RUNTIME_SUSPEND:
+=09=09action =3D "runtime";
+=09=09break;
+=09}
 =09nvdev_trace(device, "%s running...\n", action);
 =09time =3D ktime_to_us(ktime_get());
=20
@@ -3032,7 +3044,7 @@ nvkm_device_init(struct nvkm_device *device)
 =09if (ret)
 =09=09return ret;
=20
-=09nvkm_device_fini(device, false);
+=09nvkm_device_fini(device, NVKM_POWEROFF);
=20
 =09nvdev_trace(device, "init running...\n");
 =09time =3D ktime_to_us(ktime_get());
@@ -3060,9 +3072,9 @@ nvkm_device_init(struct nvkm_device *device)
=20
 fail_subdev:
 =09list_for_each_entry_from(subdev, &device->subdev, head)
-=09=09nvkm_subdev_fini(subdev, false);
+=09=09nvkm_subdev_fini(subdev, NVKM_POWEROFF);
 fail:
-=09nvkm_device_fini(device, false);
+=09nvkm_device_fini(device, NVKM_POWEROFF);
=20
 =09nvdev_error(device, "init failed with %d\n", ret);
 =09return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/device/pci.c
index 8f0261a0d618..4c29b60460d4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
@@ -1605,10 +1605,10 @@ nvkm_device_pci_irq(struct nvkm_device *device)
 }
=20
 static void
-nvkm_device_pci_fini(struct nvkm_device *device, bool suspend)
+nvkm_device_pci_fini(struct nvkm_device *device, enum nvkm_suspend_state s=
uspend)
 {
 =09struct nvkm_device_pci *pdev =3D nvkm_device_pci(device);
-=09if (suspend) {
+=09if (suspend !=3D NVKM_POWEROFF) {
 =09=09pci_disable_device(pdev->pdev);
 =09=09pdev->suspend =3D true;
 =09}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h b/drivers/gp=
u/drm/nouveau/nvkm/engine/device/priv.h
index 75ee7506d443..d0c40f034244 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
@@ -56,5 +56,5 @@ int  nvkm_device_ctor(const struct nvkm_device_func *,
 =09=09      const char *name, const char *cfg, const char *dbg,
 =09=09      struct nvkm_device *);
 int  nvkm_device_init(struct nvkm_device *);
-int  nvkm_device_fini(struct nvkm_device *, bool suspend);
+int  nvkm_device_fini(struct nvkm_device *, enum nvkm_suspend_state suspen=
d);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/device/user.c
index 58191b7a0494..32ff3181f47b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -218,7 +218,7 @@ nvkm_udevice_map(struct nvkm_object *object, void *argv=
, u32 argc,
 }
=20
 static int
-nvkm_udevice_fini(struct nvkm_object *object, bool suspend)
+nvkm_udevice_fini(struct nvkm_object *object, enum nvkm_suspend_state susp=
end)
 {
 =09struct nvkm_udevice *udev =3D nvkm_udevice(object);
 =09struct nvkm_device *device =3D udev->device;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/disp/base.c
index b24eb1e560bc..84745f60912e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
@@ -99,13 +99,13 @@ nvkm_disp_intr(struct nvkm_engine *engine)
 }
=20
 static int
-nvkm_disp_fini(struct nvkm_engine *engine, bool suspend)
+nvkm_disp_fini(struct nvkm_engine *engine, enum nvkm_suspend_state suspend=
)
 {
 =09struct nvkm_disp *disp =3D nvkm_disp(engine);
 =09struct nvkm_outp *outp;
=20
 =09if (disp->func->fini)
-=09=09disp->func->fini(disp, suspend);
+=09=09disp->func->fini(disp, suspend !=3D NVKM_POWEROFF);
=20
 =09list_for_each_entry(outp, &disp->outps, head) {
 =09=09if (outp->func->fini)
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/disp/chan.c
index 9b84e357d354..57a62a2de7c7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
@@ -128,7 +128,7 @@ nvkm_disp_chan_child_get(struct nvkm_object *object, in=
t index, struct nvkm_ocla
 }
=20
 static int
-nvkm_disp_chan_fini(struct nvkm_object *object, bool suspend)
+nvkm_disp_chan_fini(struct nvkm_object *object, enum nvkm_suspend_state su=
spend)
 {
 =09struct nvkm_disp_chan *chan =3D nvkm_disp_chan(object);
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/falcon.c b/drivers/gpu/drm=
/nouveau/nvkm/engine/falcon.c
index fd5ee9f0af36..cf8e356867b4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/falcon.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/falcon.c
@@ -93,13 +93,13 @@ nvkm_falcon_intr(struct nvkm_engine *engine)
 }
=20
 static int
-nvkm_falcon_fini(struct nvkm_engine *engine, bool suspend)
+nvkm_falcon_fini(struct nvkm_engine *engine, enum nvkm_suspend_state suspe=
nd)
 {
 =09struct nvkm_falcon *falcon =3D nvkm_falcon(engine);
 =09struct nvkm_device *device =3D falcon->engine.subdev.device;
 =09const u32 base =3D falcon->addr;
=20
-=09if (!suspend) {
+=09if (suspend =3D=3D NVKM_POWEROFF) {
 =09=09nvkm_memory_unref(&falcon->core);
 =09=09if (falcon->external) {
 =09=09=09vfree(falcon->data.data);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/fifo/base.c
index 6fd4e60634fb..1561287a32f2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
@@ -122,7 +122,7 @@ nvkm_fifo_class_get(struct nvkm_oclass *oclass, int ind=
ex, const struct nvkm_dev
 }
=20
 static int
-nvkm_fifo_fini(struct nvkm_engine *engine, bool suspend)
+nvkm_fifo_fini(struct nvkm_engine *engine, enum nvkm_suspend_state suspend=
)
 {
 =09struct nvkm_fifo *fifo =3D nvkm_fifo(engine);
 =09struct nvkm_runl *runl;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/fifo/uchan.c
index 52420a1edca5..c978b97e10c6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -72,7 +72,7 @@ struct nvkm_uobj {
 };
=20
 static int
-nvkm_uchan_object_fini_1(struct nvkm_oproxy *oproxy, bool suspend)
+nvkm_uchan_object_fini_1(struct nvkm_oproxy *oproxy, enum nvkm_suspend_sta=
te suspend)
 {
 =09struct nvkm_uobj *uobj =3D container_of(oproxy, typeof(*uobj), oproxy);
 =09struct nvkm_chan *chan =3D uobj->chan;
@@ -87,7 +87,7 @@ nvkm_uchan_object_fini_1(struct nvkm_oproxy *oproxy, bool=
 suspend)
 =09=09nvkm_chan_cctx_bind(chan, ectx->engn, NULL);
=20
 =09=09if (refcount_dec_and_test(&ectx->uses))
-=09=09=09nvkm_object_fini(ectx->object, false);
+=09=09=09nvkm_object_fini(ectx->object, NVKM_POWEROFF);
 =09=09mutex_unlock(&chan->cgrp->mutex);
 =09}
=20
@@ -269,7 +269,7 @@ nvkm_uchan_map(struct nvkm_object *object, void *argv, =
u32 argc,
 }
=20
 static int
-nvkm_uchan_fini(struct nvkm_object *object, bool suspend)
+nvkm_uchan_fini(struct nvkm_object *object, enum nvkm_suspend_state suspen=
d)
 {
 =09struct nvkm_chan *chan =3D nvkm_uchan(object)->chan;
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c b/drivers/gpu/dr=
m/nouveau/nvkm/engine/gr/base.c
index f5e68f09df76..cd4908b1b4df 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
@@ -168,11 +168,11 @@ nvkm_gr_init(struct nvkm_engine *engine)
 }
=20
 static int
-nvkm_gr_fini(struct nvkm_engine *engine, bool suspend)
+nvkm_gr_fini(struct nvkm_engine *engine, enum nvkm_suspend_state suspend)
 {
 =09struct nvkm_gr *gr =3D nvkm_gr(engine);
 =09if (gr->func->fini)
-=09=09return gr->func->fini(gr, suspend);
+=09=09return gr->func->fini(gr, suspend !=3D NVKM_POWEROFF);
 =09return 0;
 }
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/d=
rm/nouveau/nvkm/engine/gr/gf100.c
index 3ea447f6a45b..3608215f0f11 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -2330,7 +2330,7 @@ gf100_gr_reset(struct nvkm_gr *base)
=20
 =09WARN_ON(gf100_gr_fecs_halt_pipeline(gr));
=20
-=09subdev->func->fini(subdev, false);
+=09subdev->func->fini(subdev, NVKM_POWEROFF);
 =09nvkm_mc_disable(device, subdev->type, subdev->inst);
 =09if (gr->func->gpccs.reset)
 =09=09gr->func->gpccs.reset(gr);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c b/drivers/gpu/dr=
m/nouveau/nvkm/engine/gr/nv04.c
index ca822f07b63e..82937df8b8c0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c
@@ -1158,7 +1158,7 @@ nv04_gr_chan_dtor(struct nvkm_object *object)
 }
=20
 static int
-nv04_gr_chan_fini(struct nvkm_object *object, bool suspend)
+nv04_gr_chan_fini(struct nvkm_object *object, enum nvkm_suspend_state susp=
end)
 {
 =09struct nv04_gr_chan *chan =3D nv04_gr_chan(object);
 =09struct nv04_gr *gr =3D chan->gr;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c b/drivers/gpu/dr=
m/nouveau/nvkm/engine/gr/nv10.c
index 92ef7c9b2910..fcb4e4fce83f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c
@@ -951,7 +951,7 @@ nv10_gr_context_switch(struct nv10_gr *gr)
 }
=20
 static int
-nv10_gr_chan_fini(struct nvkm_object *object, bool suspend)
+nv10_gr_chan_fini(struct nvkm_object *object, enum nvkm_suspend_state susp=
end)
 {
 =09struct nv10_gr_chan *chan =3D nv10_gr_chan(object);
 =09struct nv10_gr *gr =3D chan->gr;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c b/drivers/gpu/dr=
m/nouveau/nvkm/engine/gr/nv20.c
index 13407fafe947..ab57b3b40228 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c
@@ -27,7 +27,7 @@ nv20_gr_chan_init(struct nvkm_object *object)
 }
=20
 int
-nv20_gr_chan_fini(struct nvkm_object *object, bool suspend)
+nv20_gr_chan_fini(struct nvkm_object *object, enum nvkm_suspend_state susp=
end)
 {
 =09struct nv20_gr_chan *chan =3D nv20_gr_chan(object);
 =09struct nv20_gr *gr =3D chan->gr;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.h b/drivers/gpu/dr=
m/nouveau/nvkm/engine/gr/nv20.h
index c0d2be53413e..786c7832f7ac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.h
@@ -31,5 +31,5 @@ struct nv20_gr_chan {
=20
 void *nv20_gr_chan_dtor(struct nvkm_object *);
 int nv20_gr_chan_init(struct nvkm_object *);
-int nv20_gr_chan_fini(struct nvkm_object *, bool);
+int nv20_gr_chan_fini(struct nvkm_object *, enum nvkm_suspend_state);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c b/drivers/gpu/dr=
m/nouveau/nvkm/engine/gr/nv40.c
index b609b0150ba1..e3e797cf3034 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c
@@ -89,7 +89,7 @@ nv40_gr_chan_bind(struct nvkm_object *object, struct nvkm=
_gpuobj *parent,
 }
=20
 static int
-nv40_gr_chan_fini(struct nvkm_object *object, bool suspend)
+nv40_gr_chan_fini(struct nvkm_object *object, enum nvkm_suspend_state susp=
end)
 {
 =09struct nv40_gr_chan *chan =3D nv40_gr_chan(object);
 =09struct nv40_gr *gr =3D chan->gr;
@@ -101,7 +101,7 @@ nv40_gr_chan_fini(struct nvkm_object *object, bool susp=
end)
 =09nvkm_mask(device, 0x400720, 0x00000001, 0x00000000);
=20
 =09if (nvkm_rd32(device, 0x40032c) =3D=3D inst) {
-=09=09if (suspend) {
+=09=09if (suspend !=3D NVKM_POWEROFF) {
 =09=09=09nvkm_wr32(device, 0x400720, 0x00000000);
 =09=09=09nvkm_wr32(device, 0x400784, inst);
 =09=09=09nvkm_mask(device, 0x400310, 0x00000020, 0x00000020);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/mpeg/nv44.c
index 4b1374adbda3..38146f9cc81c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c
@@ -65,7 +65,7 @@ nv44_mpeg_chan_bind(struct nvkm_object *object, struct nv=
km_gpuobj *parent,
 }
=20
 static int
-nv44_mpeg_chan_fini(struct nvkm_object *object, bool suspend)
+nv44_mpeg_chan_fini(struct nvkm_object *object, enum nvkm_suspend_state su=
spend)
 {
=20
 =09struct nv44_mpeg_chan *chan =3D nv44_mpeg_chan(object);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sec2/base.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/sec2/base.c
index f2c60da5d1e8..3e4d6a680ee9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sec2/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sec2/base.c
@@ -37,7 +37,7 @@ nvkm_sec2_finimsg(void *priv, struct nvfw_falcon_msg *hdr=
)
 }
=20
 static int
-nvkm_sec2_fini(struct nvkm_engine *engine, bool suspend)
+nvkm_sec2_fini(struct nvkm_engine *engine, enum nvkm_suspend_state suspend=
)
 {
 =09struct nvkm_sec2 *sec2 =3D nvkm_sec2(engine);
 =09struct nvkm_subdev *subdev =3D &sec2->engine.subdev;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/xtensa.c b/drivers/gpu/drm=
/nouveau/nvkm/engine/xtensa.c
index f7d3ba0afb55..910a5bb2d191 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/xtensa.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/xtensa.c
@@ -76,7 +76,7 @@ nvkm_xtensa_intr(struct nvkm_engine *engine)
 }
=20
 static int
-nvkm_xtensa_fini(struct nvkm_engine *engine, bool suspend)
+nvkm_xtensa_fini(struct nvkm_engine *engine, enum nvkm_suspend_state suspe=
nd)
 {
 =09struct nvkm_xtensa *xtensa =3D nvkm_xtensa(engine);
 =09struct nvkm_device *device =3D xtensa->engine.subdev.device;
@@ -85,7 +85,7 @@ nvkm_xtensa_fini(struct nvkm_engine *engine, bool suspend=
)
 =09nvkm_wr32(device, base + 0xd84, 0); /* INTR_EN */
 =09nvkm_wr32(device, base + 0xd94, 0); /* FIFO_CTRL */
=20
-=09if (!suspend)
+=09if (suspend =3D=3D NVKM_POWEROFF)
 =09=09nvkm_memory_unref(&xtensa->gpu_fw);
 =09return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/acr/base.c
index 9b8ca4e898f9..13d829593180 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
@@ -182,7 +182,7 @@ nvkm_acr_managed_falcon(struct nvkm_device *device, enu=
m nvkm_acr_lsf_id id)
 }
=20
 static int
-nvkm_acr_fini(struct nvkm_subdev *subdev, bool suspend)
+nvkm_acr_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state suspend)
 {
 =09if (!subdev->use.enabled)
 =09=09return 0;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/bar/base.c
index 91bc53be97ff..7dee55bf9ada 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.c
@@ -90,7 +90,7 @@ nvkm_bar_bar2_init(struct nvkm_device *device)
 }
=20
 static int
-nvkm_bar_fini(struct nvkm_subdev *subdev, bool suspend)
+nvkm_bar_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state suspend)
 {
 =09struct nvkm_bar *bar =3D nvkm_bar(subdev);
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/clk/base.c
index 178dc56909c2..71420f81714b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -577,7 +577,7 @@ nvkm_clk_read(struct nvkm_clk *clk, enum nv_clk_src src=
)
 }
=20
 static int
-nvkm_clk_fini(struct nvkm_subdev *subdev, bool suspend)
+nvkm_clk_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state suspend)
 {
 =09struct nvkm_clk *clk =3D nvkm_clk(subdev);
 =09flush_work(&clk->work);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/devinit/base.c
index 3d9319c319c6..ad5ec9ee1294 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c
@@ -67,11 +67,11 @@ nvkm_devinit_post(struct nvkm_devinit *init)
 }
=20
 static int
-nvkm_devinit_fini(struct nvkm_subdev *subdev, bool suspend)
+nvkm_devinit_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state susp=
end)
 {
 =09struct nvkm_devinit *init =3D nvkm_devinit(subdev);
 =09/* force full reinit on resume */
-=09if (suspend)
+=09if (suspend !=3D NVKM_POWEROFF)
 =09=09init->post =3D true;
 =09return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/fault/base.c
index b53ac9a2552f..d8d32bb5bcd9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c
@@ -51,7 +51,7 @@ nvkm_fault_intr(struct nvkm_subdev *subdev)
 }
=20
 static int
-nvkm_fault_fini(struct nvkm_subdev *subdev, bool suspend)
+nvkm_fault_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state suspen=
d)
 {
 =09struct nvkm_fault *fault =3D nvkm_fault(subdev);
 =09if (fault->func->fini)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/fault/user.c
index cd2fbc0472d8..8ab052d18e5d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
@@ -56,7 +56,7 @@ nvkm_ufault_map(struct nvkm_object *object, void *argv, u=
32 argc,
 }
=20
 static int
-nvkm_ufault_fini(struct nvkm_object *object, bool suspend)
+nvkm_ufault_fini(struct nvkm_object *object, enum nvkm_suspend_state suspe=
nd)
 {
 =09struct nvkm_fault_buffer *buffer =3D nvkm_fault_buffer(object);
 =09buffer->fault->func->buffer.fini(buffer);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gpio/base.c
index b196baa376dc..b2c34878a68f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c
@@ -144,7 +144,7 @@ nvkm_gpio_intr(struct nvkm_subdev *subdev)
 }
=20
 static int
-nvkm_gpio_fini(struct nvkm_subdev *subdev, bool suspend)
+nvkm_gpio_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state suspend=
)
 {
 =09struct nvkm_gpio *gpio =3D nvkm_gpio(subdev);
 =09u32 mask =3D (1ULL << gpio->func->lines) - 1;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/base.c
index 7ccb41761066..30cb843ba35c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -48,7 +48,7 @@ nvkm_gsp_intr_stall(struct nvkm_gsp *gsp, enum nvkm_subde=
v_type type, int inst)
 }
=20
 static int
-nvkm_gsp_fini(struct nvkm_subdev *subdev, bool suspend)
+nvkm_gsp_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state suspend)
 {
 =09struct nvkm_gsp *gsp =3D nvkm_gsp(subdev);
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/gh100.c
index b0dd5fce7bad..88436a264177 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
@@ -17,7 +17,7 @@
 #include <nvhw/ref/gh100/dev_riscv_pri.h>
=20
 int
-gh100_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
+gh100_gsp_fini(struct nvkm_gsp *gsp, enum nvkm_suspend_state suspend)
 {
 =09struct nvkm_falcon *falcon =3D &gsp->falcon;
 =09int ret, time =3D 4000;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/priv.h
index 9dd66a2e3801..71b7203bef50 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -59,7 +59,7 @@ struct nvkm_gsp_func {
 =09void (*dtor)(struct nvkm_gsp *);
 =09int (*oneinit)(struct nvkm_gsp *);
 =09int (*init)(struct nvkm_gsp *);
-=09int (*fini)(struct nvkm_gsp *, bool suspend);
+=09int (*fini)(struct nvkm_gsp *, enum nvkm_suspend_state suspend);
 =09int (*reset)(struct nvkm_gsp *);
=20
 =09struct {
@@ -75,7 +75,7 @@ int tu102_gsp_fwsec_sb_ctor(struct nvkm_gsp *);
 void tu102_gsp_fwsec_sb_dtor(struct nvkm_gsp *);
 int tu102_gsp_oneinit(struct nvkm_gsp *);
 int tu102_gsp_init(struct nvkm_gsp *);
-int tu102_gsp_fini(struct nvkm_gsp *, bool suspend);
+int tu102_gsp_fini(struct nvkm_gsp *, enum nvkm_suspend_state suspend);
 int tu102_gsp_reset(struct nvkm_gsp *);
 u64 tu102_gsp_wpr_heap_size(struct nvkm_gsp *);
=20
@@ -87,12 +87,12 @@ int ga102_gsp_reset(struct nvkm_gsp *);
=20
 int gh100_gsp_oneinit(struct nvkm_gsp *);
 int gh100_gsp_init(struct nvkm_gsp *);
-int gh100_gsp_fini(struct nvkm_gsp *, bool suspend);
+int gh100_gsp_fini(struct nvkm_gsp *, enum nvkm_suspend_state suspend);
=20
 void r535_gsp_dtor(struct nvkm_gsp *);
 int r535_gsp_oneinit(struct nvkm_gsp *);
 int r535_gsp_init(struct nvkm_gsp *);
-int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
+int r535_gsp_fini(struct nvkm_gsp *, enum nvkm_suspend_state suspend);
=20
 int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, enum=
 nvkm_subdev_type, int,
 =09=09  struct nvkm_gsp **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 6e7af2f737b7..2f028a30e07d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1721,7 +1721,7 @@ r535_gsp_sr_data_size(struct nvkm_gsp *gsp)
 }
=20
 int
-r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
+r535_gsp_fini(struct nvkm_gsp *gsp, enum nvkm_suspend_state suspend)
 {
 =09struct nvkm_rm *rm =3D gsp->rm;
 =09int ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/tu102.c
index 04b642a1f730..19cb269e7a26 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -161,7 +161,7 @@ tu102_gsp_reset(struct nvkm_gsp *gsp)
 }
=20
 int
-tu102_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
+tu102_gsp_fini(struct nvkm_gsp *gsp, enum nvkm_suspend_state suspend)
 {
 =09u32 mbox0 =3D 0xff, mbox1 =3D 0xff;
 =09int ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/i2c/base.c
index 7ec17e8435a1..454bb21815a2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
@@ -135,7 +135,7 @@ nvkm_i2c_intr(struct nvkm_subdev *subdev)
 }
=20
 static int
-nvkm_i2c_fini(struct nvkm_subdev *subdev, bool suspend)
+nvkm_i2c_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state suspend)
 {
 =09struct nvkm_i2c *i2c =3D nvkm_i2c(subdev);
 =09struct nvkm_i2c_pad *pad;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/instmem/base.c
index 2f55bab8e132..6b9ed61684a0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
@@ -176,7 +176,7 @@ nvkm_instmem_boot(struct nvkm_instmem *imem)
 }
=20
 static int
-nvkm_instmem_fini(struct nvkm_subdev *subdev, bool suspend)
+nvkm_instmem_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state susp=
end)
 {
 =09struct nvkm_instmem *imem =3D nvkm_instmem(subdev);
 =09int ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/pci/base.c
index 6867934256a7..0f3e0d324a52 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c
@@ -74,7 +74,7 @@ nvkm_pci_rom_shadow(struct nvkm_pci *pci, bool shadow)
 }
=20
 static int
-nvkm_pci_fini(struct nvkm_subdev *subdev, bool suspend)
+nvkm_pci_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state suspend)
 {
 =09struct nvkm_pci *pci =3D nvkm_pci(subdev);
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/pmu/base.c
index 8f2f50ad4ded..9e9004ec4588 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
@@ -77,7 +77,7 @@ nvkm_pmu_intr(struct nvkm_subdev *subdev)
 }
=20
 static int
-nvkm_pmu_fini(struct nvkm_subdev *subdev, bool suspend)
+nvkm_pmu_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state suspend)
 {
 =09struct nvkm_pmu *pmu =3D nvkm_pmu(subdev);
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/therm/base.c
index fc5ee118e910..1510aba33956 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
@@ -341,15 +341,15 @@ nvkm_therm_intr(struct nvkm_subdev *subdev)
 }
=20
 static int
-nvkm_therm_fini(struct nvkm_subdev *subdev, bool suspend)
+nvkm_therm_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state suspen=
d)
 {
 =09struct nvkm_therm *therm =3D nvkm_therm(subdev);
=20
 =09if (therm->func->fini)
 =09=09therm->func->fini(therm);
=20
-=09nvkm_therm_fan_fini(therm, suspend);
-=09nvkm_therm_sensor_fini(therm, suspend);
+=09nvkm_therm_fan_fini(therm, suspend !=3D NVKM_POWEROFF);
+=09nvkm_therm_sensor_fini(therm, suspend !=3D NVKM_POWEROFF);
=20
 =09if (suspend) {
 =09=09therm->suspend =3D therm->mode;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/timer/base.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/timer/base.c
index 8b0da0c06268..a5c3c282b5d0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/timer/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/timer/base.c
@@ -149,7 +149,7 @@ nvkm_timer_intr(struct nvkm_subdev *subdev)
 }
=20
 static int
-nvkm_timer_fini(struct nvkm_subdev *subdev, bool suspend)
+nvkm_timer_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state suspen=
d)
 {
 =09struct nvkm_timer *tmr =3D nvkm_timer(subdev);
 =09tmr->func->alarm_fini(tmr);
--=20
2.52.0

