Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED51F7A6DF5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F1010E2B2;
	Tue, 19 Sep 2023 22:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACA010E29D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pWOmwRKAuaTP11KxH/fgbPpvSNPhFWRDoWc1h+dWJiE=;
 b=PoYXdVGbuHT9OhvUIjK4jtcUeEiTxvFkHgh099goD3TpCYFHskEXgfB1Tv1Bm75uAa3msx
 W/BYZVweLxSsuB8v2eG31PE4hrZ3KbrMGWqjtrMMBEwCFtfFpj1E/NTgQsH+Kf3LCRkVD0
 PoDhBGINGez+cXaSId0l9AefQZsGxKQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-4aI-HeOsNmKcUq6p3-hUJQ-1; Tue, 19 Sep 2023 18:05:35 -0400
X-MC-Unique: 4aI-HeOsNmKcUq6p3-hUJQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24D4B29AB41E;
 Tue, 19 Sep 2023 22:05:35 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B069C40C2064;
 Tue, 19 Sep 2023 22:05:34 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 10/44] drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for
 reading IOR state
Date: Tue, 19 Sep 2023 17:56:05 -0400
Message-ID: <20230919220442.202488-11-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: Kees Cook <keescook@chromium.org>, Karol Herbst <kherbst@redhat.com>,
 Danilo Krummrich <me@dakr.org>, open list <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we're supporting things like Ada and the GSP, there's situations
where we really need to actually know the display state that we're starting
with when loading the driver in order to prevent breaking GSP expectations.
The first step in doing this is making it so that we can read the current
state of IORs from nvkm in DRM, so that we can fill in said into into the
atomic state.

We do this by introducing an INHERIT ioctl to nvkm/nvif. This is basically
another form of ACQUIRE, except that it will only acquire the given output
path for userspace if it's already set up in hardware. This way, we can go
through and probe each outp object we have in DRM in order to figure out
the current hardware state of each one. If the outp isn't in use, it simply
returns -ENODEV.

This is also part of the work that will be required for implementing GSP
support for display. While the GSP should mostly work without this commit,
this commit should fix some edge case bugs that can occur on initial driver
load. This also paves the way for some of the initial groundwork for
fastboot support.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 101 ++++++++++++++++++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h |  23 ++++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |   5 +
 drivers/gpu/drm/nouveau/nvif/outp.c           |  68 ++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   |  39 ++++---
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |   3 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  |  64 +++++++++++
 8 files changed, 291 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 889ff667d0293..290f3c80ba4eb 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2519,6 +2519,104 @@ nv50_display_fini(struct drm_device *dev, bool runtime, bool suspend)
 		cancel_work_sync(&drm->hpd_work);
 }
 
+static inline void
+nv50_display_read_hw_or_state(struct drm_device *dev, struct nv50_disp *disp,
+			      struct nouveau_encoder *outp)
+{
+	struct drm_crtc *crtc;
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *conn;
+	struct nv50_head_atom *armh;
+	const u32 encoder_mask = drm_encoder_mask(&outp->base.base);
+	bool found_conn = false, found_head = false;
+	u8 proto;
+	int head_idx;
+	int ret;
+
+	switch (outp->dcb->type) {
+	case DCB_OUTPUT_TMDS:
+		ret = nvif_outp_inherit_tmds(&outp->outp, &proto);
+		break;
+	case DCB_OUTPUT_DP:
+		ret = nvif_outp_inherit_dp(&outp->outp, &proto);
+		break;
+	case DCB_OUTPUT_LVDS:
+		ret = nvif_outp_inherit_lvds(&outp->outp, &proto);
+		break;
+	case DCB_OUTPUT_ANALOG:
+		ret = nvif_outp_inherit_rgb_crt(&outp->outp, &proto);
+		break;
+	default:
+		drm_dbg_kms(dev, "Readback for %s not implemented yet, skipping\n",
+			    outp->base.base.name);
+		drm_WARN_ON(dev, true);
+		return;
+	}
+
+	if (ret < 0)
+		return;
+
+	head_idx = ret;
+
+	drm_for_each_crtc(crtc, dev) {
+		if (crtc->index != head_idx)
+			continue;
+
+		armh = nv50_head_atom(crtc->state);
+		found_head = true;
+		break;
+	}
+	if (drm_WARN_ON(dev, !found_head))
+		return;
+
+	/* Figure out which connector is being used by this encoder */
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	nouveau_for_each_non_mst_connector_iter(conn, &conn_iter) {
+		if (nouveau_connector(conn)->index == outp->dcb->connector) {
+			found_conn = true;
+			break;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+	if (drm_WARN_ON(dev, !found_conn))
+		return;
+
+	armh->state.encoder_mask = encoder_mask;
+	armh->state.connector_mask = drm_connector_mask(conn);
+	armh->state.active = true;
+	armh->state.enable = true;
+	pm_runtime_get_noresume(dev->dev);
+
+	outp->crtc = crtc;
+	outp->ctrl = NVVAL(NV507D, SOR_SET_CONTROL, PROTOCOL, proto) | BIT(crtc->index);
+
+	drm_connector_get(conn);
+	conn->state->crtc = crtc;
+	conn->state->best_encoder = &outp->base.base;
+}
+
+/* Read back the currently programmed display state */
+static void
+nv50_display_read_hw_state(struct nouveau_drm *drm)
+{
+	struct drm_device *dev = drm->dev;
+	struct drm_encoder *encoder;
+	struct drm_modeset_acquire_ctx ctx;
+	struct nv50_disp *disp = nv50_disp(dev);
+	int ret;
+
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+
+	drm_for_each_encoder(encoder, dev) {
+		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST)
+			continue;
+
+		nv50_display_read_hw_or_state(dev, disp, nouveau_encoder(encoder));
+	}
+
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+}
+
 static int
 nv50_display_init(struct drm_device *dev, bool resume, bool runtime)
 {
@@ -2536,6 +2634,9 @@ nv50_display_init(struct drm_device *dev, bool resume, bool runtime)
 		}
 	}
 
