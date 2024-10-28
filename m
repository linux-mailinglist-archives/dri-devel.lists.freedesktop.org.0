Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA309B2F26
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 12:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3689210E47E;
	Mon, 28 Oct 2024 11:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZMP54YTz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB8D10E36B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 11:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730116098;
 bh=qE1CM94eUqDK8eXzwuWkNmiabIZtn7drTOPuJOsz048=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZMP54YTzax0IMSu4l0IIDxlEvlxWZmNQFdkziCXWULOBkK0DMPUGax0kJhX90Npp1
 ho4nAI1XdSb3Jv4FGEuqROCaTJCnpRh/xeu7AYoftTF55k5ZEAddDXWChg08eeDWkH
 AP/hoZdTaXAWMUTsqzM3YwAQNNOhDJt6wTVvd8rTliQswDcVoIYBvrKXVnemW5mDyX
 ozcYB/zZjcn4SStcd0AnxRJ+7rJigf030WUJvTmD/0yvknC3ymec/MzMVS5h3c0RHG
 jVOb8VVryrTmFGGiGZF4rAfhM3BrDyjkHC7unLEbpZE80YyYz7iVC4cNisgZ30dnEF
 NLdRA9vmKdftQ==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4048417E35CF;
 Mon, 28 Oct 2024 12:48:18 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: [PATCH v2 2/3] drm/panthor: Report group as timedout when we fail to
 properly suspend
Date: Mon, 28 Oct 2024 12:48:14 +0100
Message-ID: <20241028114815.3793855-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241028114815.3793855-1-boris.brezillon@collabora.com>
References: <20241028114815.3793855-1-boris.brezillon@collabora.com>
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

If we don't do that, the group is considered usable by userspace, but
all further GROUP_SUBMIT will fail with -EINVAL.

Changes in v2:
- New patch

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index eda8fbb276b3..ef4bec7ff9c7 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -602,10 +602,11 @@ struct panthor_group {
 	 * @timedout: True when a timeout occurred on any of the queues owned by
 	 * this group.
 	 *
-	 * Timeouts can be reported by drm_sched or by the FW. In any case, any
-	 * timeout situation is unrecoverable, and the group becomes useless.
-	 * We simply wait for all references to be dropped so we can release the
-	 * group object.
+	 * Timeouts can be reported by drm_sched or by the FW. If a reset is required,
+	 * and the group can't be suspended, this also leads to a timeout. In any case,
+	 * any timeout situation is unrecoverable, and the group becomes useless. We
+	 * simply wait for all references to be dropped so we can release the group
+	 * object.
 	 */
 	bool timedout;
 
@@ -2687,6 +2688,12 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
 		csgs_upd_ctx_init(&upd_ctx);
 		while (slot_mask) {
 			u32 csg_id = ffs(slot_mask) - 1;
+			struct panthor_csg_slot *csg_slot = &sched->csg_slots[csg_id];
+
+			/* We consider group suspension failures as fatal and flag the
+			 * group as unusable by setting timedout=true.
+			 */
+			csg_slot->group->timedout = true;
 
 			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
 						CSG_STATE_TERMINATE,
-- 
2.46.2

