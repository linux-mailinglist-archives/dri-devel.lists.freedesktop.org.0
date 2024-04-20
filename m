Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283838ABD25
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 23:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0D110EAEC;
	Sat, 20 Apr 2024 21:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mgazUr2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CEC10EAEC
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 21:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RwDW9z/sV4fNpTMXX0otvLZPx8ADWt1ubYSgRO0MqoM=; b=mgazUr2rItfEz33mOBfBpNqGEr
 p+b6JNWfh3e0onOgwcUlB+gcEvC43K3UFFpNteZDU74UcuC4c/ZDHMYrYkYFZsbE7dWCziHUArSbo
 oL4jjTnu/w6tuoKSMln6GXzhC8TNbCY5EZDAKRwN/3ciaFZZeA7BFaRTW2+oKzJGPMj+a9eUaYUNx
 kZlNXB7WAU60ZKIQN5nYhKdZ+Zoij7DdkAlVxLDY5HCwoVbsCIK0LjigFqv/ST2GipK7fVAY+ubQB
 EvuLNtvSDtvWG5E2wVbC7Ni4tRnhS9pQMejIYDLu4qeQyKRtj/wDRG9YPQPC511eq5Xy4UfGX8V2b
 wVdPGwIg==;
Received: from [179.234.232.152] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ryIPC-006j7P-0d; Sat, 20 Apr 2024 23:37:54 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v3 5/5] drm/v3d: Fix race-condition between sysfs/fdinfo and
 interrupt handler
Date: Sat, 20 Apr 2024 18:32:13 -0300
Message-ID: <20240420213632.339941-7-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240420213632.339941-2-mcanal@igalia.com>
References: <20240420213632.339941-2-mcanal@igalia.com>
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

In V3D, the conclusion of a job is indicated by a IRQ. When a job
finishes, then we update the local and the global GPU stats of that
queue. But, while the GPU stats are being updated, a user might be
reading the stats from sysfs or fdinfo.

For example, on `gpu_stats_show()`, we could think about a scenario where
`v3d->queue[queue].start_ns != 0`, then an interrupt happens, we update
the value of `v3d->queue[queue].start_ns` to 0, we come back to
`gpu_stats_show()` to calculate `active_runtime` and now,
`active_runtime = timestamp`.

In this simple example, the user would see a spike in the queue usage,
that didn't match reality.

In order to address this issue properly, use a seqcount to protect read
and write sections of the code.

Fixes: 09a93cc4f7d1 ("drm/v3d: Implement show_fdinfo() callback for GPU usage stats")
Reported-by: Tvrtko Ursulin <tursulin@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c   | 14 ++++++++++----
 drivers/gpu/drm/v3d/v3d_drv.h   |  7 +++++++
 drivers/gpu/drm/v3d/v3d_gem.c   |  1 +
 drivers/gpu/drm/v3d/v3d_sched.c |  7 +++++++
 4 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 2ec359ed2def..28b7ddce7747 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -121,6 +121,7 @@ v3d_open(struct drm_device *dev, struct drm_file *file)
 				      1, NULL);
 
 		memset(&v3d_priv->stats[i], 0, sizeof(v3d_priv->stats[i]));
+		seqcount_init(&v3d_priv->stats[i].lock);
 	}
 
 	v3d_perfmon_open_file(v3d_priv);
@@ -145,10 +146,15 @@ v3d_postclose(struct drm_device *dev, struct drm_file *file)
 void v3d_get_stats(const struct v3d_stats *stats, u64 timestamp,
 		   u64 *active_runtime, u64 *jobs_completed)
 {
-	*active_runtime = stats->enabled_ns;
-	if (stats->start_ns)
-		*active_runtime += timestamp - stats->start_ns;
-	*jobs_completed = stats->jobs_completed;
+	unsigned int seq;
+
+	do {
+		seq = read_seqcount_begin(&stats->lock);
+		*active_runtime = stats->enabled_ns;
+		if (stats->start_ns)
+			*active_runtime += timestamp - stats->start_ns;
+		*jobs_completed = stats->jobs_completed;
+	} while (read_seqcount_retry(&stats->lock, seq));
 }
 
 static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index ff06dc1cc078..a2c516fe6d79 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -40,6 +40,13 @@ struct v3d_stats {
 	u64 start_ns;
 	u64 enabled_ns;
 	u64 jobs_completed;
+
+	/*
+	 * This seqcount is used to protect the access to the GPU stats
+	 * variables. It must be used as, while we are reading the stats,
+	 * IRQs can happen and the stats can be updated.
+	 */
+	seqcount_t lock;
 };
 
 struct v3d_queue_state {
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 0086081a9261..da8faf3b9011 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -251,6 +251,7 @@ v3d_gem_init(struct drm_device *dev)
 
 		queue->fence_context = dma_fence_context_alloc(1);
 		memset(&queue->stats, 0, sizeof(queue->stats));
+		seqcount_init(&queue->stats.lock);
 	}
 
 	spin_lock_init(&v3d->mm_lock);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index b9614944931c..7cd8c335cd9b 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -114,16 +114,23 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
 	struct v3d_stats *local_stats = &file->stats[queue];
 	u64 now = local_clock();
 
+	write_seqcount_begin(&local_stats->lock);
 	local_stats->start_ns = now;
+	write_seqcount_end(&local_stats->lock);
+
+	write_seqcount_begin(&global_stats->lock);
 	global_stats->start_ns = now;
+	write_seqcount_end(&global_stats->lock);
 }
 
 static void
 v3d_stats_update(struct v3d_stats *stats, u64 now)
 {
+	write_seqcount_begin(&stats->lock);
 	stats->enabled_ns += now - stats->start_ns;
 	stats->jobs_completed++;
 	stats->start_ns = 0;
+	write_seqcount_end(&stats->lock);
 }
 
 void
-- 
2.44.0

