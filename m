Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3B6B244C8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 10:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4549C10E4D4;
	Wed, 13 Aug 2025 08:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fih5kiHO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B056710E4D4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 08:57:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8EA535C41B7;
 Wed, 13 Aug 2025 08:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C3BC4CEFD;
 Wed, 13 Aug 2025 08:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755075435;
 bh=tPv65mDfdZ0llyoTq/yFclRsFjMwzVQQFJKFvnEN1BY=;
 h=From:To:Cc:Subject:Date:From;
 b=fih5kiHO4WkIyfwJXWpF18b7qsVzfXDW7l8SYOmBRrHZBnKEA7vHlL7ITh6iwyFYv
 FZgfIPaKtlNafDg2xRR/RH2G3knrSxljuC92QnxENgXDzCi+kLa2p1spt7XqskWkrx
 czoG6ckmHHqeEabTd5Qv4DnBdZcIFqA4JRsi/5Zz3ogWInwnhVBjnblg96qLfOOMN7
 05LvmMBtMVnh8WsEBh3disiYIQCu51Bm2Tay7Kej/6kHghFv+EnbwxM6FDA6Y2ucxP
 0rx2IttgRxtkXPXGQcOFFf6/8hSSnxJqoOztZBLX7OZEf4p/lqmA/vEn+CL9rUzjCO
 NklAy7kbPnE6g==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James Flowers <bold.zone2373@fastmail.com>
Subject: [PATCH v2] drm/sched: Document race condition in drm_sched_fini()
Date: Wed, 13 Aug 2025 10:56:55 +0200
Message-ID: <20250813085654.102504-2-phasta@kernel.org>
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

In drm_sched_fini() all entities are marked as stopped - without taking
the appropriate lock, because that would deadlock. That means that
drm_sched_fini() and drm_sched_entity_push_job() can race against each
other.

This should most likely be fixed by establishing the rule that all
entities associated with a scheduler must be torn down first. Then,
however, the locking should be removed from drm_sched_fini() alltogether
with an appropriate comment.

Reported-by: James Flowers <bold.zone2373@fastmail.com>
Link: https://lore.kernel.org/dri-devel/20250720235748.2798-1-bold.zone2373@fastmail.com/
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Fix typo.
---
 drivers/gpu/drm/scheduler/sched_main.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 5a550fd76bf0..46119aacb809 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1424,6 +1424,22 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 			 * Prevents reinsertion and marks job_queue as idle,
 			 * it will be removed from the rq in drm_sched_entity_fini()
 			 * eventually
+			 *
+			 * FIXME:
+			 * This lacks the proper spin_lock(&s_entity->lock) and
+			 * is, therefore, a race condition. Most notably, it
+			 * can race with drm_sched_entity_push_job(). The lock
+			 * cannot be taken here, however, because this would
+			 * lead to lock inversion -> deadlock.
+			 *
+			 * The best solution probably is to enforce the life
+			 * time rule of all entities having to be torn down
+			 * before their scheduler. Then, however, locking could
+			 * be dropped alltogether from this function.
+			 *
+			 * For now, this remains a potential race in all
+			 * drivers that keep entities alive for longer than
+			 * the scheduler.
 			 */
 			s_entity->stopped = true;
 		spin_unlock(&rq->lock);
-- 
2.49.0

