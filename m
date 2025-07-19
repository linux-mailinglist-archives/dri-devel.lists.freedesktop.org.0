Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066D5B0B041
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 15:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CB510E3E6;
	Sat, 19 Jul 2025 13:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nVhFuWDq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EFB10E3E6
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TevVEk7DIEaDrJO02YKmd+DY5dVE/LapwUZw/6Unm6M=; b=nVhFuWDqTPUp+0bAiwcV8F1acU
 4gBncoTf01B/X3zUe3xMSVtq36+2Symiqcwx20lJhAE4NrwzdbcoGNHJsUA3Xtx0Ti4m+4wyUf7on
 rtrdv7IDoBtAIwX2Jc5ZJOKrcW1Bb5lWuDtugIDFd7iftIOuUvVNs9btMC3VFPY1/NxXwwQd5sR1g
 RTcvpopu5lsOKsH92CkbBTlkBXYA4AjrfbU/BCF8P0kVudVo4GPpXH3ck3lE6AEx0zrb2x+jAawGb
 OE0Ev+xVbwm9YmSQsx9olSe9y57uBpTwfZ+YFgFrzszochRiy1VA6GUPUIiqkisxU8YMAFF2ov6fv
 ZvHPVtEQ==;
Received: from [187.36.210.68] (helo=1.0.0.127.in-addr.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ud7Yv-000wkK-Cu; Sat, 19 Jul 2025 15:25:13 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 19 Jul 2025 10:24:45 -0300
Subject: [PATCH 6/6] drm/v3d: Protect per-fd reset counter against fd release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250719-v3d-queue-lock-v1-6-bcc61210f1e5@igalia.com>
References: <20250719-v3d-queue-lock-v1-0-bcc61210f1e5@igalia.com>
In-Reply-To: <20250719-v3d-queue-lock-v1-0-bcc61210f1e5@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3347; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=9NNPj1aVdJ7VFEwG2dhzjbfI/Hz0FdbW5X8x5qQYnYM=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoe5yi6r/gN/bbaiGIBoAEVh09G5nKaNRbkCq7I
 Q0vsfMhZfOJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaHucogAKCRA/8w6Kdoj6
 qq71CADExYXeXdjVxsVnOiIvI/yoHi3fvNlVFC3rMn7oR82Md07uopcDU2GH0QFU61L6VmKMLo3
 SukY1wGmmpSOgYqYbn8KnHHycl+i4lJ1vze+hGgwFZwclT3siAulJiRDKZRjrOqAvTwZGXmnx3O
 44BrpMnBzizTe8zx03W8CbmmpYrpBveKv6GBzTA5hcFsOJkJ1PvdcDUTgVJITWGH2P9jSAaW2ua
 9o8qZFixIK5yLOIBALwd7EjeXTb6JPU0k/ql+M2ct9FW9pfolZhPrd4jJPCoqjRTn9GKdas51Uh
 S7gu0FWVLEdu7WTidhOvq8GxXXMdlHP2VbdHnGpKrCXNKyAf
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
---
 drivers/gpu/drm/v3d/v3d_sched.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 715cdc3ada62a271e6dbd0584cdbac24e23c63d6..9f57ab41a7980ab097ea4cfed613f0cf6a1e6359 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -724,17 +724,19 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
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
@@ -743,15 +745,17 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
 	v3d_reset(v3d);
 
 	v3d->reset_counter++;
-	v3d_priv->reset_counter++;
+	spin_lock_irqsave(&v3d->queue[q].queue_lock, irqflags);
+	if (v3d_priv)
+		v3d_priv->reset_counter++;
+	spin_unlock_irqrestore(&v3d->queue[q].queue_lock, irqflags);
 
-	for (q = 0; q < V3D_MAX_QUEUES; q++)
+	for (i = 0; i < V3D_MAX_QUEUES; i++)
 		drm_sched_resubmit_jobs(&v3d->queue[q].sched);
 
 	/* Unblock schedulers and restart their jobs. */
-	for (q = 0; q < V3D_MAX_QUEUES; q++) {
-		drm_sched_start(&v3d->queue[q].sched, 0);
-	}
+	for (i = 0; i < V3D_MAX_QUEUES; i++)
+		drm_sched_start(&v3d->queue[i].sched, 0);
 
 	mutex_unlock(&v3d->reset_lock);
 
@@ -779,7 +783,7 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
 		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
-	return v3d_gpu_reset_for_timeout(v3d, sched_job);
+	return v3d_gpu_reset_for_timeout(v3d, sched_job, q);
 }
 
 static enum drm_gpu_sched_stat
@@ -805,7 +809,7 @@ v3d_tfu_job_timedout(struct drm_sched_job *sched_job)
 {
 	struct v3d_job *job = to_v3d_job(sched_job);
 
-	return v3d_gpu_reset_for_timeout(job->v3d, sched_job);
+	return v3d_gpu_reset_for_timeout(job->v3d, sched_job, V3D_TFU);
 }
 
 static enum drm_gpu_sched_stat
@@ -824,7 +828,7 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_job)
 		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
-	return v3d_gpu_reset_for_timeout(v3d, sched_job);
+	return v3d_gpu_reset_for_timeout(v3d, sched_job, V3D_CSD);
 }
 
 static const struct drm_sched_backend_ops v3d_bin_sched_ops = {

-- 
2.50.0

