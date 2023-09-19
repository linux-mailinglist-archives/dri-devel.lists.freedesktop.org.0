Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF3B7A6E43
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D7710E3F4;
	Tue, 19 Sep 2023 22:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C172210E3F4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WkUPcGEDcomXj1D+CJwTUgsgc+ZRY+I9HgW+UPzl8wo=;
 b=gYXbXQg5TvwpoZBX7OVrO8Tf5oThidgn+pBEAfKNmxyjK1fMVOmKg3ZC/hsaVR/ZpMLi4N
 zly64ogIlabDGLqdw2n2VREPabn6xDKbBySCWk+LBkwfaSJF7ADvCUxGImJzuMMc5ZgOq8
 MU5VYNleI+mQUhWGOQH8MqCFepdgw8I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-VgJa0NKvMq-759M5EyqslA-1; Tue, 19 Sep 2023 18:07:28 -0400
X-MC-Unique: VgJa0NKvMq-759M5EyqslA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 145E985A5A8;
 Tue, 19 Sep 2023 22:07:28 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF25740C2064;
 Tue, 19 Sep 2023 22:07:27 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 36/44] drm/nouveau/disp: move outp/conn construction to
 chipset code
Date: Tue, 19 Sep 2023 17:56:31 -0400
Message-ID: <20230919220442.202488-37-lyude@redhat.com>
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

- pre-nv5x doesn't use any of this, has its own version DRM-side
- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/base.c   | 117 +----------------
 .../gpu/drm/nouveau/nvkm/engine/disp/nv50.c   | 122 +++++++++++++++++-
 2 files changed, 121 insertions(+), 118 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
index 73104b59f97fe..1dbe68f9a0e07 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
@@ -23,15 +23,12 @@
  */
 #include "priv.h"
 #include "conn.h"
-#include "dp.h"
 #include "head.h"
 #include "ior.h"
 #include "outp.h"
 
 #include <core/client.h>
 #include <core/ramht.h>
-#include <subdev/bios.h>
-#include <subdev/bios/dcb.h>
 
 #include <nvif/class.h>
 #include <nvif/cl0046.h>
