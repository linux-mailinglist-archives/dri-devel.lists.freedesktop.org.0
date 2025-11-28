Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FF9C914C1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 09:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C537710E722;
	Fri, 28 Nov 2025 08:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CcVXl7/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A4010E836
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 08:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764319735;
 bh=kA8PS/S5QLARQoc9J67dKWE4xmLfF16NUrbIprxdAGw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CcVXl7/H01ewGwiDXkiFojf32UUxe0xGdtasR7jWXofgNAC6GgBsC6FECFIMbxYd+
 ur4zKgXs9Fom1MqUbENSV0ZaBlHLE+BSUOaejAt0M+y7wgnO4n5wnjYcv9qYi5Ab7s
 BwCQkxUWwH942OIrtBud/QIVbMGV5zhZuelIhHXJo5+26CJNaBC/Uy8cJnJ16ZnYmA
 oARAScFWCD/hl5rT7JNhfy5tBp7bvRCpuDH9odPyESdnWxSSoVhMlpm3u3S6cu2oYT
 27KyudZbjLS5mNDuvC8rU+SqPd1bUEoYxFs3Tfo7ecjJKsht+6Qwie4OumbdOyqVwZ
 ZhS/bfxFXUJoA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1581B17E1341;
 Fri, 28 Nov 2025 09:48:55 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>, kernel@collabora.com
Subject: [PATCH v4 3/6] drm/panthor: Recover from panthor_gpu_flush_caches()
 failures
Date: Fri, 28 Nov 2025 09:48:37 +0100
Message-ID: <20251128084841.3804658-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251128084841.3804658-1-boris.brezillon@collabora.com>
References: <20251128084841.3804658-1-boris.brezillon@collabora.com>
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

We have seen a few cases where the whole memory subsystem is blocked
and flush operations never complete. When that happens, we want to:

- schedule a reset, so we can recover from this situation
- in the reset path, we need to reset the pending_reqs so we can send
  new commands after the reset
- if more panthor_gpu_flush_caches() operations are queued after
  the timeout, we skip them and return -EIO directly to avoid needless
  waits (the memory block won't miraculously work again)

Note that we drop the WARN_ON()s because these hangs can be triggered
with buggy GPU jobs created by the UMD, and there's no way we can
prevent it. We do keep the error messages though.

v2:
- New patch

v3:
- Collect R-b
- Explicitly mention the fact we dropped the WARN_ON()s in the commit
  message

v4:
- No changes

Fixes: 5cd894e258c4 ("drm/panthor: Add the GPU logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gpu.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 06b231b2460a..9cb5dee93212 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -289,38 +289,42 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
 int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 			     u32 l2, u32 lsc, u32 other)
 {
-	bool timedout = false;
 	unsigned long flags;
+	int ret = 0;
 
 	/* Serialize cache flush operations. */
 	guard(mutex)(&ptdev->gpu->cache_flush_lock);
 
 	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
-	if (!drm_WARN_ON(&ptdev->base,
-			 ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)) {
+	if (!(ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)) {
 		ptdev->gpu->pending_reqs |= GPU_IRQ_CLEAN_CACHES_COMPLETED;
 		gpu_write(ptdev, GPU_CMD, GPU_FLUSH_CACHES(l2, lsc, other));
+	} else {
+		ret = -EIO;
 	}
 	spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
 
+	if (ret)
+		return ret;
+
 	if (!wait_event_timeout(ptdev->gpu->reqs_acked,
 				!(ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED),
 				msecs_to_jiffies(100))) {
 		spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
 		if ((ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED) != 0 &&
 		    !(gpu_read(ptdev, GPU_INT_RAWSTAT) & GPU_IRQ_CLEAN_CACHES_COMPLETED))
-			timedout = true;
+			ret = -ETIMEDOUT;
 		else
 			ptdev->gpu->pending_reqs &= ~GPU_IRQ_CLEAN_CACHES_COMPLETED;
 		spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
 	}
 
-	if (timedout) {
+	if (ret) {
+		panthor_device_schedule_reset(ptdev);
 		drm_err(&ptdev->base, "Flush caches timeout");
-		return -ETIMEDOUT;
 	}
 
-	return 0;
+	return ret;
 }
 
 /**
@@ -360,6 +364,7 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
 		return -ETIMEDOUT;
 	}
 
+	ptdev->gpu->pending_reqs = 0;
 	return 0;
 }
 
-- 
2.51.1

