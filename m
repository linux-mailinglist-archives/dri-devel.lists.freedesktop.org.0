Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3A0BE8FC7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1BC10EC33;
	Fri, 17 Oct 2025 13:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VjkzgWyN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6C810EC33
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:47:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0156744805;
 Fri, 17 Oct 2025 13:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C0FC4CEF9;
 Fri, 17 Oct 2025 13:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760708871;
 bh=KKelnfCVSkqGfD/vx5rJBlReymKdSnPUEgmqAjBvnWQ=;
 h=From:To:Cc:Subject:Date:From;
 b=VjkzgWyN7WvWpRW4x8oP8VL3Ug4dDalsjXbaCr7N+ZNXWeybQuMzO64xxwITP0iPE
 O2tDxVLF+k1kf6X04+DUnehUVHkXf9J1iLK9WlCpSGYqWx5CLpMHYmkxwO41VeA9W2
 SEPSbwIiSW9VfFJ7UCxVwCDGECYoAfeveSk/IiBKUg23Xs2RNC3OZPYVgw1ZBMDrgz
 xfS2yRFxC/HvVcwUJsiTpvbRR+tkhLoaqhoExkrsUqxb4IQ/bENOwTVFGNKveMXwz2
 I2GlDim2ywJ7hqkxNBoqAVhkn7Ycn7VlSWpRQkTbdD3F3Mi+xPMabdUBFBmBCm4so2
 ZCGBv+1kN32ZA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 1/3] drm/sched: Remove out of place resubmit docu
Date: Fri, 17 Oct 2025 15:47:01 +0200
Message-ID: <20251017134716.187723-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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

The documentation for drm_sched_backend_ops.run_job() details that that
callback can be invoked multiple times by the deprecated function
drm_sched_resubmit_jobs(). It also contains an unresolved TODO.

It is not useful to document side effects of a different, deprecated
function in the docu of run_job(): Existing users won't re-evaluate
their usage  of the deprecated function by reading the non-deprecated
one, and new users must not use the deprecated function in the first
place.

Remove the out of place documentation.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/drm/gpu_scheduler.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fb88301b3c45..9c629bbc0684 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -429,16 +429,6 @@ struct drm_sched_backend_ops {
 	 *
 	 * @sched_job: the job to run
 	 *
-	 * The deprecated drm_sched_resubmit_jobs() (called by &struct
-	 * drm_sched_backend_ops.timedout_job) can invoke this again with the
-	 * same parameters. Using this is discouraged because it violates
-	 * dma_fence rules, notably dma_fence_init() has to be called on
-	 * already initialized fences for a second time. Moreover, this is
-	 * dangerous because attempts to allocate memory might deadlock with
-	 * memory management code waiting for the reset to complete.
-	 *
-	 * TODO: Document what drivers should do / use instead.
-	 *
 	 * This method is called in a workqueue context - either from the
 	 * submit_wq the driver passed through drm_sched_init(), or, if the
 	 * driver passed NULL, a separate, ordered workqueue the scheduler
-- 
2.49.0

