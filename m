Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68435917B47
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 10:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2144B10E7CD;
	Wed, 26 Jun 2024 08:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ECA10E7CD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 08:48:27 +0000 (UTC)
Received: from i53875b6a.versanet.de ([83.135.91.106] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sMOJf-0000RH-21; Wed, 26 Jun 2024 10:47:47 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, victor.liu@nxp.com,
 quentin.schulz@cherry.de, heiko@sntech.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH RESEND] drm: bridge: dw-mipi-dsi: Allow sync-pulses to
 override the burst vid-mode
Date: Wed, 26 Jun 2024 10:47:22 +0200
Message-Id: <20240626084722.832763-1-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The state right now is that if the panel has the burst-mode flag it
will take precedence over the sync-pulses mode.

While sync-pulses are only relevant for the video-mode, the burst-mode
flag affects both the video-mode as well as the calculated lane_mbps.

Looking at drivers like the nwl-dsi [0] it only enables burst mode when
the panel's flags do not contain the sync_pulse flag.

So handle things similar for dw-dsi in that it selects the video-mode
with sync-pulses if that flag is set and only after that, checks for
the burst-mode. So panels selecting a combination of both burst and
sync-pulses get the sync-pulse mode.

The case this fixes can be found on the ltk050h3148w . It does need the
lane-rate to be calculated according to burst formulas [1], but without
sync-pulses we see the output shifted around 20 pixels to the right,
meaning that the last 20 pixels from each line appear at the start of
the next display line.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/bridge/nwl-dsi.c#n301
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6c9dbee84cd005bed5f9d07b3a2797ae6414b435

Fixes: 93e82bb4de01 ("drm/bridge: synopsys: dw-mipi-dsi: Fix hcomponent lbcc for burst mode")
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
resend, because I messed up and somehow forgot to include _all_
mailing lists.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 824fb3c65742e..28dd858a751bd 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -605,10 +605,10 @@ static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
 	 */
 	val = ENABLE_LOW_POWER;
 
-	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
-		val |= VID_MODE_TYPE_BURST;
-	else if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
 		val |= VID_MODE_TYPE_NON_BURST_SYNC_PULSES;
+	else if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
+		val |= VID_MODE_TYPE_BURST;
 	else
 		val |= VID_MODE_TYPE_NON_BURST_SYNC_EVENTS;
 
-- 
2.39.2

