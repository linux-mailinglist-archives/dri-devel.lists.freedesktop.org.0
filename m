Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFF1A4C368
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 15:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F71F10E15A;
	Mon,  3 Mar 2025 14:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jAoz5s06";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D4010E15A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 14:33:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8C8F75C41A4;
 Mon,  3 Mar 2025 14:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16AAC4CED6;
 Mon,  3 Mar 2025 14:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741012400;
 bh=TLJcdtQW1Rth17BYwR4KsHskPkHEeMJQb+Hqg3Z/4WU=;
 h=From:To:Cc:Subject:Date:From;
 b=jAoz5s06lNLYzKqFNXp0yF0SGi3lsK5bOjsDsY6Rjs4ghZFmgnzMaHavcEwmqpn6t
 yL7hBTElXoNj3hIjYFlxC1IO1rNQhXq/wTFKcl4tNpCf+hxDsVe+fQdqs5ZQW6+98z
 KtjNQVn25R8VNt4OnSEMH8DUwjRPAc2EntNrSxuZaDSDnacnOxndYpYGshDG0F0BU4
 S/wB004C7Id+EgSa4qH6EcCpve7osNLetV9sjc0At5PSmoB4AlNzSjqhZCZ0K/r1Vh
 54ozwV89rX9SYwOAMw3KJlKHvCZuESsm1otb+PNG+7aIghV34UGQNkBiWnkQ5L2gSQ
 r17JMsAfW3hEw==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sched: drm_sched_job_cleanup(): correct false doc
Date: Mon,  3 Mar 2025 15:32:52 +0100
Message-ID: <20250303143251.43793-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
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

drm_sched_job_cleanup()'s documentation claims that calling
drm_sched_job_arm() is a "point of no return", implying that afterwards
a job cannot be cancelled anymore.

This is not correct, as proven by the function's code itself, which
takes a previous call to drm_sched_job_arm() into account. In truth, the
decisive factors are whether fences have been shared (e.g., with other
processes) and if the job has been submitted to an entity already.

Correct the wrong docstring.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c634993f1346..db9e08e6e455 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1013,11 +1013,13 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
  * Cleans up the resources allocated with drm_sched_job_init().
  *
  * Drivers should call this from their error unwind code if @job is aborted
- * before drm_sched_job_arm() is called.
+ * before it was submitted to an entity with drm_sched_entity_push_job().
  *
- * After that point of no return @job is committed to be executed by the
- * scheduler, and this function should be called from the
- * &drm_sched_backend_ops.free_job callback.
+ * Since calling drm_sched_job_arm() causes the job's fences to be initialized,
+ * it is up to the driver to ensure that fences that were exposed to external
+ * parties get signaled. drm_sched_job_cleanup() does not ensure this.
+ *
+ * This function must also be called in &struct drm_sched_backend_ops.free_job
  */
 void drm_sched_job_cleanup(struct drm_sched_job *job)
 {
-- 
2.48.1

