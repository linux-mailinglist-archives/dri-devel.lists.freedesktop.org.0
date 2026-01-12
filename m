Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E405AD12673
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C1910E3AE;
	Mon, 12 Jan 2026 11:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qOyibviV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB8110E39F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XqawZ19c56sp/BXSg/x5/jNxbB84CnFczhXKKe2USF8=; b=qOyibviVdqVIlXPL6T8jeuC4OA
 zZP18w9wL6cc4wVdlX3uQwFKLpsfaLC/tRvO3OisTEC/jFEdIY2xHVE/54RiT3Uy/mIzOugmadMSR
 bR5w0u2AqdZ2pnGxmwYe93S1VVyHnjsr+3Lw/6dqDAyDVJxS3jOAUEUffkjS4awC/h+zIijJbNW+U
 Wl+fCilaqn1F6KfpBGcwMJs2cTDo7iTfOpbvCvKDSGlrVWUfOPEoSrQ+LtgrqmjBBbk5nxhibDuOF
 iD7YHrT92/DFhPr2NJz1AHOzboL20Sko7ZZUNyUJ5eA5/cR8sDofedwfejiCiK2+a2E3KoaNquHZn
 feHwgcKw==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vfGTn-004Nyi-Lb; Mon, 12 Jan 2026 12:53:03 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 12 Jan 2026 08:51:37 -0300
Subject: [PATCH v2 2/2] drm/v3d: Convert v3d logging to device-based DRM
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260112-v3d-drm-debug-v2-2-8ef6244c97bb@igalia.com>
References: <20260112-v3d-drm-debug-v2-0-8ef6244c97bb@igalia.com>
In-Reply-To: <20260112-v3d-drm-debug-v2-0-8ef6244c97bb@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18239; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=ek+IX8tRgTnKf0uYRXbJt0oLrTDbzrApO7j8zzI946A=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpZOCWCHdFWd0itULLa8odXdguJo8gnUPdrDSy5
 fEZeJ9PaqiJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaWTglgAKCRA/8w6Kdoj6
 qjzsB/4iJAUGRg3Y7pcuOvB0ZR6srfWUrWroCJB/oAg9ZWUshejHPpLdn70wDByaXqn1rCpWyEH
 QOQiAj8TAll6ist+fHWy94/rBhu8TFjwwrYba6jGGE46qo061tlfXr3fBsROvvx64/BV0syo+HN
 8E58VN4MrJID1cPq6937l7RSqHlnx190DZ4Vm/yGlyq4CIIZ/9msKFmCahLTmS2Nb1+MBYClsYC
 GUBAWeGd35h2R9j0PpnliZloREwRRpAQH07zrE44H8vZ1cg255rmz5tL1pqmc0hF1SgistJ4YMq
 c3wOH0sYUDcAvCPNi8z0/aS3LTzbb8jUtyXB9hamglu4IsCK
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

Replace legacy DRM_DEBUG/INFO/WARN/ERROR logging with the corresponding
device-based drm_dbg(), drm_info(), drm_warn() and drm_err() helpers.
For some messages, adjust the log level to better reflect their severity.

