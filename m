Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1522FD0BDC0
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF8610E921;
	Fri,  9 Jan 2026 18:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ggn5Yfp2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D06410E921
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 18:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mdaWKEBABM59qh3rTCa6z0yk5uRZcBFZppoz+W/Z/Xg=; b=ggn5Yfp2bj1hGbfhoKXXy4uvYP
 /JyLk+pGwmj9uBWKppJsiERQJQmcyT6HTbpyt+TXjn/ppN2lgCwAuOA9yQ+UKC/gDoyXBed1oAz8M
 7gIh42GCI6mbyGJqha0KjXwuJ27Vd+FA6dXTQ0tFsij07/22ERaCFH0f0qVJ06QcbwxHvqyhotKNQ
 SgzorHIpzI4WWYCgPMfJmFnRMOSdw/YZJdlUhRQ16SMA96WraSo/X+DTPreCoyrwLYZw8cYy25Y71
 e/5x9oG20dKdVdfXBeCeGFDonwYADshCcuZQ5ZYt4vbZIorHkdJFy4d4fyqdMNGxFt8giTwV7Sf0T
 AZq9WuLA==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1veHLV-003Wwc-5u; Fri, 09 Jan 2026 19:36:25 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 09 Jan 2026 15:35:52 -0300
Subject: [PATCH 2/2] drm/v3d: Convert v3d logging to device-based DRM helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260109-v3d-drm-debug-v1-2-02041c873e4d@igalia.com>
References: <20260109-v3d-drm-debug-v1-0-02041c873e4d@igalia.com>
In-Reply-To: <20260109-v3d-drm-debug-v1-0-02041c873e4d@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18774; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=fvosR66vXnbHUcDeQeQ+oSBylzP9eQ4NplLJ7FJpB7M=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpYUqh/itV191oosvE+mIdgKRtgPp/6mK5IM601
 LjPXZsVNQOJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaWFKoQAKCRA/8w6Kdoj6
 qpbLB/kBLwA7TeWhVC7hfwcg9pw+LCOHqXysGS4Vm9XaTUEAFv7PXzJ712qQqKuL2NDA2wCLbWU
 HyfuJj3rfliyBq/wGF3kVMq3Jz+7Qzo1ze3AR8zE7jRLEJmfN07AEVgbCEl8omIslmP0qRkExC0
 muHdaLJ2rbogFRBCI+BkSCWljW+PnvptPlVqllx5SkkgZuj7S4Juc91XHBCp2hsj403Xym0ZhD/
 t5R7bBIFWYfeX43DVAvTnJBVB+a8T62g7DiFYivuIq//uPnUx1f808I9ryB0yc4lIjHgsINWk2e
 DS2Ny3et1q5qAwhhd3rLXeckt92LSaNoSlG3Or9bolCiKAq9
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
 drivers/gpu/drm/v3d/v3d_gem.c    | 16 ++++-----
 drivers/gpu/drm/v3d/v3d_irq.c    |  8 ++---
 drivers/gpu/drm/v3d/v3d_mmu.c    |  6 ++--
 drivers/gpu/drm/v3d/v3d_sched.c  |  6 ++--
 drivers/gpu/drm/v3d/v3d_submit.c | 70 +++++++++++++++++++++-------------------
 7 files changed, 62 insertions(+), 58 deletions(-)

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
index 697b0b3ca92cf8f4cc7910a2a7b01ea43c79fe11..de7f13fb59d342ac15d0f4be1f37c189f95c2742 100644
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
+	drm_warn(dev, "Resetting GPU for hang.\n");
+	drm_warn(dev, "V3D_ERR_STAT: 0x%08x\n", V3D_CORE_READ(0, V3D_ERR_STAT));
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
index 4eb2aa0c207cd5f41519340a02663cc88b0e12c6..f8655f3f3f7ba1ddaeae57fa6359a7f79cd8b655 100644
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
 
@@ -322,7 +322,8 @@ v3d_put_multisync_post_deps(struct v3d_submit_ext *se)
 }
 
 static int
