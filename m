Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9265233E12
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236B86E9CC;
	Fri, 31 Jul 2020 04:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6BD6E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:07:14 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-BEaGIUm1MD2N936KpuPXjQ-1; Fri, 31 Jul 2020 00:07:09 -0400
X-MC-Unique: BEaGIUm1MD2N936KpuPXjQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C11A18839C0;
 Fri, 31 Jul 2020 04:07:08 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1AE01001281;
 Fri, 31 Jul 2020 04:07:06 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 45/49] drm/amdgpu/ttm: remove man->bdev references.
Date: Fri, 31 Jul 2020 14:05:16 +1000
Message-Id: <20200731040520.3701599-46-airlied@gmail.com>
In-Reply-To: <20200731040520.3701599-1-airlied@gmail.com>
References: <20200731040520.3701599-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
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
Cc: christian.koenig@amd.com, sroland@vmware.com, bskeggs@redhat.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Just store the device in the private so the link
can be removed from the manager

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 9d4a13926b8c..d451851c8689 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -34,6 +34,7 @@ struct amdgpu_vram_mgr {
 	spinlock_t lock;
 	atomic64_t usage;
 	atomic64_t vis_usage;
+	struct amdgpu_device *adev;
 };
 
 static inline struct amdgpu_vram_mgr *to_vram_mgr(struct ttm_mem_type_manager *man)
@@ -196,6 +197,8 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 	drm_mm_init(&mgr->mm, 0, man->size);
 	spin_lock_init(&mgr->lock);
 
+	mgr->adev = adev;
+
 	/* Add the two VRAM-related sysfs files */
 	ret = sysfs_create_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
 	if (ret)
@@ -323,8 +326,8 @@ static int amdgpu_vram_mgr_new(struct ttm_mem_type_manager *man,
 			       const struct ttm_place *place,
 			       struct ttm_mem_reg *mem)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(man->bdev);
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
+	struct amdgpu_device *adev = mgr->adev;
 	struct drm_mm *mm = &mgr->mm;
 	struct drm_mm_node *nodes;
 	enum drm_mm_insert_mode mode;
@@ -439,8 +442,8 @@ static int amdgpu_vram_mgr_new(struct ttm_mem_type_manager *man,
 static void amdgpu_vram_mgr_del(struct ttm_mem_type_manager *man,
 				struct ttm_mem_reg *mem)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(man->bdev);
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
+	struct amdgpu_device *adev = mgr->adev;
 	struct drm_mm_node *nodes = mem->mm_node;
 	uint64_t usage = 0, vis_usage = 0;
 	unsigned pages = mem->num_pages;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
