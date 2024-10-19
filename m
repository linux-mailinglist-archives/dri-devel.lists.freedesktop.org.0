Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4592C9A50A0
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 22:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39B410E3B1;
	Sat, 19 Oct 2024 20:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="FUzQFxHB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5436410E3B6
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 20:00:03 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1729367685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3HJygdyJ066Xs3apcFHC5i1N9FuSeNHbO8RlThkAytM=;
 b=FUzQFxHBL9otUEIDyVWpeNdRZFDmEjJL8ODtFmDiEfVFL2kKA5Yxnlb0xcorYHi3VZtuWj
 aD18WdPkL+Rpxb9VYkfC1z6/MZObNM2QpVdzVU9BFQaPDzMqMNlnYgFvQ7B+eOnstBIZ2q
 raoLeW3Qp2rUlBtOtaQH8KseJwmfR9o=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v5 03/13] drm/bridge: cdns-dsi: Fix Phy _init() and _exit()
Date: Sun, 20 Oct 2024 01:24:01 +0530
Message-Id: <20241019195411.266860-4-aradhya.bhatia@linux.dev>
In-Reply-To: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
References: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

Initialize the Phy during the cdns-dsi _resume(), and de-initialize it
during the _suspend().

Also power-off the Phy from bridge_disable.

Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 5159c3f0853e..d89c32bae2b9 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -672,6 +672,10 @@ static void cdns_dsi_bridge_disable(struct drm_bridge *bridge)
 	if (dsi->platform_ops && dsi->platform_ops->disable)
 		dsi->platform_ops->disable(dsi);
 
+	phy_power_off(dsi->dphy);
+	dsi->link_initialized = false;
+	dsi->phy_initialized = false;
+
 	pm_runtime_put(dsi->base.dev);
 }
 
@@ -698,7 +702,6 @@ static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
 	       DPHY_CMN_PDN | DPHY_PLL_PDN,
 	       dsi->regs + MCTL_DPHY_CFG0);
 
-	phy_init(dsi->dphy);
 	phy_set_mode(dsi->dphy, PHY_MODE_MIPI_DPHY);
 	phy_configure(dsi->dphy, &output->phy_opts);
 	phy_power_on(dsi->dphy);
@@ -1120,6 +1123,8 @@ static int __maybe_unused cdns_dsi_resume(struct device *dev)
 	clk_prepare_enable(dsi->dsi_p_clk);
 	clk_prepare_enable(dsi->dsi_sys_clk);
 
+	phy_init(dsi->dphy);
+
 	return 0;
 }
 
@@ -1127,10 +1132,11 @@ static int __maybe_unused cdns_dsi_suspend(struct device *dev)
 {
 	struct cdns_dsi *dsi = dev_get_drvdata(dev);
 
+	phy_exit(dsi->dphy);
+
 	clk_disable_unprepare(dsi->dsi_sys_clk);
 	clk_disable_unprepare(dsi->dsi_p_clk);
 	reset_control_assert(dsi->dsi_p_rst);
-	dsi->link_initialized = false;
 	return 0;
 }
 
-- 
2.34.1

