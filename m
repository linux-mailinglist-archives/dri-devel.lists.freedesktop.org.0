Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPV9L/a6qmnLVwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:31:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F69221FB00
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC50810ECF8;
	Fri,  6 Mar 2026 11:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ru/avXrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4713A10ECF7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 11:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q9H2xVnxIgd9CfC38Aczb4erA2Mw3KA0HQp6NB6HxYw=; b=ru/avXrJhZbH7QQHZIKtulB2ku
 Vbf1o5Zs9lR5XqXuWBjvsmge9zwPwOFRVHfMJKQLwPuTsv3VXhXm9eDic1G5N7CVFFA+MXR6NUoHJ
 ACfRUv4ITbEH3yWdUalUhs/yTCZR21Nbc0aHnwf3KuQy4i9JbB9lJ5PeoK37J32rl0X6Ff5SDcqqb
 APbItrxYt4jjTcGznnEjbI/wkhIcxZ5nB08837248Xn2Bf1oCz6PZVSjauj6RaP4C/AhAm6eAeZEh
 ULjUp/87M/+xE5ugoYwFAw4OIiuAhjcpsdljhBNhVpWAS04lQaDLJpAO9u+cbsVpnygFjdWVgDN7d
 2B+O61JQ==;
Received: from [189.7.87.203] (helo=[192.168.0.16])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vyTOQ-00A0JZ-Rc; Fri, 06 Mar 2026 12:30:55 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 06 Mar 2026 08:30:37 -0300
Subject: [PATCH v3 5/6] drm/v3d: Attach per-fd reset counters to v3d_stats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-v3d-reset-locking-improv-v3-5-49864fe00692@igalia.com>
References: <20260306-v3d-reset-locking-improv-v3-0-49864fe00692@igalia.com>
In-Reply-To: <20260306-v3d-reset-locking-improv-v3-0-49864fe00692@igalia.com>
To: Melissa Wen <mwen@igalia.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Iago Toral Quiroga <itoral@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5039; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=PObqqcjIWYSOBGZiRvMQ2/2Y9LDSnxD/eLLumsy3avA=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBpqrrehmJJMC0Xcqmiyjm+Vuno8EwBMwt4UnGcp
 yS81afNh62JATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaaq63gAKCRA/8w6Kdoj6
 qq/yB/4htVY75JB90NDmcqxxlEUB3PnZ+xub4hBKp1mEanEFTYRWjcake9uI4fvSnjir0uLOmm3
 tcbhY9q3jppjgVU3xeW8qeoED3qJlJs89ThIviMqDKCCIy7wML1Ftbd4WTYpRgWIUlUA3IhvZUo
 S6E1q38rPvp6NF73F7quC8RGquGsp+gFjXxwiGJ8Frjf9dBHZ0an45duK6QIZVdf8d4wV77Ljuf
 hmdysIajxGAKpYXWhGUej2VIj2LyvknB74mg/tBfdGmiatC91BnCT7KOODd22FAKT2zKssknkDf
 4kN9S65oKMf7eF5whBJyzkLGMiRuPWf1bkps9kufzvokYfsY
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
X-Rspamd-Queue-Id: 6F69221FB00
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:tvrtko.ursulin@igalia.com,m:mripard@kernel.org,m:kernel-dev@igalia.com,m:mcanal@igalia.com,m:itoral@igalia.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.967];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

To remove the file_priv NULL-ing dance needed to check if the file
descriptor is open, move the per-fd reset counter into v3d_stats, which
is heap-allocated and refcounted, outliving the fd as long as jobs
reference it.

This change allows the removal of the last `queue_lock` usage to protect
`job->file_priv` and avoids possible NULL ptr dereference issues due to
lifetime mismatches.

Also, to simplify locking, replace both the global and per-fd locked
reset counters with atomics.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Co-developed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c   | 22 ++++------------------
 drivers/gpu/drm/v3d/v3d_drv.h   | 14 ++++----------
 drivers/gpu/drm/v3d/v3d_sched.c |  9 ++-------
 3 files changed, 10 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 0f5e29f57fa59bfa2890de51b9ca78cda33d1edc..4b441afcb602de08bd193d57649121e44ab31f2a 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -110,14 +110,12 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 		args->value = !!drm_gem_get_huge_mnt(dev);
 		return 0;
 	case DRM_V3D_PARAM_GLOBAL_RESET_COUNTER:
