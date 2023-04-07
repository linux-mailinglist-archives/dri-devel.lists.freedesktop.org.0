Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0426DB66A
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 00:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF7210EE6E;
	Fri,  7 Apr 2023 22:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C55210EE6E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 22:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680906131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LG5Nmdy6XcajSK/col6unkyOVMaFNHAIH5A5kWAD+3g=;
 b=VUf+0RkrDxAJTAZQ6ttwruOBH6dRNDhdTBoYkK2oq3neKrRgpMkm2u2+dZqzmKD3CS2Qe6
 Ec3ZwFybgRNgfxsuB07LUO5aUZxWhC9kWoFTPjizSnHBNgO+CsoVkO/pkfKTKwoqr4EleP
 j7o2mEwdu/eFr/lBQL5SAWbU8lBmrt8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-MgzOH8_kNC-mYygbkJB5FA-1; Fri, 07 Apr 2023 18:22:08 -0400
X-MC-Unique: MgzOH8_kNC-mYygbkJB5FA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B257F811E7C;
 Fri,  7 Apr 2023 22:22:07 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.8.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 425DF440BC;
 Fri,  7 Apr 2023 22:22:07 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 2/2] drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for
 reading IOR state
Date: Fri,  7 Apr 2023 18:21:32 -0400
Message-Id: <20230407222133.1425969-2-lyude@redhat.com>
In-Reply-To: <20230407222133.1425969-1-lyude@redhat.com>
References: <20230407222133.1425969-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, open list <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Kees Cook <keescook@chromium.org>
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
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 103 +++++++++++++++++-
 drivers/gpu/drm/nouveau/include/nvif/if0012.h |  18 +++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |   5 +
 drivers/gpu/drm/nouveau/nvif/outp.c           |  68 ++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   |  40 +++++--
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |   3 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  |  64 +++++++++++
 7 files changed, 288 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index ed9d374147b8..1c2dfae75c76 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1711,7 +1711,8 @@ nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
 
 	drm_connector_attach_encoder(connector, encoder);
 
-	disp->core->func->sor->get_caps(disp, nv_encoder, ffs(dcbe->or) - 1);
+	nv_encoder->or = ffs(dcbe->or) - 1;
+	disp->core->func->sor->get_caps(disp, nv_encoder, nv_encoder->or);
 	nv50_outp_dump_caps(drm, nv_encoder);
 
 	if (dcbe->type == DCB_OUTPUT_DP) {
@@ -2473,6 +2474,103 @@ nv50_display_fini(struct drm_device *dev, bool runtime, bool suspend)
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
+	if (ret >= 0) {
+		head_idx = ret;
+		ret = 0;
+	} else if (ret == -ENODEV) {
+		return;
+	}
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
+
+	outp->crtc = crtc;
+	outp->ctrl = NVVAL(NV507D, SOR_SET_CONTROL, PROTOCOL, proto) | BIT(crtc->index);
+
+	conn->state->crtc = crtc;
+	conn->state->best_encoder = &outp->base.base;
+}
+
+/* Read back the currently programmed display state */
+void
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
@@ -2490,6 +2588,9 @@ nv50_display_init(struct drm_device *dev, bool resume, bool runtime)
 		}
 	}
 
