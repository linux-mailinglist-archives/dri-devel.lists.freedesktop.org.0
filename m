Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F8992C043
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 18:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B694010E5F9;
	Tue,  9 Jul 2024 16:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Mb23h5hN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BAC10E5F5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kItrKcxauvdbMdUqNlmo/v9tJIZtp4Sze/1WHrZPF3c=; b=Mb23h5hNX95daNjTjnkWs74GnK
 h21Tj/uy4sEy0X31jwVA6U+Y6ZrhdmNuTCgO1p6njUxRNFIyHlqt7DvorCguAO9nEhVuqOhQj4Res
 gC1wakWkeYdqRlUCKlf9GqmMXJ0smcYiwsJWkObCOrfLtBJsuYwjXVRhyAhcHEolusXx+3DgGpmZB
 PWkeYg2yIBOJ2fzpN2y5C8tN/DWSIAFPe55+C6BK/f902VjBTrcwTIF2ooVwKZDcggl37Ghe/3gif
 qJJX770NbqvV/4c+p+DrYcOQE0Ts/AG8eOIw1/l9mmMoVjPXA/zwLd/HHI1nXIFNBQaOv+J17EIgB
 LC1py2vQ==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRDnV-00CsoE-W1; Tue, 09 Jul 2024 18:34:34 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 04/12] drm/v3d: Align data types of internal and uapi counts
Date: Tue,  9 Jul 2024 17:34:17 +0100
Message-ID: <20240709163425.58276-5-tursulin@igalia.com>
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

In the timestamp and performance extensions userspace type for counts is
u32 so lets use unsigned in the kernel too.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index f99cd61a3e65..c960bc6ca32d 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -453,6 +453,7 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 	u32 __user *offsets, *syncs;
 	struct drm_v3d_timestamp_query timestamp;
 	struct v3d_timestamp_query_info *qinfo = &job->timestamp_query;
+	unsigned int i;
 
 	if (!job) {
 		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
@@ -481,7 +482,7 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 	offsets = u64_to_user_ptr(timestamp.offsets);
 	syncs = u64_to_user_ptr(timestamp.syncs);
 
-	for (int i = 0; i < timestamp.count; i++) {
+	for (i = 0; i < timestamp.count; i++) {
 		u32 offset, sync;
 
 		if (get_user(offset, offsets++)) {
@@ -511,6 +512,7 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 	u32 __user *syncs;
 	struct drm_v3d_reset_timestamp_query reset;
 	struct v3d_timestamp_query_info *qinfo = &job->timestamp_query;
+	unsigned int i;
 
 	if (!job) {
 		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
@@ -535,7 +537,7 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 
 	syncs = u64_to_user_ptr(reset.syncs);
 
-	for (int i = 0; i < reset.count; i++) {
+	for (i = 0; i < reset.count; i++) {
 		u32 sync;
 
 		qinfo->queries[i].offset = reset.offset + 8 * i;
@@ -561,7 +563,7 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 	u32 __user *offsets, *syncs;
 	struct drm_v3d_copy_timestamp_query copy;
 	struct v3d_timestamp_query_info *qinfo = &job->timestamp_query;
-	int i;
+	unsigned int i;
 
 	if (!job) {
 		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
@@ -627,6 +629,7 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 	u64 __user *kperfmon_ids;
 	struct drm_v3d_reset_performance_query reset;
 	struct v3d_performance_query_info *qinfo = &job->performance_query;
+	unsigned int i, j;
 
 	if (!job) {
 		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
@@ -655,7 +658,7 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 	syncs = u64_to_user_ptr(reset.syncs);
 	kperfmon_ids = u64_to_user_ptr(reset.kperfmon_ids);
 
-	for (int i = 0; i < reset.count; i++) {
+	for (i = 0; i < reset.count; i++) {
 		u32 sync;
 		u64 ids;
 		u32 __user *ids_pointer;
@@ -675,7 +678,7 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 
 		ids_pointer = u64_to_user_ptr(ids);
 
-		for (int j = 0; j < reset.nperfmons; j++) {
+		for (j = 0; j < reset.nperfmons; j++) {
 			if (get_user(id, ids_pointer++)) {
 				kvfree(qinfo->queries);
 				return -EFAULT;
@@ -699,6 +702,7 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 	u64 __user *kperfmon_ids;
 	struct drm_v3d_copy_performance_query copy;
 	struct v3d_performance_query_info *qinfo = &job->performance_query;
+	unsigned int i, j;
 
 	if (!job) {
 		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
@@ -730,7 +734,7 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 	syncs = u64_to_user_ptr(copy.syncs);
 	kperfmon_ids = u64_to_user_ptr(copy.kperfmon_ids);
 
-	for (int i = 0; i < copy.count; i++) {
+	for (i = 0; i < copy.count; i++) {
 		u32 sync;
 		u64 ids;
 		u32 __user *ids_pointer;
@@ -750,7 +754,7 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 
 		ids_pointer = u64_to_user_ptr(ids);
 
-		for (int j = 0; j < copy.nperfmons; j++) {
+		for (j = 0; j < copy.nperfmons; j++) {
 			if (get_user(id, ids_pointer++)) {
 				kvfree(qinfo->queries);
 				return -EFAULT;
-- 
2.44.0

