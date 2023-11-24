Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87237F6E8D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C763810E7B5;
	Fri, 24 Nov 2023 08:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CE310E7B0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:41:37 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3316d3d11e1so938833f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 00:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700815296; x=1701420096; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CvmOEb1ckbbB9zBBB0o82fMDjd1uz7C5pNwKHHdJSYY=;
 b=yEJR/Rw2+Nwb8MTph64VouJmvYRjHez+67npdT6WNTYMFlDD42fi5tzQ2FkTD4Z7ev
 xi6D47whrS/lTQD1as/hgaQnwl5WVRUj6uwHm2qKeY/5GSpKXIyEAhJxKfOzagiad8uZ
 5RAtp8bcHInJp7ToP/1ah4YJW2UWaaHrHK28TDAWcLcYoeLh0yKUprE+M63si+KAxxEm
 4NHtrGrlzw/9PfB9VuQT2MUWwSG02BMQ9x1ftJKGedIlsjmy6crqTjTPcBzN5NQasRpV
 pPm0ioroW24JbKtkZxCGaOQ1J8XpEdth2Js1ytq6m0YpFOSNX4e8dox9pqdrGZEOCtEI
 Lmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700815296; x=1701420096;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CvmOEb1ckbbB9zBBB0o82fMDjd1uz7C5pNwKHHdJSYY=;
 b=HZGokrcwnFGxsK9uWqEvwW0wU1aiyM/m1aZbOSlCmB+I05l+LsnugR7pCxqAVxx7kI
 pGZhob3keYev+x7GisPaQcyOC8ghwS0zvfn2rq3b5fzGcf72gyIltujcs1WsBlh61w6t
 Nx9Wdz4sToW/2Y40Am35T6+95mFFg7vKpEKy2WZ1hYPkhsxZmQgfuL7qtfyTlt3bR9T5
 1kQd0DyUEWfgDihRMfuFldl5i6+yrWCVe/jBTaK6v7dvj6/8Hp68e9SS7XpIyWxMguSO
 Dqvr5D0LUwXGrc/R4XjbzQbCRTV3NyesJ2P4tyc3rhfvVBYLHyCfWbHjzEg92SoVLSjy
 TCtg==
X-Gm-Message-State: AOJu0Yz9FDlKNYKo/ISI/UvRBU4DP21usNxkZnu256WelCJztzRIUzny
 y/JGoFtbZErzGmxQGmjwgjvMLg==
X-Google-Smtp-Source: AGHT+IG8oV5vR52wvy6RDc5unbTyrdle+A+ZJEr+VxtPQs/QhVcyXpGgV/X216xPtP580nNksVLMHg==
X-Received: by 2002:adf:e90d:0:b0:332:c585:4005 with SMTP id
 f13-20020adfe90d000000b00332c5854005mr1606864wrm.13.1700815296061; 
 Fri, 24 Nov 2023 00:41:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 00:41:35 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:20 +0100
Subject: [PATCH v9 09/12] drm/meson: gate px_clk when setting rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-9-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6wj78w5SzMRVYfTnHYpi/keB3/pw6jAwnhprIG9LUDw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGx2k+lycVMXd4CGKdFmLLkeE1cSxXUGJmEH5Nt
 WyqAnCOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhsQAKCRB33NvayMhJ0XmHD/
 0a1u9pKRgdiqiNPEVgNnpvsoHZQCkWeGDJUhl/1pzTgkKKwI42m+N0fYEJSu+tGjebpr24UosgSDpb
 Hdwxq8/ts9nxnJrpXxDKUQgCs66lF/JOr3TntrVHMUh+z9IoiZheukKo7E9q9hXdTrqIJDNJ6MBrCr
 M6N8VZAuqfRdGbaEpd7FEX5mQCaN6lUruEfC/rV7D1PF/jSc1UDjGevThxuJC3ngOF08pchl00bddm
 Tl6iBVLDDzjvwipVuSd0y53J7R3+yvUhONC4GYqZKlYAQ+lamPVJjDCzLqhkxSbSn71KeYkm8g5keW
 e33PL7GAouKsNVgsiK2a32ZBG/N/MEH4IGTvqZq8Bwi/zy1O2K3zixX8Dm1NV/2CjgF1gFU2MSdMCd
 fTAQjiTQX2Sui2sTWsMRP5rhM75Thas4AAr7DC/2g4HCUNiYNlpJPLrPRDSeI9wEYBFezagPZ7HOIY
 3gueBoeolSSLsKEeZWRckNUMmjLChDMtdCh7qdEAwP01Ir5DHxrQZFHyRgShFyj10HMjIRjiPF0svt
 /rjcJszqh8GJBUduVrIMd2hdP+4KWKXqmPCam/JWTZn2V40nReclE42GEEi53eFlaETzHcQuRz6uIp
 F/Up8XwbOiSWancRcIvIDmtt5uDD7vWHX6/nM/NUWEKJQtVjLKuxBwhIILpQ==
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
 linux-phy@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
index e5fe4e994f43..72abe2057ec3 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -95,6 +95,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	clk_disable_unprepare(mipi_dsi->px_clk);
 	ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
 
 	if (ret) {
@@ -103,6 +104,12 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(mipi_dsi->px_clk);
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

