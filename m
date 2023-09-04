Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957F5791C31
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 19:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726A110E3CA;
	Mon,  4 Sep 2023 17:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9596E10E3C7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 17:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BAEHVVUOPfzAbAcuqwPvUuLzZpLyIX3OVhHL8pv+Bbg=; b=iIV485TbD1mNhlZJC0hNMOeSPZ
 9IlGkNC5QPydPAVgzoSC23kgazwonjk3N+bYrImLqfopBFLY8ViHqkKblsIHbWTPSySAEUjtutN4n
 v/EFxYt2ykU+wETTJt//lDqtYGLWBiyvcAK1VQ/DKWGq9u8fxozDOoDoSMxea54uvAkYFozGyRvMy
 TZqsEOfzRyrlseGjZIzoaQeV5n1/1hxDIwjCKhXroEY/6XmjbamHrMktk6gcpyoB04JQ/YVNO6Bgl
 /LHYQDxPLQEh72jZMJyoX1lqgKjZV9F2PcbqQEbvsuXxmxiBF21MQr5Y9x2mPL17zmOgeBCGEXT8X
 kkpmUukQ==;
Received: from [187.36.235.191] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qdDjt-0028nB-Tk; Mon, 04 Sep 2023 19:51:54 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 14/17] drm/v3d: Create a CPU job extension for the reset
 timestamp job
Date: Mon,  4 Sep 2023 14:39:02 -0300
Message-ID: <20230904175019.1172713-15-mcanal@igalia.com>
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
intervention. A reset timestamp job is a job that resets the timestamp
queries based on the value offset of the first query. As V3D doesn't
provide any mechanism to obtain a timestamp from the GPU, it is a job
that needs CPU intervention.

So, create a user extension for the CPU job that enables the creation
of a reset timestamp job. This user extension will allow the creation of
a CPU job that resets the timestamp value in the timestamp BO and resets
the availability syncobj.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h    |  1 +
 drivers/gpu/drm/v3d/v3d_sched.c  | 21 +++++++++++++
 drivers/gpu/drm/v3d/v3d_submit.c | 51 ++++++++++++++++++++++++++++++++
 include/uapi/drm/v3d_drm.h       | 24 +++++++++++++++
 4 files changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 2733f9c9f5f8..0ffcc8db155e 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -291,6 +291,7 @@ struct v3d_csd_job {
 enum v3d_cpu_job_type {
 	V3D_CPU_JOB_TYPE_INDIRECT_CSD = 1,
 	V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY,
+	V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY,
 };
 
 struct v3d_timestamp_query {
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index f2fd7ffc8704..da8a709ee590 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -320,6 +320,26 @@ v3d_timestamp_query(struct v3d_cpu_job *job)
 	v3d_put_bo_vaddr(bo);
 }
 
+static void
+v3d_reset_timestamp_queries(struct v3d_cpu_job *job)
+{
+	struct v3d_timestamp_query_info *timestamp_query = &job->timestamp_query;
+	struct v3d_timestamp_query *queries = timestamp_query->queries;
+	struct v3d_bo *bo = to_v3d_bo(job->base.bo[0]);
+	u8 *value_addr;
+
+	v3d_get_bo_vaddr(bo);
+
+	for (int i = 0; i < timestamp_query->count; i++) {
+		value_addr = ((u8 *) bo->vaddr) + queries[i].offset;
+		*((u64 *) value_addr) = 0;
+
+		drm_syncobj_replace_fence(queries[i].syncobj, NULL);
+	}
+
+	v3d_put_bo_vaddr(bo);
+}
+
 static struct dma_fence *
 v3d_cpu_job_run(struct drm_sched_job *sched_job)
 {
@@ -329,6 +349,7 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
 	void (*v3d_cpu_job_fn[])(struct v3d_cpu_job *job) = {
 		[V3D_CPU_JOB_TYPE_INDIRECT_CSD] = v3d_rewrite_csd_job_wg_counts_from_indirect,
 		[V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY] = v3d_timestamp_query,
+		[V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY] = v3d_reset_timestamp_queries,
 	};
 
 	v3d->cpu_job = job;
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 5bf55276c4f0..abd182b20021 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -495,6 +495,54 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 	return 0;
 }
 
+static int
+v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
+				   struct drm_v3d_extension __user *ext,
+				   struct v3d_cpu_job *job)
+{
+	u32 __user *syncs;
+	struct drm_v3d_reset_timestamp_query reset;
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
+	job->job_type = V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY;
+
+	job->timestamp_query.queries = kvmalloc_array(reset.count,
+						      sizeof(struct v3d_timestamp_query),
+						      GFP_KERNEL);
+	if (!job->timestamp_query.queries)
+		return -ENOMEM;
+
+	syncs = u64_to_user_ptr(reset.syncs);
+
+	for (int i = 0; i < reset.count; i++) {
+		u32 sync;
+
+		job->timestamp_query.queries[i].offset = reset.offset + 8 * i;
+
+		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
+			kvfree(job->timestamp_query.queries);
+			return -EFAULT;
+		}
+
+		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+	}
+	job->timestamp_query.count = reset.count;
+
+	return 0;
+}
+
 /* Whenever userspace sets ioctl extensions, v3d_get_extensions parses data
  * according to the extension id (name).
  */
@@ -526,6 +574,9 @@ v3d_get_extensions(struct drm_file *file_priv,
 		case DRM_V3D_EXT_ID_CPU_TIMESTAMP_QUERY:
 			ret = v3d_get_cpu_timestamp_query_params(file_priv, user_ext, job);
 			break;
+		case DRM_V3D_EXT_ID_CPU_RESET_TIMESTAMP_QUERY:
+			ret = v3d_get_cpu_reset_timestamp_params(file_priv, user_ext, job);
+			break;
 		default:
 			DRM_DEBUG_DRIVER("Unknown extension id: %d\n", ext.id);
 			return -EINVAL;
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index b94edfd275a7..c93104121d8d 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -74,6 +74,7 @@ struct drm_v3d_extension {
 #define DRM_V3D_EXT_ID_MULTI_SYNC			0x01
 #define DRM_V3D_EXT_ID_CPU_INDIRECT_CSD		0x02
 #define DRM_V3D_EXT_ID_CPU_TIMESTAMP_QUERY		0x03
+#define DRM_V3D_EXT_ID_CPU_RESET_TIMESTAMP_QUERY	0x04
 	__u32 flags; /* mbz */
 };
 
@@ -422,6 +423,29 @@ struct drm_v3d_timestamp_query {
 	__u32 pad;
 };
 
+/**
+ * struct drm_v3d_reset_timestamp_query - ioctl extension for the CPU job to
+ * reset timestamp queries
+ *
+ * When an extension DRM_V3D_EXT_ID_CPU_RESET_TIMESTAMP_QUERY is defined, it
+ * points to this extension to define a reset timestamp submission. This CPU
+ * job will reset the timestamp queries based on value offset of the first
+ * query. Moreover, it will reset the timestamp syncobj to reset query
+ * availability.
+ */
+struct drm_v3d_reset_timestamp_query {
+	struct drm_v3d_extension base;
+
+	/* Array of timestamp's syncobjs to indicate its availability */
+	__u64 syncs;
+
+	/* Offset of the first query within the timestamp BO for its value */
+	__u32 offset;
+
+	/* Number of queries */
+	__u32 count;
+};
+
 struct drm_v3d_submit_cpu {
 	/* Pointer to a u32 array of the BOs that are referenced by the job. */
 	__u64 bo_handles;
-- 
2.41.0

