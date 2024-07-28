Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4BD93E5F6
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 17:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A1910E1D8;
	Sun, 28 Jul 2024 15:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fF1Cyo7e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8F810E1B7;
 Sun, 28 Jul 2024 15:42:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2A025611F1;
 Sun, 28 Jul 2024 15:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011B4C116B1;
 Sun, 28 Jul 2024 15:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181353;
 bh=8q5D2B9OW6lTxci4LEAhIIy1s+NJNtC4AYx42sA6Xts=;
 h=From:To:Cc:Subject:Date:From;
 b=fF1Cyo7eX1QOiKplbmpbh0dNRqh+QJP9ls93EcvUmxzYaqgtgFl7ORfhcS4oSvgoy
 ck0Gucc1TiHWsyzuhxG5CW45D38fwFaLoBFJGNj/0bvAVJ/lqL6vfv6lTiDWhPDAZJ
 fZMCLyGTpxouT9907MqOiwJJRNAVBTCSX0V/qq1KUs1RpoHVnxj3cC9yZE+yEtux7J
 6yg9ofcDGdxL4KRROkSXNdcaFlPdB55R65eVXdHW/Nsp72K3XfIyUfoGpyvVuN8NZK
 4jeDaSTiBY2mTif6LyMCSPySgQSoAuRzKbXVuEbV7YAbsLKvWnGTGTd9gA0zY8S1Yx
 PJFDjM7ezug/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Sasha Levin <sashal@kernel.org>,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 01/34] drm/xe/preempt_fence: enlarge the fence
 critical section
Date: Sun, 28 Jul 2024 11:40:25 -0400
Message-ID: <20240728154230.2046786-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Matthew Auld <matthew.auld@intel.com>

[ Upstream commit 3cd1585e57908b6efcd967465ef7685f40b2a294 ]

It is really easy to introduce subtle deadlocks in
preempt_fence_work_func() since we operate on single global ordered-wq
for signalling our preempt fences behind the scenes, so even though we
signal a particular fence, everything in the callback should be in the
fence critical section, since blocking in the callback will prevent
other published fences from signalling. If we enlarge the fence critical
section to cover the entire callback, then lockdep should be able to
understand this better, and complain if we grab a sensitive lock like
vm->lock, which is also held when waiting on preempt fences.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240418144630.299531-2-matthew.auld@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_preempt_fence.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index 7d50c6e89d8e7..5b243b7feb59d 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -23,11 +23,19 @@ static void preempt_fence_work_func(struct work_struct *w)
 		q->ops->suspend_wait(q);
 
 	dma_fence_signal(&pfence->base);
-	dma_fence_end_signalling(cookie);
-
+	/*
+	 * Opt for keep everything in the fence critical section. This looks really strange since we
+	 * have just signalled the fence, however the preempt fences are all signalled via single
+	 * global ordered-wq, therefore anything that happens in this callback can easily block
+	 * progress on the entire wq, which itself may prevent other published preempt fences from
+	 * ever signalling.  Therefore try to keep everything here in the callback in the fence
+	 * critical section. For example if something below grabs a scary lock like vm->lock,
+	 * lockdep should complain since we also hold that lock whilst waiting on preempt fences to
+	 * complete.
+	 */
 	xe_vm_queue_rebind_worker(q->vm);
-
 	xe_exec_queue_put(q);
+	dma_fence_end_signalling(cookie);
 }
 
 static const char *
-- 
2.43.0

