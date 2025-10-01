Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEE3BAEFE1
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 04:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF16510E644;
	Wed,  1 Oct 2025 02:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ShpwFGmp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF4F10E644
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 02:21:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759285284; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FsOYxeoREEgkVUVlrRFvlchmgcqrWr5VqtXyaTEK/GDqEGhuMTv8RaE76lOEhlw5ObpWLc5CBHFFg2b2jFGi85mq/l3JGhKD1E/a1Zb3AgtgckZ9ZhH8i/XXnuzYCKIXQ96wx3yf/4x4Us+n7/4ZA0zi2wIjAvBYtU7OcFXKyXA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759285284;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NDV1dkD4lYlsoVNmEVl2YMbAz2WyWMuIkB4qJIoRD4I=; 
 b=bDKo5z2LIpu0De3vz9sYP9gQAS83uqhKOehtmW64rNUGlYVspECrVHC/XCZd2CisXvOr5KQVaTuQCCarPYVbqbq+ukH76rd2e5krRU1ZtQ1A+uRUEzVarAwWZWDdjwsYNT//WYVpiLJR5ohIZWXuKUmIBhe0baXew2bp2qN1M98=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759285284; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=NDV1dkD4lYlsoVNmEVl2YMbAz2WyWMuIkB4qJIoRD4I=;
 b=ShpwFGmpj1YjuiNVp4BWgcKVKSNpM5XJnEYKXY8ncLcVfxpQ0S/B435l6y28muHf
 9RvlE/7jOC4yAOEzJv7F1gJEJ86JuLH+HTWgOnnkJTUQb5VjAOhTlqJsXuJyBRyxodk
 sj+kXlGx/dl+S8rCqXXZX8bh0lYNYbOyP/quRU9I=
Received: by mx.zohomail.com with SMTPS id 1759285282788540.9452776271363;
 Tue, 30 Sep 2025 19:21:22 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v4 03/10] drm/panfrost: Handle job HW submit errors
Date: Wed,  1 Oct 2025 03:20:24 +0100
Message-ID: <20251001022039.1215976-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001022039.1215976-1-adrian.larumbe@collabora.com>
References: <20251001022039.1215976-1-adrian.larumbe@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid waiting for the DRM scheduler job timedout handler, and instead, let
the DRM scheduler core signal the error fence immediately when HW job
submission fails.

That means we must also decrement the runtime-PM refcnt for the device,
because the job will never be enqueued or inflight.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index a0123d0a1b7d..3f60adc9b69d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -196,7 +196,7 @@ panfrost_enqueue_job(struct panfrost_device *pfdev, int slot,
 	return 1;
 }
 
-static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
+static int panfrost_job_hw_submit(struct panfrost_job *job, int js)
 {
 	struct panfrost_device *pfdev = job->pfdev;
 	unsigned int subslot;
@@ -208,10 +208,11 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 
 	ret = pm_runtime_get_sync(pfdev->base.dev);
 	if (ret < 0)
-		return;
+		goto err_hwsubmit;
 
 	if (WARN_ON(job_read(pfdev, JS_COMMAND_NEXT(js)))) {
-		return;
+		ret = -EINVAL;
+		goto err_hwsubmit;
 	}
 
 	cfg = panfrost_mmu_as_get(pfdev, job->mmu);
@@ -262,6 +263,12 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 			job, js, subslot, jc_head, cfg & 0xf);
 	}
 	spin_unlock(&pfdev->js->job_lock);
+
+	return 0;
+
+err_hwsubmit:
+	pm_runtime_put_autosuspend(pfdev->base.dev);
+	return ret;
 }
 
 static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
@@ -384,6 +391,7 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
 	struct panfrost_device *pfdev = job->pfdev;
 	int slot = panfrost_job_get_slot(job);
 	struct dma_fence *fence = NULL;
+	int ret;
 
 	if (job->ctx->destroyed)
 		return ERR_PTR(-ECANCELED);
@@ -405,7 +413,11 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
 		dma_fence_put(job->done_fence);
 	job->done_fence = dma_fence_get(fence);
 
-	panfrost_job_hw_submit(job, slot);
+	ret = panfrost_job_hw_submit(job, slot);
+	if (ret) {
+		dma_fence_put(fence);
+		return ERR_PTR(ret);
+	}
 
 	return fence;
 }
-- 
2.51.0