+	if (!resume)
+		nv50_display_read_hw_state(nouveau_drm(dev));
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 725d6e8e3d2d3..6cfc885e0aa9a 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -15,6 +15,7 @@ union nvif_outp_args {
 #define NVIF_OUTP_V0_DETECT        0x00
 #define NVIF_OUTP_V0_EDID_GET      0x01
 
+#define NVIF_OUTP_V0_INHERIT       0x10
 #define NVIF_OUTP_V0_ACQUIRE       0x11
 #define NVIF_OUTP_V0_RELEASE       0x12
 
@@ -96,6 +97,28 @@ union nvif_outp_acquire_args {
 	} v0;
 };
 
+union nvif_outp_inherit_args {
+	struct nvif_outp_inherit_v0 {
+		__u8 version;
+#define NVIF_OUTP_INHERIT_V0_RGB_CRT 0x00
+#define NVIF_OUTP_INHERIT_V0_TV      0x01
+#define NVIF_OUTP_INHERIT_V0_TMDS    0x02
+#define NVIF_OUTP_INHERIT_V0_LVDS    0x03
+#define NVIF_OUTP_INHERIT_V0_DP      0x04
+		// In/out. Input is one of the above values, output is the actual hw protocol
+		__u8 proto;
+		__u8 or;
+		__u8 link;
+		__u8 head;
+		union {
+			struct {
+				// TODO: Figure out padding, and whether we even want this field
+				__u8 hda;
+			} tmds;
+		};
+	} v0;
+};
+
 union nvif_outp_release_args {
 	struct nvif_outp_release_vn {
 	} vn;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index 7c2c34a84fbd8..23776057bfea8 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -34,6 +34,11 @@ int nvif_outp_acquire_tmds(struct nvif_outp *, int head,
 int nvif_outp_acquire_lvds(struct nvif_outp *, bool dual, bool bpc8);
 int nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 			 int link_nr, int link_bw, bool hda, bool mst);
+int nvif_outp_inherit_rgb_crt(struct nvif_outp *outp, u8 *proto_out);
+int nvif_outp_inherit_lvds(struct nvif_outp *outp, u8 *proto_out);
+int nvif_outp_inherit_tmds(struct nvif_outp *outp, u8 *proto_out);
+int nvif_outp_inherit_dp(struct nvif_outp *outp, u8 *proto_out);
+
 void nvif_outp_release(struct nvif_outp *);
 int nvif_outp_infoframe(struct nvif_outp *, u8 type, struct nvif_outp_infoframe_v0 *, u32 size);
 int nvif_outp_hda_eld(struct nvif_outp *, int head, void *data, u32 size);
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 10480142eea5a..795658f0c920c 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -196,6 +196,74 @@ nvif_outp_acquire_rgb_crt(struct nvif_outp *outp)
 	return ret;
 }
 
