Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A343323F953
	for <lists+dri-devel@lfdr.de>; Sun,  9 Aug 2020 00:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232156E29E;
	Sat,  8 Aug 2020 22:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAAA6E29E
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Aug 2020 22:31:29 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id v15so2817351lfg.6
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Aug 2020 15:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1UYKfe7fUayrRhNCnBO5pmM/UgWEDb3+VaJYdrKZwQc=;
 b=N8siCSMQ4Kc6Ei3SpR8jHHp2R3f7UfUbibSXrjiU1uCT/JEQID30GFXj81vyGLqfe4
 qKLO6gh9DySOcf7kMx2rAaNjTw+WqGwRJdRmRUREP76tkcsFC7vQLEM57hvrqdTajajD
 nUFjxZqFru+OIG/arXE9Lm5c2AQoNo5R3/qIAqigs274m3ytauiiLSRddbozyX9Xk62D
 SREeD4zLBmHsgk2TPd3LzrtCEmQZYQD6n9YgvSpQaA0Xcq5ref5EU6nAru/FSEkjmqbz
 T41LKIZIrgK1dfOpmwWa9nW2F5XIgaKS4mojd6vhoFrSVXSlh/SiXgbM9FEmR8rS5S+o
 ggkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1UYKfe7fUayrRhNCnBO5pmM/UgWEDb3+VaJYdrKZwQc=;
 b=dStGGwvQwwYvujGuWzJRK/vu2cPNZOpMfoBlZzJqJC2Wvlw84jz4kCADmkHIIg+kW+
 0cb+FprtCpLDxHoUGJMMgywKgAB8NuBuSEXznZFN8xzwco97EJOJe5XRP2++ZwkbBWCi
 fcDBvb9hmlB5uuUkKNQT6gj2jvHOJ6uQHefyIfIsc2mfGhSLuleOfU0fZr22nyHNLQYt
 S/TlP5d982+zzzwKme8EsT9ZZrgNWMqvRyoZBV8HD1F0i+YpgjBVxkELERPtmq6Tn3rO
 11PBcDfr/OP01iCkwIIHy26Yppfrke8ph79AilI7tSjwqb7jLp80NH4AWEn44meiQfQA
 0q3w==
X-Gm-Message-State: AOAM533Vw7eGyXOSKzhd+edP0wYJHFntzGcnqfoMeFS/Yey6j0oRxFa6
 9UXPSSUBUgnUsZ4VJ8K4jEsHAFZjYK3uIQ==
X-Google-Smtp-Source: ABdhPJy6kfZEfSXCGrh5A4wnaloD225bfFxhcQ5oTpWhiseQn6qbhySBHdcspyALcniJ7j/kp/phAg==
X-Received: by 2002:a19:228a:: with SMTP id i132mr9622847lfi.178.1596925887110; 
 Sat, 08 Aug 2020 15:31:27 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id x4sm5803827ljd.34.2020.08.08.15.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 15:31:26 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 2/4 v2] drm/mcde: Support using DSI in LP mode
Date: Sun,  9 Aug 2020 00:31:20 +0200
Message-Id: <20200808223122.1492124-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200808223122.1492124-1-linus.walleij@linaro.org>
References: <20200808223122.1492124-1-linus.walleij@linaro.org>
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
Cc: newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is possible to set a flag in the struct mipi_dsi_device
so the panel is handled in low power (LP) mode. Some displays
only support this mode and it is also good for testing.

Cc: newbytee@protonmail.com
Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 76fecd7ab658..e335041e6e90 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -830,10 +830,11 @@ static void mcde_dsi_start(struct mcde_dsi *d)
 	/* Command mode, clear IF1 ID */
 	val = readl(d->regs + DSI_CMD_MODE_CTL);
 	/*
-	 * If we enable low-power mode here, with
-	 * val |= DSI_CMD_MODE_CTL_IF1_LP_EN
+	 * If we enable low-power mode here,
 	 * then display updates become really slow.
 	 */
+	if (d->mdsi->mode_flags & MIPI_DSI_MODE_LPM)
+		val |= DSI_CMD_MODE_CTL_IF1_LP_EN;
 	val &= ~DSI_CMD_MODE_CTL_IF1_ID_MASK;
 	writel(val, d->regs + DSI_CMD_MODE_CTL);
 
@@ -922,10 +923,11 @@ static void mcde_dsi_bridge_pre_enable(struct drm_bridge *bridge)
 		/* Command mode, clear IF1 ID */
 		val = readl(d->regs + DSI_CMD_MODE_CTL);
 		/*
-		 * If we enable low-power mode here with
-		 * val |= DSI_CMD_MODE_CTL_IF1_LP_EN
+		 * If we enable low-power mode here
 		 * the display updates become really slow.
 		 */
+		if (d->mdsi->mode_flags & MIPI_DSI_MODE_LPM)
+			val |= DSI_CMD_MODE_CTL_IF1_LP_EN;
 		val &= ~DSI_CMD_MODE_CTL_IF1_ID_MASK;
 		writel(val, d->regs + DSI_CMD_MODE_CTL);
 	}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
