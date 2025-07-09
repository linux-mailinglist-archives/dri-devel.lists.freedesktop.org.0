Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E185AFE5BD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 12:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94ECF10E78C;
	Wed,  9 Jul 2025 10:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Acjy2LpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFBD10E201
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 10:30:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 49A316144A;
 Wed,  9 Jul 2025 10:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5600EC4CEEF;
 Wed,  9 Jul 2025 10:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752057030;
 bh=Ty3nXIi4HmgfpzGYIeOEefnUtewrgna8f3Lra94ypwY=;
 h=From:To:Cc:Subject:Date:From;
 b=Acjy2LpYogics/rPMCgEe75vlwumy9gKZd2wnUZ5rzGIm9T47YcKUHxVhoR1UbT/+
 uVM6qOYF8zlIza8edQkwLzvJs5pOc3b2btY94wlSpBsejC+9EXdguC+PBLyuJb9m8x
 OGQUdzEdPQEiak4PiFlyILxpkJolNq+yBHrG9gi+U91pH/hSHH5a0Pbd4AmHjeWPcG
 FxRJBneURIFy7MoDNrxfzKrQ9Bhx0MUUiOUP8lLU/OYHK79WII7vGmefKgsXnv2Fob
 QWqykv+5sIMQV/oJsbI8laqtrTUhVEJbr0YmCHc2sdxIrv2gKsSP3+g1RDonmwTAFz
 LfrlCxV/xpm+g==
From: Philipp Stanner <phasta@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Frank Binns <frank.binns@imgtec.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <phasta@kernel.org>, stable@vger.kernel.org
Subject: [PATCH] drm/panfrost: Fix scheduler workqueue bug
Date: Wed,  9 Jul 2025 12:29:58 +0200
Message-ID: <20250709102957.100849-2-phasta@kernel.org>
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

