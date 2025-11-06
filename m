Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBADC3BD8D
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBDC10E91E;
	Thu,  6 Nov 2025 14:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="l7s/Ank0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C8A10E90E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 14:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762440427;
 bh=4z1KJx2dhqpagcNj5BOV7DK37mZCxgvEZd67WpwVdOc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l7s/Ank0kcJqDFXoONe/DjXNvq1AX3KW7mDW5oGVHeJKGK0DUB9OQIgYw5gNHqJCm
 7O6XoLn34MLF/ssMSH2mHxqSgqZg97YN5XyoBwDvv4nIr61m779RKt4mzaWGSpxkit
 Q/KHM+S30ksJHs2MAoLdwLZarjZjkguuu39ODquGZoS7BEFD0E4bxEUrK9Q3VajLlv
 SwmO0LrN+Rocy8mkNrcATwic3tCeZ5OHNYWHLcshMWvFAq+Dziqeh00frbF6L/x8bO
 FLAtt17/MeXfvyAg1EPqPcG5vo9bWU4V2pT1S/UVDx/RiJhTqMCP4GLH1Uj+1tF2u2
 Qv3Kvtcz6wqMw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0250417E1402;
 Thu,  6 Nov 2025 15:47:06 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, kernel@collabora.com
Subject: [PATCH v1 4/8] drm/panthor: Fix the full_tick check
Date: Thu,  6 Nov 2025 15:46:52 +0100
Message-ID: <20251106144656.1012274-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106144656.1012274-1-boris.brezillon@collabora.com>
References: <20251106144656.1012274-1-boris.brezillon@collabora.com>
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

We have a full tick when the remaining time to the next tick is zero,
not the other way around. Declare a full_tick variable so we don't get
that test wrong in other places.

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 69cc1b4c23f2..b6489e9ba1f0 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2349,6 +2349,7 @@ static void tick_work(struct work_struct *work)
 	u64 remaining_jiffies = 0, resched_delay;
 	u64 now = get_jiffies_64();
 	int prio, ret, cookie;
+	bool full_tick;
 
 	if (!drm_dev_enter(&ptdev->base, &cookie))
 		return;
@@ -2360,15 +2361,17 @@ static void tick_work(struct work_struct *work)
 	if (time_before64(now, sched->resched_target))
 		remaining_jiffies = sched->resched_target - now;
 
+	full_tick = remaining_jiffies == 0;
+
 	mutex_lock(&sched->lock);
 	if (panthor_device_reset_is_pending(sched->ptdev))
 		goto out_unlock;
 
-	tick_ctx_init(sched, &ctx, remaining_jiffies != 0);
+	tick_ctx_init(sched, &ctx, full_tick);
 	if (ctx.csg_upd_failed_mask)
 		goto out_cleanup_ctx;
 
-	if (remaining_jiffies) {
+	if (!full_tick) {
 		/* Scheduling forced in the middle of a tick. Only RT groups
 		 * can preempt non-RT ones. Currently running RT groups can't be
 		 * preempted.
-- 
2.51.1

