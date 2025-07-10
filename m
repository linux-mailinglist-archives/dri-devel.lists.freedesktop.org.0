Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BACB00285
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 14:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9136E10E8B5;
	Thu, 10 Jul 2025 12:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tauv3G7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A500810E8B5;
 Thu, 10 Jul 2025 12:54:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A105461496;
 Thu, 10 Jul 2025 12:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B01C4CEF5;
 Thu, 10 Jul 2025 12:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752152069;
 bh=Ty3nXIi4HmgfpzGYIeOEefnUtewrgna8f3Lra94ypwY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tauv3G7ITX2kczrfAR5yQUDt0/SmS/4WXFzs8CQJGmbuSFP4pAqeo4b4KeHUIoCh0
 7/cy7Xt5X0QgJnfzwoVD4Rd2XzlVCJWh9DSazTBxd/sglfO3OYdQip/bZRJTKdBG0l
 WoM8KUxZvlLniV3ib1WkKSPDVcDlq5qY03QP/THs28VmbFoKV3OLizZUpw6tx7w2I4
 XT/Jq4Fpv7iZZ8COoacfNKljWWcVJy3btnK6VAXPD6Mp9Wih1q8nwNL9IQgp6MGe9k
 fqT5oQ+v2dYACp//bXvqhvwZvwGomV31zAkFBjOET+mBrquhvqyVBcn5cf1db32S+i
 3xob00fjPHbdA==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH v4 1/8] drm/panfrost: Fix scheduler workqueue bug
Date: Thu, 10 Jul 2025 14:54:05 +0200
Message-ID: <20250710125412.128476-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710125412.128476-2-phasta@kernel.org>
References: <20250710125412.128476-2-phasta@kernel.org>
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

When the GPU scheduler was ported to using a struct for its
initialization parameters, it was overlooked that panfrost creates a
distinct workqueue for timeout handling.

The pointer to this new workqueue is not initialized to the struct,
resulting in NULL being passed to the scheduler, which then uses the
system_wq for timeout handling.

Set the correct workqueue to the init args struct.

Cc: stable@vger.kernel.org # 6.15+
Fixes: 796a9f55a8d1 ("drm/sched: Use struct for drm_sched_init() params")
Reported-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Closes: https://lore.kernel.org/dri-devel/b5d0921c-7cbf-4d55-aa47-c35cd7861c02@igalia.com/
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 5657106c2f7d..15e2d505550f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -841,7 +841,6 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
 		.credit_limit = 2,
 		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
-		.timeout_wq = pfdev->reset.wq,
 		.name = "pan_js",
 		.dev = pfdev->dev,
 	};
@@ -879,6 +878,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 	pfdev->reset.wq = alloc_ordered_workqueue("panfrost-reset", 0);
 	if (!pfdev->reset.wq)
 		return -ENOMEM;
+	args.timeout_wq = pfdev->reset.wq;
 
 	for (j = 0; j < NUM_JOB_SLOTS; j++) {
 		js->queue[j].fence_context = dma_fence_context_alloc(1);
-- 
2.49.0

