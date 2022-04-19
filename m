Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC93506DC8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D0C10F015;
	Tue, 19 Apr 2022 13:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF69D10EFFE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:42:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D7E261708;
 Tue, 19 Apr 2022 13:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E3AC385B2;
 Tue, 19 Apr 2022 13:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375736;
 bh=ICLjpcLGmyRuFirMful6PPWmOkZPtiGZzfFqAVH/t+Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hvhVwA0NzLazBIGSe0oT0p3Um3CHpAVWQS3Ak93wRIZbI7fSuj4m8N5nOBDcUeqPR
 gg6oecruNrCF+lKyJ22gDsDgeD4f58TkcrVcOJhpEfQKq0l9fXJUZDysrlPaAYrYdy
 HM2+bS3l9baDro+/uv1y7gBVl8ayYnO98JhJ4qhRzGc7g0eh0bUu4K1jPLqmuVD72I
 Tta1ve3oS40cpTyjsSDol1Hce510U2JEw+ghqj9X7GZYYmv/pk7FjMOMYyKc88H2iq
 raBSAsmMH65yZss3CrvJXSegF1I1GYazdtvupzXRVR7szoVBxpQBB73wWmN7W1YYGv
 JDzzUYpxD+HAw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 37/41] [MERGED] video: fbdev: omap: Make it CCF clk API
 compatible
Date: Tue, 19 Apr 2022 15:37:19 +0200
Message-Id: <20220419133723.1394715-38-arnd@kernel.org>
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

OMAP1 LCDC drivers now omit clk_prepare/unprepare() steps, not supported
by OMAP1 custom implementation of clock API.  However, non-CCF stubs of
those functions exist for use on such platforms until converted to CCF.

Update the drivers to be compatible with CCF implementation of clock API.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/omap/hwa742.c | 6 +++---
 drivers/video/fbdev/omap/lcdc.c   | 6 +++---
 drivers/video/fbdev/omap/sossi.c  | 5 +++--
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/omap/hwa742.c b/drivers/video/fbdev/omap/hwa742.c
index b191bef22d98..9d9fe5c3a7a1 100644
--- a/drivers/video/fbdev/omap/hwa742.c
+++ b/drivers/video/fbdev/omap/hwa742.c
@@ -964,7 +964,7 @@ static int hwa742_init(struct omapfb_device *fbdev, int ext_mode,
 	if ((r = calc_extif_timings(ext_clk, &extif_mem_div)) < 0)
 		goto err3;
 	hwa742.extif->set_timings(&hwa742.reg_timings);
-	clk_enable(hwa742.sys_ck);
+	clk_prepare_enable(hwa742.sys_ck);
 
 	calc_hwa742_clk_rates(ext_clk, &sys_clk, &pix_clk);
 	if ((r = calc_extif_timings(sys_clk, &extif_mem_div)) < 0)
@@ -1023,7 +1023,7 @@ static int hwa742_init(struct omapfb_device *fbdev, int ext_mode,
 
 	return 0;
 err4:
-	clk_disable(hwa742.sys_ck);
+	clk_disable_unprepare(hwa742.sys_ck);
 err3:
 	hwa742.extif->cleanup();
 err2:
@@ -1037,7 +1037,7 @@ static void hwa742_cleanup(void)
 	hwa742_set_update_mode(OMAPFB_UPDATE_DISABLED);
 	hwa742.extif->cleanup();
 	hwa742.int_ctrl->cleanup();
-	clk_disable(hwa742.sys_ck);
+	clk_disable_unprepare(hwa742.sys_ck);
 }
 
 struct lcd_ctrl hwa742_ctrl = {
diff --git a/drivers/video/fbdev/omap/lcdc.c b/drivers/video/fbdev/omap/lcdc.c
index 4c9091bd936d..e7ce783e5215 100644
--- a/drivers/video/fbdev/omap/lcdc.c
+++ b/drivers/video/fbdev/omap/lcdc.c
@@ -713,7 +713,7 @@ static int omap_lcdc_init(struct omapfb_device *fbdev, int ext_mode,
 		dev_err(fbdev->dev, "failed to adjust LCD rate\n");
 		goto fail1;
 	}
-	clk_enable(lcdc.lcd_ck);
+	clk_prepare_enable(lcdc.lcd_ck);
 
 	r = request_irq(fbdev->int_irq, lcdc_irq_handler, 0, MODULE_NAME, fbdev);
 	if (r) {
@@ -748,7 +748,7 @@ static int omap_lcdc_init(struct omapfb_device *fbdev, int ext_mode,
 fail3:
 	free_irq(fbdev->int_irq, lcdc.fbdev);
 fail2:
-	clk_disable(lcdc.lcd_ck);
+	clk_disable_unprepare(lcdc.lcd_ck);
 fail1:
 	clk_put(lcdc.lcd_ck);
 fail0:
@@ -762,7 +762,7 @@ static void omap_lcdc_cleanup(void)
 	free_fbmem();
 	omap_free_lcd_dma();
 	free_irq(lcdc.fbdev->int_irq, lcdc.fbdev);
-	clk_disable(lcdc.lcd_ck);
+	clk_disable_unprepare(lcdc.lcd_ck);
 	clk_put(lcdc.lcd_ck);
 }
 
diff --git a/drivers/video/fbdev/omap/sossi.c b/drivers/video/fbdev/omap/sossi.c
index 6b99d89fbe6e..c90eb8ca58af 100644
--- a/drivers/video/fbdev/omap/sossi.c
+++ b/drivers/video/fbdev/omap/sossi.c
@@ -600,7 +600,7 @@ static int sossi_init(struct omapfb_device *fbdev)
 	l &= ~CONF_SOSSI_RESET_R;
 	omap_writel(l, MOD_CONF_CTRL_1);
 
-	clk_enable(sossi.fck);
+	clk_prepare_enable(sossi.fck);
 	l = omap_readl(ARM_IDLECT2);
 	l &= ~(1 << 8);			/* DMACK_REQ */
 	omap_writel(l, ARM_IDLECT2);
@@ -651,7 +651,7 @@ static int sossi_init(struct omapfb_device *fbdev)
 	return 0;
 
 err:
-	clk_disable(sossi.fck);
+	clk_disable_unprepare(sossi.fck);
 	clk_put(sossi.fck);
 	return r;
 }
@@ -659,6 +659,7 @@ static int sossi_init(struct omapfb_device *fbdev)
 static void sossi_cleanup(void)
 {
 	omap_lcdc_free_dma_callback();
+	clk_unprepare(sossi.fck);
 	clk_put(sossi.fck);
 	iounmap(sossi.base);
 }
-- 
2.29.2

