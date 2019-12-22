Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC53128E29
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2019 14:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F566E529;
	Sun, 22 Dec 2019 13:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3566E529
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 13:29:40 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id n59so6275975pjb.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 05:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NRAz4ZoqKI0Nd9TLnyy5Bof8VE4wzHjzOviJFUDWFYU=;
 b=dNOsofgdHJWSE8kXto64TSNFpxvXSvTZtOGMWYtrAbWMsEWHOWfyZJKTWKxhM/tWbM
 AzxWaWz0PjEHFhYXmk9MIjDaDM8CUit4sGy/NLqKXDZxAxfI5cQfx55rk7JCf61gEnsQ
 6XQLOI6jPwnXWXY7UFUUb9Fhteq4HIuQHSf8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NRAz4ZoqKI0Nd9TLnyy5Bof8VE4wzHjzOviJFUDWFYU=;
 b=TzddOV8um1uUD9vLwUzOfGIgUfsFciUg1W7LWHDRqIFYChaE692OExYdTUeItZaG3e
 q7atzmxHCCreRrV3+3OkDoRg2tEzaXdMmXQjbqaVsIp+9lwB3sCvwaGmp0GhLl8TeDPF
 i4DpBabE3hogpshjgB60+sOwYEwxJxAlojTC3DF3MUd40dGwZRdE73GLRSBeCkxFncNZ
 yJxZtI5hj6w+ItLG8HFYUk5L+BnsSx9iZ+7Yp+dVQ9RC3pOCVYK7TmEU6MEZUyqSCTIa
 7utHRKq2PMhoFxFfPNb6zAhmURnYly5hTXFcz3e24q74ZBy3pwl+HyHmPP/rHtAdG5Gt
 0Ufg==
X-Gm-Message-State: APjAAAXE8OafHfDPX/ePk23qjSOg3bZX1NFs6/P5Zl+UQsGlbkN1gC9B
 gEI897fRMjGlBYwmDFREjQlNMw==
X-Google-Smtp-Source: APXvYqzi7D0b+20qvpHdXr2HAOx7HQsXtaHE5dZtjtMXAPfngax/iDdiCqnpwtaqArWonhyBKuzS1A==
X-Received: by 2002:a17:90a:a4c4:: with SMTP id
 l4mr27148361pjw.48.1577021380573; 
 Sun, 22 Dec 2019 05:29:40 -0800 (PST)
Received: from localhost.localdomain ([49.206.202.16])
 by smtp.gmail.com with ESMTPSA id o2sm12073058pjo.26.2019.12.22.05.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2019 05:29:40 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v14 3/7] drm/sun4i: dsi: Get the mod clock for A31
Date: Sun, 22 Dec 2019 18:52:25 +0530
Message-Id: <20191222132229.30276-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191222132229.30276-1-jagan@amarulasolutions.com>
References: <20191222132229.30276-1-jagan@amarulasolutions.com>
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
Changes for v14:
- none

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
