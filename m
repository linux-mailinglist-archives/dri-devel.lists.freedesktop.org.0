Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 754691E5964
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3B16E463;
	Thu, 28 May 2020 07:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D64882A9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 07:28:23 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id cx22so1176282pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 00:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7c19kwVIK7YMb2VDQnjAkuLRbBPFNqIJf4ySzLQ40dc=;
 b=CBp7io6nA+ULs0w/SG87ZCXPyfFCNszfBoi7ZalWhHpUY9cFxGBjNGlZ1cufrGa7eQ
 v2xQCGcYSjskwKs2GgIIEnIuJEijyvx2X6m30TH72U1pMCTdcjfdXaTBl3mkXgq1Xlob
 5kO3/aTTtneJZgf7zbXkDzr8ldYdcc7IX9Wt1q9/WyawIE1XXcY5vDmHQdpGePM8099V
 kUwY/z6+iSjcUtpccbV8LTPd+EgClgVShtCtxVhvtOwa+//Fdx1G+rGJV+TlmYL8/dEt
 0yPlYk6HXm+is8UT8OXEZ4bDTXc41+rDh+8y+cA9oddW8vWjCme9su7p9M+p7Hu4TIwT
 St1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7c19kwVIK7YMb2VDQnjAkuLRbBPFNqIJf4ySzLQ40dc=;
 b=pNtm69DaVWvQdkf/h3nh1CkLePs7hOwhkJrfYDrchvinDhRv3dGWzG+uNLIe433Mql
 9e9dtf7PA1+A10BOaaTCaLeni/f1CmywS2QeYJLu3Vj0df7xrDyDuGbaJBMvU6hR7xVo
 7Yowwn6jw4KxADphauy2n+hHl52q5VUtO35aG9/2RaVj2JHKNSk8FurmdMBZQHFhg+xR
 fNpdfF+sn3Xz2yJAOboRVsFaiiznKV0WzmJL8QYdzfCAQIKCVDo8IoWmI7Ec+VqTkO+F
 1ZritgnNcoi4ZJC2uHEwaLfoRAcx2DYztyz1NpDk9TIsd8YK4zARRhOfwD/+g40xexRr
 MRGg==
X-Gm-Message-State: AOAM5311WAJmjlOBwA7Ubx9xqBgX3JfbzkJ+jygZTYkuBLn2hVZaybPR
 eFCmTrtKvIVN1adMbrPaPx4=
X-Google-Smtp-Source: ABdhPJzmNwgAWWhu5YVWLS46Tva4OgHqGGW1miyDNcKQ6JiTF8BTywmtNNhuDPhseLmetj5Czd4PMA==
X-Received: by 2002:a17:90b:e0c:: with SMTP id
 ge12mr3640548pjb.3.1590564503101; 
 Wed, 27 May 2020 00:28:23 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id q201sm1371842pfq.40.2020.05.27.00.28.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 May 2020 00:28:22 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org, andy.shevchenko@gmail.com, noralf@tronnes.org,
 linus.walleij@linaro.org, broonie@kernel.org
Subject: [PATCH v6 8/9] spi: stm32: Add 'SPI_SIMPLEX_RX',
 'SPI_3WIRE_RX' support for stm32f4
Date: Wed, 27 May 2020 15:27:32 +0800
Message-Id: <1590564453-24499-9-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

in l3gd20 driver startup, there is a setup failed error return from
stm32 spi driver

  "
  [    2.687630] st-gyro-spi spi0.0: supply vdd not found, using dummy
  regulator
  [    2.696869] st-gyro-spi spi0.0: supply vddio not found, using dummy
  regulator
  [    2.706707] spi_stm32 40015000.spi: SPI transfer setup failed
  [    2.713741] st-gyro-spi spi0.0: SPI transfer failed: -22
  [    2.721096] spi_master spi0: failed to transfer one message from queue
  [    2.729268] iio iio:device0: failed to read Who-Am-I register.
  [    2.737504] st-gyro-spi: probe of spi0.0 failed with error -22
  "

after debug into spi-stm32 driver, st-gyro-spi split two steps to read
l3gd20 id

first: send command to l3gd20 with read id command in tx_buf, rx_buf
is null.
second: read id with tx_buf is null, rx_buf not null.

so, for second step, stm32 driver recongise this process is 'SPI_SIMPLE_RX'
from stm32_spi_communication_type(), but there is no related process for this
type in stm32f4_spi_set_mode(), then we get error from
stm32_spi_transfer_one_setup().

