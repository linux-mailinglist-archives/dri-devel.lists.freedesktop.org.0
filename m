Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B8A3DCEEF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 05:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C456E3AE;
	Mon,  2 Aug 2021 03:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id C6D7A6E3AE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 03:33:20 +0000 (UTC)
Received: from BC-Mail-Ex11.internal.baidu.com (unknown [172.31.51.51])
 by Forcepoint Email with ESMTPS id 6ED06F5B89D841097303;
 Mon,  2 Aug 2021 11:33:15 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex11.internal.baidu.com (172.31.51.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Mon, 2 Aug 2021 11:33:14 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 2 Aug 2021 11:33:14 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <linux-graphics-maintainer@vmware.com>, <zackr@vmware.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] drm/vmwgfx: Make use of PFN_ALIGN/PFN_UP helper macro
Date: Mon, 2 Aug 2021 11:33:08 +0800
Message-ID: <20210802033308.927-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex15.internal.baidu.com (172.31.51.55) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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

it's a refactor to make use of PFN_ALIGN/PFN_UP helper macro

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c       | 5 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c   | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c  | 3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c      | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c      | 5 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c   | 3 +--
 7 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 362f56d5b12b..9e3e1429db94 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -405,7 +405,7 @@ static size_t vmw_bo_acc_size(struct vmw_private *dev_priv, size_t size,
 			      bool user)
 {
 	static size_t struct_size, user_struct_size;
-	size_t num_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	size_t num_pages = PFN_UP(size);
 	size_t page_array_size = ttm_round_pot(num_pages * sizeof(void *));
 
 	if (unlikely(struct_size == 0)) {
@@ -474,7 +474,6 @@ int vmw_bo_create_kernel(struct vmw_private *dev_priv, unsigned long size,
 			 struct ttm_placement *placement,
 			 struct ttm_buffer_object **p_bo)
 {
-	unsigned npages = PAGE_ALIGN(size) >> PAGE_SHIFT;
 	struct ttm_operation_ctx ctx = { false, false };
 	struct ttm_buffer_object *bo;
 	size_t acc_size;
@@ -485,7 +484,7 @@ int vmw_bo_create_kernel(struct vmw_private *dev_priv, unsigned long size,
 		return -ENOMEM;
 
 	acc_size = ttm_round_pot(sizeof(*bo));
-	acc_size += ttm_round_pot(npages * sizeof(void *));
+	acc_size += ttm_round_pot(PFN_UP(size) * sizeof(void *));
 	acc_size += ttm_round_pot(sizeof(struct ttm_tt));
 
 	ret = ttm_mem_global_alloc(&ttm_mem_glob, acc_size, &ctx);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
index 9656d4a2abff..891e58b951a6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
@@ -802,7 +802,7 @@ static int vmw_cmdbuf_alloc_space(struct vmw_cmdbuf_man *man,
 {
 	struct vmw_cmdbuf_alloc_info info;
 
-	info.page_size = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	info.page_size = PFN_UP(size);
 	info.node = node;
 	info.done = false;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
index c84a16c1def0..17a98db00017 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
@@ -607,8 +607,7 @@ struct vmw_resource *vmw_cotable_alloc(struct vmw_private *dev_priv,
 	if (num_entries < co_info[type].min_initial_entries) {
 		vcotbl->res.backup_size = co_info[type].min_initial_entries *
 			co_info[type].size;
-		vcotbl->res.backup_size =
-			(vcotbl->res.backup_size + PAGE_SIZE - 1) & PAGE_MASK;
+		vcotbl->res.backup_size = PFN_ALIGN(vcotbl->res.backup_size);
 	}
 
 	vcotbl->scrubbed = true;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 2ddf4932d62c..9679d2fa40a5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -100,7 +100,7 @@ static int vmw_cursor_update_bo(struct vmw_private *dev_priv,
 	int ret;
 
 	kmap_offset = 0;
-	kmap_num = (width*height*4 + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	kmap_num = PFN_UP(width*height*4);
 
 	ret = ttm_bo_reserve(&bo->base, true, false, NULL);
 	if (unlikely(ret != 0)) {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
index c8e578f63c9c..4d02ae210805 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
@@ -256,8 +256,7 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
 		if (!otables[i].enabled)
 			continue;
 
-		otables[i].size =
-			(otables[i].size + PAGE_SIZE - 1) & PAGE_MASK;
+		otables[i].size = PFN_ALIGN(otables[i].size);
 		bo_size += otables[i].size;
 	}
 
@@ -385,7 +384,7 @@ static unsigned long vmw_mob_calculate_pt_pages(unsigned long data_pages)
 	while (likely(data_size > PAGE_SIZE)) {
 		data_size = DIV_ROUND_UP(data_size, PAGE_SIZE);
 		data_size *= VMW_PPN_SIZE;
-		tot_size += (data_size + PAGE_SIZE - 1) & PAGE_MASK;
+		tot_size += PFN_ALIGN(data_size);
 	}
 
 	return tot_size >> PAGE_SHIFT;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 3b6f6044c325..8d1e869cc196 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -353,8 +353,7 @@ int vmw_user_lookup_handle(struct vmw_private *dev_priv,
 static int vmw_resource_buf_alloc(struct vmw_resource *res,
 				  bool interruptible)
 {
-	unsigned long size =
-		(res->backup_size + PAGE_SIZE - 1) & PAGE_MASK;
+	unsigned long size = PFN_ALIGN(res->backup_size);
 	struct vmw_buffer_object *backup;
 	int ret;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
index b3c8d2da6f1a..b8dd62529104 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
@@ -981,8 +981,7 @@ int vmw_compat_shader_add(struct vmw_private *dev_priv,
 		goto no_reserve;
 
 	/* Map and copy shader bytecode. */
-	ret = ttm_bo_kmap(&buf->base, 0, PAGE_ALIGN(size) >> PAGE_SHIFT,
-			  &map);
+	ret = ttm_bo_kmap(&buf->base, 0, PFN_UP(size), &map);
 	if (unlikely(ret != 0)) {
 		ttm_bo_unreserve(&buf->base);
 		goto no_reserve;
-- 
2.25.1

