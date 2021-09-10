Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3A406CBF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 15:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243366E9F7;
	Fri, 10 Sep 2021 13:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F0D6E9F7;
 Fri, 10 Sep 2021 13:15:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="284777475"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="284777475"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 06:15:44 -0700
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="467107526"
Received: from gjanssen-mobl5.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.69])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 06:15:42 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.william.auld@gmail.com>,
 =?UTF-8?q?K=C3=B6nig=20Christian?= <Christian.Koenig@amd.com>
Subject: [RFC PATCH] drm/ttm: Add a private member to the struct ttm_resource
Date: Fri, 10 Sep 2021 15:15:12 +0200
Message-Id: <20210910131512.161655-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Both the provider (resource manager) and the consumer (the TTM driver)
want to subclass struct ttm_resource. Since this is left for the resource
manager, we need to provide a private pointer for the TTM driver.

Provide a struct ttm_resource_private for the driver to subclass for
data with the same lifetime as the struct ttm_resource: In the i915 case
it will, for example, be an sg-table and radix tree into the LMEM
/VRAM pages that currently are awkwardly attached to the GEM object.

Provide an ops structure for associated ops (Which is only destroy() ATM)
It might seem pointless to provide a separate ops structure, but Linus
has previously made it clear that that's the norm.

After careful audit one could perhaps also on a per-driver basis
replace the delete_mem_notify() TTM driver callback with the above
destroy function.

Cc: Matthew Auld <matthew.william.auld@gmail.com>
Cc: König Christian <Christian.Koenig@amd.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 10 +++++++---
 include/drm/ttm/ttm_resource.h     | 28 ++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 2431717376e7..973e7c50bfed 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -57,13 +57,17 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 {
 	struct ttm_resource_manager *man;
+	struct ttm_resource *resource = *res;
 
-	if (!*res)
+	if (!resource)
 		return;
 
-	man = ttm_manager_type(bo->bdev, (*res)->mem_type);
-	man->func->free(man, *res);
 	*res = NULL;
+	if (resource->priv)
+		resource->priv->ops.destroy(resource->priv);
+
+	man = ttm_manager_type(bo->bdev, resource->mem_type);
+	man->func->free(man, resource);
 }
 EXPORT_SYMBOL(ttm_resource_free);
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 140b6b9a8bbe..5a22c9a29c05 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -44,6 +44,7 @@ struct dma_buf_map;
 struct io_mapping;
 struct sg_table;
 struct scatterlist;
+struct ttm_resource_private;
 
 struct ttm_resource_manager_func {
 	/**
@@ -153,6 +154,32 @@ struct ttm_bus_placement {
 	enum ttm_caching	caching;
 };
 
+/**
+ * struct ttm_resource_private_ops - Operations for a struct
+ * ttm_resource_private
+ *
+ * Not much benefit to keep this as a separate struct with only a single member,
+ * but keeping a separate ops struct is the norm.
+ */
+struct ttm_resource_private_ops {
+	/**
+	 * destroy() - Callback to destroy the private data
+	 * @priv - The private data to destroy
+	 */
+	void (*destroy) (struct ttm_resource_private *priv);
+};
+
+/**
+ * struct ttm_resource_private - TTM driver private data
+ * @ops: Pointer to struct ttm_resource_private_ops with associated operations
+ *
+ * Intended to be subclassed to hold, for example cached data sharing the
+ * lifetime with a struct ttm_resource.
+ */
+struct ttm_resource_private {
+	const struct ttm_resource_private_ops ops;
+};
+
 /**
  * struct ttm_resource
  *
@@ -171,6 +198,7 @@ struct ttm_resource {
 	uint32_t mem_type;
 	uint32_t placement;
 	struct ttm_bus_placement bus;
+	struct ttm_resource_private *priv;
 };
 
 /**
-- 
2.31.1

