Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C66681E34
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 23:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D345D10E244;
	Mon, 30 Jan 2023 22:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA1510E244
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 22:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675118290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kg/lhPyiRkJLZudIrXXBbs+rg/iWSyokH50SGmIihCw=;
 b=M75nLAViUwN7j1zoVIOYhGrhx8fHZUY3aKz2XF9MU7A8nTQpXN355q+1VUgDyN3XDzW2lf
 CFqhPM7+6Z85SESUWbRIj5Qmni5AmrCtWZwRV09BfsFatL3nhWmcMMFF3ViIFGXrlWScDs
 AsrD2oD5R3gdweAOBxgRLp2D2y/nP/o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-Cly88Q4_MHivPdylzohpXA-1; Mon, 30 Jan 2023 17:37:31 -0500
X-MC-Unique: Cly88Q4_MHivPdylzohpXA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4ECD887B2A1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 22:37:31 +0000 (UTC)
Received: from localhost.localdomain (vpn2-52-18.bne.redhat.com [10.64.52.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFB9A492B0A;
 Mon, 30 Jan 2023 22:37:29 +0000 (UTC)
From: Ben Skeggs <bskeggs@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/nouveau/fb/tu102-: fix register used to determine
 scrub status
Date: Tue, 31 Jan 2023 08:37:14 +1000
Message-Id: <20230130223715.1831509-2-bskeggs@redhat.com>
In-Reply-To: <20230130223715.1831509-1-bskeggs@redhat.com>
References: <20230130223715.1831509-1-bskeggs@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Turing apparently needs to use the same register we use on Ampere.

Not executing the scrubber ucode when required would result in large
areas of VRAM being inaccessible to the driver.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/fb.h  |  1 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c | 10 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/fb/ga102.c    |  8 +--
 .../gpu/drm/nouveau/nvkm/subdev/fb/gv100.c    |  5 --
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h |  2 +
 .../gpu/drm/nouveau/nvkm/subdev/fb/tu102.c    | 55 +++++++++++++++++++
 7 files changed, 65 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
index 40768373cdd9..c5a4f49ee206 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
@@ -97,6 +97,7 @@ int gp100_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct n
 int gp102_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
 int gp10b_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
 int gv100_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
+int tu102_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
 int ga100_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
 int ga102_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 364fea320cb3..1c81e5b34d29 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2405,7 +2405,7 @@ nv162_chipset = {
 	.bus      = { 0x00000001, gf100_bus_new },
 	.devinit  = { 0x00000001, tu102_devinit_new },
 	.fault    = { 0x00000001, tu102_fault_new },
-	.fb       = { 0x00000001, gv100_fb_new },
+	.fb       = { 0x00000001, tu102_fb_new },
 	.fuse     = { 0x00000001, gm107_fuse_new },
 	.gpio     = { 0x00000001, gk104_gpio_new },
 	.gsp      = { 0x00000001, gv100_gsp_new },
@@ -2440,7 +2440,7 @@ nv164_chipset = {
 	.bus      = { 0x00000001, gf100_bus_new },
 	.devinit  = { 0x00000001, tu102_devinit_new },
 	.fault    = { 0x00000001, tu102_fault_new },
-	.fb       = { 0x00000001, gv100_fb_new },
+	.fb       = { 0x00000001, tu102_fb_new },
 	.fuse     = { 0x00000001, gm107_fuse_new },
 	.gpio     = { 0x00000001, gk104_gpio_new },
 	.gsp      = { 0x00000001, gv100_gsp_new },
@@ -2475,7 +2475,7 @@ nv166_chipset = {
 	.bus      = { 0x00000001, gf100_bus_new },
 	.devinit  = { 0x00000001, tu102_devinit_new },
 	.fault    = { 0x00000001, tu102_fault_new },
-	.fb       = { 0x00000001, gv100_fb_new },
+	.fb       = { 0x00000001, tu102_fb_new },
 	.fuse     = { 0x00000001, gm107_fuse_new },
 	.gpio     = { 0x00000001, gk104_gpio_new },
 	.gsp      = { 0x00000001, gv100_gsp_new },
@@ -2510,7 +2510,7 @@ nv167_chipset = {
 	.bus      = { 0x00000001, gf100_bus_new },
 	.devinit  = { 0x00000001, tu102_devinit_new },
 	.fault    = { 0x00000001, tu102_fault_new },
-	.fb       = { 0x00000001, gv100_fb_new },
+	.fb       = { 0x00000001, tu102_fb_new },
 	.fuse     = { 0x00000001, gm107_fuse_new },
 	.gpio     = { 0x00000001, gk104_gpio_new },
 	.gsp      = { 0x00000001, gv100_gsp_new },
@@ -2545,7 +2545,7 @@ nv168_chipset = {
 	.bus      = { 0x00000001, gf100_bus_new },
 	.devinit  = { 0x00000001, tu102_devinit_new },
 	.fault    = { 0x00000001, tu102_fault_new },
-	.fb       = { 0x00000001, gv100_fb_new },
+	.fb       = { 0x00000001, tu102_fb_new },
 	.fuse     = { 0x00000001, gm107_fuse_new },
 	.gpio     = { 0x00000001, gk104_gpio_new },
 	.gsp      = { 0x00000001, gv100_gsp_new },
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
index 5d0bab8ecb43..6ba5120a2ebe 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
@@ -32,6 +32,7 @@ nvkm-y += nvkm/subdev/fb/gp100.o
 nvkm-y += nvkm/subdev/fb/gp102.o
 nvkm-y += nvkm/subdev/fb/gp10b.o
 nvkm-y += nvkm/subdev/fb/gv100.o
+nvkm-y += nvkm/subdev/fb/tu102.o
 nvkm-y += nvkm/subdev/fb/ga100.o
 nvkm-y += nvkm/subdev/fb/ga102.o
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c
index 8b7c8ea5e8a5..5a21b0ae4595 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c
@@ -40,12 +40,6 @@ ga102_fb_vpr_scrub(struct nvkm_fb *fb)
 	return ret;
 }
 
-static bool
-ga102_fb_vpr_scrub_required(struct nvkm_fb *fb)
-{
-	return (nvkm_rd32(fb->subdev.device, 0x1fa80c) & 0x00000010) != 0;
-}
-
 static const struct nvkm_fb_func
 ga102_fb = {
 	.dtor = gf100_fb_dtor,
@@ -56,7 +50,7 @@ ga102_fb = {
 	.sysmem.flush_page_init = gf100_fb_sysmem_flush_page_init,
 	.ram_new = ga102_ram_new,
 	.default_bigpage = 16,
-	.vpr.scrub_required = ga102_fb_vpr_scrub_required,
+	.vpr.scrub_required = tu102_fb_vpr_scrub_required,
 	.vpr.scrub = ga102_fb_vpr_scrub,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c
index 1f0126437c1a..0e3c0a8f5d71 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c
@@ -49,8 +49,3 @@ gv100_fb_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, s
 }
 
 MODULE_FIRMWARE("nvidia/gv100/nvdec/scrubber.bin");
-MODULE_FIRMWARE("nvidia/tu102/nvdec/scrubber.bin");
-MODULE_FIRMWARE("nvidia/tu104/nvdec/scrubber.bin");
-MODULE_FIRMWARE("nvidia/tu106/nvdec/scrubber.bin");
-MODULE_FIRMWARE("nvidia/tu116/nvdec/scrubber.bin");
-MODULE_FIRMWARE("nvidia/tu117/nvdec/scrubber.bin");
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h
index ac03eac0f261..f517751f94ac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h
@@ -89,4 +89,6 @@ bool gp102_fb_vpr_scrub_required(struct nvkm_fb *);
 int gp102_fb_vpr_scrub(struct nvkm_fb *);
 
 int gv100_fb_init_page(struct nvkm_fb *);
+
+bool tu102_fb_vpr_scrub_required(struct nvkm_fb *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c
new file mode 100644
index 000000000000..be82af0364ee
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c
@@ -0,0 +1,55 @@
+/*
+ * Copyright 2018 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+#include "gf100.h"
+#include "ram.h"
+
+bool
+tu102_fb_vpr_scrub_required(struct nvkm_fb *fb)
+{
+	return (nvkm_rd32(fb->subdev.device, 0x1fa80c) & 0x00000010) != 0;
+}
+
+static const struct nvkm_fb_func
+tu102_fb = {
+	.dtor = gf100_fb_dtor,
+	.oneinit = gf100_fb_oneinit,
+	.init = gm200_fb_init,
+	.init_page = gv100_fb_init_page,
+	.init_unkn = gp100_fb_init_unkn,
+	.sysmem.flush_page_init = gf100_fb_sysmem_flush_page_init,
+	.vpr.scrub_required = tu102_fb_vpr_scrub_required,
+	.vpr.scrub = gp102_fb_vpr_scrub,
+	.ram_new = gp100_ram_new,
+	.default_bigpage = 16,
+};
+
+int
+tu102_fb_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_fb **pfb)
+{
+	return gp102_fb_new_(&tu102_fb, device, type, inst, pfb);
+}
+
+MODULE_FIRMWARE("nvidia/tu102/nvdec/scrubber.bin");
+MODULE_FIRMWARE("nvidia/tu104/nvdec/scrubber.bin");
+MODULE_FIRMWARE("nvidia/tu106/nvdec/scrubber.bin");
+MODULE_FIRMWARE("nvidia/tu116/nvdec/scrubber.bin");
+MODULE_FIRMWARE("nvidia/tu117/nvdec/scrubber.bin");
-- 
2.35.1

