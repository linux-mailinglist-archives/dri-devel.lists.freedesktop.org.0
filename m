Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D3625557E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDF76E323;
	Fri, 28 Aug 2020 07:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028826E323
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 07:43:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7EBA620776;
 Fri, 28 Aug 2020 07:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598600583;
 bh=hwP7Z1Qw6TB+HuWMynMqgGLHide/4Ajq/hNm8rqV4M8=;
 h=From:To:Cc:Subject:Date:From;
 b=OlhVIskDIZNItaSs02q3XH8z3VGMmLh/fO8UGAfQdFl19Mx+30v3O2wvJOlp7Jbke
 MSvZCRLWiTlIA+YT1VRrGbNK81UNEF1rf/RsYJbnpS5nQlwC+ojb1JUzSp5V3nk17P
 vMkqbXiRtTVjFwZ6ofvhObQ/ha92Sq8TL7c89GiI=
From: Vinod Koul <vkoul@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/bridge: Fix the dsi remote end-points
Date: Fri, 28 Aug 2020 13:12:50 +0530
Message-Id: <20200828074251.3788165-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSI end-points are supposed to be at node 0 and node 1 as per binding.
So fix this and use node 0 and node 1 for dsi.

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 1009fc4ed4ed..d734d9402c35 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -960,13 +960,13 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 static int lt9611_parse_dt(struct device *dev,
 			   struct lt9611 *lt9611)
 {
-	lt9611->dsi0_node = of_graph_get_remote_node(dev->of_node, 1, -1);
+	lt9611->dsi0_node = of_graph_get_remote_node(dev->of_node, 0, -1);
 	if (!lt9611->dsi0_node) {
 		dev_err(lt9611->dev, "failed to get remote node for primary dsi\n");
 		return -ENODEV;
 	}
 
-	lt9611->dsi1_node = of_graph_get_remote_node(dev->of_node, 2, -1);
+	lt9611->dsi1_node = of_graph_get_remote_node(dev->of_node, 1, -1);
 
 	lt9611->ac_mode = of_property_read_bool(dev->of_node, "lt,ac-mode");
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
