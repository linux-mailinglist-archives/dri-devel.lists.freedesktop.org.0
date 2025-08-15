Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15225B286CB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 21:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0A310E98C;
	Fri, 15 Aug 2025 19:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="sKkuaI4n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A184F10E988
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 19:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u/7ujHzuRk/YsOKzUw/7rRsrS9FWlsITeIUFoyTXVhg=; b=sKkuaI4nG7Llr351FBbRY2jDrc
 pPjMQjdZSV0cUXF55mRQ1ZJF4qDuG0d+IFHEDvES+/HOGGCScP/peAwnD0wsrdzbE4LDt4qh2/fhg
 eyVAhKs/Ci6UXmihRTyPE4E4Le0hQLgdDbb2e5u3OiDn7Zmypd98HiwRbB4OKdPDAazTb/Ky/Gq18
 0EwCpTmyWDMbG+8xg5w68HtAYhu0VO2k1rpg29d+0v6yBnmIFv7h0498dzZ+nexYfWPtOixYV4bl2
 F5qmyrsnOeFr56A+WFh4WDn8F8nFk3v9pizHcS1NOPOE6kW5WjZWWEGcc6Y56dfHssP4sjgPpxXsX
 nQ3LkrzA==;
Received: from [177.191.196.76] (helo=[192.168.0.165])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1un0a5-00EoI4-4s; Fri, 15 Aug 2025 21:59:17 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 15 Aug 2025 16:58:45 -0300
Subject: [PATCH v2 6/6] drm/v3d: Protect per-fd reset counter against fd
 release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250815-v3d-queue-lock-v2-6-ce37258ffb53@igalia.com>
References: <20250815-v3d-queue-lock-v2-0-ce37258ffb53@igalia.com>
In-Reply-To: <20250815-v3d-queue-lock-v2-0-ce37258ffb53@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3400; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=Js/8sPOYseXz69G6fqL6/lnLt0JZwawAWPMzye/xk34=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBon5GAuGuaoBFASc1Ygfut6ywbZdDA7r7pBqenf
 5wkwOwDbfuJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaJ+RgAAKCRA/8w6Kdoj6
 qh8ZB/sFTPWQEFEXOLvjuSy4YeXgslC0YEb0qySU/OW9uLl76k6bFqHnp4h3CgHKUuuhBZ0scij
 jAAPHG5+ivhy0zqisi9nOc122TspgxP2ZPNXPsWN2Ar53SZRIFqfpmp4LSdE8tNla/v5oRnuI8l
 jPo0Pu+blaG8meG2RonFJZmosZ6X+rVcuvMqnKkWeQe25jppW3O/gn35jjgmKIEBXMKM60U2J2e
 /gOWdhJFSK1EnsIh6Mvgk9nNQxKHemiE36s3nLM3fhZqXwlIhUBHtNVXv3Sd4Rp+Aw1lcpukqyl
 V/6zncdGoeU2hrcwleZBth9Bw76nqwnuYuUKqfE/4EJNWYdT
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
 drivers/gpu/drm/v3d/v3d_sched.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index d2045d0db12e63bc67bac6a47cabcf746189ea88..05b7c2eae3a5dbd34620f2666ffb69364a5136d5 100644
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
+	for (i = 0; i < V3D_MAX_QUEUES; i++)
 		drm_sched_resubmit_jobs(&v3d->queue[q].sched);
 
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
2.50.1

