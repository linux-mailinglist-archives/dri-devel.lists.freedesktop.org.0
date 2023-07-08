Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DB574BC58
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 08:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA5610E64F;
	Sat,  8 Jul 2023 06:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr
 [80.12.242.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12A110E64F
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 06:05:57 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id I14oqFw01JGUmI14oqAyUU; Sat, 08 Jul 2023 08:05:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1688796353;
 bh=3Y7Axqsz6Qm1534LmlCmTjhnVQQHJy6kg1MSVPN3Gt0=;
 h=From:To:Cc:Subject:Date;
 b=SmvEgK+EfvyIN44j7N+plKiYs52wGa/xK2upe/vDIpQXl1KiHLHSCLtCmKzNzznOV
 JjwZezf4U/QdH2PBUWeHoN5fagBWQoH9Htx1FlHUPLlAOaq3KFaSks9XUEhKk8ltXm
 Aq588PLl587hszhfw5iWkBuHXii106k2busbmNT5lMcOGl0cxuqm6L545ABCqOtouo
 RQMjn1WC6Bsa9iJccZ3H71tWI2Fh3MwY8E6X/dqsUEGqrHJyLjY2IJuyL+b1rJu718
 d8dr0Qb51usE5Ueo9jDRXUMjbCqVJOln6Js8LOzirpFEreqf3m0S3LAHo/QoC9Lw1V
 9iMInGwQtD9PQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 08 Jul 2023 08:05:53 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3] drm/bridge: tc358767: Use devm_clk_get_enabled() helper
Date: Sat,  8 Jul 2023 08:05:35 +0200
Message-Id: <208a15ce4e01973daf039ad7bc0f9241f650b3af.1672415956.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The devm_clk_get_enabled() helper:
   - calls devm_clk_get()
   - calls clk_prepare_enable() and registers what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the need of a dedicated function used
with devm_add_action_or_reset().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Change in v3:
  - Rebase with latest -next

Change in v2:
  - Convert to dev_err_probe()    [Andrzej Hajda]
  - Update the error message    [Andrzej Hajda]
  - Add R-b tag    [Andrzej Hajda]
https://lore.kernel.org/all/208546ce4e01973da1eb9ad7bc0f9241f650b3af.1672415956.git.christophe.jaillet@wanadoo.fr/

v1:
https://lore.kernel.org/all/4f855984ea895e1488169e77935fa6e044912ac2.1672414073.git.christophe.jaillet@wanadoo.fr/
---
 drivers/gpu/drm/bridge/tc358767.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 2a58eb271f70..99f3d5ca7257 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2215,13 +2215,6 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
 	return -EINVAL;
 }
 
-static void tc_clk_disable(void *data)
-{
-	struct clk *refclk = data;
-
-	clk_disable_unprepare(refclk);
-}
-
 static int tc_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -2238,20 +2231,10 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (ret)
 		return ret;
 
-	tc->refclk = devm_clk_get(dev, "ref");
-	if (IS_ERR(tc->refclk)) {
-		ret = PTR_ERR(tc->refclk);
-		dev_err(dev, "Failed to get refclk: %d\n", ret);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(tc->refclk);
-	if (ret)
-		return ret;
-
-	ret = devm_add_action_or_reset(dev, tc_clk_disable, tc->refclk);
-	if (ret)
-		return ret;
+	tc->refclk = devm_clk_get_enabled(dev, "ref");
+	if (IS_ERR(tc->refclk))
+		return dev_err_probe(dev, PTR_ERR(tc->refclk),
+				     "Failed to get and enable the ref clk\n");
 
 	/* tRSTW = 100 cycles , at 13 MHz that is ~7.69 us */
 	usleep_range(10, 15);
-- 
2.34.1

