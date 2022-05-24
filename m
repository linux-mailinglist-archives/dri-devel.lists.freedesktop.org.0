Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2619532018
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 03:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9FC10E962;
	Tue, 24 May 2022 01:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6849310E8C3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 01:05:48 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2D07580107;
 Tue, 24 May 2022 03:05:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653354346;
 bh=BpRkOrlk0nBpcSihYLNUWpEopLsBmcJZN3zwWUsMBVs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gz3S86snpKqcMrdrPdLgdfFKx25I8b7rC3R0l69e6P5lAWElkDEh9MC1SU2cgjiUO
 qFtm8x672LOvyPaUZNxFrVt8WpJM7eWf8AHUJLfFmZTvWuw6knyqX8r5JmUXa91qmR
 7RWN77fl7hILzRxDHUVPRJqObNqdVgSAq1g/fgE2t3a40b7HWIdULNY8bk+2FuipWf
 lMUz/1AlhdbsBjp0q+kpZ769Nb3HKLM72CX/9IK0fvuOIvv/6akayQ1sSDAsbvrKky
 +bD727mC1LU0ZwXQ/jvqiGdWtlE+QO51zwiIrz7vQfpgG9Oz4GT9mgkytk87kgyWZ0
 1HL0fy/wPi3MA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/11] drm/bridge: anx7625: Convert to
 drm_of_get_data_lanes_count
Date: Tue, 24 May 2022 03:05:13 +0200
Message-Id: <20220524010522.528569-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220524010522.528569-1-marex@denx.de>
References: <20220524010522.528569-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert driver to use this new helper to standardize
OF "data-lanes" parsing.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Xin Ji <xji@analogixsemi.com>
To: dri-devel@lists.freedesktop.org
---
V2: - Rename drm_of_get_data_lanes{,_ep} to drm_of_get_data_lanes_count{,_ep}
    - Add RB from Andrzej
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index e92eb4a407452..bbdca16db0d67 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1637,16 +1637,16 @@ static int anx7625_parse_dt(struct device *dev,
 		if (of_property_read_u32(ep0, "bus-type", &bus_type))
 			bus_type = 0;
 
-		mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
+		mipi_lanes = drm_of_get_data_lanes_count(ep0, 1, MAX_LANES_SUPPORT);
 		of_node_put(ep0);
 	}
 
 	if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
 		pdata->is_dpi = 0;
 
-	pdata->mipi_lanes = mipi_lanes;
-	if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
-		pdata->mipi_lanes = MAX_LANES_SUPPORT;
+	pdata->mipi_lanes = MAX_LANES_SUPPORT;
+	if (mipi_lanes > 0)
+		pdata->mipi_lanes = mipi_lanes;
 
 	if (pdata->is_dpi)
 		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DPI host node.\n");
-- 
2.35.1

