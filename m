Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380A66B26CF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E576E10E831;
	Thu,  9 Mar 2023 14:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F3F10E82C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:19 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so1334157wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371799;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=alc5ZV/1pwYoBZ2ycwbaMzjt9nufHBTeIsNkvP9Z/qA=;
 b=vua8HsX6kKMtxhCOPTEhPvzbt17dD3wWW2uq5glryvHByylmTsLCpgU5WM3WNUF0cO
 wzB0FSV8uUa3MMF/4Qqfieq/XGppreoONGRPZCL/kiKdsvqtHrasMq8I4AMYTux85uAW
 CyVoGBsp3ybkrMGZ80QS+feAsGNiiJf7FFmYXyPMbPBB1gn54JyAv2A5LEYoaTXZNVlA
 qq4RT02R0VXjUZyn8ClKB4blQNYyF9CncPLPwOP8KqylLsvT7kkNrWqYZPyCD0hqn/Bg
 EHen2OuYqWhqANYBCYFF56aErhBRzfRI5EGHKGzmlCwnGuy2LcUlaAcfY5EchL2QinhX
 JZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371799;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=alc5ZV/1pwYoBZ2ycwbaMzjt9nufHBTeIsNkvP9Z/qA=;
 b=zknahDpGOJYOr8oEdtnNspuITsmj9Y9I5gfrulKlnM1gec2Wt+Xs1Q3bPq51yrLcbO
 bUjcaS4oLbiojx36Zd1seSsP0pObYEmpDSQaYEHTdBpi9gP/e8ZvGmZNPJOwGNB7HNm+
 kqpTf7iAWXnT/eJ6SERdcjVuzNO+RBOaLL6aMGcyVD8UD3WL9hoQAZtG4ngj8P5fvNit
 uOPY0r+X00jhM5kjr9nJp5PFpRP/9OhqeMccwhRK+qKcC2+D/5pNqcsQltuD+9Xv47Eh
 UJtZ50IJjs/teKHYidZYPe99vpLVfWMklGa90xO+VLNWCehSU+rdRRl7l6ANqwbdWvKk
 CXBw==
X-Gm-Message-State: AO0yUKXkc/m+epbudKYFS824k+S/zb+tsXJyC+OkTNQ9O0lcVmE/TOxE
 eBZhh1MPA5ynPKAF6YftWQS1Yg==
X-Google-Smtp-Source: AK7set9YP71aZ+iDxfdYv7zEaWCrl4hWKev1CRBj3uDH+u/8sul7d53lYUV5ewUWAi7P0urgT2YqQA==
X-Received: by 2002:a05:600c:1c05:b0:3eb:4501:6c60 with SMTP id
 j5-20020a05600c1c0500b003eb45016c60mr15940998wms.5.1678371799212; 
 Thu, 09 Mar 2023 06:23:19 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:23:18 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:08 +0100
Subject: [PATCH 19/21] drm/mediatek: dpi: add support for dpi clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-19-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2131; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=LHehVthqafMFi2shlzhoL6bucBM/8YioVECWdgiMt+E=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+fJd/zbdyiR8zrIOwZ5qUWp3Pc/rEc2f1zcfE
 aU7fNHSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURZKiEA
 Cbnd4JuCuoVv+myBWfMfN+Xe/5r43m//AH/pF0zz/dKWYHjR21eVuBr2nkywXEB+R6j2g0EA1tvEI2
 3yHndYsPjOEMgSIHzwH7E0aCUJ9KN4wjI7mS1fPjFKO4JIyIB/BGm5v7JkokueaI+hiTDW1NzD4G8V
 mE5HCXCvQuTs3CcyLp1mzVcLkh0iFW5EralJF29N7+XvudmxfKgiHxzCYdzKOU+ErUZwBQJSOK4HHu
 7ApWDCfzG/zxWdFSFAsIcy4LZDzEQCrEIWYZut//aX5WxO1Ln91OcbSzGBDX1jQYG+NlP1be9QqJHc
 xGvtbyiG0+zs0t2tAyyPgBywfRZNtCgT57eIW+LZfmbyL00VxSeGQ3r8VFZYGrs6LHmoBPza/7bFcT
 LksH73pmIvnFNKBeUXKgrQedPu5alhwdM6AIgKyeoZ++dsWX8ExvfPh5w48CBL9j1kFL9c7KPsAa/y
 y86nqA9/KqWEBO+j2yI2a7dJJ97nDCrwG7S7FBva6uyi6ZdUrl9xgaq47ys9vp2ZJPo7oGtetIG3BZ
 OAEj1Jb+ykkZ0vRJQaME57g0bPcBpxlRdFfUm/e94AV5VnKFESWovJwX1MnbrBozQPX6Q9ukTsIuSb
 Yn7F69dk0F4Vnxbd9nT8ZzknfB4py9MAW8yY8lssErbBotFIGJpaPJqFnxlQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabien Parent <fparent@baylibre.com>

MT8365 requires an additional clock for DPI. Add support for that
additional clock.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 4317595a15d1..474c6e5bbf04 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -68,6 +68,7 @@ struct mtk_dpi {
 	struct device *dev;
 	struct clk *engine_clk;
 	struct clk *pixel_clk;
+	struct clk *dpi_clk;
 	struct clk *tvd_clk;
 	int irq;
 	struct drm_display_mode mode;
@@ -464,6 +465,7 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 	mtk_dpi_disable(dpi);
 	clk_disable_unprepare(dpi->pixel_clk);
 	clk_disable_unprepare(dpi->engine_clk);
+	clk_disable_unprepare(dpi->dpi_clk);
 }
 
 static int mtk_dpi_power_on(struct mtk_dpi *dpi)
@@ -473,10 +475,16 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 	if (++dpi->refcount != 1)
 		return 0;
 
+	ret = clk_prepare_enable(dpi->dpi_clk);
+	if (ret) {
+		dev_err(dpi->dev, "failed to enable dpi clock: %d\n", ret);
+		goto err_refcount;
+	}
+
 	ret = clk_prepare_enable(dpi->engine_clk);
 	if (ret) {
 		dev_err(dpi->dev, "Failed to enable engine clock: %d\n", ret);
-		goto err_refcount;
+		goto err_engine;
 	}
 
 	ret = clk_prepare_enable(dpi->pixel_clk);
@@ -489,6 +497,8 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 
 err_pixel:
 	clk_disable_unprepare(dpi->engine_clk);
+err_engine:
+	clk_disable_unprepare(dpi->dpi_clk);
 err_refcount:
 	dpi->refcount--;
 	return ret;
@@ -1044,6 +1054,12 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dpi->dpi_clk = devm_clk_get_optional(dev, "dpi");
+	if (IS_ERR(dpi->dpi_clk)) {
+		return dev_err_probe(dev, ret, "Failed to get dpi clock: %p\n",
+				     dpi->dpi_clk);
+	}
+
 	dpi->irq = platform_get_irq(pdev, 0);
 	if (dpi->irq <= 0)
 		return -EINVAL;

-- 
b4 0.10.1
