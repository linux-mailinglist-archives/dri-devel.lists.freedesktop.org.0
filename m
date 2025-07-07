Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9897AFB661
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 16:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5ADC10E4BD;
	Mon,  7 Jul 2025 14:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="o+a+7ksA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C85E10E4B6;
 Mon,  7 Jul 2025 14:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hL0Te+05pphALKaBruZC+X2BPj/eLtsiKWRilNRGoE8=; b=o+a+7ksAE4F/Ne7odJFL/RuDNe
 unMpH/T2FVaNag5GYD47dNolJ24PANx7VlAEKZ79Bs2K8IjfDoGqJjH+/NUXFRtws5bcmH3I/EfiA
 kV2hqFwp78Vs7k0m+cZqHM1N3Bkkt157hNsose/TRBvJ25lMpzoUQdsqH967X+ei2VNLI+CO0Btll
 ZQJUAdK1uoAkV+1qWWI6HQxLd7UzZPlfPo1ArW0ZbaMNqn7lK/qI9YDgQ4t9332erO3yC5WVvtCOA
 KAjThI2itrt9f0NytFO9XWYff3S128lfxHQxhYXzkWkZl3fPwmrKt3Pt81bKoPwJ0T9Tz/b99Yvj6
 Wd6njmVA==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uYn84-00DaQv-V7; Mon, 07 Jul 2025 16:47:37 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 07 Jul 2025 11:46:34 -0300
Subject: [PATCH v4 5/8] drm/v3d: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250707-sched-skip-reset-v4-5-036c0f0f584f@igalia.com>
References: <20250707-sched-skip-reset-v4-0-036c0f0f584f@igalia.com>
In-Reply-To: <20250707-sched-skip-reset-v4-0-036c0f0f584f@igalia.com>
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
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoa93YObIGL3cpOXETU9lbf0lRO6mKVXxcrPaPg
 sxSv9M5JhCJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaGvd2AAKCRA/8w6Kdoj6
 qpMDB/4gkfCwrwU1sBGfoTWVeX5tcvVXi6N8S+erv+We9ItYBHOJ5NV9Ut6hotLKCycmLvXgN1Z
 3zWzU/FXcZof3Sb73ejYdlrIFhdkX8do0V7aAqfzpK9BVoolNXncyOj3SMwugiMKElTHJKoxhe+
 3Kh4FMxmFvwdj3PGbHSnha+7Dfj9YKal82QXSIlOOmfmF2Z9yELXgJLB220ka0Va6OZxcJaNyaj
 nVsZ7aFU8S5zPCat++gh0bNKEJXX+WxoHy6l2k4ba4tU9FtX61YBpdN9cTD9TstS+d9M71oAmVm
 +DBVaUWuURSQcLBfPzEvqw/DlcGu/3vm1cBSpG8Rm0zmdaUH
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

