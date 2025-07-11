Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E509B02046
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 17:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E235C10E39E;
	Fri, 11 Jul 2025 15:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UaSSecu8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9248510E39F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pHuW5ZCfYIsQ/0GsHRPTyT3oeoZ53FCNCC31V9qKI4c=; b=UaSSecu8J+LCtmE6Vsdb1ER/Yb
 BhjrPO1DAnn/3oD6Ifm1QqXvlETVMp5Efut61uHoZh/SRgAwPvtEcqC8rYa92ZKW2e1imgutlx5CX
 dy+E77+/v3gMIqWlKMliksDzdFvIRGRQshgXRLHwcs9zahsTWpPjOycRZ5Qre19NDjn9S78S3fxV8
 2a/F/q4CbZ8rPpZl+mdDeFolm8ecrU9NlbAcqPEC8vAgOoNMf0ZEIGZy7+MFfG4GnKrPspbJO9aEA
 BVaXGxeyaYSTVrLq1iuesXQ2ddRPq3lKBEWOhAnqcKH97fPvUrxZhYzA+NWKJhNFsiQcV2MOV0Dcg
 y9E4chCg==;
Received: from [187.36.210.68]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uaFWe-00FQIU-IB; Fri, 11 Jul 2025 17:19:00 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 11 Jul 2025 12:18:31 -0300
Subject: [PATCH 1/2] drm/v3d: Add parameter to retrieve the global number
 of GPU resets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250711-v3d-reset-counter-v1-1-1ac73e9fca2d@igalia.com>
References: <20250711-v3d-reset-counter-v1-0-1ac73e9fca2d@igalia.com>
In-Reply-To: <20250711-v3d-reset-counter-v1-0-1ac73e9fca2d@igalia.com>
To: "Juan A. Suarez" <jasuarez@igalia.com>, 
 Iago Toral Quiroga <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=C7Jn3XRpLHqYg7lZXc+plntJfYjPaU8HZVTIwzYiDKM=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBocStfxku1m4OXpJaQYvhQOUL5wUfeWniP3ALUw
 H3G9fWFIQKJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaHErXwAKCRA/8w6Kdoj6
 quRiB/9LIGlZQZ2yGwba4+A9TVlYcRXWUy9Ns5ATJ+o4o1/fCxC2rDA63BJbEhwVeqfdztWh3I6
 oEs6bGa/VUrGdq31H7mC8b4JGQszASD8nzp4mM7vSpp3C9aqi4ilWlyYuiu9EI/0MGyKZ93djTK
 dWIO3pDUxFA1hPJicOp4CBQPPsNuDhHsyeSl9o4mf0QthBM8XjiO3o3Ujem6KGBIM/aicO7vZoR
 841/iLu9sJXX+HtY+CZaIWhEN8v7Ucfbvxa6pGQjU+oIiiiieyStq1l/KGmqJ8HqSaFew3EDOmz
 fd11g1Scru+wMc/iC8zsRkRAgN1UwVOpvcB267LNDGGoojIg
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
commit introduces a new V3D parameter to retrieve the global number of
GPU resets that have happened since the driver was probed.

To retrieve this information, user-space must use DRM_V3D_PARAM_GLOBAL_RESET_COUNTER.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c   | 5 +++++
 drivers/gpu/drm/v3d/v3d_drv.h   | 5 +++++
 drivers/gpu/drm/v3d/v3d_sched.c | 2 ++
 include/uapi/drm/v3d_drm.h      | 1 +
 4 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 5e997ae8bc9c7ac110d79df8b5cf81a59dc0a291..0f53ca7460044e2a74c31d6282914f49844066b2 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -107,6 +107,11 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 	case DRM_V3D_PARAM_SUPPORTS_SUPER_PAGES:
 		args->value = !!v3d->gemfs;
 		return 0;
+	case DRM_V3D_PARAM_GLOBAL_RESET_COUNTER:
+		mutex_lock(&v3d->reset_lock);
+		args->value = v3d->reset_counter;
+		mutex_unlock(&v3d->reset_lock);
+		return 0;
 	default:
 		DRM_DEBUG("Unknown parameter %d\n", args->param);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index b51f0b648a08011f737317ec1841d5ab316355b2..074cbccf88ddfe5961c779f0df93552264f54608 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -196,6 +196,11 @@ struct v3d_dev {
 	 * all jobs.
 	 */
 	struct v3d_perfmon *global_perfmon;
+
+	/* Global reset counter. The counter must be incremented when
+	 * a GPU reset happens. It must be protected by @reset_lock.
+	 */
+	unsigned int reset_counter;
 };
 
 static inline struct v3d_dev *
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 35f131a46d0701cc8040d3b9654595a2bc260eab..29845917d7df5f9ff996fa52a728ff5d19dea90f 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -731,6 +731,8 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
 	/* get the GPU back into the init state */
 	v3d_reset(v3d);
 
+	v3d->reset_counter++;
+
 	for (q = 0; q < V3D_MAX_QUEUES; q++)
 		drm_sched_resubmit_jobs(&v3d->queue[q].sched);
 
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index dbbc404d2b3dd6c8b8e3969b0b76b7d8b371dddb..0a7ce2f6be19d2cbccf090f0db301119eb4b28ba 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -294,6 +294,7 @@ enum drm_v3d_param {
 	DRM_V3D_PARAM_SUPPORTS_CPU_QUEUE,
 	DRM_V3D_PARAM_MAX_PERF_COUNTERS,
 	DRM_V3D_PARAM_SUPPORTS_SUPER_PAGES,
+	DRM_V3D_PARAM_GLOBAL_RESET_COUNTER,
 };
 
 struct drm_v3d_get_param {

-- 
2.50.0

