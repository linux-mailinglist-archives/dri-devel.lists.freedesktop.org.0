Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5D6ADABB5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 11:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B430F10E2F5;
	Mon, 16 Jun 2025 09:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="7X66uCXH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C5D10E2F4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 09:23:03 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G9J2ua011700;
 Mon, 16 Jun 2025 11:22:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 A8c3iT0KfddidMrwAbOAq013mcyEvxOJGy/NzlCDttM=; b=7X66uCXHb0M4QGLu
 wltqQjf+JVMDnOUS8ilmUsafq/Tdf3F78ouR6785034W9SZ96zdVSmmqwpWcl4L2
 YPZ9C5Bx+RUVvJtwuH5Q9AIIXF0rSRKnhkSs/7TMQaczAYvQ8gZ/Am2Lm5cK/f/x
 2B2QXf3tucWPQH3L4fs7Bsj3aKY3RFAh0gtjQ2gwAUnsyGKxgapIinkAfdothPFz
 KudjAy+wWA7cYgexZpsx4sR1GeZFUKcFocMs0apzw049607b9VXJXq3wUJGPOctP
 Sf16eSUJj3p/fuJa+32gX9U6MX2SVqjrYjHlTUhxWXWFcUS8uZ8paEqa+Yu1JM7D
 lN9Frw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 479m1nvay3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 11:22:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F0BEC40049;
 Mon, 16 Jun 2025 11:21:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8A98A6CEC9E;
 Mon, 16 Jun 2025 11:21:10 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 11:21:09 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 11:21:05 +0200
Subject: [PATCH 4/6] spi: stm32: use STM32 DMA with STM32 MDMA to enhance
 DDR use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250616-spi-upstream-v1-4-7e8593f3f75d@foss.st.com>
References: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
In-Reply-To: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Valentin Caron <valentin.caron@foss.st.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Erwan Leray <erwan.leray@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.14.42]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_04,2025-06-13_01,2025-03-28_01
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The STM32 DMA doesn't have the ability to generate convenient burst
transfer on the DDR, ensuring the best load of the AXI & DDR.
To avoid this bad load of the AXI & DDR, STM32 MDMA can be used to transfer
data to the DDR, being triggered by STM32 DMA channel transfer
completion.
An SRAM buffer is used between DMA and MDMA. So the MDMA always does
MEM_TO_MEM transfers (from/to SRAM to/from DDR), and the DMA uses SRAM
instead of DDR with DEV_TO_MEM transfers.
SPI RX DMA (DEV_TO_MEM) becomes:
SPI RX FIFO ==DMA==> SRAM ==MDMA==> DDR

In RX (DEV_TO_MEM), EOT interrupt is used to pause the DMA channel (which
will raise a transfer complete) to trigger the MDMA to flush the SRAM (when
transfer length is not aligned on SRAM period).
TX remains on the former implementation.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 drivers/spi/spi-stm32.c | 251 +++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 228 insertions(+), 23 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 8b61caf770a2..8581f24c111f 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -9,7 +9,9 @@
 #include <linux/debugfs.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
+#include <linux/genalloc.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -328,6 +330,11 @@ struct stm32_spi_cfg {
  * @dma_rx: dma channel for RX transfer
  * @phys_addr: SPI registers physical base address
  * @device_mode: the controller is configured as SPI device