This allows filtering via drm.debug, reduces log spam, and helps
differentiate v3d logs from vc4 logs.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_bo.c     |  8 ++---
 drivers/gpu/drm/v3d/v3d_drv.c    |  6 ++--
 drivers/gpu/drm/v3d/v3d_gem.c    | 16 +++++-----
 drivers/gpu/drm/v3d/v3d_irq.c    |  8 ++---
 drivers/gpu/drm/v3d/v3d_mmu.c    |  6 ++--
 drivers/gpu/drm/v3d/v3d_sched.c  |  6 ++--
 drivers/gpu/drm/v3d/v3d_submit.c | 66 ++++++++++++++++++++++------------------
 7 files changed, 62 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index c4316b768b3dad0b76e93b95e7c0dcc9dbf081f9..36aae97cf6da7aabd68dc56138e0105f74ab661b 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -213,7 +213,7 @@ int v3d_create_bo_ioctl(struct drm_device *dev, void *data,
 	int ret;
 
 	if (args->flags != 0) {
-		DRM_INFO("unknown create_bo flags: %d\n", args->flags);
+		drm_dbg(dev, "unknown create_bo flags: %d\n", args->flags);
 		return -EINVAL;
 	}
 
@@ -236,13 +236,13 @@ int v3d_mmap_bo_ioctl(struct drm_device *dev, void *data,
 	struct drm_gem_object *gem_obj;
 
 	if (args->flags != 0) {
-		DRM_INFO("unknown mmap_bo flags: %d\n", args->flags);
+		drm_dbg(dev, "unknown mmap_bo flags: %d\n", args->flags);
 		return -EINVAL;
 	}
 
 	gem_obj = drm_gem_object_lookup(file_priv, args->handle);
 	if (!gem_obj) {
-		DRM_DEBUG("Failed to look up GEM BO %d\n", args->handle);
+		drm_dbg(dev, "Failed to look up GEM BO %d\n", args->handle);
 		return -ENOENT;
 	}
 
@@ -261,7 +261,7 @@ int v3d_get_bo_offset_ioctl(struct drm_device *dev, void *data,
 
 	gem_obj = drm_gem_object_lookup(file_priv, args->handle);
 	if (!gem_obj) {
-		DRM_DEBUG("Failed to look up GEM BO %d\n", args->handle);
+		drm_dbg(dev, "Failed to look up GEM BO %d\n", args->handle);
 		return -ENOENT;
 	}
 	bo = to_v3d_bo(gem_obj);
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index a11ca276061a8462977ed3d837ffcc96b2f444f6..8de4f151a5c02cbf970e72933d1a275968088357 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -120,7 +120,7 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 		mutex_unlock(&v3d->reset_lock);
 		return 0;
 	default:
-		DRM_DEBUG("Unknown parameter %d\n", args->param);
+		drm_dbg(dev, "Unknown parameter %d\n", args->param);
 		return -EINVAL;
 	}
 }
@@ -297,7 +297,7 @@ v3d_idle_sms(struct v3d_dev *v3d)
 
 	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
 				    V3D_SMS_STATE) == V3D_SMS_IDLE), 100)) {
-		DRM_ERROR("Failed to power up SMS\n");
+		drm_err(&v3d->drm, "Failed to power up SMS\n");
 	}
 
 	v3d_reset_sms(v3d);
@@ -313,7 +313,7 @@ v3d_power_off_sms(struct v3d_dev *v3d)
 
 	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
 				    V3D_SMS_STATE) == V3D_SMS_POWER_OFF_STATE), 100)) {
-		DRM_ERROR("Failed to power off SMS\n");
+		drm_err(&v3d->drm, "Failed to power off SMS\n");
 	}
 }
 
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 697b0b3ca92cf8f4cc7910a2a7b01ea43c79fe11..57965c0d6f6efea0019fb0b1a47addf2f586d138 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -52,7 +52,7 @@ v3d_idle_axi(struct v3d_dev *v3d, int core)
 		      (V3D_GMP_STATUS_RD_COUNT_MASK |
 		       V3D_GMP_STATUS_WR_COUNT_MASK |
 		       V3D_GMP_STATUS_CFG_BUSY)) == 0, 100)) {
-		DRM_ERROR("Failed to wait for safe GMP shutdown\n");
+		drm_err(&v3d->drm, "Failed to wait for safe GMP shutdown\n");
 	}
 }
 
@@ -67,7 +67,7 @@ v3d_idle_gca(struct v3d_dev *v3d)
 	if (wait_for((V3D_GCA_READ(V3D_GCA_SAFE_SHUTDOWN_ACK) &
 		      V3D_GCA_SAFE_SHUTDOWN_ACK_ACKED) ==
 		     V3D_GCA_SAFE_SHUTDOWN_ACK_ACKED, 100)) {
-		DRM_ERROR("Failed to wait for safe GCA shutdown\n");
+		drm_err(&v3d->drm, "Failed to wait for safe GCA shutdown\n");
 	}
 }
 
@@ -117,7 +117,7 @@ v3d_reset_sms(struct v3d_dev *v3d)
 				     V3D_SMS_STATE) == V3D_SMS_ISOLATING_FOR_RESET) &&
 		     !(V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_REE_CS),
 				     V3D_SMS_STATE) == V3D_SMS_RESETTING), 100)) {
-		DRM_ERROR("Failed to wait for SMS reset\n");
+		drm_err(&v3d->drm, "Failed to wait for SMS reset\n");
 	}
 }
 
