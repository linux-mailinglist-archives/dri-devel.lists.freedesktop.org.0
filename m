Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5541E07C9
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8FC89DBA;
	Mon, 25 May 2020 07:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F9E89D5E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 03:41:49 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w20so3091634pga.6
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 20:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Eu+Ho/X9r7MZN52F/RomcQQtgjiQ+X/m9AkGhdRXtC0=;
 b=PmqbvbjfQbPp8aCgYV4adtOizlxzzoYkkP3BmW00smgp2fP0Bgb6gdyaUQ4hSIboyv
 v17woXHMmCbO+WITpNoew3ZTtwk+GINDY8hwKAcYqbhKR5mfY5n8Sx6wOC3DKlVsJ254
 LC94GQMZAP7XMrauRY3joLeFA5EyYlu3MTIORwdh5K6lKQ4XbdESZQCBS+FTPbumlf4A
 WElSv97Cre7PEAgs33dgrOqpa7Caw6r+g2WUAH+gf6a6dTsV05j64XII4l4nOrXjlXB5
 lVAnOeQ9wLz5J4uOpLCjlTipqGfMETbFE4vqCnbX2n8GsVykhRXpzBRU8Xuzqeu9NO5H
 w0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Eu+Ho/X9r7MZN52F/RomcQQtgjiQ+X/m9AkGhdRXtC0=;
 b=Eck+5+jjuEurTbIsaOPDZmq3Gd5XzXGB1XgIPl0hNFGMpgqs3KnPBiMwpFxXV4ytJ3
 Vr9DsRPnGGE1ZpEO51jZxVnoT8Qle54DbcZxHch4k6ChMoXKY11annzsR5emSTwRHCgn
 FiYf4Bb8y7w6XpDy9/TGPHBmWeUyAPuP512mQ5fNkcFkh6LH37/N4Nw+M52+1snGs208
 OCNkaJ8kxpEAJpzdDRNv9PAkPGI4DzfvCpBFeJzbNqELc1BIvFEkjTn0vTAafLTJTdb4
 kKXoE9JO7xLURXC0gfYk8IpIjzBI0jD3xBqwDNAZWso7zMlaYnjWeLXNmQuKX3Wrt4Xj
 g3Mw==
X-Gm-Message-State: AOAM5303o6HjJsqjZShsECGnaS14cctsPkayEXtOO8mXnHMD+oTsBIXq
 ZIRVaA5shb4oTn50tZ+nUQk=
X-Google-Smtp-Source: ABdhPJxIuHMaJzv5SBEYVh6aGCYw3zkHcCsCQujjuOk1hJAg5OSAvXpvA0RjBvenltA1HqrMvGbYhQ==
X-Received: by 2002:a65:41c8:: with SMTP id b8mr23889318pgq.265.1590378108951; 
 Sun, 24 May 2020 20:41:48 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id 7sm11981695pfc.203.2020.05.24.20.41.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 20:41:48 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org
Subject: [PATCH v5 8/8] spi: flags 'SPI_CONTROLLER_MUST_RX' and
 'SPI_CONTROLLER_MUST_TX' can't be coexit with 'SPI_3WIRE' mode
Date: Mon, 25 May 2020 11:41:02 +0800
Message-Id: <1590378062-7965-9-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
References: <broonie@kernel.org>
 <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
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
