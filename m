Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43795B368D2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 16:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C85B10E66F;
	Tue, 26 Aug 2025 14:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="d5JI3F99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3838C10E672
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=no8xymYA3pHWaPhwhtBa702FQ/ADf/dsA5YQNlIY9Jg=; b=d5JI3F99qSruaF4uVHZ0qFwoon
 0VuUBl9Gxw4UJE3khad2c63sjkr+KCFouKzaZDGOsM0AiQfHeWG0awSoYCOetCTKRvCR64di3hwI4
 xj/uj2efce5KYESDhlAzmgr4cA0Hh3PNJFl+PmvRu84YhuRcYqtjLVRvzLu/yvpBQDfieBUuDJqVK
 9k4W2bVbarprtPEc0902WX6bh/QtdlfO86Qf9FHom0b3z4BwRiIl+Db2+zRXlz8ot1zw4aqyTHNVV
 2/vGpu6tFJ+OLc7wQ9YH/aprUDoAULx7qNgZy8qr8Fhy28iK4rdSVNh9XODUGQMhY4VCfGlWRn6AK
 Dk660odw==;
Received: from [189.7.87.79] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uquWE-001wrM-HW; Tue, 26 Aug 2025 16:19:26 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 26 Aug 2025 11:19:03 -0300
Subject: [PATCH v3 6/6] drm/v3d: Protect per-fd reset counter against fd
 release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250826-v3d-queue-lock-v3-6-979efc43e490@igalia.com>
References: <20250826-v3d-queue-lock-v3-0-979efc43e490@igalia.com>
In-Reply-To: <20250826-v3d-queue-lock-v3-0-979efc43e490@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3453; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=B+1o/DnegepgqWaPVguedtcw6gp1ZP58yGTXDR0nEiQ=;
 b=owGbwMvMwMVo/5mvq6zj1yrG02pJDBlrD0UYnt15Uefu4onv3GfpOFo1PIgL8/RvytnAZqH+z
 uyTh8/+TkZjFgZGLgZZMUWWH09iaxnFytk1l5VfhBnEygQyhYGLUwAu0sj+P21/0iKuMpu24pK/
 Vz+ymKq9amq5u+Zb0g6vuXzTz+c895Rcu4w9J7Mu5u6iU/z2G7wjS1VZLnb9rSu+wscdoKARpr/
 bxVPu26530t5GE3mrF2+eeLlC/VSwTYTbdhnrLy5TNm9lv/cg46LuAxmmnN0XzTdtC/jzZO0ro3
 MPnxQbs/HnC7vu43m20T/6KtelOLXME113Pqxl53Q6ztNvYGSaHGrzxPLyyYCD075FiT/+M6H9+
 JntATLlsXrLNDOufTX3vR9lyGEQo1DPsaJZY7JClL25CL8J75GDkkx+846FZnm7/bRxVORj6l5U
 2v7/en/Oi/9Mb2T3eW5P2r36iW/uoTsLHq7cn9tVUn4eAA==
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

The per-fd reset counter tracks GPU resets caused by jobs submitted
through a specific file descriptor. However, there's a race condition
where the file descriptor can be closed while jobs are still running,
leading to potential access to freed memory when updating the reset
counter.

Ensure that the per-fd reset counter is only updated when the file
descriptor is still valid, preventing use-after-free scenarios during
GPU reset handling.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index b8984e608547cf3e3a4f06bd0b8340b804a0f821..0ec06bfbbebb5e6347e72c3e9379e71ea4ba8bc2 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -722,17 +722,19 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
 }
 
 static enum drm_gpu_sched_stat
-v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
+v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job,
+			  enum v3d_queue q)
 {
 	struct v3d_job *job = to_v3d_job(sched_job);
 	struct v3d_file_priv *v3d_priv = job->file_priv;
-	enum v3d_queue q;
+	unsigned long irqflags;
+	enum v3d_queue i;
 
 	mutex_lock(&v3d->reset_lock);
 
 	/* block scheduler */
-	for (q = 0; q < V3D_MAX_QUEUES; q++)
-		drm_sched_stop(&v3d->queue[q].sched, sched_job);
+	for (i = 0; i < V3D_MAX_QUEUES; i++)
+		drm_sched_stop(&v3d->queue[i].sched, sched_job);
 
 	if (sched_job)
 		drm_sched_increase_karma(sched_job);
@@ -741,15 +743,17 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
 	v3d_reset(v3d);
 
 	v3d->reset_counter++;
-	v3d_priv->reset_counter++;
+	spin_lock_irqsave(&v3d->queue[q].queue_lock, irqflags);
+	if (v3d_priv)
+		v3d_priv->reset_counter++;
+	spin_unlock_irqrestore(&v3d->queue[q].queue_lock, irqflags);
 
-	for (q = 0; q < V3D_MAX_QUEUES; q++)
-		drm_sched_resubmit_jobs(&v3d->queue[q].sched);
+	for (i = 0; i < V3D_MAX_QUEUES; i++)
+		drm_sched_resubmit_jobs(&v3d->queue[i].sched);
 
 	/* Unblock schedulers and restart their jobs. */
-	for (q = 0; q < V3D_MAX_QUEUES; q++) {
-		drm_sched_start(&v3d->queue[q].sched, 0);
-	}
+	for (i = 0; i < V3D_MAX_QUEUES; i++)
+		drm_sched_start(&v3d->queue[i].sched, 0);
 
 	mutex_unlock(&v3d->reset_lock);
 
@@ -777,7 +781,7 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
 		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
-	return v3d_gpu_reset_for_timeout(v3d, sched_job);
+	return v3d_gpu_reset_for_timeout(v3d, sched_job, q);
 }
 
 static enum drm_gpu_sched_stat
@@ -803,7 +807,7 @@ v3d_tfu_job_timedout(struct drm_sched_job *sched_job)
 {
 	struct v3d_job *job = to_v3d_job(sched_job);
 
-	return v3d_gpu_reset_for_timeout(job->v3d, sched_job);
+	return v3d_gpu_reset_for_timeout(job->v3d, sched_job, V3D_TFU);
 }
 
 static enum drm_gpu_sched_stat
@@ -822,7 +826,7 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_job)
 		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
-	return v3d_gpu_reset_for_timeout(v3d, sched_job);
+	return v3d_gpu_reset_for_timeout(v3d, sched_job, V3D_CSD);
 }
 
 static const struct drm_sched_backend_ops v3d_bin_sched_ops = {

-- 
2.51.0

