Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1E4995A3A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 00:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0788110E26A;
	Tue,  8 Oct 2024 22:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="Ho8P2zPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F0810E287
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 22:39:01 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5175688F4B;
 Wed,  9 Oct 2024 00:38:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728427139;
 bh=KJKH/WpYHcVDKhYFQkulqQ+jQNo550/ZRk57bNzhqsQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ho8P2zPGsvkWVTq6nno9yUYUNYZAeiKD0pHx3LTu8uLRqwux4wXbpbpuOsVT76RmB
 cgrXrgUgyHGXgbtR0HTE/BuE1osAo12f883QukUgk8HMPk5+CnZq9gKKTa8xRPpRDy
 aInZNMB0dcY06lGFF2xQsqjbf+nLskckktP9uBvvuefOO5Z5GAYGV/y+CnSSExcZ7Q
 IBRy/veAZ2/SRtNpodtdqsJoFPegju8NyeUve0ixY/Jfw6FqUT9E8P9ZeXLkQp3WYI
 AVtBX3chfvi5SX6zDorSDh5VbsjewK7Tnyxcejj2xfFb3gqSSseCdWVgWMm/JmEvtU
 mBB2Ikbv8Pk+Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Abel Vesa <abelvesa@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH 2/2] drm: bridge: ldb: Configure LDB clock in .mode_set
Date: Wed,  9 Oct 2024 00:38:20 +0200
Message-ID: <20241008223846.337162-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241008223846.337162-1-marex@denx.de>
References: <20241008223846.337162-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

The LDB serializer clock operate at either x7 or x14 rate of the input
LCDIFv3 scanout engine clock. Make sure the serializer clock and their
upstream Video PLL are configured early in .mode_set to the x7 or x14
rate of pixel clock, before LCDIFv3 .atomic_enable is called which would
configure the Video PLL to low x1 rate, which is unusable.

With this patch in place, the clock tree is correctly configured. The
example below is for a 71.1 MHz pixel clock panel, the LDB serializer
clock is then 497.7 MHz:

video_pll1_ref_sel                      1 1 0  24000000 0 0 50000
   video_pll1                           1 1 0 497700000 0 0 50000
      video_pll1_bypass                 1 1 0 497700000 0 0 50000
         video_pll1_out                 2 2 0 497700000 0 0 50000
            media_ldb                   1 1 0 497700000 0 0 50000
               media_ldb_root_clk       1 1 0 497700000 0 0 50000
            media_disp2_pix             1 1 0  71100000 0 0 50000
               media_disp2_pix_root_clk 1 1 0  71100000 0 0 50000

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 0e4bac7dd04ff..a3a31467fcc85 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -278,6 +278,16 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
+static void fsl_ldb_mode_set(struct drm_bridge *bridge,
+			       const struct drm_display_mode *mode,
+			       const struct drm_display_mode *adj)
+{
+	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
+	unsigned long requested_link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
+
+	clk_set_rate(fsl_ldb->clk, requested_link_freq);
+}
+
 static const struct drm_bridge_funcs funcs = {
 	.attach = fsl_ldb_attach,
 	.atomic_enable = fsl_ldb_atomic_enable,
@@ -287,6 +297,7 @@ static const struct drm_bridge_funcs funcs = {
 	.atomic_get_input_bus_fmts = fsl_ldb_atomic_get_input_bus_fmts,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.mode_valid = fsl_ldb_mode_valid,
+	.mode_set = fsl_ldb_mode_set,
 };
 
 static int fsl_ldb_probe(struct platform_device *pdev)
-- 
2.45.2

