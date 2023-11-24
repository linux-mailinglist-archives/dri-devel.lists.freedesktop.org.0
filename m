Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB3D7F6A2C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 02:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0CB10E793;
	Fri, 24 Nov 2023 01:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82ED10E793
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 01:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3hpRcjCUSEBA7A2dQt/XcZ5EOMcup1mOHOH2/nV/flI=; b=Ic9yykmWyauBC26uLeE5HO01r1
 LfeQz/LuF+zyCN/u1RI3Q1zLe7WwMe8e9HUUIcogMNqpQYB0MxAm0yNDkaZgsGasbGExe/NoqbeKk
 9rRkX+SCTDwj09hQIxyrmOuM2DaxmLCztIgwzYbLSv6/OTpS+2qLmtL+XxFq39QR5xkqDirkAGQ4m
 5yRlKMUIppgH1a3Sb3145htEFLE8IwjWQakPVY+sN2yZ2KWiGuTjHCfewjGxwvNbZMns7OeJoKE3+
 e2FkrewJEXlHCNeJk6EYX4Rsmcy1LzRLhXegAvdsvJNOkhfL2EnUgKyOEMaRiR5bmkpY/TuPIb15A
 0zniuXqw==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r6Kz2-006Zga-Hc; Fri, 24 Nov 2023 02:27:53 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 17/17] drm/v3d: Create a CPU job extension for the copy
 performance query job
Date: Thu, 23 Nov 2023 21:47:13 -0300
Message-ID: <20231124012548.772095-18-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124012548.772095-1-mcanal@igalia.com>
References: <20231124012548.772095-1-mcanal@igalia.com>
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A CPU job is a type of job that performs operations that requires CPU
intervention. A copy performance query job is a job that copy the complete
or partial result of a query to a buffer. In order to copy the result of
a performance query to a buffer, we need to get the values from the
performance monitors.

So, create a user extension for the CPU job that enables the creation
of a copy performance query job. This user extension will allow the creation
of a CPU job that copy the results of a performance query to a BO with the
possibility to indicate the availability with a availability bit.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h    |  1 +
 drivers/gpu/drm/v3d/v3d_sched.c  | 66 ++++++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_submit.c | 81 ++++++++++++++++++++++++++++++++
 include/uapi/drm/v3d_drm.h       | 47 ++++++++++++++++++
 4 files changed, 195 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 77854581d348..6254db0482f4 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -322,6 +322,7 @@ enum v3d_cpu_job_type {
 	V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY,
 	V3D_CPU_JOB_TYPE_COPY_TIMESTAMP_QUERY,
 	V3D_CPU_JOB_TYPE_RESET_PERFORMANCE_QUERY,
+	V3D_CPU_JOB_TYPE_COPY_PERFORMANCE_QUERY,
 };
 
 struct v3d_timestamp_query {
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 8ebb1f3567f6..f1a8a6dc5436 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -450,6 +450,71 @@ v3d_reset_performance_queries(struct v3d_cpu_job *job)
 	}
 }
 
+static void
+v3d_write_performance_query_result(struct v3d_cpu_job *job, void *data, u32 query)
+{
+	struct v3d_performance_query_info *performance_query = &job->performance_query;
+	struct v3d_copy_query_results_info *copy = &job->copy;
+	struct v3d_file_priv *v3d_priv = job->base.file->driver_priv;
+	struct v3d_dev *v3d = job->base.v3d;
+	struct v3d_perfmon *perfmon;
+	u64 counter_values[V3D_PERFCNT_NUM];
+
+	for (int i = 0; i < performance_query->nperfmons; i++) {
+		perfmon = v3d_perfmon_find(v3d_priv,
+					   performance_query->queries[query].kperfmon_ids[i]);
+		if (!perfmon) {
+			DRM_DEBUG("Failed to find perfmon.");
+			continue;
+		}
+
+		v3d_perfmon_stop(v3d, perfmon, true);
+
+		memcpy(&counter_values[i * DRM_V3D_MAX_PERF_COUNTERS], perfmon->values,
+		       perfmon->ncounters * sizeof(u64));
+
+		v3d_perfmon_put(perfmon);
+	}
+
+	for (int i = 0; i < performance_query->ncounters; i++)
+		write_to_buffer(data, i, copy->do_64bit, counter_values[i]);
+}
+
+
+static void
+v3d_copy_performance_query(struct v3d_cpu_job *job)
+{
+	struct v3d_performance_query_info *performance_query = &job->performance_query;
+	struct v3d_copy_query_results_info *copy = &job->copy;
+	struct v3d_bo *bo = to_v3d_bo(job->base.bo[0]);
+	struct dma_fence *fence;
+	bool available, write_result;
+	u8 *data;
+
+	v3d_get_bo_vaddr(bo);
+
+	data = ((u8 *) bo->vaddr) + copy->offset;
+
+	for (int i = 0; i < performance_query->count; i++) {
+		fence = drm_syncobj_fence_get(performance_query->queries[i].syncobj);
+		available = fence ? dma_fence_is_signaled(fence) : false;
+
+		write_result = available || copy->do_partial;
+		if (write_result)
+			v3d_write_performance_query_result(job, data, i);
+
+		if (copy->availability_bit)
+			write_to_buffer(data, performance_query->ncounters,
+					copy->do_64bit, available ? 1u : 0u);
+
+		data += copy->stride;
+
+		dma_fence_put(fence);
+	}
+
+	v3d_put_bo_vaddr(bo);
+}
+
 static struct dma_fence *
 v3d_cpu_job_run(struct drm_sched_job *sched_job)
 {
@@ -464,6 +529,7 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
 		[V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY] = v3d_reset_timestamp_queries,
 		[V3D_CPU_JOB_TYPE_COPY_TIMESTAMP_QUERY] = v3d_copy_query_results,
 		[V3D_CPU_JOB_TYPE_RESET_PERFORMANCE_QUERY] = v3d_reset_performance_queries,
+		[V3D_CPU_JOB_TYPE_COPY_PERFORMANCE_QUERY] = v3d_copy_performance_query,
 	};
 
 	v3d->cpu_job = job;
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index b7d0e1ccea6b..3d60b85eb123 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -677,6 +677,84 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 	return 0;
 }
 
