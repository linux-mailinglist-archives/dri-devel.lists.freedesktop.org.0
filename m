Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06FC7FA96C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 20:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A0B10E3E2;
	Mon, 27 Nov 2023 19:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E2B10E3DB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 19:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c3D9LKo1cPAH9/f4DLFIp0Vb1/L98eEDQhFQP8Pqx8E=; b=nVkpU+ciSHbzlNFCKQFPSTD9kJ
 otqJidOkbS9uuq63G55I1u7QseMUZi5CsP/QB3oqA1o5NGqSax+QRE/XeA1cOS8FQL7dApGK41Lye
 BjzNfD4AABVfkygmqIeGxUdyRvRKWK9RqKoxJCROX1NdrsiqFd8H3ZvpqMOtIw7DhKTtw57dBHXyt
 ar9KtpMF6LQ59/MYgRRwN2ko2ZcXqenIynrhvNfKNCEprzxqHWlT8cgpBgiU14cBMVFfSIFkbwhKQ
 IuhSGd2X+Y5gKLLHdwAaIbVU82mpA2+NeUWNupFMbG9oQ9Un8hEzGrdQs67G+6lH1lGble9PpO0Cg
 sjFYMLKg==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r7gpt-007jiM-Ca; Mon, 27 Nov 2023 20:00:01 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 08/17] drm/v3d: Use v3d_get_extensions() to parse CPU job
 data
Date: Mon, 27 Nov 2023 15:48:26 -0300
Message-ID: <20231127185723.10348-10-mcanal@igalia.com>
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

Currently, v3d_get_extensions() only parses multisync data and assigns
it to the `struct v3d_submit_ext`. But, to implement the CPU job with
user extensions, we want v3d_get_extensions() to be able to parse CPU
job data and assign it to the `struct v3d_cpu_job`.

Therefore, allow the function v3d_get_extensions() to use `struct v3d_cpu_job *`
as a parameter. If the `struct v3d_cpu_job *` is assigned to NULL, it means
that the job is a GPU job and CPU job extensions should be rejected.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 918e28b1d00a..124935547f17 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -323,10 +323,9 @@ v3d_get_multisync_post_deps(struct drm_file *file_priv,
 static int
 v3d_get_multisync_submit_deps(struct drm_file *file_priv,
 			      struct drm_v3d_extension __user *ext,
-			      void *data)
+			      struct v3d_submit_ext *se)
 {
 	struct drm_v3d_multi_sync multisync;
-	struct v3d_submit_ext *se = data;
 	int ret;
 
 	if (se->in_sync_count || se->out_sync_count) {
@@ -340,7 +339,7 @@ v3d_get_multisync_submit_deps(struct drm_file *file_priv,
 	if (multisync.pad)
 		return -EINVAL;
 
-	ret = v3d_get_multisync_post_deps(file_priv, data, multisync.out_sync_count,
+	ret = v3d_get_multisync_post_deps(file_priv, se, multisync.out_sync_count,
 					  multisync.out_syncs);
 	if (ret)
 		return ret;
@@ -359,7 +358,8 @@ v3d_get_multisync_submit_deps(struct drm_file *file_priv,
 static int
 v3d_get_extensions(struct drm_file *file_priv,
 		   u64 ext_handles,
-		   void *data)
+		   struct v3d_submit_ext *se,
+		   struct v3d_cpu_job *job)
 {
 	struct drm_v3d_extension __user *user_ext;
 	int ret;
@@ -375,15 +375,16 @@ v3d_get_extensions(struct drm_file *file_priv,
 
 		switch (ext.id) {
 		case DRM_V3D_EXT_ID_MULTI_SYNC:
-			ret = v3d_get_multisync_submit_deps(file_priv, user_ext, data);
-			if (ret)
-				return ret;
+			ret = v3d_get_multisync_submit_deps(file_priv, user_ext, se);
 			break;
 		default:
 			DRM_DEBUG_DRIVER("Unknown extension id: %d\n", ext.id);
 			return -EINVAL;
 		}
 
+		if (ret)
+			return ret;
+
 		user_ext = u64_to_user_ptr(ext.next);
 	}
 
@@ -430,7 +431,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
-		ret = v3d_get_extensions(file_priv, args->extensions, &se);
+		ret = v3d_get_extensions(file_priv, args->extensions, &se, NULL);
 		if (ret) {
 			DRM_DEBUG("Failed to get extensions.\n");
 			return ret;
@@ -585,7 +586,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
-		ret = v3d_get_extensions(file_priv, args->extensions, &se);
+		ret = v3d_get_extensions(file_priv, args->extensions, &se, NULL);
 		if (ret) {
 			DRM_DEBUG("Failed to get extensions.\n");
 			return ret;
@@ -692,7 +693,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
-		ret = v3d_get_extensions(file_priv, args->extensions, &se);
+		ret = v3d_get_extensions(file_priv, args->extensions, &se, NULL);
 		if (ret) {
 			DRM_DEBUG("Failed to get extensions.\n");
 			return ret;
@@ -805,7 +806,7 @@ v3d_submit_cpu_ioctl(struct drm_device *dev, void *data,
 		return ret;
 
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
-		ret = v3d_get_extensions(file_priv, args->extensions, &se);
+		ret = v3d_get_extensions(file_priv, args->extensions, &se, cpu_job);
 		if (ret) {
 			DRM_DEBUG("Failed to get extensions.\n");
 			goto fail;
-- 
2.42.0

