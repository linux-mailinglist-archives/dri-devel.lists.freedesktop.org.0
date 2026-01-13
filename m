Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385C0D19D3E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2782110E4F7;
	Tue, 13 Jan 2026 15:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HkalBWpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E0010E4F4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:21:31 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso2073115e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768317690; x=1768922490; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=psbRZ8aqRYZkBh8lBreeaxoYq2EjUL4kDmkSGeuE/s0=;
 b=HkalBWpKXY1S/2y7MU3FGEkLIdIyh7YdM4QzEh3pQ2OBBy14S5Rp96fL5Y3djJ0IZz
 KY64DKgr450cgwBVa/4JyJX/NWAAICLpBXD1GKpf9e1wNqqoYfGBLWbgOR8PlGVcbHZF
 ZQvQpgZBx7xkOyCAwrGAV4kOaFegsBEEKRYGrZBDfLpwZBzd7CjzryRcyawFQ5I6XdJk
 Xic186yLQ52Snl3FPs/xCtjx3O6cxxSx03x0TRpyPZtA4zMHuFLEHvKZZow/B1cGICmq
 bBgb/0lu+1S1h5Ub7BczoEalL4TCIMf78XCEVWDVZm6zt0Ru7LX9FRG/XNMB+EDB2CBQ
 YtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768317690; x=1768922490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=psbRZ8aqRYZkBh8lBreeaxoYq2EjUL4kDmkSGeuE/s0=;
 b=WQ31nYCUvniArnozF6cX8A67l8713PLWYElUDbAN44usIV4KBQkaZ4XF2Q40oPQFhZ
 vJVg/BAG6l3oQ5llJUIwTWvFl2qSawC9ncfKBK9VJRPYoE3zf5XNqBSiLMbS0pYhMUW5
 o9XgUmlAEV9hgaXOxMvK1h1E0/lVDIoujeH6QEGXZdEd2D9G7OP3SSg2PSXoKpMIrAvu
 wHjQOfNGe2eTTPanCg9ZEQifT4+cWS3vcwcI+eNMOpmSy8p0WdhpSiftDJYaPv9v5xmL
 GeP3PhGDqTo8RB+iJk+xbiYs0/0qySEOfhywhL8z88Lk+MfaxXO547O+aEdBf0dw1Tic
 oopw==
X-Gm-Message-State: AOJu0YwvQ92IXs1k8Dp3uZG/yNklduQgSaE0FrB8MT/fyXKlqHARmwMw
 vnPXuAMyg6Iopwx2bBQ9SE4KzI2OT+xQr0Hxz6XupBoZaalNxjJA83eC
X-Gm-Gg: AY/fxX7E8PT62r31OK8WbaAWw3QakOqAoWgc+25h1AEipVgGA/LM81npaxe4YyyUf8u
 F78gv3J14YLVh/oFF05oaLm8o1Vb5/+UYcEWV38MHyFVt0WwJzT6Yj//5LnKfEgdnyHwrk+IyXZ
 EadZx2MtV5KokbUm3zWBWLjwpDpKz2+Kt2wDez6N98I7GP7L/yRHNOL79mamz7R/kgFr1b7fz/L
 myxGxZq6hZiy7YzdCIVSpJRPdeRQrJpbiwPZdNEUf4Apt41Hcvd1vYlszrZZuzelQpOaSBfJTg4
 3aBS5eJq6DpqlO4sEa7OVE4kaBXZEj9w+QK3dBHgyHRjjX386I3EqHPlHfx3dYv6Qc1yYu0a7Py
 4taA+igUWKv/IWEZhPhH+7BlHZEWpADQTavBl8SEyjA89mk1lpXNVTYsjgxx7sM6Md+LRIpufWb
 XSkxNrCzCSb5lNS/GGNK4dxnE=
