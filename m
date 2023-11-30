Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E597FF6A6
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 17:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9885C10E742;
	Thu, 30 Nov 2023 16:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AF110E742
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ug+j3HcVirfC3zvlULiblw55kw8k0lFlQPhSnPQZ5s4=; b=pXAIUxyQJ4hIr7b7jS2gIlSIA1
 H2pNWGWDbco/pGuk+coB0N6E5909wQTzlNMh2anf1yDA0LBoyCfCRZQ78zGV+uOh8Fle6jXAwYzcs
 aX7giZ76NCn7Bc+Va/6QKErSrwvcANKGi4IbNLtUVQf6VCyW9i8GfCL4OHfvZ9fNozM4IdykOeKE+
 D+fydKHOs5FDZcS5GBPNu47sZOhNg4XXsC5xAeS/JLx7Mv1i9Go8sgzriyeM5V2eOeB+uoFIK36s/
 Cizg7+byeSvLUWHI50h9ylAB5AV0iAJ3cCQk2aP4rekncISlzbDGNvi/CFJOwILx3+/x4JkWgYlaj
 nbOQmYYw==;
Received: from [177.34.169.138] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r8kAq-008scY-Py; Thu, 30 Nov 2023 17:46:01 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 16/17] drm/v3d: Create a CPU job extension for the reset
 performance query job
Date: Thu, 30 Nov 2023 13:40:39 -0300
Message-ID: <20231130164420.932823-18-mcanal@igalia.com>
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
intervention. A reset performance query job is a job that resets the
performance queries by resetting the values of the perfmons. Moreover,
we also reset the syncobjs related to the availability of the query.

So, create a user extension for the CPU job that enables the creation
of a reset performance job. This user extension will allow the creation of
a CPU job that resets the perfmons values and resets the availability syncobj.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h    | 28 ++++++++++++
 drivers/gpu/drm/v3d/v3d_sched.c  | 37 ++++++++++++++++
 drivers/gpu/drm/v3d/v3d_submit.c | 73 ++++++++++++++++++++++++++++++++
 include/uapi/drm/v3d_drm.h       | 30 +++++++++++++
 4 files changed, 168 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 5058a354fffd..0f7f80ad8d88 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -321,6 +321,7 @@ enum v3d_cpu_job_type {
 	V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY,
 	V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY,
 	V3D_CPU_JOB_TYPE_COPY_TIMESTAMP_QUERY,
+	V3D_CPU_JOB_TYPE_RESET_PERFORMANCE_QUERY,
 };
 
 struct v3d_timestamp_query {
@@ -331,6 +332,18 @@ struct v3d_timestamp_query {
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
@@ -362,6 +375,19 @@ struct v3d_timestamp_query_info {
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
@@ -389,6 +415,8 @@ struct v3d_cpu_job {
 	struct v3d_timestamp_query_info timestamp_query;
 
 	struct v3d_copy_query_results_info copy;
+
+	struct v3d_performance_query_info performance_query;
 };
 
 typedef void (*v3d_cpu_job_fn)(struct v3d_cpu_job *);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 07c897cd3423..452c4a1db52e 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -78,6 +78,7 @@ v3d_cpu_job_free(struct drm_sched_job *sched_job)
 {
 	struct v3d_cpu_job *job = to_cpu_job(sched_job);
 	struct v3d_timestamp_query_info *timestamp_query = &job->timestamp_query;
+	struct v3d_performance_query_info *performance_query = &job->performance_query;
 
 	if (timestamp_query->queries) {
 		for (int i = 0; i < timestamp_query->count; i++)
@@ -85,6 +86,12 @@ v3d_cpu_job_free(struct drm_sched_job *sched_job)
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
 
@@ -361,6 +368,7 @@ v3d_reset_timestamp_queries(struct v3d_cpu_job *job)
 
 	v3d_put_bo_vaddr(bo);
 }
+
 static void
 write_to_buffer(void *dst, u32 idx, bool do_64bit, u64 value)
 {
@@ -414,11 +422,40 @@ v3d_copy_query_results(struct v3d_cpu_job *job)
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
 static const v3d_cpu_job_fn cpu_job_function[] = {
 	[V3D_CPU_JOB_TYPE_INDIRECT_CSD] = v3d_rewrite_csd_job_wg_counts_from_indirect,
 	[V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY] = v3d_timestamp_query,
 	[V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY] = v3d_reset_timestamp_queries,
 	[V3D_CPU_JOB_TYPE_COPY_TIMESTAMP_QUERY] = v3d_copy_query_results,
+	[V3D_CPU_JOB_TYPE_RESET_PERFORMANCE_QUERY] = v3d_reset_performance_queries,
 };
 
 static struct dma_fence *
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index bafd49c6440c..20af8ae14831 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -604,6 +604,74 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
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
@@ -641,6 +709,9 @@ v3d_get_extensions(struct drm_file *file_priv,
 		case DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY:
 			ret = v3d_get_cpu_copy_query_results_params(file_priv, user_ext, job);
 			break;
+		case DRM_V3D_EXT_ID_CPU_RESET_PERFORMANCE_QUERY:
+			ret = v3d_get_cpu_reset_performance_params(file_priv, user_ext, job);
+			break;
 		default:
 			DRM_DEBUG_DRIVER("Unknown extension id: %d\n", ext.id);
 			return -EINVAL;
@@ -1020,6 +1091,7 @@ static const unsigned int cpu_job_bo_handle_count[] = {
 	[V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY] = 1,
 	[V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY] = 1,
 	[V3D_CPU_JOB_TYPE_COPY_TIMESTAMP_QUERY] = 2,
+	[V3D_CPU_JOB_TYPE_RESET_PERFORMANCE_QUERY] = 0,
 };
 
 /**
@@ -1158,6 +1230,7 @@ v3d_submit_cpu_ioctl(struct drm_device *dev, void *data,
 	v3d_job_cleanup(clean_job);
 	v3d_put_multisync_post_deps(&se);
 	kvfree(cpu_job->timestamp_query.queries);
+	kvfree(cpu_job->performance_query.queries);
 
 	return ret;
 }
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index f7defbf3d043..d609bdf29fd6 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -76,6 +76,7 @@ struct drm_v3d_extension {
 #define DRM_V3D_EXT_ID_CPU_TIMESTAMP_QUERY		0x03
 #define DRM_V3D_EXT_ID_CPU_RESET_TIMESTAMP_QUERY	0x04
 #define DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY	0x05
+#define DRM_V3D_EXT_ID_CPU_RESET_PERFORMANCE_QUERY	0x06
 	__u32 flags; /* mbz */
 };
 
@@ -492,6 +493,32 @@ struct drm_v3d_copy_timestamp_query {
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
 	/* Pointer to a u32 array of the BOs that are referenced by the job.
 	 *
@@ -507,6 +534,9 @@ struct drm_v3d_submit_cpu {
 	 * For DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY, it must contain two
 	 * BOs. The first is the BO where the timestamp queries will be written
 	 * to. The second is the BO that contains the timestamp.
+	 *
+	 * For DRM_V3D_EXT_ID_CPU_RESET_PERFORMANCE_QUERY, it must contain no
+	 * BOs.
 	 */
 	__u64 bo_handles;
 
-- 
2.42.0

