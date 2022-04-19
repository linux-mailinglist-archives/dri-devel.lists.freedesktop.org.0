Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7252F506DC6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123E310F050;
	Tue, 19 Apr 2022 13:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3407410EFFD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:42:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B65C861712;
 Tue, 19 Apr 2022 13:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C584EC385AF;
 Tue, 19 Apr 2022 13:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375729;
 bh=Nld9/TUbdgbuYnE7Z7eTyTcTbCiTvbx9DCX+XPf/dIk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fTaW3ZmdkeE3M3MSimua2kQNujfUwk186UwRzP9feCXD7A+q0u7XKDY/iN7u67RMI
 /AWDexKMBep9fzvxSbNH4rFQvJW4X70cPKHbziWo9zYxu4dheQ24oukIZKWAh8DZA6
 G7AHSK8r2efuyEv8w5DHvzk2D7nULMqc1uRCM6XYyi22XTK9k/NAuvFApEZoC1QcJo
 UH6QNxvMI8+ltP6+J4YHtROdU3WWDzA7+Awo68f+DUWX04woHy9iwLoJQCA/wwXqZK
 CQBhDEmafMImWeCYVDSlKu5aMItJmzaoZNI+PtUjVqnuByOBHAfhzWLLIyM7DBeWKU
 pUR94w4Aj7p7Q==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 36/41] usb: gadget: omap_udc: Make it CCF clk API compatible
Date: Tue, 19 Apr 2022 15:37:18 +0200
Message-Id: <20220419133723.1394715-37-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Janusz Krzysztofik <jmkrzyszt@gmail.com>

The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
supported by OMAP1 custom implementation of clock API.  However, non-CCF
stubs of those functions exist for use on such platforms until converted
to CCF.

Update the driver to be compatible with CCF implementation of clock API.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/gadget/udc/omap_udc.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index 5096d24915ce..9ee472937482 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -2609,6 +2609,8 @@ static void omap_udc_release(struct device *dev)
 	if (udc->dc_clk) {
 		if (udc->clk_requested)
 			omap_udc_enable_clock(0);
+		clk_unprepare(udc->hhc_clk);
+		clk_unprepare(udc->dc_clk);
 		clk_put(udc->hhc_clk);
 		clk_put(udc->dc_clk);
 	}
@@ -2773,8 +2775,8 @@ static int omap_udc_probe(struct platform_device *pdev)
 		hhc_clk = clk_get(&pdev->dev, "usb_hhc_ck");
 		BUG_ON(IS_ERR(dc_clk) || IS_ERR(hhc_clk));
 		/* can't use omap_udc_enable_clock yet */
-		clk_enable(dc_clk);
-		clk_enable(hhc_clk);
+		clk_prepare_enable(dc_clk);
+		clk_prepare_enable(hhc_clk);
 		udelay(100);
 	}
 
@@ -2783,8 +2785,8 @@ static int omap_udc_probe(struct platform_device *pdev)
 		hhc_clk = clk_get(&pdev->dev, "l3_ocpi_ck");
 		BUG_ON(IS_ERR(dc_clk) || IS_ERR(hhc_clk));
 		/* can't use omap_udc_enable_clock yet */
-		clk_enable(dc_clk);
-		clk_enable(hhc_clk);
+		clk_prepare_enable(dc_clk);
+		clk_prepare_enable(hhc_clk);
 		udelay(100);
 	}
 
@@ -2932,8 +2934,8 @@ static int omap_udc_probe(struct platform_device *pdev)
 		usb_put_phy(xceiv);
 
 	if (cpu_is_omap16xx() || cpu_is_omap7xx()) {
-		clk_disable(hhc_clk);
-		clk_disable(dc_clk);
+		clk_disable_unprepare(hhc_clk);
+		clk_disable_unprepare(dc_clk);
 		clk_put(hhc_clk);
 		clk_put(dc_clk);
 	}
-- 
2.29.2

