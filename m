Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F8792D30D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 15:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D21110E7C4;
	Wed, 10 Jul 2024 13:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="g+SKBOaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B54010E7C0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 13:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rG3C/Exhrz7HJyXNc995viQgwTqFpHBaJfJcuAC50j4=; b=g+SKBOaHZZ8n0NvEvab/gXdiTf
 xUFxU+CqDIsHpDdTwn+GeXh6TDADuMoxwStYDAf7T8KG5NhJPQIh1HTVEWbeyT+5u8btJ5Hb/egxK
 sWquC7x55iTeUsrmpqNuDK4iGZBaNYRDxoQuXTmssDAupllMDJH/G10hij8WVUiFkjHc+tPzn85zA
 poTVk0F0lklOgUCM7LfxGjY8R8yH7YuCboFWiRfYzwCbhYnljGm/6Lzkkz0XcuTEuwo4EbrhDJDm/
 pjdRgReHznvDzVuxWBAplOTm7ypWt00J7CAi8I+UZVx9xW0iOfg+5R2B9rlMXoj3M9BRD38mkpAwj
 OHAckfeQ==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRXZi-00DH1N-Ay; Wed, 10 Jul 2024 15:41:38 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 07/12] drm/v3d: Size the kperfmon_ids array at runtime
Date: Wed, 10 Jul 2024 14:41:25 +0100
Message-ID: <20240710134130.17292-8-tursulin@igalia.com>
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

Instead of statically reserving pessimistic space for the kperfmon_ids
array, make the userspace extension code allocate the exactly required
amount of space.

Apart from saving some memory at runtime, this also removes the need for
the V3D_MAX_PERFMONS macro whose removal will benefit further driver
cleanup.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h    |  6 +-----
 drivers/gpu/drm/v3d/v3d_sched.c  |  4 +++-
 drivers/gpu/drm/v3d/v3d_submit.c | 17 +++++++++++------
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 38c80168da51..00fe5d993175 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -351,13 +351,9 @@ struct v3d_timestamp_query {
 	struct drm_syncobj *syncobj;
 };
 
-/* Number of perfmons required to handle all supported performance counters */
-#define V3D_MAX_PERFMONS DIV_ROUND_UP(V3D_MAX_COUNTERS, \
-				      DRM_V3D_MAX_PERF_COUNTERS)
-
 struct v3d_performance_query {
 	/* Performance monitor IDs for this query */
-	u32 kperfmon_ids[V3D_MAX_PERFMONS];
+	u32 *kperfmon_ids;
 
 	/* Syncobj that indicates the query availability */
 	struct drm_syncobj *syncobj;
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 173801aa54ee..fc8730264386 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -94,8 +94,10 @@ __v3d_performance_query_info_free(struct v3d_performance_query_info *qinfo,
 	if (qinfo->queries) {
 		unsigned int i;
 
-		for (i = 0; i < count; i++)
+		for (i = 0; i < count; i++) {
 			drm_syncobj_put(qinfo->queries[i].syncobj);
+			kvfree(qinfo->queries[i].kperfmon_ids);
+		}
 
 		kvfree(qinfo->queries);
 	}
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 35682433f75b..8dae3ab5f936 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -668,10 +668,20 @@ copy_query_info(struct v3d_performance_query_info *qinfo,
 			goto error;
 		}
 
+		query->kperfmon_ids =
+			kvmalloc_array(nperfmons,
+				       sizeof(struct v3d_performance_query *),
+				       GFP_KERNEL);
+		if (!query->kperfmon_ids) {
+			err = -ENOMEM;
+			goto error;
+		}
+
 		ids_pointer = u64_to_user_ptr(ids);
 
 		for (j = 0; j < nperfmons; j++) {
 			if (get_user(id, ids_pointer++)) {
+				kvfree(query->kperfmon_ids);
 				err = -EFAULT;
 				goto error;
 			}
@@ -681,6 +691,7 @@ copy_query_info(struct v3d_performance_query_info *qinfo,
 
 		query->syncobj = drm_syncobj_find(fpriv, sync);
 		if (!query->syncobj) {
+			kvfree(query->kperfmon_ids);
 			err = -ENOENT;
 			goto error;
 		}
@@ -714,9 +725,6 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 	if (copy_from_user(&reset, ext, sizeof(reset)))
 		return -EFAULT;
 
-	if (reset.nperfmons > V3D_MAX_PERFMONS)
-		return -EINVAL;
-
 	job->job_type = V3D_CPU_JOB_TYPE_RESET_PERFORMANCE_QUERY;
 
 	job->performance_query.queries = kvmalloc_array(reset.count,
@@ -762,9 +770,6 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 	if (copy.pad)
 		return -EINVAL;
 
-	if (copy.nperfmons > V3D_MAX_PERFMONS)
-		return -EINVAL;
-
 	job->job_type = V3D_CPU_JOB_TYPE_COPY_PERFORMANCE_QUERY;
 
 	job->performance_query.queries = kvmalloc_array(copy.count,
-- 
2.44.0

