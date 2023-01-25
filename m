Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D56C167B569
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 16:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D8310E7FC;
	Wed, 25 Jan 2023 15:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B4810E7F9;
 Wed, 25 Jan 2023 15:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1674659245; bh=3kVFSj9F5r4zxQcKbBTyYKgIq05zuwPxG6KbVQ++e3g=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=ijJPXqb9T9rNuYug9wDmBjZNcoI7knQGv8uhpPu+63nu+Scs9p8fYO64+AHMrkdJw
 2hMEv2cUyhkIYyYKWWdSmFP6WRIHhgWibdJ96z0Uzi+3QmMsPdDM1iwhLzm/ba//Yr
 5e3iaPKb81ODwt4zzBRTTxWkaerko2Z6dcXhC0Zc=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Wed, 25 Jan 2023 16:07:24 +0100 (CET)
X-EA-Auth: P9eRXJcvULD/LlNSEoxED6IvPVWZxGaHOnHgLK9K0jZ0NU4zvHdVexZOWXhZmyT1B6y9xTnZegI4FpF4U7FiqDfX7yUYLlBh
Date: Wed, 25 Jan 2023 20:37:14 +0530
From: Deepak R Varma <drv@mailo.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/devinit: Convert function disable() to be void
Message-ID: <Y9FFoooIXjlr+UP1@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current design of callback function disable() of struct
nvkm_devinit_func is defined to return a u64 value. In its implementation
in the driver modules, the function always returns a fixed value 0. Hence
the design and implementation of this function should be enhanced to return
void instead of a fixed value. This change also eliminates untouched
return variables.

The change is identified using the returnvar.cocci Coccinelle semantic
patch script.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Please note: The change is compile build tested only.

 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c  | 3 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.c   | 5 +----
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c   | 4 +---
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c | 4 +---
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c | 4 +---
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c | 4 +---
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c | 4 +---
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.c  | 5 +----
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h  | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h  | 2 +-
 10 files changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c
