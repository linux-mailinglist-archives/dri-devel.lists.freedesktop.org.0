Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46546C3BD93
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DC210E925;
	Thu,  6 Nov 2025 14:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WmRfWhYw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249C210E90E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 14:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762440427;
 bh=IEdahWd3+iRpHc6moaFtC4PQw/zWsdAFR1U+h/amVjU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WmRfWhYwInV3UtqGwCAc0FuhI1B1W2SfEixzTXE+FL76xJYDKkC4jyi4sojUHHaj8
 L4Kj+QCnv1nd0/P0GfAHR1totg/sxAL2EJMpMR95X/KwUZ0YIYMtnahDxw1vbDjlIA
 pgkHYA/TfFFejs5KzBiSfeQvPQMFl/mg3UGBoE1vTjT+dnnGvyZ8gvRnyYk7PWOxK9
 widWbC0sAUQUpqIGDWyL29CGY2BTVYG12YB/T+O/ZWKywTfa6roD52ebg8ICr4ZCAk
 MvQyedGAxKO9r86N1P50xdK2wIFnEVf//a8UiEB8iN8g6q0mWOdp4cU4odCQk4zfs2
 4xqnZbW7xUwSw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 74D2817E1416;
 Thu,  6 Nov 2025 15:47:07 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, kernel@collabora.com
Subject: [PATCH v1 5/8] drm/panthor: Fix immediate ticking on a disabled tick
Date: Thu,  6 Nov 2025 15:46:53 +0100
Message-ID: <20251106144656.1012274-6-boris.brezillon@collabora.com>
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

We have a few path where we schedule the tick work immediately without
changing the resched_target. If the tick was stopped, this would lead
to a remaining_jiffies that's always > 0, and it wouldn't force a full
tick in that case. Add extra checks to cover that case properly.

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index b6489e9ba1f0..1eba56e7360d 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2358,8 +2358,12 @@ static void tick_work(struct work_struct *work)
 	if (drm_WARN_ON(&ptdev->base, ret))
 		goto out_dev_exit;
 
-	if (time_before64(now, sched->resched_target))
+	if (sched->resched_target != U64_MAX &&
+	    time_before64(now, sched->resched_target))
 		remaining_jiffies = sched->resched_target - now;
+	else if (sched->resched_target == U64_MAX &&
+		 time_before64(now, sched->last_tick + sched->tick_period))
+		remaining_jiffies = sched->last_tick + sched->tick_period - now;
 
 	full_tick = remaining_jiffies == 0;
 
-- 
2.51.1

