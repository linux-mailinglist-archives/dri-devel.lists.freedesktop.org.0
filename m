Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D439924C6C8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 22:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A7C6E34A;
	Thu, 20 Aug 2020 20:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60856E34A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 20:32:26 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 185so3539638ljj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 13:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B+5a4asgciydQamginfFinQ+btRZ3Gtdmbm4xtiLW3k=;
 b=iH+WC0dpspVp4Kujk/eflrBrTJcLLuI+Fplk7cxI7tkrBRdZ3hrsQlPv0OQFZ42TO8
 b9Tr3UawzJrM0BxazjSu8IDRzkBYvwO93OLSrxcOItslUnjPTHZXPOq7nYAnkS/ru0kH
 Fq9X+kvbHWIzm3gCz1FnzTpv0lEqOz28rz3JWqL9rKSdHLwS1AyIToOFsBcKPqDNqLMl
 jTxTC5unRSNGzrljfauGPLEUKW7lwVY2TFR3evbv9BIvjw6OgjlM5YVJfsJs6x1tubPO
 NDrE3YmsAk1ChtcKnlMY+5ExvWQMuJA/04gjJ8StOr0tx7znVX0nMza97Fd2xYMTdUsY
 Er7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B+5a4asgciydQamginfFinQ+btRZ3Gtdmbm4xtiLW3k=;
 b=CznN3K/u8zcvJROE0qEDcdA115RE6Iccku0irN6zaeVV26WUCD7ecNR87FN3nFNWvB
 SAfxkdtFRP6h3vJkBt3AN6muTelUxmg+9j7UQXOWQggOifCn4AtFMN7UUjJ15P/EIYF5
 YPZFgV7b7hHHrNWt/0Ous4ZeABMK9gBjm/LOxdL0EdEbVrQsr8cVDR7xADSmGdvE+ro2
 S2aDLZF6bfLK/7qOKerhlRc2r2SlslvafVB7MChf21vGSxizsHJBi0biFqTi0I4Dg+ht
 xyyHY00TMPEk5qt4Kgt8vJDZJ9r1qqpDMH87l5kL1PeOu9+A4obMUVsg6QrNC+46URTO
 wj2A==
X-Gm-Message-State: AOAM531Bqb9NrpJacKZUKmN5Ssx2qKJPqxZhiwB1SB/Nkw08nEGxFwC4
 f29HYaqX5RPP08faO84zpj+yEMPakInDQQ==
X-Google-Smtp-Source: ABdhPJy2YjlpMxO7ibMb5AcpXuRxoYaYQ284dZC9M+05E1nyqoxVgj7TWg/zBhq4qzgfl+LZ71Ecww==
X-Received: by 2002:a2e:b546:: with SMTP id a6mr32533ljn.284.1597955544965;
 Thu, 20 Aug 2020 13:32:24 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id x205sm705261lfa.96.2020.08.20.13.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 13:32:24 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/tve200: Stabilize enable/disable
Date: Thu, 20 Aug 2020 22:31:44 +0200
Message-Id: <20200820203144.271081-1-linus.walleij@linaro.org>
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
Cc: stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TVE200 will occasionally print a bunch of lost interrupts
and similar dmesg messages, sometimes during boot and sometimes
after disabling and coming back to enablement. This is probably
because the hardware is left in an unknown state by the boot
loader that displays a logo.

This can be fixed by bringing the controller into a known state
by resetting the controller while enabling it. We retry reset 5
times like the vendor driver does. We also put the controller
into reset before de-clocking it and clear all interrupts before
enabling the vblank IRQ.

This makes the video enable/disable/enable cycle rock solid
on the D-Link DIR-685. Tested extensively.

Cc: stable@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/tve200/tve200_display.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tve200/tve200_display.c
index d733bbc4ac0e..17ff24d999d1 100644
--- a/drivers/gpu/drm/tve200/tve200_display.c
+++ b/drivers/gpu/drm/tve200/tve200_display.c
@@ -14,6 +14,7 @@
 #include <linux/version.h>
 #include <linux/dma-buf.h>
 #include <linux/of_graph.h>
+#include <linux/delay.h>
 
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fourcc.h>
@@ -130,9 +131,25 @@ static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
 	struct drm_connector *connector = priv->connector;
 	u32 format = fb->format->format;
 	u32 ctrl1 = 0;
+	int retries;
 
 	clk_prepare_enable(priv->clk);
 
+	/* Reset the TVE200 and wait for it to come back online */
+	writel(TVE200_CTRL_4_RESET, priv->regs + TVE200_CTRL_4);
+	for (retries = 0; retries < 5; retries++) {
+		usleep_range(30000, 50000);
+		if (readl(priv->regs + TVE200_CTRL_4) & TVE200_CTRL_4_RESET)
+			continue;
+		else
+			break;
+	}
+	if (retries == 5 &&
+	    readl(priv->regs + TVE200_CTRL_4) & TVE200_CTRL_4_RESET) {
+		dev_err(drm->dev, "can't get hardware out of reset\n");
+		return;
+	}
+
 	/* Function 1 */
 	ctrl1 |= TVE200_CTRL_CSMODE;
 	/* Interlace mode for CCIR656: parameterize? */
@@ -230,8 +247,9 @@ static void tve200_display_disable(struct drm_simple_display_pipe *pipe)
 
 	drm_crtc_vblank_off(crtc);
 
-	/* Disable and Power Down */
+	/* Disable put into reset and Power Down */
 	writel(0, priv->regs + TVE200_CTRL);
+	writel(TVE200_CTRL_4_RESET, priv->regs + TVE200_CTRL_4);
 
 	clk_disable_unprepare(priv->clk);
 }
@@ -279,6 +297,8 @@ static int tve200_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 	struct drm_device *drm = crtc->dev;
 	struct tve200_drm_dev_private *priv = drm->dev_private;
 
+	/* Clear any IRQs and enable */
+	writel(0xFF, priv->regs + TVE200_INT_CLR);
 	writel(TVE200_INT_V_STATUS, priv->regs + TVE200_INT_EN);
 	return 0;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
