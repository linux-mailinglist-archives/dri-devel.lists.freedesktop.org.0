Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F82E8B0131
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 07:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8901137E2;
	Wed, 24 Apr 2024 05:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="osvKjhJ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C10B1137E2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 05:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1713937338; x=1745473338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EJ7HICHgLilFrtLK8BajK1eVr4wt6O4I9e6krZgg5WE=;
 b=osvKjhJ0HYIAHzy3XfYDszdEq4T+APwWehghpv5igFq8wULj6X1p3Ph8
 jkIFwB6VaSaZWoZSnOkkp7oHU+haNfnsPuebKKVlEJ2LiFWTluQzv3dKL
 fdcpWYYmVUSff3QBZlsXMlKm1sQAyJumwaoU1ta6pfhNThXKIw9ZxnNKH
 NIWYZ7srjrfeKm23WJZgx4NClp33T0oFYmSqYSY7Lo7br9+303ZUYesRD
 A8WAMJ6BJzkY4NeszkNBl8oMHZrLLpbcQNWGWjCqt2v0yhno1je6QqouZ
 XeLuj1I1EsGGRLz7seFbl2jbNaGt006SENCFVzjdY3cgdZDJ9bhO1BuBe g==;
X-CSE-ConnectionGUID: cS45O937TrSqQ6qvvirFaA==
X-CSE-MsgGUID: pHqPswsEQ4y0P+i2vFp7IQ==
X-IronPort-AV: E=Sophos;i="6.07,225,1708412400"; d="scan'208";a="22977482"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Apr 2024 22:35:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 22:34:50 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 22:34:40 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <Balamanikandan.Gunasundar@microchip.com>, 
 <Durai.ManickamKR@microchip.com>, <Nayabbasha.Sayed@microchip.com>,
 <Dharma.B@microchip.com>, <Varshini.Rajendran@microchip.com>,
 <Balakrishnan.S@microchip.com>, <Charan.Pedumuru@microchip.com>, "Manikandan
 Muralidharan" <manikandan.m@microchip.com>
Subject: [PATCH RESEND v9 3/8] drm: atmel_hlcdc: replace regmap_read with
 regmap_read_poll_timeout
Date: Wed, 24 Apr 2024 11:03:46 +0530
Message-ID: <20240424053351.589830-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424053351.589830-1-manikandan.m@microchip.com>
References: <20240424053351.589830-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Replace regmap_read with regmap_read_poll_timeout to neatly handle
retries

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 44 +++++++++++--------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index cc5cf4c2faf7..b229692a27ca 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -203,19 +203,22 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
 	pm_runtime_get_sync(dev->dev);
 
 	regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_DISP);
-	while (!regmap_read(regmap, ATMEL_HLCDC_SR, &status) &&
-	       (status & ATMEL_HLCDC_DISP))
-		cpu_relax();
+	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
+				     !(status & ATMEL_HLCDC_DISP),
+				    10, 1000))
+		dev_warn(dev->dev, "Atmel LCDC status register DISPSTS timeout\n");
 
 	regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_SYNC);
-	while (!regmap_read(regmap, ATMEL_HLCDC_SR, &status) &&
-	       (status & ATMEL_HLCDC_SYNC))
-		cpu_relax();
+	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
+				     !(status & ATMEL_HLCDC_SYNC),
+				    10, 1000))
+		dev_warn(dev->dev, "Atmel LCDC status register LCDSTS timeout\n");
 
 	regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_PIXEL_CLK);
-	while (!regmap_read(regmap, ATMEL_HLCDC_SR, &status) &&
-	       (status & ATMEL_HLCDC_PIXEL_CLK))
-		cpu_relax();
+	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
+				     !(status & ATMEL_HLCDC_PIXEL_CLK),
+				    10, 1000))
+		dev_warn(dev->dev, "Atmel LCDC status register CLKSTS timeout\n");
 
 	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
 	pinctrl_pm_select_sleep_state(dev->dev);
@@ -241,20 +244,23 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
 	clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
 
 	regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_PIXEL_CLK);
-	while (!regmap_read(regmap, ATMEL_HLCDC_SR, &status) &&
-	       !(status & ATMEL_HLCDC_PIXEL_CLK))
-		cpu_relax();
-
+	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
+				     status & ATMEL_HLCDC_PIXEL_CLK,
+				     10, 1000))
+		dev_warn(dev->dev, "Atmel LCDC status register CLKSTS timeout\n");
 
 	regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_SYNC);
-	while (!regmap_read(regmap, ATMEL_HLCDC_SR, &status) &&
-	       !(status & ATMEL_HLCDC_SYNC))
-		cpu_relax();
+	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
+				     status & ATMEL_HLCDC_SYNC,
+				     10, 1000))
+		dev_warn(dev->dev, "Atmel LCDC status register LCDSTS timeout\n");
 
 	regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_DISP);
-	while (!regmap_read(regmap, ATMEL_HLCDC_SR, &status) &&
-	       !(status & ATMEL_HLCDC_DISP))
-		cpu_relax();
+	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
+				     status & ATMEL_HLCDC_DISP,
+				     10, 1000))
+		dev_warn(dev->dev, "Atmel LCDC status register DISPSTS timeout\n");
+
 
 	pm_runtime_put_sync(dev->dev);
 
-- 
2.25.1

