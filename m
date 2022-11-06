Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F4C61E3D0
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 18:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E64210E1B5;
	Sun,  6 Nov 2022 17:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7D010E1B2
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Nov 2022 17:05:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7A3D3B80B38;
 Sun,  6 Nov 2022 17:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB47C433D7;
 Sun,  6 Nov 2022 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667754306;
 bh=KztOp8qiQQ6o2p8/9EWNV2l4Add6B6H4zZ667ATuFoI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HNju25cFvZmr2XsP6FQvZtmd6zaIyeAtVNkjxYMJIBWGxlRL2WFBibdaT2or+VTQz
 yNWQziz7rhpyoUSYd7/NjekHisjsgetMRiKT6mMnmEtrORA3mavIT3+h1XEj//4oWm
 y3FKwnY6FWd2m0cs6/qJe6AmFhhRSHMWZg3mNNAPYqwGQin8OqStIzU82q6dV+ocms
 tHo83nbbRuYSISWCAImEA2gzzh7pnGOg/NsxLwxNuVcaVvWpBOzBlkO0ew4mK6rOwQ
 wtYBo9+CFGN/Gt3pVP7xRY9WD2VwD7yGCDdGz3EPV9vt9b8BmtcelqgM0zD6c6zES2
 qSz0BQpd2x9kw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 29/30] drm/scheduler: fix fence ref counting
Date: Sun,  6 Nov 2022 12:03:41 -0500
Message-Id: <20221106170345.1579893-29-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170345.1579893-1-sashal@kernel.org>
References: <20221106170345.1579893-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <christian.koenig@amd.com>

[ Upstream commit b3af84383e7abdc5e63435817bb73a268e7c3637 ]

We leaked dependency fences when processes were beeing killed.

Additional to that grab a reference to the last scheduled fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220929180151.139751-1-christian.koenig@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 6b25b2f4f5a3..7ef1a086a6fb 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -207,6 +207,7 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
 						 finish_cb);
 
+	dma_fence_put(f);
 	INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
 	schedule_work(&job->work);
 }
@@ -234,8 +235,10 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
 		struct drm_sched_fence *s_fence = job->s_fence;
 
 		/* Wait for all dependencies to avoid data corruptions */
-		while ((f = drm_sched_job_dependency(job, entity)))
+		while ((f = drm_sched_job_dependency(job, entity))) {
 			dma_fence_wait(f, false);
+			dma_fence_put(f);
+		}
 
 		drm_sched_fence_scheduled(s_fence);
 		dma_fence_set_error(&s_fence->finished, -ESRCH);
@@ -250,6 +253,7 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
 			continue;
 		}
 
+		dma_fence_get(entity->last_scheduled);
 		r = dma_fence_add_callback(entity->last_scheduled,
 					   &job->finish_cb,
 					   drm_sched_entity_kill_jobs_cb);
-- 
2.35.1