+ * @sram_pool: SRAM pool for DMA transfers
+ * @sram_rx_buf_size: size of SRAM buffer for RX transfer
+ * @sram_rx_buf: SRAM buffer for RX transfer
+ * @sram_dma_rx_buf: SRAM buffer physical address for RX transfer
+ * @mdma_rx: MDMA channel for RX transfer
  */
 struct stm32_spi {
 	struct device *dev;
@@ -362,6 +369,12 @@ struct stm32_spi {
 	dma_addr_t phys_addr;
 
 	bool device_mode;
+
+	struct gen_pool *sram_pool;
+	size_t sram_rx_buf_size;
+	void *sram_rx_buf;
+	dma_addr_t sram_dma_rx_buf;
+	struct dma_chan *mdma_rx;
 };
 
 static const struct stm32_spi_regspec stm32fx_spi_regspec = {
@@ -885,8 +898,11 @@ static void stm32h7_spi_disable(struct stm32_spi *spi)
 
 	if (spi->cur_usedma && spi->dma_tx)
 		dmaengine_terminate_async(spi->dma_tx);
-	if (spi->cur_usedma && spi->dma_rx)
+	if (spi->cur_usedma && spi->dma_rx) {
 		dmaengine_terminate_async(spi->dma_rx);
+		if (spi->mdma_rx)
+			dmaengine_terminate_async(spi->mdma_rx);
+	}
 
 	stm32_spi_clr_bits(spi, STM32H7_SPI_CR1, STM32H7_SPI_CR1_SPE);
 
@@ -1098,10 +1114,13 @@ static irqreturn_t stm32h7_spi_irq_thread(int irq, void *dev_id)
 	}
 
 	if (sr & STM32H7_SPI_SR_EOT) {
+		dev_dbg(spi->dev, "End of transfer\n");
 		if (!spi->cur_usedma && (spi->rx_buf && (spi->rx_len > 0)))
 			stm32h7_spi_read_rxfifo(spi);
 		if (!spi->cur_usedma ||
-		    (spi->cur_comm == SPI_SIMPLEX_TX || spi->cur_comm == SPI_3WIRE_TX))
+		    (spi->cur_comm == SPI_SIMPLEX_TX || spi->cur_comm == SPI_3WIRE_TX) ||
+		    (spi->mdma_rx && (spi->cur_comm == SPI_SIMPLEX_RX ||
+		     spi->cur_comm == SPI_FULL_DUPLEX)))
 			end = true;
 	}
 
@@ -1118,6 +1137,11 @@ static irqreturn_t stm32h7_spi_irq_thread(int irq, void *dev_id)
 	spin_unlock_irqrestore(&spi->lock, flags);
 
 	if (end) {
+		if (spi->cur_usedma && spi->mdma_rx) {
+			dmaengine_pause(spi->dma_rx);
+			/* Wait for callback */
+			return IRQ_HANDLED;
+		}
 		stm32h7_spi_disable(spi);
 		spi_finalize_current_transfer(ctrl);
 	}
@@ -1423,6 +1447,8 @@ static void stm32h7_spi_transfer_one_dma_start(struct stm32_spi *spi)
 	/* Enable the interrupts */
 	if (spi->cur_comm == SPI_SIMPLEX_TX || spi->cur_comm == SPI_3WIRE_TX)
 		ier |= STM32H7_SPI_IER_EOTIE | STM32H7_SPI_IER_TXTFIE;
+	if (spi->mdma_rx && (spi->cur_comm == SPI_SIMPLEX_RX || spi->cur_comm == SPI_FULL_DUPLEX))
+		ier |= STM32H7_SPI_IER_EOTIE;
 
 	stm32_spi_set_bits(spi, STM32H7_SPI_IER, ier);
 
@@ -1432,6 +1458,119 @@ static void stm32h7_spi_transfer_one_dma_start(struct stm32_spi *spi)
 		stm32_spi_set_bits(spi, STM32H7_SPI_CR1, STM32H7_SPI_CR1_CSTART);
 }
 
