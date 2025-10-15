Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ACABDF868
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1688110E860;
	Wed, 15 Oct 2025 16:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eBtMDKUH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CC810E853
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760544217;
 bh=Y55zjvfcuQupWYB0Q28iT1ZEwRlRptMtmYL9e1QXF+0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eBtMDKUH5rnMtiYa1zsBMxbKLXumhLpfidiC2KJUCvtDu9tdH4CtiVhPFsmSnm77+
 kqVhCdO027dcaepXmGG/1yCQPFYeqUAaYhaukM4HkYuc/BJ+x8HowZpGUqB9tVdAiZ
 72tR8iDRDxAhEJdIefNVH9lP4l3gzYFi9WzzpTBCczCuDpEfCozOoCj4vQC10YXDM4
 KE1XXwfE+MnO3RfJbEBzJ8QZL9aEq8kZe1v/l9s/OZbza9g94uqx5ggBlVqosU+2UF
 cfNQfLIozFM8J6wl1EyCqbzSpG6WosqY+BWLR/grWLR3BE40nG50B8f0Yu+c93FX1b
 nVRUQEN4dNrOQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E7B517E1340;
 Wed, 15 Oct 2025 18:03:37 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH v4 01/14] drm/panthor: Fix panthor_gpu_coherency_set()
Date: Wed, 15 Oct 2025 18:03:13 +0200
Message-ID: <20251015160326.3657287-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015160326.3657287-1-boris.brezillon@collabora.com>
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
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

GPU_COHERENCY_PROTOCOL takes one of GPU_COHERENCY_xx
not BIT(GPU_COHERENCY_xx).

v3:
- New commit

v4:
- Add Steve's R-b

Cc: Akash Goel <akash.goel@arm.com>
Fixes: dd7db8d911a1 ("drm/panthor: Explicitly set the coherency mode")
Reported-by: Steven Price <steven.price@arm.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 9d98720ce03f..7f9a28e90409 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -49,7 +49,7 @@ struct panthor_gpu {
 static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 {
 	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
-		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
+		  ptdev->coherent ? GPU_COHERENCY_ACE_LITE : GPU_COHERENCY_NONE);
 }
 
 static void panthor_gpu_l2_config_set(struct panthor_device *ptdev)
-- 
2.51.0

