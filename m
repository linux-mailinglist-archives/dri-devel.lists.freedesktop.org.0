Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF6BB04A0D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 00:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3307910E4FD;
	Mon, 14 Jul 2025 22:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Jbe5XYuc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2251710E4F2;
 Mon, 14 Jul 2025 22:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=krH+VWHQr+aEkT3p91ADZAu3tVM2zwuCGfOiPJmDBfc=; b=Jbe5XYuct23XWzwLDpCCb/AKsN
 TwgbmgOGwhX+sr++El/fUjLJO4hKqcM4P4RM8mwQEWpNvAdk+wXdEp4lS7yC33uAnd7wJ67powJpv
 uIZI3DbGnpd3dJS9LI1CrOFG99yurL6fB9t5438HZpuLAVpiBa8bSY7X9g3HkiSbsfCRatc8/OSd6
 Qoyn8LMBjvTWAb1WOUgIzhn0ECf5cx/b9dCjXfxjMDLBqOyhdNLyFbaCgNCELyATmBRhK0gKzsuUp
 1AVLN3DAbq2jAdOOjN0rDjeLy/KCVs3uStflzQJ40XHzPV6QK4IxmMoXO33K4u1wzy3A1/TY4kgmO
 x8MvERKw==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ubRLg-00Gaod-3a; Tue, 15 Jul 2025 00:08:36 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 14 Jul 2025 19:07:09 -0300
Subject: [PATCH v6 8/8] drm/panfrost: Use DRM_GPU_SCHED_STAT_NO_HANG to
 skip the reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250714-sched-skip-reset-v6-8-5c5ba4f55039@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=sxWOlZK5QB5jdRqSvq8dUQVhRlLER1UbbdKyJ4mpqvI=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBodX+bg6XO+ENU9AVtICFiy7EBWXTQm1f6CVsE8
 XB8e7RIebaJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaHV/mwAKCRA/8w6Kdoj6
 qgiQCAC1WPscGiJBVkZRQytslH7g2I9/AkFQP6i5RUh4FlPP+vfoqv6UvbKQqnloMsfbVfs+3Sv
 3shMywgKZZMJwcBj2/WXXJz4vSZuoWsAf3uNP2M/V0cIuXsD4LYCCZeOPmspMgDMeTmRqEDQ9mq
 JxyOemyeqfVgTzQAkas7RuYE0WtDSLlMgY9DTTzXeB7NtPS/FepQOh6vQIGg30d+IOCnleamFFE
 u8hf+95RX4XTkySx1n/TZoVciCx42oSIZORCuAxS/jmfuDy45BpFrTjLFNcoajMazrKt2MGqqr3
 d+PR27T7uL306aeCAigDcIpQjLIcu7XxZ/3kXl+Ko2FBP4Kf
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

Panfrost can skip the reset if TDR has fired before the free-job worker.
Currently, since Panfrost doesn't take any action on these scenarios, the
job is being leaked, considering that `free_job()` won't be called.

To avoid such leaks, inform the scheduler that the job did not actually
timeout and no reset was performed through the new status code
DRM_GPU_SCHED_STAT_NO_HANG.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index afcffe7f8fe9e11f84e4ab7e8f5a72f7bf583690..842e012cdc68e130a13e08ffae3b7fdf5f8e1acc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -751,11 +751,11 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	int js = panfrost_job_get_slot(job);
 
 	/*
-	 * If the GPU managed to complete this jobs fence, the timeout is
-	 * spurious. Bail out.
+	 * If the GPU managed to complete this jobs fence, the timeout has
+	 * fired before free-job worker. The timeout is spurious, so bail out.
 	 */
 	if (dma_fence_is_signaled(job->done_fence))
-		return DRM_GPU_SCHED_STAT_RESET;
+		return DRM_GPU_SCHED_STAT_NO_HANG;
 
 	/*
 	 * Panfrost IRQ handler may take a long time to process an interrupt
@@ -770,7 +770,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 
 	if (dma_fence_is_signaled(job->done_fence)) {
 		dev_warn(pfdev->dev, "unexpectedly high interrupt latency\n");
-		return DRM_GPU_SCHED_STAT_RESET;
+		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
 	dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",

-- 
2.50.0

