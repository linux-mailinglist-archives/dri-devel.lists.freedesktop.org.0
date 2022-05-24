Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F40453201D
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 03:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A45310E990;
	Tue, 24 May 2022 01:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DFA10E928
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 01:05:51 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D114C8424E;
 Tue, 24 May 2022 03:05:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653354350;
 bh=giv7ZfZwMibJE21VuVm5HXlV628iQ7Rb/8zVU9LYbag=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UXNGlYExg4XxxALB5eT/VkdpCS0mcam3l2Gv8DAJD+Ix1Kxtcu8Y3id7Yujv+LsQQ
 /bQ7BLS57dglp3j6cZqUFuE+Gz9ORAHH/64fpIE3RGDhI87KXKBgs3+kaiYK/TTJLJ
 wrYNxojX3zBSAFFKiriFbWAqwR/IGo+KL4AUy/swFJBCCw8nK3BPYtMEiotkgVd1+1
 ll1k+vdiVY1SYVDSSTCrWLpJYBFA0IQY8DmlXTA1cyn5kgTiPsJ2un6tE3WYupQK2z
 IOLCI0RpdLNudbhgLw458d18mAG2lD4nnChnatCq28Ezbc2ciDU9dzWUU1rQJM29LH
 r05E8FSVLMJYg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/11] drm/bridge: ti-sn65dsi86: Convert to
 drm_of_get_data_lanes_count
Date: Tue, 24 May 2022 03:05:20 +0200
Message-Id: <20220524010522.528569-9-marex@denx.de>
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
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 8cad662de9bb5..c2b9227f7042a 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1142,8 +1142,8 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
 	 * mappings that the hardware supports.
 	 */
 	endpoint = of_graph_get_endpoint_by_regs(np, 1, -1);
-	dp_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
-	if (dp_lanes > 0 && dp_lanes <= SN_MAX_DP_LANES) {
+	dp_lanes = drm_of_get_data_lanes_count(endpoint, 1, SN_MAX_DP_LANES);
+	if (dp_lanes > 0) {
 		of_property_read_u32_array(endpoint, "data-lanes",
 					   lane_assignments, dp_lanes);
 		of_property_read_u32_array(endpoint, "lane-polarities",
-- 
2.35.1

