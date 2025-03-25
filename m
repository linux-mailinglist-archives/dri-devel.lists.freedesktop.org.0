Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C99A70220
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 14:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF5010E54E;
	Tue, 25 Mar 2025 13:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cv0/vc5P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F101410E54E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 13:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742909874; x=1774445874;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oOx2F8wL6aJ7sZGHoU5L4dDb+FPagIMbgRl0V7Qt+/I=;
 b=cv0/vc5PgspbTV8MkVCTl54WEBxyr965S1IdZtCT5K2iZD3CjMGf2WF2
 yDrqdWx1lQu0mTS+o4iDScaSuX62apWaPlQdFUoqY2/dLanjISSsZa9DG
 3Vg9HBtjz/dfWZMCZFYrDwC6cNjsDnXVz8+SrFVvS/IDtYP1e4PFOvTvt
 f/O4m7wW9Ng3FI0Bt6offkyJuLqsDmO0qo4yrjA94kJMQBHoJZ02kQLsE
 i9eqEGG51V1SzA7HWyBEmWxfAzAkOYqeRgjYHz9k2sRaZT3hpe8MzmETD
 NCCrPyJNouqvBW9i+Ww/Pr617ei6hzcx/wthr4qasvWabHJ+gCrgmOId6 w==;
X-CSE-ConnectionGUID: 9Dj8PBj0Tm25qgikyf2ZMQ==
X-CSE-MsgGUID: k5sde0cnQD6F6naJRU56Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54359168"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="54359168"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 06:37:53 -0700
X-CSE-ConnectionGUID: aRLZYCQDSheS91Ij0HWC0Q==
X-CSE-MsgGUID: cqpyAai9SiCqzt5SX9j9MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="129049296"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 06:37:51 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com, sumit.semwal@linaro.org, simona@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH] drm/gem-shmem: Optimize DMA mapping for exported buffers
Date: Tue, 25 Mar 2025 14:37:44 +0100
Message-ID: <20250325133744.23805-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
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

Use DMA_ATTR_SKIP_CPU_SYNC flag for exported buffers during DMA mapping.
The same flag is already used by drm_gem_map_dma_buf() for imported
buffers.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c |  8 ++++++--
 include/drm/drm_gem.h                  | 12 ++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d99dee67353a1..8938d8e3de52f 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -699,7 +699,7 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
 static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
-	int ret;
+	int ret, flags = 0;
 	struct sg_table *sgt;
 
 	if (shmem->sgt)
@@ -716,8 +716,12 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 		ret = PTR_ERR(sgt);
 		goto err_put_pages;
 	}
+
+	if (drm_gem_is_exported())
+		flags |= DMA_ATTR_SKIP_CPU_SYNC;
+
 	/* Map the pages for use by the h/w. */
-	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, flags);
 	if (ret)
 		goto err_free_sgt;
 
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 2bf893eabb4b2..7c355a44d0a49 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -589,6 +589,18 @@ static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
 	return obj->dma_buf && (obj->dma_buf->priv != obj);
 }
 
+/**
+ * drm_gem_is_exported() - Tests if GEM object's buffer has been exported
+ * @obj: the GEM object
+ *
+ * Returns:
+ * True if the GEM object's buffer has been exported, false otherwise
+ */
+static inline bool drm_gem_is_exported(const struct drm_gem_object *obj)
+{
+	return obj->dma_buf && (obj->dma_buf->priv == obj);
+}
+
 #ifdef CONFIG_LOCKDEP
 /**
  * drm_gem_gpuva_set_lock() - Set the lock protecting accesses to the gpuva list.
-- 
2.45.1
