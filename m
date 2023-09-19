Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 770F87A6E0F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC2610E3E3;
	Tue, 19 Sep 2023 22:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040FB10E3DC
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hvoEGCNGn7Ns+we8ALOCsYRRVaDzKXMCKh4a2FlItq0=;
 b=XvfFk599Z44uOg6SJhpdR0pxJ+nPv1ObYDCQ9Uo/gvsln3kF4xq0XoxuCd+iBK6D73vlS5
 FCgqYg/asI/IpwW5zX6IgdZNlk9uEiJ/UxYevcY+v0//RLHppQ4QNRkjfsMIaCTvNqWJuw
 9wnJOeFeb8OzO7VAebqgpS+IbRM+Fzw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-CkM-iaNZPBG8ExpMlSkbzw-1; Tue, 19 Sep 2023 18:06:04 -0400
X-MC-Unique: CkM-iaNZPBG8ExpMlSkbzw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 621498001EA;
 Tue, 19 Sep 2023 22:06:04 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE60A40C2064;
 Tue, 19 Sep 2023 22:06:03 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 19/44] drm/nouveau/disp: add output hdmi config method
Date: Tue, 19 Sep 2023 17:56:14 -0400
Message-ID: <20230919220442.202488-20-lyude@redhat.com>
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

From: Ben Skeggs <bskeggs@redhat.com>

- was previously part of acquire()
- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 10 ++---
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 28 ++++++++------
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  5 ++-
 drivers/gpu/drm/nouveau/nvif/outp.c           | 33 +++++++++--------
 .../gpu/drm/nouveau/nvkm/engine/disp/gm200.c  | 16 ++++++--
 .../gpu/drm/nouveau/nvkm/engine/disp/ior.h    |  5 ++-
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 37 +++++++++----------
 7 files changed, 74 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 99aa8d208711c..7a7b3464a6671 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -778,7 +778,6 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 	struct drm_hdmi_info *hdmi = &nv_connector->base.display_info.hdmi;
 	union hdmi_infoframe infoframe = { 0 };
 	const u8 rekey = 56; /* binary driver, and tegra, constant */