+static int
+nvif_outp_inherit(struct nvif_outp *outp,
+		  u8 proto,
+		  struct nvif_outp_inherit_v0 *args,
+		  u8 *proto_out)
+{
+	int ret;
+
+	args->version = 0;
+	args->proto = proto;
+
+	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_INHERIT, args, sizeof(*args));
+	if (ret)
+		return ret;
+
+	outp->or.id = args->or;
+	outp->or.link = args->link;
+	*proto_out = args->proto;
+	return 0;
+}
+
+int
+nvif_outp_inherit_lvds(struct nvif_outp *outp, u8 *proto_out)
+{
+	struct nvif_outp_inherit_v0 args;
+	int ret;
+
+	ret = nvif_outp_inherit(outp, NVIF_OUTP_INHERIT_V0_LVDS, &args, proto_out);
+	NVIF_ERRON(ret && ret != -ENODEV, &outp->object, "[INHERIT proto:LVDS] ret:%d", ret);
+	return ret ?: args.head;
+}
+
+int
+nvif_outp_inherit_tmds(struct nvif_outp *outp, u8 *proto_out)
+{
+	struct nvif_outp_inherit_v0 args;
+	int ret;
+
+	ret = nvif_outp_inherit(outp, NVIF_OUTP_INHERIT_V0_TMDS, &args, proto_out);
+	NVIF_ERRON(ret && ret != -ENODEV, &outp->object, "[INHERIT proto:TMDS] ret:%d", ret);
+	return ret ?: args.head;
+}
+
+int
+nvif_outp_inherit_dp(struct nvif_outp *outp, u8 *proto_out)
+{
+	struct nvif_outp_inherit_v0 args;
+	int ret;
+
+	ret = nvif_outp_inherit(outp, NVIF_OUTP_INHERIT_V0_DP, &args, proto_out);
+	NVIF_ERRON(ret && ret != -ENODEV, &outp->object, "[INHERIT proto:DP] ret:%d", ret);
+
+	// TODO: Get current link info
+
+	return ret ?: args.head;
+}
+
+int
+nvif_outp_inherit_rgb_crt(struct nvif_outp *outp, u8 *proto_out)
+{
+	struct nvif_outp_inherit_v0 args;
+	int ret;
+
+	ret = nvif_outp_inherit(outp, NVIF_OUTP_INHERIT_V0_RGB_CRT, &args, proto_out);
+	NVIF_ERRON(ret && ret != -ENODEV, &outp->object, "[INHERIT proto:RGB_CRT] ret:%d", ret);
+	return ret ?: args.head;
+}
+
 int
 nvif_outp_load_detect(struct nvif_outp *outp, u32 loadval)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index 0d2de4769b94f..3b6d58c154521 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -808,6 +808,7 @@ nvkm_dp_func = {
 	.init = nvkm_dp_init,
 	.fini = nvkm_dp_fini,
 	.detect = nvkm_outp_detect,
+	.inherit = nvkm_outp_inherit,
 	.acquire = nvkm_dp_acquire,
 	.release = nvkm_dp_release,
 	.disable = nvkm_dp_disable,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index 3ed93df475fcc..5b55598e09c85 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -104,7 +104,7 @@ nvkm_outp_release_or(struct nvkm_outp *outp, u8 user)
 	}
 }
 
-static inline int
+int
 nvkm_outp_acquire_ior(struct nvkm_outp *outp, u8 user, struct nvkm_ior *ior)
 {
 	outp->ior = ior;
@@ -247,32 +247,30 @@ nvkm_outp_fini(struct nvkm_outp *outp)
 		outp->func->fini(outp);
 }
 
