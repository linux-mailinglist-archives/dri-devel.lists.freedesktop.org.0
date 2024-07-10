Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69E092D308
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 15:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E5810E7B8;
	Wed, 10 Jul 2024 13:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cx2zcl1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E55010E7B8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 13:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lVpmWLCt5zVS9VrgN6csYKgg6SJAboaSG3Hf06Durwg=; b=cx2zcl1/z0JViqD4IzIh3pUVuZ
 qgm6KnCGJKxYBU+Bj26WwCaoSY3fPTfVGrQ18pFvzrjtYctL4bRgtIaJqjOzsFQYrnlTbEmg5h5lo
 sRMcZUmjVhqPM5D2OGmarzhN3Xbkjd3+hQNP+lOKhWspLqz+dnwkuNRsDrQw9YdTIj2yjtR/GMUfC
 ppsq2zo9y4maBPwDx582kryM3tKxaZZeC1cPbB5yqeohkLeTDCFTaI1Iax98bsQnMfA2wYBMcvlTy
 MJQYE/AY8m1gYHbwUghXiH+aiN9myOS5btTPalbj9+IUyt/PjNyIyx9X2+wG3Q4vU3upGsCR7mZ/E
 wUGN9NaQ==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRXZk-00DH1s-UQ; Wed, 10 Jul 2024 15:41:41 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 11/12] drm/v3d: Add some local variables in queries/extensions
Date: Wed, 10 Jul 2024 14:41:29 +0100
Message-ID: <20240710134130.17292-12-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240710134130.17292-1-tursulin@igalia.com>
References: <20240710134130.17292-1-tursulin@igalia.com>
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
 drivers/gpu/drm/v3d/v3d_submit.c | 79 +++++++++++++++++---------------
 1 file changed, 42 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 34ecd844f16a..b0c2a8e9cb06 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -452,6 +452,7 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 {
 	u32 __user *offsets, *syncs;
 	struct drm_v3d_timestamp_query timestamp;
+	struct v3d_timestamp_query_info *qinfo = &job->timestamp_query;
 	unsigned int i;
 	int err;
 
@@ -473,10 +474,10 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 
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
@@ -490,20 +491,20 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 			goto error;
 		}
 
-		job->timestamp_query.queries[i].offset = offset;
+		qinfo->queries[i].offset = offset;
 
 		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
 			err = -EFAULT;
 			goto error;
 		}
 
-		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
-		if (!job->timestamp_query.queries[i].syncobj) {
+		qinfo->queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+		if (!qinfo->queries[i].syncobj) {
 			err = -ENOENT;
 			goto error;
 		}
 	}
-	job->timestamp_query.count = timestamp.count;
+	qinfo->count = timestamp.count;
 
 	return 0;
 
@@ -519,6 +520,7 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 {
 	u32 __user *syncs;
 	struct drm_v3d_reset_timestamp_query reset;
+	struct v3d_timestamp_query_info *qinfo = &job->timestamp_query;
 	unsigned int i;
 	int err;
 
@@ -537,10 +539,10 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 
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
@@ -548,20 +550,20 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 	for (i = 0; i < reset.count; i++) {
 		u32 sync;
 
-		job->timestamp_query.queries[i].offset = reset.offset + 8 * i;
+		qinfo->queries[i].offset = reset.offset + 8 * i;
 
 		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
 			err = -EFAULT;
 			goto error;
 		}
 
-		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
-		if (!job->timestamp_query.queries[i].syncobj) {
+		qinfo->queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+		if (!qinfo->queries[i].syncobj) {
 			err = -ENOENT;
 			goto error;
 		}
 	}
-	job->timestamp_query.count = reset.count;
+	qinfo->count = reset.count;
 
 	return 0;
 
@@ -578,6 +580,7 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 {
 	u32 __user *offsets, *syncs;
 	struct drm_v3d_copy_timestamp_query copy;
+	struct v3d_timestamp_query_info *qinfo = &job->timestamp_query;
 	unsigned int i;
 	int err;
 
@@ -599,10 +602,10 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 
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
@@ -616,20 +619,20 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 			goto error;
 		}
 
-		job->timestamp_query.queries[i].offset = offset;
+		qinfo->queries[i].offset = offset;
 
 		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
 			err = -EFAULT;
 			goto error;
 		}
 
-		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
-		if (!job->timestamp_query.queries[i].syncobj) {
+		qinfo->queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+		if (!qinfo->queries[i].syncobj) {
 			err = -ENOENT;
 			goto error;
 		}
 	}
-	job->timestamp_query.count = copy.count;
+	qinfo->count = copy.count;
 
 	job->copy.do_64bit = copy.do_64bit;
 	job->copy.do_partial = copy.do_partial;
@@ -712,6 +715,7 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 				     struct drm_v3d_extension __user *ext,
 				     struct v3d_cpu_job *job)
 {
+	struct v3d_performance_query_info *qinfo = &job->performance_query;
 	struct drm_v3d_reset_performance_query reset;
 	int err;
 
@@ -730,10 +734,10 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 
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
 
 	err = copy_query_info(qinfo, reset.count, reset.nperfmons,
@@ -743,8 +747,8 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 	if (err)
 		return err;
 
-	job->performance_query.count = reset.count;
-	job->performance_query.nperfmons = reset.nperfmons;
+	qinfo->count = reset.count;
+	qinfo->nperfmons = reset.nperfmons;
 
 	return 0;
 }
@@ -754,6 +758,7 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 					  struct drm_v3d_extension __user *ext,
 					  struct v3d_cpu_job *job)
 {
+	struct v3d_performance_query_info *qinfo = &job->performance_query;
 	struct drm_v3d_copy_performance_query copy;
 	int err;
 
@@ -775,10 +780,10 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 
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
 
 	err = copy_query_info(qinfo, copy.count, copy.nperfmons,
@@ -788,9 +793,9 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 	if (err)
 		return err;
 
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