@@ -126,9 +126,9 @@ v3d_reset(struct v3d_dev *v3d)
 {
 	struct drm_device *dev = &v3d->drm;
 
-	DRM_DEV_ERROR(dev->dev, "Resetting GPU for hang.\n");
-	DRM_DEV_ERROR(dev->dev, "V3D_ERR_STAT: 0x%08x\n",
-		      V3D_CORE_READ(0, V3D_ERR_STAT));
+	drm_err(dev, "Resetting GPU for hang.\n");
+	drm_err(dev, "V3D_ERR_STAT: 0x%08x\n", V3D_CORE_READ(0, V3D_ERR_STAT));
+
 	trace_v3d_reset_begin(dev);
 
 	/* XXX: only needed for safe powerdown, not reset. */
@@ -216,7 +216,7 @@ v3d_clean_caches(struct v3d_dev *v3d)
 	V3D_CORE_WRITE(core, V3D_CTL_L2TCACTL, V3D_L2TCACTL_TMUWCF);
 	if (wait_for(!(V3D_CORE_READ(core, V3D_CTL_L2TCACTL) &
 		       V3D_L2TCACTL_TMUWCF), 100)) {
-		DRM_ERROR("Timeout waiting for TMU write combiner flush\n");
+		drm_err(dev, "Timeout waiting for TMU write combiner flush\n");
 	}
 
 	mutex_lock(&v3d->cache_clean_lock);
@@ -226,7 +226,7 @@ v3d_clean_caches(struct v3d_dev *v3d)
 
 	if (wait_for(!(V3D_CORE_READ(core, V3D_CTL_L2TCACTL) &
 		       V3D_L2TCACTL_L2TFLS), 100)) {
-		DRM_ERROR("Timeout waiting for L2T clean\n");
+		drm_err(dev, "Timeout waiting for L2T clean\n");
 	}
 
 	mutex_unlock(&v3d->cache_clean_lock);
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index b55880fd6c508bd47a27c15db3fd8d21ded2dbd1..1249f6e64b979fe29cf2b9bfc43b39aa755f71ce 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -50,7 +50,7 @@ v3d_overflow_mem_work(struct work_struct *work)
 	unsigned long irqflags;
 
 	if (IS_ERR(bo)) {
-		DRM_ERROR("Couldn't allocate binner overflow mem\n");
+		drm_err(dev, "Couldn't allocate binner overflow mem\n");
 		return;
 	}
 	obj = &bo->base.base;
@@ -140,7 +140,7 @@ v3d_irq(int irq, void *arg)
 	 * always-allowed mode.
 	 */
 	if (v3d->ver < V3D_GEN_71 && (intsts & V3D_INT_GMPV))
-		dev_err(v3d->drm.dev, "GMP violation\n");
+		drm_err(&v3d->drm, "GMP violation\n");
 
 	/* V3D 4.2 wires the hub and core IRQs together, so if we &
 	 * didn't see the common one then check hub for MMU IRQs.
@@ -226,7 +226,7 @@ v3d_hub_irq(int irq, void *arg)
 			}
 		}
 
-		dev_err(v3d->drm.dev, "MMU error from client %s (0x%x) at 0x%llx%s%s%s\n",
+		drm_dbg(&v3d->drm, "MMU error from client %s (0x%x) at 0x%llx%s%s%s\n",
 			client, axi_id, (long long)vio_addr,
 			((intsts & V3D_HUB_INT_MMU_WRV) ?
 			 ", write violation" : ""),
@@ -238,7 +238,7 @@ v3d_hub_irq(int irq, void *arg)
 	}
 
 	if (v3d->ver >= V3D_GEN_71 && (intsts & V3D_V7_HUB_INT_GMPV)) {
-		dev_err(v3d->drm.dev, "GMP Violation\n");
+		drm_err(&v3d->drm, "GMP Violation\n");
 		status = IRQ_HANDLED;
 	}
 
diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c b/drivers/gpu/drm/v3d/v3d_mmu.c
index a25d25a8ae617bf68e133e1793cd0bb930bb07f6..c513a393c0313772650fd6d7236127b2dc4101d9 100644
--- a/drivers/gpu/drm/v3d/v3d_mmu.c
+++ b/drivers/gpu/drm/v3d/v3d_mmu.c
@@ -18,6 +18,8 @@
  * each client. This is not yet implemented.
  */
 
+#include <drm/drm_print.h>
+
 #include "v3d_drv.h"
 #include "v3d_regs.h"
 
@@ -125,7 +127,7 @@ void v3d_mmu_insert_ptes(struct v3d_bo *bo)
 		     shmem_obj->base.size >> V3D_MMU_PAGE_SHIFT);
 
 	if (v3d_mmu_flush_all(v3d))
