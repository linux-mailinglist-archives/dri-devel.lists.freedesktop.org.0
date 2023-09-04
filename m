Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD2A791C33
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 19:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9BE10E3CC;
	Mon,  4 Sep 2023 17:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F6C10E3CC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 17:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ho2T5F2oF3K2oB08862Wy90G/XI6JTpb6knJXvs+p/A=; b=V1I/brDD0C8bpHweiyKKQNQri0
 lpwlIp2e9HhBzvNha/uOrKgNIwhbMWPY6dWMbk27PKAFjdDcXcdxz1YRy/75d58xvggNjJr2sGss+
 De3XWpbTlL4Vv2Za84SiZTJVccIcXypc+2C1C6azcrBCeCOWOFuJLKvJgTB+ZWNkrBbU6gaAOKspm
 a/bgmXNnw9dsrnVtj0QLIjhonzuNc3GQrN4gI2uSFefAcjhZFvTIlNTJX2XYksGDW/uFGJS6AdTTt
 n/PgnHlvFOY1YX5dHEqvbU68gP0etcNXV41VQ5N8uNP8BOSSJX7edTcfQiL2k2Tza2zvymhm05tZK
 3UgRqyoQ==;
Received: from [187.36.235.191] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qdDk2-0028nB-8m; Mon, 04 Sep 2023 19:52:02 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 16/17] drm/v3d: Create a CPU job extension for the reset
 performance query job
Date: Mon,  4 Sep 2023 14:39:04 -0300
Message-ID: <20230904175019.1172713-17-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904175019.1172713-1-mcanal@igalia.com>
References: <20230904175019.1172713-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A CPU job is a type of job that performs operations that requires CPU
intervention. A reset performance query job is a job that resets the
performance queries by resetting the values of the perfmons. Moreover,
we also reset the syncobjs related to the availability of the query.

So, create a user extension for the CPU job that enables the creation
of a reset performance job. This user extension will allow the creation of
a CPU job that resets the perfmons values and resets the availability syncobj.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h    | 31 ++++++++++++++
 drivers/gpu/drm/v3d/v3d_sched.c  | 36 ++++++++++++++++
 drivers/gpu/drm/v3d/v3d_submit.c | 73 ++++++++++++++++++++++++++++++++
 include/uapi/drm/v3d_drm.h       | 27 ++++++++++++
 4 files changed, 167 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 0cb629b116f1..0da88dcea01a 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -241,6 +241,9 @@ struct v3d_job {
 	 */
 	struct v3d_perfmon *perfmon;
 
+	/* File descriptor of the process that submitted the job */
+	struct drm_file *file;
+
 	/* Callback for the freeing of the job on refcount going to 0. */
 	void (*free)(struct kref *ref);
 };