+/**
+ * stm32_spi_prepare_rx_dma_mdma_chaining - Prepare RX DMA and MDMA chaining
+ * @spi: pointer to the spi controller data structure
+ * @xfer: pointer to the spi transfer
+ * @rx_dma_conf: pointer to the DMA configuration for RX channel
+ * @rx_dma_desc: pointer to the RX DMA descriptor
+ * @rx_mdma_desc: pointer to the RX MDMA descriptor
+ *
+ * It must return 0 if the chaining is possible or an error code if not.
+ */
+static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
+						  struct spi_transfer *xfer,
+						  struct dma_slave_config *rx_dma_conf,
+						  struct dma_async_tx_descriptor **rx_dma_desc,
+						  struct dma_async_tx_descriptor **rx_mdma_desc)
+{
+	struct dma_slave_config rx_mdma_conf = {0};
+	u32 sram_period, nents = 0, spi_s_len;
+	struct sg_table dma_sgt, mdma_sgt;
+	struct scatterlist *spi_s, *s;
+	dma_addr_t dma_buf;
+	int i, ret;
+
+	sram_period = spi->sram_rx_buf_size / 2;
+
+	/* Configure MDMA RX channel */
+	rx_mdma_conf.direction = rx_dma_conf->direction;
+	rx_mdma_conf.src_addr = spi->sram_dma_rx_buf;
+	rx_mdma_conf.peripheral_config = rx_dma_conf->peripheral_config;
+	rx_mdma_conf.peripheral_size = rx_dma_conf->peripheral_size;
+	dmaengine_slave_config(spi->mdma_rx, &rx_mdma_conf);
+
+	/* Count the number of entries needed */
+	for_each_sg(xfer->rx_sg.sgl, spi_s, xfer->rx_sg.nents, i)
+		if (sg_dma_len(spi_s) > sram_period)
+			nents += DIV_ROUND_UP(sg_dma_len(spi_s), sram_period);
+		else
+			nents++;
+
+	/* Prepare DMA slave_sg DBM transfer DEV_TO_MEM (RX>MEM=SRAM) */
+	ret = sg_alloc_table(&dma_sgt, nents, GFP_ATOMIC);
+	if (ret)
+		return ret;
+
+	spi_s = xfer->rx_sg.sgl;
+	spi_s_len = sg_dma_len(spi_s);
+	dma_buf = spi->sram_dma_rx_buf;
+	for_each_sg(dma_sgt.sgl, s, dma_sgt.nents, i) {
+		size_t bytes = min_t(size_t, spi_s_len, sram_period);
+
+		sg_dma_len(s) = bytes;
+		sg_dma_address(s) = dma_buf;
+		spi_s_len -= bytes;
+
+		if (!spi_s_len && sg_next(spi_s)) {
+			spi_s = sg_next(spi_s);
+			spi_s_len = sg_dma_len(spi_s);
+			dma_buf = spi->sram_dma_rx_buf;
+		} else { /* DMA configured in DBM: it will swap between the SRAM periods */
+			if (i & 1)
+				dma_buf += sram_period;
+			else
+				dma_buf = spi->sram_dma_rx_buf;
+		}
+	}
+
+	*rx_dma_desc = dmaengine_prep_slave_sg(spi->dma_rx, dma_sgt.sgl,
+					       dma_sgt.nents, rx_dma_conf->direction,
+					       DMA_PREP_INTERRUPT);
+	sg_free_table(&dma_sgt);
+
+	if (!rx_dma_desc)
+		return -EINVAL;
+
+	/* Prepare MDMA slave_sg transfer MEM_TO_MEM (SRAM>DDR) */
+	ret = sg_alloc_table(&mdma_sgt, nents, GFP_ATOMIC);
+	if (ret) {
+		rx_dma_desc = NULL;
+		return ret;
+	}
+
+	spi_s = xfer->rx_sg.sgl;
+	spi_s_len = sg_dma_len(spi_s);
+	dma_buf = sg_dma_address(spi_s);
+	for_each_sg(mdma_sgt.sgl, s, mdma_sgt.nents, i) {
+		size_t bytes = min_t(size_t, spi_s_len, sram_period);
+
+		sg_dma_len(s) = bytes;
+		sg_dma_address(s) = dma_buf;
+		spi_s_len -= bytes;
+
+		if (!spi_s_len && sg_next(spi_s)) {
+			spi_s = sg_next(spi_s);
+			spi_s_len = sg_dma_len(spi_s);
+			dma_buf = sg_dma_address(spi_s);
+		} else {
+			dma_buf += bytes;
+		}
+	}
+
+	*rx_mdma_desc = dmaengine_prep_slave_sg(spi->mdma_rx, mdma_sgt.sgl,
+						mdma_sgt.nents, rx_mdma_conf.direction,
+						DMA_PREP_INTERRUPT);
+	sg_free_table(&mdma_sgt);
+
+	if (!rx_mdma_desc) {
+		rx_dma_desc = NULL;
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /**
  * stm32_spi_transfer_one_dma - transfer a single spi_transfer using DMA
  * @spi: pointer to the spi controller data structure
@@ -1443,38 +1582,43 @@ static void stm32h7_spi_transfer_one_dma_start(struct stm32_spi *spi)
 static int stm32_spi_transfer_one_dma(struct stm32_spi *spi,
 				      struct spi_transfer *xfer)
 {
+	struct dma_async_tx_descriptor *rx_mdma_desc = NULL, *rx_dma_desc = NULL;
+	struct dma_async_tx_descriptor *tx_dma_desc = NULL;
 	struct dma_slave_config tx_dma_conf, rx_dma_conf;
-	struct dma_async_tx_descriptor *tx_dma_desc, *rx_dma_desc;
 	unsigned long flags;
+	int ret = 0;
 
 	spin_lock_irqsave(&spi->lock, flags);
 
-	rx_dma_desc = NULL;
 	if (spi->rx_buf && spi->dma_rx) {
 		stm32_spi_dma_config(spi, spi->dma_rx, &rx_dma_conf, DMA_DEV_TO_MEM);
-		dmaengine_slave_config(spi->dma_rx, &rx_dma_conf);
+		if (spi->mdma_rx) {
+			rx_dma_conf.peripheral_size = 1;
+			dmaengine_slave_config(spi->dma_rx, &rx_dma_conf);
 
-		/* Enable Rx DMA request */
-		stm32_spi_set_bits(spi, spi->cfg->regs->dma_rx_en.reg,
-				   spi->cfg->regs->dma_rx_en.mask);
-
-		rx_dma_desc = dmaengine_prep_slave_sg(
-					spi->dma_rx, xfer->rx_sg.sgl,
-					xfer->rx_sg.nents,
-					rx_dma_conf.direction,
-					DMA_PREP_INTERRUPT);
+			ret = stm32_spi_prepare_rx_dma_mdma_chaining(spi, xfer, &rx_dma_conf,
+								     &rx_dma_desc, &rx_mdma_desc);
+			if (ret) { /* RX DMA MDMA chaining not possible, fallback to DMA only */
+				rx_dma_conf.peripheral_config = 0;
+				rx_dma_desc = NULL;
+			}
+		}
+		if (!rx_dma_desc) {
+			dmaengine_slave_config(spi->dma_rx, &rx_dma_conf);
+			rx_dma_desc = dmaengine_prep_slave_sg(spi->dma_rx, xfer->rx_sg.sgl,
+							      xfer->rx_sg.nents,
+							      rx_dma_conf.direction,
+							      DMA_PREP_INTERRUPT);
+		}
 	}
 
