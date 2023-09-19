Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6057A6E00
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E39210E3C8;
	Tue, 19 Sep 2023 22:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EA710E2BD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yT+J4y9FRW3D8rJ5GtfqgcbKDItCYfRaSNq2WnXn0ek=;
 b=QYK6/CFihyFCV+GdWRfi+A6k4jGpE6mo0fzXhbIHtI/ghXYc1I2G6xdnA694wF6DE/H5LL
 TbLFs484t1T++hitet+dLgDpR4agDys2q0HAO90KNCg0OuEhv5tPXS8b0yNp06c3EQuZTx
 zcCFFjy9C8OWbKZJ3ZFz8EdLB1+J05A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-ZCce6f82POaX5mLCEthv3g-1; Tue, 19 Sep 2023 18:05:47 -0400
X-MC-Unique: ZCce6f82POaX5mLCEthv3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5890D8039CF;
 Tue, 19 Sep 2023 22:05:47 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E37A040C2064;
 Tue, 19 Sep 2023 22:05:46 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 13/44] drm/nouveau/disp: add acquire_sor/pior()
Date: Tue, 19 Sep 2023 17:56:08 -0400
Message-ID: <20230919220442.202488-14-lyude@redhat.com>
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

- preparing to move protocol-specific args out of acquire() again
- avoid re-acquiring acquired output, will matter when enforced later
- sor/pior done at same time due to shared tmds/dp handling

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 15 ++++++----
 drivers/gpu/drm/nouveau/include/nvif/if0012.h |  7 ++++-
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  2 ++
 drivers/gpu/drm/nouveau/nvif/outp.c           | 24 ++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 28 ++++++-------------
 5 files changed, 50 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 62fd910ffef61..814d2be34d202 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1034,7 +1034,7 @@ nv50_msto_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *st
 		return;
 
 	if (!mstm->links++) {
-		/*XXX: MST audio. */
+		nvif_outp_acquire_sor(&mstm->outp->outp, false /*TODO: MST audio... */);
 		nvif_outp_acquire_dp(&mstm->outp->outp, mstm->outp->dp.dpcd, 0, 0, false, true);
 	}
 
@@ -1602,15 +1602,17 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 
 	if ((disp->disp->object.oclass == GT214_DISP ||
 	     disp->disp->object.oclass >= GF110_DISP) &&
+	    nv_encoder->dcb->type != DCB_OUTPUT_LVDS &&
 	    drm_detect_monitor_audio(nv_connector->edid))
 		hda = true;
 