-		mutex_lock(&v3d->reset_lock);
-		args->value = v3d->reset_counter;
-		mutex_unlock(&v3d->reset_lock);
+		args->value = atomic_read(&v3d->reset_counter);
 		return 0;
 	case DRM_V3D_PARAM_CONTEXT_RESET_COUNTER:
-		mutex_lock(&v3d->reset_lock);
-		args->value = v3d_priv->reset_counter;
-		mutex_unlock(&v3d->reset_lock);
+		args->value = 0;
+		for (enum v3d_queue q = 0; q < V3D_MAX_QUEUES; q++)
+			args->value += atomic_read(&v3d_priv->stats[q]->reset_counter);
 		return 0;
 	default:
 		drm_dbg(dev, "Unknown parameter %d\n", args->param);
@@ -173,23 +171,11 @@ v3d_open(struct drm_device *dev, struct drm_file *file)
 static void
 v3d_postclose(struct drm_device *dev, struct drm_file *file)
 {
-	struct v3d_dev *v3d = to_v3d_dev(dev);
 	struct v3d_file_priv *v3d_priv = file->driver_priv;
-	unsigned long irqflags;
 	enum v3d_queue q;
 
 	for (q = 0; q < V3D_MAX_QUEUES; q++) {
-		struct v3d_queue_state *queue = &v3d->queue[q];
-		struct v3d_job *job = queue->active_job;
-
 		drm_sched_entity_destroy(&v3d_priv->sched_entity[q]);
-
-		if (job && job->base.entity == &v3d_priv->sched_entity[q]) {
-			spin_lock_irqsave(&queue->queue_lock, irqflags);
-			job->file_priv = NULL;
-			spin_unlock_irqrestore(&queue->queue_lock, irqflags);
-		}
-
 		v3d_stats_put(v3d_priv->stats[q]);
 	}
 
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 72c3f40715dae6e86e0c8356cb997cdf1cf03fae..3de485abd8fc274b361cd17a00cab189d8e69643 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -55,6 +55,8 @@ struct v3d_stats {
 	 * job queues, even the write side never is.
 	 */
 	seqcount_t lock;
+
+	atomic_t reset_counter;
 };
 
 struct v3d_queue_state {
@@ -203,10 +205,8 @@ struct v3d_dev {
 	 */
 	struct v3d_perfmon *global_perfmon;
 
-	/* Global reset counter. The counter must be incremented when
-	 * a GPU reset happens. It must be protected by @reset_lock.
-	 */
-	unsigned int reset_counter;
+	/* Global reset counter incremented on each GPU reset. */
+	atomic_t reset_counter;
 };
 
 static inline struct v3d_dev *
@@ -233,12 +233,6 @@ struct v3d_file_priv {
 
 	/* Stores the GPU stats for a specific queue for this fd. */
 	struct v3d_stats *stats[V3D_MAX_QUEUES];
-
-	/* Per-fd reset counter, must be incremented when a job submitted
-	 * by this fd causes a GPU reset. It must be protected by
-	 * &struct v3d_dev->reset_lock.
-	 */
-	unsigned int reset_counter;
 };
 
 struct v3d_bo {
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 5c387a152e33f5ccbca6a9af97675f050a2a701f..1855ef5b3b5fe4e2de1cf0b77bced3735c23ab15 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -701,8 +701,6 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job,
 			  enum v3d_queue q)
 {
 	struct v3d_job *job = to_v3d_job(sched_job);
-	struct v3d_file_priv *v3d_priv = job->file_priv;
-	unsigned long irqflags;
 	enum v3d_queue i;
 
 	mutex_lock(&v3d->reset_lock);
@@ -717,11 +715,8 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job,
 	/* get the GPU back into the init state */
 	v3d_reset(v3d);
 
-	v3d->reset_counter++;
-	spin_lock_irqsave(&v3d->queue[q].queue_lock, irqflags);
-	if (v3d_priv)
-		v3d_priv->reset_counter++;
-	spin_unlock_irqrestore(&v3d->queue[q].queue_lock, irqflags);
+	atomic_inc(&v3d->reset_counter);
+	atomic_inc(&job->client_stats->reset_counter);
 
 	for (i = 0; i < V3D_MAX_QUEUES; i++)
 		drm_sched_resubmit_jobs(&v3d->queue[i].sched);

-- 
2.53.0

