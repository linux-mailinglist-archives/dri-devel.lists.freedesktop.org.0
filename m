Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE8CC474D7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 15:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDFB10E404;
	Mon, 10 Nov 2025 14:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PjxFJlwK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2275410E402;
 Mon, 10 Nov 2025 14:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762785835;
 bh=WGSF1+2qqoDh4Y4z7LPzg1vrBUYL/ctGtWrdC8hI3eE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PjxFJlwKmyvDepr4EXByCeYc3IPTxrnilt8BCsYYk1F7DENnCxbxfORcpP9dXUIlq
 e++Z0YDFF6j2cZvGDGIaL2SkrJcMcIwXEcQfaummgVMHhhsV3JTKcSnQ4RJrmsNzPf
 oZn473XI6E9FIvpSZDVM/zfMjqcFA7LlbDZaLEdWezEKD3EfqP7as1zK4ApCkS2qVa
 iZ5xVMw7eov6THIDpeTvebUTqckj85IpAFevJyJIgtAmQbjKAFi6GbKPRz1O3I8nxF
 JIsDbX6X07IzzdPWQja4yzZ1AbXZeYVrf3fAtyg94sUziNcHNaFWKM9o4qfx99GSBO
 IOlDnkBcCM8Rg==
Received: from localhost.localdomain (unknown [92.206.121.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gerddie)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6637617E1313;
 Mon, 10 Nov 2025 15:43:55 +0100 (CET)
From: gert.wollny@collabora.com
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH v4 5/5] drm/etnaviv: Add module parameter to force PPU flop
 reset
Date: Mon, 10 Nov 2025 15:37:51 +0100
Message-ID: <20251110144625.18653-6-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110144625.18653-1-gert.wollny@collabora.com>
References: <20250630202703.13844-1-gert.wollny@collabora.com>
 <20251110144625.18653-1-gert.wollny@collabora.com>
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

From: Gert Wollny <gert.wollny@collabora.com>

v2: Check for feature PIPE_3D when forcing PPU flop reset (Lucas)

v3: - drop use of ppu_flop_reset enum (Christian Gmeiner)
    - don't initialize module parameter to zero (checkpatch)
    - avoid multi-line string in warning message (checkpatch)

Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
index 7c0112b3b3ad..75fe8cce1177 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
@@ -13,6 +13,9 @@
 
 #include "etnaviv_flop_reset.h"
 
+static int etnaviv_force_flop_reset;
+module_param_named(force_flop_reset, etnaviv_force_flop_reset, int, 0);
+
 #define PPU_IMAGE_STRIDE 64
 #define PPU_IMAGE_XSIZE 64
 #define PPU_IMAGE_YSIZE 6
@@ -148,6 +151,19 @@ bool etnaviv_flop_reset_ppu_require(const struct etnaviv_chip_identity *chip_id)
 			return true;
 	}
 
+	if (etnaviv_force_flop_reset) {
+		if (!(chip_id->features & chipFeatures_PIPE_3D)) {
+			pr_warn("Etnaviv: model: 0x%04x, revision: 0x%04x does not support PIPE_3D\n",
+				chip_id->model, chip_id->revision);
+			pr_warn("Request to force PPU flop reset ignored.\n");
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
2.51.0