+	if (!nvif_outp_acquired(outp))
+		nvif_outp_acquire_sor(outp, hda);
+
 	switch (nv_encoder->dcb->type) {
 	case DCB_OUTPUT_TMDS:
-		if (disp->disp->object.oclass == NV50_DISP ||
-		    !drm_detect_hdmi_monitor(nv_connector->edid))
-			nvif_outp_acquire_tmds(outp, nv_crtc->index, false, 0, 0, 0, false);
-		else
+		if (disp->disp->object.oclass != NV50_DISP &&
+		    drm_detect_hdmi_monitor(nv_connector->edid))
 			nv50_hdmi_enable(encoder, nv_crtc, nv_connector, state, mode, hda);
 
 		if (nv_encoder->outp.or.link & 1) {
@@ -1850,6 +1852,9 @@ nv50_pior_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *st
 	default: asyh->or.depth = NV837D_PIOR_SET_CONTROL_PIXEL_DEPTH_DEFAULT; break;
 	}
 
+	if (!nvif_outp_acquired(&nv_encoder->outp))
+		nvif_outp_acquire_pior(&nv_encoder->outp);
+
 	switch (nv_encoder->dcb->type) {
 	case DCB_OUTPUT_TMDS:
 		ctrl |= NVDEF(NV507D, PIOR_SET_CONTROL, PROTOCOL, EXT_TMDS_ENC);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index d139d070c0bc6..57bc4b2f2b170 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -60,7 +60,9 @@ union nvif_outp_acquire_args {
 	struct nvif_outp_acquire_v0 {
 		__u8 version;
 #define NVIF_OUTP_ACQUIRE_V0_DAC  0x00
-#define NVIF_OUTP_ACQUIRE_V0_TMDS    0x02
+#define NVIF_OUTP_ACQUIRE_V0_SOR  0x01
+#define NVIF_OUTP_ACQUIRE_V0_PIOR 0x02
+#define NVIF_OUTP_ACQUIRE_V0_TMDS    0x05
 #define NVIF_OUTP_ACQUIRE_V0_LVDS    0x03
 #define NVIF_OUTP_ACQUIRE_V0_DP      0x04
 		__u8 type;
@@ -68,6 +70,9 @@ union nvif_outp_acquire_args {
 		__u8 link;
 		__u8 pad04[4];
 		union {
+			struct {
+				__u8 hda;
+			} sor;
 			struct {
 				__u8 head;
 				__u8 hdmi;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index c6d8823ef782c..a9090424dbf7e 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -29,6 +29,8 @@ int nvif_outp_edid_get(struct nvif_outp *, u8 **pedid);
 
 int nvif_outp_load_detect(struct nvif_outp *, u32 loadval);
 int nvif_outp_acquire_dac(struct nvif_outp *);
+int nvif_outp_acquire_sor(struct nvif_outp *, bool hda);
+int nvif_outp_acquire_pior(struct nvif_outp *);
 int nvif_outp_acquire_tmds(struct nvif_outp *, int head,
 			   bool hdmi, u8 max_ac_packet, u8 rekey, u8 scdc, bool hda);
 int nvif_outp_acquire_lvds(struct nvif_outp *, bool dual, bool bpc8);
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 41c4de40895f0..81dbda52117ec 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -187,6 +187,30 @@ nvif_outp_acquire(struct nvif_outp *outp, u8 type, struct nvif_outp_acquire_v0 *
 	return 0;
 }
 
+int
+nvif_outp_acquire_pior(struct nvif_outp *outp)
+{
+	struct nvif_outp_acquire_v0 args;
+	int ret;
+
+	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_PIOR, &args);
+	NVIF_ERRON(ret, &outp->object, "[ACQUIRE PIOR] or:%d", args.or);
+	return ret;
+}
+
+int
+nvif_outp_acquire_sor(struct nvif_outp *outp, bool hda)
+{
+	struct nvif_outp_acquire_v0 args;
+	int ret;
+
+	args.sor.hda = hda;
+
+	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_SOR, &args);
+	NVIF_ERRON(ret, &outp->object, "[ACQUIRE SOR] or:%d link:%d", args.or, args.link);
+	return ret;
+}
+
 int
 nvif_outp_acquire_dac(struct nvif_outp *outp)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 73c6227446fb8..d71bc188047e3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -61,12 +61,6 @@ static int
 nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 			   u8 link_nr, u8 link_bw, bool hda, bool mst)
 {
-	int ret;
-
-	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, hda);
-	if (ret)
-		return ret;
-
 	memcpy(outp->dp.dpcd, dpcd, sizeof(outp->dp.dpcd));
 	outp->dp.lt.nr = link_nr;
 	outp->dp.lt.bw = link_bw;
@@ -146,25 +140,16 @@ static int
 nvkm_uoutp_mthd_acquire_tmds(struct nvkm_outp *outp, u8 head, u8 hdmi, u8 hdmi_max_ac_packet,
 			     u8 hdmi_rekey, u8 hdmi_scdc, u8 hdmi_hda)
 {
-	struct nvkm_ior *ior;
-	int ret;
+	struct nvkm_ior *ior = outp->ior;
 
 	if (!(outp->asy.head = nvkm_head_find(outp->disp, head)))
 		return -EINVAL;
 
-	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, hdmi && hdmi_hda);
-	if (ret)
-		return ret;
-
-	ior = outp->ior;
-
 	if (hdmi) {
 		if (!ior->func->hdmi ||
 		    hdmi_max_ac_packet > 0x1f || hdmi_rekey > 0x7f ||
-		    (hdmi_scdc && !ior->func->hdmi->scdc)) {
-			nvkm_outp_release_or(outp, NVKM_OUTP_USER);
+		    (hdmi_scdc && !ior->func->hdmi->scdc))
 			return -EINVAL;
-		}
 
 		ior->func->hdmi->ctrl(ior, head, hdmi, hdmi_max_ac_packet, hdmi_rekey);
 		if (ior->func->hdmi->scdc)
@@ -182,8 +167,7 @@ nvkm_uoutp_mthd_acquire_lvds(struct nvkm_outp *outp, bool dual, bool bpc8)
 
 	outp->lvds.dual = dual;
 	outp->lvds.bpc8 = bpc8;
-
-	return nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, false);
+	return 0;
 }
 
 static int
@@ -214,13 +198,17 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 
 	if (argc != sizeof(args->v0) || args->v0.version != 0)
 		return -ENOSYS;
-	if (outp->ior)
+	if (outp->ior && args->v0.type <= NVIF_OUTP_ACQUIRE_V0_PIOR)
 		return -EBUSY;
 
 	switch (args->v0.type) {
 	case NVIF_OUTP_ACQUIRE_V0_DAC:
+	case NVIF_OUTP_ACQUIRE_V0_PIOR:
 		ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, false);
 		break;
+	case NVIF_OUTP_ACQUIRE_V0_SOR:
+		ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, args->v0.sor.hda);
+		break;
 	case NVIF_OUTP_ACQUIRE_V0_TMDS:
 		ret = nvkm_uoutp_mthd_acquire_tmds(outp, args->v0.tmds.head,
 							 args->v0.tmds.hdmi,
-- 
2.41.0

