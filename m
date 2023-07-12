Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C8E7508A2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 14:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9786910E517;
	Wed, 12 Jul 2023 12:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A07410E512
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 12:47:13 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-31441dfbf97so7752234f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 05:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689166031; x=1691758031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kJUoBT3tqtyuccM+TuY1/4SIsygQhaE2x0NqcVtNoxw=;
 b=qOVRvaXQPHcSyoKjm/p/MU8olIQ5eS9XrxvxBIC/EQMBYWIPlSCcRHnF1wOes5OqnD
 6nmsXo3Gsq8K3a+nixe/wCuw7sxAYPfLEv11+s4rU5JszgAFSzIX8jTtdUtsFtM74pA/
 NsQwXMWDKZV0IqIKwVs1n5CC9mMPHBFbcQoWaD+pXKsEEElbhkAC/de7Msv6wCb8+omg
 uqJKoxaP4I/Lij/tud508x7L7R9r7XMaiY6OHegJ7UxSDXgxNC1yaX4IiylC6tzf8Zbj
 QNrQN9xoxIsLY+SYy9wBxY88/zKgZciRMbFtE4UrTKw55ULUCZpwKSybfm5d2BW01Sij
 Y1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689166031; x=1691758031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kJUoBT3tqtyuccM+TuY1/4SIsygQhaE2x0NqcVtNoxw=;
 b=P8m2W2e7KB6hvfsqyahF4YAn8R8koSUc6gKK4/UmOTHJH+SYfIg+lgBOwpDCmlzkcz
 Ca9Mts3MAdYE3M+8ttI4nU8IqGtc/xh90HrPGAEeC6ErGTruhxqNLsYvA/OjR7uKB3c0
 jweLzA8GzCbRmz3epRKI0HKkPSkEE58Nlz/kj0Yq9OGcBHPBp64CMcDz1KPDKBTPAGT2
 ihthZwNK8WGVOusRMnyiithPOlhWgWY34/lvHHrhqKmsK9uqwCwHAQR/kOFZAy9CYA+U
 qsWtUOgr+wwMzBLNKsS2xAmJKcrX+l739ombz/QEtl5TIn0XLn4YA09Qbc2wtxq8QufF
 w5Fg==
X-Gm-Message-State: ABy/qLYIDd/DyzrdabVamTVm5XoXQ96KRbVMx8UE/dkg5tHi7x3hH74W
 Q4gUC6VuMb7vXuUlPAMEJbC3+1RrO9c=
X-Google-Smtp-Source: APBJJlHJXkseDiPtG4kEyMUSdeWGA/1wvEjUc5pbesGOyxUOKeiW8SSoFRcRR3ocLL131y6Lsoaasw==
X-Received: by 2002:adf:ea08:0:b0:315:ad16:c1b7 with SMTP id
 q8-20020adfea08000000b00315ad16c1b7mr2151391wrm.17.1689166031132; 
 Wed, 12 Jul 2023 05:47:11 -0700 (PDT)
Received: from EliteBook.fritz.box ([2a00:e180:1557:4100:d4c4:2bb7:77d6:6d86])
 by smtp.gmail.com with ESMTPSA id
 j8-20020adfe508000000b0031424950a99sm4989225wrm.81.2023.07.12.05.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 05:47:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/panfrost: switch to using drm_exec
Date: Wed, 12 Jul 2023 14:47:02 +0200
Message-Id: <20230712124704.333004-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712124704.333004-1-christian.koenig@amd.com>
References: <20230712124704.333004-1-christian.koenig@amd.com>
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
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a straightforward conversion without any optimization.

Only compile tested for now.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/Kconfig        |  1 +
 drivers/gpu/drm/panfrost/panfrost_job.c | 12 +++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/Kconfig b/drivers/gpu/drm/panfrost/Kconfig
index e6403a9d66ad..e86a1a2fd8e1 100644
--- a/drivers/gpu/drm/panfrost/Kconfig
+++ b/drivers/gpu/drm/panfrost/Kconfig
@@ -7,6 +7,7 @@ config DRM_PANFROST
 	depends on !GENERIC_ATOMIC64    # for IOMMU_IO_PGTABLE_LPAE
 	depends on MMU
 	select DRM_SCHED
+	select DRM_EXEC
 	select IOMMU_SUPPORT
 	select IOMMU_IO_PGTABLE_LPAE
 	select DRM_GEM_SHMEM_HELPER
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index dbc597ab46fb..8b9206e910b5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -8,6 +8,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/dma-resv.h>
+#include <drm/drm_exec.h>
 #include <drm/gpu_scheduler.h>
 #include <drm/panfrost_drm.h>
 
@@ -275,13 +276,14 @@ static void panfrost_attach_object_fences(struct drm_gem_object **bos,
 int panfrost_job_push(struct panfrost_job *job)
 {
 	struct panfrost_device *pfdev = job->pfdev;
-	struct ww_acquire_ctx acquire_ctx;
+	struct drm_exec exec;
 	int ret = 0;
 
-	ret = drm_gem_lock_reservations(job->bos, job->bo_count,
-					    &acquire_ctx);
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&exec)
+		ret = drm_exec_prepare_array(&exec, job->bos, job->bo_count, 1);
 	if (ret)
-		return ret;
+		goto unlock;
 
 	mutex_lock(&pfdev->sched_lock);
 	drm_sched_job_arm(&job->base);
@@ -305,7 +307,7 @@ int panfrost_job_push(struct panfrost_job *job)
 				      job->render_done_fence);
 
 unlock:
-	drm_gem_unlock_reservations(job->bos, job->bo_count, &acquire_ctx);
+	drm_exec_fini(&exec);
 
 	return ret;
 }
-- 
2.34.1

