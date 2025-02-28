Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8671A48EA5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 03:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111C510EBD8;
	Fri, 28 Feb 2025 02:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ibnGn6IK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 329C410EBD6;
 Fri, 28 Feb 2025 02:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=rcHVV
 NPM3mgsOgMcJQbDPlD26VF9g2Q5u3/LlGBoFIM=; b=ibnGn6IK5uwh5qLasuhn5
 ECJNJqf9G0/aAlk5r+5Yb8zGEooF0ir6u1R8SW3IxgQ6SzMUoq5T336UWDWKyfed
 fxXohFW+sYmjME39Ojufx44Sf4HU4q4d4ilLkIRG7d0E3IIYXUQsy9BwFF2/6293
 IhB2cHFdLMJI/27tBvS1X8=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
 by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id
 _____wDX3+brH8Fn5_6yOg--.23918S4; 
 Fri, 28 Feb 2025 10:31:09 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Haoxiang Li <haoxiang_li2024@163.com>, stable@vger.kernel.org
Subject: [PATCH] drm/msm: fix a potential memory leak issue in submit_create()
Date: Fri, 28 Feb 2025 10:31:05 +0800
Message-Id: <20250228023105.3737605-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDX3+brH8Fn5_6yOg--.23918S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr13Kryxur18JryfZw48Crg_yoW8trWkpF
 4UG34jkr1UA3WaqwsFkF1jka45Gw18WayxKF4qv3sxuwn0yw1UW3WUJ3yjqFWUJF92yry3
 tFs2kr1UXF10krUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zicdjtUUUUU=
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/1tbiqBQCbmfBGNbydQAAs-
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

The memory allocated by msm_fence_alloc() actually is the
container of msm_fence_alloc()'s return value. Thus, just
free its return value is not enough.
Add a helper 'msm_fence_free()' in msm_fence.h/msm_fence.c
to do the complete job.

Fixes: f94e6a51e17c ("drm/msm: Pre-allocate hw_fence")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/msm/msm_fence.c      | 7 +++++++
 drivers/gpu/drm/msm/msm_fence.h      | 1 +
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index 1a5d4f1c8b42..0e257afaf443 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -184,6 +184,13 @@ msm_fence_alloc(void)
 	return &f->base;
 }
 
+void msm_fence_free(struct dma_fence *fence)
+{
+	struct msm_fence *f = to_msm_fence(fence);
+
+	kfree(f);
+}
+
 void
 msm_fence_init(struct dma_fence *fence, struct msm_fence_context *fctx)
 {
diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
index 148196375a0b..635c68629070 100644
--- a/drivers/gpu/drm/msm/msm_fence.h
+++ b/drivers/gpu/drm/msm/msm_fence.h
@@ -82,6 +82,7 @@ bool msm_fence_completed(struct msm_fence_context *fctx, uint32_t fence);
 void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
 
 struct dma_fence * msm_fence_alloc(void);
+void msm_fence_free(struct dma_fence *fence);
 void msm_fence_init(struct dma_fence *fence, struct msm_fence_context *fctx);
 
 static inline bool
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index dee470403036..3fdcfc5714b6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -56,7 +56,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 
 	ret = drm_sched_job_init(&submit->base, queue->entity, 1, queue);
 	if (ret) {
-		kfree(submit->hw_fence);
+		msm_fence_free(submit->hw_fence);
 		kfree(submit);
 		return ERR_PTR(ret);
 	}
-- 
2.25.1

