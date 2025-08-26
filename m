Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A66EB368C3
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 16:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE8810E667;
	Tue, 26 Aug 2025 14:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="q1OekvHH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D108C10E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 14:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tqkBEczJaaeru4mplr/hPEGbdxDiNEG8uVev84DN2YI=; b=q1OekvHHvuB+x/Z6Sj9gip2FZG
 n+GhYAhM6EqDUHGZLwSuU8rbRk7I02kJ7mlL0JIoSENHEMr/GgtQ6RO3ghEj0vPTIGCAG0DfSqW9n
 oMaxCLO0I06Lddv/g4au0HMZDedGBmezteG3++/4uhs6IR9oJuXkBQjfmvhuqL8GYqhzBJHwHzSHV
 N5GzFiw4nrFy3RFmgIEvq834odM62RzdTeizzJkQVO7BtdJRxzzHGAq/7j7FzQiACGa4dP+m4+Lne
 8XwJ+OaSHLLfghfO3nn1dMUXb4DZhgonnKVA1YtNzVvJcv0w/TZvEuFdBKSljM/8iX1wL1p0SgVIh
 ydaLYTLQ==;
Received: from [189.7.87.79] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uquVy-001wrM-MY; Tue, 26 Aug 2025 16:19:11 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 26 Aug 2025 11:18:58 -0300
Subject: [PATCH v3 1/6] drm/v3d: Store a pointer to `struct v3d_file_priv`
 inside each job
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250826-v3d-queue-lock-v3-1-979efc43e490@igalia.com>
References: <20250826-v3d-queue-lock-v3-0-979efc43e490@igalia.com>
In-Reply-To: <20250826-v3d-queue-lock-v3-0-979efc43e490@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3997; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=KorHM4FRX32L7Z+1pIZWUkYjN3MB4zbQdEtBLDdqTwA=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBorcJXeNiIPuSfNesUk44OvYIMCM78TlfkZFz/a
 X58Hn7srHeJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaK3CVwAKCRA/8w6Kdoj6
 qsheCAC2ukIomV/hHsZ568PfY+Heg1PucxOdlWkp9DGfl84WrTQWCMwNz+Eul4XzR5IehrzVUlU
 auuxJmR6cwPnOzJaVv6m43BLWDDZ1ohwttSkRQLShcJhyF+TfWCxN50Ox2SJeNMjgZRosCZfOBj
 SlljO9pS6pFACOhF7Hj/a8hia8WHIU+OUN0dtAa4FbqyQV5xd51c5YmMGwPQ5u1rKoGi3mcpOLE
 ds/y+Z6pP778r769/k5VODGUvqHeKFUhhCN95kT2uA00qhX4ygVcSdezA6PCkr/Z+neYRIidVts
 5kR93HKkWOlO7S6MkTi8fppY3lpEUWWLzrhZbKom6UQD+qSt
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
directly to the private V3D file struct. No functional change, this
commit only avoids multiple levels of pointer indirection and makes
the code more straightforward.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h    |  4 ++--
 drivers/gpu/drm/v3d/v3d_sched.c  | 10 +++++-----
 drivers/gpu/drm/v3d/v3d_submit.c |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 82d84a96235f0c5396ff634c2f6a0a7bb809b332..951a302336ce55f0a70f6a7adc0ec7ca30033198 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -327,9 +327,9 @@ struct v3d_job {
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
index f9d9a198d71866e662376a2367d7d5bcb4a363b6..1846030c5f3a508455087947872dacbfd6fb52ad 100644
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
 	u64 now = local_clock();
 	unsigned long flags;
@@ -574,7 +574,7 @@ static void
 v3d_reset_performance_queries(struct v3d_cpu_job *job)
 {
 	struct v3d_performance_query_info *performance_query = &job->performance_query;
-	struct v3d_file_priv *v3d_priv = job->base.file->driver_priv;
+	struct v3d_file_priv *v3d_priv = job->base.file_priv;
 	struct v3d_dev *v3d = job->base.v3d;
 	struct v3d_perfmon *perfmon;
 
@@ -604,7 +604,7 @@ v3d_write_performance_query_result(struct v3d_cpu_job *job, void *data,
 {
 	struct v3d_performance_query_info *performance_query =
 						&job->performance_query;
-	struct v3d_file_priv *v3d_priv = job->base.file->driver_priv;
+	struct v3d_file_priv *v3d_priv = job->base.file_priv;
 	struct v3d_performance_query *perf_query =
 			&performance_query->queries[query];
 	struct v3d_dev *v3d = job->base.v3d;
@@ -722,7 +722,7 @@ static enum drm_gpu_sched_stat
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
2.51.0

