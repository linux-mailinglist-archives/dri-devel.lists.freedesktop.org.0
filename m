Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BD7506DC5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6189F10F008;
	Tue, 19 Apr 2022 13:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90D110F003
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:42:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 85E94B8197F;
 Tue, 19 Apr 2022 13:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D256C385A5;
 Tue, 19 Apr 2022 13:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375722;
 bh=b8M7Htp8PC1M3UqN4COpkh3W696Svq9K1vaNWm/6ehg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WO+hx1jvcO8sNvVYXwtk9yzViyIi/AeD0vyEdyCzAJ0epFG3OGq2Fn7Q2EGQVFZtL
 lxuUOfpn5uHFQi9GsZUgd6pDtHMGP4raATiMUNW5ZDgt1Mx2Nw3Wma2I/LO2HpIx7E
 xUcwEuvzj7umr7FkY4CRlMIXjMQvfrB/eUY+gzYzcxeP8V0TSSePzn/s5Bzv+cR+NL
 E7plBnP5gpO17xOQMhGm9BvxgJ5ifb3qFbpNxGlNnaeWblY970wnie8dXu9AYsKFAH
 ZR4rCJZff8i/YehkU19EDTDNz/bmaatCQOWZ7ZUnBrKD8BeNNfnxpY761tWUDxDIY6
 FSC+791LABy0A==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 35/41] usb: host: ohci-omap: Make it CCF clk API compatible
Date: Tue, 19 Apr 2022 15:37:17 +0200
Message-Id: <20220419133723.1394715-36-arnd@kernel.org>
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
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/host/ohci-omap.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index 069791d25abb..f5bc9c8bdc9a 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -259,6 +259,10 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 		goto err_put_hcd;
 	}
 
+	retval = clk_prepare(priv->usb_host_ck);
+	if (retval)
+		goto err_put_host_ck;
+
 	if (!cpu_is_omap15xx())
 		priv->usb_dc_ck = clk_get(&pdev->dev, "usb_dc_ck");
 	else
@@ -266,13 +270,17 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 
 	if (IS_ERR(priv->usb_dc_ck)) {
 		retval = PTR_ERR(priv->usb_dc_ck);
-		goto err_put_host_ck;
+		goto err_unprepare_host_ck;
 	}
 
+	retval = clk_prepare(priv->usb_dc_ck);
+	if (retval)
+		goto err_put_dc_ck;
+
 	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
 		dev_dbg(&pdev->dev, "request_mem_region failed\n");
 		retval = -EBUSY;
-		goto err_put_dc_ck;
+		goto err_unprepare_dc_ck;
 	}
 
 	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
@@ -297,8 +305,12 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 	iounmap(hcd->regs);
 err2:
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
+err_unprepare_dc_ck:
+	clk_unprepare(priv->usb_dc_ck);
 err_put_dc_ck:
 	clk_put(priv->usb_dc_ck);
+err_unprepare_host_ck:
+	clk_unprepare(priv->usb_host_ck);
 err_put_host_ck:
 	clk_put(priv->usb_host_ck);
 err_put_hcd:
@@ -333,7 +345,9 @@ static int ohci_hcd_omap_remove(struct platform_device *pdev)
 	}
 	iounmap(hcd->regs);
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
+	clk_unprepare(priv->usb_dc_ck);
 	clk_put(priv->usb_dc_ck);
+	clk_unprepare(priv->usb_host_ck);
 	clk_put(priv->usb_host_ck);
 	usb_put_hcd(hcd);
 	return 0;
-- 
2.29.2

