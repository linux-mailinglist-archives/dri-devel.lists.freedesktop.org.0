Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDD3ADF7F8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 22:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD80410E959;
	Wed, 18 Jun 2025 20:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nJerHS5G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0264210E94F;
 Wed, 18 Jun 2025 20:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1750279338;
 bh=l5UaRJI9ED4qxZ3oMPVtbi+aP7TlXVHBIO9LNim8MDQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nJerHS5GcEy0ZmtuASGKCKZWxX+o1aZ+/ZRXMuM0Zb26SmnDg/4mOQsxObGrn5AZu
 SygaqO26BbRW4Mg0O618Y9hF0c8RjINjP0DXR+VffVzCMHojLzF1+wBL7khDGGP/LR
 DxTXdHro3121TJ2e3iakmylMCP8DJ7bRneTjC3SNVts6ZFHSd/iNZncFTOygP1Tlr8
 h2PObC67Q+M6wDftvi/ep1uSuzys9TZEr/FQ77c9ToEfvSiz7hIwwvZl7y20nao6wx
 NH2AdwvvF/WpUoEdP9C2wGaGaG2RoR0/dPeua4ZqfnObp0onna17P7eWkyPZl34wwo
 A9mWCXqK/G2uw==
Received: from localhost.localdomain (unknown [89.186.158.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gerddie)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 72D5017E1580;
 Wed, 18 Jun 2025 22:42:18 +0200 (CEST)
From: Gert Wollny <gert.wollny@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH v2 6/6] drm/etnaviv: Add module parameter to force PPU flop
 reset
Date: Wed, 18 Jun 2025 22:43:34 +0200
Message-ID: <20250618204400.21808-7-gert.wollny@collabora.com>
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

Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
index c33647e96636..bf4cae4be815 100644
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
@@ -151,6 +154,12 @@ etnaviv_flop_reset_ppu_require(const struct etnaviv_chip_identity *chip_id)
 			return (e->flags & flop_reset_ppu) != 0;
 	}
 
+	if (etnaviv_force_flop_reset & flop_reset_ppu) {
+		pr_warn("Forcing flop reset for model: 0x%04x, revision: 0x%04x\n",
+			chip_id->model, chip_id->revision);
+		return true;
+	}
+
 	return false;
 }
 
-- 
2.49.0