-		dev_err(v3d->drm.dev, "MMU flush timeout\n");
+		drm_err(&v3d->drm, "MMU flush timeout\n");
 }
 
 void v3d_mmu_remove_ptes(struct v3d_bo *bo)
@@ -138,5 +140,5 @@ void v3d_mmu_remove_ptes(struct v3d_bo *bo)
 		v3d->pt[page] = 0;
 
 	if (v3d_mmu_flush_all(v3d))
-		dev_err(v3d->drm.dev, "MMU flush timeout\n");
+		drm_err(&v3d->drm, "MMU flush timeout\n");
 }
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 0867250db7a64fb79c50c99aa46551343cdac249..6dc871fc9a62303da4fbc62b612c3a797fe762de 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -585,7 +585,7 @@ v3d_reset_performance_queries(struct v3d_cpu_job *job)
 			perfmon = v3d_perfmon_find(v3d_priv,
 						   performance_query->queries[i].kperfmon_ids[j]);
 			if (!perfmon) {
-				DRM_DEBUG("Failed to find perfmon.");
+				drm_dbg(&v3d->drm, "Failed to find perfmon.");
 				continue;
 			}
 
@@ -620,7 +620,7 @@ v3d_write_performance_query_result(struct v3d_cpu_job *job, void *data,
 		perfmon = v3d_perfmon_find(v3d_priv,
 					   perf_query->kperfmon_ids[i]);
 		if (!perfmon) {
-			DRM_DEBUG("Failed to find perfmon.");
+			drm_dbg(&v3d->drm, "Failed to find perfmon.");
 			continue;
 		}
 
@@ -690,7 +690,7 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
 	struct v3d_dev *v3d = job->base.v3d;
 
 	if (job->job_type >= ARRAY_SIZE(cpu_job_function)) {
-		DRM_DEBUG_DRIVER("Unknown CPU job: %d\n", job->job_type);
+		drm_dbg(&v3d->drm, "Unknown CPU job: %d\n", job->job_type);
 		return NULL;
 	}
 
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 55e810b7417dc673a0625473d9369c814c18bec6..794c3571662de7eb566bf4c0561571d7618dd234 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -76,7 +76,7 @@ v3d_lookup_bos(struct drm_device *dev,
 		/* See comment on bo_index for why we have to check
 		 * this.
 		 */
-		DRM_DEBUG("Rendering requires BOs\n");
+		drm_warn(dev, "Rendering requires BOs\n");
 		return -EINVAL;
 	}
 
@@ -138,11 +138,11 @@ void v3d_job_put(struct v3d_job *job)
 }
 
 static int
