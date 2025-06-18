Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67566ADF7EE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 22:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ECD10E952;
	Wed, 18 Jun 2025 20:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="phghBS4W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCD610E955;
 Wed, 18 Jun 2025 20:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1750279337;
 bh=vRSop1esSI6ViSFxoz+SiFvJXRkVP03/6Jr3Bmz4YpI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=phghBS4Wc2i9/G9cl1tOOTJc1saDZEGCLOVhag1lO+rHhmBWBYQ4skci8wALmaHko
 hp/GlDrZP5Nrz1yII9Uv/TtVV3NgJ+sdtek2El7e33kFuU40OjuKySCHkvRf+kHq16
 ut5pzIQPCq++wxjEU1V2d6vLaOcs+DbSf3UEblgIa6/wzfJvddouJrDsVrkDy1LK5f
 afHsXreKfS2L0Re0FNtjh7ih88Lyhgm10wZnWyK9ybbEHDcgzI7qN4zx7zPieH5WWU
 W+gU9l0r7diMIr0brdrq3i4fZ/MWNSYOdnEQmjMaTqc8aYaygOGR75bxHL2DCrmcGk
 tAXJNzkRICVUQ==
Received: from localhost.localdomain (unknown [89.186.158.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gerddie)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CABF17E156A;
 Wed, 18 Jun 2025 22:42:17 +0200 (CEST)
From: Gert Wollny <gert.wollny@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH v2 4/6] drm/etnaviv: Identify GPU already when binding
Date: Wed, 18 Jun 2025 22:43:32 +0200
Message-ID: <20250618204400.21808-5-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618204400.21808-1-gert.wollny@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
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

This is required to know whether to be able to avoid allocating
the flop reset data if non of the available GPUs actually need
it.

Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index cf0d9049bcf1..dc8a7ff3e797 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -829,14 +829,6 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 		goto fail;
 	}
 
-	etnaviv_hw_identify(gpu);
-
-	if (gpu->identity.model == 0) {
-		dev_err(gpu->dev, "Unknown GPU model\n");
-		ret = -ENXIO;
-		goto fail;
-	}
-
 	if (gpu->identity.nn_core_count > 0)
 		dev_warn(gpu->dev, "etnaviv has been instantiated on a NPU, "
                                    "for which the UAPI is still experimental\n");
@@ -1808,6 +1800,13 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	INIT_WORK(&gpu->sync_point_work, sync_point_worker);
 	init_waitqueue_head(&gpu->fence_event);
 
+	etnaviv_hw_identify(gpu);
+
+	if (gpu->identity.model == 0) {
+		dev_err(gpu->dev, "Unknown GPU model\n");
+		ret = -ENXIO;
+		goto out_sched;
+	}
 	priv->gpu[priv->num_gpus++] = gpu;
 
 	return 0;
-- 
2.49.0

