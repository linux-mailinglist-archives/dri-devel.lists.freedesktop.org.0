Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A238A46B96
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 20:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5F710E2F2;
	Wed, 26 Feb 2025 19:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nbv3h4GV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E140B10E9D1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 19:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/OdmZyM7ZvrN3TO3XrZM97Tw69JkUJrTMKmLEHl8YSg=; b=nbv3h4GV2aAXl5OHjBBi4Nq2BG
 by/+B+vB1/Fxifq3bi8ICmjsPkAC+1TbPVrxykYH1b2Vp998H7YqYUzATM8mcyN1PPNwSxJOJCLJg
 i1erzsP6tI3Nvy4zh0TvpYnmL+cu9Re9BCyVnpk2VC6QKEZ493kjqXoqiY+DFGDsI3loygvsdj4LC
 +pJ6YLIVMG6hM7LFnKUwAK+5npXpZJpaMlmsyrqst9XLOVT81qKAXGL9/xh7ISeRlDi8zop8w8rJ/
 WGS+/7sqjQTx4NaIFaT/eQcn7+KQSk2nuyTAi6lnBk7KM/jCv+UsuTKNNz/ZH7eKW/H2GMJBxfWhP
 RRSprr1A==;
Received: from [187.36.213.55]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tnNZ6-0019lA-5P; Wed, 26 Feb 2025 20:59:38 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 26 Feb 2025 16:59:00 -0300
Subject: [PATCH 2/6] drm/v3d: Set job pointer to NULL when the job's fence
 has an error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250226-v3d-gpu-reset-fixes-v1-2-83a969fdd9c1@igalia.com>
References: <20250226-v3d-gpu-reset-fixes-v1-0-83a969fdd9c1@igalia.com>
In-Reply-To: <20250226-v3d-gpu-reset-fixes-v1-0-83a969fdd9c1@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2786; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=akT7R3rJ6Uf368r0WfvgEH8YcbaEI+Q1q0VGx+/dWPQ=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBnv3KfUQ2tvdNWbOy4Fe3R7YGNyzrAL7m8b6av1
 nlAqtKESBCJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ79ynwAKCRA/8w6Kdoj6
 qmnCCACh+P9jocUUk/1zZC8HFcpDDJuLtHN8KK205tAnc3J3Lba7FR+RBPDRkn1QAgD/xKYZDxi
 cel7Q7SiGS5aRGeLWp38a/y0hhhqJQDEqM1MZGENcNF/JiBWsFdzlQ8zYdrPuID3qRFyQwI0XqR
 uly7ZXUnYDH9dIuD5lvM7QSfKc9CIs17UFGdbPoFRFydXPGfuNoeyTyai+NcH4/7pIJsZMQmY2u
 RYXSQijwqQ35OjKq/wP9/xi9cyPjb4oLwnigSGIgAfSO/amoHT+BAjUkXUKhUEQfizLUcLbf1wj
 QUNrCLXLURRIG7OSi0v3g1za9xXw3w7dTxryMSAyaRgvaN0J
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

Similar to commit e4b5ccd392b9 ("drm/v3d: Ensure job pointer is set to
NULL after job completion"), ensure the job pointer is set to `NULL` when
a job's fence has an error. Failing to do so can trigger kernel warnings
in specific scenarios, such as:

1. v3d_csd_job_run() assigns `v3d->csd_job = job`
2. CSD job exceeds hang limit, causing a timeout → v3d_gpu_reset_for_timeout()
3. GPU reset
4. drm_sched_resubmit_jobs() sets the job's fence to `-ECANCELED`.
5. v3d_csd_job_run() detects the fence error and returns NULL, not
   submitting the job to the GPU
6. User-space runs `modprobe -r v3d`
7. v3d_gem_destroy()

v3d_gem_destroy() triggers a warning indicating that the CSD job never
ended, as we didn't set `v3d->csd_job` to NULL after the timeout. The same
can also happen to BIN, RENDER, and TFU jobs.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index c2010ecdb08f4ba3b54f7783ed33901552d0eba1..34c42d6e12cde656d3b51a18be324976199eceae 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -226,8 +226,12 @@ static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
 	struct dma_fence *fence;
 	unsigned long irqflags;
 
-	if (unlikely(job->base.base.s_fence->finished.error))
+	if (unlikely(job->base.base.s_fence->finished.error)) {
+		spin_lock_irqsave(&v3d->job_lock, irqflags);
+		v3d->bin_job = NULL;
+		spin_unlock_irqrestore(&v3d->job_lock, irqflags);
 		return NULL;
+	}
 
 	/* Lock required around bin_job update vs
 	 * v3d_overflow_mem_work().
@@ -281,8 +285,10 @@ static struct dma_fence *v3d_render_job_run(struct drm_sched_job *sched_job)
 	struct drm_device *dev = &v3d->drm;
 	struct dma_fence *fence;
 
-	if (unlikely(job->base.base.s_fence->finished.error))
+	if (unlikely(job->base.base.s_fence->finished.error)) {
+		v3d->render_job = NULL;
 		return NULL;
+	}
 
 	v3d->render_job = job;
 
@@ -327,8 +333,10 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
 	struct drm_device *dev = &v3d->drm;
 	struct dma_fence *fence;
 
-	if (unlikely(job->base.base.s_fence->finished.error))
+	if (unlikely(job->base.base.s_fence->finished.error)) {
+		v3d->tfu_job = NULL;
 		return NULL;
+	}
 
 	v3d->tfu_job = job;
 
@@ -373,8 +381,10 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 	struct dma_fence *fence;
 	int i, csd_cfg0_reg;
 
-	if (unlikely(job->base.base.s_fence->finished.error))
+	if (unlikely(job->base.base.s_fence->finished.error)) {
+		v3d->csd_job = NULL;
 		return NULL;
+	}
 
 	v3d->csd_job = job;
 

-- 
Git-154)

