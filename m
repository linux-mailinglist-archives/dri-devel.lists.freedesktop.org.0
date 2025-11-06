Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB126C3BD99
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718D810E927;
	Thu,  6 Nov 2025 14:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BEjW82N2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EE410E90E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 14:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762440429;
 bh=YODmaT0UcferATflyXEOJmULOHgTUZmwflRFnBOixo4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BEjW82N2sJk72UomA+euOAPFm44tScRGEyIQG7RluGL5HIhjMlqNqbDqLExQUX0ku
 GybSVZyYnQTqQaF64wYjxNN4AhnzSpX99QyDzWrSCWV8imUzWz150cBMZUn2MggkWn
 YeOhwK04xMQE29xa+6kGZoCfEVZ+Y+PCwukwcTVv/3DNL2VETBv2/MVakwFzGgcCoP
 /gv95utg9yiEUDgB4WWQGj/fpVlW1JqN4TgzPusfaqbUj/jygS3S1v5ODiJ+12AUIC
 gSpqXUD0tirNFckTnM6eRh0vNeRLFeg/jIU06BAus+04eCZxwPUDr19fVWRmnQZAql
 akYGewUhzkFfQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DC25D17E0CA1;
 Thu,  6 Nov 2025 15:47:08 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, kernel@collabora.com
Subject: [PATCH v1 8/8] drm/panthor: Kill panthor_sched_immediate_tick()
Date: Thu,  6 Nov 2025 15:46:56 +0100
Message-ID: <20251106144656.1012274-9-boris.brezillon@collabora.com>
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

It's only used in a couple places and everyone else is just using
sched_queue_delayed_work(sched, tick, 0) directly, so let's make
this consistent.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 923816397751..6b8428ca8145 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2668,13 +2668,6 @@ static void panthor_group_start(struct panthor_group *group)
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
@@ -2682,13 +2675,13 @@ void panthor_sched_report_mmu_fault(struct panthor_device *ptdev)
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

