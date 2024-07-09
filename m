Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9DA92C044
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 18:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D3D10E5FC;
	Tue,  9 Jul 2024 16:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VbRIlqEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A8D10E5F3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R/nlwyK0LPORcEoyFLMAVAVb7rqhKlDWQ9mth+IBovU=; b=VbRIlqEdysM//tNdBo8quQ2h9T
 w9EJoRCoVgomkht+3jd+MazDsyTEm4RCo7nZoB3A3aPGZOa3aFSoPqdUMzJYDfMFcDtCP+QSjPlpI
 kb1xNgF6a+iUeVqpEV/QVci0y3///MAL4vXUekIxolyctGLSJ2K2z/JXVdgmRjt0FaofMPnVsHz8E
 5CBjI9OujSv0MNv3bfnCGqyi6bqV207yyMsz1aNA8V37KDjbCDv0sD3/FIU0nIWGfNdPV0cbIFsiI
 nK/Q5uH0EFTEXiGT+62h2LmD1mRDyrrJectLZTL2KGQovU3kVxRg65BH5UAs5ZbIo1/BE6jsBqs8i
 8AfcFUFQ==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRDnV-00CsoA-Aa; Tue, 09 Jul 2024 18:34:33 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 03/12] drm/v3d: Add some local variables in queries/extensions
Date: Tue,  9 Jul 2024 17:34:16 +0100
Message-ID: <20240709163425.58276-4-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240709163425.58276-1-tursulin@igalia.com>
References: <20240709163425.58276-1-tursulin@igalia.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Add some local variables to make the code a bit less verbose, with the
main benefit being pulling some lines to under 80 columns wide.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 103 ++++++++++++++++---------------
 1 file changed, 54 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 5c71e9adfc65..f99cd61a3e65 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -452,6 +452,7 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 {
 	u32 __user *offsets, *syncs;
 	struct drm_v3d_timestamp_query timestamp;
+	struct v3d_timestamp_query_info *qinfo = &job->timestamp_query;
 
 	if (!job) {
 		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
@@ -471,10 +472,10 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 
 	job->job_type = V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY;
 
-	job->timestamp_query.queries = kvmalloc_array(timestamp.count,
-						      sizeof(struct v3d_timestamp_query),
-						      GFP_KERNEL);
-	if (!job->timestamp_query.queries)
+	qinfo->queries = kvmalloc_array(timestamp.count,
+					sizeof(struct v3d_timestamp_query),
+					GFP_KERNEL);
+	if (!qinfo->queries)
 		return -ENOMEM;
 
 	offsets = u64_to_user_ptr(timestamp.offsets);
@@ -484,20 +485,20 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 		u32 offset, sync;
 
 		if (get_user(offset, offsets++)) {
-			kvfree(job->timestamp_query.queries);
+			kvfree(qinfo->queries);
 			return -EFAULT;
 		}
 
-		job->timestamp_query.queries[i].offset = offset;
+		qinfo->queries[i].offset = offset;
 
 		if (get_user(sync, syncs++)) {
-			kvfree(job->timestamp_query.queries);
+			kvfree(qinfo->queries);
 			return -EFAULT;
 		}
 
-		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+		qinfo->queries[i].syncobj = drm_syncobj_find(file_priv, sync);
 	}
-	job->timestamp_query.count = timestamp.count;
+	qinfo->count = timestamp.count;
 
 	return 0;
 }
