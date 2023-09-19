Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F8F7A6DF2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604AF10E2A7;
	Tue, 19 Sep 2023 22:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129FC10E2A9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOp44erh93Op166lIwiGxIOz02Snc9ZtqEI8RrC7P5o=;
 b=H8MydYlI7JbpBw+nyL4NUIt4cZZrRrH3r5RNOwtgShdSZfHF8lWnXSxGHE+rrD0cY1ugFy
 9qLimhGXt5IqHzqkTBl/ejLPcfLDlzwCMwqV8YzJ/N6l9Gq5EesgtuzwSfXpHWqfMoFfXU
 v6BN8VLmYHeRiAWZ02JggoKDqqfnfPs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-6PTi3dMMNEOYkUk3s3qIjA-1; Tue, 19 Sep 2023 18:05:26 -0400
X-MC-Unique: 6PTi3dMMNEOYkUk3s3qIjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B086858299;
 Tue, 19 Sep 2023 22:05:26 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4BD540C2064;
 Tue, 19 Sep 2023 22:05:25 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 08/44] drm/nouveau/disp: add output method to fetch edid
Date: Tue, 19 Sep 2023 17:56:03 -0400
Message-ID: <20230919220442.202488-9-lyude@redhat.com>
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
 Danilo Krummrich <me@dakr.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

- needed to support TMDS EDID on RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 10 +++++++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c   | 22 ++++++++------
 drivers/gpu/drm/nouveau/nvif/outp.c           | 30 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 15 ++++++++++
 6 files changed, 70 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 923bc30af2a92..725d6e8e3d2d3 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -13,6 +13,7 @@ union nvif_outp_args {
 };
 
 #define NVIF_OUTP_V0_DETECT        0x00
+#define NVIF_OUTP_V0_EDID_GET      0x01
 
 #define NVIF_OUTP_V0_ACQUIRE       0x11
 #define NVIF_OUTP_V0_RELEASE       0x12
@@ -36,6 +37,15 @@ union nvif_outp_detect_args {
 	} v0;
 };
 
+union nvif_outp_edid_get_args {
+	struct nvif_outp_edid_get_v0 {
+		__u8  version;
+		__u8  pad01;
+		__u16 size;
+		__u8  data[2048];
+	} v0;
+};
+
 union nvif_outp_load_detect_args {
 	struct nvif_outp_load_detect_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index c3e1e4d2f1a11..7c2c34a84fbd8 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -25,6 +25,7 @@ enum nvif_outp_detect_status {
 };
 
 enum nvif_outp_detect_status nvif_outp_detect(struct nvif_outp *);
+int nvif_outp_edid_get(struct nvif_outp *, u8 **pedid);
 
 int nvif_outp_load_detect(struct nvif_outp *, u32 loadval);
 int nvif_outp_acquire_rgb_crt(struct nvif_outp *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index a290a2844547c..c079686fa2408 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -570,7 +570,6 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = NULL;
 	struct nouveau_encoder *nv_partner;
-	struct i2c_adapter *i2c;
 	int type;
 	int ret;
 	enum drm_connector_status conn_status = connector_status_disconnected;
@@ -593,15 +592,20 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 	}
 
 	nv_encoder = nouveau_connector_ddc_detect(connector);
-	if (nv_encoder && (i2c = nv_encoder->i2c) != NULL) {
-		struct edid *new_edid;
+	if (nv_encoder) {
+		struct edid *new_edid = NULL;
 
-		if ((vga_switcheroo_handler_flags() &
-		     VGA_SWITCHEROO_CAN_SWITCH_DDC) &&
-		    nv_connector->type == DCB_CONNECTOR_LVDS)
-			new_edid = drm_get_edid_switcheroo(connector, i2c);
-		else
-			new_edid = drm_get_edid(connector, i2c);
+		if (nv_encoder->i2c) {
+			if ((vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC) &&
+			    nv_connector->type == DCB_CONNECTOR_LVDS)
+				new_edid = drm_get_edid_switcheroo(connector, nv_encoder->i2c);
+			else
+				new_edid = drm_get_edid(connector, nv_encoder->i2c);
+		} else {
+			ret = nvif_outp_edid_get(&nv_encoder->outp, (u8 **)&new_edid);
+			if (ret < 0)
+				return connector_status_disconnected;
+		}
 
 		nouveau_connector_set_edid(nv_connector, new_edid);
 		if (!nv_connector->edid) {
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 7f1daab35a0d2..10480142eea5a 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -210,6 +210,36 @@ nvif_outp_load_detect(struct nvif_outp *outp, u32 loadval)
 	return ret < 0 ? ret : args.load;
 }
 
+int
+nvif_outp_edid_get(struct nvif_outp *outp, u8 **pedid)
+{
+	struct nvif_outp_edid_get_v0 *args;
+	int ret;
+
+	args = kmalloc(sizeof(*args), GFP_KERNEL);
+	if (!args)
+		return -ENOMEM;
+
+	args->version = 0;
+
+	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_EDID_GET, args, sizeof(*args));
+	NVIF_ERRON(ret, &outp->object, "[EDID_GET] size:%d", args->size);
+	if (ret)
+		goto done;
+
+	*pedid = kmalloc(args->size, GFP_KERNEL);
+	if (!*pedid) {
+		ret = -ENOMEM;
+		goto done;
+	}
+
+	memcpy(*pedid, args->data, args->size);
+	ret = args->size;
+done:
+	kfree(args);
+	return ret;
+}
+
 enum nvif_outp_detect_status
 nvif_outp_detect(struct nvif_outp *outp)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 8c9fe878f3209..1cd70868f2255 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -87,6 +87,7 @@ struct nvkm_outp_func {
 	void (*fini)(struct nvkm_outp *);
 
 	int (*detect)(struct nvkm_outp *);
+	int (*edid_get)(struct nvkm_outp *, u8 *data, u16 *size);
 
 	int (*acquire)(struct nvkm_outp *);
 	void (*release)(struct nvkm_outp *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 43752e216ce88..0c4ffa3ffb288 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -275,6 +275,20 @@ nvkm_uoutp_mthd_load_detect(struct nvkm_outp *outp, void *argv, u32 argc)
 	return ret;
 }
 
+static int
+nvkm_uoutp_mthd_edid_get(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_edid_get_args *args = argv;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+		return -ENOSYS;
+	if (!outp->func->edid_get)
+		return -EINVAL;
+
+	args->v0.size = ARRAY_SIZE(args->v0.data);
+	return outp->func->edid_get(outp, args->v0.data, &args->v0.size);
+}
+
 static int
 nvkm_uoutp_mthd_detect(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -319,6 +333,7 @@ nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc
 {
 	switch (mthd) {
 	case NVIF_OUTP_V0_DETECT     : return nvkm_uoutp_mthd_detect     (outp, argv, argc);
+	case NVIF_OUTP_V0_EDID_GET   : return nvkm_uoutp_mthd_edid_get   (outp, argv, argc);
 	case NVIF_OUTP_V0_ACQUIRE    : return nvkm_uoutp_mthd_acquire    (outp, argv, argc);
 	case NVIF_OUTP_V0_LOAD_DETECT: return nvkm_uoutp_mthd_load_detect(outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_PWR : return nvkm_uoutp_mthd_dp_aux_pwr (outp, argv, argc);
-- 
2.41.0

