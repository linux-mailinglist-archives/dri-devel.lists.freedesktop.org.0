Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EB3970616
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 11:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2B810E1EF;
	Sun,  8 Sep 2024 09:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="EOyFPiJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8FC10E216
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 09:44:19 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725788658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8RcPWyabfuABUYsNHHZ6PMoliYgmVyqBgeC1D6O8C5Q=;
 b=EOyFPiJ5ymhox6QaGq59jr24sqM6ybWvlt6+Wt8DXf8U9mks4TwtOkCj3uZoGtQiu5fXin
 RDk1T0d8SiVVog24ulFOBz6i3FWQf14U1MC/GcE5kfezdrLSENolx8FEi+R7SCrgR2HnKQ
 R/G4uajbi9MZlvWKOQhC17Z6xSLpjDg=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v15 02/19] drm/etnaviv: Export drm_gem_print_info() and use it
Date: Sun,  8 Sep 2024 17:43:40 +0800
Message-ID: <20240908094357.291862-3-sui.jingfeng@linux.dev>
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

This will make the newly implemented etnaviv_gem_object_funcs::print_info
get in use, which improves code sharing and simplifies debugfs. Achieve
better humen readability for debug log.

Use container_of_const() if 'struct etnaviv_gem_object *etnaviv_obj' is a
constant pointer.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/drm_gem.c             |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 13 +++++--------
 include/drm/drm_gem.h                 |  2 ++
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index d4bbc5d109c8..9c5c971c1b23 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1160,6 +1160,7 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 	if (obj->funcs->print_info)
 		obj->funcs->print_info(p, indent, obj);
 }
+EXPORT_SYMBOL(drm_gem_print_info);
 
 int drm_gem_pin_locked(struct drm_gem_object *obj)
 {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 543d881585b3..6bdf72cd9e85 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2015-2018 Etnaviv Project
  */
 
+#include <drm/drm_gem.h>
 #include <drm/drm_prime.h>
 #include <linux/dma-mapping.h>
 #include <linux/shmem_fs.h>
@@ -432,15 +433,11 @@ int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
 #ifdef CONFIG_DEBUG_FS
 static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 {
-	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
+	struct drm_printer p = drm_seq_file_printer(m);
 	struct dma_resv *robj = obj->resv;
-	unsigned long off = drm_vma_node_start(&obj->vma_node);
 	int r;
 
-	seq_printf(m, "%08x: %c %2d (%2d) %08lx %p %zd\n",
-			etnaviv_obj->flags, is_active(etnaviv_obj) ? 'A' : 'I',
-			obj->name, kref_read(&obj->refcount),
-			off, etnaviv_obj->vaddr, obj->size);
+	drm_gem_print_info(&p, 1, obj);
 
 	r = dma_resv_lock(robj, NULL);
 	if (r)
@@ -461,7 +458,7 @@ void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
 	list_for_each_entry(etnaviv_obj, &priv->gem_list, gem_node) {
 		struct drm_gem_object *obj = &etnaviv_obj->base;
 
-		seq_puts(m, "   ");
+		seq_printf(m, "obj[%d]:\n", count);
 		etnaviv_gem_describe(obj, m);
 		count++;
 		size += obj->size;
@@ -556,7 +553,7 @@ static void etnaviv_gem_object_info(struct drm_printer *p,
 {
 	const struct etnaviv_gem_object *etnaviv_obj;
 
-	etnaviv_obj = container_of(obj, struct etnaviv_gem_object, base);
+	etnaviv_obj = container_of_const(obj, struct etnaviv_gem_object, base);
 
 	drm_printf_indent(p, indent, "caching mode=%s\n",
 			  etnaviv_gem_obj_caching_info(etnaviv_obj->flags));
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index bae4865b2101..0791566fab53 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -480,6 +480,8 @@ void drm_gem_vm_close(struct vm_area_struct *vma);
 int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
 		     struct vm_area_struct *vma);
 int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
+void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
+			const struct drm_gem_object *obj);
 
 /**
  * drm_gem_object_get - acquire a GEM buffer object reference
-- 
2.43.0

