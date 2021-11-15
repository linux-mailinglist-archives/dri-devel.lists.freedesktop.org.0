Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDEB450067
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 09:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25926E97B;
	Mon, 15 Nov 2021 08:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865C26E972
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 08:55:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C1DE63227;
 Mon, 15 Nov 2021 08:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636966506;
 bh=6T6nVYUZYeuHx0KVvy6d2aAfM4hqSW/xkD9UxCrEiew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XE1rkoS26Hg1qVOUe/8JhihPWyqzwdxtSu6KpZSliRxpkj1mrD33TUzc4f3D7Z563
 QLiO1buUzxFjE4Smwu3DKTXQuDLm+gytZAgIqSOnAvyzoAXeDNMVaxRSz5FfYVxdzx
 fxlDZ6etPDPs4+Tui9Els9qLGXd+sLiGd5gsTfkJ6/smITicktBYHNkHB4AAvmw0pc
 NRLtSgumom3wapnQ8lOIVnzIUsTm+82JiaSwVIuKcuOx5tpNurM5w5orGkJkyh4UkT
 ImBiCpR78cdAYk6E0uXXpxENctgamiDTvLJByR5cyn6kcnDn0EUp+6TdkBa4HYzUNn
 uP4cknrvguDtA==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 03/11] mmc: bcm2835: stop setting chan_config->slave_id
Date: Mon, 15 Nov 2021 09:53:55 +0100
Message-Id: <20211115085403.360194-4-arnd@kernel.org>
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

The field is not interpreted by the DMA engine driver, as all the data
is passed from devicetree instead. Remove the assignment so the field
can eventually be deleted.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mmc/host/bcm2835.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index 8c2361e66277..463b707d9e99 100644
--- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -1293,14 +1293,12 @@ static int bcm2835_add_host(struct bcm2835_host *host)
 
 		host->dma_cfg_tx.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 		host->dma_cfg_tx.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-		host->dma_cfg_tx.slave_id = 13;		/* DREQ channel */
 		host->dma_cfg_tx.direction = DMA_MEM_TO_DEV;
 		host->dma_cfg_tx.src_addr = 0;
 		host->dma_cfg_tx.dst_addr = host->phys_addr + SDDATA;
 
 		host->dma_cfg_rx.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 		host->dma_cfg_rx.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-		host->dma_cfg_rx.slave_id = 13;		/* DREQ channel */
 		host->dma_cfg_rx.direction = DMA_DEV_TO_MEM;
 		host->dma_cfg_rx.src_addr = host->phys_addr + SDDATA;
 		host->dma_cfg_rx.dst_addr = 0;
-- 
2.30.2

