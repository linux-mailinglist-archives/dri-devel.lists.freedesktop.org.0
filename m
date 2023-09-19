Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810CE7A6DF4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD0410E2AA;
	Tue, 19 Sep 2023 22:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AFC10E2A7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0bdqNW1AoK4+3IwmD+pp0C78rCHOQoOkyPe8GiClM8=;
 b=V6t6nR/AnAPR+sN8XsP5Ufg3OJOXN1Q6Mg6YcjIKr0qt2lUN7bRvZYsLZoma1fEx+83Qmh
 Mma+5eO63NSd5rhIq6K7LuX4GUJdL76lo++k+ql3eCgzXPNopIvnQdATbPcVpioITBHJIc
 4SwLRmzjfwafCWPu4Cdkoo9aMVqITm4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-qHdtqAbfNluKkqcFP7EolA-1; Tue, 19 Sep 2023 18:05:22 -0400
X-MC-Unique: qHdtqAbfNluKkqcFP7EolA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2B491E441DA;
 Tue, 19 Sep 2023 22:05:21 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91EB540C2070;
 Tue, 19 Sep 2023 22:05:21 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 07/44] drm/nouveau/disp: add output detect method
Date: Tue, 19 Sep 2023 17:56:02 -0400
Message-ID: <20230919220442.202488-8-lyude@redhat.com>
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

This will check the relevant hotplug pin and skip the DDC probe we
currently do if a display is present.

- preparation for GSP-RM.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/conn.h   |  5 --
 drivers/gpu/drm/nouveau/include/nvif/if0011.h | 11 ----
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 12 ++++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  9 +++
 drivers/gpu/drm/nouveau/nouveau_connector.c   | 60 ++++++++++++-------
 drivers/gpu/drm/nouveau/nouveau_dp.c          | 10 +---
 drivers/gpu/drm/nouveau/nvif/conn.c           | 14 -----
 drivers/gpu/drm/nouveau/nvif/outp.c           | 25 ++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   | 28 +++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  6 ++
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 41 -------------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 24 ++++++++
 13 files changed, 145 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/conn.h b/drivers/gpu/drm/nouveau/include/nvif/conn.h
index dc355e1dfafa0..8a6017a358976 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/conn.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/conn.h
@@ -18,11 +18,6 @@ nvif_conn_id(struct nvif_conn *conn)
 	return conn->object.handle;
 }
 
-#define NVIF_CONN_HPD_STATUS_UNSUPPORTED 0 /* negative if query fails */
-#define NVIF_CONN_HPD_STATUS_NOT_PRESENT 1
-#define NVIF_CONN_HPD_STATUS_PRESENT     2
-int nvif_conn_hpd_status(struct nvif_conn *);
-
 int nvif_conn_event_ctor(struct nvif_conn *, const char *name, nvif_event_func, u8 types,
 			 struct nvif_event *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0011.h b/drivers/gpu/drm/nouveau/include/nvif/if0011.h
index 69b0b779f9424..0c25288a5a789 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0011.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0011.h
@@ -20,15 +20,4 @@ union nvif_conn_event_args {
 		__u8 pad02[6];
 	} v0;
 };
-
-#define NVIF_CONN_V0_HPD_STATUS 0x00000000
-
-union nvif_conn_hpd_status_args {
-	struct nvif_conn_hpd_status_v0 {
-		__u8 version;
-		__u8 support;
-		__u8 present;
-		__u8 pad03[5];
-	} v0;
-};
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 7c56f653070c9..923bc30af2a92 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -12,6 +12,8 @@ union nvif_outp_args {
 	} v0;
 };
 
+#define NVIF_OUTP_V0_DETECT        0x00
+
 #define NVIF_OUTP_V0_ACQUIRE       0x11
 #define NVIF_OUTP_V0_RELEASE       0x12
 