index dd4981708fe4..3d9319c319c6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c
@@ -51,7 +51,8 @@ u64
 nvkm_devinit_disable(struct nvkm_devinit *init)
 {
 	if (init && init->func->disable)
-		return init->func->disable(init);
+		init->func->disable(init);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.c
index c224702b7bed..00df7811dd10 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.c
@@ -26,13 +26,12 @@
 #include <subdev/bios.h>
 #include <subdev/bios/init.h>
 
-static u64
+static void
 g84_devinit_disable(struct nvkm_devinit *init)
 {
 	struct nvkm_device *device = init->subdev.device;
 	u32 r001540 = nvkm_rd32(device, 0x001540);
 	u32 r00154c = nvkm_rd32(device, 0x00154c);
-	u64 disable = 0ULL;
 
 	if (!(r001540 & 0x40000000)) {
 		nvkm_subdev_disable(device, NVKM_ENGINE_MPEG, 0);
@@ -47,8 +46,6 @@ g84_devinit_disable(struct nvkm_devinit *init)
 		nvkm_subdev_disable(device, NVKM_ENGINE_BSP, 0);
 	if (!(r00154c & 0x00000040))
 		nvkm_subdev_disable(device, NVKM_ENGINE_CIPHER, 0);
-
-	return disable;
 }
 
 static const struct nvkm_devinit_func
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
index 8977483a9f42..54bee499b982 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
@@ -26,7 +26,7 @@
 #include <subdev/bios.h>
 #include <subdev/bios/init.h>
 
-static u64
+static void
 g98_devinit_disable(struct nvkm_devinit *init)
 {
 	struct nvkm_device *device = init->subdev.device;
@@ -45,8 +45,6 @@ g98_devinit_disable(struct nvkm_devinit *init)
 		nvkm_subdev_disable(device, NVKM_ENGINE_MSVLD, 0);
 	if (!(r00154c & 0x00000040))
 		nvkm_subdev_disable(device, NVKM_ENGINE_SEC, 0);
-
-	return 0ULL;
 }
 
 static const struct nvkm_devinit_func
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
index 5b7cb1fe7897..5368e705e7fd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
@@ -63,7 +63,7 @@ gf100_devinit_pll_set(struct nvkm_devinit *init, u32 type, u32 freq)
 	return ret;
 }
 
-static u64
+static void
 gf100_devinit_disable(struct nvkm_devinit *init)
 {
 	struct nvkm_device *device = init->subdev.device;
@@ -85,8 +85,6 @@ gf100_devinit_disable(struct nvkm_devinit *init)
 		nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
 	if (r022500 & 0x00000200)
 		nvkm_subdev_disable(device, NVKM_ENGINE_CE, 1);
-
-	return 0ULL;
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
index 8955af2704c7..7bcbc4895ec2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
@@ -26,7 +26,7 @@
 #include <subdev/bios.h>
 #include <subdev/bios/init.h>
 
-u64
+void
 gm107_devinit_disable(struct nvkm_devinit *init)
 {
 	struct nvkm_device *device = init->subdev.device;
@@ -39,8 +39,6 @@ gm107_devinit_disable(struct nvkm_devinit *init)
 		nvkm_subdev_disable(device, NVKM_ENGINE_CE, 2);
 	if (r021c04 & 0x00000001)
 		nvkm_subdev_disable(device, NVKM_ENGINE_DISP, 0);
-
-	return 0ULL;
 }
 
 static const struct nvkm_devinit_func
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c
index 3d0ab86c3115..dbca92318baf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c
@@ -62,7 +62,7 @@ gt215_devinit_pll_set(struct nvkm_devinit *init, u32 type, u32 freq)
 	return ret;
 }
 
-static u64
+static void
 gt215_devinit_disable(struct nvkm_devinit *init)
 {
 	struct nvkm_device *device = init->subdev.device;
@@ -80,8 +80,6 @@ gt215_devinit_disable(struct nvkm_devinit *init)
 		nvkm_subdev_disable(device, NVKM_ENGINE_MSVLD, 0);
 	if (!(r00154c & 0x00000200))
 		nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
-
-	return 0ULL;
 }
 
 static u32
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c
index a9cdf2411187..a24bd2e7d7ce 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c
@@ -26,7 +26,7 @@
 #include <subdev/bios.h>
 #include <subdev/bios/init.h>
 
-static u64
+static void
 mcp89_devinit_disable(struct nvkm_devinit *init)
 {
 	struct nvkm_device *device = init->subdev.device;
@@ -46,8 +46,6 @@ mcp89_devinit_disable(struct nvkm_devinit *init)
 		nvkm_subdev_disable(device, NVKM_ENGINE_VIC, 0);
 	if (!(r00154c & 0x00000200))
 		nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
-
-	return 0;
 }
 
 static const struct nvkm_devinit_func
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.c
index 380995d398b1..07ed8fd778b2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.c
@@ -77,17 +77,14 @@ nv50_devinit_pll_set(struct nvkm_devinit *init, u32 type, u32 freq)
 	return 0;
 }
 
-static u64
+static void
 nv50_devinit_disable(struct nvkm_devinit *init)
 {
 	struct nvkm_device *device = init->subdev.device;
 	u32 r001540 = nvkm_rd32(device, 0x001540);
-	u64 disable = 0ULL;
 
 	if (!(r001540 & 0x40000000))
 		nvkm_subdev_disable(device, NVKM_ENGINE_MPEG, 0);
-
-	return disable;
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h
index 987a7f478b84..8de409c084c1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h
@@ -23,7 +23,7 @@ int  gf100_devinit_ctor(struct nvkm_object *, struct nvkm_object *,
 int  gf100_devinit_pll_set(struct nvkm_devinit *, u32, u32);
 void gf100_devinit_preinit(struct nvkm_devinit *);
 
-u64  gm107_devinit_disable(struct nvkm_devinit *);
+void  gm107_devinit_disable(struct nvkm_devinit *);
 
 int gm200_devinit_post(struct nvkm_devinit *, bool);
 void gm200_devinit_preos(struct nv50_devinit *, bool);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h
index dd8b038a8cee..a648482d06e9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h
@@ -12,7 +12,7 @@ struct nvkm_devinit_func {
 	u32  (*mmio)(struct nvkm_devinit *, u32);
 	void (*meminit)(struct nvkm_devinit *);
 	int  (*pll_set)(struct nvkm_devinit *, u32 type, u32 freq);
-	u64  (*disable)(struct nvkm_devinit *);
+	void (*disable)(struct nvkm_devinit *);
 };
 
 void nvkm_devinit_ctor(const struct nvkm_devinit_func *, struct nvkm_device *,
-- 
2.34.1



