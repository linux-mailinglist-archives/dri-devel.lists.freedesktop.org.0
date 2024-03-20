Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B0C880B60
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 07:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E2410EF67;
	Wed, 20 Mar 2024 06:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="EUttLcZF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B849910EFE6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 06:41:02 +0000 (UTC)
X-UUID: cdebafcce68411ee935d6952f98a51a9-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zpWr3zRO3fclG03mBQt29jpLjsOvtGYpcOWaVg4uoAg=; 
 b=EUttLcZFitqOQROJHKniFI6tviEfTp6wrOo5rK765qyCr7981RWiQot+nune4jothC/ML4sFIZDOZxd5WWYT4Y3OHSngDZAcoh0l4DZAT0G5h28/WPBIJD2CNr5sJr+xgdzyi9nk7JlEBqT31GcHBzHHKg+V3wtxOuysWURSaYQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:d518588b-a28d-42b5-8f49-6706a1b88ff6, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6f543d0, CLOUDID:a9dc1a00-c26b-4159-a099-3b9d0558e447,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: cdebafcce68411ee935d6952f98a51a9-20240320
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1515671204; Wed, 20 Mar 2024 14:40:55 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 14:40:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 14:40:54 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 CK Hu <ck.hu@mediatek.com>, Hsiao Chien Sung
 <shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH 1/1] drm/mediatek: Add interface to allocate MediaTek GEM
 buffer.
Date: Wed, 20 Mar 2024 14:40:43 +0800
Message-ID: <20240320064043.29780-2-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240320064043.29780-1-shawn.sung@mediatek.com>
References: <20240320064043.29780-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.383100-8.000000
X-TMASE-MatchedRID: IP2XlN8ufaOXFGyE5q3nYI6MisxJraxHvhf/zJ92tsP7efdnqtsaE0bj
 B8LDWKj2Aunqu1nlwTRswaBvYjx/7iQVVteP90CtKaMQ6tw7oDJU3K6aV1ad7d9RlPzeVuQQkmi
 3zE7HIvkybq5nXNxxl6mm1mbOCqOQig1RteqE6iB0Uibeis6dEK6JG5H2YJq6FLXUWU5hGiERcU
 eSUAEujpJWdV1quNw8aNPw9ABc6H69WjwSnAs/t6OuVibdZNTvuoYFb0nRiqPIvQIyugvKdbyPe
 55WbcuIaO7i+fdXAfAy7RToPtBlKOlVfYNOXGqmoiN8YTmq+cvoFXQb3ZgkUf2TbFr0CGODEcRa
 3XM5JeRptSMKPu8IjkdWV7qYCXR19dXaIcOJDZ+yBjDX4sGuTaxwr8rYOW+OZ3q824boKrLr2yi
 Kkd3N2shHObr27PYyaK8uWXuH4d0fE8yM4pjsDwtuKBGekqUpI/NGWt0UYPCztFsz3UM2JH/t3i
 lEWiSYZevEzYr2I57Pbkz8xBB1sCZW8DARDgA6
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.383100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1F952494E808C544C06D179AB27174BFAD16BB8B127BCD41789353EB745A520D2000:8
X-MTK: N
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

From: CK Hu <ck.hu@mediatek.com>

Add an interface to allocate MediaTek GEM buffers, allow the IOCTLs
to be used by render nodes.
This patch also sets the RENDER driver feature.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 16 ++++++-
 drivers/gpu/drm/mediatek/mtk_gem.c     | 40 ++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_gem.h     | 11 +++++
 include/uapi/drm/mediatek_drm.h        | 64 ++++++++++++++++++++++++++
 4 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 include/uapi/drm/mediatek_drm.h

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a671e293a07e1..4710cd8b7288b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -24,6 +24,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/mediatek_drm.h>
 
 #include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
@@ -571,6 +572,14 @@ static void mtk_drm_kms_deinit(struct drm_device *drm)
 	component_unbind_all(drm->dev, drm);
 }
 
+static const struct drm_ioctl_desc mtk_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(MTK_GEM_CREATE, mtk_gem_create_ioctl,
+			  DRM_UNLOCKED | DRM_AUTH | DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MTK_GEM_MAP_OFFSET,
+			  mtk_gem_map_offset_ioctl,
+			  DRM_UNLOCKED | DRM_AUTH | DRM_RENDER_ALLOW),
+};
+
 DEFINE_DRM_GEM_FOPS(mtk_drm_fops);
 
 /*
@@ -586,12 +595,17 @@ static struct drm_gem_object *mtk_gem_prime_import(struct drm_device *dev,
 }
 
 static const struct drm_driver mtk_drm_driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC |
+			   DRIVER_RENDER,
 
 	.dumb_create = mtk_gem_dumb_create,
 
 	.gem_prime_import = mtk_gem_prime_import,
 	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
+
+	.ioctls = mtk_ioctls,
+	.num_ioctls = ARRAY_SIZE(mtk_ioctls),
+
 	.fops = &mtk_drm_fops,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.c b/drivers/gpu/drm/mediatek/mtk_gem.c
index f0c3318fd7f5a..e336c253b0f38 100644
--- a/drivers/gpu/drm/mediatek/mtk_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_gem.c
@@ -4,9 +4,11 @@
  */
 
 #include <linux/dma-buf.h>
