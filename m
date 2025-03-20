Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCC6A6AA9C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 17:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD2810E667;
	Thu, 20 Mar 2025 16:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vblrh3lv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F9910E65F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 16:00:39 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 219DA16B0;
 Thu, 20 Mar 2025 16:58:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742486335;
 bh=S8uUUDEaNeicbiSY8YvRq9DMlAGVbKYKCtdKJ0sZaN8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Vblrh3lv/gvKlFX8Tj1anOjHa7GGzN8wgMpOUTM6KzVpqkDhYwJITQJ2vBBfVEX+T
 6AzEO+pbdCwvqViN/QPePI5ovUhqDA0hAucKgTVGzspMOmZV17J16VUy4vqjOXGJVc
 KeTYHXZi9AgS/5jqKVuURE0tkCjc9MuZm0ikLLB4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 20 Mar 2025 18:00:02 +0200
Subject: [PATCH 07/18] drm/bridge: cdns-dsi: Fail if HS rate changed when
 validating PHY config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-cdns-dsi-impro-v1-7-725277c5f43b@ideasonboard.com>
References: <20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com>
In-Reply-To: <20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2073;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=S8uUUDEaNeicbiSY8YvRq9DMlAGVbKYKCtdKJ0sZaN8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn3DuYTGxHpRYvxdJmIKBq59EYfeyz8armZDSFi
 WgtOKxa5tGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ9w7mAAKCRD6PaqMvJYe
 9cAbD/0XJR/OzJMyCY80P6J7hAe42b9HW4uuiKI7qYtZ9Maz55A44nYyMnkfX/NuoauiFXg6DVw
 fFZCvsiaGt7pGWu1JP5nvWExjakOXoAbLY+HW5Jyfo6IAnUtsCmu5noBhbTwXA43kSDjJqS/tkc
 kjL5Osb8zO8vdUmXRs6jboqkXPVk4syhubYG/kjT+cPckA7LdWmdqeA1ilIwSq6OLTFHA8oJ2Zq
 LTM5wyvCBkRBLr2HiW4/cCDqy12klZebxH/9H6VZtv2fxeTDX8Zvnbym8DbdpdiYAIIUv0aqWF2
 Z2MrISss38HMR8Jk0Z8k5ZpOcudEYJlLpNWnhWz8Zz/xTyCt55MdwcXB0KJG0HxZpcYfwJ6spSD
 IognHnqdJz7vxjT0Dfpt99TbLICda4kGCGjoW4Yy7dw4lMvQuaYVeq8n21TiI8lrLAVJgilL65O
 o7R3XgQ1suo7xiVUR+QGEy4jLPhg0Iq7IAuOzjwFcZ0/ExfthPvdITtlhjPeJLPD6bgzuQjx9+s
 gvwzjRxXyxqVCChJDB8JpoYK51axDXMqR0eXgi2K056tqn+Ly47RPo9GVbMAXmlTEpKB0n+S1nH
 fx5cjldz4+JiKCsdjOKm4G8+w9w4WXVMSNiZ4436X0ZYUjQ5c9K6OKUIWx5DsRXyWXp0HjhMNH1
 uMgWWs/aiwRzywQ==
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

The phy_validate() can change the HS clock rate we passed to it in the
PHY config, depending on what the HW can actually do. The driver just
ignores this at the moment, but if the actual HS clock rate is different
than the requested one, the pipeline will fail as all the DSI timing
calculations will be incorrect.

There are ways to improve DSI operation for various clock rates, but for
now, just add a check to see if the rate changed, and return an error if
that happens.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 53322407c1b0..9238acf69823 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -580,6 +580,7 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 	unsigned long dsi_hss_hsa_hse_hbp;
 	unsigned int nlanes = output->dev->lanes;
 	int mode_clock = (mode_valid_check ? mode->clock : mode->crtc_clock);
+	unsigned long req_hs_clk_rate;
 	int ret;
 
 	ret = cdns_dsi_mode2cfg(dsi, mode, dsi_cfg, mode_valid_check);
@@ -596,10 +597,20 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 	if (ret)
 		return ret;
 
+	req_hs_clk_rate = output->phy_opts.mipi_dphy.hs_clk_rate;
 	ret = phy_validate(dsi->dphy, PHY_MODE_MIPI_DPHY, 0, &output->phy_opts);
 	if (ret)
 		return ret;
 
+	if (req_hs_clk_rate != output->phy_opts.mipi_dphy.hs_clk_rate) {
+		dev_err(&dsi->dphy->dev,
+			"validation changed hs_clk_rate from %lu to %lu, diff %lu\n",
+			req_hs_clk_rate, output->phy_opts.mipi_dphy.hs_clk_rate,
+			output->phy_opts.mipi_dphy.hs_clk_rate -
+				req_hs_clk_rate);
+		return -EINVAL;
+	}
+
 	dsi_hss_hsa_hse_hbp = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
 	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
 		dsi_hss_hsa_hse_hbp += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;

-- 
2.43.0

