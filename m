Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E7552D16C
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 13:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C3E11A355;
	Thu, 19 May 2022 11:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2FA11A337
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 11:27:11 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5423983D5D;
 Thu, 19 May 2022 13:27:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652959629;
 bh=0YmsD8CVoRaRzsIvnI9IMKF0twe9PsS20X1VB5h+72s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xdyHyl489t+ThEP90ZZ4A7K4xRngViKZwiMl+DCWnRXgZEuS6PnVRVToz4+kj/j64
 EeHsxvaNz23EhLeDODmlaNIY1OHD3Fm8+oGTDgKHERYMPwbsZiPY9yz0iZX22iMFib
 rG9m6hufZFLT3LGi8hBZDg/iFjvTD32bzO+Ix7dUol3En5Et+LkxVOG9POkEjEW9UH
 iDCA2mqR3N2SpHIUnBOC3tjv30InD9PbmuPzbc1N/fa97twXaAz3g99tNDp08YnhSF
 k7g1tHRdGElVsGtHK4yFTF5Whse1nYMb8fAHadLLDnAX5ojsDYHja46iO/NyOnHjdz
 vs3CmnzCAneQw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/11] drm/bridge: tc358775: Convert to
 drm_of_get_data_lanes_ep
Date: Thu, 19 May 2022 13:26:53 +0200
Message-Id: <20220519112657.62283-7-marex@denx.de>
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
 drivers/gpu/drm/bridge/tc358775.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 62a7ef352daa5..7abb8ae3df2ff 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -530,7 +530,7 @@ static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
 	struct device_node *parent;
 	struct device_node *remote;
 	struct property *prop;
-	int len = 0;
+	int dsi_lanes, len = 0;
 
 	/*
 	 * To get the data-lanes of dsi, we need to access the dsi0_out of port1
@@ -544,25 +544,15 @@ static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
 		of_node_put(endpoint);
 		if (parent) {
 			/* dsi0 port 1 */
-			endpoint = of_graph_get_endpoint_by_regs(parent, 1, -1);
+			dsi_lanes = drm_of_get_data_lanes_ep(parent, 1, -1, 1, 4);
 			of_node_put(parent);
-			if (endpoint) {
-				prop = of_find_property(endpoint, "data-lanes",
-							&len);
-				of_node_put(endpoint);
-				if (!prop) {
-					dev_err(tc->dev,
-						"failed to find data lane\n");
-					return -EPROBE_DEFER;
-				}
-			}
 		}
 	}
 
-	tc->num_dsi_lanes = len / sizeof(u32);
+	if (dsi_lanes < 0)
+		return dsi_lanes;
 
-	if (tc->num_dsi_lanes < 1 || tc->num_dsi_lanes > 4)
-		return -EINVAL;
+	tc->num_dsi_lanes = dsi_lanes;
 
 	tc->host_node = of_graph_get_remote_node(np, 0, 0);
 	if (!tc->host_node)
-- 
2.35.1

