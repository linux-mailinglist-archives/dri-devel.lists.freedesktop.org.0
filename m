Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2855664C97C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 14:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2238110E3E5;
	Wed, 14 Dec 2022 13:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E861F10E3DF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1671022720; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KeMpz45TOyvVn4HaL38PVZq5CngjCz3MJ9MuW8B68E=;
 b=WxwtGcHNpUdeoMnK9VyRRg1AKQrf7nrJx2dLo+asEzu8mp12lAvL0MApYB073TpGc9enhA
 ikJV6XHx0WOUB7IM2eU3Sbdzj2VINliYZIfpBlMFeVZWkyoZ3026A6iMsICsHNNZSQ1ttJ
 /otM2kHhHEk3Hvus50mtdJPhKLXUmbs=
From: Paul Cercueil <paul@crapouillou.net>
To: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 08/10] drm: bridge: it66121: Set DDC preamble only once before
 reading EDID
Date: Wed, 14 Dec 2022 13:58:19 +0100
Message-Id: <20221214125821.12489-9-paul@crapouillou.net>
In-Reply-To: <20221214125821.12489-1-paul@crapouillou.net>
References: <20221214125821.12489-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 list@opendingux.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DDC preamble and target address only need to be set once before
reading the EDID, even if multiple segments have to be read.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 5335d4abd7c5..7972003d4776 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -506,9 +506,6 @@ static int it66121_get_edid_block(void *context, u8 *buf,
 	while (remain > 0) {
 		cnt = (remain > IT66121_EDID_FIFO_SIZE) ?
 				IT66121_EDID_FIFO_SIZE : remain;
-		ret = it66121_preamble_ddc(ctx);
-		if (ret)
-			return ret;
 
 		ret = regmap_write(ctx->regmap, IT66121_DDC_COMMAND_REG,
 				   IT66121_DDC_COMMAND_FIFO_CLR);
@@ -519,15 +516,6 @@ static int it66121_get_edid_block(void *context, u8 *buf,
 		if (ret)
 			return ret;
 
-		ret = it66121_preamble_ddc(ctx);
-		if (ret)
-			return ret;
-
-		ret = regmap_write(ctx->regmap, IT66121_DDC_HEADER_REG,
-				   IT66121_DDC_HEADER_EDID);
-		if (ret)
-			return ret;
-
 		ret = regmap_write(ctx->regmap, IT66121_DDC_OFFSET_REG, offset);
 		if (ret)
 			return ret;
@@ -842,9 +830,25 @@ static struct edid *it66121_bridge_get_edid(struct drm_bridge *bridge,
 {
 	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
 	struct edid *edid;
+	int ret;
 
 	mutex_lock(&ctx->lock);
+	ret = it66121_preamble_ddc(ctx);
+	if (ret) {
+		edid = ERR_PTR(ret);
+		goto out_unlock;
+	}
+
+	ret = regmap_write(ctx->regmap, IT66121_DDC_HEADER_REG,
+			   IT66121_DDC_HEADER_EDID);
+	if (ret) {
+		edid = ERR_PTR(ret);
+		goto out_unlock;
+	}
+
 	edid = drm_do_get_edid(connector, it66121_get_edid_block, ctx);
+
+out_unlock:
 	mutex_unlock(&ctx->lock);
 
 	return edid;
-- 
2.35.1

