Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD03F54B3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 02:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7F189F73;
	Tue, 24 Aug 2021 00:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B7689F73;
 Tue, 24 Aug 2021 00:55:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4277661411;
 Tue, 24 Aug 2021 00:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629766537;
 bh=//5hjDlDG90O/rlUruPVJggLxocJK7fi0DL+kMzK7pE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BMs82UU5h/U4cFoCFvWuzegYxDemIGhn2/xvYpadkBp+HpGSLTWEbNepFPKinjwML
 m/ByFPwwxl1Kbt5M8aK7Bb/DntMrVUGMVmfiDS8MB0yuSKnnuSDlEViP/BR5apzMzk
 t96unLFQMnuvZ45e30pBxCuM68AyD5oixarbDDZCKJt+0jxDnaK923/d+NCVxQFddl
 NWJhsIrS1I2+IVXr7G446GffHnFWF7V8XJiAx6+NdXFEWFatzNouZcPY2KZtmLVhH8
 9Fv3vtCLW+jmEe5HnyClsx1HfkbaNgb81oJiEqt171yOnqKi7VKC6OWqnJw0zQ00CK
 9D4Ne7lQ8/+3Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ben Skeggs <bskeggs@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH AUTOSEL 4.14 6/7] drm/nouveau: block a bunch of classes from
 userspace
Date: Mon, 23 Aug 2021 20:55:27 -0400
Message-Id: <20210824005528.631702-6-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210824005528.631702-1-sashal@kernel.org>
References: <20210824005528.631702-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

[ Upstream commit 148a8653789c01f159764ffcc3f370008966b42f ]

Long ago, there had been plans for making use of a bunch of these APIs
from userspace and there's various checks in place to stop misbehaving.

Countless other projects have occurred in the meantime, and the pieces
didn't finish falling into place for that to happen.

They will (hopefully) in the not-too-distant future, but it won't look
quite as insane.  The super checks are causing problems right now, and
are going to be removed.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h |  3 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  1 +
 drivers/gpu/drm/nouveau/nouveau_usif.c        | 57 ++++++++++++++-----
 .../gpu/drm/nouveau/nvkm/engine/device/user.c |  2 +-
 4 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
index 2740278d226b..61c17acd507c 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
@@ -4,7 +4,8 @@
 
 struct nv_device_v0 {
 	__u8  version;
-	__u8  pad01[7];
+	__u8  priv;
+	__u8  pad02[6];
 	__u64 device;	/* device identifier, ~0 for client default */
 };
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index fb6b1d0f7fef..fc54a26598cc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -151,6 +151,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	ret = nvif_device_init(&cli->base.object, 0, NV_DEVICE,
 			       &(struct nv_device_v0) {
 					.device = ~0,
+					.priv = true,
 			       }, sizeof(struct nv_device_v0),
 			       &cli->device);
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_usif.c b/drivers/gpu/drm/nouveau/nouveau_usif.c
index 9dc10b17ad34..5da1f4d223d7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_usif.c
+++ b/drivers/gpu/drm/nouveau/nouveau_usif.c
@@ -32,6 +32,9 @@
 #include <nvif/event.h>
 #include <nvif/ioctl.h>
 
+#include <nvif/class.h>
+#include <nvif/cl0080.h>
+
 struct usif_notify_p {
 	struct drm_pending_event base;
 	struct {
@@ -261,7 +264,7 @@ usif_object_dtor(struct usif_object *object)
 }
 
 static int
-usif_object_new(struct drm_file *f, void *data, u32 size, void *argv, u32 argc)
+usif_object_new(struct drm_file *f, void *data, u32 size, void *argv, u32 argc, bool parent_abi16)
 {
 	struct nouveau_cli *cli = nouveau_cli(f);
 	struct nvif_client *client = &cli->base;
@@ -271,23 +274,48 @@ usif_object_new(struct drm_file *f, void *data, u32 size, void *argv, u32 argc)
 	struct usif_object *object;
 	int ret = -ENOSYS;
 
+	if ((ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true)))
+		return ret;
+
+	switch (args->v0.oclass) {
+	case NV_DMA_FROM_MEMORY:
+	case NV_DMA_TO_MEMORY:
+	case NV_DMA_IN_MEMORY:
+		return -EINVAL;
+	case NV_DEVICE: {
+		union {
+			struct nv_device_v0 v0;
+		} *args = data;
+
+		if ((ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false)))
+			return ret;
+
+		args->v0.priv = false;
+		break;
+	}
+	default:
+		if (!parent_abi16)
+			return -EINVAL;
+		break;
+	}
+
 	if (!(object = kmalloc(sizeof(*object), GFP_KERNEL)))
 		return -ENOMEM;
 	list_add(&object->head, &cli->objects);
 
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true))) {
-		object->route = args->v0.route;
-		object->token = args->v0.token;
-		args->v0.route = NVDRM_OBJECT_USIF;
-		args->v0.token = (unsigned long)(void *)object;
-		ret = nvif_client_ioctl(client, argv, argc);
-		args->v0.token = object->token;
-		args->v0.route = object->route;
+	object->route = args->v0.route;
+	object->token = args->v0.token;
+	args->v0.route = NVDRM_OBJECT_USIF;
+	args->v0.token = (unsigned long)(void *)object;
+	ret = nvif_client_ioctl(client, argv, argc);
+	if (ret) {
+		usif_object_dtor(object);
+		return ret;
 	}
 
-	if (ret)
-		usif_object_dtor(object);
-	return ret;
+	args->v0.token = object->token;
+	args->v0.route = object->route;
+	return 0;
 }
 
 int
@@ -301,6 +329,7 @@ usif_ioctl(struct drm_file *filp, void __user *user, u32 argc)
 		struct nvif_ioctl_v0 v0;
 	} *argv = data;
 	struct usif_object *object;
+	bool abi16 = false;
 	u8 owner;
 	int ret;
 
@@ -331,11 +360,13 @@ usif_ioctl(struct drm_file *filp, void __user *user, u32 argc)
 			mutex_unlock(&cli->mutex);
 			goto done;
 		}
+
+		abi16 = true;
 	}
 
 	switch (argv->v0.type) {
 	case NVIF_IOCTL_V0_NEW:
-		ret = usif_object_new(filp, data, size, argv, argc);
+		ret = usif_object_new(filp, data, size, argv, argc, abi16);
 		break;
 	case NVIF_IOCTL_V0_NTFY_NEW:
 		ret = usif_notify_new(filp, data, size, argv, argc);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index 513ee6b79553..08100eed9584 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -347,7 +347,7 @@ nvkm_udevice_new(const struct nvkm_oclass *oclass, void *data, u32 size,
 		return ret;
 
 	/* give priviledged clients register access */
-	if (client->super)
+	if (args->v0.priv)
 		func = &nvkm_udevice_super;
 	else
 		func = &nvkm_udevice;
-- 
2.30.2

