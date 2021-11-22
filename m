Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE82C459751
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 23:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA3789D4B;
	Mon, 22 Nov 2021 22:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF57B89D4B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 22:22:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A713E60FE6;
 Mon, 22 Nov 2021 22:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637619752;
 bh=a7SGmbp4mEcF+/rXpw1vFw4ipurQPrcKJnXyHa0ukDM=;
 h=From:To:Cc:Subject:Date:From;
 b=Y67FYaIGdT2PZzTNUoTVEiI4EIJPVahTTQcFkaMGkwj/kK6uvHtBIMmdnqBLhf7HT
 hBItQMZWP+6NOepRrZvm3Ew9ZZ8/FZ3O0KYYGjwKHK5rlPz4VxNp0GiabJQN8Y/GAu
 cpYxFgQ1c0u7D2HYV2H6tcPpfPDjp0wzO7HYKAfO+trFUsv2MhTcWOSKf3o8dyelB4
 DrmZQlB9Ek6HLLgk3MWFfNjOVttzg9ihxIXogQBkQ99M72KwZFnb0oN9Lw8EEWgIo9
 HeySd0yRe7BQd7PNPcJ0oegk/rngezgRJBGsN7YW07wkfLzE47GG8mpWgwpy/vxG8C
 +w2C+aEIfRe5A==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 00/11] dmaengine: kill off dma_slave_config->slave_id
Date: Mon, 22 Nov 2021 23:21:52 +0100
Message-Id: <20211122222203.4103644-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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

I recently came across some new uses of the 'slave_id' field that
I had (almost) removed a few years ago. There are no legitimate
uses of this field in the kernel, only a few stale references and
two drivers that abuse the field as a side-channel between the
dmaengine driver and its client.

Let's change the xilinx and qualcomm drivers to use the documented
side-channel (peripheral_data) instead, and remove the remnants of
it to prevent new users from coming in.

I think I got all the necessary Acks on v1 already, so if there are
no further concerns, please merge this through the dmaengine tree
for v5.17, or pull from

git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git tags/dma-slave-id-removal

       Arnd

Arnd Bergmann (13):
  ASoC: tegra20-spdif: stop setting slave_id
  ASoC: dai_dma: remove slave_id field
  spi: pic32: stop setting dma_config->slave_id
  mmc: bcm2835: stop setting chan_config->slave_id
  dmaengine: shdma: remove legacy slave_id parsing
  dmaengine: pxa/mmp: stop referencing config->slave_id
  dmaengine: sprd: stop referencing config->slave_id
  dmaengine: qcom-adm: stop abusing slave_id config
  dmaengine: xilinx_dpdma: stop using slave_id field
  dmaengine: tegra20-apb: stop checking config->slave_id
  dmaengine: remove slave_id config field

---
Changes in v2:

 - drop obsolete drivers/staging/patch
 - split tegra change into a separate patch
 - improve some patch descriptions.

 drivers/dma/mmp_pdma.c                 |  6 ---
 drivers/dma/pxa_dma.c                  |  7 ----
 drivers/dma/qcom/qcom_adm.c            | 56 ++++++++++++++++++++++----
 drivers/dma/sh/shdma-base.c            |  8 ----
 drivers/dma/sprd-dma.c                 |  3 --
 drivers/dma/tegra20-apb-dma.c          |  6 ---
 drivers/dma/xilinx/xilinx_dpdma.c      | 17 +++++---
 drivers/gpu/drm/xlnx/zynqmp_disp.c     |  9 ++++-
 drivers/mmc/host/bcm2835.c             |  2 -
 drivers/mtd/nand/raw/qcom_nandc.c      | 14 ++++++-
 drivers/spi/spi-pic32.c                |  2 -
 drivers/tty/serial/msm_serial.c        | 15 ++++++-
 include/linux/dma/qcom_adm.h           | 12 ++++++
 include/linux/dma/xilinx_dpdma.h       | 11 +++++
 include/linux/dmaengine.h              |  4 --
 include/linux/platform_data/asoc-s3c.h |  6 ---
 include/sound/dmaengine_pcm.h          |  4 --
 sound/core/pcm_dmaengine.c             | 26 +-----------
 sound/soc/tegra/tegra20_spdif.c        |  1 -
 27 files changed, 134 insertions(+), 146 deletions(-)
 create mode 100644 include/linux/dma/qcom_adm.h
 create mode 100644 include/linux/dma/xilinx_dpdma.h

-- 
2.29.2

Cc: Andy Gross <agross@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Baolin Wang <baolin.wang7@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: alsa-devel@alsa-project.org
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: dmaengine@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-serial@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
