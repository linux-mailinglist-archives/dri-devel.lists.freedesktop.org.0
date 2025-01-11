Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDFCA0A59A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 20:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170F410E218;
	Sat, 11 Jan 2025 19:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="VTIqkDQX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BEB10E218
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2025 19:28:02 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736623681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NRAlMFaOYUM3PL1/bODAdBoL/WvDYph2ZNsIdv2WJ+o=;
 b=VTIqkDQXmb1Td6f6HNj7KdUgblP704E06RTsdmpr568SQZiOctBy6sRFL/uNMeEsFzosL+
 qR+4euTvMfk4MsYwbFC3UNoUTW/5brCvn8fiwcO1HWOpJpNU9dq7Ny3jXO6bybpYyn29ah
 ZvAnHrYH333bNc6a1ayXxdK5yarlGIk=
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v6 03/12] drm/bridge: cdns-dsi: Fix phy de-init and flag it so
Date: Sun, 12 Jan 2025 00:57:29 +0530
Message-Id: <20250111192738.308889-4-aradhya.bhatia@linux.dev>
In-Reply-To: <20250111192738.308889-1-aradhya.bhatia@linux.dev>
References: <20250111192738.308889-1-aradhya.bhatia@linux.dev>
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

The driver code doesn't have a de-initialization path as yet, and so it
does not clear the phy_initialized flag while suspending. This is a
problem because after resume the driver looks at this flag to determine
if a Phy re-initialization is required or not. It is in fact required
because the hardware is resuming from a suspend, but the driver does not
carry out any re-initialization causing the D-Phy to not work at all.

Add the counterpart of phy_power_on(), that is phy_power_off() from the
_bridge_disable() and clear the flags so that the Phy can be initialized
again when required.

Move the Phy initialization from _bridge_enable() to _resume(), and
de-initialize during the _suspend() - so that the phy_{init, exit}()
take place once every resume/suspend cycle.

The order of calls still remains the same. phy_init() needs to be called
before phy_power_on() - which happens still. What this patch changes is
the frequency of the phy_init() call. Instead of it being called once
every bridge enable/disable cycle, it is now being called once every
resume/suspend cycle. This move has been considered safe after numerous
tests with the hardware.

Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 056583e81155..47550891427c 100644
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

