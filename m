Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDAB74E6FA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 08:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81D510E312;
	Tue, 11 Jul 2023 06:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CF510E312
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 06:13:32 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbc244d307so60749265e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 23:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689056010; x=1691648010;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o42Ks/tCHx59zpvkkxrFyhauoCCL1U7JUVEYu4RWWvs=;
 b=z8inQ+8MaqEzGKghYbTWt23tvZEQzsRbXLm7xauCjIH2NLhP0I3qVQSwTtGjwyLvrm
 xQ9bT7gT7LcA1bLwQyLOak1ybj9Z/QkM6HMKkFyNAMBBIsL1fREXvXYtH2IOmjZ62s7f
 8P4NpAkj5Kc/JR4uiF3A+d/Z+g+wB3ZXIvdO6nT1E99yHbQHEYY4Asd5fvJQU1gLvms0
 2Z/xX5af6r/vsvasoFMoVNK/G67xCRmzopDm0hePRoy1kwrYSPNwo9UQnM7bW33Vs5oX
 sp+8ChSIMKNfefGBojcBp+GNNAsEiGQ0YSduEIp+bWDc3VEBdsJ4C+KUSMlnPzRS0RBs
 LpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689056010; x=1691648010;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o42Ks/tCHx59zpvkkxrFyhauoCCL1U7JUVEYu4RWWvs=;
 b=WT057/weGl8/luprHuLbyBcsJd8OMPgfJYxQQeg1abB40F/QX8q1n96Ca9FyeiXtlT
 LJ43KzteqxCnCrg3QVTKLIwSFoUwJ7Hb8qWHP06QmwkuGAkX1lRbUnAkKFSnm94DhkHq
 6PLMSdP+EqLqdav5Qbt1jS2afMDB1cMLirLCqeSjFW5kzipHArl8DR4eWmjkN4hQtARb
 8wZW3IX5focQXSEPL2PSRbAStpkyFQGPBZcVd2A9+17hTr9vZF6SJ5w9JMZbIe89WDpa
 LTcPjHnwjphmqyU/uA9j1pU/u9Vd1HZBeJVv3fFKxo2zoSg+KR26fn1kBrf/vSeG5T47
 fwiA==
X-Gm-Message-State: ABy/qLbwt9JgjIQe5Dy0rcUKzME9lxR4HVDGqCdk0ihP+1OdZGoDIWBH
 pAg2UMKJTf7FZw7WqM/5wbFmyA==
X-Google-Smtp-Source: APBJJlHE2lKKPaUynutVNkXNfVhKn5DdgxT7YI1AidUkNO+4JOc3NtprI1IvH5G5uV7tFh1/jMariQ==
X-Received: by 2002:a05:600c:c8:b0:3fa:95c7:e891 with SMTP id
 u8-20020a05600c00c800b003fa95c7e891mr16791835wmm.35.1689056010209; 
 Mon, 10 Jul 2023 23:13:30 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 11-20020a05600c230b00b003fbaade0735sm11944239wmo.19.2023.07.10.23.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 23:13:29 -0700 (PDT)
Date: Tue, 11 Jul 2023 09:13:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH] phy: phy-mtk-dp: Fix an error code in probe()
Message-ID: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-phy@lists.infradead.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Guillaume Ranquet <granquet@baylibre.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Negative -EINVAL was intended instead of positive EINVAL.

Fixes: 6a23afad443a ("phy: phy-mtk-dp: Add driver for DP phy")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index 232fd3f1ff1b..d7024a144335 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -169,7 +169,7 @@ static int mtk_dp_phy_probe(struct platform_device *pdev)
 
 	regs = *(struct regmap **)dev->platform_data;
 	if (!regs)
-		return dev_err_probe(dev, EINVAL,
+		return dev_err_probe(dev, -EINVAL,
 				     "No data passed, requires struct regmap**\n");
 
 	dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
-- 
2.39.2