-	u8 scdc = 0;
 	u32 max_ac_packet;
 	struct {
 		struct nvif_outp_infoframe_v0 infoframe;
@@ -791,8 +790,9 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 	max_ac_packet -= 18; /* constant from tegra */
 	max_ac_packet /= 32;
 
-	if (hdmi->scdc.scrambling.supported) {
+	if (nv_encoder->i2c && hdmi->scdc.scrambling.supported) {
 		const bool high_tmds_clock_ratio = mode->clock > 340000;
+		u8 scdc;
 
 		ret = drm_scdc_readb(nv_encoder->i2c, SCDC_TMDS_CONFIG, &scdc);
 		if (ret < 0) {
@@ -812,8 +812,9 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 				 scdc, ret);
 	}
 
-	ret = nvif_outp_acquire_tmds(&nv_encoder->outp, nv_crtc->index, true,
-				     max_ac_packet, rekey, scdc, hda);
+	ret = nvif_outp_hdmi(&nv_encoder->outp, nv_crtc->index, true, max_ac_packet, rekey,
+			     mode->clock, hdmi->scdc.supported, hdmi->scdc.scrambling.supported,
+			     hdmi->scdc.scrambling.low_rates);
 	if (ret)
 		return;
 
@@ -1852,7 +1853,6 @@ nv50_pior_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *st
 	switch (nv_encoder->dcb->type) {
 	case DCB_OUTPUT_TMDS:
 		ctrl |= NVDEF(NV507D, PIOR_SET_CONTROL, PROTOCOL, EXT_TMDS_ENC);
-		nvif_outp_acquire_tmds(&nv_encoder->outp, false, false, 0, 0, 0, false);
 		break;
 	case DCB_OUTPUT_DP:
 		ctrl |= NVDEF(NV507D, PIOR_SET_CONTROL, PROTOCOL, EXT_TMDS_ENC);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 57bc4b2f2b170..230084d675ec2 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -21,6 +21,8 @@ union nvif_outp_args {
 
 #define NVIF_OUTP_V0_LOAD_DETECT   0x20
 
+#define NVIF_OUTP_V0_HDMI          0x50
+
 #define NVIF_OUTP_V0_INFOFRAME     0x60
 #define NVIF_OUTP_V0_HDA_ELD       0x61
 
@@ -62,7 +64,6 @@ union nvif_outp_acquire_args {
 #define NVIF_OUTP_ACQUIRE_V0_DAC  0x00
 #define NVIF_OUTP_ACQUIRE_V0_SOR  0x01
 #define NVIF_OUTP_ACQUIRE_V0_PIOR 0x02
-#define NVIF_OUTP_ACQUIRE_V0_TMDS    0x05
 #define NVIF_OUTP_ACQUIRE_V0_LVDS    0x03
 #define NVIF_OUTP_ACQUIRE_V0_DP      0x04
 		__u8 type;
@@ -73,17 +74,6 @@ union nvif_outp_acquire_args {
 			struct {
 				__u8 hda;
 			} sor;
-			struct {
-				__u8 head;
-				__u8 hdmi;
-				__u8 hdmi_max_ac_packet;
-				__u8 hdmi_rekey;
-#define NVIF_OUTP_ACQUIRE_V0_TMDS_HDMI_SCDC_SCRAMBLE (1 << 0)
-#define NVIF_OUTP_ACQUIRE_V0_TMDS_HDMI_SCDC_DIV_BY_4 (1 << 1)
-				__u8 hdmi_scdc;
-				__u8 hdmi_hda;
-				__u8 pad06[2];
-			} tmds;
 			struct {
 				__u8 dual;
 				__u8 bpc8;
@@ -128,6 +118,20 @@ union nvif_outp_release_args {
 	} vn;
 };
 
+union nvif_outp_hdmi_args {
+	struct nvif_outp_hdmi_v0 {
+		__u8 version;
+		__u8 head;
+		__u8 enable;
+		__u8 max_ac_packet;
+		__u8 rekey;
+		__u8 scdc;
+		__u8 scdc_scrambling;
+		__u8 scdc_low_rates;
+		__u32 khz;
+	} v0;
+};
+
 union nvif_outp_infoframe_args {
 	struct nvif_outp_infoframe_v0 {
 		__u8 version;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index a9090424dbf7e..ea60d418d7f09 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -31,8 +31,6 @@ int nvif_outp_load_detect(struct nvif_outp *, u32 loadval);
 int nvif_outp_acquire_dac(struct nvif_outp *);
 int nvif_outp_acquire_sor(struct nvif_outp *, bool hda);
 int nvif_outp_acquire_pior(struct nvif_outp *);
-int nvif_outp_acquire_tmds(struct nvif_outp *, int head,
-			   bool hdmi, u8 max_ac_packet, u8 rekey, u8 scdc, bool hda);
 int nvif_outp_acquire_lvds(struct nvif_outp *, bool dual, bool bpc8);
 int nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 			 int link_nr, int link_bw, bool hda, bool mst);
@@ -49,6 +47,9 @@ nvif_outp_acquired(struct nvif_outp *outp)
 	return outp->or.id >= 0;
 }
 
+int nvif_outp_hdmi(struct nvif_outp *, int head, bool enable, u8 max_ac_packet, u8 rekey, u32 khz,
+		   bool scdc, bool scdc_scrambling, bool scdc_low_rates);
+
 int nvif_outp_infoframe(struct nvif_outp *, u8 type, struct nvif_outp_infoframe_v0 *, u32 size);
 int nvif_outp_hda_eld(struct nvif_outp *, int head, void *data, u32 size);
 int nvif_outp_dp_aux_pwr(struct nvif_outp *, bool enable);
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 81dbda52117ec..6e1bcc265d07f 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -124,25 +124,28 @@ nvif_outp_infoframe(struct nvif_outp *outp, u8 type, struct nvif_outp_infoframe_
 }
 
 int
-nvif_outp_acquire_tmds(struct nvif_outp *outp, int head,
-		       bool hdmi, u8 max_ac_packet, u8 rekey, u8 scdc, bool hda)
+nvif_outp_hdmi(struct nvif_outp *outp, int head, bool enable, u8 max_ac_packet, u8 rekey,
+	       u32 khz, bool scdc, bool scdc_scrambling, bool scdc_low_rates)
 {
-	struct nvif_outp_acquire_v0 args;
+	struct nvif_outp_hdmi_v0 args;
 	int ret;
 
-	args.tmds.head = head;
-	args.tmds.hdmi = hdmi;
-	args.tmds.hdmi_max_ac_packet = max_ac_packet;
-	args.tmds.hdmi_rekey = rekey;
-	args.tmds.hdmi_scdc = scdc;
-	args.tmds.hdmi_hda = hda;
-
-	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_TMDS, &args);
+	args.version = 0;
+	args.head = head;
+	args.enable = enable;
+	args.max_ac_packet = max_ac_packet;
+	args.rekey = rekey;
+	args.khz = khz;
+	args.scdc = scdc;
+	args.scdc_scrambling = scdc_scrambling;
+	args.scdc_low_rates = scdc_low_rates;
+
+	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_HDMI, &args, sizeof(args));
 	NVIF_ERRON(ret, &outp->object,
-		   "[ACQUIRE proto:TMDS head:%d hdmi:%d max_ac_packet:%d rekey:%d scdc:%d hda:%d]"
-		   " or:%d link:%d", args.tmds.head, args.tmds.hdmi, args.tmds.hdmi_max_ac_packet,
-		   args.tmds.hdmi_rekey, args.tmds.hdmi_scdc, args.tmds.hdmi_hda,
-		   args.or, args.link);
+		   "[HDMI head:%d enable:%d max_ac_packet:%d rekey:%d khz:%d scdc:%d "
+		   "scdc_scrambling:%d scdc_low_rates:%d]",
+		   args.head, args.enable, args.max_ac_packet, args.rekey, args.khz,
+		   args.scdc, args.scdc_scrambling, args.scdc_low_rates);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c
index 562ebae57d445..126a90805dee0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c
@@ -68,15 +68,23 @@ gm200_sor_dp = {
 };
 
 void
-gm200_sor_hdmi_scdc(struct nvkm_ior *ior, u8 scdc)
+gm200_sor_hdmi_scdc(struct nvkm_ior *ior, u32 khz, bool support, bool scrambling,
+		    bool scrambling_low_rates)
 {
 	struct nvkm_device *device = ior->disp->engine.subdev.device;
 	const u32 soff = nv50_ior_base(ior);
-	const u32 ctrl = scdc & 0x3;
+	u32 ctrl = 0;
 
-	nvkm_mask(device, 0x61c5bc + soff, 0x00000003, ctrl);
+	ior->tmds.high_speed = khz > 340000;
+
+	if (support && scrambling) {
+		if (ior->tmds.high_speed)
+			ctrl |= 0x00000002;
+		if (ior->tmds.high_speed || scrambling_low_rates)
+			ctrl |= 0x00000001;
+	}
 
-	ior->tmds.high_speed = !!(scdc & 0x2);
+	nvkm_mask(device, 0x61c5bc + soff, 0x00000003, ctrl);
 }
 
 const struct nvkm_ior_func_hdmi
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
index da1b1a626ef21..f8b9d16304e99 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
@@ -65,7 +65,8 @@ struct nvkm_ior_func {
 
 	const struct nvkm_ior_func_hdmi {
 		void (*ctrl)(struct nvkm_ior *, int head, bool enable, u8 max_ac_packet, u8 rekey);
-		void (*scdc)(struct nvkm_ior *, u8 scdc);
+		void (*scdc)(struct nvkm_ior *, u32 khz, bool support, bool scrambling,
+			     bool scrambling_low_rates);
 		void (*infoframe_avi)(struct nvkm_ior *, int head, void *data, u32 size);
 		void (*infoframe_vsi)(struct nvkm_ior *, int head, void *data, u32 size);
 	} *hdmi;
@@ -167,7 +168,7 @@ void gm107_sor_dp_pattern(struct nvkm_ior *, int);
 void gm200_sor_route_set(struct nvkm_outp *, struct nvkm_ior *);
 int gm200_sor_route_get(struct nvkm_outp *, int *);
 extern const struct nvkm_ior_func_hdmi gm200_sor_hdmi;
-void gm200_sor_hdmi_scdc(struct nvkm_ior *, u8);
+void gm200_sor_hdmi_scdc(struct nvkm_ior *, u32, bool, bool, bool);
 extern const struct nvkm_ior_func_dp gm200_sor_dp;
 void gm200_sor_dp_drive(struct nvkm_ior *, int, int, int, int, int);
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 042a43c22061e..8ba96323e1de5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -137,24 +137,28 @@ nvkm_uoutp_mthd_infoframe(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_acquire_tmds(struct nvkm_outp *outp, u8 head, u8 hdmi, u8 hdmi_max_ac_packet,
-			     u8 hdmi_rekey, u8 hdmi_scdc, u8 hdmi_hda)
+nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void *argv, u32 argc)
 {
+	union nvif_outp_hdmi_args *args = argv;
 	struct nvkm_ior *ior = outp->ior;
 
-	if (!(outp->asy.head = nvkm_head_find(outp->disp, head)))
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+		return -ENOSYS;
+
+	if (!(outp->asy.head = nvkm_head_find(outp->disp, args->v0.head)))
 		return -EINVAL;
 
-	if (hdmi) {
-		if (!ior->func->hdmi ||
-		    hdmi_max_ac_packet > 0x1f || hdmi_rekey > 0x7f ||
-		    (hdmi_scdc && !ior->func->hdmi->scdc))
-			return -EINVAL;
+	if (!ior->func->hdmi ||
+	    args->v0.max_ac_packet > 0x1f ||
+	    args->v0.rekey > 0x7f ||
+	    (args->v0.scdc && !ior->func->hdmi->scdc))
+		return -EINVAL;
 
-		ior->func->hdmi->ctrl(ior, head, hdmi, hdmi_max_ac_packet, hdmi_rekey);
-		if (ior->func->hdmi->scdc)
-			ior->func->hdmi->scdc(ior, hdmi_scdc);
-	}
+	ior->func->hdmi->ctrl(ior, args->v0.head, args->v0.enable,
+			      args->v0.max_ac_packet, args->v0.rekey);
+	if (ior->func->hdmi->scdc)
+		ior->func->hdmi->scdc(ior, args->v0.khz, args->v0.scdc, args->v0.scdc_scrambling,
+				      args->v0.scdc_low_rates);
 
 	return 0;
 }
@@ -209,14 +213,6 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 	case NVIF_OUTP_ACQUIRE_V0_SOR:
 		ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, args->v0.sor.hda);
 		break;
-	case NVIF_OUTP_ACQUIRE_V0_TMDS:
-		ret = nvkm_uoutp_mthd_acquire_tmds(outp, args->v0.tmds.head,
-							 args->v0.tmds.hdmi,
-							 args->v0.tmds.hdmi_max_ac_packet,
-							 args->v0.tmds.hdmi_rekey,
-							 args->v0.tmds.hdmi_scdc,
-							 args->v0.tmds.hdmi_hda);
-		break;
 	case NVIF_OUTP_ACQUIRE_V0_LVDS:
 		ret = nvkm_uoutp_mthd_acquire_lvds(outp, args->v0.lvds.dual, args->v0.lvds.bpc8);
 		break;
@@ -370,6 +366,7 @@ nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
 	switch (mthd) {
 	case NVIF_OUTP_V0_RELEASE      : return nvkm_uoutp_mthd_release      (outp, argv, argc);
+	case NVIF_OUTP_V0_HDMI         : return nvkm_uoutp_mthd_hdmi         (outp, argv, argc);
 	case NVIF_OUTP_V0_INFOFRAME    : return nvkm_uoutp_mthd_infoframe    (outp, argv, argc);
 	case NVIF_OUTP_V0_HDA_ELD      : return nvkm_uoutp_mthd_hda_eld      (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_RETRAIN   : return nvkm_uoutp_mthd_dp_retrain   (outp, argv, argc);
-- 
2.41.0

