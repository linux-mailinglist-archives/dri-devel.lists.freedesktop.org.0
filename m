Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA10A7B895
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 10:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB46410EB83;
	Fri,  4 Apr 2025 08:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="l5algtZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BF710EAC9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 08:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743754176;
 bh=J4hJp9U/HtsJHBm8tu9HBi1wnqCpuUekcTYXvBhU02Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l5algtZmUikL6vdk69CcTRSYDD/g0PPkP2UDOix1uAkWUy1IIumh15QW+1bV1Oanb
 jgc2OzoVSRu2cNQf2hTdt1qn1VPq67rCiec3EzH5DkfA0p9WCLbLsgWHI/jL1ywd4a
 QvO/eTt2bBcYzkRyBLX0loyXEtsZ9E4IPAWX68euQSrJ2Qprz3Z2fu0QJs7K/539dl
 /bOWoWy+rXDAH1gF8tJMEj9LVfq1LXxFoycMkC1Ez8crNt4KO3YZVw4f+jnMMUJCgq
 nqlyLyvVSoCp4yyj1jnSHVbOJV5s6mn3RTkE/loFYY4yS9lPi244+rHBRyq6AUiOlx
 3zmwpDlYJwdjA==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 28B7D17E0FC1;
 Fri,  4 Apr 2025 10:09:36 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v3 2/5] drm/panthor: Call panthor_gpu_coherency_init() after
 PM resume()
Date: Fri,  4 Apr 2025 10:09:30 +0200
Message-ID: <20250404080933.2912674-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404080933.2912674-1-boris.brezillon@collabora.com>
References: <20250404080933.2912674-1-boris.brezillon@collabora.com>
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

When the device is coherent, panthor_gpu_coherency_init() will read
GPU_COHERENCY_FEATURES to make sure the GPU supports the ACE-Lite
coherency protocol, which will fail if the clocks/power-domains are
not enabled when the read is done. Move the
panthor_gpu_coherency_init() call after the device has been resumed
to prevent that.

Changes in v2:
- Add Liviu's R-b

Changes in v3:
- Add Steve's R-b

Fixes: dd7db8d911a1 ("drm/panthor: Explicitly set the coherency mode")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index a9da1d1eeb70..c73c1608d6e6 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -171,10 +171,6 @@ int panthor_device_init(struct panthor_device *ptdev)
 	struct page *p;
 	int ret;
 
-	ret = panthor_gpu_coherency_init(ptdev);
-	if (ret)
-		return ret;
-
 	init_completion(&ptdev->unplug.done);
 	ret = drmm_mutex_init(&ptdev->base, &ptdev->unplug.lock);
 	if (ret)
@@ -247,6 +243,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		goto err_rpm_put;
 
+	ret = panthor_gpu_coherency_init(ptdev);
+	if (ret)
+		return ret;
+
 	ret = panthor_mmu_init(ptdev);
 	if (ret)
 		goto err_unplug_gpu;
-- 
2.49.0

