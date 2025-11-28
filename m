Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149DFC91829
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 10:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991B210E7A2;
	Fri, 28 Nov 2025 09:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LegrBrjU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65CC10E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764323334;
 bh=kzcA8kppoA5yA3cBturOYtLLwxqoKGSVXgbax9TMYmY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LegrBrjUQLFvdU4LOrkcaxaBUUZS4mS3UbSLaGA2qeA8j4tLEGc39EhFYzYKkzS8N
 Zbk43/jJ8FJ/NKBp0GnZ2oZgBdwuClaAqke0T/iuMu1M726b4edxYGnJevGC2mzyaG
 g61YeMQXeYGpM0Akvi/LL6DJG0x+pzkM1LapWMPjEUYMMWUvg0PWyr09lpz9+WpVyb
 AZSWlUXgxQl7PF5US11/uuVdD/lS85ActPpM0jXQh4lbUsaI+muPYWvRK/3n2vpHzo
 f624KNX+XgvFttD4mg5WfcJJnZVGP7RqNO6rgxJ/OBgXM0h9F3HGacB65rnnXtmcz+
 gjphrqtmDduMw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 245E817E1339;
 Fri, 28 Nov 2025 10:48:54 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
Subject: [PATCH v3 8/8] drm/panthor: Kill panthor_sched_immediate_tick()
Date: Fri, 28 Nov 2025 10:48:39 +0100
Message-ID: <20251128094839.3856402-9-boris.brezillon@collabora.com>
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

It's only used in a couple places and everyone else is just using
sched_queue_delayed_work(sched, tick, 0) directly, so let's make
this consistent.

v2:
- Add R-b

v3:
- Collect R-b

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 7759a8a8565e..389d508b3848 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2753,13 +2753,6 @@ static void panthor_group_start(struct panthor_group *group)
 	group_put(group);
 }
 
-static void panthor_sched_immediate_tick(struct panthor_device *ptdev)
-{
-	struct panthor_scheduler *sched = ptdev->scheduler;
-
-	sched_queue_delayed_work(sched, tick, 0);
-}
-
 /**
  * panthor_sched_report_mmu_fault() - Report MMU faults to the scheduler.
  */
@@ -2767,13 +2760,13 @@ void panthor_sched_report_mmu_fault(struct panthor_device *ptdev)
 {
 	/* Force a tick to immediately kill faulty groups. */
 	if (ptdev->scheduler)
-		panthor_sched_immediate_tick(ptdev);
+		sched_queue_delayed_work(ptdev->scheduler, tick, 0);
 }
 
 void panthor_sched_resume(struct panthor_device *ptdev)
 {
 	/* Force a tick to re-evaluate after a resume. */
-	panthor_sched_immediate_tick(ptdev);
+	sched_queue_delayed_work(ptdev->scheduler, tick, 0);
 }
 
 void panthor_sched_suspend(struct panthor_device *ptdev)
-- 
2.51.1

