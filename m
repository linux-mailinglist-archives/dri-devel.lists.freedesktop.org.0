Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED0C245D31
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3E36E4C1;
	Mon, 17 Aug 2020 07:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A766EB27
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 10:02:56 +0000 (UTC)
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com)
 ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 14 Aug 2020 02:56:53 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA;
 14 Aug 2020 02:56:52 -0700
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
 by ironmsg02-blr.qualcomm.com with ESMTP; 14 Aug 2020 15:26:33 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
 id 477501AC8; Fri, 14 Aug 2020 15:26:32 +0530 (IST)
From: Roja Rani Yarubandi <rojay@codeaurora.org>
To: wsa@kernel.org
Subject: [PATCH 2/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
Date: Fri, 14 Aug 2020 15:25:40 +0530
Message-Id: <20200814095540.32115-3-rojay@codeaurora.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200814095540.32115-1-rojay@codeaurora.org>
References: <20200814095540.32115-1-rojay@codeaurora.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, saiprakash.ranjan@codeaurora.org,
 rnayak@codeaurora.org, linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-arm-msm@vger.kernel.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
 dianders@chromium.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 akashast@codeaurora.org, mka@chromium.org, agross@kernel.org,
 msavaliy@qti.qualcomm.com, bjorn.andersson@linaro.org, skakit@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the hardware is still accessing memory after SMMU translation
is disabled(as part of smmu shutdown callback), then the
IOVAs(I/O virtual address) which it was using will go on the bus
as the physical addresses which will result in unknown crashes
like NoC/interconnect errors.

So, adding shutdown callback to i2c driver to unmap DMA mappings
during system "reboot" or "shutdown".

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 36 ++++++++++++++++++++++++++++++
 include/linux/qcom-geni-se.h       |  5 +++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 53ca41f76080..749c225f95c4 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -613,6 +613,41 @@ static int geni_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void geni_i2c_shutdown(struct platform_device *pdev)
+{
+	int ret;
+	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
+	struct geni_se *se = &gi2c->se;
+	u32 dma;
+	u32 dma_dbg_reg;
+
+	ret = pm_runtime_get_sync(gi2c->se.dev);
+	if (ret < 0) {
+		dev_err(gi2c->se.dev, "Failed to resume device:%d\n", ret);
+		return;
+	}
+
+	dma = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
+	if (dma) {
+		dma_dbg_reg = readl_relaxed(gi2c->se.base + SE_DMA_DEBUG_REG0);
+		if (dma_dbg_reg & DMA_TX_ACTIVE) {
+			geni_i2c_abort_xfer(gi2c);
+			gi2c->cur_wr = 0;
+			if (gi2c->err)
+				geni_i2c_tx_fsm_rst(gi2c);
+			geni_se_tx_dma_unprep(se, gi2c->tx_dma, gi2c->xfer_len);
+		}
+		if (dma_dbg_reg & DMA_RX_ACTIVE) {
+			geni_i2c_abort_xfer(gi2c);
+			gi2c->cur_rd = 0;
+			if (gi2c->err)
+				geni_i2c_rx_fsm_rst(gi2c);
+			geni_se_rx_dma_unprep(se, gi2c->rx_dma, gi2c->xfer_len);
+		}
+	}
+	pm_runtime_put_sync_suspend(gi2c->se.dev);
+}
+
 static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 {
 	int ret;
@@ -673,6 +708,7 @@ MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
 static struct platform_driver geni_i2c_driver = {
 	.probe  = geni_i2c_probe,
 	.remove = geni_i2c_remove,
+	.shutdown = geni_i2c_shutdown,
 	.driver = {
 		.name = "geni_i2c",
 		.pm = &geni_i2c_pm_ops,
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index dd464943f717..acad69be747d 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -77,6 +77,7 @@ struct geni_se {
 #define SE_DMA_RX_FSM_RST		0xd58
 #define SE_HW_PARAM_0			0xe24
 #define SE_HW_PARAM_1			0xe28
+#define SE_DMA_DEBUG_REG0		0xe40
 
 /* GENI_FORCE_DEFAULT_REG fields */
 #define FORCE_DEFAULT	BIT(0)
@@ -207,6 +208,10 @@ struct geni_se {
 #define RX_GENI_CANCEL_IRQ		BIT(11)
 #define RX_GENI_GP_IRQ_EXT		GENMASK(13, 12)
 
+/* DMA DEBUG Register fields */
+#define DMA_TX_ACTIVE			BIT(0)
+#define DMA_RX_ACTIVE			BIT(1)
+
 /* SE_HW_PARAM_0 fields */
 #define TX_FIFO_WIDTH_MSK		GENMASK(29, 24)
 #define TX_FIFO_WIDTH_SHFT		24
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
