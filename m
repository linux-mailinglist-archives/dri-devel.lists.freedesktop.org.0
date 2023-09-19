Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D079A7A6E3D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D817910E3FE;
	Tue, 19 Sep 2023 22:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB2010E3FF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BEnneeu2hwwJ1GjkrrSDN/AAquNA7OmmStlB2xLOjaI=;
 b=bWlk55t+CJhBUrxfQAeJ1AAibiDUe+Uoz4BnF6YQkgbw6rT3XV2m5FcUDj0eNtQ4jAqZwk
 8nu+CUK6DJOKbSQP3802ZkKU1WG+zyh205/zyW2JzVoE8XfxelgP9epdp3z6j75ana81vz
 INVn1vL3PKXiTAssNfTj/V4rcDGfTwU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-WdTEKt6FN3y18QQQEhAaUQ-1; Tue, 19 Sep 2023 18:07:19 -0400
X-MC-Unique: WdTEKt6FN3y18QQQEhAaUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C05E101A53B;
 Tue, 19 Sep 2023 22:07:19 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF58F40C2064;
 Tue, 19 Sep 2023 22:07:18 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 34/44] drm/nouveau/disp: add dp sst config method
Date: Tue, 19 Sep 2023 17:56:29 -0400
Message-ID: <20230919220442.202488-35-lyude@redhat.com>
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
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

This is presently unused on HW, we read a bunch of regs and calculate
the watermark during the second supervisor interrupt.

I don't want to change this yet as I need to re-remember how older HW
works exactly, but RM wants this info via RPC.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 12 +++++++++++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  1 +
 drivers/gpu/drm/nouveau/nvif/outp.c           | 18 ++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/ior.h    |  2 ++
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 21 +++++++++++++++++++
 5 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 00ce0a46c152b..6fb297b65ae87 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -36,6 +36,7 @@ union nvif_outp_args {
 #define NVIF_OUTP_V0_DP_RATES      0x72
 #define NVIF_OUTP_V0_DP_TRAIN      0x73
 #define NVIF_OUTP_V0_DP_DRIVE      0x74
+#define NVIF_OUTP_V0_DP_SST        0x75
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
 union nvif_outp_detect_args {
@@ -222,6 +223,17 @@ union nvif_outp_dp_drive_args {
 	} v0;
 };
 
+union nvif_outp_dp_sst_args {
+	struct nvif_outp_dp_sst_v0 {
+		__u8  version;
+		__u8  head;
+		__u8  pad02[2];
+		__u32 watermark;
+		__u32 hblanksym;
+		__u32 vblanksym;
+	} v0;
+};
+
 union nvif_outp_dp_mst_vcpi_args {
 	struct nvif_outp_dp_mst_vcpi_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index b4f97fabecbdc..881cbed5f0ee3 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -68,6 +68,7 @@ int nvif_outp_dp_train(struct nvif_outp *, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 		       u8 lttprs, u8 link_nr, u32 link_bw, bool mst, bool post_lt_adj,
 		       bool retrain);
 int nvif_outp_dp_drive(struct nvif_outp *, u8 link_nr, u8 pe[4], u8 vs[4]);
+int nvif_outp_dp_sst(struct nvif_outp *, int head, u32 watermark, u32 hblanksym, u32 vblanksym);
 int nvif_outp_dp_mst_vcpi(struct nvif_outp *, int head,
 			  u8 start_slot, u8 num_slots, u16 pbn, u16 aligned_pbn);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 5fe5523587e6a..952103aa93b78 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -46,6 +46,24 @@ nvif_outp_dp_mst_vcpi(struct nvif_outp *outp, int head,
 	return ret;
 }
 
+int
+nvif_outp_dp_sst(struct nvif_outp *outp, int head, u32 watermark, u32 hblanksym, u32 vblanksym)
+{
+	struct nvif_outp_dp_sst_v0 args;
+	int ret;
+
+	args.version = 0;
+	args.head = head;
+	args.watermark = watermark;
+	args.hblanksym = hblanksym;
+	args.vblanksym = vblanksym;
+	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_SST, &args, sizeof(args));
+	NVIF_ERRON(ret, &outp->object,
+		   "[DP_SST head:%d watermark:%d hblanksym:%d vblanksym:%d]",
+		   args.head, args.watermark, args.hblanksym, args.vblanksym);
+	return ret;
+}
+
 int
 nvif_outp_dp_drive(struct nvif_outp *outp, u8 link_nr, u8 pe[4], u8 vs[4])
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
index 8686e5c044a5d..9beb9d1e86334 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
@@ -84,6 +84,8 @@ struct nvkm_ior_func {
 		void (*pattern)(struct nvkm_ior *, int pattern);
 		void (*drive)(struct nvkm_ior *, int ln, int pc,
 			      int dc, int pe, int tx_pu);
+		int (*sst)(struct nvkm_ior *, int head, bool ef,
+			   u32 watermark, u32 hblanksym, u32 vblanksym);
 		void (*vcpi)(struct nvkm_ior *, int head, u8 slot,
 			     u8 slot_nr, u16 pbn, u16 aligned);
 		void (*audio)(struct nvkm_ior *, int head, bool enable);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index b634e76c2a9ba..225f88fbdae0f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -45,6 +45,26 @@ nvkm_uoutp_mthd_dp_mst_vcpi(struct nvkm_outp *outp, void *argv, u32 argc)
 	return 0;
 }
 
+static int
+nvkm_uoutp_mthd_dp_sst(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_dp_sst_args *args = argv;
+	struct nvkm_disp *disp = outp->disp;
+	struct nvkm_ior *ior = outp->ior;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+		return -ENOSYS;
+
+	if (!ior->func->dp || !nvkm_head_find(disp, args->v0.head))
+		return -EINVAL;
+	if (!ior->func->dp->sst)
+		return 0;
+
+	return ior->func->dp->sst(ior, args->v0.head,
+				  outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP,
+				  args->v0.watermark, args->v0.hblanksym, args->v0.vblanksym);
+}
+
 static int
 nvkm_uoutp_mthd_dp_drive(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -461,6 +481,7 @@ nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 	case NVIF_OUTP_V0_HDA_ELD      : return nvkm_uoutp_mthd_hda_eld      (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_TRAIN     : return nvkm_uoutp_mthd_dp_train     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_DRIVE     : return nvkm_uoutp_mthd_dp_drive     (outp, argv, argc);
+	case NVIF_OUTP_V0_DP_SST       : return nvkm_uoutp_mthd_dp_sst       (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_MST_VCPI  : return nvkm_uoutp_mthd_dp_mst_vcpi  (outp, argv, argc);
 	default:
 		break;
-- 
2.41.0

