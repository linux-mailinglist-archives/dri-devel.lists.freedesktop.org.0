Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7153588C049
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 12:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879D510E6CA;
	Tue, 26 Mar 2024 11:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WMhxaRCD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BFA10E69F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 11:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711451528;
 bh=DiL6oPQDZqeT2D7ZQKOabZXvbXTMfTqUbHwNWfhmyOI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WMhxaRCDlkrDX1rSknDl8xWulrJWSwGn5ocynaL52IYZtLlXK+4m/GZzGggO5MM/K
 0oEi9mHl1aOyoCcuimBzdjUgbmMBPzYFT3jOwnxueVHyT2LXg2BauhvB/Msm2PKKSW
 cC8bUVu1bfzy0pvfJ3mAEuqYSNmXS4BHv0dtJRO886fI01iyKoEDBbUh6i/c3QXRAs
 6aNXL2v5wHh9usmRPTkO/HqfRChr0EF143EygylYCnmyoE1HBrRZluO8oWHgrdbXTu
 2/diVW0mMMuKcOC7BDGu+e134+vCBhbACyQT6QawfWIEevrhJvRIE7v6ZGZr4jWXNi
 jvEijanHgN8kA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6B49537820BB;
 Tue, 26 Mar 2024 11:12:08 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v3 3/3] drm/panthor: Drop the dev_enter/exit() sections in
 _irq_suspend/resume()
Date: Tue, 26 Mar 2024 12:12:05 +0100
Message-ID: <20240326111205.510019-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326111205.510019-1-boris.brezillon@collabora.com>
References: <20240326111205.510019-1-boris.brezillon@collabora.com>
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

There's no reason for _irq_suspend/resume() to be called after the
device has been unplugged, and keeping this dev_enter/exit()
section in _irq_suspend() is turns _irq_suspend() into a NOP
when called from the _unplug() functions, which we don't want.

v3:
- New patch

Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 3a930a368ae1..99ddc41f2626 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -326,13 +326,8 @@ static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)
 	int cookie;										\
 												\
 	pirq->mask = 0;										\
-												\
-	if (drm_dev_enter(&pirq->ptdev->base, &cookie)) {					\
-		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);				\
-		synchronize_irq(pirq->irq);							\
-		drm_dev_exit(cookie);								\
-	}											\
-												\
+	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
+	synchronize_irq(pirq->irq);								\
 	atomic_set(&pirq->suspended, true);							\
 }												\
 												\
@@ -342,12 +337,8 @@ static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u
 												\
 	atomic_set(&pirq->suspended, false);							\
 	pirq->mask = mask;									\
-												\
-	if (drm_dev_enter(&pirq->ptdev->base, &cookie)) {					\
-		gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);			\
-		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);			\
-		drm_dev_exit(cookie);								\
-	}											\
+	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);				\
+	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);				\
 }												\
 												\
 static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
-- 
2.44.0

