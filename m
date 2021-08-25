Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8980A3F78C3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 17:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA236E32A;
	Wed, 25 Aug 2021 15:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D626E32A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 15:34:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2600:8800:8c06:1000::c8f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E51971F43868;
 Wed, 25 Aug 2021 16:34:05 +0100 (BST)
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/panfrost: Use upper/lower_32_bits helpers
Date: Wed, 25 Aug 2021 11:33:48 -0400
Message-Id: <20210825153348.4980-1-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.30.2
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

Use upper_32_bits/lower_32_bits helpers instead of open-coding them.
This is easier to scan quickly compared to bitwise manipulation, and it
is pleasingly symmetric. I noticed this when debugging lock_region,
which had a particularly "creative" way of writing upper_32_bits.

v2: Use helpers for one more call site and add review tag (Steven).

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org> (v1)
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c     |  8 ++++----
 drivers/gpu/drm/panfrost/panfrost_mmu.c     | 12 ++++++------
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 71a72fb50e6b..763b7abfc88e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -137,8 +137,8 @@ static void panfrost_job_write_affinity(struct panfrost_device *pfdev,
 	 */
 	affinity = pfdev->features.shader_present;
 
-	job_write(pfdev, JS_AFFINITY_NEXT_LO(js), affinity & 0xFFFFFFFF);
-	job_write(pfdev, JS_AFFINITY_NEXT_HI(js), affinity >> 32);
+	job_write(pfdev, JS_AFFINITY_NEXT_LO(js), lower_32_bits(affinity));
+	job_write(pfdev, JS_AFFINITY_NEXT_HI(js), upper_32_bits(affinity));
 }
 
 static u32
@@ -203,8 +203,8 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 
 	cfg = panfrost_mmu_as_get(pfdev, job->file_priv->mmu);
 
-	job_write(pfdev, JS_HEAD_NEXT_LO(js), jc_head & 0xFFFFFFFF);
-	job_write(pfdev, JS_HEAD_NEXT_HI(js), jc_head >> 32);
+	job_write(pfdev, JS_HEAD_NEXT_LO(js), lower_32_bits(jc_head));
+	job_write(pfdev, JS_HEAD_NEXT_HI(js), upper_32_bits(jc_head));
 
 	panfrost_job_write_affinity(pfdev, job->requirements, js);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 0da5b3100ab1..c3fbe0ad9090 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -80,8 +80,8 @@ static void lock_region(struct panfrost_device *pfdev, u32 as_nr,
 	region |= region_width;
 
 	/* Lock the region that needs to be updated */
-	mmu_write(pfdev, AS_LOCKADDR_LO(as_nr), region & 0xFFFFFFFFUL);
-	mmu_write(pfdev, AS_LOCKADDR_HI(as_nr), (region >> 32) & 0xFFFFFFFFUL);
+	mmu_write(pfdev, AS_LOCKADDR_LO(as_nr), lower_32_bits(region));
+	mmu_write(pfdev, AS_LOCKADDR_HI(as_nr), upper_32_bits(region));
 	write_cmd(pfdev, as_nr, AS_COMMAND_LOCK);
 }
 
@@ -123,14 +123,14 @@ static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_m
 
 	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0UL, AS_COMMAND_FLUSH_MEM);
 
-	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), transtab & 0xffffffffUL);
-	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), transtab >> 32);
+	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
+	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
 
 	/* Need to revisit mem attrs.
 	 * NC is the default, Mali driver is inner WT.
 	 */
-	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), memattr & 0xffffffffUL);
-	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), memattr >> 32);
+	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
+	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
 
 	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index 5ab03d605f57..e116a4d9b8e5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -51,8 +51,8 @@ static int panfrost_perfcnt_dump_locked(struct panfrost_device *pfdev)
 
 	reinit_completion(&pfdev->perfcnt->dump_comp);
 	gpuva = pfdev->perfcnt->mapping->mmnode.start << PAGE_SHIFT;
-	gpu_write(pfdev, GPU_PERFCNT_BASE_LO, gpuva);
-	gpu_write(pfdev, GPU_PERFCNT_BASE_HI, gpuva >> 32);
+	gpu_write(pfdev, GPU_PERFCNT_BASE_LO, lower_32_bits(gpuva));
+	gpu_write(pfdev, GPU_PERFCNT_BASE_HI, upper_32_bits(gpuva));
 	gpu_write(pfdev, GPU_INT_CLEAR,
 		  GPU_IRQ_CLEAN_CACHES_COMPLETED |
 		  GPU_IRQ_PERFCNT_SAMPLE_COMPLETED);
-- 
2.30.2

