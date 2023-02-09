Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A60B690934
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 13:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACBF10EAB4;
	Thu,  9 Feb 2023 12:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530D510EAB4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 12:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HvoF000wzIR7TT3ihMI1xDghTf2N8ZGbeFTkmv+bPaE=; b=fImrussJ0KpV+c/A9iRcxCJjDi
 oTlY66QXpMckoQ3fip4KT4NgHciZSnpMVDI+RPZ1kMFzvmQamaZ40+Idwgd3EAysRVgj94wDz1CpX
 wX4FyWw07HH8OnjFXnarwPWmzKksjurAaVJEJjpuDvfB8Y5MAdqCm/1u2rDMqNWgALWYsVGRzGfNg
 Saf3G6AaxJvWTnXyUpVredcLvO0W93Yg5WTkOIYV0u4OrAiMDbSd4BNW6xEk0VGXk1AjB7JCPIaGz
 aZ5N2EDWwGP+prgtXaTKymKAZo2Pxfg1RKv+LQKoTN5bfEd9pybkOpSJTHCfAC6IHd/7HeJYLt2EX
 1rmKo0YA==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pQ6JO-00DvU2-LY; Thu, 09 Feb 2023 13:46:03 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Melissa Wen <mwen@igalia.com>
Subject: [PATCH v2 1/5] drm/sched: Create wrapper to add a syncobj dependency
 to job
Date: Thu,  9 Feb 2023 09:44:44 -0300
Message-Id: <20230209124447.467867-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209124447.467867-1-mcanal@igalia.com>
References: <20230209124447.467867-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to add a syncobj's fence as a dependency to a job, it is
necessary to call drm_syncobj_find_fence() to find the fence and then
add the dependency with drm_sched_job_add_dependency(). So, wrap these
steps in one single function, drm_sched_job_add_syncobj_dependency().

Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 29 ++++++++++++++++++++++++++
 include/drm/gpu_scheduler.h            |  6 ++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 0e4378420271..9b16480686f6 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -53,6 +53,7 @@
 
 #include <drm/drm_print.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_syncobj.h>
 #include <drm/gpu_scheduler.h>
 #include <drm/spsc_queue.h>
 
@@ -718,6 +719,34 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 }
 EXPORT_SYMBOL(drm_sched_job_add_dependency);
 
+/**
+ * drm_sched_job_add_syncobj_dependency - adds a syncobj's fence as a job dependency
+ * @job: scheduler job to add the dependencies to
+ * @file_private: drm file private pointer
+ * @handle: syncobj handle to lookup
+ * @point: timeline point
+ *
+ * This adds the fence matching the given syncobj to @job.
+ *
+ * Returns:
+ * 0 on success, or an error on failing to expand the array.
+ */
+int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
+					 struct drm_file *file,
+					 u32 handle,
+					 u32 point)
+{
+	struct dma_fence *fence;
+	int ret;
+
+	ret = drm_syncobj_find_fence(file, handle, point, 0, &fence);
+	if (ret)
+		return ret;
+
+	return drm_sched_job_add_dependency(job, fence);
+}
+EXPORT_SYMBOL(drm_sched_job_add_syncobj_dependency);
+
 /**
  * drm_sched_job_add_resv_dependencies - add all fences from the resv to the job
  * @job: scheduler job to add the dependencies to
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 9935d1e2ff69..4cc54f8b57b4 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -48,6 +48,8 @@ struct drm_gem_object;
 struct drm_gpu_scheduler;
 struct drm_sched_rq;
 
+struct drm_file;
+
 /* These are often used as an (initial) index
  * to an array, and as such should start at 0.
  */
@@ -515,6 +517,10 @@ int drm_sched_job_init(struct drm_sched_job *job,
 void drm_sched_job_arm(struct drm_sched_job *job);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence);
+int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
+					 struct drm_file *file,
+					 u32 handle,
+					 u32 point);
 int drm_sched_job_add_resv_dependencies(struct drm_sched_job *job,
 					struct dma_resv *resv,
 					enum dma_resv_usage usage);
-- 
2.39.1

