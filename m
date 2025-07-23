Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CC3B0EF3E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 12:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB0310E78C;
	Wed, 23 Jul 2025 10:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KZRPq9ft";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D8010E78B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:05:53 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBFAA157F;
 Wed, 23 Jul 2025 12:05:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1753265114;
 bh=7lmhdHLGtnxLHPbRqWTXPm7itvpD72rVUURBCngSQhA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=KZRPq9ft738dHaAIypRBzyhHDSysMwRpdQvVBQ5J+NRDP9MCyIiDhoZKENJrDla7+
 isnFXLXxDK8BZOsyjfvPWrentzgEzVyz0bc/yFUc6J/wV50+0fBe8vyRAOaNB9Ccuj
 7DkmKLqT4k41hIp4JzPqXqRslb4Rzd8DcbHH0GMo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 23 Jul 2025 13:05:18 +0300
Subject: [PATCH v5 12/15] drm/bridge: cdns-dsi: Use video mode and clean up
 cdns_dsi_mode2cfg()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-cdns-dsi-impro-v5-12-e61cc06074c2@ideasonboard.com>
References: <20250723-cdns-dsi-impro-v5-0-e61cc06074c2@ideasonboard.com>
In-Reply-To: <20250723-cdns-dsi-impro-v5-0-e61cc06074c2@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Parth Pancholi <parth.pancholi@toradex.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4557;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=7lmhdHLGtnxLHPbRqWTXPm7itvpD72rVUURBCngSQhA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBogLPtOIIi8tcw4ekhFpnzdFPrBI5KHOIdts8Yd
 ykIGxhsce6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaICz7QAKCRD6PaqMvJYe
 9T9ED/99wGaPJcacn7ug9Y+uFeFiaIT7CgHKndCC9thdQ7yscbcdYQxZV7g6Oiv5HgPEsH9Zjkt
 XjNjm0uLciijmPOWwf5RI1VLQjCy6xySCd7ilrQa0Iyb+rHI/As1Zrv/LbLwQhfoaEnCzopofa0
 GBPv/3KkWRb0t3opdfDSN8+i4CIUnKtOZ/7ElxWEIZmXqgG/WY999dEN6CCabYFs0m13rane8nv
 p/4XAGC+LwT0HC7FsGOEyY4jnb/ACio0OL8S43zHqwRojCf6qNTBGBme4fOd5D9NH+jg7iryRwO
 /Lqv/cHU5Lg1rLHh6CHZSv3w92ARINuDufsyh22Pdiie/Zean27kfAJDXysevys7ukdk1zcN4sG
 YER37pLD6Q2A4sZ8jPw2fQBPSvbHMJZzy+P8K/lbOVg9a0SkT24lzATJbTd6Vnih5Is65QeGU37
 pO4OC+Er4wmjR2NK7puWIM0ApLQy8U3DnntZMt//TAbvbCGvpikDoTQT+dTIhvgIz3+wFF48B4z
 tPzUZV/qiCCdcASFyHECdfq0dRSqqjoC30ArlRuQTcSHo/2BC2f6OngkSmA1NjAMmERusRNqWsW
 AxWYturCSpneGDIu6Zd7qNqRfAgSgImRbtZFTm7x/5vKY1y45TcsaZy9YZTNEiA66xVvFyrNkUq
 EFtNHVwp2rFen1w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

The driver does all the calculations and programming with video timings
(hftp, hbp, etc.) instead of the modeline values (hsync_start, ...).
Thus it makes sense to use struct videomode instead of struct
drm_display_mode internally.

Switch to videomode and do some cleanups in cdns_dsi_mode2cfg() along
the way.

Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Tested-by: Jayesh Choudhary <j-choudhary@ti.com>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 45 ++++++++++++++------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 6bc0a0d00d69..07f8d5f5c2aa 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -9,6 +9,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_probe_helper.h>
 #include <video/mipi_display.h>
+#include <video/videomode.h>
 
 #include <linux/clk.h>
 #include <linux/interrupt.h>
@@ -467,36 +468,35 @@ static unsigned int dpi_to_dsi_timing(unsigned int dpi_timing,
 }
 
 static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