@@ -24,6 +26,16 @@ union nvif_outp_args {
 #define NVIF_OUTP_V0_DP_RETRAIN    0x73
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
+union nvif_outp_detect_args {
+	struct nvif_outp_detect_v0 {
+		__u8 version;
+#define NVIF_OUTP_DETECT_V0_NOT_PRESENT 0x00
+#define NVIF_OUTP_DETECT_V0_PRESENT     0x01
+#define NVIF_OUTP_DETECT_V0_UNKNOWN     0x02
+		__u8 status;
+	} v0;
+};
+
 union nvif_outp_load_detect_args {
 	struct nvif_outp_load_detect_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index fa76a7b5e4b37..c3e1e4d2f1a11 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -17,6 +17,15 @@ struct nvif_outp {
 
 int nvif_outp_ctor(struct nvif_disp *, const char *name, int id, struct nvif_outp *);
 void nvif_outp_dtor(struct nvif_outp *);
+
+enum nvif_outp_detect_status {
+	NOT_PRESENT,
+	PRESENT,
+	UNKNOWN,
+};
+
+enum nvif_outp_detect_status nvif_outp_detect(struct nvif_outp *);
+
 int nvif_outp_load_detect(struct nvif_outp *, u32 loadval);
 int nvif_outp_acquire_rgb_crt(struct nvif_outp *);
 int nvif_outp_acquire_tmds(struct nvif_outp *, int head,
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 68b4fb4bec63f..a290a2844547c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -413,6 +413,7 @@ nouveau_connector_ddc_detect(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	struct nouveau_connector *conn = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = NULL, *found = NULL;
 	struct drm_encoder *encoder;
 	int ret;
@@ -421,33 +422,48 @@ nouveau_connector_ddc_detect(struct drm_connector *connector)
 	drm_connector_for_each_possible_encoder(connector, encoder) {
 		nv_encoder = nouveau_encoder(encoder);
 
-		switch (nv_encoder->dcb->type) {
-		case DCB_OUTPUT_DP:
-			ret = nouveau_dp_detect(nouveau_connector(connector),
-						nv_encoder);
-			if (ret == NOUVEAU_DP_MST)
-				return NULL;
-			else if (ret == NOUVEAU_DP_SST)
-				found = nv_encoder;
+		if (nvif_object_constructed(&nv_encoder->outp.object)) {
+			enum nvif_outp_detect_status status;
+
+			if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
+				ret = nouveau_dp_detect(conn, nv_encoder);
+				if (ret == NOUVEAU_DP_MST)
+					return NULL;
+				if (ret != NOUVEAU_DP_SST)
+					continue;
+
+				return nv_encoder;
+			} else {
+				status = nvif_outp_detect(&nv_encoder->outp);
+				switch (status) {
+				case PRESENT:
+					return nv_encoder;
+				case NOT_PRESENT:
+					continue;
+				case UNKNOWN:
+					break;
+				default:
+					WARN_ON(1);
+					break;
+				}
+			}
+		}
 
-			break;
-		case DCB_OUTPUT_LVDS:
+		if (!nv_encoder->i2c)
+			continue;
+
+		if (nv_encoder->dcb->type == DCB_OUTPUT_LVDS) {
 			switcheroo_ddc = !!(vga_switcheroo_handler_flags() &
 					    VGA_SWITCHEROO_CAN_SWITCH_DDC);
-			fallthrough;
-		default:
-			if (!nv_encoder->i2c)
-				break;
+		}
 
-			if (switcheroo_ddc)
-				vga_switcheroo_lock_ddc(pdev);
-			if (nvkm_probe_i2c(nv_encoder->i2c, 0x50))
-				found = nv_encoder;
-			if (switcheroo_ddc)
-				vga_switcheroo_unlock_ddc(pdev);
+		if (switcheroo_ddc)
+			vga_switcheroo_lock_ddc(pdev);
+		if (nvkm_probe_i2c(nv_encoder->i2c, 0x50))
+			found = nv_encoder;
+		if (switcheroo_ddc)
+			vga_switcheroo_unlock_ddc(pdev);
 
-			break;
-		}
 		if (found)
 			break;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 6a4980b2d4d4e..01aa9b9c74a2a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -132,14 +132,8 @@ nouveau_dp_detect(struct nouveau_connector *nv_connector,
 		}
 	}
 
-	/* Check status of HPD pin before attempting an AUX transaction that
-	 * would result in a number of (futile) retries on a connector which
-	 * has no display plugged.
-	 *
-	 * TODO: look into checking this before probing I2C to detect DVI/HDMI
-	 */
-	hpd = nvif_conn_hpd_status(&nv_connector->conn);
-	if (hpd == NVIF_CONN_HPD_STATUS_NOT_PRESENT) {
+	hpd = nvif_outp_detect(&nv_encoder->outp);
+	if (hpd == NOT_PRESENT) {
 		nvif_outp_dp_aux_pwr(&nv_encoder->outp, false);
 		goto out;
 	}
diff --git a/drivers/gpu/drm/nouveau/nvif/conn.c b/drivers/gpu/drm/nouveau/nvif/conn.c
index a3cf91aeae2de..879569d4ba4cc 100644
--- a/drivers/gpu/drm/nouveau/nvif/conn.c
+++ b/drivers/gpu/drm/nouveau/nvif/conn.c
@@ -45,20 +45,6 @@ nvif_conn_event_ctor(struct nvif_conn *conn, const char *name, nvif_event_func f
 	return ret;
 }
 
-int
-nvif_conn_hpd_status(struct nvif_conn *conn)
-{
-	struct nvif_conn_hpd_status_v0 args;
-	int ret;
-
-	args.version = 0;
-
-	ret = nvif_mthd(&conn->object, NVIF_CONN_V0_HPD_STATUS, &args, sizeof(args));
-	NVIF_ERRON(ret, &conn->object, "[HPD_STATUS] support:%d present:%d",
-		   args.support, args.present);
-	return ret ? ret : !!args.support + !!args.present;
-}
-
 void
 nvif_conn_dtor(struct nvif_conn *conn)
 {
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index c24bc5eae3ecf..7f1daab35a0d2 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -210,6 +210,31 @@ nvif_outp_load_detect(struct nvif_outp *outp, u32 loadval)
 	return ret < 0 ? ret : args.load;
 }
 
+enum nvif_outp_detect_status
+nvif_outp_detect(struct nvif_outp *outp)
+{
+	struct nvif_outp_detect_v0 args;
+	int ret;
+
+	args.version = 0;
+
+	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_DETECT, &args, sizeof(args));
+	NVIF_ERRON(ret, &outp->object, "[DETECT] status:%02x", args.status);
+	if (ret)
+		return UNKNOWN;
+
+	switch (args.status) {
+	case NVIF_OUTP_DETECT_V0_NOT_PRESENT: return NOT_PRESENT;
+	case NVIF_OUTP_DETECT_V0_PRESENT: return PRESENT;
+	case NVIF_OUTP_DETECT_V0_UNKNOWN: return UNKNOWN;
+	default:
+		WARN_ON(1);
+		break;
+	}
+
+	return UNKNOWN;
+}
+
 void
 nvif_outp_dtor(struct nvif_outp *outp)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index b8ac66b4a2c4b..0d2de4769b94f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -807,6 +807,7 @@ nvkm_dp_func = {
 	.dtor = nvkm_dp_dtor,
 	.init = nvkm_dp_init,
 	.fini = nvkm_dp_fini,
+	.detect = nvkm_outp_detect,
 	.acquire = nvkm_dp_acquire,
 	.release = nvkm_dp_release,
 	.disable = nvkm_dp_disable,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index 6094805fbd63b..fb061144438dc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -22,11 +22,13 @@
  * Authors: Ben Skeggs
  */
 #include "outp.h"
+#include "conn.h"
 #include "dp.h"
 #include "ior.h"
 
 #include <subdev/bios.h>
 #include <subdev/bios/dcb.h>
+#include <subdev/gpio.h>
 #include <subdev/i2c.h>
 
 void
@@ -207,6 +209,31 @@ nvkm_outp_acquire(struct nvkm_outp *outp, u8 user, bool hda)
 	return nvkm_outp_acquire_hda(outp, type, user, false);
 }
 
+int
+nvkm_outp_detect(struct nvkm_outp *outp)
+{
+	struct nvkm_gpio *gpio = outp->disp->engine.subdev.device->gpio;
+	int ret = -EINVAL;
+
+	if (outp->conn->info.hpd != DCB_GPIO_UNUSED) {
+		ret = nvkm_gpio_get(gpio, 0, DCB_GPIO_UNUSED, outp->conn->info.hpd);
+		if (ret < 0)
+			return ret;
+		if (ret)
+			return 1;
+
+		/*TODO: Look into returning NOT_PRESENT if !HPD on DVI/HDMI.
+		 *
+		 *      It's uncertain whether this is accurate for all older chipsets,
+		 *      so we're returning UNKNOWN, and the DRM will probe DDC instead.
+		 */
+		if (outp->info.type == DCB_OUTPUT_DP)
+			return 0;
+	}
+
+	return ret;
+}
+
 void
 nvkm_outp_fini(struct nvkm_outp *outp)
 {
@@ -328,6 +355,7 @@ nvkm_outp_new_(const struct nvkm_outp_func *func, struct nvkm_disp *disp,
 
 static const struct nvkm_outp_func
 nvkm_outp = {
+	.detect = nvkm_outp_detect,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 4e7f873f66e27..8c9fe878f3209 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -74,6 +74,9 @@ int nvkm_outp_new(struct nvkm_disp *, int index, struct dcb_output *, struct nvk
 void nvkm_outp_del(struct nvkm_outp **);
 void nvkm_outp_init(struct nvkm_outp *);
 void nvkm_outp_fini(struct nvkm_outp *);
+
+int nvkm_outp_detect(struct nvkm_outp *);
+
 int nvkm_outp_acquire(struct nvkm_outp *, u8 user, bool hda);
 void nvkm_outp_release(struct nvkm_outp *, u8 user);
 void nvkm_outp_route(struct nvkm_disp *);
@@ -82,6 +85,9 @@ struct nvkm_outp_func {
 	void *(*dtor)(struct nvkm_outp *);
 	void (*init)(struct nvkm_outp *);
 	void (*fini)(struct nvkm_outp *);
+
+	int (*detect)(struct nvkm_outp *);
+
 	int (*acquire)(struct nvkm_outp *);
 	void (*release)(struct nvkm_outp *);
 	void (*disable)(struct nvkm_outp *, struct nvkm_ior *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index dad942be6679c..971cccc0892cc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -100,46 +100,6 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 			       nvkm_uconn_uevent_gpio);
 }
 
-static int
-nvkm_uconn_mthd_hpd_status(struct nvkm_conn *conn, void *argv, u32 argc)
-{
-	struct nvkm_gpio *gpio = conn->disp->engine.subdev.device->gpio;
-	union nvif_conn_hpd_status_args *args = argv;
-
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-
-	args->v0.support = gpio && conn->info.hpd != DCB_GPIO_UNUSED;
-	args->v0.present = 0;
-
-	if (args->v0.support) {
-		int ret = nvkm_gpio_get(gpio, 0, DCB_GPIO_UNUSED, conn->info.hpd);
-
-		if (WARN_ON(ret < 0)) {
-			args->v0.support = false;
-			return 0;
-		}
-
-		args->v0.present = ret;
-	}
-
-	return 0;
-}
-
-static int
-nvkm_uconn_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
-{
-	struct nvkm_conn *conn = nvkm_uconn(object);
-
-	switch (mthd) {
-	case NVIF_CONN_V0_HPD_STATUS: return nvkm_uconn_mthd_hpd_status(conn, argv, argc);
-	default:
-		break;
-	}
-
-	return -EINVAL;
-}
-
 static void *
 nvkm_uconn_dtor(struct nvkm_object *object)
 {
@@ -155,7 +115,6 @@ nvkm_uconn_dtor(struct nvkm_object *object)
 static const struct nvkm_object_func
 nvkm_uconn = {
 	.dtor = nvkm_uconn_dtor,
-	.mthd = nvkm_uconn_mthd,
 	.uevent = nvkm_uconn_uevent,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 440ea52cc7d2b..43752e216ce88 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -275,6 +275,29 @@ nvkm_uoutp_mthd_load_detect(struct nvkm_outp *outp, void *argv, u32 argc)
 	return ret;
 }
 
+static int
+nvkm_uoutp_mthd_detect(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_detect_args *args = argv;
+	int ret;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+		return -ENOSYS;
+	if (!outp->func->detect)
+		return -EINVAL;
+
+	ret = outp->func->detect(outp);
+	switch (ret) {
+	case 0: args->v0.status = NVIF_OUTP_DETECT_V0_NOT_PRESENT; break;
+	case 1: args->v0.status = NVIF_OUTP_DETECT_V0_PRESENT; break;
+	default:
+		args->v0.status = NVIF_OUTP_DETECT_V0_UNKNOWN;
+		break;
+	}
+
+	return 0;
+}
+
 static int
 nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
@@ -295,6 +318,7 @@ static int
 nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
 	switch (mthd) {
+	case NVIF_OUTP_V0_DETECT     : return nvkm_uoutp_mthd_detect     (outp, argv, argc);
 	case NVIF_OUTP_V0_ACQUIRE    : return nvkm_uoutp_mthd_acquire    (outp, argv, argc);
 	case NVIF_OUTP_V0_LOAD_DETECT: return nvkm_uoutp_mthd_load_detect(outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_PWR : return nvkm_uoutp_mthd_dp_aux_pwr (outp, argv, argc);
-- 
2.41.0

