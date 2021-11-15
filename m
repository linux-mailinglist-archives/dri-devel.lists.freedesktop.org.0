Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E3450068
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 09:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B4C6E975;
	Mon, 15 Nov 2021 08:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE27A6E975
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 08:55:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A02B96322E;
 Mon, 15 Nov 2021 08:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636966512;
 bh=0aNffjFyOwM4u0Oo7aAQAYOuioDBDQQgvS3dt9nDAoY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lAj0mIyHUENlkP6yrlZxkqYSD5hocgglcT83E2dvJW5vsfypS+bCmhcsFYUNOkxLb
 VGm36iEtIrx5MsVBXb22F/vG+l2XPNfSwWhLmNnpXY2YEg1WtV9h7uDQ4GwxtuNv9L
 drDvkpdeYSJiDY3sEkXjDYk0eXhjJUhkOOej7yEfUcc6kxARiOwLRZ91ApCbkZq51a
 1DlM4aygC8K+7tMPsuyHuPXgtlhUMsrKFmzWe5QnTopYr5GRXxpXJp9kRg4sUJG2px
 7btIXMzPZaupxro9KeNOsc8eN7Q4CrodjLRdG9uMjUnyKFs+UCAV79ctDov27Vvgoc
 1WIStRJ1SW5ww==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 04/11] dmaengine: shdma: remove legacy slave_id parsing
Date: Mon, 15 Nov 2021 09:53:56 +0100
Message-Id: <20211115085403.360194-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211115085403.360194-1-arnd@kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
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

The slave device is picked through either devicetree or a filter
function, and any remaining out-of-tree drivers would have warned
about this usage since 2015.

Stop interpreting the field finally so it can be removed from
the interface.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/sh/shdma-base.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/dma/sh/shdma-base.c b/drivers/dma/sh/shdma-base.c
index 7f72b3f4cd1a..41c6bc650fa3 100644
--- a/drivers/dma/sh/shdma-base.c
+++ b/drivers/dma/sh/shdma-base.c
@@ -786,14 +786,6 @@ static int shdma_config(struct dma_chan *chan,
 	if (!config)
 		return -EINVAL;
 
-	/*
-	 * overriding the slave_id through dma_slave_config is deprecated,
-	 * but possibly some out-of-tree drivers still do it.
-	 */
-	if (WARN_ON_ONCE(config->slave_id &&
-			 config->slave_id != schan->real_slave_id))
-		schan->real_slave_id = config->slave_id;
-
 	/*
 	 * We could lock this, but you shouldn't be configuring the
 	 * channel, while using it...
-- 
2.30.2

