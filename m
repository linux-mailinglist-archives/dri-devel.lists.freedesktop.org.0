Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE88C743FCB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 18:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0553A10E4BA;
	Fri, 30 Jun 2023 16:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DD410E4B6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 16:29:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbc244d386so16259665e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 09:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688142565; x=1690734565;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QLQomoWqlEuvut1iVqbbj5exi8ubZWITHtJI3sKzn+8=;
 b=cmgqLpfuvG+if0xbg3zKjJmHd0RdVwXPeIhGpqg1MY4MUogkWDggmX3vNdUceKIQ5e
 J4OQRqLWYhUrTFtpVRdOqJFoNtQURpTCsF9Tua/BR6KVH1Z5uwzkti3gQkxVZQNu9lRG
 0UvJt7czJeoYcSJ5N35jxfpqhWtKcFRfOosQSBu2m8MgCzhs/kJf+QIMSu7DQDxLglis
 VHTPmRYqqhZvvwdiGkLc8dcZE7EKNa4nksg57/BOwLD/22L91EVszEl8D9AkIUQxybIL
 gqvCFsZ2zb/8p+mdWlkttwzh5I94B7T5p4POfgvwOsRQtcTyvJHPy7rfVsMzeI3JC4fb
 V2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688142565; x=1690734565;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QLQomoWqlEuvut1iVqbbj5exi8ubZWITHtJI3sKzn+8=;
 b=JxuVmcnaG6axMGCOAWa2CwQGNaGbh7Htood3azsWXzz4WMiyyaNUtsKgMJ9D7FBM+d
 eFOPq5F/eQiEvMiU8lxGYm/6zwXJuqqZQeU7geOmA2OXMNalW0XolApzoi6YtfgnSc7b
 oFJgaOfNoUwH+T1oCQjXTh0wtrRuDuhJs1azt/1bf9x2pSHp7MDEiE13wu9YNnnz77gd
 7NrSIKCF7QRiu0R0ZUv/Iij4IrOBh46ntnQemsYeafUvmykQyqgoxp7DqqgHB7vjCaPO
 DJhbGHfq9TdQJyjPRIhhR7uu/2WOHMiS9/si9D0pDJ0xgK2zXoYCOlMGBSimw2VA8dRV
 JV+A==
X-Gm-Message-State: ABy/qLbrqJCpWA4R3iyr8doohJXHKA2ykmquIjUZX6xJPoUaQsS59TJo
 6n3H6CwkP2uelEbXIwNmY+lgsg==
X-Google-Smtp-Source: APBJJlFauMJrbtEhAPnBe75TN+jmd6XzbnZMpUxj/sIL52hxut6neaSf+FGnEne95dLchbEIkdRBZg==
X-Received: by 2002:adf:cc86:0:b0:314:1244:7fe5 with SMTP id
 p6-20020adfcc86000000b0031412447fe5mr2455634wrj.55.1688142565225; 
 Fri, 30 Jun 2023 09:29:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 cx16-20020a056000093000b00301a351a8d6sm18835836wrb.84.2023.06.30.09.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 09:29:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:29:12 +0200
Subject: [PATCH v6 5/9] drm/meson: gate px_clk when setting rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-5-fd2ac9845472@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+pwHqu7ZxC7Ri6gVdtmlOTLk1wyBSRQ1FGdiXUQUWjE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwLbtNANq+/HzXMwO/oD3Ticr4j3+8MstaXiDrlk
 AGLwCXWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8C2wAKCRB33NvayMhJ0Zt2D/
 9ruyKKElwSqnsoH9WgUG+bQVpc7hi+zAfq714A1xl/IfX6w66J92C407oo1AmST/B7W8nthq2Icl64
 fRZYduun8JHmQE4z82jK3SzdIIXIOe7MJbgZTQbewAwmgbWlWR6uDh8j3KWL5moO/Qn+HAceY6AMBW
 Xz89TrKd6lZYNbksxR3ZdREBUFa3kEbzpKPvuCib1FrsHu3FY/kBVjcZxRBvFXFeyNQwyLVTI9Ww3a
 7iuy5hJlISdeqkRwCOqHDSezEKlfVlCO6vbGEeR5elF2Q0gxfuT+Po/bLLroDP7UuQmtxTna04hF5T
 nuRILRb4+2cb5eOV4392RcLaquxbFdYT+UmaBX3L+7xhDUU9gNciuwNmeR2aIaBEjhqzIHVCbMwyuQ
 vqVhlJM6+M4LPZhy0qXpZuQsuvyinYOY8EcWTWP9taudTNuOD3KD95VMkEpj9ZLoaZojc2ULEZ01oO
 /jwv3hk0TeDgVP72XKk85vJbYGC1xMLkll8XGFDhFOvKHO3B4DEWLkrkyzh2bBS8+VJjh7W42QNzpw
 OuqBk4nmoVKOS0rgHsbN3u0I2sGwFzntG1CU0IDTyfEaI+5kCL/SjIMz6M13N0O4R0zZB6Ak33fDwo
 HUMEub2+IlcdqBVY5vf0vzpRJPzCKd7VO91ARFOBj8+1GAiTwBAlDqcemXpw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Disable the px_clk when setting the rate to recover a fully
configured and correctly reset VCLK clock tree after the rate
is set.

Fixes: 77d9e1e6b846 ("drm/meson: add support for MIPI-DSI transceiver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
index 57447abf1a29..dc63d2d813a9 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -94,6 +94,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	clk_disable_unprepare(mipi_dsi->px_clk);
 	ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
 
 	if (ret) {
@@ -102,6 +103,12 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	clk_prepare_enable(mipi_dsi->px_clk);
+	if (ret) {
+		dev_err(mipi_dsi->dev, "Failed to enable DSI Pixel clock (ret %d)\n", ret);
+		return ret;
+	}
+
 	switch (mipi_dsi->dsi_device->format) {
 	case MIPI_DSI_FMT_RGB888:
 		dpi_data_format = DPI_COLOR_24BIT;

-- 
2.34.1

