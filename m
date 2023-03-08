Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E366B0EE9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C388B10E690;
	Wed,  8 Mar 2023 16:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C3310E690
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 16:40:37 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id p6so18274637plf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 08:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1678293637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jgeRTDzvWlcFd73t/ENW9C7L9wpwOwUrVmn255HzLjQ=;
 b=lAOGtJmgz7dTiJ7CaN+ENZON61RvjcsM1n2GPM138hv1FUEkzI256t5bzcAyAtN8Hf
 OYOnbGuRb53BpHExelolqeynlpj/ZcYtdEDf0FoCLI9AWsc8EZF7g6VoCnTrWom3KE2J
 58iEKJE5AOR+3GzYPFLtLY5s4Fq9HPKn/kGzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678293637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jgeRTDzvWlcFd73t/ENW9C7L9wpwOwUrVmn255HzLjQ=;
 b=Fjjt4ya4gU//d7/5aPFU8iAXDjCHinuoLn4ihkhaLTsLtzyVR1QvOde6fHErxse1pU
 4RNA/wHAtt+79mA6poZWgb0fa/pc8ru34I6O8UyJLZrKUyObr22PS1BwyDzxOY7HPZmH
 FMxg8no+PlwnoCfUnaJU6uAsl8wSwN1DnEuAouVsVGmPrs6XeRbfOsg/sVdWZreKy2Sr
 F8NSPos2UN/igMQKrLbKtnigpoXBmUtVymGHplwA6Yup3ONyjNBDmdAkipqlwuVaZgsR
 yx9Acg4KjRBCR/Jz9hoUwycgHTaq8grLcTBp3shPVl9qcNyDpc+KM0s3tAHVROkgWIS3
 ufhA==
X-Gm-Message-State: AO0yUKXp5uiFdiMPM6ZkZXTBeFw0fPLiAdjd5nwfZq8HCq1jIEm2u2UR
 MjpE2mcsm5r92QYZPHsoKIbnfA==
X-Google-Smtp-Source: AK7set+wHGDiDcOW9PS+v7RynzDDWjrZOZuGSJtwXmiYKcLoW2/AF9UWR8m6jmBAls1FKi51w6DGqA==
X-Received: by 2002:a17:903:2446:b0:19e:2c25:d65e with SMTP id
 l6-20020a170903244600b0019e2c25d65emr23524048pls.42.1678293637260; 
 Wed, 08 Mar 2023 08:40:37 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
 by smtp.gmail.com with ESMTPSA id
 kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:40:36 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v16 03/16] drm: exynos: dsi: Mark PHY as optional
Date: Wed,  8 Mar 2023 22:09:40 +0530
Message-Id: <20230308163953.28506-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308163953.28506-1-jagan@amarulasolutions.com>
References: <20230308163953.28506-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Adam Ford <aford173@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The same Samsung MIPI DSIM master can also be used in NXP's
i.MX8M Mini/Nano/Plus SoC.

In i.MX8M Mini/Nano/Plus SoC the DSI Phy requires a MIPI DPHY
bit to reset in order to activate the PHY and that can be done
via upstream i.MX8M blk-ctrl driver.

So, mark the phy get as optional.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v16:
- collect TB from Marek S
Changes for v15, v13, v12:
- none
Changes for v11:
- collect Frieder RB
Changes for v10:
- add Plus in commit message
- collect Marek RB
Changes for v9, v8, v7, v6, v5, v4, v3, v2:
- none
Changes for v1:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index bb0d2502ea02..1615640e25d6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1732,7 +1732,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

