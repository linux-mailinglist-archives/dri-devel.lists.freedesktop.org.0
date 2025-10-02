Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A71BB4A00
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 19:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF4D10E04D;
	Thu,  2 Oct 2025 17:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="dXM5k7f9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4838710E04D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 17:12:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759425116; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Fc79Y2nHiSHcnNulRhDiEi6r+XSlJxyAwpYYmFqHvpOuDYsbis1PkT0DvEXCJ/iHGXGZnQsCePkWK2pzqvILrFfVuMeyl4xRgQffV1hkHhK9zKehIUqcSxXKI8jN9+rI7sex6Ze3F+tRv+Bv9QG+JsypPCfJm1mYC6hEmk/MBUo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759425116;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vEJPPTFhogSa3KCUS+TOyXr0VwMc+58qyo+RyNDimAY=; 
 b=j0Vky8bJtrghhR5ZIXbF199viv3DtUVNN9rm+Qbm6F+vUxRzD2bgIcBfxO7+Mqd9NDSDTBTG4DtsMQGHDPn/L6hLliQgJAmwiVawDBmedwZMA9DNnaMuWEDCj+do4DCB3PMAgP8vJd7KE6aJAkHVOX8QXXJvbyS0tNbRbH4ZHZI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759425116; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=vEJPPTFhogSa3KCUS+TOyXr0VwMc+58qyo+RyNDimAY=;
 b=dXM5k7f9BQv/uineiDLvQog1NZvQXT8W0FwppT26kVvicr46FA18YK0dSXwkO1i7
 zISGeilTvtu0gDqGLHefwtCwIE1h2D1iGd6TKFIOjJ5vicKtgUQE1jU3QY8OifvZm/l
 WodPJUv+1Vl2RCkkaUVdEZUNbWxfbI6b7t0GvCuc=
Received: by mx.zohomail.com with SMTPS id 1759425114428924.5561370853379;
 Thu, 2 Oct 2025 10:11:54 -0700 (PDT)
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
Subject: [PATCH] drm/panfrost: Name scheduler queues after their job slots
Date: Thu,  2 Oct 2025 18:11:37 +0100
Message-ID: <20251002171139.2067139-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
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

Drawing from commit d2624d90a0b7 ("drm/panthor: assign unique names to
queues"), give scheduler queues proper names that reflect the function
of their JM slot, so that this will be shown when gathering DRM
scheduler tracepoints.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 6 ------
 drivers/gpu/drm/panfrost/panfrost_job.c | 6 +++++-
 drivers/gpu/drm/panfrost/panfrost_job.h | 2 ++
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 22350ce8a08f..d08c87bc63a2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -668,12 +668,6 @@ static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
 	 *   job spent on the GPU.
 	 */
 
-	static const char * const engine_names[] = {
-		"fragment", "vertex-tiler", "compute-only"
-	};
-
-	BUILD_BUG_ON(ARRAY_SIZE(engine_names) != NUM_JOB_SLOTS);
-
 	for (i = 0; i < NUM_JOB_SLOTS - 1; i++) {
 		if (pfdev->profile_mode) {
 			drm_printf(p, "drm-engine-%s:\t%llu ns\n",
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index c47d14eabbae..0f0340ffee19 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -28,6 +28,10 @@
 #define job_write(dev, reg, data) writel(data, dev->iomem + (reg))
 #define job_read(dev, reg) readl(dev->iomem + (reg))
 
+const char * const engine_names[] = {
+	"fragment", "vertex-tiler-compute", "compute-only"
+};
+
 struct panfrost_queue_state {
 	struct drm_gpu_scheduler sched;
 	u64 fence_context;
@@ -846,7 +850,6 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
 		.credit_limit = 2,
 		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
-		.name = "pan_js",
 		.dev = pfdev->dev,
 	};
 	struct panfrost_job_slot *js;
@@ -887,6 +890,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 
 	for (j = 0; j < NUM_JOB_SLOTS; j++) {
 		js->queue[j].fence_context = dma_fence_context_alloc(1);
+		args.name = engine_names[j];
 
 		ret = drm_sched_init(&js->queue[j].sched, &args);
 		if (ret) {
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index 5a30ff1503c6..52ff10b8d3d0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -53,6 +53,8 @@ struct panfrost_jm_ctx {
 	struct drm_sched_entity slot_entity[NUM_JOB_SLOTS];
 };
 
+extern const char * const engine_names[];
+
 int panfrost_jm_ctx_create(struct drm_file *file,
 			   struct drm_panfrost_jm_ctx_create *args);
 int panfrost_jm_ctx_destroy(struct drm_file *file, u32 handle);

base-commit: 30531e9ca7cd4f8c5740babd35cdb465edf73a2d
-- 
2.51.0

