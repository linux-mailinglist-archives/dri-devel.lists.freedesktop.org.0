Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCF6C9183C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 10:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B417010E89C;
	Fri, 28 Nov 2025 09:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="E5pKAk/h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFF710E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 09:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764323333;
 bh=3FwU6lzZtoK+idGSBClgNf5BtfyHN14IxXiqeQhCIqs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E5pKAk/hrEZ7Z497cBmke8muAog0XlU9Typ8Iig0WiqrE+sfi4KaD78TVZudURwhF
 8FypvSWSeWxnnPYYvY6oyoPqVXkRCTud5VZzhlTtzE0Pb/h/tWrLY6mXtcHFrD93bM
 WM6tOSRcl+daeXYJD/JXMpQSvOiiQfGXVMUWuTsIntjwoupF5wP10onaFXl2WTDnTq
 IU0TqW9kYdpPW4pNxDyEoxa7UPV+jmlgkWn0N6K+m5P+edKJTz1VibtGAEfc8Z6D/A
 53KoW/XYw1nTIRktQHoetHJ/fVcmJZRu+14fS9isvWMT6IDUul9tCFe9zAn2tflXSg
 9Y5uQTgAqplDw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A099617E0ECB;
 Fri, 28 Nov 2025 10:48:52 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
Subject: [PATCH v3 5/8] drm/panthor: Fix immediate ticking on a disabled tick
Date: Fri, 28 Nov 2025 10:48:36 +0100
Message-ID: <20251128094839.3856402-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251128094839.3856402-1-boris.brezillon@collabora.com>
References: <20251128094839.3856402-1-boris.brezillon@collabora.com>
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

v3:
- Collect R-b

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 531b52ee3a92..1efeabc4b0ac 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2435,6 +2435,7 @@ static void tick_work(struct work_struct *work)
 						      tick_work.work);
 	struct panthor_device *ptdev = sched->ptdev;
 	struct panthor_sched_tick_ctx ctx;
+	u64 resched_target = sched->resched_target;
 	u64 remaining_jiffies = 0, resched_delay;
 	u64 now = get_jiffies_64();
 	int prio, ret, cookie;
@@ -2447,8 +2448,12 @@ static void tick_work(struct work_struct *work)
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

