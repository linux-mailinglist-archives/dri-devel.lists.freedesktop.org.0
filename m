Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0708C99DA30
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 01:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5335D10E4E8;
	Mon, 14 Oct 2024 23:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="J/Xd1DZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6462B10E4E8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 23:38:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728949106; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NdHleGPP/3aH6TaokRS57XKaMOX5n/O2/9ayKaHrXivLSpQYmM57/B4CwMI6dZdhOnSkDeqyC4QZzvLhuWOqIlhHwDqF+IgvCBR2OFrbV7L3WGmprhqwh07c2Yb++2U9d15bArQ/t0hXPmJgmsV2CO/QK/vS0n/yJP0KJlBUni0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1728949106;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=K6mqrWVCp9EX7x05p2w9FQ+Z72iiZ5X89MMIiXuI/fk=; 
 b=Fj3AHeeom4KNQ+SlHHPIz2torFnM0N4mQfGlsreI/+GV3ykUHa28Wnp1NkSRgTfs9VXv9cJ/0w/f+0hfOt/IcLMbZ4aBlJ0/DGIzPR+ICh0eRVK1L6+PXePyuRRe/T5P6fly1F2tWyHzCMKOVThcuS3NP1RvqUDYFC18WeCMzwM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728949106; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=K6mqrWVCp9EX7x05p2w9FQ+Z72iiZ5X89MMIiXuI/fk=;
 b=J/Xd1DZBo50Sq7e7lL5RX0wLZ4tLh9ZV0cmvWNWa/gzreV5x5GBktju/0hP4oNCc
 jI5FRDVAZ7y7DZMfvJMLLwfuHlzoXIBN1wmgG2GoMBgt6w4NQsUnOl3+3+7bm8a2fDa
 N0bvY7zEnWOpYxa7EzI/ohXK5KktICu/VFFldMlc=
Received: by mx.zohomail.com with SMTPS id 1728949105800317.8456998376339;
 Mon, 14 Oct 2024 16:38:25 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] drm/panfrost: handle job hw submit errors
Date: Tue, 15 Oct 2024 00:31:39 +0100
Message-ID: <20241014233758.994861-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241014233758.994861-1-adrian.larumbe@collabora.com>
References: <20241014233758.994861-1-adrian.larumbe@collabora.com>
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

Avoid waiting for the DRM scheduler job timeout handler and let the DRM
scheduler core signal the error fence immediately instead when HW job
submission fails.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index f0a4690bcdf9..52ec9dc2397c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -195,7 +195,7 @@ panfrost_enqueue_job(struct panfrost_device *pfdev, int slot,
 	return 1;
 }
 
-static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
+static int panfrost_job_hw_submit(struct panfrost_job *job, int js)
 {
 	struct panfrost_device *pfdev = job->pfdev;
 	unsigned int subslot;
@@ -207,15 +207,15 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 
 	ret = pm_runtime_get_sync(pfdev->base.dev);
 	if (ret < 0)
-		return;
+		return ret;
 
 	if (WARN_ON(job_read(pfdev, JS_COMMAND_NEXT(js)))) {
-		return;
+		return -EINVAL;
 	}
 
 	ret = panfrost_mmu_as_get(pfdev, job->mmu, &cfg);
 	if (ret)
-		return;
+		return ret;
 
 	job_write(pfdev, JS_HEAD_NEXT_LO(js), lower_32_bits(jc_head));
 	job_write(pfdev, JS_HEAD_NEXT_HI(js), upper_32_bits(jc_head));
@@ -263,6 +263,8 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 			job, js, subslot, jc_head, cfg & 0xf);
 	}
 	spin_unlock(&pfdev->js->job_lock);
+
+	return 0;
 }
 
 static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
@@ -384,6 +386,7 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
 	struct panfrost_device *pfdev = job->pfdev;
 	int slot = panfrost_job_get_slot(job);
 	struct dma_fence *fence = NULL;
+	int ret;
 
 	if (unlikely(job->base.s_fence->finished.error))
 		return NULL;
@@ -402,7 +405,11 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
 		dma_fence_put(job->done_fence);
 	job->done_fence = dma_fence_get(fence);
 
-	panfrost_job_hw_submit(job, slot);
+	ret = panfrost_job_hw_submit(job, slot);
+	if (ret) {
+		dma_fence_put(job->done_fence);
+		return ERR_PTR(ret);
+	}
 
 	return fence;
 }
-- 
2.46.2

