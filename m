Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3B2C38308
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 23:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8F510E0F7;
	Wed,  5 Nov 2025 22:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 905E510E7B4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 22:26:24 +0000 (UTC)
X-CSE-ConnectionGUID: YotHcVSZTOSLNRnztNE8eg==
X-CSE-MsgGUID: 5UwqfQe+RzaHm33tQpAaHQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 06 Nov 2025 07:26:23 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 29E94409FB89;
 Thu,  6 Nov 2025 07:26:13 +0900 (JST)
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
Subject: [PATCH v4 2/2] drm: renesas: rz-du: Set DSI divider based on target
 MIPI device
Date: Wed,  5 Nov 2025 17:25:30 -0500
Message-ID: <20251105222530.979537-3-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251105222530.979537-1-chris.brandt@renesas.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
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
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

---
v1->v2:
- Add spaces around '/' in comments
- Add target argument in new API

v2->v3:
- Add missing period in comment (Hugo)
- Changed '1' to 'PLL5_TARGET_DSI' (Hugo)
- Added Reviewed-by and Tested-by (Biju)

v3->v4:
- Fixed up the comments
- Fixed the match for the divider to set (was missing a * 2)
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 3b52dfc0ea1e..301550f0ea9f 100644
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
+	 * Report the required division ratio setting for the MIPI clock dividers.
+	 *
+	 * VCO-->[POSTDIV1,2]--FOUTPOSTDIV-->|   |-->[1/(DSI DIV A * B)]--> MIPI_DSI_VCLK
+	 *            |                      |-->|
+	 *            |-->[1/2]---FOUT1PH0-->|   |-->[1/16]---------------> hsclk (MIPI-PHY)
+	 *
+	 * vclk * bpp = hsclk * 8 * num_lanes
+	 *
+	 * vclk * DSI_AB_divider = hsclk * 16
+	 *
+	 *   which simplifies to...
+	 * DSI_AB_divider = bpp * 2 / num_lanes
+	 */
+	rzg2l_cpg_dsi_div_set_divider(mipi_dsi_pixel_format_to_bpp(dsi->format) * 2 / dsi->lanes,
+				      PLL5_TARGET_DSI);
+
 	return 0;
 }
 
-- 
2.50.1

