Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13921AFCBF7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 15:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0BE10E649;
	Tue,  8 Jul 2025 13:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JPlfSWtQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F9210E642;
 Tue,  8 Jul 2025 13:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p77des8+pTu0GX1k2zHpbXG64lfuwbr2vcGw7+U9MXY=; b=JPlfSWtQOGcIoXWQAj1mIrCiL1
 KNdpc1kv/eck7Jk1nH9VF0i3R2skChTzL+avuE9rgDeVeZOYqJbQ9mXI4h4AkeE4beNyzyAX5ZKL6
 emcwptWm6Ols/1Y4Vx2pvUQQEFRluQC2FxD0DmbX5D+LC8bHV6Ow9eM7cQNZIW24K701z26w/1v99
 kvNIMllYGF7B6ZKy1Y0aPyTF59dwCGJZSIfKa2WejX5jciHdXeL3M3I4I62sEAbfG3dAvRnaf5IPm
 kNGqJqdYMaQdGovcEkD/hccQWy7jigE8p7QeIWN6wt+lV8R3t+shplMlllkuNe4nT6VDl2D7fnLXe
 9ctO/wdg==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uZ8Lc-00E1hT-8g; Tue, 08 Jul 2025 15:27:00 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 08 Jul 2025 10:25:47 -0300
Subject: [PATCH v5 7/8] drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250708-sched-skip-reset-v5-7-2612b601f01a@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=T2oYnvWsCaUqeR6OaRUx/u6mxGlPdSDLKVv7hEb+4iY=;
 b=owGbwMvMwMFo/5mvq6zj1yrG02pJDBm5MukfX5frG9lubjba28KyYItEfaXvhyubFdRMIksvS
 3X9btvSyWjMwsDIwSArpsjy40lsLaNYObvmsvKLMINYmUCmMHBxCsBEdNo4GOZsU18Wzrhe5vHa
 MtMZATqrTKravjjc4mo9t/+2e0ugrInN8TUrzZ/N2F+ouWltR0Shz4f9ipOq5vzivfBVLEXSh2e
 +SteZ2NsNTw94/xf+0nlAkY9Pc8nyyAm2X3SjW5ztzh4NVzfwOxbBYZH3bs3cjy9fp31aYMi081
 aYXazIV/NbC/KimxJ9VfZc25ibI/v9fGyzR58nM5/uvv1fEjx3q+970Hg27dXmWZzvFlRXKCT2M
 u0wLDJNvFIXH2eyvsGQQ+9wVsSXxCdP2Rqc1QOkdHL3sWsvTjlzauYOE/6yJ+rSxtN8RFL+n0wQ
 jtiaHy+as/1rmrz5aivxuE8S6T9kq7VeKtgeFb0gxb4SAA==
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

Xe can skip the reset if TDR has fired before the free job worker and can
also re-arm the timeout timer in some scenarios. Instead of manipulating
scheduler's internals, inform the scheduler that the job did not actually
timeout and no reset was performed through the new status code
DRM_GPU_SCHED_STAT_NO_HANG.

Note that, in the first case, there is no need to restart submission if it
hasn't been stopped.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1430b58d096b03a78292e523e3ee7c5dddd7efdd..cafb47711e9b3fab3b4b4197965835197caabe9b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1093,12 +1093,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * list so job can be freed and kick scheduler ensuring free job is not
 	 * lost.
 	 */
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
-		xe_sched_add_pending_job(sched, job);
-		xe_sched_submission_start(sched);
-
-		return DRM_GPU_SCHED_STAT_RESET;
-	}
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
+		return DRM_GPU_SCHED_STAT_NO_HANG;
 
 	/* Kill the run_job entry point */
 	xe_sched_submission_stop(sched);
@@ -1277,10 +1273,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * but there is not currently an easy way to do in DRM scheduler. With
 	 * some thought, do this in a follow up.
 	 */
-	xe_sched_add_pending_job(sched, job);
 	xe_sched_submission_start(sched);
-
-	return DRM_GPU_SCHED_STAT_RESET;
+	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
 static void __guc_exec_queue_fini_async(struct work_struct *w)

-- 
2.50.0