+	if (!runtime)
+		nv50_display_read_hw_state(nouveau_drm(dev));
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index eb99d84eb844..6a2dd58e711e 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -18,6 +18,7 @@ union nvif_outp_args {
 #define NVIF_OUTP_V0_DP_AUX_PWR  0x05
 #define NVIF_OUTP_V0_DP_RETRAIN  0x06
 #define NVIF_OUTP_V0_DP_MST_VCPI 0x07
+#define NVIF_OUTP_V0_INHERIT     0x08
 
 union nvif_outp_load_detect_args {
 	struct nvif_outp_load_detect_v0 {
@@ -69,6 +70,23 @@ union nvif_outp_acquire_args {
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
+		__u8 pad[3];
+	} v0;
+};
+
 union nvif_outp_release_args {
 	struct nvif_outp_release_vn {
 	} vn;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index fa76a7b5e4b3..00d7ffb2d295 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -24,6 +24,11 @@ int nvif_outp_acquire_tmds(struct nvif_outp *, int head,
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
index c24bc5eae3ec..02d7253f2299 100644
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
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index 06b19883a06b..b6efb7e1ab47 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -102,8 +102,8 @@ nvkm_outp_release(struct nvkm_outp *outp, u8 user)
 	}
 }
 
-static inline int
-nvkm_outp_acquire_ior(struct nvkm_outp *outp, u8 user, struct nvkm_ior *ior)
+int
+_nvkm_outp_acquire_ior(struct nvkm_outp *outp, u8 user, struct nvkm_ior *ior)
 {
 	outp->ior = ior;
 	outp->ior->asy.outp = outp;
@@ -123,7 +123,7 @@ nvkm_outp_acquire_hda(struct nvkm_outp *outp, enum nvkm_ior_type type,
 		if (!ior->identity && ior->hda == hda &&
 		    !ior->asy.outp && ior->type == type && !ior->arm.outp &&
 		    (ior->func->route.set || ior->id == __ffs(outp->info.or)))
-			return nvkm_outp_acquire_ior(outp, user, ior);
+			return _nvkm_outp_acquire_ior(outp, user, ior);
 	}
 
 	/* Last resort is to assign an OR that's already active on HW,
@@ -133,7 +133,7 @@ nvkm_outp_acquire_hda(struct nvkm_outp *outp, enum nvkm_ior_type type,
 		if (!ior->identity && ior->hda == hda &&
 		    !ior->asy.outp && ior->type == type &&
 		    (ior->func->route.set || ior->id == __ffs(outp->info.or)))
-			return nvkm_outp_acquire_ior(outp, user, ior);
+			return _nvkm_outp_acquire_ior(outp, user, ior);
 	}
 
 	return -ENOSPC;
@@ -162,7 +162,7 @@ nvkm_outp_acquire(struct nvkm_outp *outp, u8 user, bool hda)
 		ior = nvkm_ior_find(outp->disp, SOR, ffs(outp->info.or) - 1);
 		if (WARN_ON(!ior))
 			return -ENOSPC;
-		return nvkm_outp_acquire_ior(outp, user, ior);
+		return _nvkm_outp_acquire_ior(outp, user, ior);
 	}
 
 	/* First preference is to reuse the OR that is currently armed
@@ -182,7 +182,7 @@ nvkm_outp_acquire(struct nvkm_outp *outp, u8 user, bool hda)
 			 *     This warning is to make it obvious if that proves wrong.
 			 */
 			WARN_ON(hda && !ior->hda);
-			return nvkm_outp_acquire_ior(outp, user, ior);
+			return _nvkm_outp_acquire_ior(outp, user, ior);
 		}
 	}
 
@@ -214,30 +214,30 @@ nvkm_outp_fini(struct nvkm_outp *outp)
 		outp->func->fini(outp);
 }
 
-static void
-nvkm_outp_init_route(struct nvkm_outp *outp)
+struct nvkm_ior *
+nvkm_outp_get_current_ior(struct nvkm_outp *outp)
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
 	if (WARN_ON(!ior))
-		return;
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
@@ -247,6 +247,22 @@ nvkm_outp_init_route(struct nvkm_outp *outp)
 
 	ior = nvkm_ior_find(disp, type, id);
 	if (WARN_ON(!ior))
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
+	ior = nvkm_outp_get_current_ior(outp);
+	if (!ior)
 		return;
 
 	/* Determine if the OR is already configured for this device. */
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index b7631c1ab242..00d56274a565 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -74,8 +74,11 @@ void nvkm_outp_del(struct nvkm_outp **);
 void nvkm_outp_init(struct nvkm_outp *);
 void nvkm_outp_fini(struct nvkm_outp *);
 int nvkm_outp_acquire(struct nvkm_outp *, u8 user, bool hda);
+int _nvkm_outp_acquire_ior(struct nvkm_outp *outp, u8 user, struct nvkm_ior *ior);
+
 void nvkm_outp_release(struct nvkm_outp *, u8 user);
 void nvkm_outp_route(struct nvkm_disp *);
+struct nvkm_ior *nvkm_outp_get_current_ior(struct nvkm_outp *outp);
 
 struct nvkm_outp_func {
 	void *(*dtor)(struct nvkm_outp *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 4f0ca709c85a..1d758e8b7486 100644
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
+	ior = nvkm_outp_get_current_ior(outp);
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
+	_nvkm_outp_acquire_ior(outp, NVKM_OUTP_USER, ior);
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
@@ -297,6 +360,7 @@ nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc
 	switch (mthd) {
 	case NVIF_OUTP_V0_LOAD_DETECT: return nvkm_uoutp_mthd_load_detect(outp, argv, argc);
 	case NVIF_OUTP_V0_ACQUIRE    : return nvkm_uoutp_mthd_acquire    (outp, argv, argc);
+	case NVIF_OUTP_V0_INHERIT    : return nvkm_uoutp_mthd_inherit    (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_PWR : return nvkm_uoutp_mthd_dp_aux_pwr (outp, argv, argc);
 	default:
 		break;
-- 
2.39.2

