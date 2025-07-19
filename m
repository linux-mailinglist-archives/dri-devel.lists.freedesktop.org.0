Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55134B0B03C
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 15:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508E210E389;
	Sat, 19 Jul 2025 13:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RL0NINj5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC86610E352
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E53FgPXDkPW1u2QW0lQ+6C8SiR0NdI2VA9ckIOuNTic=; b=RL0NINj5dV0H/ld2xtNxB1+u+4
 Oajd0nYuduyMGi0xExLdXlo2oGOUxqLNelzu+q68kfkjj3KLPJBYQo4+3zq4zM06xuA46mw7CDQ9r
 tSbpiwq1FJaUC46t0RMSNAPfs6UThEee5rMs20DHgcI5bOzRbuSLaS5vkOo4dmxRIk7z7YjZD9vlr
 E1oQVZvDma1logjy+xeMbA+JKUihHYQyQ0GshVZpaSc7kCw0+2UtL4hLSHDK1QBisxc2Kn2mWnCiy
 W3CfxfIOi5j1S/vxswdZxLUatt72u9BWl6yaiE2GYSJ54aMwkM+/dEXqN79ZlH9GY5LCV4H0aDFQN
 GuBxLCiA==;
Received: from [187.36.210.68] (helo=1.0.0.127.in-addr.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ud7Ye-000wkK-Q6; Sat, 19 Jul 2025 15:24:57 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 19 Jul 2025 10:24:40 -0300
Subject: [PATCH 1/6] drm/v3d: Store a pointer to `struct v3d_file_priv`
 inside each job
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250719-v3d-queue-lock-v1-1-bcc61210f1e5@igalia.com>
References: <20250719-v3d-queue-lock-v1-0-bcc61210f1e5@igalia.com>
In-Reply-To: <20250719-v3d-queue-lock-v1-0-bcc61210f1e5@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3804; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=pv7ZkXQ5TXNJdt5ToPquLuqyDqblpBRdWHPuohOyj14=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoe5yhymhXc9OXP16z2x6+lyU1IwmsR8BBW3OcD
 zBUo198V6GJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaHucoQAKCRA/8w6Kdoj6
 qu7IB/sHf1VjSzxjzHLWNvvaV2QkuaL1r9t1+AaPPk5dOOSqBQzOg2I2cr+TDtgcURVAswvkMpp
 ZE33eqWpKEvRJ70hBRgqPdU0h+iLfeJbJgMwcpjlC6paUWmACE8zGLbI2/ZtG02Wv3dOIH0Zqa2
 Lj1SHr5U9ecgD/50w7kotl1FmPEnCDWvZc04mKmqE5IOg+j+WBfub3+SuiugmACBrTHkUklBoth
 G2xDQ1qn4viezilO7eWJQ+ikbSQeMc772MhdoiKB2JBz9VqF4HQdv1lRBksGl+PVkc9zrToyW4/
 mLULonhvwp6R9Hv0ndpzRH63/ulVxHv5JfH567OtxcoDFTUq
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

Instead of storing a pointer to the DRM file data, store a pointer
directly to the private V3D file struct.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h    |  4 ++--
 drivers/gpu/drm/v3d/v3d_sched.c  | 10 +++++-----
 drivers/gpu/drm/v3d/v3d_submit.c |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index dabda7aaf00074d8de42dcdb345d5f3331ac13b2..dd8d39bf2d948551c66d852aee7f9afa473df4f1 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -319,9 +319,9 @@ struct v3d_job {
 	struct v3d_perfmon *perfmon;
 
 	/* File descriptor of the process that submitted the job that could be used
-	 * for collecting stats by process of GPU usage.
+	 * to collect per-process information about the GPU.
 	 */
-	struct drm_file *file;
+	struct v3d_file_priv *file_priv;
 
 	/* Callback for the freeing of the job on refcount going to 0. */
 	void (*free)(struct kref *ref);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 7d45664f03c714bbb754ea22902147a64e63d115..797aac34481c8a72cff3e16d9d7abebc570e4983 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -139,7 +139,7 @@ static void
 v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
 {
 	struct v3d_dev *v3d = job->v3d;
-	struct v3d_file_priv *file = job->file->driver_priv;
+	struct v3d_file_priv *file = job->file_priv;
 	struct v3d_stats *global_stats = &v3d->queue[queue].stats;
 	struct v3d_stats *local_stats = &file->stats[queue];
 	u64 now = local_clock();
@@ -197,7 +197,7 @@ void
 v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
 {
 	struct v3d_dev *v3d = job->v3d;
-	struct v3d_file_priv *file = job->file->driver_priv;
+	struct v3d_file_priv *file = job->file_priv;
 	struct v3d_stats *global_stats = &v3d->queue[queue].stats;
 	struct v3d_stats *local_stats = &file->stats[queue];
 	u64 now = local_clock();
@@ -570,7 +570,7 @@ static void
 v3d_reset_performance_queries(struct v3d_cpu_job *job)
 {
 	struct v3d_performance_query_info *performance_query = &job->performance_query;
-	struct v3d_file_priv *v3d_priv = job->base.file->driver_priv;
+	struct v3d_file_priv *v3d_priv = job->base.file_priv;
 	struct v3d_dev *v3d = job->base.v3d;
 	struct v3d_perfmon *perfmon;
 
@@ -600,7 +600,7 @@ v3d_write_performance_query_result(struct v3d_cpu_job *job, void *data,
 {
 	struct v3d_performance_query_info *performance_query =
 						&job->performance_query;
-	struct v3d_file_priv *v3d_priv = job->base.file->driver_priv;
+	struct v3d_file_priv *v3d_priv = job->base.file_priv;
 	struct v3d_performance_query *perf_query =
 			&performance_query->queries[query];
 	struct v3d_dev *v3d = job->base.v3d;
@@ -718,7 +718,7 @@ static enum drm_gpu_sched_stat
 v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
 {
 	struct v3d_job *job = to_v3d_job(sched_job);
-	struct v3d_file_priv *v3d_priv = job->file->driver_priv;
+	struct v3d_file_priv *v3d_priv = job->file_priv;
 	enum v3d_queue q;
 
 	mutex_lock(&v3d->reset_lock);
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 5171ffe9012d4d0140d82d40af71ecbaf029a24a..f3652e90683c398f25d2ce306be1c0fdfe4d286f 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -166,7 +166,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 
 	job->v3d = v3d;
 	job->free = free;
-	job->file = file_priv;
+	job->file_priv = v3d_priv;
 
 	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
 				 1, v3d_priv, file_priv->client_id);

-- 
2.50.0

