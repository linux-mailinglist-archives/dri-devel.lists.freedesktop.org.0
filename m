Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C6A64C97E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 14:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A95310E3E6;
	Wed, 14 Dec 2022 13:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBE110E3DF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 12:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1671022719; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/tzTFKNZMMV1rVb1b3n0tYGGd7bT77iWuW0eM5CPb0=;
 b=CCR3JzkcrQ+B4tyoWwJL3L2TVfweylPk+HzdU2AjikcAi/uYXMI4ARgOFTeN/x+/dWqY9k
 izDSAMZnqNqvIKvlNoV5fEhv2aaKZqS7j4Xm79sZel9uJcrZjgvHi9U4O1jCEnOUs8DcGA
 JSqpM1oCWcQyajDG1YG+2XJMmAHRi+M=
From: Paul Cercueil <paul@crapouillou.net>
To: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 07/10] drm: bridge: it66121: Don't clear DDC FIFO twice
Date: Wed, 14 Dec 2022 13:58:18 +0100
Message-Id: <20221214125821.12489-8-paul@crapouillou.net>
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

The DDC FIFO was cleared before the loop in it66121_get_edid_block(),
and at the beginning of each iteration; which means that it did not have
to be cleared before the loop.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 06fa59ae5ffc..5335d4abd7c5 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -456,18 +456,6 @@ static inline int it66121_wait_ddc_ready(struct it66121_ctx *ctx)
 	return 0;
 }
 
-static int it66121_clear_ddc_fifo(struct it66121_ctx *ctx)
-{
-	int ret;
-
-	ret = it66121_preamble_ddc(ctx);
-	if (ret)
-		return ret;
-
-	return regmap_write(ctx->regmap, IT66121_DDC_COMMAND_REG,
-			    IT66121_DDC_COMMAND_FIFO_CLR);
-}
-
 static int it66121_abort_ddc_ops(struct it66121_ctx *ctx)
 {
 	int ret;
@@ -515,10 +503,6 @@ static int it66121_get_edid_block(void *context, u8 *buf,
 	offset = (block % 2) * len;
 	block = block / 2;
 
-	ret = it66121_clear_ddc_fifo(ctx);
-	if (ret)
-		return ret;
-
 	while (remain > 0) {
 		cnt = (remain > IT66121_EDID_FIFO_SIZE) ?
 				IT66121_EDID_FIFO_SIZE : remain;
-- 
2.35.1