@@ -293,6 +296,7 @@ enum v3d_cpu_job_type {
 	V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY,
 	V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY,
 	V3D_CPU_JOB_TYPE_COPY_TIMESTAMP_QUERY,
+	V3D_CPU_JOB_TYPE_RESET_PERFORMANCE_QUERY,
 };
 
 struct v3d_timestamp_query {
@@ -303,6 +307,18 @@ struct v3d_timestamp_query {
 	struct drm_syncobj *syncobj;
 };
 
+/* Number of perfmons required to handle all supported performance counters */
+#define V3D_MAX_PERFMONS DIV_ROUND_UP(V3D_PERFCNT_NUM, \
+				      DRM_V3D_MAX_PERF_COUNTERS)
+
+struct v3d_performance_query {
+	/* Performance monitor IDs for this query */
+	u32 kperfmon_ids[V3D_MAX_PERFMONS];
+
+	/* Syncobj that indicates the query availability */
+	struct drm_syncobj *syncobj;
+};
+
 struct v3d_indirect_csd_info {
 	/* Indirect CSD */
 	struct v3d_csd_job *job;
@@ -334,6 +350,19 @@ struct v3d_timestamp_query_info {
 	u32 count;
 };
 
+struct v3d_performance_query_info {
+	struct v3d_performance_query *queries;
+
+	/* Number of performance queries */
+	u32 count;
+
+	/* Number of performance monitors related to that query pool */
+	u32 nperfmons;
+
+	/* Number of performance counters related to that query pool */
+	u32 ncounters;
+};
+
 struct v3d_copy_query_results_info {
 	/* Define if should write to buffer using 64 or 32 bits */
 	bool do_64bit;
@@ -361,6 +390,8 @@ struct v3d_cpu_job {
 	struct v3d_timestamp_query_info timestamp_query;
 
 	struct v3d_copy_query_results_info copy;
+
+	struct v3d_performance_query_info performance_query;
 };
 
 struct v3d_submit_outsync {
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index b3664fb5aeef..b1964bc75d02 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -76,6 +76,7 @@ v3d_cpu_job_free(struct drm_sched_job *sched_job)
 {
 	struct v3d_cpu_job *job = to_cpu_job(sched_job);
 	struct v3d_timestamp_query_info *timestamp_query = &job->timestamp_query;
+	struct v3d_performance_query_info *performance_query = &job->performance_query;
 
 	if (timestamp_query->queries) {
 		for (int i = 0; i < timestamp_query->count; i++)
@@ -83,6 +84,12 @@ v3d_cpu_job_free(struct drm_sched_job *sched_job)
 		kvfree(timestamp_query->queries);
 	}
 
+	if (performance_query->queries) {
+		for (int i = 0; i < performance_query->count; i++)
+			drm_syncobj_put(performance_query->queries[i].syncobj);
+		kvfree(performance_query->queries);
+	}
+
 	v3d_job_cleanup(&job->base);
 }
 
@@ -393,6 +400,34 @@ v3d_copy_query_results(struct v3d_cpu_job *job)
 	v3d_put_bo_vaddr(bo);
 }
 
+static void
+v3d_reset_performance_queries(struct v3d_cpu_job *job)
+{
+	struct v3d_performance_query_info *performance_query = &job->performance_query;
+	struct v3d_file_priv *v3d_priv = job->base.file->driver_priv;
+	struct v3d_dev *v3d = job->base.v3d;
+	struct v3d_perfmon *perfmon;
+
+	for (int i = 0; i < performance_query->count; i++) {
+		for (int j = 0; j < performance_query->nperfmons; j++) {
+			perfmon = v3d_perfmon_find(v3d_priv,
+						   performance_query->queries[i].kperfmon_ids[j]);
+			if (!perfmon) {
+				DRM_DEBUG("Failed to find perfmon.");
+				continue;
+			}
+
+			v3d_perfmon_stop(v3d, perfmon, false);
+
+			memset(perfmon->values, 0, perfmon->ncounters * sizeof(u64));
+
+			v3d_perfmon_put(perfmon);
+		}
+
+		drm_syncobj_replace_fence(performance_query->queries[i].syncobj, NULL);
+	}
+}
+
 static struct dma_fence *
 v3d_cpu_job_run(struct drm_sched_job *sched_job)
 {
@@ -404,6 +439,7 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
 		[V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY] = v3d_timestamp_query,
 		[V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY] = v3d_reset_timestamp_queries,
 		[V3D_CPU_JOB_TYPE_COPY_TIMESTAMP_QUERY] = v3d_copy_query_results,
+		[V3D_CPU_JOB_TYPE_RESET_PERFORMANCE_QUERY] = v3d_reset_performance_queries,
 	};
 
 	v3d->cpu_job = job;
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 9a41e8044011..fb4c68352f4f 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -167,6 +167,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	job = *container;
 	job->v3d = v3d;
 	job->free = free;
+	job->file = file_priv;
 
 	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
 				 v3d_priv);
@@ -608,6 +609,74 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 	return 0;
 }
 
