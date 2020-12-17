Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B02D42DDFB2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6EA89BB2;
	Fri, 18 Dec 2020 08:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C48A6E243
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:08:03 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id s26so25137726lfc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8m4pPEAjUTB+XLxB8Q0FiZSpVZH7FkAsOtVYHU/qlmU=;
 b=M/P4YFEmOmA7dBW3pyL3/h3IvXTD6Uw3VvYBbvCl0IeAwQVfaH0z5SlAicSGEGKVrO
 PmYy2/1eDCaRKhMT1M1squT81Rew4AWs7Wm+QRca1KosrO7Ve9owlVqkmnQoHdTDB+RK
 iyhNgZCusZ3HV9jfoK8VnrnyPDwrxP9L+F5q4WvskKX7dLpwhwV3jmtRxbM3UBOg25Fx
 1vaNyP16U/jwAtLyZ3bfO2XHZqH61jzEJsge/vqE3c8/3bxRllKdwBoder/jXpPkQXLL
 0ytz1nxtKOoHENRiye+Rg9grNeZqq+H/c8wPoH6d7GrIOudLsuDhMENft08UoQTbkggS
 MwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8m4pPEAjUTB+XLxB8Q0FiZSpVZH7FkAsOtVYHU/qlmU=;
 b=kleKEObysStuHaTDKPC7F16Y4DuPoZN4llxxKmGzAcbo/EU023EPFGyVvHj8ltyl6H
 e/4uJdHe4R5tBc2Wwes2HnudFwyShXn64oK2lBSnQbVkyo0Ri/fgmECbHN8aWh8+LoY9
 HuzP4HFfPuX5xX0WocoHwTSGY1svJIEfuCz7BVHrqxJPLUlLF4yv5MnHerA50g2925WB
 +msiQJ+c3jPpwqmHmDu1kjWle32pyV+LCIidVX3nzXJrvA4EqLw7KziTMFdTrsnhp9/G
 G91bKG8SnmE9jZGGD47XVNISx+rpkG4K56+Z+qsiZBRztgbRmcvuDSBd5rYNTJCsAegw
 HzsQ==
X-Gm-Message-State: AOAM5318P/gUAha1rQn/n6CspZ2zm8MEbNEt2uSF8kua0uOUyrbiNPjd
 dhDT7x3E519mvZ5xXBoMmvA=
X-Google-Smtp-Source: ABdhPJwlFjyxr8NFhrflzRw3CbYaZILp8i9Zi8gDSRSCmi/RtwkwrCtk+vx2Ky5r0OD2SP3QX43g2A==
X-Received: by 2002:a2e:9913:: with SMTP id v19mr194762lji.209.1608228481635; 
 Thu, 17 Dec 2020 10:08:01 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:08:01 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 36/48] drm/tegra: gr2d: Correct swapped device-tree
 compatibles
Date: Thu, 17 Dec 2020 21:06:26 +0300
Message-Id: <20201217180638.22748-37-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The device-tree compatibles are swapped in the code, correct them.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 1a0d3ba6e525..f30aa86e4c9f 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -162,8 +162,8 @@ static const struct gr2d_soc tegra30_gr2d_soc = {
 };
 
 static const struct of_device_id gr2d_match[] = {
-	{ .compatible = "nvidia,tegra30-gr2d", .data = &tegra20_gr2d_soc },
-	{ .compatible = "nvidia,tegra20-gr2d", .data = &tegra30_gr2d_soc },
+	{ .compatible = "nvidia,tegra30-gr2d", .data = &tegra30_gr2d_soc },
+	{ .compatible = "nvidia,tegra20-gr2d", .data = &tegra20_gr2d_soc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, gr2d_match);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
