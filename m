Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5743E97061E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 11:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C244F10E241;
	Sun,  8 Sep 2024 09:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="aYft2ie4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com
 [95.215.58.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D2910E240
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 09:44:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725788669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3i0Qkav+uGheS0I6+IVKOcBuz/JMJb9z/Pxg/0ZYF0=;
 b=aYft2ie4Ojp5cuHgcCRMmTH+yy7GPxmjH0KBjNFz9DbSnppcH+WXEPtsccJshQoG8Q6GWK
 /kMJuU4JHUy+CLo/z7xoVxaXexNiNo4cc5W588SkvZhHGzN9f8zsoUqvnYAYfFaOaTe9Px
 2snFKYverFv/Ds63RTjt6W6ZcU+rbkY=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v15 05/19] drm/etnaviv: Add contructor and destructor for
 etnaviv_gem_get_mapping structure
Date: Sun,  8 Sep 2024 17:43:43 +0800
Message-ID: <20240908094357.291862-6-sui.jingfeng@linux.dev>
In-Reply-To: <20240908094357.291862-1-sui.jingfeng@linux.dev>
References: <20240908094357.291862-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Because this make the code more easier to understand, When GPU access the
VRAM, it will allocate a new mapping to use if there don't have one.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 40 +++++++++++++++++++--------
 drivers/gpu/drm/etnaviv/etnaviv_gem.h |  6 ++++
 2 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 85d4e7c87a6a..55004fa9fabd 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -227,6 +227,30 @@ etnaviv_gem_get_vram_mapping(struct etnaviv_gem_object *obj,
 	return NULL;
 }
 
+static struct etnaviv_vram_mapping *
+etnaviv_gem_vram_mapping_new(struct etnaviv_gem_object *etnaviv_obj)
+{
+	struct etnaviv_vram_mapping *mapping;
+
+	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
+	if (!mapping)
+		return NULL;
+
+	INIT_LIST_HEAD(&mapping->scan_node);
+	mapping->object = etnaviv_obj;
+	mapping->use = 1;
+
+	list_add_tail(&mapping->obj_node, &etnaviv_obj->vram_list);
+
+	return mapping;
+}
+
+static void etnaviv_gem_vram_mapping_destroy(struct etnaviv_vram_mapping *mapping)
+{
+	list_del(&mapping->obj_node);
+	kfree(mapping);
+}
+
 void etnaviv_gem_mapping_unreference(struct etnaviv_vram_mapping *mapping)
 {
 	struct etnaviv_gem_object *etnaviv_obj = mapping->object;
@@ -289,27 +313,20 @@ struct etnaviv_vram_mapping *etnaviv_gem_mapping_get(
 	 */
 	mapping = etnaviv_gem_get_vram_mapping(etnaviv_obj, NULL);
 	if (!mapping) {
-		mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
+		mapping = etnaviv_gem_vram_mapping_new(etnaviv_obj);
 		if (!mapping) {
 			ret = -ENOMEM;
 			goto out;
 		}
-
-		INIT_LIST_HEAD(&mapping->scan_node);
-		mapping->object = etnaviv_obj;
 	} else {
-		list_del(&mapping->obj_node);
+		mapping->use = 1;
 	}
 
-	mapping->use = 1;
-
 	ret = etnaviv_iommu_map_gem(mmu_context, etnaviv_obj,
 				    mmu_context->global->memory_base,
 				    mapping, va);
 	if (ret < 0)
-		kfree(mapping);
-	else
-		list_add_tail(&mapping->obj_node, &etnaviv_obj->vram_list);
+		etnaviv_gem_vram_mapping_destroy(mapping);
 
 out:
 	mutex_unlock(&etnaviv_obj->lock);
@@ -544,8 +561,7 @@ void etnaviv_gem_free_object(struct drm_gem_object *obj)
 		if (context)
 			etnaviv_iommu_unmap_gem(context, mapping);
 
-		list_del(&mapping->obj_node);
-		kfree(mapping);
+		etnaviv_gem_vram_mapping_destroy(mapping);
 	}
 
 	etnaviv_obj->ops->vunmap(etnaviv_obj);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index d4965de3007c..f2ac64d8e90b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -31,6 +31,12 @@ struct etnaviv_vram_mapping {
 	u32 iova;
 };
 
+static inline struct etnaviv_vram_mapping *
+to_etnaviv_vram_mapping(struct drm_mm_node *vram)
+{
+	return container_of(vram, struct etnaviv_vram_mapping, vram_node);
+}
+
 struct etnaviv_gem_object {
 	struct drm_gem_object base;
 	const struct etnaviv_gem_ops *ops;
-- 
2.43.0

