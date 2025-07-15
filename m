Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C3DB04A07
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 00:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F011F10E02C;
	Mon, 14 Jul 2025 22:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Hd8K3D82";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103D010E02C;
 Mon, 14 Jul 2025 22:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hL0Te+05pphALKaBruZC+X2BPj/eLtsiKWRilNRGoE8=; b=Hd8K3D82typDHv8fK+G2afCDKb
 pd3Fitb38N9jrDeMirlPdnzKq+Tum4i+k/fDPYHzIfH0p62PIxWwwVy5GVF4BIAZF1YKS33BNR8j6
 8lglkXS6A3PkivjSzJ/6/XbsX/f3jWml6R6sbv8OlqR9lRutlkvTqu7goRYwypTagK6lBjkGx9Ovp
 sZ9k2A+LWFgP8caq+hiSzdyqQdnoUPMpoqdRO911MZzw9yiqdKS54NM0Vo8ZFAAsYWR71g6AaU38F
 to5c67JwTY5bboBBg0FwswKvS8iapIfyCVDTZYW5CA/4pLAKtdFwSw5b8ec5TqJQUpICo+tjfOsvz
 zflEyhow==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ubRLK-00Gaod-2L; Tue, 15 Jul 2025 00:08:14 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 14 Jul 2025 19:07:06 -0300
Subject: [PATCH v6 5/8] drm/v3d: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250714-sched-skip-reset-v6-5-5c5ba4f55039@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2153; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=43dKvL+k+1OnYIc0UXqZmiF8OGzqYfBkfMaZx3ZSBs8=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBodX+ah07gojg+tVeMH69Lx2Tz65JOxrbgVm0SO
 ihfW6p0REKJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaHV/mgAKCRA/8w6Kdoj6
 qmINB/45w3EQVTb+Zr3AyCklt2dWTDvLUHwLyqUTVFBGj1bSzdZ8e+5xXcP8TEln3sQvsP5rVR+
 Y3HAsw2AqdUcXlxaqneQzDAM803Q74BN1sbKGdmSUoAQ6fCESWw5KJbqwR0LTV1pFByAiwXt5ex
 6Pr6Hv9gZD3m/cu3AHxWDBOuqLoBUg6r9gEPfOUHmeosS8gk5Ypa7Qm1QmHtoh0vuUAMUOvwSj4
 kVMaIm3UNnFpgR2oS9Hy6W3FkOGF3aCMvkU5xQXZ6C3fnWtRgTdhrfseys6D/BatAH62wx7z9Xm
 PTqE+dwkx/1A6asnCfAvBtqOkBLtHCyXAxasowvsn+4MqxS6
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

When a CL/CSD job times out, we check if the GPU has made any progress
since the last timeout. If so, instead of resetting the hardware, we skip
the reset and allow the timer to be rearmed. This gives long-running jobs
a chance to complete.

Instead of manipulating scheduler's internals, inform the scheduler that
the job did not actually timeout and no reset was performed through
the new status code DRM_GPU_SCHED_STAT_NO_HANG.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index e2b7f24d528e773968daea0f5b31c869584bb692..cc85f1b19ac405146a2a516f335a46376684bc91 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -744,16 +744,6 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
 	return DRM_GPU_SCHED_STAT_RESET;
 }
 
-static void
-v3d_sched_skip_reset(struct drm_sched_job *sched_job)
-{
-	struct drm_gpu_scheduler *sched = sched_job->sched;
-
-	spin_lock(&sched->job_list_lock);
-	list_add(&sched_job->list, &sched->pending_list);
-	spin_unlock(&sched->job_list_lock);
-}
-
 static enum drm_gpu_sched_stat
 v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
 		    u32 *timedout_ctca, u32 *timedout_ctra)
@@ -772,8 +762,7 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
 		*timedout_ctca = ctca;
 		*timedout_ctra = ctra;
 
-		v3d_sched_skip_reset(sched_job);
-		return DRM_GPU_SCHED_STAT_RESET;
+		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
 	return v3d_gpu_reset_for_timeout(v3d, sched_job);
@@ -818,8 +807,7 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_job)
 	if (job->timedout_batches != batches) {
 		job->timedout_batches = batches;
 
-		v3d_sched_skip_reset(sched_job);
-		return DRM_GPU_SCHED_STAT_RESET;
+		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
 	return v3d_gpu_reset_for_timeout(v3d, sched_job);

-- 
2.50.0