-v3d_get_multisync_post_deps(struct drm_file *file_priv,
+v3d_get_multisync_post_deps(struct v3d_dev *v3d,
+			    struct drm_file *file_priv,
 			    struct v3d_submit_ext *se,
 			    u32 count, u64 handles)
 {
@@ -346,7 +347,7 @@ v3d_get_multisync_post_deps(struct drm_file *file_priv,
 
 		if (copy_from_user(&out, post_deps++, sizeof(out))) {
 			ret = -EFAULT;
-			DRM_DEBUG("Failed to copy post dep handles\n");
+			drm_dbg(&v3d->drm, "Failed to copy post dep handles\n");
 			goto fail;
 		}
 
@@ -373,7 +374,8 @@ v3d_get_multisync_post_deps(struct drm_file *file_priv,
  * to be signaled when job completes (out_sync).
  */
 static int
-v3d_get_multisync_submit_deps(struct drm_file *file_priv,
+v3d_get_multisync_submit_deps(struct v3d_dev *v3d,
+			      struct drm_file *file_priv,
 			      struct drm_v3d_extension __user *ext,
 			      struct v3d_submit_ext *se)
 {
@@ -381,7 +383,7 @@ v3d_get_multisync_submit_deps(struct drm_file *file_priv,
 	int ret;
 
 	if (se->in_sync_count || se->out_sync_count) {
-		DRM_DEBUG("Two multisync extensions were added to the same job.");
+		drm_dbg(&v3d->drm, "Two multisync extensions were added to the same job.");
 		return -EINVAL;
 	}
 
@@ -391,7 +393,7 @@ v3d_get_multisync_submit_deps(struct drm_file *file_priv,
 	if (multisync.pad)
 		return -EINVAL;
 
-	ret = v3d_get_multisync_post_deps(file_priv, se, multisync.out_sync_count,
+	ret = v3d_get_multisync_post_deps(v3d, file_priv, se, multisync.out_sync_count,
 					  multisync.out_syncs);
 	if (ret)
 		return ret;
@@ -438,7 +440,7 @@ v3d_get_cpu_indirect_csd_params(struct v3d_dev *v3d,
 		return -EFAULT;
 
 	if (!v3d_has_csd(v3d)) {
-		DRM_DEBUG("Attempting CSD submit on non-CSD hardware.\n");
+		drm_warn(&v3d->drm, "Attempting CSD submit on non-CSD hardware.\n");
 		return -EINVAL;
 	}
 
@@ -815,13 +817,13 @@ v3d_get_extensions(struct drm_file *file_priv,
 		struct drm_v3d_extension ext;
 
 		if (copy_from_user(&ext, user_ext, sizeof(ext))) {
-			DRM_DEBUG("Failed to copy submit extension\n");
+			drm_dbg(&v3d->drm, "Failed to copy submit extension\n");
 			return -EFAULT;
 		}
 
 		switch (ext.id) {
 		case DRM_V3D_EXT_ID_MULTI_SYNC:
-			ret = v3d_get_multisync_submit_deps(file_priv, user_ext, se);
+			ret = v3d_get_multisync_submit_deps(v3d, file_priv, user_ext, se);
 			break;
 		case DRM_V3D_EXT_ID_CPU_INDIRECT_CSD:
 			ret = v3d_get_cpu_indirect_csd_params(v3d, file_priv, user_ext, job);
@@ -842,7 +844,7 @@ v3d_get_extensions(struct drm_file *file_priv,
 			ret = v3d_get_cpu_copy_performance_query_params(v3d, file_priv, user_ext, job);
 			break;
 		default:
-			DRM_DEBUG_DRIVER("Unknown extension id: %d\n", ext.id);
+			drm_dbg(&v3d->drm, "Unknown V3D extension ID: %d\n", ext.id);
 			return -EINVAL;
 		}
 
@@ -890,19 +892,19 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
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
 
@@ -918,7 +920,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	INIT_LIST_HEAD(&render->unref_list);
 
 	if (args->bcl_start != args->bcl_end) {
-		ret = v3d_job_allocate((void *)&bin, sizeof(*bin));
+		ret = v3d_job_allocate(v3d, (void *)&bin, sizeof(*bin));
 		if (ret)
 			goto fail;
 
@@ -938,7 +940,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & DRM_V3D_SUBMIT_CL_FLUSH_CACHE) {
-		ret = v3d_job_allocate((void *)&clean_job, sizeof(*clean_job));
+		ret = v3d_job_allocate(v3d, (void *)&clean_job, sizeof(*clean_job));
 		if (ret)
 			goto fail;
 
@@ -1056,19 +1058,19 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
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
 
@@ -1098,9 +1100,9 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 
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
@@ -1160,19 +1162,19 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
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
@@ -1266,31 +1268,31 @@ v3d_submit_cpu_ioctl(struct drm_device *dev, void *data,
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

