Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAF6C52189
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 12:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF28E10E6EE;
	Wed, 12 Nov 2025 11:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZUaNhNLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99A110E092
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 11:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762948316;
 bh=PCgPXrOXI7MbTC8NduCnwRGe0+3aGhHpSaTS8G/LlKk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZUaNhNLdWNnth9UNUvwYxjAH0vvy+AK/X7BEdJpsZ8kVT9Zthl7ooVKUGm6DVZwnY
 AYi8/aAiq1y2jNtPQpnD3GYObMLwrmZGtD4yzkT+8849z9IlsJCbSKzd80RqJrQohk
 KQl4dsV+hyRYTzA+HCSBnx8hLL8sh6IW0KMY31ESOXOOa8yMMMWbDY/Salq6SfNTRR
 xwaIjvsxTKsWTGkcTZ0ijCzW1s4APZs2pqI78axbEKellXDJY7T7YjBbBhA1I5HmWF
 fS6TVpsULKEfOzJVfDYOP5L7MmO7xtRTGwU2rAVPqvkMlVaruL7naOfvT2J9VCc+BI
 7bDSfpn8GoNTA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3DE4A17E13C3;
 Wed, 12 Nov 2025 12:51:56 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, kernel@collabora.com
Subject: [PATCH v2 5/8] drm/panthor: Fix immediate ticking on a disabled tick
Date: Wed, 12 Nov 2025 12:51:39 +0100
Message-ID: <20251112115142.1270931-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251112115142.1270931-1-boris.brezillon@collabora.com>
References: <20251112115142.1270931-1-boris.brezillon@collabora.com>
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

We have a few paths where we schedule the tick work immediately without
changing the resched_target. If the tick was stopped, this would lead
to a remaining_jiffies that's always > 0, and it wouldn't force a full
tick in that case. Add extra checks to cover that case properly.

v2:
- Fix typo
- Simplify the code as suggested by Steve

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index dd3a3b8cd5ad..4c137581fe40 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2346,6 +2346,7 @@ static void tick_work(struct work_struct *work)
 						      tick_work.work);
 	struct panthor_device *ptdev = sched->ptdev;
 	struct panthor_sched_tick_ctx ctx;
+	u64 resched_target = sched->resched_target;
 	u64 remaining_jiffies = 0, resched_delay;
 	u64 now = get_jiffies_64();
 	int prio, ret, cookie;
@@ -2358,8 +2359,12 @@ static void tick_work(struct work_struct *work)
 	if (drm_WARN_ON(&ptdev->base, ret))
 		goto out_dev_exit;
 
-	if (time_before64(now, sched->resched_target))
-		remaining_jiffies = sched->resched_target - now;
+	/* If the tick is stopped, calculate when the next tick would be */
+	if (resched_target == U64_MAX)
+		resched_target = sched->last_tick + sched->tick_period;
+
+	if (time_before64(now, resched_target))
+		remaining_jiffies = resched_target - now;
 
 	full_tick = remaining_jiffies == 0;
 
-- 
2.51.1