-static void
-nvkm_outp_init_route(struct nvkm_outp *outp)
+struct nvkm_ior *
+nvkm_outp_inherit(struct nvkm_outp *outp)
 {
 	struct nvkm_disp *disp = outp->disp;
+	struct nvkm_ior *ior;
 	enum nvkm_ior_proto proto;
 	enum nvkm_ior_type type;
-	struct nvkm_ior *ior;
 	int id, link;
 
 	/* Find any OR from the class that is able to support this device. */
 	proto = nvkm_outp_xlat(outp, &type);
 	if (proto == UNKNOWN)
-		return;
+		return NULL;
 
 	ior = nvkm_ior_find(disp, type, -1);
-	if (!ior) {
-		WARN_ON(1);
-		return;
-	}
+	if (WARN_ON(!ior))
+		return NULL;
 
 	/* Determine the specific OR, if any, this device is attached to. */
 	if (ior->func->route.get) {
 		id = ior->func->route.get(outp, &link);
 		if (id < 0) {
 			OUTP_DBG(outp, "no route");
-			return;
+			return NULL;
 		}
 	} else {
 		/* Prior to DCB 4.1, this is hardwired like so. */
@@ -281,10 +279,24 @@ nvkm_outp_init_route(struct nvkm_outp *outp)
 	}
 
 	ior = nvkm_ior_find(disp, type, id);
-	if (!ior) {
-		WARN_ON(1);
+	if (WARN_ON(!ior))
+		return NULL;
+
+	return ior;
+}
+
+static void
+nvkm_outp_init_route(struct nvkm_outp *outp)
+{
+	enum nvkm_ior_proto proto;
+	enum nvkm_ior_type type;
+	struct nvkm_ior *ior;
+
+	/* Find any OR from the class that is able to support this device. */
+	proto = nvkm_outp_xlat(outp, &type);
+	ior = outp->func->inherit(outp);
+	if (!ior)
 		return;
-	}
 
 	/* Determine if the OR is already configured for this device. */
 	ior->func->state(ior, &ior->arm);
@@ -362,6 +374,7 @@ nvkm_outp_new_(const struct nvkm_outp_func *func, struct nvkm_disp *disp,
 static const struct nvkm_outp_func
 nvkm_outp = {
 	.detect = nvkm_outp_detect,
+	.inherit = nvkm_outp_inherit,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 76d83fb9c6e59..ab1699b07acc6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -77,7 +77,9 @@ void nvkm_outp_fini(struct nvkm_outp *);
 
 int nvkm_outp_detect(struct nvkm_outp *);
 
+struct nvkm_ior *nvkm_outp_inherit(struct nvkm_outp *);
 int nvkm_outp_acquire_or(struct nvkm_outp *, u8 user, bool hda);
+int nvkm_outp_acquire_ior(struct nvkm_outp *, u8 user, struct nvkm_ior *);
 void nvkm_outp_release(struct nvkm_outp *);
 void nvkm_outp_release_or(struct nvkm_outp *, u8 user);
 void nvkm_outp_route(struct nvkm_disp *);
@@ -90,6 +92,7 @@ struct nvkm_outp_func {
 	int (*detect)(struct nvkm_outp *);
 	int (*edid_get)(struct nvkm_outp *, u8 *data, u16 *size);
 
+	struct nvkm_ior *(*inherit)(struct nvkm_outp *);
 	int (*acquire)(struct nvkm_outp *);
 	void (*release)(struct nvkm_outp *);
 	void (*disable)(struct nvkm_outp *, struct nvkm_ior *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 828db77af242b..31b76f17fa70a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -252,6 +252,69 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 	return 0;
 }
 
+static int
+nvkm_uoutp_mthd_inherit(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_inherit_args *args = argv;
+	struct nvkm_ior *ior;
+	int ret = 0;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+		return -ENOSYS;
+
+	/* Ensure an ior is hooked up to this outp already */
+	ior = outp->func->inherit(outp);
+	if (!ior)
+		return -ENODEV;
+
+	/* With iors, there will be a separate output path for each type of connector - and all of
+	 * them will appear to be hooked up. Figure out which one is actually the one we're using
+	 * based on the protocol we were given over nvif
+	 */
+	switch (args->v0.proto) {
+	case NVIF_OUTP_INHERIT_V0_TMDS:
+		if (ior->arm.proto != TMDS)
+			return -ENODEV;
+		break;
+	case NVIF_OUTP_INHERIT_V0_DP:
+		if (ior->arm.proto != DP)
+			return -ENODEV;
+		break;
+	case NVIF_OUTP_INHERIT_V0_LVDS:
+		if (ior->arm.proto != LVDS)
+			return -ENODEV;
+		break;
+	case NVIF_OUTP_INHERIT_V0_TV:
+		if (ior->arm.proto != TV)
+			return -ENODEV;
+		break;
+	case NVIF_OUTP_INHERIT_V0_RGB_CRT:
+		if (ior->arm.proto != CRT)
+			return -ENODEV;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	/* Make sure that userspace hasn't already acquired this */
+	if (outp->acquired) {
+		OUTP_ERR(outp, "cannot inherit an already acquired (%02x) outp", outp->acquired);
+		return -EBUSY;
+	}
+
+	/* Mark the outp acquired by userspace now that we've confirmed it's already active */
+	OUTP_TRACE(outp, "inherit %02x |= %02x %p", outp->acquired, NVKM_OUTP_USER, ior);
+	nvkm_outp_acquire_ior(outp, NVKM_OUTP_USER, ior);
+
+	args->v0.or = ior->id;
+	args->v0.link = ior->arm.link;
+	args->v0.head = ffs(ior->arm.head) - 1;
+	args->v0.proto = ior->arm.proto_evo;
+
+	return ret;
+}
+
 static int
 nvkm_uoutp_mthd_load_detect(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -334,6 +397,7 @@ nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc
 	switch (mthd) {
 	case NVIF_OUTP_V0_DETECT     : return nvkm_uoutp_mthd_detect     (outp, argv, argc);
 	case NVIF_OUTP_V0_EDID_GET   : return nvkm_uoutp_mthd_edid_get   (outp, argv, argc);
+	case NVIF_OUTP_V0_INHERIT    : return nvkm_uoutp_mthd_inherit    (outp, argv, argc);
 	case NVIF_OUTP_V0_ACQUIRE    : return nvkm_uoutp_mthd_acquire    (outp, argv, argc);
 	case NVIF_OUTP_V0_LOAD_DETECT: return nvkm_uoutp_mthd_load_detect(outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_PWR : return nvkm_uoutp_mthd_dp_aux_pwr (outp, argv, argc);
-- 
2.41.0

