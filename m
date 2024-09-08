Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8D797062B
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 11:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D0410E251;
	Sun,  8 Sep 2024 09:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ISbnTowJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C51D10E24E
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 09:44:54 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725788692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAHogt64c5kc7Y5YIuhEER7fMKYPMI3sUmBW7MfbuoU=;
 b=ISbnTowJKRJD4v5Y/1dJoz9dC5D6tqEvzps0KId0ZtCc0xfszj0YAiQwkNq4U9rTo+jFzD
 GQSM2+s2C+MdtzcxcilN4KwtpxQOezqKL6en3A9nwo8B1Y3z3zCijWRuGLGjifBy+j5vD8
 oV2dCVJM0fknzeicdJPJ2vmzqECfPck=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v15 11/19] drm/etnaviv: Add etnaviv_gem_obj_remove() helper
Date: Sun,  8 Sep 2024 17:43:49 +0800
Message-ID: <20240908094357.291862-12-sui.jingfeng@linux.dev>
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

Which is corresonding to the etnaviv_gem_obj_add()

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 39cfece67b90..3732288ff530 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -19,6 +19,8 @@
 static struct lock_class_key etnaviv_shm_lock_class;
 static struct lock_class_key etnaviv_userptr_lock_class;
 
+static void etnaviv_gem_obj_remove(struct drm_gem_object *obj);
+
 static void etnaviv_gem_scatter_map(struct etnaviv_gem_object *etnaviv_obj)
 {
 	struct drm_device *dev = etnaviv_obj->base.dev;
@@ -555,15 +557,12 @@ void etnaviv_gem_free_object(struct drm_gem_object *obj)
 {
 	struct drm_device *drm = obj->dev;
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
-	struct etnaviv_drm_private *priv = obj->dev->dev_private;
 	struct etnaviv_vram_mapping *mapping, *tmp;
 
 	/* object should not be active */
 	drm_WARN_ON(drm, is_active(etnaviv_obj));
 
-	mutex_lock(&priv->gem_lock);
-	list_del(&etnaviv_obj->gem_node);
-	mutex_unlock(&priv->gem_lock);
+	etnaviv_gem_obj_remove(obj);
 
 	list_for_each_entry_safe(mapping, tmp, &etnaviv_obj->vram_list,
 				 obj_node) {
@@ -595,6 +594,16 @@ void etnaviv_gem_obj_add(struct drm_device *dev, struct drm_gem_object *obj)
 	mutex_unlock(&priv->gem_lock);
 }
 
+static void etnaviv_gem_obj_remove(struct drm_gem_object *obj)
+{
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(obj->dev);
+	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
+
+	mutex_lock(&priv->gem_lock);
+	list_del(&etnaviv_obj->gem_node);
+	mutex_unlock(&priv->gem_lock);
+}
+
 static const struct vm_operations_struct vm_ops = {
 	.fault = etnaviv_gem_fault,
 	.open = drm_gem_vm_open,
-- 
2.43.0

