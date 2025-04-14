Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48DCA880FF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE1C10E07F;
	Mon, 14 Apr 2025 13:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gj3T7aRY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB3510E07F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744635683;
 bh=IAqytf5wlBGBlGFiqe3tXspl0VFBzx2PdXNyK5eqWG8=;
 h=From:To:Cc:Subject:Date:From;
 b=gj3T7aRYQH4GooI4m01xx0FC8NQGeC48rABb5qECDJ53L8izAhXvj6cw9ii9Wi3RW
 ScHk2INKeheGkX9KPDAbI7ZUkDwoJyhakT5vJJWBr9LP3Jx6WyARqco0kfVTs9ivqX
 PqJoeOFKoyfG3dpzJY4OjjoyDYPDzCWEJrWzjKRh8DsyX3XMkwSEIKSEkeve56/0cQ
 2vI9FUVuPn7tZlhtXrkVaKKxxMrBUQmOtFfgd+zFSVDqzRypUTxQXwtvrcIwXVV6be
 7/2628NbJowLnCVWCTFhdFQj2Fv6ViKegKn3vg1coPpckOaknepjJ4HG151/RSlVOY
 2eZXhENFvaLXA==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E176617E0F85;
 Mon, 14 Apr 2025 15:01:22 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] drm/panthor: Fix the panthor_gpu_coherency_init() error path
Date: Mon, 14 Apr 2025 15:01:20 +0200
Message-ID: <20250414130120.581274-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
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

The panthor_gpu_coherency_init() call has been moved around, but the
error path hasn't been adjusted accordingly. Make sure we undo what
has been done before this call in case of failure.

Fixes: 7d5a3b22f5b5 ("drm/panthor: Call panthor_gpu_coherency_init() after PM resume()")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/dri-devel/4da470aa-4f84-460e-aff8-dabc8cc4da15@stanley.mountain/T/#t
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index c73c1608d6e6..1e8811c6716d 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -245,7 +245,7 @@ int panthor_device_init(struct panthor_device *ptdev)
 
 	ret = panthor_gpu_coherency_init(ptdev);
 	if (ret)
-		return ret;
+		goto err_unplug_gpu;
 
 	ret = panthor_mmu_init(ptdev);
 	if (ret)
-- 
2.49.0

