Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9E4B0B03F
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 15:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5712610E395;
	Sat, 19 Jul 2025 13:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Z0R0OeMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3A210E3E8
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JItD/zmg518xf8DTpwaMR1dldMejDFUdV5ooU28PGD0=; b=Z0R0OeMHkkuRbPuVDPgdrzTv6J
 nJaWv0f8W3yQOuux13IAaafHVoI31rtllRD8/Uu7kHUF9bu6KIKAiVZn95JeZW+F2jYBD+nqQJ3Dn
 QC4fov7RHb9SXSbbLPtLR/6GYVJV1PD5DlO3lk7UyMEMa0zvcxNfpndgzXOea0HG+7U6ZlNCPCKuF
 t5QsB16J3imByEKnr93tn45tzXwtPAdoPneZ2rmJJJcNVxa/pHj3oRwWR4ldqk7Gt3CMqBQMZwfod
 sO7E8L3VMMhkVj6GlU5EQil4p6p1G8E7e2TULpIkfAsZVl1WABJecVmYiWBYAJEze4g17z//AWYBF
 ejbcqVDQ==;
Received: from [187.36.210.68] (helo=1.0.0.127.in-addr.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ud7Yo-000wkK-Ow; Sat, 19 Jul 2025 15:25:07 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 19 Jul 2025 10:24:43 -0300
Subject: [PATCH 4/6] drm/v3d: Address race-condition between per-fd GPU
 stats and fd release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250719-v3d-queue-lock-v1-4-bcc61210f1e5@igalia.com>
References: <20250719-v3d-queue-lock-v1-0-bcc61210f1e5@igalia.com>
In-Reply-To: <20250719-v3d-queue-lock-v1-0-bcc61210f1e5@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6131; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=9wToj3hKcbUlUCbwgrZ3eSxsqGWaanNMLniK2j+l0e0=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoe5yhn/YA+GRGroZlY1WqZx9ZsbV+KML/4YO9N
 oq2N71KmOeJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaHucoQAKCRA/8w6Kdoj6
 qp+cCACfug9o5+UUZH7khumIp5qE8K4bdYYHovKDePZ/5zeZVhah870xghI04p8J3SJB4PH3ZDO
 YUeDZpymgJnHTqDEiip1k7W9YpOIeUoUrenLBRzXkseBjA+AR5KLh5Hg5LTyusl1HVpSeqjudaS
 wHqaYC+sGc6NglCV/agAodpoj64rcNkYRakqioORmRTbvpV7CokKaZ36rCvA+5IDAe7UxXSJWYU
 2d/gT+MP3WKualArb2u7EbdIQAZ1dcQIjvh2vcTWtEbq03QfmnC3IvtsHGcrDQF7Cqnb9Z58kgL
 JmaKiPBHALdN6a68PdSB67DLJv7yrCWKs416Mr/vcmMwM45F
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

When the file descriptor is closed while a job is still running,
there's a race condition between the job completion callback and the
file descriptor cleanup. This can lead to accessing freed memory when
updating per-fd GPU stats, such as the following example:

[56120.512903] Unable to handle kernel paging request at virtual address 0000330a92b9688a
[56120.520881] Mem abort info:
[56120.523687] ESR = 0x0000000096000005
[56120.527454] EC = 0x25: DABT (current EL), IL = 32 bits
[56120.532785] SET = 0, FnV = 0
[56120.535847] EA = 0, S1PTW = 0
[56120.538995] FSC = 0x05: level 1 translation fault
[56120.543891] Data abort info:
[56120.546778] ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
[56120.552289] CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[56120.557362] GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[56120.562690] user pgtable: 16k pages, 47-bit VAs, pgdp=0000000023f54000
[56120.569239] [0000330a92b9688a] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
[56120.577975] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
 	       CPU: 0 UID: 1000 PID: 1497409 Comm: mpv Not tainted 6.12.37-ncvm5+ #1
 	       Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
 	       pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 	       pc : v3d_job_update_stats+0x64/0x168 [v3d]
 	       lr : v3d_job_update_stats+0x40/0x168 [v3d]
 	       sp : ffffc00080003e60
 	       x29: ffffc00080003e60 x28: ffff800002860000 x27: 0000000000000000
 	       x26: 0000000000000000 x25: ffff800002860000 x24: ffff800002630800
 	       x23: ffff800060786000 x22: 0000330a933c31fb x21: 0000000000000001
 	       x20: 0000330a92b96302 x19: ffff800060786b10 x18: 0000000000000000
 	       x17: ffffaf90506a0000 x16: ffffd06fce57c360 x15: 0000000000000000
 	       x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
 	       x11: 0000000000000000 x10: 0000000000000000 x9 : ffffd06f5d0fec40
 	       x8 : 0000000000000000 x7 : 0000000000000000 x6 : 000002978dbd535a
 	       x5 : 00ffffffffffffff x4 : 0000000000000015 x3 : 0000300001fddf88
 	       x2 : 0000000000000020 x1 : 0000000000010001 x0 : 0000330a92b96872
 	       Call trace:
		 v3d_job_update_stats+0x64/0x168 [v3d]
		 v3d_irq+0x118/0x2e0 [v3d]
		 __handle_irq_event_percpu+0x60/0x220

Fix such an issue by protecting all accesses to `job->file_priv` with
the queue's lock. With that, we can clear `job->file_priv` before the
V3D per-fd structure is freed and assure that `job->file_priv` exists
during the per-fd GPU stats updates.

Fixes: e1bc3a13bd77 ("drm/v3d: Avoid NULL pointer dereference in `v3d_job_update_stats()`")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c   | 14 +++++++++++++-
 drivers/gpu/drm/v3d/v3d_drv.h   |  2 +-
 drivers/gpu/drm/v3d/v3d_sched.c | 16 +++++++++++-----
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 2def155ce496ec5f159f6bda9929aeaae141d1a6..c5a3bbbc74c5c6c9a34a6e6111b4e4e21bee0b34 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -157,12 +157,24 @@ v3d_open(struct drm_device *dev, struct drm_file *file)
 static void
 v3d_postclose(struct drm_device *dev, struct drm_file *file)
 {
+	struct v3d_dev *v3d = to_v3d_dev(dev);
 	struct v3d_file_priv *v3d_priv = file->driver_priv;
+	unsigned long irqflags;
 	enum v3d_queue q;
 
-	for (q = 0; q < V3D_MAX_QUEUES; q++)
+	for (q = 0; q < V3D_MAX_QUEUES; q++) {
+		struct v3d_queue_state *queue = &v3d->queue[q];
+		struct v3d_job *job = queue->active_job;
+
 		drm_sched_entity_destroy(&v3d_priv->sched_entity[q]);
 
+		if (job && job->base.entity == &v3d_priv->sched_entity[q]) {
+			spin_lock_irqsave(&queue->queue_lock, irqflags);
+			job->file_priv = NULL;
+			spin_unlock_irqrestore(&queue->queue_lock, irqflags);
+		}
+	}
+
 	v3d_perfmon_close_file(v3d_priv);
 	kfree(v3d_priv);
 }
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index fb1a3d010fd5a61099f413629e9bfeeed3c45c59..a1ad2c0cbe8ba991766f8d0777a8a1a5e78b4520 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -600,7 +600,7 @@ void v3d_timestamp_query_info_free(struct v3d_timestamp_query_info *query_info,
 				   unsigned int count);
 void v3d_performance_query_info_free(struct v3d_performance_query_info *query_info,
 				     unsigned int count);
-void v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue);
+void v3d_job_update_stats(struct v3d_job *job, enum v3d_queue q);
 int v3d_sched_init(struct v3d_dev *v3d);
 void v3d_sched_fini(struct v3d_dev *v3d);
 
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 85f6fdb470ae0270c0b4d421fb5e214a13c2e03a..4a226ea3bc96865894e360b4115eb836da12d550 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -194,12 +194,11 @@ v3d_stats_update(struct v3d_stats *stats, u64 now)
 }
 
 void
-v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
+v3d_job_update_stats(struct v3d_job *job, enum v3d_queue q)
 {
 	struct v3d_dev *v3d = job->v3d;
-	struct v3d_file_priv *file = job->file_priv;
-	struct v3d_stats *global_stats = &v3d->queue[queue].stats;
-	struct v3d_stats *local_stats = &file->stats[queue];
+	struct v3d_queue_state *queue = &v3d->queue[q];
+	struct v3d_stats *global_stats = &queue->stats;
 	u64 now = local_clock();
 	unsigned long flags;
 
@@ -209,7 +208,14 @@ v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
 	else
 		preempt_disable();
 
-	v3d_stats_update(local_stats, now);
+	/* Don't update the local stats if the file context has already closed */
+	spin_lock(&queue->queue_lock);
+	if (job->file_priv)
+		v3d_stats_update(&job->file_priv->stats[q], now);
+	else
+		drm_dbg(&v3d->drm, "The file descriptor was closed before job completion\n");
+	spin_unlock(&queue->queue_lock);
+
 	v3d_stats_update(global_stats, now);
 
 	if (IS_ENABLED(CONFIG_LOCKDEP))

-- 
2.50.0

