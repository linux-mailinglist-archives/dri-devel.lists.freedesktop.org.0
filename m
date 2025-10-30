Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A590C1F9B9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 11:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7388C10E8D2;
	Thu, 30 Oct 2025 10:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FOLo2YOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7576810E8D2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 10:42:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A11D460140;
 Thu, 30 Oct 2025 10:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFFDC4CEF1;
 Thu, 30 Oct 2025 10:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761820969;
 bh=21Imxsayj+IViqhAG6JgOVkWhAy1BH84E8W2Bso8PDw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FOLo2YOH4OkOEoCN2DKzPliod5u8DzwhLaUYSh74iVtICZoUDt59pB8EOqnc+yKi7
 fOyvR4BAB6BsL6YKrPtxL5d+SYvMj49JujD8R++V2+geHBZxgpea9o38Br3rYXxctg
 8n1+lUyYXHRoL1PivR5S+WVqAkbven2QAvK4x8grgpNh07qH7UsV/rFfYoZTGVu0b7
 IVTNZuawGp+6BYSVTBSiVb1yjODMg8n/IUygF0t0s2bhqjftt69aKPEcclC2kaeii8
 M1pt38bVOMD78mMJpA1Df7osigAlWmJfaHyPfORpT0tJEVWVgIsVThGRg1Y4iX4aBc
 EJWfDQn0geYNA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Melissa Wen <mwen@igalia.com>, Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH 1/2] drm/sched: Use proper locks in drm_sched_job_arm()
Date: Thu, 30 Oct 2025 11:42:19 +0100
Message-ID: <20251030104219.181704-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251030104219.181704-2-phasta@kernel.org>
References: <20251030104219.181704-2-phasta@kernel.org>
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

drm_sched_job_arm() is just racing when dereferencing entity and
runqueue.

Add the proper spinlocks.

Cc: stable@vger.kernel.org # v5.16+
Fixes: dbe48d030b28 ("drm/sched: Split drm_sched_job_init")
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c39f0245e3a9..7f938f491b6f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -859,10 +859,16 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 
 	BUG_ON(!entity);
 	drm_sched_entity_select_rq(entity);
+
+	spin_lock(&entity->lock);
+	spin_lock(&entity->rq->lock);
 	sched = entity->rq->sched;
+	spin_unlock(&entity->rq->lock);
+
+	job->s_priority = entity->priority;
+	spin_unlock(&entity->lock);
 
 	job->sched = sched;
-	job->s_priority = entity->priority;
 
 	drm_sched_fence_init(job->s_fence, job->entity);
 }
-- 
2.49.0

