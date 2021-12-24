Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA9D47ED0E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 09:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA5910E401;
	Fri, 24 Dec 2021 08:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC0410E3FA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 08:21:09 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id g2so7078249pgo.9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 00:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=a8eS3YXB3+KjJDuEPWQLcX+HJOufYQaI4qZVeMqQu9o=;
 b=gVjzFGHhAzx0/FUF5skx3OxxeTTS/L9yKIQQQDnqhIZGkFRxiGa2wyabresrry4kWd
 CtI69HZxWPmRaSHjtcwKk6Q6EKwjGrBTWXcEBu7c+OD7pypxBMyH2FkmQJKmxZCnOSuj
 eK7RW2qAdPtabB5ZdSMiFKaEcqG/oWTd8+JvDszUPszMDGWYQA6OAytx6VjAFNeBaXxz
 PD2oQBN9J3LadXx+/u64o+X6GN3J4URkZvhWk6TnncvA4t2MCcJ4FceeY6M+6MhalsIN
 H6LP6F423xptsq7JxCfcXYRXeZSbg7NbKnnzeEIoi2K6Ccaoj53kqriC3g++RDnH0AhF
 yH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=a8eS3YXB3+KjJDuEPWQLcX+HJOufYQaI4qZVeMqQu9o=;
 b=kr4u2hk7acvPlHIlwN3udr6j3RC9PNmEqknwO38/K8qMfY8ESQn7eDbOmm/AIDPsXY
 JmzezrieSyA64KTx1edDtgRiaGkwnYY5NJtvCBP/Brlzi9K7ihK9mU6F3UmkkFeGhCNY
 JP7oNyiMgtFlf0K3vhYfQdIWacuJzo2F0C3EQX6o8o444vSGyrjSWMRGkkEa+joE0Xxi
 Ku4zF9V3P+GNs4U1PrfE6Ay2Yc+Akfb2/6HSiKxWhVC6dM7RGWnZ6KGqsUTw/I1PUYjp
 4rRNNmYBWMZlWPylzgEZO+Ryua59aI7ffII1bCaRxB6lDbtOaW65kbLF1V2Up6Z8yxj1
 /hBw==
X-Gm-Message-State: AOAM530K6CntQrGAid/5As21tCOJGcw+W3f/I25EwMfm9KQ5kl3huvXk
 oSAGvNatPbQswkW3b+NtO9Q=
X-Google-Smtp-Source: ABdhPJwk6yXFazpg9bTL+8Bh6befkkI7lDWa9g9PRfY4jgrlEDehk1AK7OvGeVwPxLtA85dPiIStRA==
X-Received: by 2002:a63:920b:: with SMTP id o11mr5316856pgd.314.1640334069362; 
 Fri, 24 Dec 2021 00:21:09 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id a11sm6587453pgd.87.2021.12.24.00.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 00:21:09 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] phy: mediatek: Fix missing check in mtk_mipi_tx_probe
Date: Fri, 24 Dec 2021 08:21:03 +0000
Message-Id: <20211224082103.7658-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linmq006@gmail.com,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The of_device_get_match_data() function may return NULL.
Add check to prevent potential null dereference.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 28ad9403c441..67b005d5b9e3 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -146,6 +146,8 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mipi_tx->driver_data = of_device_get_match_data(dev);
+	if (!mipi_tx->driver_data)
+		return -ENODEV;
 
 	mipi_tx->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mipi_tx->regs))
-- 
2.17.1

