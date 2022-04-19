Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E11506DAF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6834510EF5F;
	Tue, 19 Apr 2022 13:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2146E10EF5F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:39:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96373616C6;
 Tue, 19 Apr 2022 13:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6057C385A7;
 Tue, 19 Apr 2022 13:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375570;
 bh=B7GGzQK0KIjiwCxoEg1dXjX6/oLgtetrXN0VV1GNBGs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TOpp36+rC0pDLis7adjFpLtRxKwHifzqT8ATqBoHM3otXvUperBtVcs1FifHc5yyB
 rqLPC7rYbjq0Cf9Ys1ZbJ2P/GGpYZjaZv29gcfAMIMSQP3xSrwfLAML/qNNhmU/GVd
 gH/ywtlMj8E5lIgxWXQ0d1WKgZnNBdasQLQRmukrsvNWTS1WfVWbNuYArE2MVzLjOQ
 7HngWtMC/2cYvIPEoUHdURPi61wEmycHnijfRFxP36EiMPOyusZ0YufgRWJ+JHp9ci
 tnu1W78uOh80vxB8EvHIbeFZxxM2wIE9VFANNL583gMp6zk/BtWTAHQhAPI0pKoXd2
 RNXWpAmIMsrlg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 15/41] input: omap: void using mach/*.h headers
Date: Tue, 19 Apr 2022 15:36:57 +0200
Message-Id: <20220419133723.1394715-16-arnd@kernel.org>
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

From: Arnd Bergmann <arnd@arndb.de>

The omap-keypad driver currently relies on including mach/memory.h
implicitly, but that won't happen once omap1 is converted to
CONFIG_ARCH_MULTIPLATFORM. Include the required header
explicitly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/keyboard/omap-keypad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/keyboard/omap-keypad.c b/drivers/input/keyboard/omap-keypad.c
index eb3a687796e7..57447d6c9007 100644
--- a/drivers/input/keyboard/omap-keypad.c
+++ b/drivers/input/keyboard/omap-keypad.c
@@ -24,6 +24,7 @@
 #include <linux/gpio.h>
 #include <linux/platform_data/gpio-omap.h>
 #include <linux/platform_data/keypad-omap.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #undef NEW_BOARD_LEARNING_MODE
 
-- 
2.29.2

