Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF700A10097
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 06:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE0110E867;
	Tue, 14 Jan 2025 05:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="IxmezzX4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D44A10E867
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 05:57:00 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736834218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UH2zGmcA5HXp21+So6ChmmD6SFUtGHmJj7f4jX4RLU4=;
 b=IxmezzX4XGWW0CG796RKhKRF/gOG2OVLgtc0CJK3NaKT6XdKqaRic0z8OAHmR9CyMUQrfQ
 JJ7YgoKdqYwdVS5D+wxTZ/dH/hDLv+LCbVsTd0QZ+fBFBeYOKHXuOZaIz04CdxMqC729km
 F2A6XjVynMQYknqUm30qdH5+P2ynDOc=
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
Subject: [PATCH v7 03/12] drm/bridge: cdns-dsi: Fix phy de-init and flag it so
Date: Tue, 14 Jan 2025 11:26:17 +0530
Message-Id: <20250114055626.18816-4-aradhya.bhatia@linux.dev>
In-Reply-To: <20250114055626.18816-1-aradhya.bhatia@linux.dev>
References: <20250114055626.18816-1-aradhya.bhatia@linux.dev>
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

The driver code doesn't have a Phy de-initialization path as yet, and so
it does not clear the phy_initialized flag while suspending. This is a
problem because after resume the driver looks at this flag to determine
if a Phy re-initialization is required or not. It is in fact required
because the hardware is resuming from a suspend, but the driver does not
carry out any re-initialization causing the D-Phy to not work at all.

Call the counterparts of phy_init() and phy_power_on(), that are
phy_exit() and phy_power_off(), from _bridge_disable(), and clear the
flags so that the Phy can be initialized again when required.

Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 056583e81155..039c5eb7fb66 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -672,6 +672,11 @@ static void cdns_dsi_bridge_disable(struct drm_bridge *bridge)
 	if (dsi->platform_ops && dsi->platform_ops->disable)
 		dsi->platform_ops->disable(dsi);
 
+	dsi->phy_initialized = false;
+	dsi->link_initialized = false;
+	phy_power_off(dsi->dphy);
+	phy_exit(dsi->dphy);
+
 	pm_runtime_put(dsi->base.dev);
 }
 
@@ -1130,7 +1135,6 @@ static int __maybe_unused cdns_dsi_suspend(struct device *dev)
 	clk_disable_unprepare(dsi->dsi_sys_clk);
 	clk_disable_unprepare(dsi->dsi_p_clk);
 	reset_control_assert(dsi->dsi_p_rst);
-	dsi->link_initialized = false;
 	return 0;
 }
 
-- 
2.34.1

