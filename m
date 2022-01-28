Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B67349F544
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 09:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A5D11238D;
	Fri, 28 Jan 2022 08:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D35E112384;
 Fri, 28 Jan 2022 08:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643358979; x=1674894979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b15acj+uHWWCYpHpGA5nBcqe/eFWW77eP9hdQINtzKY=;
 b=iwQKTMSRe3i9Wi3W0a1b02JOzxv1QGXd19cK41nsP1olPRsSHvpQIGMZ
 FuGq7KQAdFlAJGiEMq38KVZeXl+D78V6p7NN9OMUGZdHD39byj5mo+nei
 /yioK9Utx0Aq8AMETIA0sHhF3XVBVKv+tIn8VHGlx03MDFPpHTv75pbMH
 htAO2ENyyzVz6X7ZWNrRCmyS6wKWZMEgJEuYCof4y8wbnALT++K1203KI
 5YwE0mFuOgm9PiYOr3uk/WzuC5dx7ehtwKxRreE4Jr8xy6hO1PQvGWNRq
 /4ZwOL34KkYZyFXdtX9dfuSsfR4Uxj8DdCJ29iZGraoxCcLky5RDRDruh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="247025194"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="247025194"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="581788745"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/14] drm/i915: Replace dma-buf-map with iosys-map
Date: Fri, 28 Jan 2022 00:36:19 -0800
Message-Id: <20220128083626.3012259-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128083626.3012259-1-lucas.demarchi@intel.com>
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, christian.koenig@amd.com,
 srinivas.kandagatla@linaro.org, tzimmermann@suse.de,
 gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

iosys-map is the new name for dma-buf-map and will gain new
capabitilities. Replace with the new API in i915.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c           | 8 +++++---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 6 +++---
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c     | 6 +++---
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 1b526039a60d..14fdb0796c52 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -74,7 +74,8 @@ static void i915_gem_unmap_dma_buf(struct dma_buf_attachment *attachment,
 	kfree(sg);
 }
 
-static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
+static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf,
+				struct iosys_map *map)
 {
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
 	void *vaddr;
@@ -83,12 +84,13 @@ static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 
-	dma_buf_map_set_vaddr(map, vaddr);
+	iosys_map_set_vaddr(map, vaddr);
 
 	return 0;
 }
 
-static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
+static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf,
+				   struct iosys_map *map)
 {
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 3cc74b0fed06..b071a58dd6da 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -266,7 +266,7 @@ static int igt_dmabuf_import(void *arg)
 	struct drm_i915_gem_object *obj;
 	struct dma_buf *dmabuf;
 	void *obj_map, *dma_map;
-	struct dma_buf_map map;
+	struct iosys_map map;
 	u32 pattern[] = { 0, 0xaa, 0xcc, 0x55, 0xff };
 	int err, i;
 
@@ -349,7 +349,7 @@ static int igt_dmabuf_import_ownership(void *arg)
 	struct drm_i915_private *i915 = arg;
 	struct drm_i915_gem_object *obj;
 	struct dma_buf *dmabuf;
-	struct dma_buf_map map;
+	struct iosys_map map;
 	void *ptr;
 	int err;
 
@@ -400,7 +400,7 @@ static int igt_dmabuf_export_vmap(void *arg)
 	struct drm_i915_private *i915 = arg;
 	struct drm_i915_gem_object *obj;
 	struct dma_buf *dmabuf;
-	struct dma_buf_map map;
+	struct iosys_map map;
 	void *ptr;
 	int err;
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
index 2855d11c7a51..b2a5882b8f81 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
@@ -61,7 +61,7 @@ static void mock_dmabuf_release(struct dma_buf *dma_buf)
 	kfree(mock);
 }
 
-static int mock_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
+static int mock_dmabuf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
 {
 	struct mock_dmabuf *mock = to_mock(dma_buf);
 	void *vaddr;
@@ -69,12 +69,12 @@ static int mock_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
 	vaddr = vm_map_ram(mock->pages, mock->npages, 0);
 	if (!vaddr)
 		return -ENOMEM;
-	dma_buf_map_set_vaddr(map, vaddr);
+	iosys_map_set_vaddr(map, vaddr);
 
 	return 0;
 }
 
-static void mock_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
+static void mock_dmabuf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
 {
 	struct mock_dmabuf *mock = to_mock(dma_buf);
 
-- 
2.35.0

