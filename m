Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230E03BCDFF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC406E3EF;
	Tue,  6 Jul 2021 11:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBFD6E3EF
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:22:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E19961D09;
 Tue,  6 Jul 2021 11:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570561;
 bh=tDh2Cp3vkwg7dQBXk2Kji+t3Rds+JbYMkspX8Brzr7g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HynczCAMlh1fAuXjmEE9EUVZU0KcCIw0LNq7ovRZn2VGyWIVWGnaCroE5nKWgTPcc
 PkboI15L0jFuGBYugRGrrhQYdTvZQTbFL9hjm7TpWjXvVLDbXRFd78VBkX1/izE8vZ
 kNQQw2Azimwu6jZyHkfiyJPOuQM+BedywGFkqVILYkRR8cpEtRGksYRS7rCdrpiuao
 QPKN6vH/MG3uKCcB+4ng5IL0VXvgHyMoXt2Zyzczw4fi9woWMU+9edhc9VzPtJcdCh
 mRgMrdE38KXoj8xXnnXFS2+8t9TXZ2AIfgtMPmRSHoUm5/1KoAdgqeoedWw2mqggZD
 RM/mfR8UXb+dw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 028/137] drm/sched: Avoid data corruptions
Date: Tue,  6 Jul 2021 07:20:14 -0400
Message-Id: <20210706112203.2062605-28-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112203.2062605-1-sashal@kernel.org>
References: <20210706112203.2062605-1-sashal@kernel.org>
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
index 2006cc057f99..3f7f761df4cd 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -219,11 +219,16 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
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

