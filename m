Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE27B459763
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 23:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D687389E32;
	Mon, 22 Nov 2021 22:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6902F89E32
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 22:22:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26DA261037;
 Mon, 22 Nov 2021 22:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637619772;
 bh=zgLZXkTyZeT2yxDxiCRe3tFY2/P5W/tmmoA+2l/FQdQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vu62QhxeOG1cTVOI1XJg/cEM/6feijvDUEtMYFy8XGtjFmu3J1wivNmJYFrS1UcOV
 D+7e8/dcFQJTEA2AuE8XH0Mo5hqIkvIU7jr7CXg/xJJcBc/3gkswZgRMRHG8yZS0C6
 A3RlkUSxzEV8XzxTLRQEg6uwnlfUqY5RyXCBxp+xRMO+dd1lHyAqALGLeMHvmaTpcw
 I7KwaDzzGuTLRIA8G7Pjt3vR4BnO8qW8/WDSQVat4v/Pe4kmO2BGzBrfFp32eScXMa
 WlyfUsLnnvlA2nG0tzpq6/XyXcfBH7wJwB0PO2DRQHs2fGLdesV9Gr4tLV3qGoyVAl
 oM4+hQ4U+pU9g==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 03/11] spi: pic32: stop setting dma_config->slave_id
Date: Mon, 22 Nov 2021 23:21:55 +0100
Message-Id: <20211122222203.4103644-4-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211122222203.4103644-1-arnd@kernel.org>
References: <20211122222203.4103644-1-arnd@kernel.org>
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
Cc: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-staging@lists.linux.dev,
 Michal Simek <michal.simek@xilinx.com>, Jon Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Laxman Dewangan <ldewangan@nvidia.com>, Baolin Wang <baolin.wang7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Setting slave_id makes no sense with DT based probing, and
should eventually get removed entirely. Address this driver
by no longer setting the field here.

I could not find which DMA driver is used on PIC32, if it's
in the tree at all, but none of the obvious ones even care
about slave_id any more.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/spi/spi-pic32.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
index 5eb7b61bbb4d..f86433b29260 100644
--- a/drivers/spi/spi-pic32.c
+++ b/drivers/spi/spi-pic32.c
@@ -370,7 +370,6 @@ static int pic32_spi_dma_config(struct pic32_spi *pic32s, u32 dma_width)
 	cfg.src_addr_width = dma_width;
 	cfg.dst_addr_width = dma_width;
 	/* tx channel */
-	cfg.slave_id = pic32s->tx_irq;
 	cfg.direction = DMA_MEM_TO_DEV;
 	ret = dmaengine_slave_config(master->dma_tx, &cfg);
 	if (ret) {
@@ -378,7 +377,6 @@ static int pic32_spi_dma_config(struct pic32_spi *pic32s, u32 dma_width)
 		return ret;
 	}
 	/* rx channel */
-	cfg.slave_id = pic32s->rx_irq;
 	cfg.direction = DMA_DEV_TO_MEM;
 	ret = dmaengine_slave_config(master->dma_rx, &cfg);
 	if (ret)
-- 
2.29.2

