Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF853F66C5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 19:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DA56E08A;
	Tue, 24 Aug 2021 17:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6749B6E08A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 17:27:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2600:8800:8c06:1000::c8f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 748DA1F426FC;
 Tue, 24 Aug 2021 18:27:06 +0100 (BST)
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panfrost: Use upper/lower_32_bits helpers
Date: Tue, 24 Aug 2021 13:26:14 -0400
Message-Id: <20210824172614.7299-1-alyssa.rosenzweig@collabora.com>
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

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c |  8 ++++----
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

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
-- 
2.30.2

