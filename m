Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3A852D16D
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 13:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE2D11A354;
	Thu, 19 May 2022 11:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250AF11A283
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 11:27:12 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 659FB83C01;
 Thu, 19 May 2022 13:27:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652959630;
 bh=Xx7lZ6hlSXuQihMd2KE2mgQgIsELPNfCWhoJlBEhOio=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W9/ishY7dFoziCiVFDRmPYN795JrF9Bm8tLY3spQPjlEoOWAAOHcU3XOMZqNb6WKy
 vADpGfGJi7s4I7Mr7xpucOJUCvSbfxvBrnMjHBpq1lc8CU5TJwoOiqmAlI9uRrGXlt
 OTNcIUU3Fd13FKQBV8k4FvFUP93yChWqHnxBlw0KM3devVpcl+3QFfaGklTiQfl8jZ
 Jgz5BPVFihhmQF0O41a5bxcWdTCY7Ja1mwox9AnO+II/2j/I+TlfqTjwmZbO+h7J9d
 hX0H9PwTGkiJl116vamy0nvnnXn4U7Xkwg9yTsHT0ffVp6aKAjfprPwnTVzQtHMg2L
 njY9n244J8Olg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/11] drm/bridge: ti-sn65dsi86: Convert to
 drm_of_get_data_lanes
Date: Thu, 19 May 2022 13:26:55 +0200
Message-Id: <20220519112657.62283-9-marex@denx.de>
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
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 8cad662de9bb5..44a330a48d385 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1142,8 +1142,8 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
 	 * mappings that the hardware supports.
 	 */
 	endpoint = of_graph_get_endpoint_by_regs(np, 1, -1);
-	dp_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
-	if (dp_lanes > 0 && dp_lanes <= SN_MAX_DP_LANES) {
+	dp_lanes = drm_of_get_data_lanes(endpoint, 1, SN_MAX_DP_LANES);
+	if (dp_lanes > 0) {
 		of_property_read_u32_array(endpoint, "data-lanes",
 					   lane_assignments, dp_lanes);
 		of_property_read_u32_array(endpoint, "lane-polarities",
-- 
2.35.1

