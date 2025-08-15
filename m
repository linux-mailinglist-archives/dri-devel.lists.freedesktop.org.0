Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE470B286C7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 21:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C688610E364;
	Fri, 15 Aug 2025 19:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PZGdMYYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94AE10E286
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 19:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r8Plsr7zXDEg8+OC0XffvlZWeickZTM+UN4BRfMxhxI=; b=PZGdMYYkEoiN7hylgSZYqFGGiF
 CJph9KHZ8PRxL4AbFEEqmqIw5WyCuQ8EUg3fWdPxNiqpEuu1OFVfmGkf/+0fHbnaYoFrV/YSbHLzh
 eOAU/vJDe/RE4K5Cwn1WvRmbve1PVvOJ2RU0h2CBti7kkxc4y4nvkx0FI90wI9vsQzlISSGRhY6XC
 +UmS1MyDfTS4WUU7DtLC3N0pKKrr5eVvJ5GVf0MTRhAn5qmoI2qEOjod2JhBjtJi5cq6j4I9wm3HH
 9EIUwnWIkay1+I8qg85AHdTLqoOULNaUMM9TTckyUf8dQZV7/tn+M+0hVlWy4JvZK3D+LFV2zAaUQ
 MTsBimvA==;
Received: from [177.191.196.76] (helo=[192.168.0.165])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1un0Zq-00EoI4-0U; Fri, 15 Aug 2025 21:59:02 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 15 Aug 2025 16:58:40 -0300
Subject: [PATCH v2 1/6] drm/v3d: Store a pointer to `struct v3d_file_priv`
 inside each job
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250815-v3d-queue-lock-v2-1-ce37258ffb53@igalia.com>
References: <20250815-v3d-queue-lock-v2-0-ce37258ffb53@igalia.com>
In-Reply-To: <20250815-v3d-queue-lock-v2-0-ce37258ffb53@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3825; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=g9lWmmGUuTOKyTTvW0U191fBvs2mPGgQPYXTe7ujz2E=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBon5F/jrmWuguTd+FXqliQZV+v2MHa7DuzkH7A/
 /zBoB5LAfqJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaJ+RfwAKCRA/8w6Kdoj6
 qoHyCACLMZmKBgYpnIqqv4V13N6GTEsjc/xoPlMPivJZyqxqN0NlPrc5zVyJ+L1GGQ6fwomeWXz
 d1z2W8n34RXLxAckfJe877qWFJIHB8IUz8nstyLUMHg4B4JnVBzJGDNE6dc2RMUf3jYRRYE1FGI
 Zbn7FXmyNOP2V5fLbhZv2byJDpfOmpNg2WC5btCgX2rdofcimIM7Xt7JHI29lXwV+TeLtJNmRzH
 4Ae+Z7oj4mONLzat2YvlF3q3duyVqadYqxxhkalq/FzfTP6vznFw3SEpy1wb99LRnLWKBC/2KB3
 yerLuiwKq6PNmCBe18EH/NSpjLXWdHehv+jbE26oZuer2eho
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
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
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
2.50.1

