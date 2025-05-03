Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D963AA82DF
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 23:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDD610E3C8;
	Sat,  3 May 2025 21:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KoYM2sr9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C036510E3C3;
 Sat,  3 May 2025 21:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CVTr3XxJSkz7x5EPFt9PfCrbVKKxU5WzStQhdn2wvvU=; b=KoYM2sr90hP8eMwlTKu2B02nZC
 JOJR/gyUcmXpakJTwwoZmQWJJxhEdU6xSoJnSxw6qP3gfTcOEqknsgmGIChyiM/C5ExV6br9G6zmJ
 h/CNWpHwuTft66mjAwteMl17BHqyVY+KbxevzY9EAoDGuARee5G++mZqGQ1nHDjlydC3SCAlXwC1p
 c+ryufeLLIzsR9w+avQEG1rNsn/dsN2xx+ZDivo5q1RLx0dWt+qq1QvkVEAV/kDOHu1AN62szzIYI
 20eMfKLkkKRbj+sMJo69QdnGtbRskl3CwhsGNP1ZbHjuwXz63JRBfqpvPPUdg/Pszmb1ewRQXqH5V
 wD+AgAlg==;
Received: from [189.7.87.174] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uBJwa-002dbs-Vl; Sat, 03 May 2025 23:01:13 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 03 May 2025 17:59:58 -0300
Subject: [PATCH 7/8] drm/xe: Use DRM_GPU_SCHED_STAT_RUNNING to skip the reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250503-sched-skip-reset-v1-7-ed0d6701a3fe@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=/+D7XiJbNLu3j49E0Te5yMdIaMChIB7MT/VGvRAutjo=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoFoPnNIStN3/IcnjNvJOoMq9RE41JZEZ+yqMVY
 zLDn6g+8NWJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaBaD5wAKCRA/8w6Kdoj6
 qlGEB/9lRWG7gj/GaZXD+c8oPKN5KenUgXYBcY+tfWzMMgaQdk42VWjsovFDW+UjKwLxiFts18H
 9rbViqbymfnX7sZtxdtllpf71mwW66BSOp+7svHXTuYqG/QnS2z76pgEY3vc8yFJ+3t4SGhFcOw
 /tDkyvExYSqzG5d08znP8rwuDk54I7ioe0tVCSUxkX61nBrgZSKYpNWkckEKN7OjIBphbRLSKsf
 uJHjWItX4C0WTbW5rSTIJ7Mc6+oP8HFiqOA7twoBkFDGnVMJmO29lB10KsX8KHmqFzdn3i7g/rL
 Oy+rotcUuR7m0jSRyk6ZT5Ht+7UMfwyLTfIUQwOVwNkUZkUU
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

Xe can skip the reset if TDR has fired before the free job worker. Instead
of using the scheduler internals to add the job to the pending list, use
the DRM_GPU_SCHED_STAT_RUNNING status to skip the reset and rearm the
timer.

Note that there is no need to restart submission if it hasn't been
stopped.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 31bc2022bfc2d80f0ef54726dfeb8d7f8e6b32c8..4c40d3921d4a5e190d3413736a68c6e7295223dd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1058,12 +1058,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * list so job can be freed and kick scheduler ensuring free job is not
 	 * lost.
 	 */
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
-		xe_sched_add_pending_job(sched, job);
-		xe_sched_submission_start(sched);
-
-		return DRM_GPU_SCHED_STAT_NOMINAL;
-	}
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
+		return DRM_GPU_SCHED_STAT_RUNNING;
 
 	/* Kill the run_job entry point */
 	xe_sched_submission_stop(sched);

-- 
2.49.0

