Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1136916B5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 03:34:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7F310EC21;
	Fri, 10 Feb 2023 02:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2BB10EC21
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 02:34:43 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id D217B3249FE;
 Fri, 10 Feb 2023 02:34:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1675996481; bh=mP3VWYjiUybqNGjxW7eeY6Sblu/YiIxP3ek7YTREK2w=;
 h=From:To:Cc:Subject:Date:From;
 b=mN33PSBFlaq9JvJhbL9OHr+RvpbpsXSw8wt0MLN0/PCzVg8BPszzom+a2JIFk54J1
 o6qOSkd5tI/pGD5vQPO0WuYAtBEwKqdRdGHdRN9jsIe7f9raWYqPvgjYBOqDaaKQGW
 bHlcXRnDvqJ/A2uC52JWXihQzTCFPBQpEkeZ3oZLTs/+42I6WNFl2wBAVRhqicEv4J
 Hf807tWGtQWHyJrNjqu6SNK4YpDyrHKoY9mj8UW9btJdytg02dMsbHyVeDnbbMYwlG
 0AhFSnuHGIa/GCTrHH8MhVbHUA/QR87pxANYF2Q7fsmwkTA/rKvsa1ZhYJUnTVZKJZ
 oQVGNcBhJtpeA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Make the driver work without the dummy resources
Date: Thu,  9 Feb 2023 21:34:37 -0500
Message-Id: <20230210023437.2214816-1-zack@kde.org>
X-Mailer: git-send-email 2.38.1
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: banackm@vmware.com, krastevm@vmware.com, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 mombasawalam@vmware.com, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

In change 180253782038 ("drm/ttm: stop allocating dummy resources during BO creation")
ttm stopped allocating dummy resources but vmwgfx was never ported to
handle it. Make the driver treat null resources as initial creation and
port code to handle null resources in general.

Fixes kernel oops'es on boot with vmwgfx.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: 180253782038 ("drm/ttm: stop allocating dummy resources during BO creation")
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c   |  3 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 18 ++++++++++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 54e942df3b8e..71eeabf001c8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -837,7 +837,8 @@ void vmw_query_move_notify(struct ttm_buffer_object *bo,
 	mutex_lock(&dev_priv->binding_mutex);
 
 	/* If BO is being moved from MOB to system memory */
-	if (new_mem->mem_type == TTM_PL_SYSTEM &&
+	if (old_mem &&
+	    new_mem->mem_type == TTM_PL_SYSTEM &&
 	    old_mem->mem_type == VMW_PL_MOB) {
 		struct vmw_fence_obj *fence;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 4daebc5b9eb4..af8562c95cc3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -515,9 +515,13 @@ static int vmw_move(struct ttm_buffer_object *bo,
 		    struct ttm_resource *new_mem,
 		    struct ttm_place *hop)
 {
-	struct ttm_resource_manager *old_man = ttm_manager_type(bo->bdev, bo->resource->mem_type);
-	struct ttm_resource_manager *new_man = ttm_manager_type(bo->bdev, new_mem->mem_type);
-	int ret;
+	struct ttm_resource_manager *new_man;
+	struct ttm_resource_manager *old_man = NULL;
+	int ret = 0;
+
+	new_man = ttm_manager_type(bo->bdev, new_mem->mem_type);
+	if (bo->resource)
+		old_man = ttm_manager_type(bo->bdev, bo->resource->mem_type);
 
 	if (new_man->use_tt && !vmw_memtype_is_system(new_mem->mem_type)) {
 		ret = vmw_ttm_bind(bo->bdev, bo->ttm, new_mem);
@@ -525,9 +529,15 @@ static int vmw_move(struct ttm_buffer_object *bo,
 			return ret;
 	}
 
+	if (!bo->resource || (bo->resource->mem_type == TTM_PL_SYSTEM &&
+			      bo->ttm == NULL)) {
+		ttm_bo_move_null(bo, new_mem);
+		return 0;
+	}
+
 	vmw_move_notify(bo, bo->resource, new_mem);
 
-	if (old_man->use_tt && new_man->use_tt) {
+	if (old_man && old_man->use_tt && new_man->use_tt) {
 		if (vmw_memtype_is_system(bo->resource->mem_type)) {
 			ttm_bo_move_null(bo, new_mem);
 			return 0;
-- 
2.38.1

