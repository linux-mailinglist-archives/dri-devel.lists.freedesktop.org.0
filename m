Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123887E660A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE3910E1E7;
	Thu,  9 Nov 2023 09:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EBF10E1F2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:00:26 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50970c2115eso736902e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 01:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699520425; x=1700125225; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CvmOEb1ckbbB9zBBB0o82fMDjd1uz7C5pNwKHHdJSYY=;
 b=tt7lIfR6YVc188E8gJB1yR5gSyegVr8FKx46AR1LaNNlKcOPqXXdbAf3syMdJZ44mC
 UmDkMJkbE7of7//RiDnzoU1vhOLZAC9xBFEbmQo/E9/qX+QMlGiVS/NHv90CEx0XDEbx
 KMgjHtGuTDHdrkSNCqXRnpRRIMHeMdIULOwbU8/6sgMjYK7ZtkyRrT8OIn0VcdPtHvMI
 69j7Bo0YluvjRYHz7tMh9MC8DttDg0kBXysk5+x3P9y5Dn+noJKyJAjFlwJE1wSGt37M
 huSbQ3G0Ho/sOaCovV5hKk3cD0YvJ9e22aKmMDWZ9B3qcp+49TMQxcjxKGfEkD+pfo2H
 XR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699520425; x=1700125225;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CvmOEb1ckbbB9zBBB0o82fMDjd1uz7C5pNwKHHdJSYY=;
 b=ASyijaJqSMqGHy9OFFA8BkUefH3yJqM8RCA1XWBaq0QKq9sS+tTSmM6QLk7mCLvuEE
 eQ0EHJ7zla/VGKAhXxV+ZChNj17JMEn3skqhAZlPuzXxhBhFItEXdGA3cO5eoPbtgDWU
 TU8wYAJnGNdhECSpJJmRNQLDt58alxxcmwVlwA563soh7P3M1JVDwQfy+yqQGZ6IghNf
 L/VvoTGPjtHv/j/ob/2oUBqIdsw0+2e7aX/VpobYJej0n/nFqgQ+IktGQIbmENGk/qg8
 d8T0eshGCiRpzGtrVv79xCjtM6WZJKnc/SAEtPeiun+xxqMqPNSpQLzNYwXInSJgRO9v
 J1/g==
X-Gm-Message-State: AOJu0YxjrzrFqttZzeNFjyTq6RZuLyV8pI0T2KisoTTT0b6tTvko8hvM
 EK+CKPjEoMc9KeLnYItt/OUMeskeDVrnFSSUkLOQEehX
X-Google-Smtp-Source: AGHT+IGXqF7rsRdCM+jnVRiAOt/RFNLh/BPKYViJgYib8D+5TeLhy81KbMIITHU+3iLnWSKCwHBgfg==
X-Received: by 2002:a19:7908:0:b0:509:4b04:6331 with SMTP id
 u8-20020a197908000000b005094b046331mr865761lfc.55.1699520424824; 
 Thu, 09 Nov 2023 01:00:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 01:00:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:10 +0100
Subject: [PATCH v8 09/12] drm/meson: gate px_clk when setting rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-9-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6wj78w5SzMRVYfTnHYpi/keB3/pw6jAwnhprIG9LUDw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+Z5DW4LqZNMoa3WMtTQHFwXqgZtKvOnapnqjBc
 XjY70PqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyfmQAKCRB33NvayMhJ0b8BD/
 4qh7M6HzQXLHJtRURxnlOaG9F4oa8yHB8C3zne8wFXHXAzpEyuOgUsfQbYZdJ/W6aLUUqtjz2U69ln
 Y/l2+MK15fZaKRgdI7irQPXCvywUoXrilkjUAMJs/tRxO22tPDTfZz85GYpP5+cZps9ktRitls6wYq
 7JpWIRjMgijfbYm+J9YYYgTkjuqdyrm04HY2Kq5X8JURjowxDXuuZZ+OsPOfZVKgimlwLg9dGJhSbG
 7n29v/jdbcNnP9CK797lllMU9n9ynTMVXfGx8x0rXniM+qEjosu9w/TGJLy1TfcuY54BzVSQ/amfP6
 1pzZa/mqNKpGUmD4ehEkFAQ5RaUEtuPGvK3mrT2p2PW5PM2VPjYXVI3bUpOfDh5RbeWKK1Y7s4KK02
 03UXzUWRmzXoiUj9wN+MM99wBbF+BYndZvG7mWID3eD2Nlozxn8IqsFdFCPaNNLpQk6wmujhMtAvEK
 dHpHXrGJFfU9Pkrdasyt6L3mJu8elLjk7U9OrLJn8eHpFiTMcWpeexwqh4Scs3e3xpK5vCoC2nWQz/
 ZJqyJowaiDk04eQVFscV8y16xXAOt1Qz4RpalktRwQvCXfxHehWn6gLxNLzfhuAFtzcJWCrsd1Ag8b
 IAbS1A23BtxkuI3+WDf6pelXXBZwIqo3bvutoZVwON8abaKmoZIId0hHg3LA==
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

