Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95EBC52195
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 12:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEED010E6F6;
	Wed, 12 Nov 2025 11:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ck0DMObY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A60D10E092
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 11:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762948318;
 bh=aZWsIg0Ab/84mWNYezvHrZV2LxXWR/L3jR3xQ2P2IK4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ck0DMObYSjWEutQfHInwjgtJyELOgrIHmYCIfNbX3P9vt3w2oN8gJNLp+59pLOhSe
 NtAAaooT8pCPNIDJM0XjbJY1dj5iHwJFXLCOP5EYNbfMQcg0C0AYosHsIbX6/Cc5Si
 v7K4UztLAiYQVXQseoRAxNEw/nlkRXlyhlR69qYTmMnLpLC4yO4IUAA8jnB/21/mWt
 KUd13GOtenCJep611z+pvLjc67qId2i6Hb1Oye1EFz1/ER5VCAGjoOjlrFTlRRDooS
 aMNpLqqSW4zw5Be+4+v0kuLP70JcnSbUjpxKFIiTNdGBhd68yRyWXVGysfkWwRlFdc
 yRzLzM4hetF9A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A265717E1340;
 Wed, 12 Nov 2025 12:51:57 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, kernel@collabora.com
Subject: [PATCH v2 8/8] drm/panthor: Kill panthor_sched_immediate_tick()
Date: Wed, 12 Nov 2025 12:51:42 +0100
Message-ID: <20251112115142.1270931-9-boris.brezillon@collabora.com>
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

It's only used in a couple places and everyone else is just using
sched_queue_delayed_work(sched, tick, 0) directly, so let's make
this consistent.

v2:
- Add R-b

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index d1484f4a1c5b..4342e3b2b30a 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2670,13 +2670,6 @@ static void panthor_group_start(struct panthor_group *group)
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
@@ -2684,13 +2677,13 @@ void panthor_sched_report_mmu_fault(struct panthor_device *ptdev)
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

