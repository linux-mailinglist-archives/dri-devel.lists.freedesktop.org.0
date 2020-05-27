Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7BD1E5942
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BB46E40A;
	Thu, 28 May 2020 07:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BEC6E297
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 07:28:28 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id fs4so1167757pjb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 00:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/JV/008aPSkYotGfzM+L6zI+gJbJzTnEPoCKhdwlcaQ=;
 b=vVzh0duJ5UBz8i7EQglR29+3vO1ID79mbmwybvUcue74rvWvRigpxqp2ZVr0rab8e/
 Ry+7PIzSqJgossPgzHagNkc8BPkm3Z0LmHRCYUYMdsPKmv13jv5jgQTLyV598te+V/7S
 hqKUWRB04esPX6hcJbWLwzZbw/an7UI8rmCm4mnPxCTLeCBGBDFb+ZGq1l0/ewgwzmrC
 yyYNYr74oCMw9cpd4O/1QrtJhT0KIiKl20sUb1Sln7SGprcAslSYRWpjmIuzG+2ur+6K
 5JLbT+St99ieEkg+3fQ3MDwNRLoWeGDiEfLKkIt9bWYn039LtKtsXlf6lBBtvx3X2cNS
 QkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/JV/008aPSkYotGfzM+L6zI+gJbJzTnEPoCKhdwlcaQ=;
 b=h4ot0mTz2iRqBOPz4VxeIbsSHMjLKLnIy+i6yVxqkxD9bU3sIBDs45DG6rP8TPQ1Z4
 l3Kxkc8F9nMnHg1E2Yj0EOA4PkId6+xV3fXJpXHVlGjn9aek0vkQOlAfYEp3sIk5ewhx
 IbLAC8MqywGiTNrQec5PWwoDnWh9KvCJeMuErMqlmDztxzGHzWuabRYyHEgAomyDVk0x
 6WcOkluSuahhh+WG2lxW6Hf6ieII14ldlCyXXbNhIOUp5cLM912hQxXa2K19+iX87kK3
 57Kha7h9Zh5DGdCcpFrrXJuv9z0X/BbHzVw6+on3x7On6CnER3o53Y4QjqLW/Uvap9VY
 tHwg==
X-Gm-Message-State: AOAM5303mZbj/JerOXRr2gb31vX7abgHgd+Mjh1bMcfOpemtaL5BZwgh
 3QLJbaJjqcmE+Ag7nYOjy04=
X-Google-Smtp-Source: ABdhPJymWe4FoVyYbDrlihjLqkxCoTA9jfDcSnxcM8g8a/J8skMLtS/pkQ9CFWP8NSn447pUr7X8sg==
X-Received: by 2002:a17:90a:8c95:: with SMTP id
 b21mr3540607pjo.89.1590564508451; 
 Wed, 27 May 2020 00:28:28 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id q201sm1371842pfq.40.2020.05.27.00.28.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 May 2020 00:28:28 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org, andy.shevchenko@gmail.com, noralf@tronnes.org,
 linus.walleij@linaro.org, broonie@kernel.org
Subject: [PATCH v6 9/9] spi: flags 'SPI_CONTROLLER_MUST_RX' and
 'SPI_CONTROLLER_MUST_TX' can't be coexit with 'SPI_3WIRE' mode
Date: Wed, 27 May 2020 15:27:33 +0800
Message-Id: <1590564453-24499-10-git-send-email-dillon.minfei@gmail.com>
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

since chip spi driver need get the transfer direction by 'tx_buf' and
'rx_buf' of 'struct spi_transfer' in 'SPI_3WIRE' mode.

so, we need bypass 'SPI_CONTROLLER_MUST_RX' and 'SPI_CONTROLLER_MUST_TX'
feature in 'SPI_3WIRE' mode

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 drivers/spi/spi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index c92c89467e7e..f8844116f955 100644
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