+static int
+v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
+					  struct drm_v3d_extension __user *ext,
+					  struct v3d_cpu_job *job)
+{
+	u32 __user *syncs;
+	u64 __user *kperfmon_ids;
+	struct drm_v3d_copy_performance_query copy;
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
+	if (copy_from_user(&copy, ext, sizeof(copy)))
+		return -EFAULT;
+
+	if (copy.pad)
+		return -EINVAL;
+
+	job->job_type = V3D_CPU_JOB_TYPE_COPY_PERFORMANCE_QUERY;
+
+	job->performance_query.queries = kvmalloc_array(copy.count,
+							sizeof(struct v3d_performance_query),
+							GFP_KERNEL);
+	if (!job->performance_query.queries)
+		return -ENOMEM;
+
+	syncs = u64_to_user_ptr(copy.syncs);
+	kperfmon_ids = u64_to_user_ptr(copy.kperfmon_ids);
+
+	for (int i = 0; i < copy.count; i++) {
+		u32 sync;
+		u64 ids;
+		u32 __user *ids_pointer;
+		u32 id;
+
+		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
+			kvfree(job->performance_query.queries);
+			return -EFAULT;
+		}
+
+		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+
+		if (copy_from_user(&ids, kperfmon_ids++, sizeof(ids))) {
+			kvfree(job->performance_query.queries);
+			return -EFAULT;
+		}
+
+		ids_pointer = u64_to_user_ptr(ids);
+
+		for (int j = 0; j < copy.nperfmons; j++) {
+			if (copy_from_user(&id, ids_pointer++, sizeof(id))) {
+				kvfree(job->performance_query.queries);
+				return -EFAULT;
+			}
+
+			job->performance_query.queries[i].kperfmon_ids[j] = id;
+		}
+	}
+	job->performance_query.count = copy.count;
+	job->performance_query.nperfmons = copy.nperfmons;
+	job->performance_query.ncounters = copy.ncounters;
+
+	job->copy.do_64bit = copy.do_64bit;
+	job->copy.do_partial = copy.do_partial;
+	job->copy.availability_bit = copy.availability_bit;
+	job->copy.offset = copy.offset;
+	job->copy.stride = copy.stride;
+
+	return 0;
+}
+
 /* Whenever userspace sets ioctl extensions, v3d_get_extensions parses data
  * according to the extension id (name).
  */
@@ -717,6 +795,9 @@ v3d_get_extensions(struct drm_file *file_priv,
 		case DRM_V3D_EXT_ID_CPU_RESET_PERFORMANCE_QUERY:
 			ret = v3d_get_cpu_reset_performance_params(file_priv, user_ext, job);
 			break;
+		case DRM_V3D_EXT_ID_CPU_COPY_PERFORMANCE_QUERY:
+			ret = v3d_get_cpu_copy_performance_query_params(file_priv, user_ext, job);
+			break;
 		default:
 			DRM_DEBUG_DRIVER("Unknown extension id: %d\n", ext.id);
 			return -EINVAL;
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 833afdc5cc7c..d3643a25e6e3 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -77,6 +77,7 @@ struct drm_v3d_extension {
 #define DRM_V3D_EXT_ID_CPU_RESET_TIMESTAMP_QUERY	0x04
 #define DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY	0x05
 #define DRM_V3D_EXT_ID_CPU_RESET_PERFORMANCE_QUERY	0x06
+#define DRM_V3D_EXT_ID_CPU_COPY_PERFORMANCE_QUERY	0x07
 	__u32 flags; /* mbz */
 };
 
@@ -519,6 +520,52 @@ struct drm_v3d_reset_performance_query {
 	__u64 kperfmon_ids;
 };
 
+/**
+ * struct drm_v3d_copy_performance_query - ioctl extension for the CPU job to copy
+ * performance query results to a buffer
+ *
+ * When an extension DRM_V3D_EXT_ID_CPU_COPY_PERFORMANCE_QUERY is defined, it
+ * points to this extension to define a copy performance query submission. This
+ * CPU job will copy the performance queries results to a BO with the offset
+ * and stride defined in the extension.
+ */
+struct drm_v3d_copy_performance_query {
+	struct drm_v3d_extension base;
+
+	/* Define if should write to buffer using 64 or 32 bits */
+	__u8 do_64bit;
+
+	/* Define if it can write to buffer even if the query is not available */
+	__u8 do_partial;
+
+	/* Define if it should write availability bit to buffer */
+	__u8 availability_bit;
+
+	/* mbz */
+	__u8 pad;
+
+	/* Offset of the buffer in the BO */
+	__u32 offset;
+
+	/* Stride of the buffer in the BO */
+	__u32 stride;
+
+	/* Number of performance monitors */
+	__u32 nperfmons;
+
+	/* Number of performance counters related to this query pool */
+	__u32 ncounters;
+
+	/* Number of queries */
+	__u32 count;
+
+	/* Array of performance queries's syncobjs to indicate its availability */
+	__u64 syncs;
+
+	/* Array of u64 user-pointers that point to an array of kperfmon_ids */
+	__u64 kperfmon_ids;
+};
+
 struct drm_v3d_submit_cpu {
 	/* Pointer to a u32 array of the BOs that are referenced by the job. */
 	__u64 bo_handles;
-- 
2.41.0

