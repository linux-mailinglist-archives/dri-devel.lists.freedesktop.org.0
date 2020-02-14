Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131EE15FA19
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 23:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3826FBCC;
	Fri, 14 Feb 2020 22:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AB56FBCA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 22:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581721176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwexW02lJebsx+cEXvTPUzW9QnWctE78LP5gXD96sBE=;
 b=LTQWDaqogIETYGAzxu5zT0ZKSXSpTpuzvLviIJ4+7F8qtLDILnaM0sR2ywCxsZ9ZnLU3k7
 ARe6wFUC85ltKsgJqQs/jpW7t/54NEb7LACW0/3P/XYGO/hqGmBHKj1saYWofS8ss1uFPT
 luDomyyaPpbhZBNOmFndWHzUNeJfmRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-7bMWu_YcNmOnnMn-fkczlg-1; Fri, 14 Feb 2020 17:59:31 -0500
X-MC-Unique: 7bMWu_YcNmOnnMn-fkczlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97D42477;
 Fri, 14 Feb 2020 22:59:29 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BEA289F10;
 Fri, 14 Feb 2020 22:59:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH v2 2/5] drm/nouveau/kms/nv50-: Probe SOR caps for DP
 interlacing support
Date: Fri, 14 Feb 2020 17:58:53 -0500
Message-Id: <20200214225910.695210-3-lyude@redhat.com>
In-Reply-To: <20200214225910.695210-1-lyude@redhat.com>
References: <20200214225910.695210-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Manasi Navare <manasi.d.navare@intel.com>, Sean Paul <seanpaul@chromium.org>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>
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

Changes since v1:
* Actually probe caps correctly this time, both on EVO and NVDisplay.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/core.h     |  3 +++
 drivers/gpu/drm/nouveau/dispnv50/core507d.c | 15 ++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/core827d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/core907d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/core917d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c | 26 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 21 ++++++++++++++++-
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |  1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c | 10 +++++++-
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  4 ++++
 11 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.h b/drivers/gpu/drm/nouveau/dispnv50/core.h
index ff94f3f6f264..9a1f610e4c81 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.h
@@ -15,6 +15,7 @@ void nv50_core_del(struct nv50_core **);
 struct nv50_core_func {
 	void (*init)(struct nv50_core *);
 	void (*ntfy_init)(struct nouveau_bo *, u32 offset);
+	int (*caps_init)(struct nouveau_drm *, struct nv50_disp *);
 	int (*ntfy_wait_done)(struct nouveau_bo *, u32 offset,
 			      struct nvif_device *);
 	void (*update)(struct nv50_core *, u32 *interlock, bool ntfy);
@@ -35,6 +36,7 @@ int core507d_new_(const struct nv50_core_func *, struct nouveau_drm *, s32,
 		  struct nv50_core **);
 void core507d_init(struct nv50_core *);
 void core507d_ntfy_init(struct nouveau_bo *, u32);
+int core507d_caps_init(struct nouveau_drm *, struct nv50_disp *);
 int core507d_ntfy_wait_done(struct nouveau_bo *, u32, struct nvif_device *);
 void core507d_update(struct nv50_core *, u32 *, bool);
 
@@ -51,6 +53,7 @@ extern const struct nv50_outp_func sor907d;
 int core917d_new(struct nouveau_drm *, s32, struct nv50_core **);
 
 int corec37d_new(struct nouveau_drm *, s32, struct nv50_core **);
+int corec37d_caps_init(struct nouveau_drm *, struct nv50_disp *);
 int corec37d_ntfy_wait_done(struct nouveau_bo *, u32, struct nvif_device *);
 void corec37d_update(struct nv50_core *, u32 *, bool);
 void corec37d_wndw_owner(struct nv50_core *);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
index e7fcfa6e6467..cd45dc09d457 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
@@ -61,6 +61,20 @@ core507d_ntfy_init(struct nouveau_bo *bo, u32 offset)
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
@@ -76,6 +90,7 @@ static const struct nv50_core_func
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
index 3b36dc8d36b2..81f96097aff8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
@@ -22,6 +22,7 @@
 #include "core.h"
 #include "head.h"
 
+#include <nvif/class.h>
 #include <nouveau_bo.h>
 
 void
@@ -85,6 +86,30 @@ corec37d_ntfy_init(struct nouveau_bo *bo, u32 offset)
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
@@ -109,6 +134,7 @@ static const struct nv50_core_func
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
index ba07b0154d2b..cab92de3da90 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1684,6 +1684,9 @@ nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
 	struct nouveau_encoder *nv_encoder;
 	struct drm_encoder *encoder;
+	struct nv50_disp *disp = nv50_disp(connector->dev);
+	u32 caps = 0;
+	const int or = ffs(dcbe->or) - 1;
 	int type, ret;
 
 	switch (dcbe->type) {
@@ -1710,10 +1713,19 @@ nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
 
 	drm_connector_attach_encoder(connector, encoder);
 
+	/* Probe SOR caps */
+	if (disp->disp->object.oclass >= GV100_DISP)
+		caps = nvif_rd32(&disp->caps, 0x000144 + (or * 8));
+	else
+		caps = nouveau_bo_rd32(disp->sync, 0x000014 + (or * 2));
+
+	if (caps)
+		nv_encoder->caps.dp_interlace = !!(caps & 0x04000000);
+
 	if (dcbe->type == DCB_OUTPUT_DP) {
-		struct nv50_disp *disp = nv50_disp(encoder->dev);
 		struct nvkm_i2c_aux *aux =
 			nvkm_i2c_aux_find(i2c, dcbe->i2c_index);
+
 		if (aux) {
 			if (disp->disp->object.oclass < GF110_DISP) {
 				/* HW has no support for address-only
@@ -2422,6 +2434,8 @@ nv50_display_destroy(struct drm_device *dev)
 
 	nv50_audio_component_fini(nouveau_drm(dev));
 
+	nvif_object_unmap(&disp->caps);
+	nvif_object_fini(&disp->caps);
 	nv50_core_del(&disp->core);
 
 	nouveau_bo_unmap(disp->sync);
@@ -2483,6 +2497,11 @@ nv50_display_create(struct drm_device *dev)
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
