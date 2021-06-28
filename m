Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A427D3B59F3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 09:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7BC6E288;
	Mon, 28 Jun 2021 07:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72AC6E094
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 07:42:17 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4C1E31F42598;
 Mon, 28 Jun 2021 08:42:16 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 04/14] drm/panfrost: Drop the pfdev argument passed to
 panfrost_exception_name()
Date: Mon, 28 Jun 2021 09:42:00 +0200
Message-Id: <20210628074210.2695399-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628074210.2695399-1-boris.brezillon@collabora.com>
References: <20210628074210.2695399-1-boris.brezillon@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently unused. We'll add it back if we need per-GPU definitions.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 2 +-
 drivers/gpu/drm/panfrost/panfrost_device.h | 2 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c    | 2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index fbcf5edbe367..bce6b0aff05e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -292,7 +292,7 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
 	panfrost_clk_fini(pfdev);
 }
 
-const char *panfrost_exception_name(struct panfrost_device *pfdev, u32 exception_code)
+const char *panfrost_exception_name(u32 exception_code)
 {
 	switch (exception_code) {
 		/* Non-Fault Status code */
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 4c6bdea5537b..ade8a1974ee9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -172,6 +172,6 @@ void panfrost_device_reset(struct panfrost_device *pfdev);
 int panfrost_device_resume(struct device *dev);
 int panfrost_device_suspend(struct device *dev);
 
-const char *panfrost_exception_name(struct panfrost_device *pfdev, u32 exception_code);
+const char *panfrost_exception_name(u32 exception_code);
 
 #endif
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 2aae636f1cf5..ec59f15940fb 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -33,7 +33,7 @@ static irqreturn_t panfrost_gpu_irq_handler(int irq, void *data)
 		address |= gpu_read(pfdev, GPU_FAULT_ADDRESS_LO);
 
 		dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
-			 fault_status & 0xFF, panfrost_exception_name(pfdev, fault_status),
+			 fault_status & 0xFF, panfrost_exception_name(fault_status),
 			 address);
 
 		if (state & GPU_IRQ_MULTIPLE_FAULT)
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index d6c9698bca3b..3cd1aec6c261 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -500,7 +500,7 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
 
 			dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
 				j,
-				panfrost_exception_name(pfdev, job_read(pfdev, JS_STATUS(j))),
+				panfrost_exception_name(job_read(pfdev, JS_STATUS(j))),
 				job_read(pfdev, JS_HEAD_LO(j)),
 				job_read(pfdev, JS_TAIL_LO(j)));
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index d76dff201ea6..b4f0c673cd7f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -676,7 +676,7 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
 				"TODO",
 				fault_status,
 				(fault_status & (1 << 10) ? "DECODER FAULT" : "SLAVE FAULT"),
-				exception_type, panfrost_exception_name(pfdev, exception_type),
+				exception_type, panfrost_exception_name(exception_type),
 				access_type, access_type_name(pfdev, fault_status),
 				source_id);
 
-- 
2.31.1