@@ -159,123 +156,11 @@ nvkm_disp_oneinit(struct nvkm_engine *engine)
 {
 	struct nvkm_disp *disp = nvkm_disp(engine);
 	struct nvkm_subdev *subdev = &disp->engine.subdev;
-	struct nvkm_bios *bios = subdev->device->bios;
-	struct nvkm_outp *outp, *outt, *pair;
-	struct nvkm_conn *conn;
+	struct nvkm_outp *outp;
 	struct nvkm_head *head;
 	struct nvkm_ior *ior;
-	struct nvbios_connE connE;
-	struct dcb_output dcbE;
-	u8  hpd = 0, ver, hdr;
-	u32 data;
 	int ret, i;
 
-	/* Create output path objects for each VBIOS display path. */
-	i = -1;
-	while ((data = dcb_outp_parse(bios, ++i, &ver, &hdr, &dcbE))) {
-		if (ver < 0x40) /* No support for chipsets prior to NV50. */
-			break;
-		if (dcbE.type == DCB_OUTPUT_UNUSED)
-			continue;
-		if (dcbE.type == DCB_OUTPUT_EOL)
-			break;
-		outp = NULL;
-
-		switch (dcbE.type) {
-		case DCB_OUTPUT_ANALOG:
-		case DCB_OUTPUT_TV:
-		case DCB_OUTPUT_TMDS:
-		case DCB_OUTPUT_LVDS:
-			ret = nvkm_outp_new(disp, i, &dcbE, &outp);
-			break;
-		case DCB_OUTPUT_DP:
-			ret = nvkm_dp_new(disp, i, &dcbE, &outp);
-			break;
-		case DCB_OUTPUT_WFD:
-			/* No support for WFD yet. */
-			ret = -ENODEV;
-			continue;
-		default:
-			nvkm_warn(subdev, "dcb %d type %d unknown\n",
-				  i, dcbE.type);
-			continue;
-		}
-
-		if (ret) {
-			if (outp) {
-				if (ret != -ENODEV)
-					OUTP_ERR(outp, "ctor failed: %d", ret);
-				else
-					OUTP_DBG(outp, "not supported");
-				nvkm_outp_del(&outp);
-				continue;
-			}
-			nvkm_error(subdev, "failed to create outp %d\n", i);
-			continue;
-		}
-
-		list_add_tail(&outp->head, &disp->outps);
-		hpd = max(hpd, (u8)(dcbE.connector + 1));
-	}
-
-	/* Create connector objects based on available output paths. */
-	list_for_each_entry_safe(outp, outt, &disp->outps, head) {
-		/* VBIOS data *should* give us the most useful information. */
-		data = nvbios_connEp(bios, outp->info.connector, &ver, &hdr,
-				     &connE);
-
-		/* No bios connector data... */
-		if (!data) {
-			/* Heuristic: anything with the same ccb index is
-			 * considered to be on the same connector, any
-			 * output path without an associated ccb entry will
-			 * be put on its own connector.
-			 */
-			int ccb_index = outp->info.i2c_index;
-			if (ccb_index != 0xf) {
-				list_for_each_entry(pair, &disp->outps, head) {
-					if (pair->info.i2c_index == ccb_index) {
-						outp->conn = pair->conn;
-						break;
-					}
-				}
-			}
-
-			/* Connector shared with another output path. */
-			if (outp->conn)
-				continue;
-
-			memset(&connE, 0x00, sizeof(connE));
-			connE.type = DCB_CONNECTOR_NONE;
-			i = -1;
-		} else {
-			i = outp->info.connector;
-		}
-
-		/* Check that we haven't already created this connector. */
-		list_for_each_entry(conn, &disp->conns, head) {
-			if (conn->index == outp->info.connector) {
-				outp->conn = conn;
-				break;
-			}
-		}
-
-		if (outp->conn)
-			continue;
-
-		/* Apparently we need to create a new one! */
-		ret = nvkm_conn_new(disp, i, &connE, &outp->conn);
-		if (ret) {
-			nvkm_error(subdev, "failed to create outp %d conn: %d\n", outp->index, ret);
-			nvkm_conn_del(&outp->conn);
-			list_del(&outp->head);
-			nvkm_outp_del(&outp);
-			continue;
-		}
-
-		list_add_tail(&outp->conn->head, &disp->conns);
-	}
-
 	if (disp->func->oneinit) {
 		ret = disp->func->oneinit(disp);
 		if (ret)
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
index e9d0a9b715d47..7343b24f10eb7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -23,7 +23,9 @@
  */
 #include "priv.h"
 #include "chan.h"
+#include "conn.h"
 #include "head.h"
+#include "dp.h"
 #include "ior.h"
 #include "outp.h"
 
@@ -1581,7 +1583,14 @@ nv50_disp_oneinit(struct nvkm_disp *disp)
 	const struct nvkm_disp_func *func = disp->func;
 	struct nvkm_subdev *subdev = &disp->engine.subdev;
 	struct nvkm_device *device = subdev->device;
+	struct nvkm_bios *bios = device->bios;
+	struct nvkm_outp *outp, *outt, *pair;
+	struct nvkm_conn *conn;
 	int ret, i;
+	u8  ver, hdr;
+	u32 data;
+	struct dcb_output dcbE;
+	struct nvbios_connE connE;
 
 	if (func->wndw.cnt) {
 		disp->wndw.nr = func->wndw.cnt(disp, &disp->wndw.mask);
@@ -1628,8 +1637,117 @@ nv50_disp_oneinit(struct nvkm_disp *disp)
 	if (ret)
 		return ret;
 
-	return nvkm_ramht_new(device, func->ramht_size ? func->ramht_size :
-			      0x1000, 0, disp->inst, &disp->ramht);
+	ret = nvkm_ramht_new(device, func->ramht_size ? func->ramht_size : 0x1000, 0, disp->inst,
+			     &disp->ramht);
+	if (ret)
+		return ret;
+
+	/* Create output path objects for each VBIOS display path. */
+	i = -1;
+	while ((data = dcb_outp_parse(bios, ++i, &ver, &hdr, &dcbE))) {
+		if (WARN_ON((ver & 0xf0) != 0x40))
+			return -EINVAL;
+		if (dcbE.type == DCB_OUTPUT_UNUSED)
+			continue;
+		if (dcbE.type == DCB_OUTPUT_EOL)
+			break;
+		outp = NULL;
+
+		switch (dcbE.type) {
+		case DCB_OUTPUT_ANALOG:
+		case DCB_OUTPUT_TV:
+		case DCB_OUTPUT_TMDS:
+		case DCB_OUTPUT_LVDS:
+			ret = nvkm_outp_new(disp, i, &dcbE, &outp);
+			break;
+		case DCB_OUTPUT_DP:
+			ret = nvkm_dp_new(disp, i, &dcbE, &outp);
+			break;
+		case DCB_OUTPUT_WFD:
+			/* No support for WFD yet. */
+			ret = -ENODEV;
+			continue;
+		default:
+			nvkm_warn(subdev, "dcb %d type %d unknown\n",
+				  i, dcbE.type);
+			continue;
+		}
+
+		if (ret) {
+			if (outp) {
+				if (ret != -ENODEV)
+					OUTP_ERR(outp, "ctor failed: %d", ret);
+				else
+					OUTP_DBG(outp, "not supported");
+				nvkm_outp_del(&outp);
+				continue;
+			}
+			nvkm_error(subdev, "failed to create outp %d\n", i);
+			continue;
+		}
+
+		list_add_tail(&outp->head, &disp->outps);
+	}
+
+	/* Create connector objects based on available output paths. */
+	list_for_each_entry_safe(outp, outt, &disp->outps, head) {
+		/* VBIOS data *should* give us the most useful information. */
+		data = nvbios_connEp(bios, outp->info.connector, &ver, &hdr,
+				     &connE);
+
+		/* No bios connector data... */
+		if (!data) {
+			/* Heuristic: anything with the same ccb index is
+			 * considered to be on the same connector, any
+			 * output path without an associated ccb entry will
+			 * be put on its own connector.
+			 */
+			int ccb_index = outp->info.i2c_index;
+			if (ccb_index != 0xf) {
+				list_for_each_entry(pair, &disp->outps, head) {
+					if (pair->info.i2c_index == ccb_index) {
+						outp->conn = pair->conn;
+						break;
+					}
+				}
+			}
+
+			/* Connector shared with another output path. */
+			if (outp->conn)
+				continue;
+
+			memset(&connE, 0x00, sizeof(connE));
+			connE.type = DCB_CONNECTOR_NONE;
+			i = -1;
+		} else {
+			i = outp->info.connector;
+		}
+
+		/* Check that we haven't already created this connector. */
+		list_for_each_entry(conn, &disp->conns, head) {
+			if (conn->index == outp->info.connector) {
+				outp->conn = conn;
+				break;
+			}
+		}
+
+		if (outp->conn)
+			continue;
+
+		/* Apparently we need to create a new one! */
+		ret = nvkm_conn_new(disp, i, &connE, &outp->conn);
+		if (ret) {
+			nvkm_error(subdev, "failed to create outp %d conn: %d\n", outp->index, ret);
+			nvkm_conn_del(&outp->conn);
+			list_del(&outp->head);
+			nvkm_outp_del(&outp);
+			continue;
+		}
+
+		list_add_tail(&outp->conn->head, &disp->conns);
+	}
+
+	return 0;
 }
 
 static const struct nvkm_disp_func
-- 
2.41.0

