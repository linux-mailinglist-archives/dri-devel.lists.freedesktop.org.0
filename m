Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C97FA976
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 20:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE69110E3ED;
	Mon, 27 Nov 2023 19:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FFC10E3EE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 19:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OIJCu2edircauhqrwPzHBMvx1O2KoWIpubpVkdX1G/k=; b=ENlaMZgA4pti3HDo5ST0Z3Izwv
 EU+gXpyxnE9KX6zLV2MZE2B+8XBge9zFBKvMlvWtgP1cJRaRrQy7Rfb2uqBEdlrEL3XvUS1lNM0le
 Lz+QtxtgUIPMe1VvFA2PUXjE1HAwCdtzxp0GgOYLUCzfM8sUJPVFWKe6q11BkmsrNDo2TkP6LsVxx
 IwW48v9cOsKXNNHX+/EJcuVJtxilio2dWoqTpXbQEHzxP6aH40zsbE70ks/uDMVCiSAlnFvmlymwU
 wREYYfB8OVedHnFVw7VqGofBn4WXW9fqbBa49izjYlNLkq+FgEurtSI0Va2GAAt3TVz1MbXn/FWwW
 l/e8wpJw==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r7gqP-007jiM-3z; Mon, 27 Nov 2023 20:00:34 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 15/17] drm/v3d: Create a CPU job extension to copy
 timestamp query to a buffer
Date: Mon, 27 Nov 2023 15:48:33 -0300
Message-ID: <20231127185723.10348-17-mcanal@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231127185723.10348-2-mcanal@igalia.com>
References: <20231127185723.10348-2-mcanal@igalia.com>
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
 Boris Brezillon <boris.brezillon@collabora.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A CPU job is a type of job that performs operations that requires CPU
intervention. A copy timestamp query job is a job that copy the complete
or partial result of a query to a buffer. As V3D doesn't provide any
mechanism to obtain a timestamp from the GPU, it is a job that needs
CPU intervention.

So, create a user extension for the CPU job that enables the creation
of a copy timestamp query job. This user extension will allow the creation
of a CPU job that copy the results of a timestamp query to a BO with the
possibility to indicate the timestamp availability with a availability bit.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h    | 20 +++++++++
 drivers/gpu/drm/v3d/v3d_sched.c  | 53 ++++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_submit.c | 69 ++++++++++++++++++++++++++++++++
 include/uapi/drm/v3d_drm.h       | 45 +++++++++++++++++++++
 4 files changed, 187 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 3988407635ed..5058a354fffd 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -320,6 +320,7 @@ enum v3d_cpu_job_type {
 	V3D_CPU_JOB_TYPE_INDIRECT_CSD = 1,
 	V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY,
 	V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY,
+	V3D_CPU_JOB_TYPE_COPY_TIMESTAMP_QUERY,
 };
 
 struct v3d_timestamp_query {
@@ -361,6 +362,23 @@ struct v3d_timestamp_query_info {
 	u32 count;
 };
 
+struct v3d_copy_query_results_info {
+	/* Define if should write to buffer using 64 or 32 bits */
+	bool do_64bit;
+
+	/* Define if it can write to buffer even if the query is not available */
+	bool do_partial;
+
+	/* Define if it should write availability bit to buffer */
+	bool availability_bit;
+
+	/* Offset of the copy buffer in the BO */
+	u32 offset;
+
+	/* Stride of the copy buffer in the BO */
+	u32 stride;
+};
+
 struct v3d_cpu_job {
 	struct v3d_job base;
 
@@ -369,6 +387,8 @@ struct v3d_cpu_job {
 	struct v3d_indirect_csd_info indirect_csd;
 
 	struct v3d_timestamp_query_info timestamp_query;
+
+	struct v3d_copy_query_results_info copy;
 };
 
 typedef void (*v3d_cpu_job_fn)(struct v3d_cpu_job *);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 3a435f621b9b..07c897cd3423 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -361,11 +361,64 @@ v3d_reset_timestamp_queries(struct v3d_cpu_job *job)
 
 	v3d_put_bo_vaddr(bo);
 }
+static void
+write_to_buffer(void *dst, u32 idx, bool do_64bit, u64 value)
+{
+	if (do_64bit) {
+		u64 *dst64 = (u64 *) dst;
+		dst64[idx] = value;
+	} else {
+		u32 *dst32 = (u32 *) dst;
+		dst32[idx] = (u32) value;
+	}
+}
+
+static void
+v3d_copy_query_results(struct v3d_cpu_job *job)
+{
+	struct v3d_timestamp_query_info *timestamp_query = &job->timestamp_query;
+	struct v3d_timestamp_query *queries = timestamp_query->queries;
+	struct v3d_bo *bo = to_v3d_bo(job->base.bo[0]);
+	struct v3d_bo *timestamp = to_v3d_bo(job->base.bo[1]);
+	struct v3d_copy_query_results_info *copy = &job->copy;
+	struct dma_fence *fence;
+	u8 *query_addr;
+	bool available, write_result;
+	u8 *data;
+	int i;
+
+	v3d_get_bo_vaddr(bo);
+	v3d_get_bo_vaddr(timestamp);
+
+	data = ((u8 *) bo->vaddr) + copy->offset;
+
+	for (i = 0; i < timestamp_query->count; i++) {
+		fence = drm_syncobj_fence_get(queries[i].syncobj);
+		available = fence ? dma_fence_is_signaled(fence) : false;
+
+		write_result = available || copy->do_partial;
+		if (write_result) {
+			query_addr = ((u8 *) timestamp->vaddr) + queries[i].offset;
+			write_to_buffer(data, 0, copy->do_64bit, *((u64 *) query_addr));
+		}
+
+		if (copy->availability_bit)
+			write_to_buffer(data, 1, copy->do_64bit, available ? 1u : 0u);
+
+		data += copy->stride;
+
+		dma_fence_put(fence);
+	}
+
+	v3d_put_bo_vaddr(timestamp);
+	v3d_put_bo_vaddr(bo);
+}
 
 static const v3d_cpu_job_fn cpu_job_function[] = {
 	[V3D_CPU_JOB_TYPE_INDIRECT_CSD] = v3d_rewrite_csd_job_wg_counts_from_indirect,
 	[V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY] = v3d_timestamp_query,
 	[V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY] = v3d_reset_timestamp_queries,
+	[V3D_CPU_JOB_TYPE_COPY_TIMESTAMP_QUERY] = v3d_copy_query_results,
 };
 
 static struct dma_fence *
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 1c719416e26a..bafd49c6440c 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -539,6 +539,71 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 	return 0;
 }
 
