Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D2E3BCCD4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FC96E288;
	Tue,  6 Jul 2021 11:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DBB6E2B6
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:19:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98F2261C79;
 Tue,  6 Jul 2021 11:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570349;
 bh=ntt+QbwwZjDylx63TgbvU9XSa74tzKkwq5pUAK4TrhE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gLGIviZT+mFxvSFun0mmPy4mZeZu8hmUxqkyE9qCDNJyuA8Ho+sph70bEdU8TqnFR
 iXwScehYLGdgx+D+YQG+fhLewjqP2HIF9PiAB5GzpQdFhiXYJil+7l/Tb9P5WVOBv9
 6IOAbTSGOJMmW7L/s8pzaveGgTiLT7uB8QFwLUaQgAMFh25FEUNroDnw9422rPnxiK
 1+1eEbQ+WtBjGtP/Ic89asCe/qpUT/wd9EbDCm/3a5G5oTiLxOK0eO2dX1vQ2iQaxE
 Zk52omqnz6D7POmAm579N30J/n0k57CtgrBRu0T0VWMITaHH0LqSRenGigMot8a/je
 tOHg8kPjL4Hxg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 031/160] drm/sched: Avoid data corruptions
Date: Tue,  6 Jul 2021 07:16:17 -0400
Message-Id: <20210706111827.2060499-31-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111827.2060499-1-sashal@kernel.org>
References: <20210706111827.2060499-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

[ Upstream commit 0b10ab80695d61422337ede6ff496552d8ace99d ]

Wait for all dependencies of a job  to complete before
killing it to avoid data corruptions.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210519141407.88444-1-andrey.grodzovsky@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 72c39608236b..1b2fdf7f3ccd 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -222,11 +222,16 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *job;
+	struct dma_fence *f;
 	int r;
 
 	while ((job = to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
 		struct drm_sched_fence *s_fence = job->s_fence;
 
+		/* Wait for all dependencies to avoid data corruptions */
+		while ((f = job->sched->ops->dependency(job, entity)))
+			dma_fence_wait(f, false);
+
 		drm_sched_fence_scheduled(s_fence);
 		dma_fence_set_error(&s_fence->finished, -ESRCH);
 
-- 
2.30.2

