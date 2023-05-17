Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6C77060CE
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 09:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD74A10E3BA;
	Wed, 17 May 2023 07:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id E2F9010E38E;
 Wed, 17 May 2023 02:52:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id D6787180120CAB; 
 Wed, 17 May 2023 10:52:32 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/radeon: Remove unnecessary (void*) conversions
Date: Wed, 17 May 2023 10:52:19 +0800
Message-Id: <20230517025219.50281-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 May 2023 07:08:54 +0000
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
Cc: Su Hui <suhui@nfschina.com>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No need cast (void*) to (struct radeon_device *)
or (struct radeon_ring *).

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/gpu/drm/radeon/r100.c         | 8 ++++----
 drivers/gpu/drm/radeon/r300.c         | 2 +-
 drivers/gpu/drm/radeon/r420.c         | 2 +-
 drivers/gpu/drm/radeon/r600.c         | 2 +-
 drivers/gpu/drm/radeon/radeon_fence.c | 2 +-
 drivers/gpu/drm/radeon/radeon_gem.c   | 2 +-
 drivers/gpu/drm/radeon/radeon_ib.c    | 2 +-
 drivers/gpu/drm/radeon/radeon_pm.c    | 2 +-
 drivers/gpu/drm/radeon/radeon_ring.c  | 2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c   | 2 +-
 drivers/gpu/drm/radeon/rs400.c        | 2 +-
 drivers/gpu/drm/radeon/rv515.c        | 4 ++--
 12 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index d4f09ecc3d22..affa9e0309b2 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -2929,7 +2929,7 @@ static void r100_set_safe_registers(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 static int r100_debugfs_rbbm_info_show(struct seq_file *m, void *unused)
 {
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
+	struct radeon_device *rdev = m->private;
 	uint32_t reg, value;
 	unsigned i;
 
@@ -2948,7 +2948,7 @@ static int r100_debugfs_rbbm_info_show(struct seq_file *m, void *unused)
 
 static int r100_debugfs_cp_ring_info_show(struct seq_file *m, void *unused)
 {
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
+	struct radeon_device *rdev = m->private;
 	struct radeon_ring *ring = &rdev->ring[RADEON_RING_TYPE_GFX_INDEX];
 	uint32_t rdp, wdp;
 	unsigned count, i, j;
@@ -2974,7 +2974,7 @@ static int r100_debugfs_cp_ring_info_show(struct seq_file *m, void *unused)
 
 static int r100_debugfs_cp_csq_fifo_show(struct seq_file *m, void *unused)
 {
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
+	struct radeon_device *rdev = m->private;
 	uint32_t csq_stat, csq2_stat, tmp;
 	unsigned r_rptr, r_wptr, ib1_rptr, ib1_wptr, ib2_rptr, ib2_wptr;
 	unsigned i;
@@ -3022,7 +3022,7 @@ static int r100_debugfs_cp_csq_fifo_show(struct seq_file *m, void *unused)
 
 static int r100_debugfs_mc_info_show(struct seq_file *m, void *unused)
 {
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
+	struct radeon_device *rdev = m->private;
 	uint32_t tmp;
 
 	tmp = RREG32(RADEON_CONFIG_MEMSIZE);
diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r300.c
index 7b0cfeaddcec..9c1a92fa2af6 100644
--- a/drivers/gpu/drm/radeon/r300.c
+++ b/drivers/gpu/drm/radeon/r300.c
@@ -589,7 +589,7 @@ int rv370_get_pcie_lanes(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 static int rv370_debugfs_pcie_gart_info_show(struct seq_file *m, void *unused)
 {
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
+	struct radeon_device *rdev = m->private;
 	uint32_t tmp;
 
 	tmp = RREG32_PCIE(RADEON_PCIE_TX_GART_CNTL);
diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r420.c
index 7e6320e8c6a0..eae8a6389f5e 100644
--- a/drivers/gpu/drm/radeon/r420.c
+++ b/drivers/gpu/drm/radeon/r420.c
@@ -474,7 +474,7 @@ int r420_init(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 static int r420_debugfs_pipes_info_show(struct seq_file *m, void *unused)
 {
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
+	struct radeon_device *rdev = m->private;
 	uint32_t tmp;
 
 	tmp = RREG32(R400_GB_PIPE_SELECT);
diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
index dd78fc499402..382795a8b3c0 100644
--- a/drivers/gpu/drm/radeon/r600.c
+++ b/drivers/gpu/drm/radeon/r600.c
@@ -4345,7 +4345,7 @@ int r600_irq_process(struct radeon_device *rdev)
 
 static int r600_debugfs_mc_info_show(struct seq_file *m, void *unused)
 {
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
+	struct radeon_device *rdev = m->private;
 
 	DREG32_SYS(m, rdev, R_000E50_SRBM_STATUS);
 	DREG32_SYS(m, rdev, VM_L2_STATUS);
diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 73e3117420bf..2749dde5838f 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -955,7 +955,7 @@ void radeon_fence_driver_force_completion(struct radeon_device *rdev, int ring)
 #if defined(CONFIG_DEBUG_FS)
 static int radeon_debugfs_fence_info_show(struct seq_file *m, void *data)
 {
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
+	struct radeon_device *rdev = m->private;
 	int i, j;
 
 	for (i = 0; i < RADEON_NUM_RINGS; ++i) {
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index bdc5af23f005..5de99ffa072f 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -879,7 +879,7 @@ int radeon_mode_dumb_create(struct drm_file *file_priv,
 #if defined(CONFIG_DEBUG_FS)
 static int radeon_debugfs_gem_info_show(struct seq_file *m, void *unused)
 {
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
+	struct radeon_device *rdev = m->private;
 	struct radeon_bo *rbo;
 	unsigned i = 0;
 
diff --git a/drivers/gpu/drm/radeon/radeon_ib.c b/drivers/gpu/drm/radeon/radeon_ib.c
index 6a45a72488f9..fb9ecf5dbe2b 100644
--- a/drivers/gpu/drm/radeon/radeon_ib.c
+++ b/drivers/gpu/drm/radeon/radeon_ib.c
@@ -292,7 +292,7 @@ int radeon_ib_ring_tests(struct radeon_device *rdev)
 
 static int radeon_debugfs_sa_info_show(struct seq_file *m, void *unused)
 {
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
+	struct radeon_device *rdev = m->private;
 
 	radeon_sa_bo_dump_debug_info(&rdev->ring_tmp_bo, m);
 
diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index cbc554928bcc..b73fd9ab0252 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -1916,7 +1916,7 @@ static void radeon_dynpm_idle_work_handler(struct work_struct *work)
 
 static int radeon_debugfs_pm_info_show(struct seq_file *m, void *unused)
 {
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
+	struct radeon_device *rdev = m->private;
 	struct drm_device *ddev = rdev->ddev;
 
 	if  ((rdev->flags & RADEON_IS_PX) &&
diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/radeon/radeon_ring.c
index 7e207276df37..e6534fa9f1fb 100644
--- a/drivers/gpu/drm/radeon/radeon_ring.c
+++ b/drivers/gpu/drm/radeon/radeon_ring.c
@@ -464,7 +464,7 @@ void radeon_ring_fini(struct radeon_device *rdev, struct radeon_ring *ring)
 
 static int radeon_debugfs_ring_info_show(struct seq_file *m, void *unused)
 {
-	struct radeon_ring *ring = (struct radeon_ring *) m->private;
+	struct radeon_ring *ring = m->private;
 	struct radeon_device *rdev = ring->rdev;
 
 	uint32_t rptr, wptr, rptr_next;
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 2220cdf6a3f6..06a53ecc04a2 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -780,7 +780,7 @@ void radeon_ttm_set_active_vram_size(struct radeon_device *rdev, u64 size)
 
 static int radeon_ttm_page_pool_show(struct seq_file *m, void *data)
 {
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
+	struct radeon_device *rdev = m->private;
 
 	return ttm_pool_debugfs(&rdev->mman.bdev.pool, m);
 }
diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/rs400.c
index 6383f7a34bd8..922a29e58880 100644
--- a/drivers/gpu/drm/radeon/rs400.c
+++ b/drivers/gpu/drm/radeon/rs400.c
@@ -307,7 +307,7 @@ void rs400_mc_wreg(struct radeon_device *rdev, uint32_t reg, uint32_t v)
 #if defined(CONFIG_DEBUG_FS)
 static int rs400_debugfs_gart_info_show(struct seq_file *m, void *unused)
 {
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
+	struct radeon_device *rdev = m->private;
 	uint32_t tmp;
 
 	tmp = RREG32(RADEON_HOST_PATH_CNTL);
diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv515.c
index 63fb06e8e2d7..76260fdfbaa7 100644
--- a/drivers/gpu/drm/radeon/rv515.c
+++ b/drivers/gpu/drm/radeon/rv515.c
@@ -221,7 +221,7 @@ void rv515_mc_wreg(struct radeon_device *rdev, uint32_t reg, uint32_t v)
 #if defined(CONFIG_DEBUG_FS)
 static int rv515_debugfs_pipes_info_show(struct seq_file *m, void *unused)
 {
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
+	struct radeon_device *rdev = m->private;
 	uint32_t tmp;
 
 	tmp = RREG32(GB_PIPE_SELECT);
@@ -237,7 +237,7 @@ static int rv515_debugfs_pipes_info_show(struct seq_file *m, void *unused)
 
 static int rv515_debugfs_ga_info_show(struct seq_file *m, void *unused)
 {
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
+	struct radeon_device *rdev = m->private;
 	uint32_t tmp;
 
 	tmp = RREG32(0x2140);
-- 
2.30.2