+/* Get data for the copy timestamp query results job submission. */
+static int
+v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
+				      struct drm_v3d_extension __user *ext,
+				      struct v3d_cpu_job *job)
+{
+	u32 __user *offsets, *syncs;
+	struct drm_v3d_copy_timestamp_query copy;
+	int i;
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
+	job->job_type = V3D_CPU_JOB_TYPE_COPY_TIMESTAMP_QUERY;
+
+	job->timestamp_query.queries = kvmalloc_array(copy.count,
+						      sizeof(struct v3d_timestamp_query),
+						      GFP_KERNEL);
+	if (!job->timestamp_query.queries)
+		return -ENOMEM;
+
+	offsets = u64_to_user_ptr(copy.offsets);
+	syncs = u64_to_user_ptr(copy.syncs);
+
+	for (i = 0; i < copy.count; i++) {
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
+	job->timestamp_query.count = copy.count;
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
@@ -573,6 +638,9 @@ v3d_get_extensions(struct drm_file *file_priv,
 		case DRM_V3D_EXT_ID_CPU_RESET_TIMESTAMP_QUERY:
 			ret = v3d_get_cpu_reset_timestamp_params(file_priv, user_ext, job);
 			break;
+		case DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY:
+			ret = v3d_get_cpu_copy_query_results_params(file_priv, user_ext, job);
+			break;
 		default:
 			DRM_DEBUG_DRIVER("Unknown extension id: %d\n", ext.id);
 			return -EINVAL;
@@ -951,6 +1019,7 @@ static const unsigned int cpu_job_bo_handle_count[] = {
 	[V3D_CPU_JOB_TYPE_INDIRECT_CSD] = 1,
 	[V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY] = 1,
 	[V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY] = 1,
+	[V3D_CPU_JOB_TYPE_COPY_TIMESTAMP_QUERY] = 2,
 };
 
 /**
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 930f8d07f088..a3ae1f220291 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -75,6 +75,7 @@ struct drm_v3d_extension {
 #define DRM_V3D_EXT_ID_CPU_INDIRECT_CSD		0x02
 #define DRM_V3D_EXT_ID_CPU_TIMESTAMP_QUERY		0x03
 #define DRM_V3D_EXT_ID_CPU_RESET_TIMESTAMP_QUERY	0x04
+#define DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY	0x05
 	__u32 flags; /* mbz */
 };
 
@@ -451,6 +452,46 @@ struct drm_v3d_reset_timestamp_query {
 	__u32 count;
 };
 
+/**
+ * struct drm_v3d_copy_timestamp_query - ioctl extension for the CPU job to copy
+ * query results to a buffer
+ *
+ * When an extension DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY is defined, it
+ * points to this extension to define a copy timestamp query submission. This
+ * CPU job will copy the timestamp queries results to a BO with the offset
+ * and stride defined in the extension.
+ */
+struct drm_v3d_copy_timestamp_query {
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
+	/* Number of queries */
+	__u32 count;
+
+	/* Array of queries' offsets within the timestamp BO for their value */
+	__u64 offsets;
+
+	/* Array of timestamp's syncobjs to indicate its availability */
+	__u64 syncs;
+};
+
 struct drm_v3d_submit_cpu {
 	/* Pointer to a u32 array of the BOs that are referenced by the job.
 	 *
@@ -462,6 +503,10 @@ struct drm_v3d_submit_cpu {
 	 *
 	 * For DRM_V3D_EXT_ID_CPU_RESET_TIMESTAMP_QUERY, it must contain only
 	 * one BO, that contains the timestamp.
+	 *
+	 * For DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY, it must contain two
+	 * BOs. The first is the BO for which the timestamp queries results
+	 * will be written to. The second is the BO that contains the timestamp.
 	 */
 	__u64 bo_handles;
 
-- 
2.42.0

