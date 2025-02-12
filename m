Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE188A32AB4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 16:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447DB10E8FA;
	Wed, 12 Feb 2025 15:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GvBu9t56";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2934 seconds by postgrey-1.36 at gabe;
 Wed, 12 Feb 2025 15:52:52 UTC
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C1510E8FA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 15:52:52 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 10E0E5827E4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:41:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FDCF204A5;
 Wed, 12 Feb 2025 14:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739371303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hV58UJrNiafKUEEBYyT5622rc4906GKqOPPegyEjpJc=;
 b=GvBu9t563kxnFl8vpKqJnl1NlFNwRhwgqpgwrV/WKHt+P/P2VyItdyvSR8e7YpylVkrJFh
 ZambmdwrU19UQNsfxlqJs00qmG1mJgRSWTe8ObzqtbHpk8slTgRKlELpQzT2avGKq6lyJb
 LL8HprxNBtH1BHLc61viq/yj9L1DFSAe2WWN2RQe9dFql+ICrfKfp8CUe3mO2pCCPgX8tS
 TP6aR8s3Mrn/9Z42s8BUVceDzlUrOyyDuDl6gLHzqZEXHOkCL7Q/nrgv8UdwGzqRqtay8e
 1kA/qjLYuimHcatcpaPr75L+A1gxNamRx4P/B6fzdeCUHAvX/o80W0TZ2LG1gg==
From: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
To: jbrunet@baylibre.com
Cc: Laurent.pinchart@ideasonboard.com, abelvesa@kernel.org, airlied@gmail.com,
 andrzej.hajda@intel.com, arnd@arndb.de, bryan.odonoghue@linaro.org,
 conor.dooley@microchip.com, daire.mcnamara@microchip.com, dakr@kernel.org,
 david.m.ertman@intel.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, festevam@gmail.com,
 gregkh@linuxfoundation.org, gregory.clement@bootlin.com,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, imx@lists.linux.dev,
 ira.weiny@intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 kernel@pengutronix.de, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, martin.blumenstingl@googlemail.com,
 mripard@kernel.org, mturquette@baylibre.com, neil.armstrong@linaro.org,
 p.zabel@pengutronix.de, peng.fan@nxp.com,
 platform-driver-x86@vger.kernel.org, rafael@kernel.org, rfoss@kernel.org,
 s.hauer@pengutronix.de, sboyd@kernel.org, shawnguo@kernel.org,
 simona@ffwll.ch, theo.lebrun@bootlin.com, tzimmermann@suse.de,
 vladimir.kondratiev@mobileye.com
Subject: [PATCH] reset: eyeq: drop device_set_of_node_from_dev() done by parent
Date: Wed, 12 Feb 2025 15:41:26 +0100
Message-ID: <20250212144126.120231-1-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211-aux-device-create-helper-v3-5-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-5-7edb50524909@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggeduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeghfejhfdviefftedvieetfedugeefvedtfedujefhhedvhefggfduhfefueektdenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghlohepthhlvggsqdgsohhothhlihhnqdhffidqtddvrddrpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeejpdhrtghpthhtohepjhgsrhhunhgvthessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopegrsggvlhhvvghsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmr
 ghilhdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegsrhihrghnrdhoughonhhoghhhuhgvsehlihhnrghrohdrohhrghdprhgtphhtthhopegtohhnohhrrdguohholhgvhiesmhhitghrohgthhhiphdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our parent driver (clk-eyeq) now does the
	device_set_of_node_from_dev(dev, dev->parent)
call through the newly introduced devm_auxiliary_device_create() helper.

Doing it again in the reset-eyeq probe would be redundant.
Drop both the WARN_ON() and the device_set_of_node_from_dev() call.
Also fix the following comment that talks about "our newfound OF node".

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/reset/reset-eyeq.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
index 02d50041048b..8018fa895427 100644
--- a/drivers/reset/reset-eyeq.c
+++ b/drivers/reset/reset-eyeq.c
@@ -420,17 +420,8 @@ static int eqr_probe(struct auxiliary_device *adev,
 	int ret;
 
 	/*
-	 * We are an auxiliary device of clk-eyeq. We do not have an OF node by
-	 * default; let's reuse our parent's OF node.
-	 */
-	WARN_ON(dev->of_node);
-	device_set_of_node_from_dev(dev, dev->parent);
-	if (!dev->of_node)
-		return -ENODEV;
-
-	/*
-	 * Using our newfound OF node, we can get match data. We cannot use
-	 * device_get_match_data() because it does not match reused OF nodes.
+	 * Get match data. We cannot use device_get_match_data() because it does
+	 * not accept reused OF nodes; see device_set_of_node_from_dev().
 	 */
 	match = of_match_node(dev->driver->of_match_table, dev->of_node);
 	if (!match || !match->data)
-- 
2.48.1