we can use two method to fix this bug.
1, use stm32 spi's "In unidirectional receive-only mode (BIDIMODE=0 and
RXONLY=1)". but as our code running in sdram, the read latency is too large
to get so many receive overrun error in interrupts handler.

2, use stm32 spi's "In full-duplex (BIDIMODE=0 and RXONLY=0)", as tx_buf is
null, so add flag 'SPI_MASTER_MUST_TX' to spi master.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

Change since V4:
1 remove dummy data sent out by stm32 spi driver
2 add flag 'SPI_MASTER_MUST_TX' to spi master

 drivers/spi/spi-stm32.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 44ac6eb3298d..4c643dfc7fbb 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -811,7 +811,9 @@ static irqreturn_t stm32f4_spi_irq_event(int irq, void *dev_id)
 		mask |= STM32F4_SPI_SR_TXE;
 	}
 
-	if (!spi->cur_usedma && spi->cur_comm == SPI_FULL_DUPLEX) {
+	if (!spi->cur_usedma && (spi->cur_comm == SPI_FULL_DUPLEX ||
+				spi->cur_comm == SPI_SIMPLEX_RX ||
+				spi->cur_comm == SPI_3WIRE_RX)) {
 		/* TXE flag is set and is handled when RXNE flag occurs */
 		sr &= ~STM32F4_SPI_SR_TXE;
 		mask |= STM32F4_SPI_SR_RXNE | STM32F4_SPI_SR_OVR;
@@ -850,7 +852,7 @@ static irqreturn_t stm32f4_spi_irq_event(int irq, void *dev_id)
 		stm32f4_spi_read_rx(spi);
 		if (spi->rx_len == 0)
 			end = true;
-		else /* Load data for discontinuous mode */
+		else if (spi->tx_buf)/* Load data for discontinuous mode */
 			stm32f4_spi_write_tx(spi);
 	}
 
@@ -1151,7 +1153,9 @@ static int stm32f4_spi_transfer_one_irq(struct stm32_spi *spi)
 	/* Enable the interrupts relative to the current communication mode */
 	if (spi->cur_comm == SPI_SIMPLEX_TX || spi->cur_comm == SPI_3WIRE_TX) {
 		cr2 |= STM32F4_SPI_CR2_TXEIE;
-	} else if (spi->cur_comm == SPI_FULL_DUPLEX) {
+	} else if (spi->cur_comm == SPI_FULL_DUPLEX ||
+				spi->cur_comm == SPI_SIMPLEX_RX ||
+				spi->cur_comm == SPI_3WIRE_RX) {
 		/* In transmit-only mode, the OVR flag is set in the SR register
 		 * since the received data are never read. Therefore set OVR
 		 * interrupt only when rx buffer is available.
@@ -1462,10 +1466,16 @@ static int stm32f4_spi_set_mode(struct stm32_spi *spi, unsigned int comm_type)
 		stm32_spi_set_bits(spi, STM32F4_SPI_CR1,
 					STM32F4_SPI_CR1_BIDIMODE |
 					STM32F4_SPI_CR1_BIDIOE);
-	} else if (comm_type == SPI_FULL_DUPLEX) {
+	} else if (comm_type == SPI_FULL_DUPLEX ||
+				comm_type == SPI_SIMPLEX_RX) {
 		stm32_spi_clr_bits(spi, STM32F4_SPI_CR1,
 					STM32F4_SPI_CR1_BIDIMODE |
 					STM32F4_SPI_CR1_BIDIOE);
+	} else if (comm_type == SPI_3WIRE_RX) {
+		stm32_spi_set_bits(spi, STM32F4_SPI_CR1,
+					STM32F4_SPI_CR1_BIDIMODE);
+		stm32_spi_clr_bits(spi, STM32F4_SPI_CR1,
+					STM32F4_SPI_CR1_BIDIOE);
 	} else {
 		return -EINVAL;
 	}
@@ -1906,6 +1916,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	master->prepare_message = stm32_spi_prepare_msg;
 	master->transfer_one = stm32_spi_transfer_one;
 	master->unprepare_message = stm32_spi_unprepare_msg;
+	master->flags = SPI_MASTER_MUST_TX;
 
 	spi->dma_tx = dma_request_chan(spi->dev, "tx");
 	if (IS_ERR(spi->dma_tx)) {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
