Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0C0245D3A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31F36E4CF;
	Mon, 17 Aug 2020 07:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Fri, 14 Aug 2020 10:02:56 UTC
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8946EB26
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 10:02:56 +0000 (UTC)
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com)
 ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 14 Aug 2020 02:56:52 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA;
 14 Aug 2020 02:56:50 -0700
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
 by ironmsg02-blr.qualcomm.com with ESMTP; 14 Aug 2020 15:26:30 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
 id 925F11AC8; Fri, 14 Aug 2020 15:26:29 +0530 (IST)
From: Roja Rani Yarubandi <rojay@codeaurora.org>
To: wsa@kernel.org
Subject: [PATCH 1/2] i2c: i2c-qcom-geni: Add tx_dma,
 rx_dma and xfer_len to geni_i2c_dev struct
Date: Fri, 14 Aug 2020 15:25:39 +0530
Message-Id: <20200814095540.32115-2-rojay@codeaurora.org>
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

Adding tx_dma, rx_dma and xfer length in geni_i2c_dev struct to
store DMA mapping data to enhance its scope. For example during
shutdown callback to unmap DMA mapping, these new struct members
can be used as part of geni_se_tx_dma_unprep and
geni_se_rx_dma_unprep calls.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 7f130829bf01..53ca41f76080 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -86,6 +86,9 @@ struct geni_i2c_dev {
 	u32 clk_freq_out;
 	const struct geni_i2c_clk_fld *clk_fld;
 	int suspended;
+	dma_addr_t tx_dma;
+	dma_addr_t rx_dma;
+	u32 xfer_len;
 };
 
 struct geni_i2c_err_log {
@@ -352,12 +355,11 @@ static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev *gi2c)
 static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
-	dma_addr_t rx_dma;
 	unsigned long time_left;
 	void *dma_buf = NULL;
 	struct geni_se *se = &gi2c->se;
-	size_t len = msg->len;
 
+	gi2c->xfer_len = msg->len;
 	if (!of_machine_is_compatible("lenovo,yoga-c630"))
 		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
 
@@ -366,9 +368,10 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	else
 		geni_se_select_mode(se, GENI_SE_FIFO);
 
-	writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
+	writel_relaxed(gi2c->xfer_len, se->base + SE_I2C_RX_TRANS_LEN);
 
-	if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
+	if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, gi2c->xfer_len,
+					   &gi2c->rx_dma)) {
 		geni_se_select_mode(se, GENI_SE_FIFO);
 		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
 		dma_buf = NULL;
@@ -384,7 +387,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	if (dma_buf) {
 		if (gi2c->err)
 			geni_i2c_rx_fsm_rst(gi2c);
-		geni_se_rx_dma_unprep(se, rx_dma, len);
+		geni_se_rx_dma_unprep(se, gi2c->rx_dma, gi2c->xfer_len);
 		i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
 	}
 
@@ -394,12 +397,11 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
-	dma_addr_t tx_dma;
 	unsigned long time_left;
 	void *dma_buf = NULL;
 	struct geni_se *se = &gi2c->se;
-	size_t len = msg->len;
 
+	gi2c->xfer_len = msg->len;
 	if (!of_machine_is_compatible("lenovo,yoga-c630"))
 		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
 
@@ -408,9 +410,10 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	else
 		geni_se_select_mode(se, GENI_SE_FIFO);
 
-	writel_relaxed(len, se->base + SE_I2C_TX_TRANS_LEN);
+	writel_relaxed(gi2c->xfer_len, se->base + SE_I2C_TX_TRANS_LEN);
 
-	if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &tx_dma)) {
+	if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, gi2c->xfer_len,
+					   &gi2c->tx_dma)) {
 		geni_se_select_mode(se, GENI_SE_FIFO);
 		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
 		dma_buf = NULL;
@@ -429,7 +432,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	if (dma_buf) {
 		if (gi2c->err)
 			geni_i2c_tx_fsm_rst(gi2c);
-		geni_se_tx_dma_unprep(se, tx_dma, len);
+		geni_se_tx_dma_unprep(se, gi2c->tx_dma, gi2c->xfer_len);
 		i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
 	}
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
