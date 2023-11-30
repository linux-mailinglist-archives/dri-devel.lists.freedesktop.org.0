Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 255FD7FF6A4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 17:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C9310E73F;
	Thu, 30 Nov 2023 16:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B0710E73F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 16:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QfZ8sdMytiyG2rQqUXEfaHjW6zQZJoQ9iC1hwUGa8Rs=; b=Uz+DzjsrD+X0ldS3MSexviazY/
 fG0h8SWobs22t0euVVYCyyesf/0hP920fyaoj6WwOCpLgsByg63PxSGNduPuYcOnT9lmOpM44x5Vn
 U/w+/bW/UUeRmBySTq2fS/RcwDKBO8f7vav1E/lw0DoKYQIIcRRLaABlOyhbspFv4TGdAhO+a232z
 Z6r0p/nzGYD8pHEGp3LEk5K+dTR19J6cm66EBUHAbs4rflGWoxv2h198CQpcsn+etapY45eCG3eGy
 1tYL29953pkJlGAE5k/06VY8Aey/ohjpfjYVBBxo4TLsYIcM6luTkzrqq6WAdv3uLfHChX4pZAqoh
 /RiVs6vQ==;
Received: from [177.34.169.138] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r8kAf-008scY-Tf; Thu, 30 Nov 2023 17:45:50 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 13/17] drm/v3d: Create a CPU job extension for the
 timestamp query job
Date: Thu, 30 Nov 2023 13:40:36 -0300
Message-ID: <20231130164420.932823-15-mcanal@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130164420.932823-2-mcanal@igalia.com>
References: <20231130164420.932823-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A CPU job is a type of job that performs operations that requires CPU
intervention. A timestamp query job is a job that calculates the
query timestamp and updates the query availability by signaling a
syncobj. As V3D doesn't provide any mechanism to obtain a timestamp
from the GPU, it is a job that needs CPU intervention.

