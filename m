Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 369D77A6DFA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729F310E29D;
	Tue, 19 Sep 2023 22:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401F410E29D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pOQ3WKlVeJUealSA0Hf8qET8USMUG4gJIZv79htFj+Q=;
 b=GohYWhJKjpK4G8nb2l7JZ45PYFFjE7FQvfSgv03J/srFJg4rMd8mQhvVu/eaLNFP1lA6Df
 4KCP8U9qM0GmotOLv9h1b9wRcRE6EY+jKfLGodXHeBfn7lMfzt0xVJvB9RBR11i84ALLP2
 Ykwn07KBiZxzWnjvIveK8ooWYPI7kOg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-vfi6yLCiN7-IX9fdJ03TWg-1; Tue, 19 Sep 2023 18:05:37 -0400
X-MC-Unique: vfi6yLCiN7-IX9fdJ03TWg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CAF929ABA26;
 Tue, 19 Sep 2023 22:05:37 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B762340C2064;
 Tue, 19 Sep 2023 22:05:36 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 11/44] drm/nouveau/disp: shuffle to make upcoming diffs
 prettier
Date: Tue, 19 Sep 2023 17:56:06 -0400
Message-ID: <20230919220442.202488-12-lyude@redhat.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <me@dakr.org>,
 open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

- preparing to move protocol-specific args out of acquire() again
- no code changes

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvif/outp.c           | 106 +++++++++---------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  |  74 ++++++------
 2 files changed, 91 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 795658f0c920c..eecccfc17c1c6 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -54,6 +54,28 @@ nvif_outp_dp_retrain(struct nvif_outp *outp)
 	return ret;
 }
 
+static inline int nvif_outp_acquire(struct nvif_outp *, u8, struct nvif_outp_acquire_v0 *);
+
+int
+nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
+		     int link_nr, int link_bw, bool hda, bool mst)
+{
+	struct nvif_outp_acquire_v0 args;
+	int ret;
+
+	args.dp.link_nr = link_nr;
+	args.dp.link_bw = link_bw;
+	args.dp.hda = hda;
+	args.dp.mst = mst;
+	memcpy(args.dp.dpcd, dpcd, sizeof(args.dp.dpcd));
+
+	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_DP, &args);
+	NVIF_ERRON(ret, &outp->object,
+		   "[ACQUIRE proto:DP link_nr:%d link_bw:%02x hda:%d mst:%d] or:%d link:%d",
+		   args.dp.link_nr, args.dp.link_bw, args.dp.hda, args.dp.mst, args.or, args.link);
+	return ret;
+}
+
 int
 nvif_outp_dp_aux_pwr(struct nvif_outp *outp, bool enable)
 {
@@ -101,48 +123,26 @@ nvif_outp_infoframe(struct nvif_outp *outp, u8 type, struct nvif_outp_infoframe_
 	return ret;
 }
 
-void
-nvif_outp_release(struct nvif_outp *outp)
-{
-	int ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_RELEASE, NULL, 0);
-	NVIF_ERRON(ret, &outp->object, "[RELEASE]");
-	outp->or.id = -1;
-}
-
-static inline int
-nvif_outp_acquire(struct nvif_outp *outp, u8 proto, struct nvif_outp_acquire_v0 *args)
-{
-	int ret;
-
-	args->version = 0;
-	args->proto = proto;
-
-	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_ACQUIRE, args, sizeof(*args));
-	if (ret)
-		return ret;
-
-	outp->or.id = args->or;
-	outp->or.link = args->link;
-	return 0;
-}
-
 int
-nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
-		     int link_nr, int link_bw, bool hda, bool mst)
+nvif_outp_acquire_tmds(struct nvif_outp *outp, int head,
+		       bool hdmi, u8 max_ac_packet, u8 rekey, u8 scdc, bool hda)
 {
 	struct nvif_outp_acquire_v0 args;
 	int ret;
 
-	args.dp.link_nr = link_nr;
-	args.dp.link_bw = link_bw;
-	args.dp.hda = hda;
-	args.dp.mst = mst;
-	memcpy(args.dp.dpcd, dpcd, sizeof(args.dp.dpcd));
+	args.tmds.head = head;
+	args.tmds.hdmi = hdmi;
+	args.tmds.hdmi_max_ac_packet = max_ac_packet;
+	args.tmds.hdmi_rekey = rekey;
+	args.tmds.hdmi_scdc = scdc;
+	args.tmds.hdmi_hda = hda;
 
-	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_DP, &args);
+	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_TMDS, &args);
 	NVIF_ERRON(ret, &outp->object,
-		   "[ACQUIRE proto:DP link_nr:%d link_bw:%02x hda:%d mst:%d] or:%d link:%d",
-		   args.dp.link_nr, args.dp.link_bw, args.dp.hda, args.dp.mst, args.or, args.link);
+		   "[ACQUIRE proto:TMDS head:%d hdmi:%d max_ac_packet:%d rekey:%d scdc:%d hda:%d]"
+		   " or:%d link:%d", args.tmds.head, args.tmds.hdmi, args.tmds.hdmi_max_ac_packet,
+		   args.tmds.hdmi_rekey, args.tmds.hdmi_scdc, args.tmds.hdmi_hda,
+		   args.or, args.link);
 	return ret;
 }
 
