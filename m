Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DFE92E9F5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 15:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81E910EA92;
	Thu, 11 Jul 2024 13:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cNkwAxjD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C8310EA8F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 13:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G+R1tgFFXsuY1AqY7E00fL7m8S9W89DajHe67vVS+v4=; b=cNkwAxjD08v6ZHD+sPjzek+iYk
 UZ9JGozM5t3nTY5+g+//xpr2/VQzeUhJmknzVu+Bu+ePSc/yq4gcNe5zgDwR+kt01wBb/iPV4FL+U
 X94At5JNgskGpVFcT+0czOlOJkuWoAGs4t+rRCG/TqWwlqJumur9EtZZ54VPCp/E3WwyhVe7zTy7s
 CoPHgOcNztaSqV3HqZudr9hwsbnCKxhkkQTx0WoFng7tddDgzJR5pIeamN90W2PjAw96cTRVIbWmy
 isyux3k2qR8uGPIb2+oS8aiIl5+2fmeJI1RpxQZ5Oisx2gYajhK2LbqjJNaniEYzyTW0W0f4w8+2/
 DOdgwJLQ==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRuF3-00Difv-N2; Thu, 11 Jul 2024 15:53:49 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 11/11] drm/v3d: Add some local variables in queries/extensions
Date: Thu, 11 Jul 2024 14:53:40 +0100
Message-ID: <20240711135340.84617-12-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240711135340.84617-1-tursulin@igalia.com>
References: <20240711135340.84617-1-tursulin@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Add some local variables to make the code a bit less verbose, with the
main benefit being pulling some lines to under 80 columns wide.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 88 ++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index b282d12571b5..d607aa9c4ec2 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -452,6 +452,7 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 {
 	u32 __user *offsets, *syncs;
 	struct drm_v3d_timestamp_query timestamp;
+	struct v3d_timestamp_query_info *query_info = &job->timestamp_query;
 	unsigned int i;
 	int err;
 
@@ -473,10 +474,10 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 
 	job->job_type = V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY;
 
-	job->timestamp_query.queries = kvmalloc_array(timestamp.count,
-						      sizeof(struct v3d_timestamp_query),
-						      GFP_KERNEL);
-	if (!job->timestamp_query.queries)
+	query_info->queries = kvmalloc_array(timestamp.count,
+					     sizeof(struct v3d_timestamp_query),
+					     GFP_KERNEL);
+	if (!query_info->queries)
 		return -ENOMEM;
 
 	offsets = u64_to_user_ptr(timestamp.offsets);
@@ -490,20 +491,21 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 			goto error;
 		}
 
-		job->timestamp_query.queries[i].offset = offset;
+		query_info->queries[i].offset = offset;
 
 		if (get_user(sync, syncs++)) {
 			err = -EFAULT;
 			goto error;
 		}
 
-		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
-		if (!job->timestamp_query.queries[i].syncobj) {
+		query_info->queries[i].syncobj = drm_syncobj_find(file_priv,
+								  sync);
+		if (!query_info->queries[i].syncobj) {
 			err = -ENOENT;
 			goto error;
 		}
 	}
-	job->timestamp_query.count = timestamp.count;
+	query_info->count = timestamp.count;
 
 	return 0;
 
