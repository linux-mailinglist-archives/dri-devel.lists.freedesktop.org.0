Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B879A9C59
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 10:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2754F10E611;
	Tue, 22 Oct 2024 08:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4BF6910E60D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 08:25:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.11,222,1725289200"; d="scan'208";a="222639851"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 22 Oct 2024 17:25:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.236])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id EB336400754D;
 Tue, 22 Oct 2024 17:24:44 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 2/2] drm: renesas: rz-du: rzg2l_du_encoder: Fix max dot
 clock for DPI
Date: Tue, 22 Oct 2024 09:24:24 +0100
Message-ID: <20241022082433.32513-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022082433.32513-1-biju.das.jz@bp.renesas.com>
References: <20241022082433.32513-1-biju.das.jz@bp.renesas.com>
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

As per the RZ/G2UL hardware manual Table 33.4 Clock List, the maximum
dot clock for the DPI interface is 83.5 MHz. Add mode_valid callback
to reject modes greater than 83.5 MHz.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v2:
 * Moved .mode_valid from crtc to encoder as the new state is not
   available in crtc and instead, we could check renc->output for
   .mode_valid() function of drm_encoder.
 * Dropped rzg2l_du_crtc_atomic_check().
---
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index 339cbaaea0b5..564ab4cb3d37 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -10,6 +10,7 @@
 #include <linux/export.h>
 #include <linux/of.h>
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_panel.h>
@@ -24,6 +25,22 @@
 static const struct drm_encoder_funcs rzg2l_du_encoder_funcs = {
 };
 
+static enum drm_mode_status
+rzg2l_du_encoder_mode_valid(struct drm_encoder *encoder,
+			    const struct drm_display_mode *mode)
+{
+	struct rzg2l_du_encoder *renc = to_rzg2l_encoder(encoder);
+
+	if (renc->output == RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83500)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static const struct drm_encoder_helper_funcs rzg2l_du_encoder_helper_funcs = {
+	.mode_valid = rzg2l_du_encoder_mode_valid,
+};
+
 int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 			  enum rzg2l_du_output output,
 			  struct device_node *enc_node)
@@ -48,6 +65,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 		return PTR_ERR(renc);
 
 	renc->output = output;
+	drm_encoder_helper_add(&renc->base, &rzg2l_du_encoder_helper_funcs);
 
 	/* Attach the bridge to the encoder. */
 	ret = drm_bridge_attach(&renc->base, bridge, NULL,
-- 
2.43.0

