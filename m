Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9C6C07393
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B0910EAED;
	Fri, 24 Oct 2025 16:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ATwP4xz9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40F510EAD3;
 Fri, 24 Oct 2025 16:13:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 70B8C43251;
 Fri, 24 Oct 2025 16:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF2CC4CEF1;
 Fri, 24 Oct 2025 16:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761322390;
 bh=JMZUnKEbpoPUX+U/rG/NykTr6Ws1kr0EDZQvo0uV/rw=;
 h=From:To:Cc:Subject:Date:From;
 b=ATwP4xz9SabBVxqeUCMoNU79ZHQ7FBdKYroJ/cFnsPC70pbsKVC5/rYu9pyHT8yzC
 6csGcRsAc7z4npfT8e+jn3ectNP4m1bxq7GdQGQBOlEgkxCiS5MPLEB6SelY8UFZL2
 al5Vz7YDB3qoCOeq19YHj1re9+EWQImE5l3unp9gh8WwzGiEmwYWInUNkj/Xrtz0MU
 Pmk4VtlSiCIQpaQQlzN3mRP5wcXnfCtI/k3l+rODxnFPeBuzuMXKpoSAmC8MBpyXDe
 CPjHf2J2OPPHm5/NNQvWrnLLWHdd+2WkoRH2/MthAkjDcKCDui1IybS8gNjnOcsd3B
 LJAeapP++aZMw==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <phasta@kernel.org>,
 stable@vger.kernel.org
Subject: [PATCH] drm/nouveau: Fix race in nouveau_sched_fini()
Date: Fri, 24 Oct 2025 18:12:22 +0200
Message-ID: <20251024161221.196155-2-phasta@kernel.org>
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

nouveau_sched_fini() uses a memory barrier before wait_event().
wait_event(), however, is a macro which expands to a loop which might
check the passed condition several times. The barrier would only take
effect for the first check.

Replace the barrier with a function which takes the spinlock.

Cc: stable@vger.kernel.org # v6.8+
Fixes: 5f03a507b29e ("drm/nouveau: implement 1:1 scheduler - entity relationship")
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index e60f7892f5ce..a7bf539e5d86 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -482,6 +482,17 @@ nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
 	return 0;
 }
 
+static bool
+nouveau_sched_job_list_empty(struct nouveau_sched *sched)
+{
+	bool empty;
+
+	spin_lock(&sched->job.list.lock);
+	empty = list_empty(&sched->job.list.head);
+	spin_unlock(&sched->job.list.lock);
+
+	return empty;
+}
 
 static void
 nouveau_sched_fini(struct nouveau_sched *sched)
@@ -489,8 +500,7 @@ nouveau_sched_fini(struct nouveau_sched *sched)
 	struct drm_gpu_scheduler *drm_sched = &sched->base;
 	struct drm_sched_entity *entity = &sched->entity;
 
-	rmb(); /* for list_empty to work without lock */
-	wait_event(sched->job.wq, list_empty(&sched->job.list.head));
+	wait_event(sched->job.wq, nouveau_sched_job_list_empty(sched));
 
 	drm_sched_entity_fini(entity);
 	drm_sched_fini(drm_sched);
-- 
2.49.0

