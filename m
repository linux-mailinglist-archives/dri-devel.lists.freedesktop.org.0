Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193BB3AD83E
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 08:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D8B6EA58;
	Sat, 19 Jun 2021 06:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17639.qiye.163.com (mail-m17639.qiye.163.com
 [59.111.176.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1BB6E986;
 Sat, 19 Jun 2021 06:44:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=R2dNk1rrkFoGM0rzgQCmDRFd/ghDx7RYqTD5j4OZuHHQhHiMzYwBPGeZzOAQgzTcLhVevhi/9FWHez6bWETR8A0oBBW7ch4uFz6h2e9Gr1RfnPgGMFswvzCdk07B7MI22am+tER0qmpiZwqKoeBLgccDDh6wRZkd54MHC+K3Cr4=;
 s=default; c=relaxed/relaxed; d=vivo.com; v=1;
 bh=R3Mq36iQdtIRQdTLknDvr1cY+j/9JBQbrYRIXuL3DNo=;
 h=date:mime-version:subject:message-id:from;
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m17639.qiye.163.com (Hmail) with ESMTPA id 94597380113;
 Sat, 19 Jun 2021 14:44:10 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] drm/radeon: remove meaningless if(r) check code
Date: Fri, 18 Jun 2021 23:43:46 -0700
Message-Id: <20210619064349.26676-3-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210619064349.26676-1-bernard@vivo.com>
References: <20210619064349.26676-1-bernard@vivo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQk5OSFZITRlLTRoZTEJPS0lVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NzI6Qgw5GT8SEUJWQhUVTS45
 EzpPCzlVSlVKTUlPS0NOS05KS0tIVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFPSkJMNwY+
X-HM-Tid: 0a7a2303355dd994kuws94597380113
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
Cc: Bernard Zhao <bernard@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Function radeon_fence_driver_init always returns success,
remove meaningless if(r) check code.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/radeon/r100.c | 4 +---
 drivers/gpu/drm/radeon/r300.c | 4 +---
 drivers/gpu/drm/radeon/r420.c | 5 +----
 drivers/gpu/drm/radeon/r520.c | 4 +---
 drivers/gpu/drm/radeon/r600.c | 4 +---
 5 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index fcfcaec25a9e..aa6800b0e198 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -4056,9 +4056,7 @@ int r100_init(struct radeon_device *rdev)
 	/* initialize VRAM */
 	r100_mc_init(rdev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 	/* Memory manager */
 	r = radeon_bo_init(rdev);
 	if (r)
diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r300.c
index 92643dfdd8a8..621ff174dff3 100644
--- a/drivers/gpu/drm/radeon/r300.c
+++ b/drivers/gpu/drm/radeon/r300.c
@@ -1549,9 +1549,7 @@ int r300_init(struct radeon_device *rdev)
 	/* initialize memory controller */
 	r300_mc_init(rdev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 	/* Memory manager */
 	r = radeon_bo_init(rdev);
 	if (r)
diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r420.c
index 1ed4407b91aa..7e6320e8c6a0 100644
--- a/drivers/gpu/drm/radeon/r420.c
+++ b/drivers/gpu/drm/radeon/r420.c
@@ -425,10 +425,7 @@ int r420_init(struct radeon_device *rdev)
 	r300_mc_init(rdev);
 	r420_debugfs(rdev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r) {
-		return r;
-	}
+	radeon_fence_driver_init(rdev);
 	/* Memory manager */
 	r = radeon_bo_init(rdev);
 	if (r) {
diff --git a/drivers/gpu/drm/radeon/r520.c b/drivers/gpu/drm/radeon/r520.c
index fc78e64ae727..6cbcaa845192 100644
--- a/drivers/gpu/drm/radeon/r520.c
+++ b/drivers/gpu/drm/radeon/r520.c
@@ -299,9 +299,7 @@ int r520_init(struct radeon_device *rdev)
 	r520_mc_init(rdev);
 	rv515_debugfs(rdev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 	/* Memory manager */
 	r = radeon_bo_init(rdev);
 	if (r)
diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
index 7444dc0e0c0e..ca3fcae2adb5 100644
--- a/drivers/gpu/drm/radeon/r600.c
+++ b/drivers/gpu/drm/radeon/r600.c
@@ -3282,9 +3282,7 @@ int r600_init(struct radeon_device *rdev)
 	/* Initialize clocks */
 	radeon_get_clock_info(rdev->ddev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 	if (rdev->flags & RADEON_IS_AGP) {
 		r = radeon_agp_init(rdev);
 		if (r)
-- 
2.31.0

