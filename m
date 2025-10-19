Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AB5BEE7AC
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 16:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF8810E20B;
	Sun, 19 Oct 2025 14:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Hhkws7l4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4221510E20A
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 14:53:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760885586; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=g6EEL5r0sbUyjSUoXLrdsaBj+0yEcPyYkUTY6cSom/BvS2EycCQ4ayAVyBWlFhczof5m2COILI9ITGstCXTtkBzl135G/7AzT05c97jOZC8BRJvc9Qi4jPsmrFblztMcS9ZFdS3Bvv6WhIKyQWg2GonNbI4F84BZcNsaMzB6JOI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760885586;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0iKPnQAtWsSBLoHwfnFdSbNVqjC7nxxlvpqkMkiSXmY=; 
 b=OWFLbO5pz9dxdbv4tQ+WxcUMQBCZDs9eww10YHdYMWGDmTexZizYnoetnTfDmWJENBfh/gLTVc86Qr4SM8jLfOPQeqmElta/zRFT45f3/DpYxF2bCAeygZoI6V4WrwIwWRDrDi9Pnd4haw4Tqfjku9T4dc3+DSbDIMQIXri6Xp4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760885586; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=0iKPnQAtWsSBLoHwfnFdSbNVqjC7nxxlvpqkMkiSXmY=;
 b=Hhkws7l4TbuAsUcd12swUHSZi5512xv+bEGdNiLEFKVtULTEDELo9XW0U+uBgITc
 CsXNVw3zXN3YSXM8lZyXcKPg/2aTa2FRrCJNdkk1bwsLVmQpCc95nCCtg2GmAHflhkS
 02nSNaio4YzRaX1G1RZAtXIJe69FYN7DoFVsp5hY=
Received: by mx.zohomail.com with SMTPS id 1760885585469912.4314212441695;
 Sun, 19 Oct 2025 07:53:05 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v7 07/12] drm/panfrost: Don't rework job IRQ enable mask in
 the enable path
Date: Sun, 19 Oct 2025 15:52:12 +0100
Message-ID: <20251019145225.3621989-8-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019145225.3621989-1-adrian.larumbe@collabora.com>
References: <20251019145225.3621989-1-adrian.larumbe@collabora.com>
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

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
index d53e9db945ad..dc4228af78f9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -432,17 +432,10 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
 
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
@@ -761,9 +754,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 		drm_sched_start(&pfdev->js->queue[i].sched, 0);
 
 	/* Re-enable job interrupts now that everything has been restarted. */
-	job_write(pfdev, JOB_INT_MASK,
-		  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
-		  GENMASK(NUM_JOB_SLOTS - 1, 0));
+	job_write(pfdev, JOB_INT_MASK, ALL_JS_INT_MASK);
 
 	dma_fence_end_signalling(cookie);
 }
@@ -836,9 +827,7 @@ static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
 
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

