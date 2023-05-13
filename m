Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2CB701998
	for <lists+dri-devel@lfdr.de>; Sat, 13 May 2023 22:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D95C10E0D9;
	Sat, 13 May 2023 20:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8126210E0D9
 for <dri-devel@lists.freedesktop.org>; Sat, 13 May 2023 20:10:44 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5AD2584706;
 Sat, 13 May 2023 22:10:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684008640;
 bh=LWYanlX3itJXW6hyqQHiqlYzLY6Kebc2Edjqu5LOIhw=;
 h=From:To:Cc:Subject:Date:From;
 b=ysTRgE+4Dineu0vJUXHGljYglCrMt1ohX+cx6f5SFtJXlUXvetYXd3qn8cRVFRb6d
 PuiLvh3w2FXg8qnJdZchpSL/eEa/dJeKMbZJaLFXLD4iWr2gy6j1q6ohwKL/DIxDpw
 JVORb/aOXSWNd+zWauFNrN2f0ewAFiC/ZqRUNQacdYQRX9dbju1w/rPu1S4dwRN3/E
 M15HisyOBr0sWOexdLnU8Fd44O9ic7uiSl+b92wfBfDLGjEFAMx2G9+Mzi+NFvVOxh
 F0AM3+cmGc0PcqlDW/rl7itzt0yb/9zqjonYgJbavb2FcgoiOWy2LMD9dmtCT6673+
 6o4GQ47AfLH7A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: bridge: dw-mipi-dsi: Drop panel_bridge post_disable call
Date: Sat, 13 May 2023 22:10:30 +0200
Message-Id: <20230513201030.514861-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel_bridge post_disable callback is called from the bridge chain now,
so drop the explicit call here. This fixes call imbalance, where this driver
does not call ->pre_enable, but does call ->post_disable . In case either of
the two callbacks implemented in one of the panel or bridge drivers contains
any operation with refcounted object, like regulator, this would make kernel
complain about the imbalance.

This can be triggered e.g. with ST7701 driver, which operates on regulators
in its prepare/unprepare callbacks, which are called from pre_enable/post_disable
callbacks respectively. The former is called once, the later twice, during
entry to suspend.

Drop the post_disable call to fix the imbalance.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index b2efecf7d1603..63ac972547361 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -859,15 +859,6 @@ static void dw_mipi_dsi_bridge_post_atomic_disable(struct drm_bridge *bridge,
 	 */
 	dw_mipi_dsi_set_mode(dsi, 0);
 
-	/*
-	 * TODO Only way found to call panel-bridge post_disable &
-	 * panel unprepare before the dsi "final" disable...
-	 * This needs to be fixed in the drm_bridge framework and the API
-	 * needs to be updated to manage our own call chains...
-	 */
-	if (dsi->panel_bridge->funcs->post_disable)
-		dsi->panel_bridge->funcs->post_disable(dsi->panel_bridge);
-
 	if (phy_ops->power_off)
 		phy_ops->power_off(dsi->plat_data->priv_data);
 
-- 
2.39.2