So, create a user extension for the CPU job that enables the creation
of a timestamp query job. This user extension will allow the creation of
a CPU job that performs the timestamp query calculation and updates the
timestamp BO with the proper value.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h    | 17 +++++++++
 drivers/gpu/drm/v3d/v3d_sched.c  | 40 +++++++++++++++++++-
 drivers/gpu/drm/v3d/v3d_submit.c | 63 ++++++++++++++++++++++++++++++++
 include/uapi/drm/v3d_drm.h       | 30 +++++++++++++++
 4 files changed, 149 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 202c0d4b04a5..dd86e745c260 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -318,6 +318,15 @@ struct v3d_csd_job {
 
 enum v3d_cpu_job_type {
 	V3D_CPU_JOB_TYPE_INDIRECT_CSD = 1,
+	V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY,
+};
+
+struct v3d_timestamp_query {
+	/* Offset of this query in the timestamp BO for its value. */
+	u32 offset;
+
+	/* Syncobj that indicates the timestamp availability */
+	struct drm_syncobj *syncobj;
 };
 
 struct v3d_indirect_csd_info {
@@ -345,12 +354,20 @@ struct v3d_indirect_csd_info {
 	struct ww_acquire_ctx acquire_ctx;
 };
 
+struct v3d_timestamp_query_info {
+	struct v3d_timestamp_query *queries;
+
+	u32 count;
+};
+
 struct v3d_cpu_job {
 	struct v3d_job base;
 
 	enum v3d_cpu_job_type job_type;
 
 	struct v3d_indirect_csd_info indirect_csd;
+
+	struct v3d_timestamp_query_info timestamp_query;
 };
 
 typedef void (*v3d_cpu_job_fn)(struct v3d_cpu_job *);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 597e4ec3d28d..f4cffefb6398 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -21,6 +21,8 @@
 #include <linux/sched/clock.h>
 #include <linux/kthread.h>
 
+#include <drm/drm_syncobj.h>
+
 #include "v3d_drv.h"
 #include "v3d_regs.h"
 #include "v3d_trace.h"
@@ -71,6 +73,21 @@ v3d_sched_job_free(struct drm_sched_job *sched_job)
 	v3d_job_cleanup(job);
 }
 
+static void
+v3d_cpu_job_free(struct drm_sched_job *sched_job)
+{
+	struct v3d_cpu_job *job = to_cpu_job(sched_job);
+	struct v3d_timestamp_query_info *timestamp_query = &job->timestamp_query;
+
+	if (timestamp_query->queries) {
+		for (int i = 0; i < timestamp_query->count; i++)
+			drm_syncobj_put(timestamp_query->queries[i].syncobj);
+		kvfree(timestamp_query->queries);
+	}
+
+	v3d_job_cleanup(&job->base);
+}
+
 static void
 v3d_switch_perfmon(struct v3d_dev *v3d, struct v3d_job *job)
 {
@@ -305,8 +322,29 @@ v3d_rewrite_csd_job_wg_counts_from_indirect(struct v3d_cpu_job *job)
 	v3d_put_bo_vaddr(bo);
 }
 
+static void
+v3d_timestamp_query(struct v3d_cpu_job *job)
+{
+	struct v3d_timestamp_query_info *timestamp_query = &job->timestamp_query;
+	struct v3d_bo *bo = to_v3d_bo(job->base.bo[0]);
+	u8 *value_addr;
+
+	v3d_get_bo_vaddr(bo);
+
+	for (int i = 0; i < timestamp_query->count; i++) {
+		value_addr = ((u8 *) bo->vaddr) + timestamp_query->queries[i].offset;
+		*((u64 *) value_addr) = i == 0 ? ktime_get_ns() : 0ull;
+
+		drm_syncobj_replace_fence(timestamp_query->queries[i].syncobj,
+					  job->base.done_fence);
+	}
+
+	v3d_put_bo_vaddr(bo);
+}
+
 static const v3d_cpu_job_fn cpu_job_function[] = {
 	[V3D_CPU_JOB_TYPE_INDIRECT_CSD] = v3d_rewrite_csd_job_wg_counts_from_indirect,
+	[V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY] = v3d_timestamp_query,
 };
 
 static struct dma_fence *
@@ -504,7 +542,7 @@ static const struct drm_sched_backend_ops v3d_cache_clean_sched_ops = {
 static const struct drm_sched_backend_ops v3d_cpu_sched_ops = {
 	.run_job = v3d_cpu_job_run,
 	.timedout_job = v3d_generic_job_timedout,
-	.free_job = v3d_sched_job_free
+	.free_job = v3d_cpu_job_free
 };
 
 int
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 0320695b941b..83e029e786ea 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -433,6 +433,64 @@ v3d_get_cpu_indirect_csd_params(struct drm_file *file_priv,
 					  NULL, &info->acquire_ctx);
 }
 
+/* Get data for the query timestamp job submission. */
+static int
+v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
+				   struct drm_v3d_extension __user *ext,
+				   struct v3d_cpu_job *job)
+{
+	u32 __user *offsets, *syncs;
+	struct drm_v3d_timestamp_query timestamp;
+
+	if (!job) {
+		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
+		return -EINVAL;
+	}
+
+	if (job->job_type) {
+		DRM_DEBUG("Two CPU job extensions were added to the same CPU job.\n");
+		return -EINVAL;
+	}
+
+	if (copy_from_user(&timestamp, ext, sizeof(timestamp)))
+		return -EFAULT;
+
+	if (timestamp.pad)
+		return -EINVAL;
+
+	job->job_type = V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY;
+
+	job->timestamp_query.queries = kvmalloc_array(timestamp.count,
+						      sizeof(struct v3d_timestamp_query),
+						      GFP_KERNEL);
+	if (!job->timestamp_query.queries)
+		return -ENOMEM;
+
+	offsets = u64_to_user_ptr(timestamp.offsets);
+	syncs = u64_to_user_ptr(timestamp.syncs);
+
+	for (int i = 0; i < timestamp.count; i++) {
+		u32 offset, sync;
+
+		if (copy_from_user(&offset, offsets++, sizeof(offset))) {
+			kvfree(job->timestamp_query.queries);
+			return -EFAULT;
+		}
+
+		job->timestamp_query.queries[i].offset = offset;
+
+		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
+			kvfree(job->timestamp_query.queries);
+			return -EFAULT;
+		}
+
+		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+	}
+	job->timestamp_query.count = timestamp.count;
+
+	return 0;
+}
+
 /* Whenever userspace sets ioctl extensions, v3d_get_extensions parses data
  * according to the extension id (name).
  */
