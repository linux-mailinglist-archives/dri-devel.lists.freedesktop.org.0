Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29CFA81083
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 17:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD7910E6E1;
	Tue,  8 Apr 2025 15:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AOI1r6d7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD6910E6E4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 15:47:03 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 034545803CA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 15:27:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7940E442C3;
 Tue,  8 Apr 2025 15:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744126025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q5lFIEycGK+k4tLFyO/zn/JPfNG0fz/9HAV5+pyxxxk=;
 b=AOI1r6d722aPUJIH+Vjy1dAEt3UDgmiag9ht68hEHaDml3OCEPd1D9920R9ICF2RlhhPH7
 Lxxb11rcUafNIN91J+39wyQX6es9itTrKBCgIZ1pU9PvcJDlBuCKPeSH/O5w+dnxnhOWkj
 zwCewGCgIIrO/KaTRKWI/pApSQ6f3MjC6w47vGmzqdWt0fEqtcHr4xL695XPZjNjNAav7x
 cA/5qn3BrGmdNM77srSn+3+29EPbKClkSH0lkdXzOt+wpUuvaWjgPGYCaj7kD9PDeFLuZE
 B9LXPEJFtSb4KhHw2+k7taTbYmThsbM/RvN6QCIYJehWZX2JkJKhQm/sg6GrJA==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Tue, 08 Apr 2025 17:27:01 +0200
Subject: [PATCH 2/4] drm/panel: ilitek-ili9881c: Add support for two-lane
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-feature_sfto340xc-v1-2-f303d1b9a996@bootlin.com>
References: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
In-Reply-To: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com
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

Enable support for two-lane configuration which is done by setting the
LANSEL_SW_EN and LANSEL_SW bits in the Pad Control register.

Use the dsi-lanes device tree parameter to configure the number of lanes.
The default configuration remains set to four lanes.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 35 +++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 28cd7560e5db1d5734b10babdb4e4e553c6e07d0..5c429715159755df2461063dad0971642e2b9041 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -1263,6 +1263,21 @@ static int ili9881c_send_cmd_data(struct ili9881c *ctx, u8 cmd, u8 data)
 	return 0;
 }
 
+static int ili9881c_set_lanes_cfg(struct ili9881c *ctx)
+{
+	int ret;
+
+	if (ctx->dsi->lanes != 2)
+		/* Nothing to do */
+		return 0;
+
+	ret = ili9881c_switch_page(ctx, 1);
+	if (ret)
+		return ret;
+
+	return ili9881c_send_cmd_data(ctx, 0xB7, 0x3);
+}
+
 static int ili9881c_prepare(struct drm_panel *panel)
 {
 	struct ili9881c *ctx = panel_to_ili9881c(panel);
@@ -1295,6 +1310,10 @@ static int ili9881c_prepare(struct drm_panel *panel)
 			return ret;
 	}
 
+	ret = ili9881c_set_lanes_cfg(ctx);
+	if (ret)
+		return ret;
+
 	ret = ili9881c_switch_page(ctx, 0);
 	if (ret)
 		return ret;
@@ -1504,7 +1523,7 @@ static const struct drm_panel_funcs ili9881c_funcs = {
 static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	struct ili9881c *ctx;
-	int ret;
+	int ret, lanes;
 
 	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -1545,11 +1564,23 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
+	ret = of_property_read_u32(dsi->dev.of_node, "dsi-lanes", &lanes);
+	if (ret == -EINVAL) {
+		lanes = 4;
+	} else if (ret) {
+		dev_err(&dsi->dev, "Failed to get dsi-lanes property (%d)\n",
+			ret);
+		return ret;
+	} else if (lanes < 2 || 4 < lanes) {
+		dev_err(&dsi->dev, "Wrong number of dsi-lanes (%d)\n", lanes);
+		return -EINVAL;
+	}
+
 	drm_panel_add(&ctx->panel);
 
 	dsi->mode_flags = ctx->desc->mode_flags;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->lanes = 4;
+	dsi->lanes = lanes;
 
 	return mipi_dsi_attach(dsi);
 }

-- 
2.34.1