@@ -509,6 +510,7 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 {
 	u32 __user *syncs;
 	struct drm_v3d_reset_timestamp_query reset;
+	struct v3d_timestamp_query_info *qinfo = &job->timestamp_query;
 
 	if (!job) {
 		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
@@ -525,10 +527,10 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 
 	job->job_type = V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY;
 
-	job->timestamp_query.queries = kvmalloc_array(reset.count,
-						      sizeof(struct v3d_timestamp_query),
-						      GFP_KERNEL);
-	if (!job->timestamp_query.queries)
+	qinfo->queries = kvmalloc_array(reset.count,
+					sizeof(struct v3d_timestamp_query),
+					GFP_KERNEL);
+	if (!qinfo->queries)
 		return -ENOMEM;
 
 	syncs = u64_to_user_ptr(reset.syncs);
@@ -536,16 +538,16 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 	for (int i = 0; i < reset.count; i++) {
 		u32 sync;
 
-		job->timestamp_query.queries[i].offset = reset.offset + 8 * i;
+		qinfo->queries[i].offset = reset.offset + 8 * i;
 
 		if (get_user(sync, syncs++)) {
-			kvfree(job->timestamp_query.queries);
+			kvfree(qinfo->queries);
 			return -EFAULT;
 		}
 
-		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+		qinfo->queries[i].syncobj = drm_syncobj_find(file_priv, sync);
 	}
-	job->timestamp_query.count = reset.count;
+	qinfo->count = reset.count;
 
 	return 0;
 }
@@ -558,6 +560,7 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 {
 	u32 __user *offsets, *syncs;
 	struct drm_v3d_copy_timestamp_query copy;
+	struct v3d_timestamp_query_info *qinfo = &job->timestamp_query;
 	int i;
 
 	if (!job) {
@@ -578,10 +581,10 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 
 	job->job_type = V3D_CPU_JOB_TYPE_COPY_TIMESTAMP_QUERY;
 
-	job->timestamp_query.queries = kvmalloc_array(copy.count,
-						      sizeof(struct v3d_timestamp_query),
-						      GFP_KERNEL);
-	if (!job->timestamp_query.queries)
+	qinfo->queries = kvmalloc_array(copy.count,
+					sizeof(struct v3d_timestamp_query),
+					GFP_KERNEL);
+	if (!qinfo->queries)
 		return -ENOMEM;
 
 	offsets = u64_to_user_ptr(copy.offsets);
@@ -591,20 +594,20 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 		u32 offset, sync;
 
 		if (get_user(offset, offsets++)) {
-			kvfree(job->timestamp_query.queries);
+			kvfree(qinfo->queries);
 			return -EFAULT;
 		}
 
-		job->timestamp_query.queries[i].offset = offset;
+		qinfo->queries[i].offset = offset;
 
 		if (get_user(sync, syncs++)) {
-			kvfree(job->timestamp_query.queries);
+			kvfree(qinfo->queries);
 			return -EFAULT;
 		}
 
-		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+		qinfo->queries[i].syncobj = drm_syncobj_find(file_priv, sync);
 	}
-	job->timestamp_query.count = copy.count;
+	qinfo->count = copy.count;
 
 	job->copy.do_64bit = copy.do_64bit;
 	job->copy.do_partial = copy.do_partial;
@@ -623,6 +626,7 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 	u32 __user *syncs;
 	u64 __user *kperfmon_ids;
 	struct drm_v3d_reset_performance_query reset;
+	struct v3d_performance_query_info *qinfo = &job->performance_query;
 
 	if (!job) {
 		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
@@ -642,10 +646,10 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 
 	job->job_type = V3D_CPU_JOB_TYPE_RESET_PERFORMANCE_QUERY;
 
-	job->performance_query.queries = kvmalloc_array(reset.count,
-							sizeof(struct v3d_performance_query),
-							GFP_KERNEL);
-	if (!job->performance_query.queries)
+	qinfo->queries = kvmalloc_array(reset.count,
+					sizeof(struct v3d_performance_query),
+					GFP_KERNEL);
+	if (!qinfo->queries)
 		return -ENOMEM;
 
 	syncs = u64_to_user_ptr(reset.syncs);
@@ -658,14 +662,14 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 		u32 id;
 
 		if (get_user(sync, syncs++)) {
-			kvfree(job->performance_query.queries);
+			kvfree(qinfo->queries);
 			return -EFAULT;
 		}
 
-		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+		qinfo->queries[i].syncobj = drm_syncobj_find(file_priv, sync);
 
 		if (get_user(ids, kperfmon_ids++)) {
-			kvfree(job->performance_query.queries);
+			kvfree(qinfo->queries);
 			return -EFAULT;
 		}
 
@@ -673,15 +677,15 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 
 		for (int j = 0; j < reset.nperfmons; j++) {
 			if (get_user(id, ids_pointer++)) {
-				kvfree(job->performance_query.queries);
+				kvfree(qinfo->queries);
 				return -EFAULT;
 			}
 
-			job->performance_query.queries[i].kperfmon_ids[j] = id;
+			qinfo->queries[i].kperfmon_ids[j] = id;
 		}
 	}
-	job->performance_query.count = reset.count;
-	job->performance_query.nperfmons = reset.nperfmons;
+	qinfo->count = reset.count;
+	qinfo->nperfmons = reset.nperfmons;
 
 	return 0;
 }
@@ -694,6 +698,7 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 	u32 __user *syncs;
 	u64 __user *kperfmon_ids;
 	struct drm_v3d_copy_performance_query copy;
+	struct v3d_performance_query_info *qinfo = &job->performance_query;
 
 	if (!job) {
 		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
@@ -716,10 +721,10 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 
 	job->job_type = V3D_CPU_JOB_TYPE_COPY_PERFORMANCE_QUERY;
 
-	job->performance_query.queries = kvmalloc_array(copy.count,
-							sizeof(struct v3d_performance_query),
-							GFP_KERNEL);
-	if (!job->performance_query.queries)
+	qinfo->queries = kvmalloc_array(copy.count,
+					sizeof(struct v3d_performance_query),
+					GFP_KERNEL);
+	if (!qinfo->queries)
 		return -ENOMEM;
 
 	syncs = u64_to_user_ptr(copy.syncs);
@@ -732,14 +737,14 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 		u32 id;
 
 		if (get_user(sync, syncs++)) {
-			kvfree(job->performance_query.queries);
+			kvfree(qinfo->queries);
 			return -EFAULT;
 		}
 
-		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+		qinfo->queries[i].syncobj = drm_syncobj_find(file_priv, sync);
 
 		if (get_user(ids, kperfmon_ids++)) {
-			kvfree(job->performance_query.queries);
+			kvfree(qinfo->queries);
 			return -EFAULT;
 		}
 
@@ -747,16 +752,16 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 
 		for (int j = 0; j < copy.nperfmons; j++) {
 			if (get_user(id, ids_pointer++)) {
-				kvfree(job->performance_query.queries);
+				kvfree(qinfo->queries);
 				return -EFAULT;
 			}
 
-			job->performance_query.queries[i].kperfmon_ids[j] = id;
+			qinfo->queries[i].kperfmon_ids[j] = id;
 		}
 	}
-	job->performance_query.count = copy.count;
-	job->performance_query.nperfmons = copy.nperfmons;
-	job->performance_query.ncounters = copy.ncounters;
+	qinfo->count = copy.count;
+	qinfo->nperfmons = copy.nperfmons;
+	qinfo->ncounters = copy.ncounters;
 
 	job->copy.do_64bit = copy.do_64bit;
 	job->copy.do_partial = copy.do_partial;
-- 
2.44.0

