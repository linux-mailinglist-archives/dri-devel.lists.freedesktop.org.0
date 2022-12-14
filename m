Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B33F64C971
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 13:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391C310E3E1;
	Wed, 14 Dec 2022 12:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5350A10E3DC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 12:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1671022718; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IjEqO4+e5a85zoFujWIdC4NDhCTvt3vZK7qMG1zFzpw=;
 b=cQ7sM/duB1Ux5RyiSMSRezimCjOFlDjgcHqu/LkB5qaauPqMY+kcSY77YiRqS0AG8ETxcA
 BjsEBiB4N5UcW9AWZxSlL2MPpBh9Z6sR6et5U2F5j/ynZ3lJZejoAvRXj3YFfb/5JxHaaJ
 g2cNzoksDdMX6uTjGK3w5RApjGizKd8=
From: Paul Cercueil <paul@crapouillou.net>
To: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 05/10] drm: bridge: it66121: Fix wait for DDC ready
Date: Wed, 14 Dec 2022 13:58:16 +0100
Message-Id: <20221214125821.12489-6-paul@crapouillou.net>
In-Reply-To: <20221214125821.12489-1-paul@crapouillou.net>
References: <20221214125821.12489-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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

The function it66121_wait_ddc_ready() would previously read the status
register until "true", which means it never actually polled anything and
would just read the register once.

Now, it will properly wait until the DDC hardware is ready or until it
reported an error.

The 'busy' variable was also renamed to 'error' since these bits are set
on error and not when the DDC hardware is busy.

Since the DDC ready function is now working properly, the msleep(20) can
be removed.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 0a4fdfd7af44..bfb9c87a7019 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -440,15 +440,17 @@ static int it66121_configure_afe(struct it66121_ctx *ctx,
 static inline int it66121_wait_ddc_ready(struct it66121_ctx *ctx)
 {
 	int ret, val;
-	u32 busy = IT66121_DDC_STATUS_NOACK | IT66121_DDC_STATUS_WAIT_BUS |
-		   IT66121_DDC_STATUS_ARBI_LOSE;
+	u32 error = IT66121_DDC_STATUS_NOACK | IT66121_DDC_STATUS_WAIT_BUS |
+		    IT66121_DDC_STATUS_ARBI_LOSE;
+	u32 done = IT66121_DDC_STATUS_TX_DONE;
 
-	ret = regmap_read_poll_timeout(ctx->regmap, IT66121_DDC_STATUS_REG, val, true,
-				       IT66121_EDID_SLEEP_US, IT66121_EDID_TIMEOUT_US);
+	ret = regmap_read_poll_timeout(ctx->regmap, IT66121_DDC_STATUS_REG, val,
+				       val & (error | done), IT66121_EDID_SLEEP_US,
+				       IT66121_EDID_TIMEOUT_US);
 	if (ret)
 		return ret;
 
-	if (val & busy)
+	if (val & error)
 		return -EAGAIN;
 
 	return 0;
@@ -582,9 +584,6 @@ static int it66121_get_edid_block(void *context, u8 *buf,
 		offset += cnt;
 		remain -= cnt;
 
-		/* Per programming manual, sleep here before emptying the FIFO */
-		msleep(20);
-
 		ret = it66121_wait_ddc_ready(ctx);
 		if (ret)
 			return ret;
-- 
2.35.1