-	tx_dma_desc = NULL;
 	if (spi->tx_buf && spi->dma_tx) {
 		stm32_spi_dma_config(spi, spi->dma_tx, &tx_dma_conf, DMA_MEM_TO_DEV);
 		dmaengine_slave_config(spi->dma_tx, &tx_dma_conf);
-
-		tx_dma_desc = dmaengine_prep_slave_sg(
-					spi->dma_tx, xfer->tx_sg.sgl,
-					xfer->tx_sg.nents,
-					tx_dma_conf.direction,
-					DMA_PREP_INTERRUPT);
+		tx_dma_desc = dmaengine_prep_slave_sg(spi->dma_tx, xfer->tx_sg.sgl,
+						      xfer->tx_sg.nents,
+						      tx_dma_conf.direction,
+						      DMA_PREP_INTERRUPT);
 	}
 
 	if ((spi->tx_buf && spi->dma_tx && !tx_dma_desc) ||
@@ -1485,9 +1629,25 @@ static int stm32_spi_transfer_one_dma(struct stm32_spi *spi,
 		goto dma_desc_error;
 
 	if (rx_dma_desc) {
-		rx_dma_desc->callback = spi->cfg->dma_rx_cb;
-		rx_dma_desc->callback_param = spi;
+		if (rx_mdma_desc) {
+			rx_mdma_desc->callback = spi->cfg->dma_rx_cb;
+			rx_mdma_desc->callback_param = spi;
+		} else {
+			rx_dma_desc->callback = spi->cfg->dma_rx_cb;
+			rx_dma_desc->callback_param = spi;
+		}
 
+		/* Enable Rx DMA request */
+		stm32_spi_set_bits(spi, spi->cfg->regs->dma_rx_en.reg,
+				   spi->cfg->regs->dma_rx_en.mask);
+		if (rx_mdma_desc) {
+			if (dma_submit_error(dmaengine_submit(rx_mdma_desc))) {
+				dev_err(spi->dev, "Rx MDMA submit failed\n");
+				goto dma_desc_error;
+			}
+			/* Enable Rx MDMA channel */
+			dma_async_issue_pending(spi->mdma_rx);
+		}
 		if (dma_submit_error(dmaengine_submit(rx_dma_desc))) {
 			dev_err(spi->dev, "Rx DMA submit failed\n");
 			goto dma_desc_error;
@@ -1522,6 +1682,8 @@ static int stm32_spi_transfer_one_dma(struct stm32_spi *spi,
 	return 1;
 
 dma_submit_error:
+	if (spi->mdma_rx)
+		dmaengine_terminate_sync(spi->mdma_rx);
 	if (spi->dma_rx)
 		dmaengine_terminate_sync(spi->dma_rx);
 
@@ -1533,6 +1695,9 @@ static int stm32_spi_transfer_one_dma(struct stm32_spi *spi,
 
 	dev_info(spi->dev, "DMA issue: fall back to irq transfer\n");
 
+	if (spi->sram_rx_buf)
+		memset(spi->sram_rx_buf, 0, spi->sram_rx_buf_size);
+
 	spi->cur_usedma = false;
 	return spi->cfg->transfer_one_irq(spi);
 }
@@ -1891,6 +2056,9 @@ static int stm32_spi_unprepare_msg(struct spi_controller *ctrl,
 
 	spi->cfg->disable(spi);
 
+	if (spi->sram_rx_buf)
+		memset(spi->sram_rx_buf, 0, spi->sram_rx_buf_size);
+
 	return 0;
 }
 
@@ -2245,6 +2413,33 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	if (spi->dma_tx || spi->dma_rx)
 		ctrl->can_dma = stm32_spi_can_dma;
 
+	spi->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
+	if (spi->sram_pool) {
+		spi->sram_rx_buf_size = gen_pool_size(spi->sram_pool);
+		dev_info(&pdev->dev, "SRAM pool: %zu KiB for RX DMA/MDMA chaining\n",
+			 spi->sram_rx_buf_size / 1024);
+		spi->sram_rx_buf = gen_pool_dma_zalloc(spi->sram_pool, spi->sram_rx_buf_size,
+						       &spi->sram_dma_rx_buf);
+		if (!spi->sram_rx_buf) {
+			dev_err(&pdev->dev, "failed to allocate SRAM buffer\n");
+		} else {
+			spi->mdma_rx = dma_request_chan(spi->dev, "rxm2m");
+			if (IS_ERR(spi->mdma_rx)) {
+				ret = PTR_ERR(spi->mdma_rx);
+				spi->mdma_rx = NULL;
+				if (ret == -EPROBE_DEFER) {
+					goto err_pool_free;
+				} else {
+					gen_pool_free(spi->sram_pool,
+						      (unsigned long)spi->sram_rx_buf,
+						      spi->sram_rx_buf_size);
+					dev_warn(&pdev->dev,
+						 "failed to request rx mdma channel, DMA only\n");
+				}
+			}
+		}
+	}
+
 	pm_runtime_set_autosuspend_delay(&pdev->dev,
 					 STM32_SPI_AUTOSUSPEND_DELAY);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -2272,6 +2467,11 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
+
+	if (spi->mdma_rx)
+		dma_release_channel(spi->mdma_rx);
+err_pool_free:
+	gen_pool_free(spi->sram_pool, (unsigned long)spi->sram_rx_buf, spi->sram_rx_buf_size);
 err_dma_release:
 	if (spi->dma_tx)
 		dma_release_channel(spi->dma_tx);
@@ -2302,6 +2502,11 @@ static void stm32_spi_remove(struct platform_device *pdev)
 		dma_release_channel(ctrl->dma_tx);
 	if (ctrl->dma_rx)
 		dma_release_channel(ctrl->dma_rx);
+	if (spi->mdma_rx)
+		dma_release_channel(spi->mdma_rx);
+	if (spi->sram_rx_buf)
+		gen_pool_free(spi->sram_pool, (unsigned long)spi->sram_rx_buf,
+			      spi->sram_rx_buf_size);
 
 	clk_disable_unprepare(spi->clk);
 

-- 
2.43.0

