Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37380AB605F
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 03:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A8210E17F;
	Wed, 14 May 2025 01:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="WgGedhVm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE9810E17F;
 Wed, 14 May 2025 01:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=1hs0q+mYysLcaiUGDRGU9TTWH9u5sOR249xe+14mUYE=; b=WgGedhVmEtnihbug
 SFvkbuRhV8goYYF6lKHH2iKLLNc8rG4SVCmXVxAWsML0+B9VAbNCQ+ToGlPa+bFCPDv5gLjq65LTL
 wdEjOe6Ih+peKUx/B3FBq5j1yYptpGsrpGL3Fccnlq+FhVTpcj+K+pHpt1g7r+qphZQ3Bjz9c7cd2
 lxCpD8+tFTksaAJFpsW51xhj0jAaGraa9BYTtT/5xVItG+6TXZC9Tu7vVz+d5tosp6h83Fu9NVfhm
 7Y3FxO6XaXXZu929fpm1eHeKo2l7q5TbbL0wFgM5cGU143FyYKYWVODs95f1H4ZaYb6RY1TpeSYld
 aAPQZz4AiVKysSYc4w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1uF0jD-003Oxd-2I;
 Wed, 14 May 2025 01:16:11 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, christophe.jaillet@wanadoo.fr,
 christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/radeon/cik: Clean up doorbells
Date: Wed, 14 May 2025 02:16:10 +0100
Message-ID: <20250514011610.136607-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Free doorbells in the error paths of cik_init and in cik_fini.

Build tested only.

Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
RFC->v1
  Renamed ringCP[12]->ring_cp[12]
  Cleaned up doorbells in cik_startup failure case

 drivers/gpu/drm/radeon/cik.c | 42 +++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 11a492f21157..51a3e0fc2f56 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -8548,7 +8548,7 @@ int cik_suspend(struct radeon_device *rdev)
  */
 int cik_init(struct radeon_device *rdev)
 {
-	struct radeon_ring *ring;
+	struct radeon_ring *ring, *ring_cp1, *ring_cp2;
 	int r;
 
 	/* Read BIOS */
@@ -8623,19 +8623,22 @@ int cik_init(struct radeon_device *rdev)
 	ring->ring_obj = NULL;
 	r600_ring_init(rdev, ring, 1024 * 1024);
 
-	ring = &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
-	ring->ring_obj = NULL;
-	r600_ring_init(rdev, ring, 1024 * 1024);
-	r = radeon_doorbell_get(rdev, &ring->doorbell_index);
+	ring_cp1 = &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
+	ring_cp2 = &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
+	ring_cp1->ring_obj = NULL;
+	ring_cp2->ring_obj = NULL;
+	ring_cp1->doorbell_index = RADEON_MAX_DOORBELLS;
+	ring_cp2->doorbell_index = RADEON_MAX_DOORBELLS;
+
+	r600_ring_init(rdev, ring_cp1, 1024 * 1024);
+	r = radeon_doorbell_get(rdev, &ring_cp1->doorbell_index);
 	if (r)
 		return r;
 
-	ring = &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
-	ring->ring_obj = NULL;
-	r600_ring_init(rdev, ring, 1024 * 1024);
-	r = radeon_doorbell_get(rdev, &ring->doorbell_index);
+	r600_ring_init(rdev, ring_cp2, 1024 * 1024);
+	r = radeon_doorbell_get(rdev, &ring_cp2->doorbell_index);
 	if (r)
-		return r;
+		goto out;
 
 	ring = &rdev->ring[R600_RING_TYPE_DMA_INDEX];
 	ring->ring_obj = NULL;
@@ -8653,12 +8656,16 @@ int cik_init(struct radeon_device *rdev)
 
 	r = r600_pcie_gart_init(rdev);
 	if (r)
-		return r;
+		goto out;
 
 	rdev->accel_working = true;
 	r = cik_startup(rdev);
 	if (r) {
 		dev_err(rdev->dev, "disabling GPU acceleration\n");
+		radeon_doorbell_free(rdev, ring_cp1->doorbell_index);
+		radeon_doorbell_free(rdev, ring_cp2->doorbell_index);
+		ring_cp1->doorbell_index = RADEON_MAX_DOORBELLS;
+		ring_cp2->doorbell_index = RADEON_MAX_DOORBELLS;
 		cik_cp_fini(rdev);
 		cik_sdma_fini(rdev);
 		cik_irq_fini(rdev);
@@ -8678,10 +8685,16 @@ int cik_init(struct radeon_device *rdev)
 	 */
 	if (!rdev->mc_fw && !(rdev->flags & RADEON_IS_IGP)) {
 		DRM_ERROR("radeon: MC ucode required for NI+.\n");
-		return -EINVAL;
+		r = -EINVAL;
+		goto out;
 	}
 
 	return 0;
+
+out:
+	radeon_doorbell_free(rdev, ring_cp1->doorbell_index);
+	radeon_doorbell_free(rdev, ring_cp2->doorbell_index);
+	return r;
 }
 
 /**
@@ -8695,6 +8708,7 @@ int cik_init(struct radeon_device *rdev)
  */
 void cik_fini(struct radeon_device *rdev)
 {
+	struct radeon_ring *ring;
 	radeon_pm_fini(rdev);
 	cik_cp_fini(rdev);
 	cik_sdma_fini(rdev);
@@ -8708,6 +8722,10 @@ void cik_fini(struct radeon_device *rdev)
 	radeon_ib_pool_fini(rdev);
 	radeon_irq_kms_fini(rdev);
 	uvd_v1_0_fini(rdev);
+	ring = &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
+	radeon_doorbell_free(rdev, ring->doorbell_index);
+	ring = &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
+	radeon_doorbell_free(rdev, ring->doorbell_index);
 	radeon_uvd_fini(rdev);
 	radeon_vce_fini(rdev);
 	cik_pcie_gart_fini(rdev);
-- 
2.49.0