-v3d_job_allocate(void **container, size_t size)
+v3d_job_allocate(struct v3d_dev *v3d, void **container, size_t size)
 {
 	*container = kcalloc(1, size, GFP_KERNEL);
 	if (!*container) {
-		DRM_ERROR("Cannot allocate memory for V3D job.\n");
+		drm_err(&v3d->drm, "Cannot allocate memory for V3D job.\n");
 		return -ENOMEM;
 	}
 
@@ -183,7 +183,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 
 				if (copy_from_user(&in, handle++, sizeof(in))) {
 					ret = -EFAULT;
-					DRM_DEBUG("Failed to copy wait dep handle.\n");
+					drm_dbg(&v3d->drm, "Failed to copy wait dep handle.\n");
 					goto fail_deps;
 				}
 				ret = drm_sched_job_add_syncobj_dependency(&job->base, file_priv, in.handle, 0);
@@ -276,7 +276,7 @@ v3d_setup_csd_jobs_and_bos(struct drm_file *file_priv,
 {
 	int ret;
 
-	ret = v3d_job_allocate((void *)job, sizeof(**job));
+	ret = v3d_job_allocate(v3d, (void *)job, sizeof(**job));
 	if (ret)
 		return ret;
 
@@ -287,7 +287,7 @@ v3d_setup_csd_jobs_and_bos(struct drm_file *file_priv,
 		return ret;
 	}
 
-	ret = v3d_job_allocate((void *)clean_job, sizeof(**clean_job));
+	ret = v3d_job_allocate(v3d, (void *)clean_job, sizeof(**clean_job));
 	if (ret)
 		return ret;
 
@@ -326,6 +326,8 @@ v3d_get_multisync_post_deps(struct drm_file *file_priv,
 			    struct v3d_submit_ext *se,
 			    u32 count, u64 handles)
 {
+	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
+	struct v3d_dev *v3d = v3d_priv->v3d;
 	struct drm_v3d_sem __user *post_deps;
 	int i, ret;
 
@@ -346,7 +348,7 @@ v3d_get_multisync_post_deps(struct drm_file *file_priv,
 
 		if (copy_from_user(&out, post_deps++, sizeof(out))) {
 			ret = -EFAULT;
-			DRM_DEBUG("Failed to copy post dep handles\n");
+			drm_dbg(&v3d->drm, "Failed to copy post dep handles\n");
 			goto fail;
 		}
 
@@ -377,11 +379,13 @@ v3d_get_multisync_submit_deps(struct drm_file *file_priv,
 			      struct drm_v3d_extension __user *ext,
 			      struct v3d_submit_ext *se)
 {
+	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
+	struct v3d_dev *v3d = v3d_priv->v3d;
 	struct drm_v3d_multi_sync multisync;
 	int ret;
 
 	if (se->in_sync_count || se->out_sync_count) {
-		DRM_DEBUG("Two multisync extensions were added to the same job.");
+		drm_dbg(&v3d->drm, "Two multisync extensions were added to the same job.");
 		return -EINVAL;
 	}
 
@@ -442,7 +446,7 @@ v3d_get_cpu_indirect_csd_params(struct drm_file *file_priv,
 		return -EFAULT;
 
 	if (!v3d_has_csd(v3d)) {
-		DRM_DEBUG("Attempting CSD submit on non-CSD hardware.\n");
+		drm_warn(&v3d->drm, "Attempting CSD submit on non-CSD hardware.\n");
 		return -EINVAL;
 	}
 
@@ -804,6 +808,8 @@ v3d_get_extensions(struct drm_file *file_priv,
 		   struct v3d_submit_ext *se,
 		   struct v3d_cpu_job *job)
 {
+	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
+	struct v3d_dev *v3d = v3d_priv->v3d;
 	struct drm_v3d_extension __user *user_ext;
 	int ret;
 
@@ -812,7 +818,7 @@ v3d_get_extensions(struct drm_file *file_priv,
 		struct drm_v3d_extension ext;
 
 		if (copy_from_user(&ext, user_ext, sizeof(ext))) {
-			DRM_DEBUG("Failed to copy submit extension\n");
+			drm_dbg(&v3d->drm, "Failed to copy submit extension\n");
 			return -EFAULT;
 		}
 
@@ -839,7 +845,7 @@ v3d_get_extensions(struct drm_file *file_priv,
 			ret = v3d_get_cpu_copy_performance_query_params(file_priv, user_ext, job);
 			break;
 		default:
-			DRM_DEBUG_DRIVER("Unknown extension id: %d\n", ext.id);
+			drm_dbg(&v3d->drm, "Unknown V3D extension ID: %d\n", ext.id);
 			return -EINVAL;
 		}
 
@@ -887,19 +893,19 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	if (args->flags &&
 	    args->flags & ~(DRM_V3D_SUBMIT_CL_FLUSH_CACHE |
 			    DRM_V3D_SUBMIT_EXTENSION)) {
-		DRM_INFO("invalid flags: %d\n", args->flags);
+		drm_dbg(dev, "invalid flags: %d\n", args->flags);
 		return -EINVAL;
 	}
 
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
 		ret = v3d_get_extensions(file_priv, args->extensions, &se, NULL);
 		if (ret) {
-			DRM_DEBUG("Failed to get extensions.\n");
+			drm_dbg(dev, "Failed to get extensions.\n");
 			return ret;
 		}
 	}
 
-	ret = v3d_job_allocate((void *)&render, sizeof(*render));
+	ret = v3d_job_allocate(v3d, (void *)&render, sizeof(*render));
 	if (ret)
 		return ret;
 
@@ -915,7 +921,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	INIT_LIST_HEAD(&render->unref_list);
 
 	if (args->bcl_start != args->bcl_end) {
-		ret = v3d_job_allocate((void *)&bin, sizeof(*bin));
+		ret = v3d_job_allocate(v3d, (void *)&bin, sizeof(*bin));
 		if (ret)
 			goto fail;
 
@@ -935,7 +941,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & DRM_V3D_SUBMIT_CL_FLUSH_CACHE) {
-		ret = v3d_job_allocate((void *)&clean_job, sizeof(*clean_job));
+		ret = v3d_job_allocate(v3d, (void *)&clean_job, sizeof(*clean_job));
 		if (ret)
 			goto fail;
 
@@ -1053,19 +1059,19 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	trace_v3d_submit_tfu_ioctl(&v3d->drm, args->iia);
 
 	if (args->flags && !(args->flags & DRM_V3D_SUBMIT_EXTENSION)) {
-		DRM_DEBUG("invalid flags: %d\n", args->flags);
+		drm_dbg(dev, "invalid flags: %d\n", args->flags);
 		return -EINVAL;
 	}
 
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
 		ret = v3d_get_extensions(file_priv, args->extensions, &se, NULL);
 		if (ret) {
-			DRM_DEBUG("Failed to get extensions.\n");
+			drm_dbg(dev, "Failed to get extensions.\n");
 			return ret;
 		}
 	}
 
-	ret = v3d_job_allocate((void *)&job, sizeof(*job));
+	ret = v3d_job_allocate(v3d, (void *)&job, sizeof(*job));
 	if (ret)
 		return ret;
 
@@ -1095,9 +1101,9 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 
 		bo = drm_gem_object_lookup(file_priv, args->bo_handles[job->base.bo_count]);
 		if (!bo) {
-			DRM_DEBUG("Failed to look up GEM BO %d: %d\n",
-				  job->base.bo_count,
-				  args->bo_handles[job->base.bo_count]);
+			drm_dbg(dev, "Failed to look up GEM BO %d: %d\n",
+				job->base.bo_count,
+				args->bo_handles[job->base.bo_count]);
 			ret = -ENOENT;
 			goto fail;
 		}
@@ -1157,19 +1163,19 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 
 	if (!v3d_has_csd(v3d)) {
-		DRM_DEBUG("Attempting CSD submit on non-CSD hardware\n");
+		drm_warn(dev, "Attempting CSD submit on non-CSD hardware\n");
 		return -EINVAL;
 	}
 
 	if (args->flags && !(args->flags & DRM_V3D_SUBMIT_EXTENSION)) {
-		DRM_INFO("invalid flags: %d\n", args->flags);
+		drm_dbg(dev, "invalid flags: %d\n", args->flags);
 		return -EINVAL;
 	}
 
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
 		ret = v3d_get_extensions(file_priv, args->extensions, &se, NULL);
 		if (ret) {
-			DRM_DEBUG("Failed to get extensions.\n");
+			drm_dbg(dev, "Failed to get extensions.\n");
 			return ret;
 		}
 	}
@@ -1263,31 +1269,31 @@ v3d_submit_cpu_ioctl(struct drm_device *dev, void *data,
 	int ret;
 
 	if (args->flags && !(args->flags & DRM_V3D_SUBMIT_EXTENSION)) {
-		DRM_INFO("Invalid flags: %d\n", args->flags);
+		drm_dbg(dev, "Invalid flags: %d\n", args->flags);
 		return -EINVAL;
 	}
 
-	ret = v3d_job_allocate((void *)&cpu_job, sizeof(*cpu_job));
+	ret = v3d_job_allocate(v3d, (void *)&cpu_job, sizeof(*cpu_job));
 	if (ret)
 		return ret;
 
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
 		ret = v3d_get_extensions(file_priv, args->extensions, &se, cpu_job);
 		if (ret) {
-			DRM_DEBUG("Failed to get extensions.\n");
+			drm_dbg(dev, "Failed to get extensions.\n");
 			goto fail;
 		}
 	}
 
 	/* Every CPU job must have a CPU job user extension */
 	if (!cpu_job->job_type) {
-		DRM_DEBUG("CPU job must have a CPU job user extension.\n");
+		drm_dbg(dev, "CPU job must have a CPU job user extension.\n");
 		ret = -EINVAL;
 		goto fail;
 	}
 
 	if (args->bo_handle_count != cpu_job_bo_handle_count[cpu_job->job_type]) {
-		DRM_DEBUG("This CPU job was not submitted with the proper number of BOs.\n");
+		drm_dbg(dev, "This CPU job was not submitted with the proper number of BOs.\n");
 		ret = -EINVAL;
 		goto fail;
 	}

-- 
2.52.0

