Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CDA459755
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 23:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A316E89E1B;
	Mon, 22 Nov 2021 22:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E2289E1B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 22:22:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4ED860F51;
 Mon, 22 Nov 2021 22:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637619765;
 bh=DkH2C/0N1WYbkBTHTcXs+UoiXTHoHZhSHgkMmx0w2Xc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G2Oxdt95V8shdcCR4rf8/SnteVMCqPXu7ONpufFbqQSZlnD5v72OrbusBId0aTBCO
 pP7ckP/ytX0pvpQkWJncqKZTFopWpfw907t6DuIdqszCUJmEH0P8XVWEEcD9/Gc22x
 BsbBGBjcTwnJPUC00tjAyAiRRBB7Q+yLxDG1vNK4N+lQXd5vI+hHx06boyzMJ/jE1f
 5y/7vYtfL+uUibDbJ2SibZOim3YzH9m1BDyOZhEEUVCJq5dBjszMoc2+aYldAVpLgw
 ihYtpESUekvfxtkIZRBiMxX1y99UhIOUT9S4tCllpAW1AaavTuWHc9Nz22S82Orn3v
 7aynnt3oUMzkw==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 02/11] ASoC: dai_dma: remove slave_id field
Date: Mon, 22 Nov 2021 23:21:54 +0100
Message-Id: <20211122222203.4103644-3-arnd@kernel.org>
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

This field is no longer set from any driver now, so remove the
last references as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/sound/dmaengine_pcm.h | 2 --
 sound/core/pcm_dmaengine.c    | 5 ++---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index 9144bd547851..7403870c28bd 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -58,7 +58,6 @@ struct dma_chan *snd_dmaengine_pcm_get_chan(struct snd_pcm_substream *substream)
  * @maxburst: Maximum number of words(note: words, as in units of the
  * src_addr_width member, not bytes) that can be send to or received from the
  * DAI in one burst.
- * @slave_id: Slave requester id for the DMA channel.
  * @filter_data: Custom DMA channel filter data, this will usually be used when
  * requesting the DMA channel.
  * @chan_name: Custom channel name to use when requesting DMA channel.
@@ -72,7 +71,6 @@ struct snd_dmaengine_dai_dma_data {
 	dma_addr_t addr;
 	enum dma_slave_buswidth addr_width;
 	u32 maxburst;
-	unsigned int slave_id;
 	void *filter_data;
 	const char *chan_name;
 	unsigned int fifo_size;
diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index af08bb4bf578..6762fb2083e1 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -91,8 +91,8 @@ EXPORT_SYMBOL_GPL(snd_hwparams_to_dma_slave_config);
  * @dma_data: DAI DMA data
  * @slave_config: DMA slave configuration
  *
- * Initializes the {dst,src}_addr, {dst,src}_maxburst, {dst,src}_addr_width and
- * slave_id fields of the DMA slave config from the same fields of the DAI DMA
+ * Initializes the {dst,src}_addr, {dst,src}_maxburst, {dst,src}_addr_width
+ * fields of the DMA slave config from the same fields of the DAI DMA
  * data struct. The src and dst fields will be initialized depending on the
  * direction of the substream. If the substream is a playback stream the dst
  * fields will be initialized, if it is a capture stream the src fields will be
@@ -124,7 +124,6 @@ void snd_dmaengine_pcm_set_config_from_dai_data(
 			slave_config->src_addr_width = dma_data->addr_width;
 	}
 
-	slave_config->slave_id = dma_data->slave_id;
 	slave_config->peripheral_config = dma_data->peripheral_config;
 	slave_config->peripheral_size = dma_data->peripheral_size;
 }
-- 
2.29.2

