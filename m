Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B1BAFCBF5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 15:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E51010E646;
	Tue,  8 Jul 2025 13:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="sFVF6E60";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F62710E63E;
 Tue,  8 Jul 2025 13:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g9sJBNVIo3uuDSUs723Sgscyj2rHow8wQCpWu4wEbaY=; b=sFVF6E60Adc7elG/cOtTTXrSbx
 qzfsWIS76Sb89ASjrbvDSHf5zwb1ofOXwNvNAkMbg7rSN5NU7oVZ4DI73uCqsSp58MVcP/788ZAfV
 5JvRBWDoYaTxBKGIJB+OfhA2SOnTSFhUahwKTibka497EIwwJ83Ofwsj9Wgb+RnaBwNQCyI2kxrUU
 iqeDSaYDna+PI58y+u2yGVFXlNkXLsRuvE5Wj2Pt264rdS9maQyWcpTtf+/dbczCBYpuakDjyFl2f
 VLKmzUWUyeFY8zqEM//o8RI6MY45A3yEo+3zyAZlBrnCZe7dppt5LfRJhXeYLDzvUYoVPoOIpPN//
 9wPdMBhA==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uZ8LV-00E1hT-9H; Tue, 08 Jul 2025 15:26:53 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 08 Jul 2025 10:25:46 -0300
Subject: [PATCH v5 6/8] drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HANG to skip
 the reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250708-sched-skip-reset-v5-6-2612b601f01a@igalia.com>
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
In-Reply-To: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2473; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=jrFI9F0pYrqHwi/poBjM/m0nbOii0/ogvoHVAI0i3MU=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBobRxnUNSYndUcswhGf4k/OTnRu+xELKwAK84w/
 sSnzR1Yz2GJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaG0cZwAKCRA/8w6Kdoj6
 qsvjB/42JfXm1Rqh/2pMsb2Y7n0SMQAxCnr4ODTnDNtokgY3x3+EiFXd7nT+Qgo/aGykUeqKFRm
 kSFu6kcof4NiAniUjnEuQF7rASbN0p6aebN1TksuTCLSy/R5egayFOfDNxk8mRjFLoBdRHOT7Qs
 zFJFUu5w4f+jBFgHFfeLULkDWurCp6iHqalVuCOCUdFwj1EhCyS0oF2s7ZPxST2SKw1nXoB11qN
 erba11fNzXzxTBhY8peVuxplPgFC11hcZmgFivA5nrXmIbSw9XA0vu6ALSVKrjcev9Nj9zcifSS
 HA7EDGx+7G3CbxLIMLyBeogAlrUmMxym3GF3cRB3GgqAAJ8U
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
 drivers/gpu/drm/etnaviv/etnaviv_sched.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 030e6c3233bed9edd5d9c2f49f842f604e57fc1c..46f5391e84a12232b247886cf1311f8e09f42f04 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -35,17 +35,16 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 							  *sched_job)
 {
 	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
-	struct drm_gpu_scheduler *sched = sched_job->sched;
 	struct etnaviv_gpu *gpu = submit->gpu;
 	u32 dma_addr, primid = 0;
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
@@ -71,7 +70,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 		gpu->hangcheck_dma_addr = dma_addr;
 		gpu->hangcheck_primid = primid;
 		gpu->hangcheck_fence = gpu->completed_fence;
-		goto out_no_timeout;
+		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
 	/* block scheduler */
@@ -87,12 +86,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	drm_sched_resubmit_jobs(&gpu->sched);
 
 	drm_sched_start(&gpu->sched, 0);
-	return DRM_GPU_SCHED_STAT_RESET;
 
-out_no_timeout:
-	spin_lock(&sched->job_list_lock);
-	list_add(&sched_job->list, &sched->pending_list);
-	spin_unlock(&sched->job_list_lock);
 	return DRM_GPU_SCHED_STAT_RESET;
 }
 

-- 
2.50.0

