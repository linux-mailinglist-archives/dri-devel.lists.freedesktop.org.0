Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BD199DA35
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 01:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597E410E4ED;
	Mon, 14 Oct 2024 23:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="SEE6VbQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B46410E4E2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 23:38:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728949116; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FgooGi3tB+HCP9A60qmsG3RQp0hkVtctbRl2aBMMY7LB+/z2gt+oGHOpFJEsEVh8B/CVJA0jB4IXnmn90b+OKgV9++3Zts/cjeLZx+60QpijG0BiSrgP+aBd1mJOL1swj0BVDODnzoz2SIQupey0unfDeCC4+Id8hQtX7b63XLI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1728949116;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/I5+u6uM0kelR4wmg++rrt/HFJwg726T85fu1Pbc6iw=; 
 b=BgWqkUR+ex4n2Rl7mbALGsWD6bVGo4O1J+UVFNUHbfAr2mTYwe050VKEYFnHgLRAb/ojPp4jSdg7gsth4D8/6o7br2x+mkYk7U2z2ymKluCaSaCBCcdqdo9gmkw8J57PC11szyTFR+nlyeJBo+v/9XCSJgMI876fh1IhKawD86c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728949116; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=/I5+u6uM0kelR4wmg++rrt/HFJwg726T85fu1Pbc6iw=;
 b=SEE6VbQV9fMhl7HoiWk39nm9g4J1cUK9+8T6yNqxyasBDKJ4njELFwJ67Qz5Pc9z
 VhQ1BvFai1s2MSGAoGgkLnK7DOWNuaAm3Iud09J2AKVweAmZqH95Ei5HZ+7RqiR8ApH
 7TAdY/9krLzKsyWQcID+pmEMCnzFoOaD+Baz4xrs=
Received: by mx.zohomail.com with SMTPS id 1728949114359752.7258108563636;
 Mon, 14 Oct 2024 16:38:34 -0700 (PDT)
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
Subject: [PATCH 7/9] drm/panfrost: Refactor job IRQ enabling sequence
Date: Tue, 15 Oct 2024 00:31:42 +0100
Message-ID: <20241014233758.994861-7-adrian.larumbe@collabora.com>
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

Just a convenience macro to avoid reduplication.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 68be555c6c52..5d83c6a148ec 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -27,6 +27,11 @@
 #define job_write(dev, reg, data) writel(data, dev->iomem + (reg))
 #define job_read(dev, reg) readl(dev->iomem + (reg))
 
+#define enable_job_interrupts(pfdev)				\
+	job_write((pfdev), JOB_INT_MASK,			\
+		  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |		\
+		  GENMASK(NUM_JOB_SLOTS - 1, 0))
+
 struct panfrost_queue_state {
 	struct drm_gpu_scheduler sched;
 	u64 fence_context;
@@ -741,9 +746,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 		drm_sched_start(&pfdev->js->queue[i].sched, 0);
 
 	/* Re-enable job interrupts now that everything has been restarted. */
-	job_write(pfdev, JOB_INT_MASK,
-		  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
-		  GENMASK(NUM_JOB_SLOTS - 1, 0));
+	enable_job_interrupts(pfdev);
 
 	dma_fence_end_signalling(cookie);
 }
@@ -816,9 +819,7 @@ static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
 
 	/* Enable interrupts only if we're not about to get suspended */
 	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended))
-		job_write(pfdev, JOB_INT_MASK,
-			  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
-			  GENMASK(NUM_JOB_SLOTS - 1, 0));
+		enable_job_interrupts(pfdev);
 
 	return IRQ_HANDLED;
 }
-- 
2.46.2

