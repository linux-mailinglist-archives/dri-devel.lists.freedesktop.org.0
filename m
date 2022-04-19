Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10702506DA3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD34710EF2E;
	Tue, 19 Apr 2022 13:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1452410EF1D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:38:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9631F616A1;
 Tue, 19 Apr 2022 13:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F89C385A5;
 Tue, 19 Apr 2022 13:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375488;
 bh=MZYlA7Z/cfhwWB+m0aX3wfxPDdGSvAoxapWbog01ZUk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MdZyrL2KRzGofp4P5QTIbBmZ0XyiPDEb8w8y28sLj+tarhQKLn07vB63wnc/YADun
 PU7PvbaS3DDxQTwk4r5YG2+bHNT4S4FLmZ/oPTK7Gd5u14hl/54byIoriPsb1/0/j9
 B7tlavvL9imuJwBR+QRCpa1TkY5grKm440xc2QgNCXswxLctzeCsUmzlGTTgKIm64y
 deeYlDPZvYme04F6wXyybloglv6pE3/opuw9/Y/kzutWgv3lWUPl2TFn1k/LeqS+T+
 pc0fhu1DxU6BEdl20vjgvKKR5517wr05DaOEJuhu+i3bk7HLcp24nnQYomoQZOSYSL
 c+2Hz7W+Q/R+g==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 04/41] ARM: omap1: declare a dummy omap_set_dma_priority
Date: Tue, 19 Apr 2022 15:36:46 +0200
Message-Id: <20220419133723.1394715-5-arnd@kernel.org>
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
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Jingoo Han <jingoohan1@gmail.com>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

omapfb calls directly into the omap_set_dma_priority() function in
the DMA driver. This prevents compile-testing omapfb on other
architectures. Add an inline function next to the other ones
for non-omap configurations.

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/omap-dma.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/omap-dma.h b/include/linux/omap-dma.h
index 441f5f0919c6..5e228428fda1 100644
--- a/include/linux/omap-dma.h
+++ b/include/linux/omap-dma.h
@@ -338,6 +338,9 @@ static inline int omap_lcd_dma_running(void)
 #endif
 
 #else /* CONFIG_ARCH_OMAP */
+static inline void omap_set_dma_priority(int lch, int dst_port, int priority)
+{
+}
 
 static inline struct omap_system_dma_plat_info *omap_get_plat_info(void)
 {
-- 
2.29.2