-			     const struct drm_display_mode *mode,
+			     const struct videomode *vm,
 			     struct cdns_dsi_cfg *dsi_cfg)
 {
 	struct cdns_dsi_output *output = &dsi->output;
-	unsigned int tmp;
-	bool sync_pulse = false;
+	u32 dpi_hsa, dpi_hbp, dpi_hfp, dpi_hact;
+	bool sync_pulse;
 	int bpp;
 
+	dpi_hsa = vm->hsync_len;
+	dpi_hbp = vm->hback_porch;
+	dpi_hfp = vm->hfront_porch;
+	dpi_hact = vm->hactive;
+
 	memset(dsi_cfg, 0, sizeof(*dsi_cfg));
 
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
-		sync_pulse = true;
+	sync_pulse = output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
 
 	bpp = mipi_dsi_pixel_format_to_bpp(output->dev->format);
 
-	tmp = mode->htotal -
-		(sync_pulse ? mode->hsync_end : mode->hsync_start);
+	dsi_cfg->hbp = dpi_to_dsi_timing(dpi_hbp + (sync_pulse ? 0 : dpi_hsa),
+					 bpp, DSI_HBP_FRAME_OVERHEAD);
 
-	dsi_cfg->hbp = dpi_to_dsi_timing(tmp, bpp, DSI_HBP_FRAME_OVERHEAD);
+	if (sync_pulse)
+		dsi_cfg->hsa =
+			dpi_to_dsi_timing(dpi_hsa, bpp, DSI_HSA_FRAME_OVERHEAD);
 
-	if (sync_pulse) {
-		tmp = mode->hsync_end - mode->hsync_start;
+	dsi_cfg->hact = dpi_to_dsi_timing(dpi_hact, bpp, 0);
 
-		dsi_cfg->hsa = dpi_to_dsi_timing(tmp, bpp,
-						 DSI_HSA_FRAME_OVERHEAD);
-	}
-
-	dsi_cfg->hact = dpi_to_dsi_timing(mode->hdisplay, bpp, 0);
-	dsi_cfg->hfp = dpi_to_dsi_timing(mode->hsync_start - mode->hdisplay,
-					 bpp, DSI_HFP_FRAME_OVERHEAD);
+	dsi_cfg->hfp = dpi_to_dsi_timing(dpi_hfp, bpp, DSI_HFP_FRAME_OVERHEAD);
 
 	dsi_cfg->htotal = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
 	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
@@ -509,7 +509,7 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 }
 
 static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
-			       const struct drm_display_mode *mode,
+			       const struct videomode *vm,
 			       struct cdns_dsi_cfg *dsi_cfg)
 {
 	struct cdns_dsi_output *output = &dsi->output;
@@ -517,11 +517,11 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 	unsigned int nlanes = output->dev->lanes;
 	int ret;
 
-	ret = cdns_dsi_mode2cfg(dsi, mode, dsi_cfg);
+	ret = cdns_dsi_mode2cfg(dsi, vm, dsi_cfg);
 	if (ret)
 		return ret;
 
-	ret = phy_mipi_dphy_get_default_config(mode->clock * 1000,
+	ret = phy_mipi_dphy_get_default_config(vm->pixelclock,
 					       mipi_dsi_pixel_format_to_bpp(output->dev->format),
 					       nlanes, phy_cfg);
 	if (ret)
@@ -916,12 +916,15 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
 	struct cdns_dsi_bridge_state *dsi_state = to_cdns_dsi_bridge_state(bridge_state);
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 	struct cdns_dsi_cfg *dsi_cfg = &dsi_state->dsi_cfg;
+	struct videomode vm;
 
 	/* cdns-dsi requires negative syncs */
 	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 	adjusted_mode->flags |= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC;
 
-	return cdns_dsi_check_conf(dsi, adjusted_mode, dsi_cfg);
+	drm_display_mode_to_videomode(adjusted_mode, &vm);
+
+	return cdns_dsi_check_conf(dsi, &vm, dsi_cfg);
 }
 
 static struct drm_bridge_state *

-- 
2.43.0

