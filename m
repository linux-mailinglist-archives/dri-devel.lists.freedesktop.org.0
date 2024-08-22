Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A49E95BBC8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 18:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D69E10EB65;
	Thu, 22 Aug 2024 16:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id E42C110EB65
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 16:23:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.10,167,1719846000"; d="scan'208";a="216311618"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 23 Aug 2024 01:23:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.15])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2930D4007CF2;
 Fri, 23 Aug 2024 01:23:33 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 2/4] drm: renesas: rz-du: Add RZ/G2UL DU Support
Date: Thu, 22 Aug 2024 17:23:15 +0100
Message-ID: <20240822162320.5084-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
References: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
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

The LCD controller is composed of Frame Compression Processor (FCPVD),
Video Signal Processor (VSPD), and Display Unit (DU).

It has DPI interface and supports a maximum resolution of WXGA along
with 2 RPFs to support the blending of two picture layers and raster
operations (ROPs).

The DU module is connected to VSPD. Add RZ/G2UL DU support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Used "&" instead of "==" in rzg2l_du_start_stop() for scalability.
 * Restored port variable in struct rzg2l_du_output_routing
 * Updated rzg2l_du_encoders_init() to handle port based on hardware indices.
v2->v3:
 * Avoided the line break in rzg2l_du_start_stop() for rstate.
 * Replaced port->du_output in  struct rzg2l_du_output_routing and
   dropped using the port number to indicate the output type in
   rzg2l_du_encoders_init().
 * Updated rzg2l_du_r9a07g043u_info and rzg2l_du_r9a07g044_info
v1->v2:
 * No change.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  8 +++++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 11 +++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |  3 ++-
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 6e7aac6219be..c4c1474d487e 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -28,6 +28,7 @@
 #include "rzg2l_du_vsp.h"
 
 #define DU_MCR0			0x00
+#define DU_MCR0_DPI_OE		BIT(0)
 #define DU_MCR0_DI_EN		BIT(8)
 
 #define DU_DITR0		0x10
@@ -216,9 +217,14 @@ static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *rcrtc)
 
 static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool start)
 {
+	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(rcrtc->crtc.state);
 	struct rzg2l_du_device *rcdu = rcrtc->dev;
+	u32 val = DU_MCR0_DI_EN;
 
-	writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
+	if (rstate->outputs & BIT(RZG2L_DU_OUTPUT_DPAD0))
+		val |= DU_MCR0_DPI_OE;
+
+	writel(start ? val : 0, rcdu->mmio + DU_MCR0);
 }
 
 static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index e5eca8691a33..bc7c381f92ac 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -25,6 +25,16 @@
  * Device Information
  */
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a07g043u_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+	},
+};
+
 static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	.channels_mask = BIT(0),
 	.routes = {
@@ -40,6 +50,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 };
 
 static const struct of_device_id rzg2l_du_of_table[] = {
+	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
 	{ /* sentinel */ }
 };
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index 07b312b6f81e..b99217b4e05d 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -183,7 +183,8 @@ static int rzg2l_du_encoders_init(struct rzg2l_du_device *rcdu)
 
 		/* Find the output route corresponding to the port number. */
 		for (i = 0; i < RZG2L_DU_OUTPUT_MAX; ++i) {
-			if (rcdu->info->routes[i].port == ep.port) {
+			if (rcdu->info->routes[i].possible_outputs &&
+			    rcdu->info->routes[i].port == ep.port) {
 				output = i;
 				break;
 			}
-- 
2.43.0

