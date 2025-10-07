Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73193BC1D7E
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E7B10E6BA;
	Tue,  7 Oct 2025 15:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="h+3eK45s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFAF10E6B7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:03:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759849384; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TksvRt1BLOoAKEvrhfosMKCpaFV/saii23xt4lbVsR3TnkAbdqxfF34ljyUPcBuPfZ11KC9Qt7O336UJOMZSW5u6fFjAe8X25Ta2ydstI2KzfJdTu60Q6Iwtp+jn9EbaI7PjfaRVi2epHo5RaHdLAUWccdL/neAnSBlafKbp4jM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759849384;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=5QawNYWd7VxW2zSnBaGlclqdmfFfU4hdRw2ONf/G3V0=; 
 b=bM+Ui7jdKk4IUPAb4AkHDnU9S0lIi2ulXFwRUWkCKVxjgrj22YyO4tr3N5QY0T3oeEiWT6+6vE9NWjpnRYVvJFuTSQj8GmvMkhagJ5L6gRYZZuS3hgGHyeDvIBh7I7lpiqlfu+9A6k5T/MDH7gU2eMa0CjIaggUv90GsAasZ1ZE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759849384; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=5QawNYWd7VxW2zSnBaGlclqdmfFfU4hdRw2ONf/G3V0=;
 b=h+3eK45sv0zu87L04G4JdQY5tJj+w0zi25Koi8R4ekOiWb29+5nEC1F5v3nsXFZt
 ns3b/8+ZfzEuBr1Aw6SYK1gG0L8b/G2BtOOGBIy/6SeEXfylv6qIFGBfzNXOwWbDFUk
 XscXOJIBOmJ60p5JT1wGhYhDVZbtwTv1UmxhnirY=
Received: by mx.zohomail.com with SMTPS id 1759849381716860.2690265101397;
 Tue, 7 Oct 2025 08:03:01 -0700 (PDT)
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
Subject: [PATCH v5 07/12] drm/panfrost: Don't rework job IRQ enable mask in
 the enable path
Date: Tue,  7 Oct 2025 16:01:49 +0100
Message-ID: <20251007150216.254250-8-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007150216.254250-1-adrian.larumbe@collabora.com>
References: <20251007150216.254250-1-adrian.larumbe@collabora.com>
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

Up until now, panfrost_job_enable_interrupts() would always recalculate the
same job IRQ enablement mask, which is effectively a constant.

Replace it with a compile-time constant value, and also in another couple
places where an equivalent expression was being used.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h |  4 ++++
 drivers/gpu/drm/panfrost/panfrost_job.c    | 19 ++++---------------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 474b232bb38e..ac7147ed806b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -26,6 +26,10 @@ struct panfrost_perfcnt;
 
 #define MAX_PM_DOMAINS 5
 
+#define ALL_JS_INT_MASK					\
+	(GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |		\
+	 GENMASK(NUM_JOB_SLOTS - 1, 0))
+
 enum panfrost_drv_comp_bits {
 	PANFROST_COMP_BIT_GPU,
 	PANFROST_COMP_BIT_JOB,
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 1b3af5d52081..ff525d3efd76 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -428,17 +428,10 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
 
 void panfrost_job_enable_interrupts(struct panfrost_device *pfdev)
 {
-	int j;
-	u32 irq_mask = 0;
-
 	clear_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
 
-	for (j = 0; j < NUM_JOB_SLOTS; j++) {
-		irq_mask |= MK_JS_MASK(j);
-	}
-
-	job_write(pfdev, JOB_INT_CLEAR, irq_mask);
-	job_write(pfdev, JOB_INT_MASK, irq_mask);
+	job_write(pfdev, JOB_INT_CLEAR, ALL_JS_INT_MASK);
+	job_write(pfdev, JOB_INT_MASK, ALL_JS_INT_MASK);
 }
 
 void panfrost_job_suspend_irq(struct panfrost_device *pfdev)
@@ -757,9 +750,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 		drm_sched_start(&pfdev->js->queue[i].sched, 0);
 
 	/* Re-enable job interrupts now that everything has been restarted. */
-	job_write(pfdev, JOB_INT_MASK,
-		  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
-		  GENMASK(NUM_JOB_SLOTS - 1, 0));
+	job_write(pfdev, JOB_INT_MASK, ALL_JS_INT_MASK);
 
 	dma_fence_end_signalling(cookie);
 }
@@ -832,9 +823,7 @@ static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
 
 	/* Enable interrupts only if we're not about to get suspended */
 	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended))
-		job_write(pfdev, JOB_INT_MASK,
-			  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
-			  GENMASK(NUM_JOB_SLOTS - 1, 0));
+		job_write(pfdev, JOB_INT_MASK, ALL_JS_INT_MASK);
 
 	return IRQ_HANDLED;
 }
-- 
2.51.0

