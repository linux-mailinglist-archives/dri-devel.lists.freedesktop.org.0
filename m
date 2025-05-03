Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F902AA82D2
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 23:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F6D10E223;
	Sat,  3 May 2025 21:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="p0tLPdJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AE910E225;
 Sat,  3 May 2025 21:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xfZZt+vzuN/cPJGSMAENG1eDJtoetByz4RJ1hYSzpXg=; b=p0tLPdJJalLSmstSw52yEtGMCv
 sgDarmUnu5/Ak0j9dZkKKRMGhudIpnmCBOkRbanYfv9Cmn5bRl3H3aSTWmQc71QqNGhCQq/idiOei
 /FBZTcfm1ibazIw+HhZqP3XV1SnJNUrC6B7/UXe6aPwHTDHLhquBs4r+U3n8jMq0NPLkVzUoTWtrJ
 qJP1okJJKIHMEn/Eayzj2k2dsOkOGUnC3ds9+3g8keAMJDQFhhY7Na4DlSKOYqu7ytpzAMpWo+kw9
 cKD9GfipyzfmYOBN+FqNSE7pXx0h6zyoZq3NCgIzEb72miQPPRk1Y5B65f7vy7xHp6UqartrC58W1
 uS6cD6Lw==;
Received: from [189.7.87.174] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uBJvz-002dbs-Kv; Sat, 03 May 2025 23:00:36 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 03 May 2025 17:59:52 -0300
Subject: [PATCH 1/8] drm/sched: Allow drivers to skip the reset and keep on
 running
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250503-sched-skip-reset-v1-1-ed0d6701a3fe@igalia.com>
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
In-Reply-To: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3592; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=2dSaHkQbmmh2OrihTk6+Yc1Tv3uCny6NoSa53AqNXjc=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoFoPmbTQYAYvCQQhH8uWHvSL8w4/jNRIzqCOYu
 C9TTtSKFoeJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaBaD5gAKCRA/8w6Kdoj6
 qtfXCACPqXiNZEEmCkUvxTae7KfNP1tukPinWiuJGumJpMMg8uf3dKNQA/sx8Kl7NZebN4HB+uH
 NOPMMp6kMn2CAodoXkik+yNxFwzmElfcVLW604y4UipaXpOQFXe22qCvo3m1/ojZHJ0ijpXoPDi
 5/NdgbcFa9sBkYMPHxUR8Yu+ABYSj6roUqx9ahq4v2eru5d0T6EagcWalgkl5+ZjWRAO5wyDcTN
 xMu75AGbPV+4/eSiT2NWruxFcx68feTh5iy5K2A02oxfsPcKwgzH5oboBMyvsiQF2ve2cHADIiY
 MhWweebI6KUvmB86rqJ9BBNUkGJRolDyetHjY1vHcYVbEpvR
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

When the DRM scheduler times out, it's possible that the GPU isn't hung;
instead, a job may still be running, and there may be no valid reason to
reset the hardware. This can occur in two situations:

  1. The GPU exposes some mechanism that ensures the GPU is still making
     progress. By checking this mechanism, we can safely skip the reset,
     rearm the timeout, and allow the job to continue running until
     completion. This is the case for v3d and Etnaviv.
  2. TDR has fired before the IRQ that signals the fence. Consequently,
     the job actually finishes, but it triggers a timeout before signaling
     the completion fence.

These two scenarios are problematic because we remove the job from the
`sched->pending_list` before calling `sched->ops->timedout_job()`. This
means that when the job finally signals completion (e.g. in the IRQ
handler), the scheduler won't call `sched->ops->free_job()`. As a result,
the job and its resources won't be freed, leading to a memory leak.

To resolve this issue, we create a new `drm_gpu_sched_stat` that allows a
driver to skip the reset. This new status will indicate that the job
should be reinserted into the pending list, and the driver will still
signal its completion.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 14 ++++++++++++++
 include/drm/gpu_scheduler.h            |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 829579c41c6b5d8b2abce5ad373c7017469b7680..68ca827d77e32187a034309f881135dbc639a9b4 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -568,6 +568,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
 			job->sched->ops->free_job(job);
 			sched->free_guilty = false;
 		}
+
+		/*
+		 * If the driver indicated that the GPU is still running and wants to skip
+		 * the reset, reinsert the job back into the pending list and realarm the
+		 * timeout.
+		 */
+		if (status == DRM_GPU_SCHED_STAT_RUNNING) {
+			spin_lock(&sched->job_list_lock);
+			list_add(&job->list, &sched->pending_list);
+			spin_unlock(&sched->job_list_lock);
+		}
 	} else {
 		spin_unlock(&sched->job_list_lock);
 	}
@@ -590,6 +601,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
  * This function is typically used for reset recovery (see the docu of
  * drm_sched_backend_ops.timedout_job() for details). Do not call it for
  * scheduler teardown, i.e., before calling drm_sched_fini().
+ *
+ * As it's used for reset recovery, drm_sched_stop() shouldn't be called
+ * if the scheduler skipped the timeout (DRM_SCHED_STAT_RUNNING).
  */
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 {
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 1a7e377d4cbb4fc12ed93c548b236970217945e8..fe9043b6d43141bee831b5fc16b927202a507d51 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -389,11 +389,13 @@ struct drm_sched_job {
  * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
  * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
  * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
+ * @DRM_GPU_SCHED_STAT_RUNNING: GPU is still running, so skip the reset.
  */
 enum drm_gpu_sched_stat {
 	DRM_GPU_SCHED_STAT_NONE,
 	DRM_GPU_SCHED_STAT_NOMINAL,
 	DRM_GPU_SCHED_STAT_ENODEV,
+	DRM_GPU_SCHED_STAT_RUNNING,
 };
 
 /**

-- 
2.49.0

