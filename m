Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0C57A6E49
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B6C10E40B;
	Tue, 19 Sep 2023 22:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115F410E408
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQzNl7BPRCbZcHRJ+ePBRAVCQIpW++mVHMaECTekODM=;
 b=FktcGnX3nkSVqKcMGP+a+cI3ZBsUVQA5wlOE61pQOSTih+1HJq0QBF8/VGOZdzQ95ndQzP
 7kKxF4q1hruldXeP3ACww+BJkwrKsxCHhOTlLyjqp9nKtM3rc+P6yHQlKKaHFACWAStWQz
 sAm5hankXFBrBledNXalKko4oO36F90=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-4v-SpbJlPYiKMHYFGw_hkQ-1; Tue, 19 Sep 2023 18:07:33 -0400
X-MC-Unique: 4v-SpbJlPYiKMHYFGw_hkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6EBF1E441DE;
 Tue, 19 Sep 2023 22:07:32 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DE7440C2064;
 Tue, 19 Sep 2023 22:07:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 37/44] drm/nouveau/disp: move outp init/fini paths to
 chipset code
Date: Tue, 19 Sep 2023 17:56:32 -0400
Message-ID: <20230919220442.202488-38-lyude@redhat.com>
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

- pre-nv5x doesn't use any of this
- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/base.c   | 31 +++----------------
 .../gpu/drm/nouveau/nvkm/engine/disp/conn.c   | 10 ------
 .../gpu/drm/nouveau/nvkm/engine/disp/conn.h   |  2 --
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/nv50.c   | 14 +++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   | 20 ++----------
 6 files changed, 22 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
