Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B055DA2C2E1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 13:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A829910E324;
	Fri,  7 Feb 2025 12:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eGKUbyRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AD310E322
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 12:37:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 45DD9A432DE;
 Fri,  7 Feb 2025 12:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8611C4CEE4;
 Fri,  7 Feb 2025 12:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738931834;
 bh=KObGuLxNso7rtKMvpX2NnwNbW6cYh78MQmuHsn1FJpM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eGKUbyRQKx3MU+JfqRnxEcMecdzuHU30Lar7Owxx1UttWvJrheuvIIB5TcdEpqKil
 laZz8J8+3bIG3e9a9UEUcW/hWRzYyWpYSwv47B9QcYv2XLKgmAVABSmcmLsucb3pyW
 XJfzSDAXI57Y91+YGD9jinG9SXVoUIzE9o8xJAm0LIOR0iHCDMD/1WY1NyFpqA88th
 T+BWJgVdNisxyOD9kKHjblIYrrJMRTC34woyGSDumYxSyqnFJqE0dx1O8zIh2oKray
 FPIRqqG0EZvs4/VjRHNYQqZd/A8gwN5XCR+qffSPzMdP29saa7MGyGsgPJMg/auRw+
 V1c3G7DRU8HgA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 2/3] drm/sched: Adjust outdated docu for run_job()
Date: Fri,  7 Feb 2025 13:36:52 +0100
Message-ID: <20250207123652.27677-4-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250207123652.27677-2-phasta@kernel.org>
References: <20250207123652.27677-2-phasta@kernel.org>
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
 include/drm/gpu_scheduler.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 38d2053528c8..8c1a6155011d 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -421,14 +421,19 @@ struct drm_sched_backend_ops {
 
 	/**
 	 * @run_job: Called to execute the job once all of the dependencies
-	 * have been resolved. This may be called multiple times, if
-	 * timedout_job() has happened and drm_sched_job_recovery() decides to
-	 * try it again.
+	 * have been resolved.
+	 *
+	 * The deprecated drm_sched_resubmit_jobs() (called from
+	 * drm_sched_backend_ops.timedout_job()) can invoke this again with the
+	 * same parameters. Doing this is strongly discouraged because it
+	 * violates dma_fence rules.
 	 *
 	 * @sched_job: the job to run
 	 *
-	 * Returns: dma_fence the driver must signal once the hardware has
-	 *	completed the job ("hardware fence").
+	 * Returns:
+	 * On success: dma_fence the driver must signal once the hardware has
+	 * completed the job ("hardware fence").
+	 * On failure: NULL or an ERR_PTR.
 	 *
 	 * Note that the scheduler expects to 'inherit' its own reference to
 	 * this fence from the callback. It does not invoke an extra
-- 
2.47.1