X-Google-Smtp-Source: AGHT+IF/qMbWLM1kY6lAXJxa1994we2c0oH/TUGTrUZGbn+GeCttfi7pDB0Jolv6sAAbxRjq+4+UYQ==
X-Received: by 2002:a05:600c:1385:b0:477:582e:7a81 with SMTP id
 5b1f17b1804b1-47d84b0a227mr252090575e9.4.1768317690115; 
 Tue, 13 Jan 2026 07:21:30 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:141c:9800:1651:dfa:9e48:25d5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ecf6a5466sm129518405e9.11.2026.01.13.07.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 07:21:29 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 02/10] dma-buf: add dma_fence_is_initialized function
Date: Tue, 13 Jan 2026 16:16:09 +0100
Message-ID: <20260113152125.47380-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113152125.47380-1-christian.koenig@amd.com>
References: <20260113152125.47380-1-christian.koenig@amd.com>
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

Some driver use fence->ops to test if a fence was initialized or not.
The problem is that this utilizes internal behavior of the dma_fence
implementation.

So better abstract that into a function.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 13 +++++++------
 drivers/gpu/drm/qxl/qxl_release.c       |  2 +-
 include/linux/dma-fence.h               | 12 ++++++++++++
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 0a0dcbf0798d..b97f90bbe8b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -278,9 +278,10 @@ void amdgpu_job_free_resources(struct amdgpu_job *job)
 	unsigned i;
 
 	/* Check if any fences were initialized */
-	if (job->base.s_fence && job->base.s_fence->finished.ops)
+	if (job->base.s_fence &&
+	    dma_fence_is_initialized(&job->base.s_fence->finished))
 		f = &job->base.s_fence->finished;
-	else if (job->hw_fence && job->hw_fence->base.ops)
+	else if (dma_fence_is_initialized(&job->hw_fence->base))
 		f = &job->hw_fence->base;
 	else
 		f = NULL;
@@ -297,11 +298,11 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
 
 	amdgpu_sync_free(&job->explicit_sync);
 
-	if (job->hw_fence->base.ops)
+	if (dma_fence_is_initialized(&job->hw_fence->base))
 		dma_fence_put(&job->hw_fence->base);
 	else
 		kfree(job->hw_fence);
-	if (job->hw_vm_fence->base.ops)
+	if (dma_fence_is_initialized(&job->hw_vm_fence->base))
 		dma_fence_put(&job->hw_vm_fence->base);
 	else
 		kfree(job->hw_vm_fence);
@@ -335,11 +336,11 @@ void amdgpu_job_free(struct amdgpu_job *job)
 	if (job->gang_submit != &job->base.s_fence->scheduled)
 		dma_fence_put(job->gang_submit);
 
-	if (job->hw_fence->base.ops)
+	if (dma_fence_is_initialized(&job->hw_fence->base))
 		dma_fence_put(&job->hw_fence->base);
 	else
 		kfree(job->hw_fence);
-	if (job->hw_vm_fence->base.ops)
+	if (dma_fence_is_initialized(&job->hw_vm_fence->base))
 		dma_fence_put(&job->hw_vm_fence->base);
 	else
 		kfree(job->hw_vm_fence);
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 7b3c9a6016db..b38ae0b25f3c 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -146,7 +146,7 @@ qxl_release_free(struct qxl_device *qdev,
 	idr_remove(&qdev->release_idr, release->id);
 	spin_unlock(&qdev->release_idr_lock);
 
-	if (release->base.ops) {
+	if (dma_fence_is_initialized(&release->base)) {
 		WARN_ON(list_empty(&release->bos));
 		qxl_release_free_list(release);
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index eea674acdfa6..371aa8ecf18e 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -274,6 +274,18 @@ void dma_fence_release(struct kref *kref);
 void dma_fence_free(struct dma_fence *fence);
 void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
 
+/**
+ * dma_fence_is_initialized - test if fence was initialized
+ * @fence: fence to test
+ *
+ * Return: True if fence was initialized, false otherwise. Works correctly only
+ * when memory backing the fence structure is zero initialized on allocation.
+ */
+static inline bool dma_fence_is_initialized(struct dma_fence *fence)
+{
+	return fence && !!fence->ops;
+}
+
 /**
  * dma_fence_put - decreases refcount of the fence
  * @fence: fence to reduce refcount of
-- 
2.43.0