index 1dbe68f9a0e07..39f7e7ce9f4a2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
@@ -102,18 +102,14 @@ static int
 nvkm_disp_fini(struct nvkm_engine *engine, bool suspend)
 {
 	struct nvkm_disp *disp = nvkm_disp(engine);
-	struct nvkm_conn *conn;
 	struct nvkm_outp *outp;
 
 	if (disp->func->fini)
 		disp->func->fini(disp);
 
 	list_for_each_entry(outp, &disp->outps, head) {
-		nvkm_outp_fini(outp);
-	}
-
-	list_for_each_entry(conn, &disp->conns, head) {
-		nvkm_conn_fini(conn);
+		if (outp->func->fini)
+			outp->func->fini(outp);
 	}
 
 	return 0;
@@ -123,16 +119,12 @@ static int
 nvkm_disp_init(struct nvkm_engine *engine)
 {
 	struct nvkm_disp *disp = nvkm_disp(engine);
-	struct nvkm_conn *conn;
 	struct nvkm_outp *outp;
 	struct nvkm_ior *ior;
 
-	list_for_each_entry(conn, &disp->conns, head) {
-		nvkm_conn_init(conn);
-	}
-
 	list_for_each_entry(outp, &disp->outps, head) {
-		nvkm_outp_init(outp);
+		if (outp->func->init)
+			outp->func->init(outp);
 	}
 
 	if (disp->func->init) {
@@ -156,9 +148,7 @@ nvkm_disp_oneinit(struct nvkm_engine *engine)
 {
 	struct nvkm_disp *disp = nvkm_disp(engine);
 	struct nvkm_subdev *subdev = &disp->engine.subdev;
-	struct nvkm_outp *outp;
 	struct nvkm_head *head;
-	struct nvkm_ior *ior;
 	int ret, i;
 
 	if (disp->func->oneinit) {
@@ -167,19 +157,6 @@ nvkm_disp_oneinit(struct nvkm_engine *engine)
 			return ret;
 	}
 
-	/* Enforce identity-mapped SOR assignment for panels, which have
-	 * certain bits (ie. backlight controls) wired to a specific SOR.
-	 */
-	list_for_each_entry(outp, &disp->outps, head) {
-		if (outp->conn->info.type == DCB_CONNECTOR_LVDS ||
-		    outp->conn->info.type == DCB_CONNECTOR_eDP) {
-			ior = nvkm_ior_find(disp, SOR, ffs(outp->info.or) - 1);
-			if (!WARN_ON(!ior))
-				ior->identity = true;
-			outp->identity = true;
-		}
-	}
-
 	i = 0;
 	list_for_each_entry(head, &disp->heads, head)
 		i = max(i, head->id + 1);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.c
index fbdae11378646..ff88a5a5253a7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.c
@@ -29,16 +29,6 @@
 
 #include <nvif/event.h>
 
-void
-nvkm_conn_fini(struct nvkm_conn *conn)
-{
-}
-
-void
-nvkm_conn_init(struct nvkm_conn *conn)
-{
-}
-
 void
 nvkm_conn_del(struct nvkm_conn **pconn)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h
index a0600e72b0ecd..01c3146c7066f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h
@@ -19,8 +19,6 @@ struct nvkm_conn {
 int nvkm_conn_new(struct nvkm_disp *, int index, struct nvbios_connE *,
 		  struct nvkm_conn **);
 void nvkm_conn_del(struct nvkm_conn **);
-void nvkm_conn_init(struct nvkm_conn *);
-void nvkm_conn_fini(struct nvkm_conn *);
 
 #define CONN_MSG(c,l,f,a...) do {                                              \
 	struct nvkm_conn *_conn = (c);                                    \
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index aaa7796946ceb..b35fae96d855d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -603,6 +603,7 @@ nvkm_dp_fini(struct nvkm_outp *outp)
 static void
 nvkm_dp_init(struct nvkm_outp *outp)
 {
+	nvkm_outp_init(outp);
 	nvkm_dp_enable(outp, outp->dp.enabled);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
index 7343b24f10eb7..4be09ec4fd5c2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -1586,6 +1586,7 @@ nv50_disp_oneinit(struct nvkm_disp *disp)
 	struct nvkm_bios *bios = device->bios;
 	struct nvkm_outp *outp, *outt, *pair;
 	struct nvkm_conn *conn;
+	struct nvkm_ior *ior;
 	int ret, i;
 	u8  ver, hdr;
 	u32 data;
@@ -1747,6 +1748,19 @@ nv50_disp_oneinit(struct nvkm_disp *disp)
 		list_add_tail(&outp->conn->head, &disp->conns);
 	}
 
+	/* Enforce identity-mapped SOR assignment for panels, which have
+	 * certain bits (ie. backlight controls) wired to a specific SOR.
+	 */
+	list_for_each_entry(outp, &disp->outps, head) {
+		if (outp->conn->info.type == DCB_CONNECTOR_LVDS ||
+		    outp->conn->info.type == DCB_CONNECTOR_eDP) {
+			ior = nvkm_ior_find(disp, SOR, ffs(outp->info.or) - 1);
+			if (!WARN_ON(!ior))
+				ior->identity = true;
+			outp->identity = true;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index f1a3e623bb222..bfb2a4db8d644 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -287,13 +287,6 @@ nvkm_outp_acquire(struct nvkm_outp *outp, bool hda)
 	return 0;
 }
 
-void
-nvkm_outp_fini(struct nvkm_outp *outp)
-{
-	if (outp->func->fini)
-		outp->func->fini(outp);
-}
-
 struct nvkm_ior *
 nvkm_outp_inherit(struct nvkm_outp *outp)
 {
@@ -332,8 +325,8 @@ nvkm_outp_inherit(struct nvkm_outp *outp)
 	return ior;
 }
 
-static void
-nvkm_outp_init_route(struct nvkm_outp *outp)
+void
+nvkm_outp_init(struct nvkm_outp *outp)
 {
 	enum nvkm_ior_proto proto;
 	enum nvkm_ior_type type;
@@ -365,14 +358,6 @@ nvkm_outp_init_route(struct nvkm_outp *outp)
 	ior->arm.outp = outp;
 }
 
-void
-nvkm_outp_init(struct nvkm_outp *outp)
-{
-	nvkm_outp_init_route(outp);
-	if (outp->func->init)
-		outp->func->init(outp);
-}
-
 void
 nvkm_outp_del(struct nvkm_outp **poutp)
 {
@@ -420,6 +405,7 @@ nvkm_outp_new_(const struct nvkm_outp_func *func, struct nvkm_disp *disp,
 
 static const struct nvkm_outp_func
 nvkm_outp = {
+	.init = nvkm_outp_init,
 	.detect = nvkm_outp_detect,
 	.inherit = nvkm_outp_inherit,
 	.acquire = nvkm_outp_acquire,
-- 
2.41.0

