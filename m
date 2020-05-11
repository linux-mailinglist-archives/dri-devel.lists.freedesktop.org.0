Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D78321CE852
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC476E5C6;
	Mon, 11 May 2020 22:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BF66E5C8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 22:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589236958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lHdYKv1e41ylpdlpTIMKKurLgIO4fnkHvhU0Bk3xq6s=;
 b=dNqrEGD+PRVOQNzZQGbgbHxjyvX0a5gfZDZqUDCXMGO0Tw0jyz6tqv5QAcUZ2ticsSI9hr
 MMqIBwm8DCGZzig1OrqXqQAdE9T0ZefKyi5kLIDiRmYAroc/X43nlH668OHcp/4z7ASQFs
 Nt/W+t4FNOcJOzCvqD53OwrRQfMNOVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-TK341PNjP7igawimsvKXnw-1; Mon, 11 May 2020 18:42:35 -0400
X-MC-Unique: TK341PNjP7igawimsvKXnw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2529A107ACCA;
 Mon, 11 May 2020 22:42:34 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-117-238.rdu2.redhat.com
 [10.10.117.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8D3D78480;
 Mon, 11 May 2020 22:42:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH v3 2/5] drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for DP
 interlacing support
Date: Mon, 11 May 2020 18:41:24 -0400
Message-Id: <20200511224148.598468-3-lyude@redhat.com>
In-Reply-To: <20200511224148.598468-1-lyude@redhat.com>
References: <20200511224148.598468-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Jani Nikula <jani.nikula@intel.com>, David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Right now, we make the mistake of allowing interlacing on all
connectors. Nvidia hardware does not always support interlacing with DP
though, so we need to make sure that we don't allow interlaced modes to
be set in such situations as otherwise we'll end up accidentally hanging
the display HW.

This fixes some hangs with Turing, which would be caused by attempting
to set an interlaced mode on hardware that doesn't support it. This
patch likely fixes other hardware hanging in the same way as well.

Note that we say we probe PIOR caps, but they don't actually have any
interlacing caps. So, the get_caps() function for PIORs just sets
interlacing support to true.

Changes since v1:
* Actually probe caps correctly this time, both on EVO and NVDisplay.
Changes since v2:
* Fix probing for < GF119
* Use vfunc table, in prep for adding more caps in the future.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/core.h     |  7 ++++++
 drivers/gpu/drm/nouveau/dispnv50/core507d.c | 15 ++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/core827d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/core907d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/core917d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c | 26 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 19 +++++++++++++--
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |  1 +
 drivers/gpu/drm/nouveau/dispnv50/pior507d.c |  8 +++++++
 drivers/gpu/drm/nouveau/dispnv50/sor507d.c  |  7 ++++++
 drivers/gpu/drm/nouveau/dispnv50/sor907d.c  | 11 +++++++++
 drivers/gpu/drm/nouveau/dispnv50/sorc37d.c  |  9 +++++++
 drivers/gpu/drm/nouveau/nouveau_connector.c | 10 +++++++-
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  4 ++++
 15 files changed, 118 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.h b/drivers/gpu/drm/nouveau/dispnv50/core.h
index ff94f3f6f264..99157dc94d23 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.h
@@ -2,6 +2,7 @@
 #define __NV50_KMS_CORE_H__
 #include "disp.h"
 #include "atom.h"