@@ -162,27 +162,29 @@ nvif_outp_acquire_lvds(struct nvif_outp *outp, bool dual, bool bpc8)
 	return ret;
 }
 
-int
-nvif_outp_acquire_tmds(struct nvif_outp *outp, int head,
-		       bool hdmi, u8 max_ac_packet, u8 rekey, u8 scdc, bool hda)
+void
+nvif_outp_release(struct nvif_outp *outp)
+{
+	int ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_RELEASE, NULL, 0);
+	NVIF_ERRON(ret, &outp->object, "[RELEASE]");
+	outp->or.id = -1;
+}
+
+static inline int
+nvif_outp_acquire(struct nvif_outp *outp, u8 proto, struct nvif_outp_acquire_v0 *args)
 {
-	struct nvif_outp_acquire_v0 args;
 	int ret;
 
-	args.tmds.head = head;
-	args.tmds.hdmi = hdmi;
-	args.tmds.hdmi_max_ac_packet = max_ac_packet;
-	args.tmds.hdmi_rekey = rekey;
-	args.tmds.hdmi_scdc = scdc;
-	args.tmds.hdmi_hda = hda;
+	args->version = 0;
+	args->proto = proto;
 
-	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_TMDS, &args);
-	NVIF_ERRON(ret, &outp->object,
-		   "[ACQUIRE proto:TMDS head:%d hdmi:%d max_ac_packet:%d rekey:%d scdc:%d hda:%d]"
-		   " or:%d link:%d", args.tmds.head, args.tmds.hdmi, args.tmds.hdmi_max_ac_packet,
-		   args.tmds.hdmi_rekey, args.tmds.hdmi_scdc, args.tmds.hdmi_hda,
-		   args.or, args.link);
-	return ret;
+	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_ACQUIRE, args, sizeof(*args));
+	if (ret)
+		return ret;
+
+	outp->or.id = args->or;
+	outp->or.link = args->link;
+	return 0;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 31b76f17fa70a..d56a87ae5b265 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -57,6 +57,23 @@ nvkm_uoutp_mthd_dp_retrain(struct nvkm_outp *outp, void *argv, u32 argc)
 	return outp->func->acquire(outp);
 }
 
+static int
+nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
+			   u8 link_nr, u8 link_bw, bool hda, bool mst)
+{
+	int ret;
+
+	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, hda);
+	if (ret)
+		return ret;
+
+	memcpy(outp->dp.dpcd, dpcd, sizeof(outp->dp.dpcd));
+	outp->dp.lt.nr = link_nr;
+	outp->dp.lt.bw = link_bw;
+	outp->dp.lt.mst = mst;
+	return 0;
+}
+
 static int
 nvkm_uoutp_mthd_dp_aux_pwr(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -125,43 +142,6 @@ nvkm_uoutp_mthd_infoframe(struct nvkm_outp *outp, void *argv, u32 argc)
 	return -EINVAL;
 }
 
-static int
-nvkm_uoutp_mthd_release(struct nvkm_outp *outp, void *argv, u32 argc)
-{
-	struct nvkm_head *head = outp->asy.head;
-	struct nvkm_ior *ior = outp->ior;
-	union nvif_outp_release_args *args = argv;
-
-	if (argc != sizeof(args->vn))
-		return -ENOSYS;
-
-	if (ior->func->hdmi && head) {
-		ior->func->hdmi->infoframe_avi(ior, head->id, NULL, 0);
-		ior->func->hdmi->infoframe_vsi(ior, head->id, NULL, 0);
-		ior->func->hdmi->ctrl(ior, head->id, false, 0, 0);
-	}
-
-	nvkm_outp_release(outp);
-	return 0;
-}
-
-static int
-nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
-			   u8 link_nr, u8 link_bw, bool hda, bool mst)
-{
-	int ret;
-
-	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, hda);
-	if (ret)
-		return ret;
-
-	memcpy(outp->dp.dpcd, dpcd, sizeof(outp->dp.dpcd));
-	outp->dp.lt.nr = link_nr;
-	outp->dp.lt.bw = link_bw;
-	outp->dp.lt.mst = mst;
-	return 0;
-}
-
 static int
 nvkm_uoutp_mthd_acquire_tmds(struct nvkm_outp *outp, u8 head, u8 hdmi, u8 hdmi_max_ac_packet,
 			     u8 hdmi_rekey, u8 hdmi_scdc, u8 hdmi_hda)
@@ -206,6 +186,26 @@ nvkm_uoutp_mthd_acquire_lvds(struct nvkm_outp *outp, bool dual, bool bpc8)
 	return nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, false);
 }
 
+static int
+nvkm_uoutp_mthd_release(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	struct nvkm_head *head = outp->asy.head;
+	struct nvkm_ior *ior = outp->ior;
+	union nvif_outp_release_args *args = argv;
+
+	if (argc != sizeof(args->vn))
+		return -ENOSYS;
+
+	if (ior->func->hdmi && head) {
+		ior->func->hdmi->infoframe_avi(ior, head->id, NULL, 0);
+		ior->func->hdmi->infoframe_vsi(ior, head->id, NULL, 0);
+		ior->func->hdmi->ctrl(ior, head->id, false, 0, 0);
+	}
+
+	nvkm_outp_release(outp);
+	return 0;
+}
+
 static int
 nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 {
-- 
2.41.0

