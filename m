Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544DFB55156
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 16:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A886210EC81;
	Fri, 12 Sep 2025 14:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 675F910EC7D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:27:12 +0000 (UTC)
X-CSE-ConnectionGUID: WZBfVh83Saeq4lIu0ejOnQ==
X-CSE-MsgGUID: ozZ2EeQITfCOWBDMaJwb3w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 12 Sep 2025 23:22:09 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id BD33D4005E3D;
 Fri, 12 Sep 2025 23:22:05 +0900 (JST)
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 2/2] drm: renesas: rz-du: Set DSI divider based on target
 MIPI device
Date: Fri, 12 Sep 2025 10:20:56 -0400
Message-ID: <20250912142056.2123725-3-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250912142056.2123725-1-chris.brandt@renesas.com>
References: <20250912142056.2123725-1-chris.brandt@renesas.com>
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

Before the MIPI DSI clock source can be configured, the target divide
ratio needs to be known.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

---
v1->v2:
- Add spaces around '/' in comments
- Add target argument in new API
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index f87337c3cbb5..ca0de93d5a1a 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/clk/renesas.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -732,6 +733,23 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	drm_bridge_add(&dsi->bridge);
 
+	/*
+	 * Report required division ratio setting for the MIPI clock dividers
+	 * Assume the default clock source is FOUTPOSTDIV (PLL/2) being fed to the DSI-PHY, but also
+	 * the DSI-PHY must be 16x the MIPI-DSI HS clock.
+	 *
+	 * pllclk / 2 = vclk * DSI divider
+	 * pllclk = vclk * DSI divider * 2
+	 *
+	 * hsclk = (vclk * DSI divider * 2) / 16
+	 *
+	 * vclk * bpp = hsclk * 8 * num_lanes
+	 * vclk * bpp = ((vclk * DSI divider * 2) / 16) * 8 * num_lanes
+	 *   which simplifies to...
+	 * DSI divider = bpp / num_lanes
+	 */
+	rzg2l_cpg_dsi_div_set_divider(mipi_dsi_pixel_format_to_bpp(dsi->format) / dsi->lanes, 1);
+
 	return 0;
 }
 
-- 
2.50.1