+#include <nouveau_encoder.h>
 
 struct nv50_core {
 	const struct nv50_core_func *func;
@@ -15,6 +16,7 @@ void nv50_core_del(struct nv50_core **);
 struct nv50_core_func {
 	void (*init)(struct nv50_core *);
 	void (*ntfy_init)(struct nouveau_bo *, u32 offset);
+	int (*caps_init)(struct nouveau_drm *, struct nv50_disp *);
 	int (*ntfy_wait_done)(struct nouveau_bo *, u32 offset,
 			      struct nvif_device *);
 	void (*update)(struct nv50_core *, u32 *interlock, bool ntfy);
@@ -27,6 +29,9 @@ struct nv50_core_func {
 	const struct nv50_outp_func {
 		void (*ctrl)(struct nv50_core *, int or, u32 ctrl,
 			     struct nv50_head_atom *);
+		/* XXX: Only used by SORs and PIORs for now */
+		void (*get_caps)(struct nv50_disp *,
+				 struct nouveau_encoder *, int or);
 	} *dac, *pior, *sor;
 };
 
@@ -35,6 +40,7 @@ int core507d_new_(const struct nv50_core_func *, struct nouveau_drm *, s32,
 		  struct nv50_core **);
 void core507d_init(struct nv50_core *);
 void core507d_ntfy_init(struct nouveau_bo *, u32);
+int core507d_caps_init(struct nouveau_drm *, struct nv50_disp *);
 int core507d_ntfy_wait_done(struct nouveau_bo *, u32, struct nvif_device *);
 void core507d_update(struct nv50_core *, u32 *, bool);
 
@@ -51,6 +57,7 @@ extern const struct nv50_outp_func sor907d;
 int core917d_new(struct nouveau_drm *, s32, struct nv50_core **);
 
 int corec37d_new(struct nouveau_drm *, s32, struct nv50_core **);
+int corec37d_caps_init(struct nouveau_drm *, struct nv50_disp *);
 int corec37d_ntfy_wait_done(struct nouveau_bo *, u32, struct nvif_device *);
 void corec37d_update(struct nv50_core *, u32 *, bool);
 void corec37d_wndw_owner(struct nv50_core *);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
index c5152c39c684..e341f572c269 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
@@ -62,6 +62,20 @@ core507d_ntfy_init(struct nouveau_bo *bo, u32 offset)
 	nouveau_bo_wr32(bo, offset / 4, 0x00000000);
 }
 
+int
+core507d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
+{
+	u32 *push = evo_wait(&disp->core->chan, 2);
+
+	if (push) {
+		evo_mthd(push, 0x008c, 1);
+		evo_data(push, 0x0);
+		evo_kick(push, &disp->core->chan);
+	}
+
+	return 0;
+}
+
 void
 core507d_init(struct nv50_core *core)
 {
@@ -77,6 +91,7 @@ static const struct nv50_core_func
 core507d = {
 	.init = core507d_init,
 	.ntfy_init = core507d_ntfy_init,
+	.caps_init = core507d_caps_init,
 	.ntfy_wait_done = core507d_ntfy_wait_done,
 	.update = core507d_update,
 	.head = &head507d,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core827d.c b/drivers/gpu/drm/nouveau/dispnv50/core827d.c
index 6123a068f836..2e0c1c536afe 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core827d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core827d.c
@@ -26,6 +26,7 @@ static const struct nv50_core_func
 core827d = {
 	.init = core507d_init,
 	.ntfy_init = core507d_ntfy_init,
+	.caps_init = core507d_caps_init,
 	.ntfy_wait_done = core507d_ntfy_wait_done,
 	.update = core507d_update,
 	.head = &head827d,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core907d.c b/drivers/gpu/drm/nouveau/dispnv50/core907d.c
index ef822f813435..271629832629 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core907d.c
@@ -26,6 +26,7 @@ static const struct nv50_core_func
 core907d = {
 	.init = core507d_init,
 	.ntfy_init = core507d_ntfy_init,
+	.caps_init = core507d_caps_init,
 	.ntfy_wait_done = core507d_ntfy_wait_done,
 	.update = core507d_update,
 	.head = &head907d,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core917d.c b/drivers/gpu/drm/nouveau/dispnv50/core917d.c
index 392338df5bfd..5cc072d4c30f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core917d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core917d.c
@@ -26,6 +26,7 @@ static const struct nv50_core_func
 core917d = {
 	.init = core507d_init,
 	.ntfy_init = core507d_ntfy_init,
+	.caps_init = core507d_caps_init,
 	.ntfy_wait_done = core507d_ntfy_wait_done,
 	.update = core507d_update,
 	.head = &head917d,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c b/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
index c03cb987856b..e0c8811fb8e4 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
@@ -22,6 +22,7 @@
 #include "core.h"
 #include "head.h"
 
+#include <nvif/class.h>
 #include <nouveau_bo.h>
 
 #include <nvif/timer.h>
@@ -87,6 +88,30 @@ corec37d_ntfy_init(struct nouveau_bo *bo, u32 offset)
 	nouveau_bo_wr32(bo, offset / 4 + 3, 0x00000000);
 }
 
+int corec37d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
+{
+	int ret;
+
+	ret = nvif_object_init(&disp->disp->object, 0, GV100_DISP_CAPS,
+			       NULL, 0, &disp->caps);
+	if (ret) {
+		NV_ERROR(drm,
+			 "Failed to init notifier caps region: %d\n",
+			 ret);
+		return ret;
+	}
+
+	ret = nvif_object_map(&disp->caps, NULL, 0);
+	if (ret) {
+		NV_ERROR(drm,
+			 "Failed to map notifier caps region: %d\n",
+			 ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static void
 corec37d_init(struct nv50_core *core)
 {
@@ -111,6 +136,7 @@ static const struct nv50_core_func
 corec37d = {
 	.init = corec37d_init,
 	.ntfy_init = corec37d_ntfy_init,
+	.caps_init = corec37d_caps_init,
 	.ntfy_wait_done = corec37d_ntfy_wait_done,
 	.update = corec37d_update,
 	.wndw.owner = corec37d_wndw_owner,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/corec57d.c b/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
index 147adcd60937..10ba9e9e4ae6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
@@ -46,6 +46,7 @@ static const struct nv50_core_func
 corec57d = {
 	.init = corec57d_init,
 	.ntfy_init = corec37d_ntfy_init,
+	.caps_init = corec37d_caps_init,
 	.ntfy_wait_done = corec37d_ntfy_wait_done,
 	.update = corec37d_update,
 	.wndw.owner = corec37d_wndw_owner,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 05b458b16e3f..f67dffe8c005 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1659,6 +1659,7 @@ nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
 	struct nouveau_encoder *nv_encoder;
 	struct drm_encoder *encoder;
+	struct nv50_disp *disp = nv50_disp(connector->dev);
 	int type, ret;
 
 	switch (dcbe->type) {
@@ -1685,10 +1686,12 @@ nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
 
 	drm_connector_attach_encoder(connector, encoder);
 
+	disp->core->func->sor->get_caps(disp, nv_encoder, ffs(dcbe->or) - 1);
+
 	if (dcbe->type == DCB_OUTPUT_DP) {
-		struct nv50_disp *disp = nv50_disp(encoder->dev);
 		struct nvkm_i2c_aux *aux =
 			nvkm_i2c_aux_find(i2c, dcbe->i2c_index);
+
 		if (aux) {
 			if (disp->disp->object.oclass < GF110_DISP) {
 				/* HW has no support for address-only
@@ -1801,7 +1804,9 @@ nv50_pior_func = {
 static int
 nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
 {
-	struct nouveau_drm *drm = nouveau_drm(connector->dev);
+	struct drm_device *dev = connector->dev;
+	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nv50_disp *disp = nv50_disp(dev);
 	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
 	struct nvkm_i2c_bus *bus = NULL;
 	struct nvkm_i2c_aux *aux = NULL;
@@ -1840,6 +1845,9 @@ nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	drm_encoder_helper_add(encoder, &nv50_pior_help);
 
 	drm_connector_attach_encoder(connector, encoder);
+
+	disp->core->func->pior->get_caps(disp, nv_encoder, ffs(dcbe->or) - 1);
+
 	return 0;
 }
 
@@ -2397,6 +2405,8 @@ nv50_display_destroy(struct drm_device *dev)
 
 	nv50_audio_component_fini(nouveau_drm(dev));
 
+	nvif_object_unmap(&disp->caps);
+	nvif_object_fini(&disp->caps);
 	nv50_core_del(&disp->core);
 
 	nouveau_bo_unmap(disp->sync);
@@ -2458,6 +2468,11 @@ nv50_display_create(struct drm_device *dev)
 		goto out;
 
 	disp->core->func->init(disp->core);
+	if (disp->core->func->caps_init) {
+		ret = disp->core->func->caps_init(drm, disp);
+		if (ret)
+			goto out;
+	}
 
 	/* create crtc objects to represent the hw heads */
 	if (disp->disp->object.oclass >= GV100_DISP)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index d54fe00ac3a3..89c3b38c32a5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -9,6 +9,7 @@ struct nv50_msto;
 struct nv50_disp {
 	struct nvif_disp *disp;
 	struct nv50_core *core;
+	struct nvif_object caps;
 
 #define NV50_DISP_SYNC(c, o)                                ((c) * 0x040 + (o))
 #define NV50_DISP_CORE_NTFY                       NV50_DISP_SYNC(0      , 0x00)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/pior507d.c b/drivers/gpu/drm/nouveau/dispnv50/pior507d.c
index d2bac6a341dc..45d8ce7d2c28 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/pior507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/pior507d.c
@@ -38,7 +38,15 @@ pior507d_ctrl(struct nv50_core *core, int or, u32 ctrl,
 	}
 }
 
+static void
+pior507d_get_caps(struct nv50_disp *disp, struct nouveau_encoder *outp,
+		  int or)
+{
+	outp->caps.dp_interlace = true;
+}
+
 const struct nv50_outp_func
 pior507d = {
 	.ctrl = pior507d_ctrl,
+	.get_caps = pior507d_get_caps,
 };
diff --git a/drivers/gpu/drm/nouveau/dispnv50/sor507d.c b/drivers/gpu/drm/nouveau/dispnv50/sor507d.c
index 5222fe6a9b21..9a59fa7da00d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/sor507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/sor507d.c
@@ -38,7 +38,14 @@ sor507d_ctrl(struct nv50_core *core, int or, u32 ctrl,
 	}
 }
 
+static void
+sor507d_get_caps(struct nv50_disp *core, struct nouveau_encoder *outp, int or)
+{
+	outp->caps.dp_interlace = true;
+}
+
 const struct nv50_outp_func
 sor507d = {
 	.ctrl = sor507d_ctrl,
+	.get_caps = sor507d_get_caps,
 };
diff --git a/drivers/gpu/drm/nouveau/dispnv50/sor907d.c b/drivers/gpu/drm/nouveau/dispnv50/sor907d.c
index b0314ec11fb3..9577ccf1c809 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/sor907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/sor907d.c
@@ -21,6 +21,7 @@
  */
 #include "core.h"
 
+#include <nouveau_bo.h>
 #include <nvif/class.h>
 
 static void
@@ -35,7 +36,17 @@ sor907d_ctrl(struct nv50_core *core, int or, u32 ctrl,
 	}
 }
 
+static void
+sor907d_get_caps(struct nv50_disp *disp, struct nouveau_encoder *outp, int or)
+{
+	const int off = or * 2;
+	u32 tmp = nouveau_bo_rd32(disp->sync, 0x000014 + off);
+
+	outp->caps.dp_interlace = !!(tmp & 0x04000000);
+}
+
 const struct nv50_outp_func
 sor907d = {
 	.ctrl = sor907d_ctrl,
+	.get_caps = sor907d_get_caps,
 };
diff --git a/drivers/gpu/drm/nouveau/dispnv50/sorc37d.c b/drivers/gpu/drm/nouveau/dispnv50/sorc37d.c
index dff059241c5d..c86ca955fdcd 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/sorc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/sorc37d.c
@@ -33,7 +33,16 @@ sorc37d_ctrl(struct nv50_core *core, int or, u32 ctrl,
 	}
 }
 
+static void
+sorc37d_get_caps(struct nv50_disp *disp, struct nouveau_encoder *outp, int or)
+{
+	u32 tmp = nvif_rd32(&disp->caps, 0x000144 + (or * 8));
+
+	outp->caps.dp_interlace = !!(tmp & 0x04000000);
+}
+
 const struct nv50_outp_func
 sorc37d = {
 	.ctrl = sorc37d_ctrl,
+	.get_caps = sorc37d_get_caps,
 };
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 9a9a7f5003d3..43bcbb6d73c4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -509,7 +509,11 @@ nouveau_connector_set_encoder(struct drm_connector *connector,
 	nv_connector->detected_encoder = nv_encoder;
 
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
-		connector->interlace_allowed = true;
+		if (nv_encoder->dcb->type == DCB_OUTPUT_DP)
+			connector->interlace_allowed =
+				nv_encoder->caps.dp_interlace;
+		else
+			connector->interlace_allowed = true;
 		connector->doublescan_allowed = true;
 	} else
 	if (nv_encoder->dcb->type == DCB_OUTPUT_LVDS ||
@@ -1060,6 +1064,10 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
 	case DCB_OUTPUT_TV:
 		return get_slave_funcs(encoder)->mode_valid(encoder, mode);
 	case DCB_OUTPUT_DP:
+		if (mode->flags & DRM_MODE_FLAG_INTERLACE &&
+		    !nv_encoder->dp.caps.interlace)
+			return MODE_NO_INTERLACE;
+
 		max_clock  = nv_encoder->dp.link_nr;
 		max_clock *= nv_encoder->dp.link_bw;
 		clock = clock * (connector->display_info.bpc * 3) / 10;
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 3517f920bf89..3217f587eceb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -66,6 +66,10 @@ struct nouveau_encoder {
 		} dp;
 	};
 
+	struct {
+		bool dp_interlace : 1;
+	} caps;
+
 	void (*enc_save)(struct drm_encoder *encoder);
 	void (*enc_restore)(struct drm_encoder *encoder);
 	void (*update)(struct nouveau_encoder *, u8 head,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
