Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698893BCB9E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA316E042;
	Tue,  6 Jul 2021 11:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AE26E04A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:15:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9F5561C28;
 Tue,  6 Jul 2021 11:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570106;
 bh=cUqT5HGXumM4TBFcuqG8XVP4oJ3+IBDFlH7m3Z1t154=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hwbyngXl1YJLoEsZ0eolRbLa5tMeWuxPkZywP8RFwD7IfEuVRt69yOfZvyCLYD7JB
 aBMepA1/mKFtzQb0Mjj7cQ6vnkqFv1BIqLZKBN55lCtk2Gvs8PH61oGNW/f658wZOT
 Q5ygrGm4qpUhu12VYRubxvjSeXrHyh1I4atQfFC1O7fj3ugUUUD290VtJPAoUBDznR
 hBdUY6cpfo28cEJN9aTu2P/071foosx5RRw2QROrR56n3h80qvWdlBreGVWXtfJRzy
 H4KN5aZSuyCq58s4yDVWD6sgboGbdKYcfs5YbhJPR0j9ByzreCGzJEvkZcUcr8AYPo
 HuXymxGhaF99Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 039/189] drm/sched: Avoid data corruptions
Date: Tue,  6 Jul 2021 07:11:39 -0400
Message-Id: <20210706111409.2058071-39-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
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
index cb58f692dad9..86a4209d8c77 100644
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

