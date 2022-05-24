Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 347C053201A
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 03:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1107C10E928;
	Tue, 24 May 2022 01:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9FD10E928
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 01:05:50 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 67C0484211;
 Tue, 24 May 2022 03:05:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653354348;
 bh=t5rC/mbam5ZpbSy6PkWxNVnsIjP4ZmhHCmSTF/T59YQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P3BupvdJ+y54JWn0EsWrRWh+4YwY+VBcjHDpyvmlzvkOBBrINjDgbr+qE0Ij0BrNU
 OzDK98UKDUohAOn+nIt9SnT5dndpTWGolzTAVnTU7Qtah/emFQ9+cjAafaltfv3iog
 vM+TF+Lt08eUN5qjyyAVE6JQGZV1T7nw+aFfA/1q/P8D0Z5sqgc75bCwCYdrJcl/38
 Bb7PvFjliFEQKoVxYrth5th3exS+9PPs9Wousk43u3owdx2HevzHyve9nwhyADPR/Y
 4Bl0jFcIKqFnyImYzbBjRi0hnaUzlHzC57KxGm2uSGWbt0fIgZVx4kxfe6iCbkptLi
 Ca9IkgvMnMboQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/11] drm/bridge: tc358767: Convert to
 drm_of_get_data_lanes_count
Date: Tue, 24 May 2022 03:05:17 +0200
Message-Id: <20220524010522.528569-6-marex@denx.de>
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
 drivers/gpu/drm/bridge/tc358767.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index cec0f50f4874f..44f32bf483c51 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1889,18 +1889,18 @@ static int tc_mipi_dsi_host_attach(struct tc_data *tc)
 	int dsi_lanes, ret;
 
 	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
-	dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	dsi_lanes = drm_of_get_data_lanes_count(endpoint, 1, 4);
 	host_node = of_graph_get_remote_port_parent(endpoint);
 	host = of_find_mipi_dsi_host_by_node(host_node);
 	of_node_put(host_node);
 	of_node_put(endpoint);
 
-	if (dsi_lanes <= 0 || dsi_lanes > 4)
-		return -EINVAL;
-
 	if (!host)
 		return -EPROBE_DEFER;
 
+	if (dsi_lanes < 0)
+		return dsi_lanes;
+
 	dsi = mipi_dsi_device_register_full(host, &info);
 	if (IS_ERR(dsi))
 		return dev_err_probe(dev, PTR_ERR(dsi),
-- 
2.35.1

