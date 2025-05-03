Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F29EAA82E2
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 23:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6308710E3BA;
	Sat,  3 May 2025 21:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QG49nfvE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9393C10E3B9;
 Sat,  3 May 2025 21:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FWfuza4xS9W4/RhiXlJYDrYRtbmpRBpoENK3RG2kCk4=; b=QG49nfvE7r0S36SXoxG1uxQJeC
 B1yDrIkDEYVADF502Qn0IF3skY+e42VT3xXoTqS8WiJVVPWaHTw0K5xYiiEQVLBUDi7O0in50oTwc
 YxY2J934vqYCmOuiG2prMklt9U1m2VA83HUq8fBCDdDC/hdrNlxBgwMFa1j5BjXf0Ms6VVTB+Hj71
 qjj1UtwoI44XrGI4ZaaY6JPqk96NMdARkugaOMCMZ7cQzh2cephbzr60ZwrOP/mFkadftyFTK7paR
 Lh5b63a5QKXgU3w5R5pPHgTNW9YT+2BhIA5aKEyOwHCMLbR8gJRyoW7wldsZayaUnOKKoDJuBv1rM
 427tsqEg==;
Received: from [189.7.87.174] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uBJwh-002dbs-2d; Sat, 03 May 2025 23:01:19 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 03 May 2025 17:59:59 -0300
Subject: [PATCH 8/8] drm/panfrost: Use DRM_GPU_SCHED_STAT_RUNNING to skip
 the reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250503-sched-skip-reset-v1-8-ed0d6701a3fe@igalia.com>
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
In-Reply-To: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1776; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=jObKYBZsFH7+SKKNcXFa3Ih50QHazwU3/yFMT+nEuT0=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoFoPn5VyMOr19WYrB2cwHLeUTp3kWi7t/rlzA6
 rGrOdZkCNWJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaBaD5wAKCRA/8w6Kdoj6
 qj2KB/9qJJYz0VZRJOzJv6RerrBDGvzNHgVVza55bKOApJBYxZTlKK/mtkfYtFIBq1xFmwisqgg
 ig+QV3+jecg7KjlAXLe+rxxHpe04H5RL88OyWX9cPov++Ww098hH7I4zwV4fZdFbWvGTycb0u15
 AV8rsPNqBRHxdj701GfhmKbYVx05ZkM/ANU+E9/k+fEgB8aOCWmID5hodO8Dd/7vnzBjveGjSZB
 59GPiiDRQvDLj/ULefiZnTiBZKDP9lkxPhPDoWTgo6UpkHixcJ1AF0l/pIXgbq+jlIGxMIXfITN
 yrGyWB5TdTcik/sqyu6tBG5MXLoBE1CbedrBEVxabczETJjK
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

Panfrost can skip the reset if TDR has fired before the IRQ handler.
Currently, since Panfrost doesn't take any action on these scenarios, the
job is being leaked, considering that `free_job()` won't be called.

To avoid such leaks, use the DRM_GPU_SCHED_STAT_RUNNING status to skip the
reset and rearm the timer.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 5657106c2f7d0a0ca6162850767f58f3200cce13..2948d5c02115544a0e0babffd850f1506152849d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -751,11 +751,11 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	int js = panfrost_job_get_slot(job);
 
 	/*
-	 * If the GPU managed to complete this jobs fence, the timeout is
-	 * spurious. Bail out.
+	 * If the GPU managed to complete this jobs fence, TDR has fired before
+	 * IRQ and the timeout is spurious. Bail out.
 	 */
 	if (dma_fence_is_signaled(job->done_fence))
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_RUNNING;
 
 	/*
 	 * Panfrost IRQ handler may take a long time to process an interrupt
@@ -770,7 +770,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 
 	if (dma_fence_is_signaled(job->done_fence)) {
 		dev_warn(pfdev->dev, "unexpectedly high interrupt latency\n");
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_RUNNING;
 	}
 
 	dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",

-- 
2.49.0