@@ -519,6 +521,7 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 {
 	u32 __user *syncs;
 	struct drm_v3d_reset_timestamp_query reset;
+	struct v3d_timestamp_query_info *query_info = &job->timestamp_query;
 	unsigned int i;
 	int err;
 
@@ -537,10 +540,10 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 
 	job->job_type = V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY;
 
-	job->timestamp_query.queries = kvmalloc_array(reset.count,
-						      sizeof(struct v3d_timestamp_query),
-						      GFP_KERNEL);
-	if (!job->timestamp_query.queries)
+	query_info->queries = kvmalloc_array(reset.count,
+					     sizeof(struct v3d_timestamp_query),
+					     GFP_KERNEL);
+	if (!query_info->queries)
 		return -ENOMEM;
 
 	syncs = u64_to_user_ptr(reset.syncs);
@@ -548,20 +551,21 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 	for (i = 0; i < reset.count; i++) {
 		u32 sync;
 
-		job->timestamp_query.queries[i].offset = reset.offset + 8 * i;
+		query_info->queries[i].offset = reset.offset + 8 * i;
 
 		if (get_user(sync, syncs++)) {
 			err = -EFAULT;
 			goto error;
 		}
 
-		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
-		if (!job->timestamp_query.queries[i].syncobj) {
+		query_info->queries[i].syncobj = drm_syncobj_find(file_priv,
+								  sync);
+		if (!query_info->queries[i].syncobj) {
 			err = -ENOENT;
 			goto error;
 		}
 	}
-	job->timestamp_query.count = reset.count;
+	query_info->count = reset.count;
 
 	return 0;
 
@@ -578,6 +582,7 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 {
 	u32 __user *offsets, *syncs;
 	struct drm_v3d_copy_timestamp_query copy;
+	struct v3d_timestamp_query_info *query_info = &job->timestamp_query;
 	unsigned int i;
 	int err;
 
@@ -599,10 +604,10 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 
 	job->job_type = V3D_CPU_JOB_TYPE_COPY_TIMESTAMP_QUERY;
 
-	job->timestamp_query.queries = kvmalloc_array(copy.count,
-						      sizeof(struct v3d_timestamp_query),
-						      GFP_KERNEL);
-	if (!job->timestamp_query.queries)
+	query_info->queries = kvmalloc_array(copy.count,
+					     sizeof(struct v3d_timestamp_query),
+					     GFP_KERNEL);
+	if (!query_info->queries)
 		return -ENOMEM;
 
 	offsets = u64_to_user_ptr(copy.offsets);
@@ -616,20 +621,21 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 			goto error;
 		}
 
-		job->timestamp_query.queries[i].offset = offset;
+		query_info->queries[i].offset = offset;
 
 		if (get_user(sync, syncs++)) {
 			err = -EFAULT;
 			goto error;
 		}
 
-		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
-		if (!job->timestamp_query.queries[i].syncobj) {
+		query_info->queries[i].syncobj = drm_syncobj_find(file_priv,
+								  sync);
+		if (!query_info->queries[i].syncobj) {
 			err = -ENOENT;
 			goto error;
 		}
 	}
-	job->timestamp_query.count = copy.count;
+	query_info->count = copy.count;
 
 	job->copy.do_64bit = copy.do_64bit;
 	job->copy.do_partial = copy.do_partial;
@@ -712,6 +718,7 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 				     struct drm_v3d_extension __user *ext,
 				     struct v3d_cpu_job *job)
 {
+	struct v3d_performance_query_info *query_info = &job->performance_query;
 	struct drm_v3d_reset_performance_query reset;
 	int err;
 
@@ -730,13 +737,14 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 
 	job->job_type = V3D_CPU_JOB_TYPE_RESET_PERFORMANCE_QUERY;
 
-	job->performance_query.queries = kvmalloc_array(reset.count,
-							sizeof(struct v3d_performance_query),
-							GFP_KERNEL);
-	if (!job->performance_query.queries)
+	query_info->queries =
+		kvmalloc_array(reset.count,
+			       sizeof(struct v3d_performance_query),
+			       GFP_KERNEL);
+	if (!query_info->queries)
 		return -ENOMEM;
 
-	err = v3d_copy_query_info(&job->performance_query,
+	err = v3d_copy_query_info(query_info,
 				  reset.count,
 				  reset.nperfmons,
 				  u64_to_user_ptr(reset.syncs),
@@ -745,8 +753,8 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 	if (err)
 		return err;
 
-	job->performance_query.count = reset.count;
-	job->performance_query.nperfmons = reset.nperfmons;
+	query_info->count = reset.count;
+	query_info->nperfmons = reset.nperfmons;
 
 	return 0;
 }
@@ -756,6 +764,7 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 					  struct drm_v3d_extension __user *ext,
 					  struct v3d_cpu_job *job)
 {
+	struct v3d_performance_query_info *query_info = &job->performance_query;
 	struct drm_v3d_copy_performance_query copy;
 	int err;
 
@@ -777,13 +786,14 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 
 	job->job_type = V3D_CPU_JOB_TYPE_COPY_PERFORMANCE_QUERY;
 
-	job->performance_query.queries = kvmalloc_array(copy.count,
-							sizeof(struct v3d_performance_query),
-							GFP_KERNEL);
-	if (!job->performance_query.queries)
+	query_info->queries =
+		kvmalloc_array(copy.count,
+			       sizeof(struct v3d_performance_query),
+			       GFP_KERNEL);
+	if (!query_info->queries)
 		return -ENOMEM;
 
-	err = v3d_copy_query_info(&job->performance_query,
+	err = v3d_copy_query_info(query_info,
 				  copy.count,
 				  copy.nperfmons,
 				  u64_to_user_ptr(copy.syncs),
@@ -792,9 +802,9 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 	if (err)
 		return err;
 
-	job->performance_query.count = copy.count;
-	job->performance_query.nperfmons = copy.nperfmons;
-	job->performance_query.ncounters = copy.ncounters;
+	query_info->count = copy.count;
+	query_info->nperfmons = copy.nperfmons;
+	query_info->ncounters = copy.ncounters;
 
 	job->copy.do_64bit = copy.do_64bit;
 	job->copy.do_partial = copy.do_partial;
-- 
2.44.0

