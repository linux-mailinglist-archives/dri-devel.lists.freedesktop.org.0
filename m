Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090856F9B4D
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 22:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83DF10E2E7;
	Sun,  7 May 2023 20:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6226010E028
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 20:12:23 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ac82912a59so39506091fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 13:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683490341; x=1686082341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tN9UmRR6NCVISEJTvLFdwDTdtCjwWI0mPnWcrQiX3S8=;
 b=rkR2pp1LenpEinbprWUEUTikGmz3SN7P8aDWpYAuvMF/CtGfcQ66Y+qwqC1E+3M2RS
 i60CuHoGwxmcjzv/spf61Jrd96i6gnXx6Dt+Q7IiY0osBB/AT1jKr0J11bG5OJHwqhDx
 C83ykONsCjX6a44XXqf58u5UlP9Qffb2dmDF8M41+uaMAUAuvc0Y6XXAhbh6PRBoHICD
 9G8W1Y+PUgUvRJqM8zsn4pKRhzbbdMT2bVWeyPL9cJkruppt6qIXs+ReXIEwPPtAgpz6
 B2gD0zXkK0VKlDFg3GnfdePNg4QIGgfbmEKRFIh1xDwWV2XNeqga4v0XEkLcBsC3IxHo
 iazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683490341; x=1686082341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tN9UmRR6NCVISEJTvLFdwDTdtCjwWI0mPnWcrQiX3S8=;
 b=GOp9RU+S0L0xuC/RmTCfcFes+XxO2F13znv3KC6QlGS/jiNoZ46O4jY6IprfCjsR5T
 ZYHYjtELSNh7gN0geM7nHnCr2AVBJmn+CtUmN6shKPBPvdOEO0u9Hhpijh9Tfep8b/xe
 dRpdyvhDOZnfu69OzqfatYb6NNgWutul0rkxpEZPp+4nmtR4kTXT4XUtaWHt13KJ3Cr7
 dir+PpMBifWl4bMQcXHLeaDbB2uDX8uyRXyo/o/u1II6mTB6v7ricfuA0pvMmekdWKur
 TsuilCwZvjWbrmQ5xuIZBLhRxghI/50HjhsGE1UCZPCamAFxq9pV5w1ajj+J7zwp+PDu
 OhKg==
X-Gm-Message-State: AC+VfDyvPBsWs8Y5fe6fovZv2leFTcLKNXMKphe1ttqxl2tD+c0sGqoJ
 UPKYtXWOTBqqNpG5TUaQWfIgCIvm1Xkx2/Qnj5k=
X-Google-Smtp-Source: ACHHUZ7h6zvBF64UzZn83MeikvKNCHQJ6AH6QNwDldnHxGpkQFML5mUoLQuSl1k2+w2UBzAtNLYJ7Q==
X-Received: by 2002:a2e:8502:0:b0:2ac:7137:5f13 with SMTP id
 j2-20020a2e8502000000b002ac71375f13mr2141964lji.9.1683490341174; 
 Sun, 07 May 2023 13:12:21 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 f5-20020a2e3805000000b002ac74f5f022sm916522lja.0.2023.05.07.13.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 13:12:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/3] drm/bridge: display-connector: rename dp_pwr to
 connector_pwr
Date: Sun,  7 May 2023 23:12:17 +0300
Message-Id: <20230507201218.2339014-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507201218.2339014-1-dmitry.baryshkov@linaro.org>
References: <20230507201218.2339014-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to adding support for the hdmi_pwr supply, rename dp_pwr
structure field to the generic connector_pwr.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/display-connector.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 9a12449ad7b8..0d94e6edea50 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -24,7 +24,7 @@ struct display_connector {
 	struct gpio_desc	*hpd_gpio;
 	int			hpd_irq;
 
-	struct regulator	*dp_pwr;
+	struct regulator	*connector_pwr;
 	struct gpio_desc	*ddc_en;
 };
 
@@ -319,14 +319,14 @@ static int display_connector_probe(struct platform_device *pdev)
 	if (type == DRM_MODE_CONNECTOR_DisplayPort) {
 		int ret;
 
-		conn->dp_pwr = devm_regulator_get_optional(&pdev->dev, "dp-pwr");
+		conn->connector_pwr = devm_regulator_get_optional(&pdev->dev, "dp-pwr");
 
-		if (IS_ERR(conn->dp_pwr)) {
-			ret = PTR_ERR(conn->dp_pwr);
+		if (IS_ERR(conn->connector_pwr)) {
+			ret = PTR_ERR(conn->connector_pwr);
 
 			switch (ret) {
 			case -ENODEV:
-				conn->dp_pwr = NULL;
+				conn->connector_pwr = NULL;
 				break;
 
 			case -EPROBE_DEFER:
@@ -338,8 +338,8 @@ static int display_connector_probe(struct platform_device *pdev)
 			}
 		}
 
-		if (conn->dp_pwr) {
-			ret = regulator_enable(conn->dp_pwr);
+		if (conn->connector_pwr) {
+			ret = regulator_enable(conn->connector_pwr);
 			if (ret) {
 				dev_err(&pdev->dev, "failed to enable DP PWR regulator: %d\n", ret);
 				return ret;
@@ -389,8 +389,8 @@ static int display_connector_remove(struct platform_device *pdev)
 	if (conn->ddc_en)
 		gpiod_set_value(conn->ddc_en, 0);
 
-	if (conn->dp_pwr)
-		regulator_disable(conn->dp_pwr);
+	if (conn->connector_pwr)
+		regulator_disable(conn->connector_pwr);
 
 	drm_bridge_remove(&conn->bridge);
 
-- 
2.39.2

