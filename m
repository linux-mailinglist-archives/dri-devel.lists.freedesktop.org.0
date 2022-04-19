Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 604DF506DC9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF7510EFFE;
	Tue, 19 Apr 2022 13:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DF810EFFD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:42:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B38B61710;
 Tue, 19 Apr 2022 13:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C17C385B1;
 Tue, 19 Apr 2022 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375744;
 bh=W3qNGAAX2ECL+9vJh3xisWUOh4fEYqZMZtajKR6sclM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SKr7WyMGRCWl7v/bvtIsgn5/V3JSlMflq4Q/DrYtsnDWWlhOP2f/QZz/mAStrQbfv
 OSwRVbecQTirW0bkg8ct8ZX3ZvidG0fdpIIrdb2ikG6e1iNCk3oIpODN2KEsBn4jaL
 iL1TEBzQNkc83ablhzvNcTWLRxSQzhIsMUM2UfvRw82yolwxFIjf4Y+jmK8MZi28dA
 ifEP8JGP4wd2T+YWPd4y4nvn8O71HicpNzx1mj7AHN8SDPpjQNwTaZ+3S7klD2C0Uk
 BJ3IJCwHBlprKwQ/njIgRCNqvECW/GFDYnEeMMMA/9HeNtfHcZKV7YKlqEhQpUs3u3
 p4wr3YRVJnM7w==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 38/41] [MERGED] mmc: omap: Make it CCF clk API compatible
Date: Tue, 19 Apr 2022 15:37:20 +0200
Message-Id: <20220419133723.1394715-39-arnd@kernel.org>
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

The driver, OMAP specific, now omits clk_prepare/unprepare() steps, not
supported by OMAP custom implementation of clock API.  However, non-CCF
stubs of those functions exist for use on such platforms until converted
to CCF.

Update the driver to be compatible with CCF implementation of clock API.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mmc/host/omap.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index 5e5af34090f1..57d39283924d 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -1374,7 +1374,7 @@ static int mmc_omap_probe(struct platform_device *pdev)
 	host->iclk = clk_get(&pdev->dev, "ick");
 	if (IS_ERR(host->iclk))
 		return PTR_ERR(host->iclk);
-	clk_enable(host->iclk);
+	clk_prepare_enable(host->iclk);
 
 	host->fclk = clk_get(&pdev->dev, "fck");
 	if (IS_ERR(host->fclk)) {
@@ -1382,16 +1382,18 @@ static int mmc_omap_probe(struct platform_device *pdev)
 		goto err_free_iclk;
 	}
 
+	ret = clk_prepare(host->fclk);
+	if (ret)
+		goto err_put_fclk;
+
 	host->dma_tx_burst = -1;
 	host->dma_rx_burst = -1;
 
 	host->dma_tx = dma_request_chan(&pdev->dev, "tx");
 	if (IS_ERR(host->dma_tx)) {
 		ret = PTR_ERR(host->dma_tx);
-		if (ret == -EPROBE_DEFER) {
-			clk_put(host->fclk);
-			goto err_free_iclk;
-		}
+		if (ret == -EPROBE_DEFER)
+			goto err_free_fclk;
 
 		host->dma_tx = NULL;
 		dev_warn(host->dev, "TX DMA channel request failed\n");
@@ -1403,8 +1405,7 @@ static int mmc_omap_probe(struct platform_device *pdev)
 		if (ret == -EPROBE_DEFER) {
 			if (host->dma_tx)
 				dma_release_channel(host->dma_tx);
-			clk_put(host->fclk);
-			goto err_free_iclk;
+			goto err_free_fclk;
 		}
 
 		host->dma_rx = NULL;
@@ -1454,9 +1455,12 @@ static int mmc_omap_probe(struct platform_device *pdev)
 		dma_release_channel(host->dma_tx);
 	if (host->dma_rx)
 		dma_release_channel(host->dma_rx);
+err_free_fclk:
+	clk_unprepare(host->fclk);
+err_put_fclk:
 	clk_put(host->fclk);
 err_free_iclk:
-	clk_disable(host->iclk);
+	clk_disable_unprepare(host->iclk);
 	clk_put(host->iclk);
 	return ret;
 }
@@ -1476,8 +1480,9 @@ static int mmc_omap_remove(struct platform_device *pdev)
 
 	mmc_omap_fclk_enable(host, 0);
 	free_irq(host->irq, host);
+	clk_unprepare(host->fclk);
 	clk_put(host->fclk);
-	clk_disable(host->iclk);
+	clk_disable_unprepare(host->iclk);
 	clk_put(host->iclk);
 
 	if (host->dma_tx)
-- 
2.29.2

