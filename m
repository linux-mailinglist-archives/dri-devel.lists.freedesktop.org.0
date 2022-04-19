Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC5D506DAE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90F510EF53;
	Tue, 19 Apr 2022 13:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2640010EF53
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:39:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B6FA616C1;
 Tue, 19 Apr 2022 13:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB547C385A5;
 Tue, 19 Apr 2022 13:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375563;
 bh=e/6LwBQRyYsqoQ1/3hfke8Tr/1qpFFXXNWHXWvPRr1U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iV3cqgxsdj2upxQIoK91L/txRXqfjq76PvDRmkXJrWp/FZGP3UwajNZc3LzYUXwep
 Wpjx5B2mgf8pPs8V3T9NF38UepMlWko7fW3ElDUkn1L39NbypTyjb4e3cTF2YtXtQM
 rZZBrb0moVxeTXaoNCmPZjxeZFc2BxdRbHQTb85h/EtHpKNmkXtvFfU3G1YcCDbWMG
 CVWPbZyeLymL8KTq6UQjFFxy8H40arcYLX9BtcjX8Nx5GCgnb/7f2+XzLLpVS0D1gI
 fGuz9dkWZKrYHjDKwJ8ucl3hOEywWE023+f3G2C7nEhMm4yp70/BMqYBIQ5am0gbGx
 IBMrD0Q8dumig==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 14/41] serial: 8250/omap1: include linux/soc/ti/omap1-soc.h
Date: Tue, 19 Apr 2022 15:36:56 +0200
Message-Id: <20220419133723.1394715-15-arnd@kernel.org>
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

As a preparation for cleaning up the omap1 headers, start
including linux/soc/ti/omap1-soc.h directly so we can
keep calling cpu_is_omap1510().

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/tty/serial/8250/8250.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index db784ace25d8..a8830e15a22c 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -259,6 +259,7 @@ static inline int fintek_8250_probe(struct uart_8250_port *uart) { return 0; }
 #endif
 
 #ifdef CONFIG_ARCH_OMAP1
+#include <linux/soc/ti/omap1-soc.h>
 static inline int is_omap1_8250(struct uart_8250_port *pt)
 {
 	int res;
-- 
2.29.2

