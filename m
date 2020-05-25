Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE811E07B0
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5854189D00;
	Mon, 25 May 2020 07:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4268489D53
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 03:46:19 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id r10so8111319pgv.8
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 20:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Eu+Ho/X9r7MZN52F/RomcQQtgjiQ+X/m9AkGhdRXtC0=;
 b=hlbOLQ3Eyjn+XvXsI6V94Sxye1id84iasnp0uBZIRnBKOkbSU9yUbIlq41keOh/DjV
 M1Ji6ztXni7ait2BVtg15UvWVCX+vU/nFT3K1YarMdgZiYIY/cRoUv0KGgjbkRIZqvSB
 63nHgdS7zUi+wtwJ8SqLo93B3tzLNNoTRj10+QAlVcCSbgjVGTKNRaeGDJTUQETf2BP+
 Lb7gvSbVZhR3G2KTWG73ysbzCiM2NYHYNaz7/L9i2dmlI2vdR+kVt1h9n0FOY+BSUkvc
 d1dqmHCCPP2l9PLtyGm+TcQLTBVFtA8k/HtwXqlArTw8rogH5EMBjOPtBKe3H89ggCO1
 zIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Eu+Ho/X9r7MZN52F/RomcQQtgjiQ+X/m9AkGhdRXtC0=;
 b=P4eMtowLTombHNqSQrZcm12ndU0Icc5CBeRmFaZeRO4Va+i02zYLE2Q2xIVxwxFQP8
 PRxnU7nTiBnlSngC9Vkvm7Yusfyte0LHYQl/8m9+pUTqLDWvb92i2zHMdzvjBDrDhjpG
 xPmqx4q+UmHyiCCpokHC/m4wG6Sqe2v0t9yEf5KrCy8kao5aWphdghDfkzVaVoBF7/eQ
 3uy8yHBKGgUNIgrWO8c7mJTFeCukMuHFPmKiNtaXJNsK4HVm51WCbYTJxYDZR0rR1YEr
 7Pwtzsyld2QqiCJ27hwDcEUTdqSKwtGbAb9fdOMCheqICuNBG0gmQra3klAYaPrvZcoM
 aPxg==
X-Gm-Message-State: AOAM531qcEE83WbCLNpJy08fCKpy9TWC3pwl1tVSKOdxUuGOGU29I+vK
 JiWL+yhFGNXygsCoOl3cTnE=
X-Google-Smtp-Source: ABdhPJyCVTbNtcFfst1GMI7OlJFQdpx2wRpgu5bLKCThc6j672Jh+qV5W3K7wBvjbpx99E6OdCvgoA==
X-Received: by 2002:a62:8888:: with SMTP id
 l130mr14964445pfd.140.1590378378954; 
 Sun, 24 May 2020 20:46:18 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id i98sm12152831pje.37.2020.05.24.20.46.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 20:46:18 -0700 (PDT)
From: dillon.minfei@gmail.com
To: linus.walleij@linaro.org,
	broonie@kernel.org
Subject: [PATCH v5 8/8] spi: flags 'SPI_CONTROLLER_MUST_RX' and
 'SPI_CONTROLLER_MUST_TX' can't be coexit with 'SPI_3WIRE' mode
Date: Mon, 25 May 2020 11:45:48 +0800
Message-Id: <1590378348-8115-9-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

since chip spi driver need get the transfer direction by 'tx_buf' and
'rx_buf' of 'struct spi_transfer' in 'SPI_3WIRE' mode.

so, we need bypass 'SPI_CONTROLLER_MUST_RX' and 'SPI_CONTROLLER_MUST_TX'
feature in 'SPI_3WIRE' mode

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 drivers/spi/spi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index c92c894..f884411 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1023,7 +1023,8 @@ static int spi_map_msg(struct spi_controller *ctlr, struct spi_message *msg)
 	void *tmp;
 	unsigned int max_tx, max_rx;
 
-	if (ctlr->flags & (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX)) {
+	if ((ctlr->flags & (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX))
+		&& !(msg->spi->mode & SPI_3WIRE)) {
 		max_tx = 0;
 		max_rx = 0;
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
