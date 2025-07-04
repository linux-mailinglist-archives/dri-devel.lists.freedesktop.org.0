Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B79BAF8C2C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 10:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F9410E998;
	Fri,  4 Jul 2025 08:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="I1qgQ10f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9556210E996
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 08:41:57 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647ZrNT028655;
 Fri, 4 Jul 2025 10:41:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 eago0RZdyrerOdy6yEfqaUqyo2OFIpdQliz92NLH9S8=; b=I1qgQ10fN3ww2k8s
 Sdp3ZBe1GoA1iUJwC5Er7fn95fXqvWOrJdbXmVCQrFZ0Y10eIJKspdKrwmCBDjNn
 kQRqBqaiT40/OsieTsuLq7cS6NC7Wwvfeqxxx7lhBCP2PyxsTlw4HqHXzoTdgygw
 sUAAUssurpuVGl6/uKt/aRQw/nmhe3ODFIlw2x7/w4pjUv8NDoo4Nst4K14Ff2Gh
 2taGJBoigEwq70MispjCnDBHMgqIuWJDN0z5qU5sTI5QLSe3u3kst9wEpPDR5kvE
 FlDwv7A1iuBf8RSve3+WQsu+w/M1KRwwFgv6aDMlmyvnYzUHKumCJmSAzC/KcEf7
 w0ae6g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jsy59k3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jul 2025 10:41:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 99C2840051;
 Fri,  4 Jul 2025 10:40:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 022ED483149;
 Fri,  4 Jul 2025 10:39:38 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 10:39:37 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 4 Jul 2025 10:39:15 +0200
Subject: [PATCH v4 2/3] i2c: stm32f7: unmap DMA mapped buffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250704-i2c-upstream-v4-2-84a095a2c728@foss.st.com>
References: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
In-Reply-To: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>,
 Wolfram Sang <wsa@kernel.org>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 <linux-i2c@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
 <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
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

Before each I2C transfer using DMA, the I2C buffer is DMA'pped to make
sure the memory buffer is DMA'able. This is handle in the function
`stm32_i2c_prep_dma_xfer()`.
If the transfer fails for any reason the I2C buffer must be unmap.
Use the dma_callback to factorize the code and fix this issue.

Note that the `stm32f7_i2c_dma_callback()` is now called in case of DMA
transfer success and error and that the `complete()` on the dma_complete
completion structure is done inconditionnally in case of transfer
success or error as well as the `dmaengine_terminate_async()`.
This is allowed as a `complete()` in case transfer error has no effect
as well as a `dmaengine_terminate_async()` on a transfer success.

Also fix the unneeded cast and remove not more needed variables.

Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
Acked-by: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 817d081460c2..73a7b8894c0d 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -739,10 +739,11 @@ static void stm32f7_i2c_disable_dma_req(struct stm32f7_i2c_dev *i2c_dev)
 
 static void stm32f7_i2c_dma_callback(void *arg)
 {
-	struct stm32f7_i2c_dev *i2c_dev = (struct stm32f7_i2c_dev *)arg;
+	struct stm32f7_i2c_dev *i2c_dev = arg;
 	struct stm32_i2c_dma *dma = i2c_dev->dma;
 
 	stm32f7_i2c_disable_dma_req(i2c_dev);
+	dmaengine_terminate_async(dma->chan_using);
 	dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
 			 dma->dma_data_dir);
 	complete(&dma->dma_complete);
@@ -1510,7 +1511,6 @@ static irqreturn_t stm32f7_i2c_handle_isr_errs(struct stm32f7_i2c_dev *i2c_dev,
 	u16 addr = f7_msg->addr;
 	void __iomem *base = i2c_dev->base;
 	struct device *dev = i2c_dev->dev;
-	struct stm32_i2c_dma *dma = i2c_dev->dma;
 
 	/* Bus error */
 	if (status & STM32F7_I2C_ISR_BERR) {
@@ -1551,10 +1551,8 @@ static irqreturn_t stm32f7_i2c_handle_isr_errs(struct stm32f7_i2c_dev *i2c_dev,
 	}
 
 	/* Disable dma */
-	if (i2c_dev->use_dma) {
-		stm32f7_i2c_disable_dma_req(i2c_dev);
-		dmaengine_terminate_async(dma->chan_using);
-	}
+	if (i2c_dev->use_dma)
+		stm32f7_i2c_dma_callback(i2c_dev);
 
 	i2c_dev->master_mode = false;
 	complete(&i2c_dev->complete);
@@ -1600,7 +1598,6 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 {
 	struct stm32f7_i2c_dev *i2c_dev = data;
 	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
-	struct stm32_i2c_dma *dma = i2c_dev->dma;
 	void __iomem *base = i2c_dev->base;
 	u32 status, mask;
 	int ret;
@@ -1619,10 +1616,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 		dev_dbg(i2c_dev->dev, "<%s>: Receive NACK (addr %x)\n",
 			__func__, f7_msg->addr);
 		writel_relaxed(STM32F7_I2C_ICR_NACKCF, base + STM32F7_I2C_ICR);
-		if (i2c_dev->use_dma) {
-			stm32f7_i2c_disable_dma_req(i2c_dev);
-			dmaengine_terminate_async(dma->chan_using);
-		}
+		if (i2c_dev->use_dma)
+			stm32f7_i2c_dma_callback(i2c_dev);
 		f7_msg->result = -ENXIO;
 	}
 
@@ -1640,8 +1635,7 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 			ret = wait_for_completion_timeout(&i2c_dev->dma->dma_complete, HZ);
 			if (!ret) {
 				dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
-				stm32f7_i2c_disable_dma_req(i2c_dev);
-				dmaengine_terminate_async(dma->chan_using);
+				stm32f7_i2c_dma_callback(i2c_dev);
 				f7_msg->result = -ETIMEDOUT;
 			}
 		}

-- 
2.43.0

