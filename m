Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C299F475F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 10:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D75610E895;
	Tue, 17 Dec 2024 09:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PGeeoWaX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927BA10E895
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 09:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734427499;
 bh=qQcGGBD6mmUerCb3XFB1EGIBdW2xfwJ+d61hIBWxSyg=;
 h=From:To:Cc:Subject:Date:From;
 b=PGeeoWaXy1oDhXc2hEz+5qjOJp9Ma97z3t5otGWiPEwlC8pMckjb8spMm1ebsRP2O
 r7nHbB5Tq5X8cwUQdgbKYh2HI/e/uQh7JNdo+25I/m0UOqsZHWYO3VB0CTabDKrqpX
 Hp6mLZiWGDh5Qk/4QdyRdJXqXqz+p6kDoe34rqbtr4RL2RwJMvkpLLpUWPlKMIlbz1
 4wkKFQVeKrS9vmsVjzBsMuIw6KOuybf2VV9HZGHhi2YHsnQGJXr4/Sx0ZCBwhMtBK6
 sHUXT6XidM6KPQoQW3Qlu0lRY8CKVyPkezVl9D2tuXWStQzXLhEqvBscrbX4UMsCSW
 LldiGIuHdzwPA==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5CFCE17E1576;
 Tue, 17 Dec 2024 10:24:59 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Christopher Healy <healych@amazon.com>,
 kernel@collabora.com
Subject: [PATCH] drm/panthor: Fix a race between the reset and suspend path
Date: Tue, 17 Dec 2024 10:24:57 +0100
Message-ID: <20241217092457.1582053-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.47.0
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

If a reset is scheduled when the suspend happens, we drop the
reset-pending info on the floor assuming the resume will fix things,
but the resume logic might try a fast reset. If we're lucky, the
fast reset fails and we fallback to a slow reset, but if the FW was
corrupted in a way that makes it partially functional (it boots but
doesn't quite do what it's expected to do), we won't notice immediately
that things are not working correctly, leading to a new reset further
down the road.

Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 2c817e65e6be..3285ac42d2cd 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -128,14 +128,11 @@ static void panthor_device_reset_work(struct work_struct *work)
 	struct panthor_device *ptdev = container_of(work, struct panthor_device, reset.work);
 	int ret = 0, cookie;
 
-	if (atomic_read(&ptdev->pm.state) != PANTHOR_DEVICE_PM_STATE_ACTIVE) {
-		/*
-		 * No need for a reset as the device has been (or will be)
-		 * powered down
-		 */
-		atomic_set(&ptdev->reset.pending, 0);
+	/* If the device is entering suspend, we don't reset. A slow reset will
+	 * be forced at resume time instead.
+	 */
+	if (atomic_read(&ptdev->pm.state) != PANTHOR_DEVICE_PM_STATE_ACTIVE)
 		return;
-	}
 
 	if (!drm_dev_enter(&ptdev->base, &cookie))
 		return;
@@ -473,6 +470,14 @@ int panthor_device_resume(struct device *dev)
 
 	if (panthor_device_is_initialized(ptdev) &&
 	    drm_dev_enter(&ptdev->base, &cookie)) {
+		/* If there was a reset pending at the time we suspended the
+		 * device, we force a slow reset.
+		 */
+		if (atomic_read(&ptdev->reset.pending)) {
+			ptdev->reset.fast = false;
+			atomic_set(&ptdev->reset.pending, 0);
+		}
+
 		ret = panthor_device_resume_hw_components(ptdev);
 		if (ret && ptdev->reset.fast) {
 			drm_err(&ptdev->base, "Fast reset failed, trying a slow reset");
@@ -489,9 +494,6 @@ int panthor_device_resume(struct device *dev)
 			goto err_suspend_devfreq;
 	}
 
-	if (atomic_read(&ptdev->reset.pending))
-		queue_work(ptdev->reset.wq, &ptdev->reset.work);
-
 	/* Clear all IOMEM mappings pointing to this device after we've
 	 * resumed. This way the fake mappings pointing to the dummy pages
 	 * are removed and the real iomem mapping will be restored on next
-- 
2.47.0

