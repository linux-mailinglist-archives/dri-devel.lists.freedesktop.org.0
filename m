Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DFDB3F895
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A62B10E613;
	Tue,  2 Sep 2025 08:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NPbTkk3B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D638D10E605
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:34:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BDB5140955;
 Tue,  2 Sep 2025 08:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB54C4CEED;
 Tue,  2 Sep 2025 08:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802053;
 bh=8MPmTxUTV3g1rzAZxNPkLlwzM2lhv8IEy3sLqM4qcjM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NPbTkk3BdqK9YFrNnktddrvvZYhOIcwi7pmv6ifLQt/TsekHBob3GXp7dUT3sCxQj
 eoAiD1gfGnwueKMtFMkSMPUI8SLukB5BjVx4vBFqDF4fK2x/GXBo2WtSypKYOsNR+I
 ErqiQdYbCsijVZKkAi97pq8yBXHcOlwEHcWZY//gVl96jBKGLEiOJWomzMi5J8LH4F
 U3qhUp9vmFO7kYlJzWZo8pP3OXOsot2jTO8Hy+xm1cYMqR+smsKuGqIM6m/Lvquudo
 SXEDVA/qhEa5RwqxPesZU0EDFCjfjwCOqEDhZgp28YNE4GKPeagUW8ste7CG2/ignV
 LG3GzTNsx+Irw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:52 +0200
Subject: [PATCH 24/29] drm/tidss: dispc: Improve mode checking logs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-24-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4279; i=mripard@kernel.org;
 h=from:subject:message-id; bh=8MPmTxUTV3g1rzAZxNPkLlwzM2lhv8IEy3sLqM4qcjM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVu9vFH0+3zxEZtvCBUJvQ84lz/kWK3Rd3mRfN/fsW
 JvE7++mdUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJtD1mbDj7vmd++jkeh5TV
 7z45hW3Sf3rjgItJfG54XV5uUOPNDyE9+/IO/blXVRGwb3fKLumEmYwNb0UCm+2D+OMnZzHrGRV
 uuXFx7qact3EHN7PJ1366xbkk4nkHj1b7/amyjnt04t66pAgDAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The dispc_vp_mode_valid() function checks whether a mode can be handled
by the display controller.

There's a whole bunch of criteria, and it's not clear when a rejection
happens why it did. Let's add a bunch of logs on error to make it
clearer.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 47 +++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 32248b5f71b7566dc33d7a7db0efb26d3a9ed1c3..ef948e3041e10bc65cf2c4794a4e4cffa7e3fb3a 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1349,47 +1349,63 @@ static void dispc_vp_set_default_color(struct dispc_device *dispc,
 
 enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
 					 u32 hw_videoport,
 					 const struct drm_display_mode *mode)
 {
+	struct tidss_device *tidss = dispc->tidss;
+	struct drm_device *dev = &tidss->ddev;
 	u32 hsw, hfp, hbp, vsw, vfp, vbp;
 	enum dispc_vp_bus_type bus_type;
 	int max_pclk;
 
 	bus_type = dispc->feat->vp_bus_type[hw_videoport];
 
 	max_pclk = dispc->feat->max_pclk_khz[bus_type];
 
-	if (WARN_ON(max_pclk == 0))
+	if (WARN_ON(max_pclk == 0)) {
+		drm_dbg(dev, "Invalid maximum pixel clock");
 		return MODE_BAD;
+	}
 
-	if (mode->clock < dispc->feat->min_pclk_khz)
+	if (mode->clock < dispc->feat->min_pclk_khz) {
+		drm_dbg(dev, "Mode pixel clock below hardware minimum pixel clock");
 		return MODE_CLOCK_LOW;
+	}
 
-	if (mode->clock > max_pclk)
+	if (mode->clock > max_pclk) {
+		drm_dbg(dev, "Mode pixel clock above hardware maximum pixel clock");
 		return MODE_CLOCK_HIGH;
+	}
 
-	if (mode->hdisplay > 4096)
+	if (mode->hdisplay > 4096) {
+		drm_dbg(dev, "Number of active horizontal pixels above hardware limits.");
 		return MODE_BAD;
+	}
 
-	if (mode->vdisplay > 4096)
+	if (mode->vdisplay > 4096) {
+		drm_dbg(dev, "Number of active vertical lines above hardware limits.");
 		return MODE_BAD;
+	}
 
 	/* TODO: add interlace support */
-	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
+		drm_dbg(dev, "Interlace modes not suppported.");
 		return MODE_NO_INTERLACE;
+	}
 
 	/*
 	 * Enforce the output width is divisible by 2. Actually this
 	 * is only needed in following cases:
 	 * - YUV output selected (BT656, BT1120)
 	 * - Dithering enabled
 	 * - TDM with TDMCycleFormat == 3
 	 * But for simplicity we enforce that always.
 	 */
-	if ((mode->hdisplay % 2) != 0)
+	if ((mode->hdisplay % 2) != 0) {
+		drm_dbg(dev, "Number of active horizontal pixels must be even.");
 		return MODE_BAD_HVALUE;
+	}
 
 	hfp = mode->hsync_start - mode->hdisplay;
 	hsw = mode->hsync_end - mode->hsync_start;
 	hbp = mode->htotal - mode->hsync_end;
 
@@ -1397,29 +1413,40 @@ enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
 	vsw = mode->vsync_end - mode->vsync_start;
 	vbp = mode->vtotal - mode->vsync_end;
 
 	if (hsw < 1 || hsw > 256 ||
 	    hfp < 1 || hfp > 4096 ||
-	    hbp < 1 || hbp > 4096)
+	    hbp < 1 || hbp > 4096) {
+		drm_dbg(dev,
+			"Horizontal blanking or sync outside of hardware limits (fp: %u, sw: %u, bp: %u).",
+			hfp, hsw, hbp);
 		return MODE_BAD_HVALUE;
+	}
 
 	if (vsw < 1 || vsw > 256 ||
-	    vfp > 4095 || vbp > 4095)
+	    vfp > 4095 || vbp > 4095) {
+		drm_dbg(dev,
+			"Vertical blanking or sync outside of hardware limits (fp: %u, sw: %u, bp: %u).",
+			vfp, vsw, vbp);
 		return MODE_BAD_VVALUE;
+	}
 
 	if (dispc->memory_bandwidth_limit) {
 		const unsigned int bpp = 4;
 		u64 bandwidth;
 
 		bandwidth = 1000 * mode->clock;
 		bandwidth = bandwidth * mode->hdisplay * mode->vdisplay * bpp;
 		bandwidth = div_u64(bandwidth, mode->htotal * mode->vtotal);
 
-		if (dispc->memory_bandwidth_limit < bandwidth)
+		if (dispc->memory_bandwidth_limit < bandwidth) {
+			drm_dbg(dev, "Required memory bandwidth outside of hardware limits.");
 			return MODE_BAD;
+		}
 	}
 
+	drm_dbg(dev, "Mode is valid.");
 	return MODE_OK;
 }
 
 int dispc_vp_enable_clk(struct dispc_device *dispc, u32 hw_videoport)
 {

-- 
2.50.1

