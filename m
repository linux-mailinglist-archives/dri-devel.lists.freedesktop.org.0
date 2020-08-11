Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2254824178B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 09:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2536E14D;
	Tue, 11 Aug 2020 07:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510206E14D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 07:47:06 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-dUVtm65RPsSQzVsJsgetnw-1; Tue, 11 Aug 2020 03:47:01 -0400
X-MC-Unique: dUVtm65RPsSQzVsJsgetnw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4660102C7F5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 07:47:00 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-101.bne.redhat.com
 [10.64.54.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42CD48A16F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 07:47:00 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: init mem->bus in common code.
Date: Tue, 11 Aug 2020 17:46:57 +1000
Message-Id: <20200811074658.58309-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

The drivers all do the same thing here.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 6 ------
 drivers/gpu/drm/drm_gem_vram_helper.c      | 6 ------
 drivers/gpu/drm/nouveau/nouveau_bo.c       | 6 ------
 drivers/gpu/drm/qxl/qxl_ttm.c              | 6 ------
 drivers/gpu/drm/radeon/radeon_ttm.c        | 6 ------
 drivers/gpu/drm/ttm/ttm_bo_util.c          | 5 +++++
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 6 ------
 7 files changed, 5 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 67d2eef2f9eb..324abf7a3cba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -751,12 +751,6 @@ static int amdgpu_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_reso
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct drm_mm_node *mm_node = mem->mm_node;
 
-	mem->bus.addr = NULL;
-	mem->bus.offset = 0;
-	mem->bus.size = mem->num_pages << PAGE_SHIFT;
-	mem->bus.base = 0;
-	mem->bus.is_iomem = false;
-
 	switch (mem->mem_type) {
 	case TTM_PL_SYSTEM:
 		/* system memory */
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index b410930d94a0..545a877406f4 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1038,14 +1038,8 @@ static int bo_driver_io_mem_reserve(struct ttm_bo_device *bdev,
 {
 	struct drm_vram_mm *vmm = drm_vram_mm_of_bdev(bdev);
 
-	mem->bus.addr = NULL;
-	mem->bus.size = mem->num_pages << PAGE_SHIFT;
-
 	switch (mem->mem_type) {
 	case TTM_PL_SYSTEM:	/* nothing to do */
-		mem->bus.offset = 0;
-		mem->bus.base = 0;
-		mem->bus.is_iomem = false;
 		break;
 	case TTM_PL_VRAM:
 		mem->bus.offset = mem->start << PAGE_SHIFT;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 604a74323696..7cfe3898ce62 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1380,12 +1380,6 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resource *reg)
 	struct nvkm_device *device = nvxx_device(&drm->client.device);
 	struct nouveau_mem *mem = nouveau_mem(reg);
 
-	reg->bus.addr = NULL;
-	reg->bus.offset = 0;
-	reg->bus.size = reg->num_pages << PAGE_SHIFT;
-	reg->bus.base = 0;
-	reg->bus.is_iomem = false;
-
 	switch (reg->mem_type) {
 	case TTM_PL_SYSTEM:
 		/* System memory */
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index b1ea984f143a..c55ac31f5476 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -75,12 +75,6 @@ int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
 {
 	struct qxl_device *qdev = qxl_get_qdev(bdev);
 
-	mem->bus.addr = NULL;
-	mem->bus.offset = 0;
-	mem->bus.size = mem->num_pages << PAGE_SHIFT;
-	mem->bus.base = 0;
-	mem->bus.is_iomem = false;
-
 	switch (mem->mem_type) {
 	case TTM_PL_SYSTEM:
 		/* system memory */
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 3355b69b13d1..1f1e025b9f06 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -380,12 +380,6 @@ static int radeon_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_reso
 {
 	struct radeon_device *rdev = radeon_get_rdev(bdev);
 
-	mem->bus.addr = NULL;
-	mem->bus.offset = 0;
-	mem->bus.size = mem->num_pages << PAGE_SHIFT;
-	mem->bus.base = 0;
-	mem->bus.is_iomem = false;
-
 	switch (mem->mem_type) {
 	case TTM_PL_SYSTEM:
 		/* system memory */
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 496158acd5b9..023f0a2d07c9 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -138,6 +138,11 @@ int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
 	if (!bdev->driver->io_mem_reserve)
 		return 0;
 
+	mem->bus.addr = NULL;
+	mem->bus.offset = 0;
+	mem->bus.size = mem->num_pages << PAGE_SHIFT;
+	mem->bus.base = 0;
+	mem->bus.is_iomem = false;
 retry:
 	ret = bdev->driver->io_mem_reserve(bdev, mem);
 	if (ret == -ENOSPC) {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 69e7e7fe2a4c..6ae4a856241b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -717,12 +717,6 @@ static int vmw_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resourc
 {
 	struct vmw_private *dev_priv = container_of(bdev, struct vmw_private, bdev);
 
-	mem->bus.addr = NULL;
-	mem->bus.is_iomem = false;
-	mem->bus.offset = 0;
-	mem->bus.size = mem->num_pages << PAGE_SHIFT;
-	mem->bus.base = 0;
-
 	switch (mem->mem_type) {
 	case TTM_PL_SYSTEM:
 	case VMW_PL_GMR:
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
