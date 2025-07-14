Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114E1B04A09
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 00:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA4E10E4FA;
	Mon, 14 Jul 2025 22:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="S3Kh8/4S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7251110E4FA;
 Mon, 14 Jul 2025 22:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/z77236zbVbqiLd13J+Ppo/2D7d2/o9MLDLarUedpiA=; b=S3Kh8/4SxVkbetBFQ0l7wXwryj
 iKdWpkfb4A7lIOA/WSbBetanMtl9a0h3mbCRpI8M/PsxHG+uWLOOjarJORumClX9et3vmrPTCXIWW
 vyFvGDpuwJU+WjhQ6zw6MuklyJSZFBj+i3Uk9pRg1EAOfKBWFA9NlpBWes394t646q7PxZuHZS3sv
 yA/IQSu3YwnNvBNqyuFOAWb+FiitOrvHLBQdljxcVE4VgqlZxm0jBurUQeTO/CqK38M+qdfzGTINN
 v22RjaeUL5ZBxDwoxBgUH3eWHG1NS26hTivo/E5LadSSZnK2cYpuTfbQlQqUULkKIv1FxxfDSC0Hu
 jP66h1mQ==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ubRLR-00Gaod-FJ; Tue, 15 Jul 2025 00:08:21 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 14 Jul 2025 19:07:07 -0300
Subject: [PATCH v6 6/8] drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HANG to skip
 the reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250714-sched-skip-reset-v6-6-5c5ba4f55039@igalia.com>
References: <20250714-sched-skip-reset-v6-0-5c5ba4f55039@igalia.com>
In-Reply-To: <20250714-sched-skip-reset-v6-0-5c5ba4f55039@igalia.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2212; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=kegDCLE0polDOU/TJY6/eUbMwn96qiLsCrO42k0Yfs8=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBodX+a9RaPRQqGrJ2UfbgRlNP/qabTmlaihY/r+
 3CYvpA1JHWJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaHV/mgAKCRA/8w6Kdoj6
 qpHVB/0e+Dk0A/2UbAqbFoeSD0fuuvhyYDiGf8WDae8bqA4rlD6Af/iYsm7l3efgciLo9lnyt3h
 4vMLOPAfd9yJ5deLdSM98WmIMNEdOyDSzPCB8ZJzi5d49jAa+LiTWvPzO4qy7SKbJEtR83+R6nn
 M4KWTDlKWY4NKTgpzkgMUO3YgV6BdnDDUmJaZsgUC8Igvb/sa4Mtnthyeop2fVdNm9xyUgM5M5a
 ZhQSd/hnmY0KwbGxCeyypA/FgHCegSSgN5Q7O7OpjW+Lv+477VHdLVBHb5Nh+tff9HZcnPPLyiD
 VIa2cIEB56KMZvTOe9Uj+jmNgM1g0F9dzEw2JDIZ2MsvjhY2
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

Etnaviv can skip a hardware reset in two situations:

  1. TDR has fired before the free-job worker and the timeout is spurious.
  2. The GPU is still making progress on the front-end and we can give
     the job a chance to complete.

Instead of manipulating scheduler's internals, inform the scheduler that
the job did not actually timeout and no reset was performed through
the new status code DRM_GPU_SCHED_STAT_NO_HANG.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_sched.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 7146069a98492f5fab2a49d96e2054f649e1fe3d..df4232d7e135d11e0fc9fc456a2a2b0070c7f548 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -40,11 +40,11 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	int change;
 
 	/*
-	 * If the GPU managed to complete this jobs fence, the timout is
-	 * spurious. Bail out.
+	 * If the GPU managed to complete this jobs fence, the timeout has
+	 * fired before free-job worker. The timeout is spurious, so bail out.
 	 */
 	if (dma_fence_is_signaled(submit->out_fence))
-		goto out_no_timeout;
+		return DRM_GPU_SCHED_STAT_NO_HANG;
 
 	/*
 	 * If the GPU is still making forward progress on the front-end (which
@@ -70,7 +70,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 		gpu->hangcheck_dma_addr = dma_addr;
 		gpu->hangcheck_primid = primid;
 		gpu->hangcheck_fence = gpu->completed_fence;
-		goto out_no_timeout;
+		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
 	/* block scheduler */
@@ -87,10 +87,6 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 
 	drm_sched_start(&gpu->sched, 0);
 	return DRM_GPU_SCHED_STAT_RESET;
-
-out_no_timeout:
-	list_add(&sched_job->list, &sched_job->sched->pending_list);
-	return DRM_GPU_SCHED_STAT_RESET;
 }
 
 static void etnaviv_sched_free_job(struct drm_sched_job *sched_job)

-- 
2.50.0

