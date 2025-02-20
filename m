Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E160DA3D8C8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 12:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B36E10E945;
	Thu, 20 Feb 2025 11:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eedjjoeY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0154510E954
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 11:34:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 60B94613EA;
 Thu, 20 Feb 2025 11:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4F1C4CEDD;
 Thu, 20 Feb 2025 11:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740050908;
 bh=WfPMRPu5h33yO/ZOjwVBBS1RB5ho4n5GU11BEOfYUvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eedjjoeYuAp3/ryigJRwHUbmbYdv9K1V/wYIF7ctNP6IeRtyXojMNWlCY9RMrARPF
 QjOUw5MeiWZ/R9qTTL0FlNngwT5VJI5niN4Q58gYTEwx5g228C72dYhTl4upTfFbjJ
 Fx8Spnr0sTZD6bCfXSekE2Gjwj5vq6UYIbyQ3/SeJiyhX4sMceoJcU7HlG0N1GZnHN
 CLVwSOPdrzYhKPWBd6dvfAbZtmdDDjqjrnUY9NPyjghHc++3FLuArvMOsRN8dEyyfL
 d57O3YM0CQCtv0HlB5Md4QSvfdJHc4j4kqVWmszeuOh+yUI04RmzylbuxEGTrWQ9Fx
 qwpcd/dadm5mQ==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] drm/sched: Adjust outdated docu for run_job()
Date: Thu, 20 Feb 2025 12:28:13 +0100
Message-ID: <20250220112813.87992-4-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250220112813.87992-2-phasta@kernel.org>
References: <20250220112813.87992-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The documentation for drm_sched_backend_ops.run_job() mentions a certain
function called drm_sched_job_recovery(). This function does not exist.
What's actually meant is drm_sched_resubmit_jobs(), which is by now also
deprecated.

Remove the mention of the removed function.

Discourage the behavior of drm_sched_backend_ops.run_job() being called
multiple times for the same job.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/drm/gpu_scheduler.h | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 916279b5aa00..29e5bda91806 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -421,20 +421,27 @@ struct drm_sched_backend_ops {
 
 	/**
 	 * @run_job: Called to execute the job once all of the dependencies
-	 * have been resolved. This may be called multiple times, if
-	 * timedout_job() has happened and drm_sched_job_recovery() decides to
-	 * try it again.
+	 * have been resolved.
+	 *
+	 * The deprecated drm_sched_resubmit_jobs() (called from
+	 * drm_sched_backend_ops.timedout_job()) can invoke this again with the
+	 * same parameters. Using this is discouraged because it, presumably,
+	 * violates dma_fence rules.
+	 *
+	 * TODO: Document which fence rules above.
 	 *
 	 * @sched_job: the job to run
 	 *
-	 * Returns: dma_fence the driver must signal once the hardware has
-	 *	completed the job ("hardware fence").
-	 *
 	 * Note that the scheduler expects to 'inherit' its own reference to
 	 * this fence from the callback. It does not invoke an extra
 	 * dma_fence_get() on it. Consequently, this callback must take a
 	 * reference for the scheduler, and additional ones for the driver's
 	 * respective needs.
+	 *
+	 * Return:
+	 * * On success: dma_fence the driver must signal once the hardware has
+	 * completed the job ("hardware fence").
+	 * * On failure: NULL or an ERR_PTR.
 	 */
 	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
 
-- 
2.47.1

