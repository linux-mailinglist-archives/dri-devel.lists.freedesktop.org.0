Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A34B02047
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 17:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7581A10EA6B;
	Fri, 11 Jul 2025 15:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GrxXTjpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F338B10E2C7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 15:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c9AfspemzojQwyNjF1ZR+5MY30+GSNh1FvMRGBIGzkQ=; b=GrxXTjpb+9h+d/znrcVAUgWkT9
 qG06BAvHj3t0JasPZjoUtd4+Ldu4wlQHHQOHJuXv4ThmGARg7lvI5J43hx3U/EHbk4I5nk/lys4+D
 Grxtxj7TMHCvkHsgQAqf6wa2HDHqu7PUQDLdsJkqkmv+tR9rxqeot3zGrMNHFPXF0xRrJXpieb8tf
 CoS3KBFv90hZyOH/HJUo1vCVLEqxHeutY74T4pJ1NJl4eTgNs6w7Sfg/xcOyfTyZWjZ1gIrykxzYe
 H1eRSsBAdfP7qxVcf3hM45a1Efr6BdiThV8qfzTh0jxJ1F3DCYc4k/yX+uGp4k2bbs/sfiL1VctxT
 /0U5pncw==;
Received: from [187.36.210.68]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uaFWh-00FQIU-2M; Fri, 11 Jul 2025 17:19:03 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 11 Jul 2025 12:18:32 -0300
Subject: [PATCH 2/2] drm/v3d: Add parameter to retrieve the number of GPU
 resets per-fd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250711-v3d-reset-counter-v1-2-1ac73e9fca2d@igalia.com>
References: <20250711-v3d-reset-counter-v1-0-1ac73e9fca2d@igalia.com>
In-Reply-To: <20250711-v3d-reset-counter-v1-0-1ac73e9fca2d@igalia.com>
To: "Juan A. Suarez" <jasuarez@igalia.com>, 
 Iago Toral Quiroga <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3705; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=d9Y7GKF9kq5KRvi6prWDGkxsIDP/M5ikfTaSBCT6UF8=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBocStfw9xX19J0pPi+2PL4xeyFkLVXpu5MOek9a
 w5UOqSqu8aJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaHErXwAKCRA/8w6Kdoj6
 qtPJCACmzDOzEd0DjOivQ37DrDdzcOeeJWPeMH9sqZTktWmZs34x4RB1XDUkiCJ2RAlzbYent65
 V1DhhHTLhlHfwRmQLMHVUJ+PZ8EfR0J1slIwJ0nGs3DubibFxY16wiA7TbQwtAyxAG9pXlPVweU
 QMu2gJFkbhligyNqrf+8tzLLCA4V0biUwclGQvrLWTVVQO6ovMMMsOwvTEUVaxixmZLsBQLP5yc
 lbikUXV8DnO47dsQte48V9vxGJwVRpuxL/BqMcBz3emCXJubU7TK+ZOwayO/OE2B/mQLEZQSnEG
 gJpQRbbJ3JQ5juHLoFqKwvCiuRiQHCOXyrsLk0DQjwSwt4jH
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

The GL extension KHR_robustness uses the number of global and per-context
GPU resets to learn about graphics resets that affect a GL context. This
commit introduces a new V3D parameter to retrieve the number of GPU resets
triggered by jobs submitted through a file descriptor.

To retrieve this information, user-space must use DRM_V3D_PARAM_CONTEXT_RESET_COUNTER.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c   | 6 ++++++
 drivers/gpu/drm/v3d/v3d_drv.h   | 6 ++++++
 drivers/gpu/drm/v3d/v3d_sched.c | 3 +++
 include/uapi/drm/v3d_drm.h      | 1 +
 4 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 0f53ca7460044e2a74c31d6282914f49844066b2..2def155ce496ec5f159f6bda9929aeaae141d1a6 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -46,6 +46,7 @@ MODULE_PARM_DESC(super_pages, "Enable/Disable Super Pages support.");
 static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file_priv)
 {
+	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	struct drm_v3d_get_param *args = data;
 	static const u32 reg_map[] = {
@@ -112,6 +113,11 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 		args->value = v3d->reset_counter;
 		mutex_unlock(&v3d->reset_lock);
 		return 0;
+	case DRM_V3D_PARAM_CONTEXT_RESET_COUNTER:
+		mutex_lock(&v3d->reset_lock);
+		args->value = v3d_priv->reset_counter;
+		mutex_unlock(&v3d->reset_lock);
+		return 0;
 	default:
 		DRM_DEBUG("Unknown parameter %d\n", args->param);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 074cbccf88ddfe5961c779f0df93552264f54608..dabda7aaf00074d8de42dcdb345d5f3331ac13b2 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -230,6 +230,12 @@ struct v3d_file_priv {
 
 	/* Stores the GPU stats for a specific queue for this fd. */
 	struct v3d_stats stats[V3D_MAX_QUEUES];
+
+	/* Per-fd reset counter, must be incremented when a job submitted
+	 * by this fd causes a GPU reset. It must be protected by
+	 * &struct v3d_dev->reset_lock.
+	 */
+	unsigned int reset_counter;
 };
 
 struct v3d_bo {
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 29845917d7df5f9ff996fa52a728ff5d19dea90f..46003457a06e3c01637b2c0ed392660e4e569b4a 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -717,6 +717,8 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
 static enum drm_gpu_sched_stat
 v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
 {
+	struct v3d_job *job = to_v3d_job(sched_job);
+	struct v3d_file_priv *v3d_priv = job->file->driver_priv;
 	enum v3d_queue q;
 
 	mutex_lock(&v3d->reset_lock);
@@ -732,6 +734,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
 	v3d_reset(v3d);
 
 	v3d->reset_counter++;
+	v3d_priv->reset_counter++;
 
 	for (q = 0; q < V3D_MAX_QUEUES; q++)
 		drm_sched_resubmit_jobs(&v3d->queue[q].sched);
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 0a7ce2f6be19d2cbccf090f0db301119eb4b28ba..d9b01f4c3a047eac90899901cc603838ab5c9090 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -295,6 +295,7 @@ enum drm_v3d_param {
 	DRM_V3D_PARAM_MAX_PERF_COUNTERS,
 	DRM_V3D_PARAM_SUPPORTS_SUPER_PAGES,
 	DRM_V3D_PARAM_GLOBAL_RESET_COUNTER,
+	DRM_V3D_PARAM_CONTEXT_RESET_COUNTER,
 };
 
 struct drm_v3d_get_param {

-- 
2.50.0

