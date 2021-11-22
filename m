Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF74045977D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 23:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED4889D9B;
	Mon, 22 Nov 2021 22:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AEF89E5A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 22:23:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1651060FE6;
 Mon, 22 Nov 2021 22:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637619798;
 bh=McpWp/4AcEZeBd39ynQN6eTYVALGVNvs8cD8tBGVm+Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rpP6eKOrl9dj0+CGG0X5A92xrHnDtIWKLHyPyGZsCeDj6+Y3LlX4ce9t+tYu5Utwc
 GAD/Dm5Ge6oMPjFnQSe7UC4zsOfp19LJfRk9htLP7pl58RZUdw4odqBlhALUfyEkPP
 qLyhySmSJtoWdnOXs2KUJIGAxo1Y++knYawaZrSKgfizR+WGB/R0Co73Hc2RCgB+E0
 SnKiJkIj+uf0eSIppmJ/1Qu+fX8RKmW186XR2XxbrB1rlTFDwIKlQBRQYQBOkHt4mL
 PvQ4jmOgipvUVh2E0J+xZnDuaSHyDWJVEg2FeTDb2h+g2D3rOu3i4dwNJrZUZKWxqT
 E58/3dIDp/niw==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 07/11] dmaengine: sprd: stop referencing config->slave_id
Date: Mon, 22 Nov 2021 23:21:59 +0100
Message-Id: <20211122222203.4103644-8-arnd@kernel.org>
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

It appears that the code that reads the slave_id from the channel config
was copied incorrectly from other drivers. Nothing ever sets this field
on platforms that use this driver, so remove the reference.

Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/sprd-dma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 4357d2395e6b..7f158ef5672d 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -795,9 +795,6 @@ static int sprd_dma_fill_desc(struct dma_chan *chan,
 		return dst_datawidth;
 	}
 
-	if (slave_cfg->slave_id)
-		schan->dev_id = slave_cfg->slave_id;
-
 	hw->cfg = SPRD_DMA_DONOT_WAIT_BDONE << SPRD_DMA_WAIT_BDONE_OFFSET;
 
 	/*
-- 
2.29.2

