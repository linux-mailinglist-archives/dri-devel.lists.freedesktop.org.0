Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CD552D171
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 13:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E3811A353;
	Thu, 19 May 2022 11:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8FD11A283
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 11:27:11 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DB7C583D7E;
 Thu, 19 May 2022 13:27:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652959630;
 bh=i0PRdJ8XNIAyTnFCrLSfM4cYGVe5Gqur9PWvKa1raPE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HNWFu8IfeYJmMRZPhrsWdDZ5QzufzJbQcNqp2eRZnDG5zqSDrH2uZqv7gSUxjW2ZL
 cZBuCLAlkH5DBidUdeg/WdWApkUqcvFyAKc/QTSZje8NRCAFQMCZ67Tugmuvd2WADM
 LCG4Mk4DlnqcfsQzCKkSS5YeoY1b1OZmpZTAapr60IHY6myFvaWBk1rhxORZnxj2X+
 Q7WCYwZLAskMdwRoM0+hMM8Oe5VVQvt5AgvBl6WXnn+ViLwXhq2+JLluHOx12xU2Xj
 r33kTynuBjCeVaLHM5VyP/IBfr+rLipxJ198V6Ya+gD8PXUbo00BZw350FzKLCR7pG
 EYDe9pC5KcKCg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/11] drm/bridge: ti-sn65dsi83: Convert to
 drm_of_get_data_lanes
Date: Thu, 19 May 2022 13:26:54 +0200
Message-Id: <20220519112657.62283-8-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220519112657.62283-1-marex@denx.de>
References: <20220519112657.62283-1-marex@denx.de>
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
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert driver to use this new helper to standardize
OF "data-lanes" parsing.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index f5c1819857665..e3d87e5905c00 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -628,7 +628,7 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
 	int dsi_lanes, ret;
 
 	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
-	dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	dsi_lanes = drm_of_get_data_lanes(endpoint, 1, 4);
 	host_node = of_graph_get_remote_port_parent(endpoint);
 	host = of_find_mipi_dsi_host_by_node(host_node);
 	of_node_put(host_node);
-- 
2.35.1

