Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7A77A6DFC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B4810E3C3;
	Tue, 19 Sep 2023 22:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC1110E3C2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SGNXwGho401OXuG8J+wfT9EaRZIHXAHAHeEbMijFI2M=;
 b=GOB8GcIDU4M0SggP0Z2DrNzc8hBopcXEh3uHo46JPqjhidv2OL4o+P9/XMuKI3b20obHh5
 uT5pO3UorVEWIY8LwHgLWkFpU1zs50OPDgpgHPFLKPPA1WaS5l8DI0KlGK3t7d/cYgm9Zc
 /4K3gdaulGzxbjo1IVUoCPa/45XpJ9o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-z8f89xifMaujjjgtQb7GMw-1; Tue, 19 Sep 2023 18:05:44 -0400
X-MC-Unique: z8f89xifMaujjjgtQb7GMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A074185A5BD;
 Tue, 19 Sep 2023 22:05:41 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3877A40C2064;
 Tue, 19 Sep 2023 22:05:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 12/44] drm/nouveau/disp: add acquire_dac()
Date: Tue, 19 Sep 2023 17:56:07 -0400
Message-ID: <20230919220442.202488-13-lyude@redhat.com>
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
- this one is basically just a rename

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c          |  3 ++-
 drivers/gpu/drm/nouveau/include/nvif/if0012.h    |  5 ++---
 drivers/gpu/drm/nouveau/include/nvif/outp.h      |  9 ++++++++-
 drivers/gpu/drm/nouveau/nvif/outp.c              | 10 +++++-----
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c |  4 ++--
 5 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 290f3c80ba4eb..62fd910ffef61 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -502,7 +502,8 @@ nv50_dac_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 
 	ctrl |= NVDEF(NV507D, DAC_SET_CONTROL, PROTOCOL, RGB_CRT);
 
-	nvif_outp_acquire_rgb_crt(&nv_encoder->outp);
+	if (!nvif_outp_acquired(&nv_encoder->outp))
+		nvif_outp_acquire_dac(&nv_encoder->outp);
 
 	core->func->dac->ctrl(core, nv_encoder->outp.or.id, ctrl, asyh);
 	asyh->or.depth = 0;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 6cfc885e0aa9a..d139d070c0bc6 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -59,12 +59,11 @@ union nvif_outp_load_detect_args {
 union nvif_outp_acquire_args {
 	struct nvif_outp_acquire_v0 {
 		__u8 version;
-#define NVIF_OUTP_ACQUIRE_V0_RGB_CRT 0x00
-#define NVIF_OUTP_ACQUIRE_V0_TV      0x01
+#define NVIF_OUTP_ACQUIRE_V0_DAC  0x00
 #define NVIF_OUTP_ACQUIRE_V0_TMDS    0x02
 #define NVIF_OUTP_ACQUIRE_V0_LVDS    0x03
 #define NVIF_OUTP_ACQUIRE_V0_DP      0x04
-		__u8 proto;
+		__u8 type;
 		__u8 or;
 		__u8 link;
 		__u8 pad04[4];
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index 23776057bfea8..c6d8823ef782c 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -28,7 +28,7 @@ enum nvif_outp_detect_status nvif_outp_detect(struct nvif_outp *);
 int nvif_outp_edid_get(struct nvif_outp *, u8 **pedid);
 
 int nvif_outp_load_detect(struct nvif_outp *, u32 loadval);
-int nvif_outp_acquire_rgb_crt(struct nvif_outp *);
+int nvif_outp_acquire_dac(struct nvif_outp *);
 int nvif_outp_acquire_tmds(struct nvif_outp *, int head,
 			   bool hdmi, u8 max_ac_packet, u8 rekey, u8 scdc, bool hda);
 int nvif_outp_acquire_lvds(struct nvif_outp *, bool dual, bool bpc8);
@@ -40,6 +40,13 @@ int nvif_outp_inherit_tmds(struct nvif_outp *outp, u8 *proto_out);
 int nvif_outp_inherit_dp(struct nvif_outp *outp, u8 *proto_out);
 
 void nvif_outp_release(struct nvif_outp *);
+
+static inline bool
+nvif_outp_acquired(struct nvif_outp *outp)
+{
+	return outp->or.id >= 0;
+}
+
 int nvif_outp_infoframe(struct nvif_outp *, u8 type, struct nvif_outp_infoframe_v0 *, u32 size);
 int nvif_outp_hda_eld(struct nvif_outp *, int head, void *data, u32 size);
 int nvif_outp_dp_aux_pwr(struct nvif_outp *, bool enable);
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index eecccfc17c1c6..41c4de40895f0 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -171,12 +171,12 @@ nvif_outp_release(struct nvif_outp *outp)
 }
 
 static inline int
-nvif_outp_acquire(struct nvif_outp *outp, u8 proto, struct nvif_outp_acquire_v0 *args)
+nvif_outp_acquire(struct nvif_outp *outp, u8 type, struct nvif_outp_acquire_v0 *args)
 {
 	int ret;
 
 	args->version = 0;
-	args->proto = proto;
+	args->type = type;
 
 	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_ACQUIRE, args, sizeof(*args));
 	if (ret)
@@ -188,13 +188,13 @@ nvif_outp_acquire(struct nvif_outp *outp, u8 proto, struct nvif_outp_acquire_v0
 }
 
 int
-nvif_outp_acquire_rgb_crt(struct nvif_outp *outp)
+nvif_outp_acquire_dac(struct nvif_outp *outp)
 {
 	struct nvif_outp_acquire_v0 args;
 	int ret;
 
-	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_RGB_CRT, &args);
-	NVIF_ERRON(ret, &outp->object, "[ACQUIRE proto:RGB_CRT] or:%d", args.or);
+	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_DAC, &args);
+	NVIF_ERRON(ret, &outp->object, "[ACQUIRE DAC] or:%d", args.or);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index d56a87ae5b265..73c6227446fb8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -217,8 +217,8 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 	if (outp->ior)
 		return -EBUSY;
 
-	switch (args->v0.proto) {
-	case NVIF_OUTP_ACQUIRE_V0_RGB_CRT:
+	switch (args->v0.type) {
+	case NVIF_OUTP_ACQUIRE_V0_DAC:
 		ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, false);
 		break;
 	case NVIF_OUTP_ACQUIRE_V0_TMDS:
-- 
2.41.0

