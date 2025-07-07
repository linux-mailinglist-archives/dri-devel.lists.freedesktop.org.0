Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 256CDAFB665
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 16:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473F910E4C3;
	Mon,  7 Jul 2025 14:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="d8J7Hlzc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCBE10E4B6;
 Mon,  7 Jul 2025 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8gDAPHIx/SIOxpjtPi1fqlauPu92LN2klkb723oHq3A=; b=d8J7Hlzc47wZkAUNldthb7HgyB
 jfPIPXD2RDqLpv3REKatHh4ey89k6I0bO+C9iZPHRxsk1zYkgp33BvcFK8QbBRNXQyceACPuUG18U
 ox+3Ebw6UdxHh8OJDctzng/V61nIIkaY+DgnduFz0ELaLFNjo7Gz57pCBsJqFfosIb42iYYZF3Fvk
 pkkwxpPZQ8Ti1QNMeOk6neu0CiQ1dZWnk1t1JBPb4o8jH117ML0Xm4gnSGpp1ItSs2iZ6loLbkjWN
 qzIueUw85q275Ij1uD2U7JtoxWQu8eLECP1fJm8xapY2ybYdRgeLCWgdQTLlBGqYIwVLLioiBZ+eO
 DLOZqQ8g==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uYn8J-00DaQv-1X; Mon, 07 Jul 2025 16:47:51 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 07 Jul 2025 11:46:36 -0300
Subject: [PATCH v4 7/8] drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250707-sched-skip-reset-v4-7-036c0f0f584f@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=c09hATWmZxSGm/3xEB/j8DuBGmO8MWerOvYReOgHCA4=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoa93ZmOIjru9jm9nQNhhREpvA/GkwZNn7tj2Bs
 PMexaZub6GJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaGvd2QAKCRA/8w6Kdoj6
 qk3eCACLMsrOWqtR9a/EZLCJKQgGBKZ32i3Z/Q5DiaMz+IApH3MjYLb5tXSeVJeTRk9yh7/6Bys
 boGb43fczNkSYCi03HJbEyOuaaSY1dY+xc5lHcLzIDOlWH9cU0toKBYANlDsQgkSQy59gVASGR4
 uJcYLQNk6Phi/2bz7JbBqLTwIQVzLlQZDRNp+20nLKh+WY1mienriCjHLm9O5uci7Nt2QXdsGWf
 aWmeDJEWSld1jJcPuQf1tKc7MFdg6kqVGsu1zP341Skh5HZo+NlgUY6PvxKkXAR8L9c95tlIoU3
 RJWHTLJdVTXf0KljuBivOAbdMXsuCdcWk1NjSD6rcceuaHT5
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
index 9c7e445b9ea7ce7e3610eadca023e6d810e683e9..f6289eeffd852e40b33d0e455d9bcc21a4fb1467 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1078,12 +1078,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
@@ -1261,10 +1257,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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