@@ -461,6 +519,9 @@ v3d_get_extensions(struct drm_file *file_priv,
 		case DRM_V3D_EXT_ID_CPU_INDIRECT_CSD:
 			ret = v3d_get_cpu_indirect_csd_params(file_priv, user_ext, job);
 			break;
+		case DRM_V3D_EXT_ID_CPU_TIMESTAMP_QUERY:
+			ret = v3d_get_cpu_timestamp_query_params(file_priv, user_ext, job);
+			break;
 		default:
 			DRM_DEBUG_DRIVER("Unknown extension id: %d\n", ext.id);
 			return -EINVAL;
@@ -837,6 +898,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 
 static const unsigned int cpu_job_bo_handle_count[] = {
 	[V3D_CPU_JOB_TYPE_INDIRECT_CSD] = 1,
+	[V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY] = 1,
 };
 
 /**
@@ -974,6 +1036,7 @@ v3d_submit_cpu_ioctl(struct drm_device *dev, void *data,
 	v3d_job_cleanup((void *)csd_job);
 	v3d_job_cleanup(clean_job);
 	v3d_put_multisync_post_deps(&se);
+	kvfree(cpu_job->timestamp_query.queries);
 
 	return ret;
 }
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 0c0f47782528..239801b5e117 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -73,6 +73,7 @@ struct drm_v3d_extension {
 	__u32 id;
 #define DRM_V3D_EXT_ID_MULTI_SYNC			0x01
 #define DRM_V3D_EXT_ID_CPU_INDIRECT_CSD		0x02
+#define DRM_V3D_EXT_ID_CPU_TIMESTAMP_QUERY		0x03
 	__u32 flags; /* mbz */
 };
 
@@ -400,11 +401,40 @@ struct drm_v3d_indirect_csd {
 	__u32 wg_uniform_offsets[3];
 };
 
+/**
+ * struct drm_v3d_timestamp_query - ioctl extension for the CPU job to calculate
+ * a timestamp query
+ *
+ * When an extension DRM_V3D_EXT_ID_TIMESTAMP_QUERY is defined, it points to
+ * this extension to define a timestamp query submission. This CPU job will
+ * calculate the timestamp query and update the query value within the
+ * timestamp BO. Moreover, it will signal the timestamp syncobj to indicate
+ * query availability.
+ */
+struct drm_v3d_timestamp_query {
+	struct drm_v3d_extension base;
+
+	/* Array of queries' offsets within the timestamp BO for their value */
+	__u64 offsets;
+
+	/* Array of timestamp's syncobjs to indicate its availability */
+	__u64 syncs;
+
+	/* Number of queries */
+	__u32 count;
+
+	/* mbz */
+	__u32 pad;
+};
+
 struct drm_v3d_submit_cpu {
 	/* Pointer to a u32 array of the BOs that are referenced by the job.
 	 *
 	 * For DRM_V3D_EXT_ID_CPU_INDIRECT_CSD, it must contain only one BO,
 	 * that contains the workgroup counts.
+	 *
+	 * For DRM_V3D_EXT_ID_TIMESTAMP_QUERY, it must contain only one BO,
+	 * that will contain the timestamp.
 	 */
 	__u64 bo_handles;
 
-- 
2.42.0

