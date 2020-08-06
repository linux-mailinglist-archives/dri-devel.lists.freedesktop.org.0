Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC4323E466
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 01:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC3C6E932;
	Thu,  6 Aug 2020 23:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695376E932
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 23:35:16 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-sD2CH5w1MrSNxQNChdC8Iw-1; Thu, 06 Aug 2020 19:35:11 -0400
X-MC-Unique: sD2CH5w1MrSNxQNChdC8Iw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89A2118C63D7;
 Thu,  6 Aug 2020 23:35:10 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-227.bne.redhat.com
 [10.64.54.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C66385F9DC;
 Thu,  6 Aug 2020 23:35:06 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/amdgpu/ttm: drop the adev link from vram mgr
Date: Fri,  7 Aug 2020 09:34:57 +1000
Message-Id: <20200806233459.4057784-3-airlied@gmail.com>
In-Reply-To: <20200806233459.4057784-1-airlied@gmail.com>
References: <20200806233459.4057784-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: bskeggs@redhat.com, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

There is no need for that now since it's embedded.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 11 +++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 168294be276d..4a6d92f27b6e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -47,7 +47,6 @@ struct amdgpu_vram_mgr {
 	spinlock_t lock;
 	atomic64_t usage;
 	atomic64_t vis_usage;
-	struct amdgpu_device *adev;
 };
 
 struct amdgpu_gtt_mgr {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index a41a8abc9927..7882efd275d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -33,6 +33,11 @@ static inline struct amdgpu_vram_mgr *to_vram_mgr(struct ttm_resource_manager *m
 	return container_of(man, struct amdgpu_vram_mgr, manager);
 }
 
+static inline struct amdgpu_device *to_amdgpu_device(struct amdgpu_vram_mgr *mgr)
+{
+	return container_of(mgr, struct amdgpu_device, mman.vram_mgr);
+}
+
 /**
  * DOC: mem_info_vram_total
  *
@@ -182,8 +187,6 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 	drm_mm_init(&mgr->mm, 0, man->size);
 	spin_lock_init(&mgr->lock);
 
-	mgr->adev = adev;
-
 	/* Add the two VRAM-related sysfs files */
 	ret = sysfs_create_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
 	if (ret)
@@ -311,7 +314,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 			       struct ttm_resource *mem)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
-	struct amdgpu_device *adev = mgr->adev;
+	struct amdgpu_device *adev = to_amdgpu_device(mgr);
 	struct drm_mm *mm = &mgr->mm;
 	struct drm_mm_node *nodes;
 	enum drm_mm_insert_mode mode;
@@ -429,7 +432,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 				struct ttm_resource *mem)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
-	struct amdgpu_device *adev = mgr->adev;
+	struct amdgpu_device *adev = to_amdgpu_device(mgr);
 	struct drm_mm_node *nodes = mem->mm_node;
 	uint64_t usage = 0, vis_usage = 0;
 	unsigned pages = mem->num_pages;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
