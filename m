Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2D853201C
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 03:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394EC10E98B;
	Tue, 24 May 2022 01:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9967110E829
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 01:05:49 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E70C2841D6;
 Tue, 24 May 2022 03:05:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653354348;
 bh=fh42fiNZuT2NRw3YS/X90tYAq3H2NAF5etw1GyBvKNg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F1EUUsBADcmNSlm9faHP1OHfYXqESQImBzeplDdZGUnB9DLy3P86kclM6kpQwfN9E
 NXAhIDr2Rc2BBQo3iHBQvkdI2w4ZkBOMc/7AuvgjWIBl8cYvSTuvfzeWkocJVKzezu
 L7AXJZUJi2oebc2f3o+KKa2jPD2W2rhBsB0eKTQXdMnkc86Uo3OYdj10DCtqGfuTuB
 hHGuqI7bylCs4snjLpLkDCj8Jbl7uCd/FPTrvLSLF/CqqGHz376a9wtAL+lS/zavXa
 C1vPSCJAZbH0A3ccqJDMwTRxbN/kXTiy8gpFIz7rVuVQe5V8y69uUq1ipDicvX1EQg
 3HJuw2eMspv/w==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/11] drm/bridge: lt9211: Convert to
 drm_of_get_data_lanes_count
Date: Tue, 24 May 2022 03:05:16 +0200
Message-Id: <20220524010522.528569-5-marex@denx.de>
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
 Sam Ravnborg <sam@ravnborg.org>
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
To: dri-devel@lists.freedesktop.org
---
V2: - Rename drm_of_get_data_lanes{,_ep} to drm_of_get_data_lanes_count{,_ep}
    - Add RB from Andrzej
---
 drivers/gpu/drm/bridge/lontium-lt9211.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index e92821fbc6393..84d764b4139bd 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -686,7 +686,7 @@ static int lt9211_host_attach(struct lt9211 *ctx)
 	int ret;
 
 	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
-	dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	dsi_lanes = drm_of_get_data_lanes_count(endpoint, 1, 4);
 	host_node = of_graph_get_remote_port_parent(endpoint);
 	host = of_find_mipi_dsi_host_by_node(host_node);
 	of_node_put(host_node);
@@ -695,8 +695,8 @@ static int lt9211_host_attach(struct lt9211 *ctx)
 	if (!host)
 		return -EPROBE_DEFER;
 
-	if (dsi_lanes < 0 || dsi_lanes > 4)
-		return -EINVAL;
+	if (dsi_lanes < 0)
+		return dsi_lanes;
 
 	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi))
-- 
2.35.1

