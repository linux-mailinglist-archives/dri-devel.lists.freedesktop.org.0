Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF2888C04A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 12:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8297110E69F;
	Tue, 26 Mar 2024 11:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="az/8fhI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5053710E644
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 11:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711451528;
 bh=ND6QGK9FyIVua+0MkDEU162BqDYjLrfD4zmzMBy2vVw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=az/8fhI0+O6ToDSfORQWOuiQdLvnpGJSKIW44U86m+7LILUWTtdXhWQipRsUnVrkH
 8i23FOAKQxLmEJGW7kwA4kYHqyugTzDUyFHYGdLp+zlcekZr8eCq7Pp24INudXu5xR
 tdqr65RL6Boy3qN48c+kcdrAysHUDGsH895gSmYNFVTgoOEkiHsnimOH89SRpKuNbo
 XttBYxAt35nMB7KJupwA8herZppvE8LVx34NsxIK59Dty29ZOXGKuhpsiUuiAt4us/
 UruDL9t5UpAunppWiFB4c4hR1Rf0ZlrQKgvIgprBzHSrAVbVaa3yhBKK/spymxYqha
 o/Ljw4lOvsUeQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C4AFA378209A;
 Tue, 26 Mar 2024 11:12:07 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v3 2/3] drm/panthor: Fix ordering in _irq_suspend()
Date: Tue, 26 Mar 2024 12:12:04 +0100
Message-ID: <20240326111205.510019-2-boris.brezillon@collabora.com>
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

Make sure we set suspended=true last to avoid generating an irq storm
in the unlikely case where an IRQ happens between the suspended=true
assignment and the _INT_MASK update.

We also move the mask=0 assignment before writing to the _INT_MASK
register to prevent the thread handler from unmasking the interrupt
behind our back. This means we might lose events if there were some
pending when we get to suspend the IRQ, but that's fine.
The synchronize_irq() we have in the _irq_suspend() path was not
there to make sure all IRQs are processed, just to make sure we don't
have registers accesses coming from the irq handlers after
_irq_suspend() has been called. If there's a need to have all pending
IRQs processed, it should happen before _irq_suspend() is called.

v3:
- Add Steve's R-b

v2:
- New patch

Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
Reported-by: Steven Price <steven.price@arm.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 7ee4987a3796..3a930a368ae1 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -325,7 +325,7 @@ static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)
 {												\
 	int cookie;										\
 												\
-	atomic_set(&pirq->suspended, true);							\
+	pirq->mask = 0;										\
 												\
 	if (drm_dev_enter(&pirq->ptdev->base, &cookie)) {					\
 		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);				\
@@ -333,7 +333,7 @@ static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)
 		drm_dev_exit(cookie);								\
 	}											\
 												\
-	pirq->mask = 0;										\
+	atomic_set(&pirq->suspended, true);							\
 }												\
 												\
 static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u32 mask)	\
-- 
2.44.0

