Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 878C947ED26
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 09:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A402210E415;
	Fri, 24 Dec 2021 08:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5475D10E316
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 11:12:39 +0000 (UTC)
Received: by air.basealt.ru (Postfix, from userid 490)
 id 5483958982A; Thu, 23 Dec 2021 11:07:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
 sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.1
Received: from asheplyakov-rocket.smb.basealt.ru (unknown [193.43.9.4])
 by air.basealt.ru (Postfix) with ESMTPSA id BE868589548;
 Thu, 23 Dec 2021 11:07:01 +0000 (UTC)
From: asheplyakov@basealt.ru
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/panfrost: adjusted job affinity for dual core group
 GPUs
Date: Thu, 23 Dec 2021 15:06:16 +0400
Message-Id: <20211223110616.2589851-3-asheplyakov@basealt.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211223110616.2589851-1-asheplyakov@basealt.ru>
References: <20211223110616.2589851-1-asheplyakov@basealt.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Dec 2021 08:28:15 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "Vadim V . Vlasov" <vadim.vlasov@elpitech.ru>,
 Steven Price <steven.price@arm.com>,
 Alexey Sheplyakov <asheplyakov@basealt.ru>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexey Sheplyakov <asheplyakov@basealt.ru>

On a dual core group GPU it's not OK to run some jobs on any core.
For such jobs the following affinity rule must be satisfied: job
slot 2 must target the core group 1, and slots 0, 1 - the core
group 0, respectively.

The kernel driver itself can't guess which jobs need a such a strict
affinity, so setting proper requirements is the responsibility of
the userspace (Mesa). However the userspace is not smart enough [yet].
Therefore this patch applies the above affinity rule to all jobs on
dual core group GPUs.

With this patch panfrost is able to drive T628 (r1p0) GPU on some
armv8 SoCs (in particular BE-M1000).

The patch has been also tested with T860 (rk3399 SoC). At the first
glance (using GNOME desktop, running glmark) the patch does not cause
any changes with T860 GPU.

Signed-off-by: Alexey Sheplyakov <asheplyakov@basealt.ru>
Signed-off-by: Vadim V. Vlasov <vadim.vlasov@elpitech.ru>

Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Vadim V. Vlasov <vadim.vlasov@elpitech.ru>
---
 drivers/gpu/drm/panfrost/panfrost_device.h |  7 ++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 45 ++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_job.c    | 14 ++++++-
 3 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 8b25278f34c8..aa43b1413c8a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -23,6 +23,12 @@ struct panfrost_perfcnt;
 
 #define NUM_JOB_SLOTS 3
 #define MAX_PM_DOMAINS 3
+#define MAX_COHERENT_GROUPS 2
+
+struct panfrost_coherent_group {
+	u64 core_mask;
+	unsigned int nr_cores;
+};
 
 struct panfrost_features {
 	u16 id;
@@ -54,6 +60,7 @@ struct panfrost_features {
 
 	unsigned long hw_features[64 / BITS_PER_LONG];
 	unsigned long hw_issues[64 / BITS_PER_LONG];
+	struct panfrost_coherent_group core_groups[MAX_COHERENT_GROUPS];
 };
 
 /*
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index bbe628b306ee..a02cb160cb4f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -209,6 +209,41 @@ static const struct panfrost_model gpu_models[] = {
 		GPU_REV(g31, 1, 0)),
 };
 
+static void panfrost_decode_coherent_groups(struct panfrost_features *features)
+{
+	struct panfrost_coherent_group *current_group;
+	u64 group_present;
+	u64 group_mask;
+	u64 first_set, first_set_prev;
+	u32 nr_group = 0;
+
+	if (features->mem_features & GROUPS_L2_COHERENT)
+		group_present = features->l2_present;
+	else
+		group_present = features->shader_present;
+
+	current_group = features->core_groups;
+	first_set = group_present & ~(group_present - 1);
+
+	while (group_present != 0 && nr_group < MAX_COHERENT_GROUPS) {
+		group_present -= first_set;
+		first_set_prev = first_set;
+
+		first_set = group_present & ~(group_present - 1);
+		group_mask = (first_set - 1) & ~(first_set_prev - 1);
+		current_group->core_mask = group_mask & features->shader_present;
+		current_group->nr_cores = hweight64(current_group->core_mask);
+
+		nr_group++;
+		current_group++;
+	}
+
+	if (group_present) {
+		pr_warn("%s: too many coherent groups, expected <= %d",
+			__func__, MAX_COHERENT_GROUPS);
+	}
+}
+
 static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
 {
 	u32 gpu_id, num_js, major, minor, status, rev;
@@ -217,6 +252,7 @@ static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
 	u64 hw_issues = hw_issues_all;
 	const struct panfrost_model *model;
 	int i;
+	unsigned long core_mask[64/BITS_PER_LONG];
 
 	pfdev->features.l2_features = gpu_read(pfdev, GPU_L2_FEATURES);
 	pfdev->features.core_features = gpu_read(pfdev, GPU_CORE_FEATURES);
@@ -296,6 +332,7 @@ static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
 
 	bitmap_from_u64(pfdev->features.hw_features, hw_feat);
 	bitmap_from_u64(pfdev->features.hw_issues, hw_issues);
+	panfrost_decode_coherent_groups(&pfdev->features);
 
 	dev_info(pfdev->dev, "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
 		 name, gpu_id, major, minor, status);
@@ -314,6 +351,14 @@ static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
 
 	dev_info(pfdev->dev, "shader_present=0x%0llx l2_present=0x%0llx",
 		 pfdev->features.shader_present, pfdev->features.l2_present);
+	dev_info(pfdev->dev, "%u core groups\n", pfdev->features.nr_core_groups);
+	for (i = 0; i < (int)pfdev->features.nr_core_groups; i++) {
+		bitmap_from_u64(core_mask, pfdev->features.core_groups[i].core_mask);
+		dev_info(pfdev->dev, "core group %u: cores: %64pbl (total %u)\n",
+			 i,
+			 core_mask,
+			 pfdev->features.core_groups[i].nr_cores);
+	}
 }
 
 void panfrost_gpu_power_on(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 908d79520853..454515c1e2f1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -132,11 +132,21 @@ static void panfrost_job_write_affinity(struct panfrost_device *pfdev,
 
 	/*
 	 * Use all cores for now.
-	 * Eventually we may need to support tiler only jobs and h/w with
-	 * multiple (2) coherent core groups
+	 * Eventually we may need to support tiler only jobs
 	 */
 	affinity = pfdev->features.shader_present;
 
+	/* Userspace does not set the requirements properly yet.
+	 * Adjust affinity of all jobs on dual core group GPUs
+	 */
+	if (pfdev->features.nr_core_groups > 1) {
+		if (js == 2)
+			affinity &= pfdev->features.core_groups[1].core_mask;
+		else
+			affinity &= pfdev->features.core_groups[0].core_mask;
+		dev_dbg(pfdev->dev, "js: %d, affinity: %llxu\n", js, affinity);
+	}
+
 	job_write(pfdev, JS_AFFINITY_NEXT_LO(js), lower_32_bits(affinity));
 	job_write(pfdev, JS_AFFINITY_NEXT_HI(js), upper_32_bits(affinity));
 }
-- 
2.30.2