+#include <drm/mediatek_drm.h>
 
 #include <drm/drm.h>
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_prime.h>
@@ -282,3 +284,41 @@ void mtk_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 	mtk_gem->kvaddr = NULL;
 	kfree(mtk_gem->pages);
 }
+
+int mtk_gem_map_offset_ioctl(struct drm_device *drm, void *data,
+			     struct drm_file *file_priv)
+{
+	struct drm_mtk_gem_map_off *args = data;
+
+	return drm_gem_dumb_map_offset(file_priv, drm, args->handle,
+				       &args->offset);
+}
+
+int mtk_gem_create_ioctl(struct drm_device *dev, void *data,
+			 struct drm_file *file_priv)
+{
+	struct mtk_gem_obj *mtk_gem;
+	struct drm_mtk_gem_create *args = data;
+	int ret;
+
+	mtk_gem = mtk_gem_create(dev, args->size, false);
+	if (IS_ERR(mtk_gem))
+		return PTR_ERR(mtk_gem);
+
+	/*
+	 * allocate a id of idr table where the obj is registered
+	 * and handle has the id what user can see.
+	 */
+	ret = drm_gem_handle_create(file_priv, &mtk_gem->base, &args->handle);
+	if (ret)
+		goto err_handle_create;
+
+	/* drop reference from allocate - handle holds it now. */
+	drm_gem_object_put(&mtk_gem->base);
+
+	return 0;
+
+err_handle_create:
+	mtk_gem_free_object(&mtk_gem->base);
+	return ret;
+}
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.h b/drivers/gpu/drm/mediatek/mtk_gem.h
index 66e5f154f6980..4d7598220ca8f 100644
--- a/drivers/gpu/drm/mediatek/mtk_gem.h
+++ b/drivers/gpu/drm/mediatek/mtk_gem.h
@@ -45,4 +45,15 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 int mtk_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void mtk_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 
+/*
+ * request gem object creation and buffer allocation as the size
+ * that it is calculated with framebuffer information such as width,
+ * height and bpp.
+ */
+int mtk_gem_create_ioctl(struct drm_device *dev, void *data,
+			 struct drm_file *file_priv);
+
+/* get buffer offset to map to user space. */
+int mtk_gem_map_offset_ioctl(struct drm_device *dev, void *data,
+			     struct drm_file *file_priv);
 #endif
diff --git a/include/uapi/drm/mediatek_drm.h b/include/uapi/drm/mediatek_drm.h
new file mode 100644
index 0000000000000..b0dea00bacbc4
--- /dev/null
+++ b/include/uapi/drm/mediatek_drm.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/*
+ * Copyright (c) 2015 MediaTek Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _UAPI_MEDIATEK_DRM_H
+#define _UAPI_MEDIATEK_DRM_H
+
+#include <drm/drm.h>
+
+#ifdef __KERNEL__
+#include <linux/types.h>
+#else
+#include <stdint.h>
+#endif
+
+/**
+ * User-desired buffer creation information structure.
+ *
+ * @size: user-desired memory allocation size.
+ *	- this size value would be page-aligned internally.
+ * @flags: user request for setting memory type or cache attributes.
+ * @handle: returned a handle to created gem object.
+ *	- this handle will be set by gem module of kernel side.
+ */
+struct drm_mtk_gem_create {
+	uint64_t size;
+	uint32_t flags;
+	uint32_t handle;
+};
+
+/**
+ * A structure for getting buffer offset.
+ *
+ * @handle: a pointer to gem object created.
+ * @pad: just padding to be 64-bit aligned.
+ * @offset: relatived offset value of the memory region allocated.
+ *     - this value should be set by user.
+ */
+struct drm_mtk_gem_map_off {
+	uint32_t handle;
+	uint32_t pad;
+	uint64_t offset;
+};
+
+#define DRM_MTK_GEM_CREATE		0x00
+#define DRM_MTK_GEM_MAP_OFFSET		0x01
+
+#define DRM_IOCTL_MTK_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + \
+		DRM_MTK_GEM_CREATE, struct drm_mtk_gem_create)
+
+#define DRM_IOCTL_MTK_GEM_MAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + \
+		DRM_MTK_GEM_MAP_OFFSET, struct drm_mtk_gem_map_off)
+
+#endif /* _UAPI_MEDIATEK_DRM_H */
-- 
2.18.0

