Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B30C912516E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 20:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EED46EA53;
	Wed, 18 Dec 2019 19:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505FC6EA53
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 19:10:41 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id c13so1409886pls.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 11:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hp8TQeL3yIB1KqyuldLYK5Mau4+1RzHQTjjW58JR+LE=;
 b=ahpP2VUFj07C+YAeNRzrA76nsNFKGCa58LATV1abYF6W3evqhgS4VjoXIZF5Rxs/Zl
 KojhYjea5pEydc4TKZ3PzW8hmG8ZtdgiQqcbtzZreiFvxQIj/c5GnNzPA0rjzyel3sRZ
 rypwNDaFKZeKjEZwHrGEr6XO1coStIFAo1GzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hp8TQeL3yIB1KqyuldLYK5Mau4+1RzHQTjjW58JR+LE=;
 b=d9oNdO6wo2J5+zf7JMCalJ9jTY+TjTe2Q9s/CUBSvmCGuh64awwZizmFbDtIgAoi9G
 ABvFDFJift1fBVVJkeOXnyRBXbFu2R+Y4kPb2jwuTJRNN5ktuI281iRCMPrYmLeQmAAa
 1TXpBUj0VLiUBtTSZNYoJGHLP0ZiSmkiWfMuxC1wuuCvufTLrVkx6/pt1i1tIGlsd7vJ
 lEDkGL63rwsPm3/oqJHjrsk0DGpzJcx8iPZYsyRX6OrkFSJ1EAnSFNkqjmVKyFpUu8gL
 RbP19P5gRvwUQKcvaPdQfC90GXSZd7e8a/vCyskN4x1mLJY9nkhZoYjkC7eTCgUT5VvP
 z6zw==
X-Gm-Message-State: APjAAAV1pJOYn+t+tfTykL7gvmiVYSgPeVb0L7QbgsmncHelka4a+Nbf
 9mCIdH8bu+7SkDB7KB3Rwwh9Gw==
X-Google-Smtp-Source: APXvYqzbv5fA1hAkQ1/0DqEdeyLCZYo/j3p0FDLo1mRnWUjMlN5AwYLYhnlRpg3B5Bk1ug5tM+pzvQ==
X-Received: by 2002:a17:90a:fb4f:: with SMTP id
 iq15mr4735561pjb.86.1576696240895; 
 Wed, 18 Dec 2019 11:10:40 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:78ea:e014:edb4:e862])
 by smtp.gmail.com with ESMTPSA id q7sm3745855pjd.3.2019.12.18.11.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 11:10:40 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v13 3/7] drm/sun4i: dsi: Get the mod clock for A31
Date: Thu, 19 Dec 2019 00:40:13 +0530
Message-Id: <20191218191017.2895-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191218191017.2895-1-jagan@amarulasolutions.com>
References: <20191218191017.2895-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per the user manual, look like mod clock is not mandatory
for all Allwinner MIPI DSI controllers, it is connected to
CLK_DSI_SCLK for A31 and not available in A64.

So, add compatible check for A31 and get mod clock accordingly.

Tested-by: Merlijn Wajer <merlijn@wizzup.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v13:
- Drop has_mod_clk quirk as commented by Chen-Yu

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index c958ca9bae63..68b88a3dc4c5 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1120,10 +1120,13 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 		return PTR_ERR(dsi->reset);
 	}
 
-	dsi->mod_clk = devm_clk_get(dev, "mod");
-	if (IS_ERR(dsi->mod_clk)) {
-		dev_err(dev, "Couldn't get the DSI mod clock\n");
-		return PTR_ERR(dsi->mod_clk);
+	if (of_device_is_compatible(dev->of_node,
+				    "allwinner,sun6i-a31-mipi-dsi")) {
+		dsi->mod_clk = devm_clk_get(dev, "mod");
+		if (IS_ERR(dsi->mod_clk)) {
+			dev_err(dev, "Couldn't get the DSI mod clock\n");
+			return PTR_ERR(dsi->mod_clk);
+		}
 	}
 
 	/*
-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
