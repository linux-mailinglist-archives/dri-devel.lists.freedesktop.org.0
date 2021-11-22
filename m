Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82554459773
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 23:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8881689CF5;
	Mon, 22 Nov 2021 22:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E5B89CF5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 22:23:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20BEB61028;
 Mon, 22 Nov 2021 22:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637619785;
 bh=d7m5O4/1nyBGt5Kh33p+oJ8bVHRAS2FfC8Aq7HlukD8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n9vM5QRuk8fadP59ElpA3ffYUxfRVicrLxNOTf6e03SjGI2V3nsfn8cy3no76jRy2
 RDW8l+sIUSCY6gvdbzO4wQ2AAfKEwEssXaTOKLN8mBgW2oC6rbb8Grgm3zn26NcITl
 4hcTr9aLhkFY3SCxz7WQc70Ko9Jp/B6+EVRTt4cSjOhtxz6FOGr83EAYftKEZg7yZT
 GnYh/33xI6Gx+eRxpaESCR5LoWgmya5WHI/acve3Woxr1X/fjCQRjNzrWaWmJ3p2s3
 Ok01FBgGD/IQQP5RVu8NbnuhF5Z+l0bB0OYW66oZ0UUqp0zstTqsn5/tPu0/YQMz8f
 LRNC3XKm0SL3w==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 05/11] dmaengine: shdma: remove legacy slave_id parsing
Date: Mon, 22 Nov 2021 23:21:57 +0100
Message-Id: <20211122222203.4103644-6-arnd@kernel.org>
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

The slave device is picked through either devicetree or a filter
function, and any remaining out-of-tree drivers would have warned
about this usage since 2015.

Stop interpreting the field finally so it can be removed from
the interface.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
2.29.2

