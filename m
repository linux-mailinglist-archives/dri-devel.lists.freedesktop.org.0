Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D849929E36
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 10:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AC810E2A6;
	Mon,  8 Jul 2024 08:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 36B7310E29C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 08:22:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.09,191,1716217200"; d="scan'208";a="210645630"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 08 Jul 2024 17:22:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.86])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6CFCC438B0A5;
 Mon,  8 Jul 2024 17:22:23 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm: renesas: rcar-du: rcar_lvds: Fix PM imbalance if
 RPM_ACTIVE
Date: Mon,  8 Jul 2024 09:22:17 +0100
Message-ID: <20240708082220.22115-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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

The pm_runtime_resume_and_get() returns 1 if RPM is active, in this
case it won't call a put. This will result in PM imbalance as it
treat this as an error and propagate this to caller and the caller
never calls corresponding put(). Fix this issue by checking error
condition only.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
index 92ba43a6fe38..471a2d3bc203 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
@@ -361,7 +361,7 @@ static void rcar_lvds_enable(struct drm_bridge *bridge,
 	int ret;
 
 	ret = pm_runtime_resume_and_get(lvds->dev);
-	if (ret)
+	if (ret < 0)
 		return;
 
 	/* Enable the companion LVDS encoder in dual-link mode. */
@@ -550,7 +550,7 @@ int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq,
 	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
 
 	ret = pm_runtime_resume_and_get(lvds->dev);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	rcar_lvds_pll_setup_d3_e3(lvds, freq, dot_clk_only);
-- 
2.43.0