+static int
+v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
+				     struct drm_v3d_extension __user *ext,
+				     struct v3d_cpu_job *job)
+{
+	u32 __user *syncs;
+	u64 __user *kperfmon_ids;
+	struct drm_v3d_reset_performance_query reset;
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
+	if (copy_from_user(&reset, ext, sizeof(reset)))
+		return -EFAULT;
+
+	job->job_type = V3D_CPU_JOB_TYPE_RESET_PERFORMANCE_QUERY;
+
+	job->performance_query.queries = kvmalloc_array(reset.count,
+							sizeof(struct v3d_performance_query),
+							GFP_KERNEL);
+	if (!job->performance_query.queries)
+		return -ENOMEM;
+
+	syncs = u64_to_user_ptr(reset.syncs);
+	kperfmon_ids = u64_to_user_ptr(reset.kperfmon_ids);
+
+	for (int i = 0; i < reset.count; i++) {
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
+		for (int j = 0; j < reset.nperfmons; j++) {
+			if (copy_from_user(&id, ids_pointer++, sizeof(id))) {
+				kvfree(job->performance_query.queries);
+				return -EFAULT;
+			}
+
+			job->performance_query.queries[i].kperfmon_ids[j] = id;
+		}
+	}
+	job->performance_query.count = reset.count;
+	job->performance_query.nperfmons = reset.nperfmons;
+
+	return 0;
+}
+
 /* Whenever userspace sets ioctl extensions, v3d_get_extensions parses data
  * according to the extension id (name).
  */
@@ -645,6 +714,9 @@ v3d_get_extensions(struct drm_file *file_priv,
 		case DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY:
 			ret = v3d_get_cpu_copy_query_results_params(file_priv, user_ext, job);
 			break;
+		case DRM_V3D_EXT_ID_CPU_RESET_PERFORMANCE_QUERY:
+			ret = v3d_get_cpu_reset_performance_params(file_priv, user_ext, job);
+			break;
 		default:
 			DRM_DEBUG_DRIVER("Unknown extension id: %d\n", ext.id);
 			return -EINVAL;
@@ -1134,6 +1206,7 @@ v3d_submit_cpu_ioctl(struct drm_device *dev, void *data,
 	v3d_job_cleanup(clean_job);
 	v3d_put_multisync_post_deps(&se);
 	kvfree(cpu_job->timestamp_query.queries);
+	kvfree(cpu_job->performance_query.queries);
 
 	return ret;
 }
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index c6b5a2549302..6d5303413758 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -76,6 +76,7 @@ struct drm_v3d_extension {
 #define DRM_V3D_EXT_ID_CPU_TIMESTAMP_QUERY		0x03
 #define DRM_V3D_EXT_ID_CPU_RESET_TIMESTAMP_QUERY	0x04
 #define DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY	0x05
+#define DRM_V3D_EXT_ID_CPU_RESET_PERFORMANCE_QUERY	0x06
 	__u32 flags; /* mbz */
 };
 
@@ -487,6 +488,32 @@ struct drm_v3d_copy_timestamp_query {
 	__u64 syncs;
 };
 
+/**
+ * struct drm_v3d_reset_performance_query - ioctl extension for the CPU job to
+ * reset performance queries
+ *
+ * When an extension DRM_V3D_EXT_ID_CPU_RESET_PERFORMANCE_QUERY is defined, it
+ * points to this extension to define a reset performance submission. This CPU
+ * job will reset the performance queries by resetting the values of the
+ * performance monitors. Moreover, it will reset the syncobj to reset query
+ * availability.
+ */
+struct drm_v3d_reset_performance_query {
+	struct drm_v3d_extension base;
+
+	/* Array of performance queries's syncobjs to indicate its availability */
+	__u64 syncs;
+
+	/* Number of queries */
+	__u32 count;
+
+	/* Number of performance monitors */
+	__u32 nperfmons;
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

