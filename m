Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C6EAEE838
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 22:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA0C10E4C7;
	Mon, 30 Jun 2025 20:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RdE17BTv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01D710E4C1;
 Mon, 30 Jun 2025 20:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751315120;
 bh=xB7QGHyQ7LZDLROkroqvK8J5I8By/18BP/QbTfmkBwE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RdE17BTveF/EH1pRCAkCFmWNbq+Om+oioofuplBuFZbQg625FyeHKX515K328Qoxe
 Ubb4wiKHAxS6up70lCmIOLKgQcNI8VEYYBLJhhQJdozlsml8jEOVDGmnszVAJC3ZSs
 gotcuWnVuJXedT4uaj+heglfxZNm5zLkai4IljI2AGJYeC69NbScBDcpCzMFhVdJJ8
 ONmjeOif1thwoLxQYMc+oMAf3B73BuQiWsjph+PPIZumtHVG3RsYKuJIH02yRwzlh/
 hFsGUCnuJ92B+WitxQq65qg3IGoj3oECQkBsBIOU15N1Frns/6yzkEumaehF6sQi+Y
 5I45q3mcJv6RQ==
Received: from localhost.localdomain (unknown [92.206.120.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gerddie)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 148F017E0F3F;
 Mon, 30 Jun 2025 22:25:20 +0200 (CEST)
From: Gert Wollny <gert.wollny@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH v3 5/5] drm/etnaviv: Add module parameter to force PPU flop
 reset
Date: Mon, 30 Jun 2025 22:26:31 +0200
Message-ID: <20250630202703.13844-6-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630202703.13844-1-gert.wollny@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
 <20250630202703.13844-1-gert.wollny@collabora.com>
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

v2: Check for feature PIPE_3D when forcing PPU flop reset (Lucas)

Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
index 138af3c33b5d..ec32128ebac5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
@@ -16,6 +16,9 @@ enum etnaviv_flop_reset_type {
 	flop_reset_tp = 1 << 2
 };
 
+static int etnaviv_force_flop_reset = 0;
+module_param_named(force_flop_reset, etnaviv_force_flop_reset, int , 0);
+
 #define PPU_IMAGE_STRIDE 64
 #define PPU_IMAGE_XSIZE 64
 #define PPU_IMAGE_YSIZE 6
@@ -151,6 +154,20 @@ etnaviv_flop_reset_ppu_require(const struct etnaviv_chip_identity *chip_id)
 			return (e->flags & flop_reset_ppu) != 0;
 	}
 
+	if (etnaviv_force_flop_reset & flop_reset_ppu) {
+
+		if (!(chip_id->features & chipFeatures_PIPE_3D)) {
+			pr_warn("Feature PIPE_3D not supported, ignore request to force "
+				"PPU flop reset for model: 0x%04x, revision: 0x%04x\n",
+				chip_id->model, chip_id->revision);
+			return false;
+		}
+
+		pr_info("Force PPU flop reset for model: 0x%04x, revision: 0x%04x\n",
+			chip_id->model, chip_id->revision);
+		return true;
+	}
+
 	return false;
 }
 
-- 
2.49.0

