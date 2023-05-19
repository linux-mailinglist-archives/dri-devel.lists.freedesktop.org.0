Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826CB709F33
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 20:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57CD10E609;
	Fri, 19 May 2023 18:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B4E10E603
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:40:29 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2af20198f20so18348621fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 11:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684521627; x=1687113627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=05qnFOdHveL9ZpOC2nuyEPb0iBdZysTZh5jPv8h4CkU=;
 b=W5g/gM+XUVmSA1QbVt8sGgOoYK6fsPqCjmeDu66O1tn00s+5SBZX3t43nxEYFbKtyN
 klf6w6CZTB9wOMDf7bwMwj+IjczyvsZ2+tvFVNhTUchLYMz3MhOUeMNOg6A+5poANWFQ
 Ec9GK7O+HuF2H2dQcnHGbO+8CGV15JME+aGQvAr0QcrmwztvV7T1Y18cAVe8ssXNUKOg
 qRyQo6sG8Tj86hMT16GMin6LmGE1XEv7u8QCE7k2f/e6vLvtMcdn61uxdxzVQjVKaC8t
 o+XALENNJBfIHPI7fMkxAC7S9ElYvtH4QxZLhIF65L9qzLMY/BvEqMSt6DoCvs+HytCW
 ZwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684521627; x=1687113627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=05qnFOdHveL9ZpOC2nuyEPb0iBdZysTZh5jPv8h4CkU=;
 b=HrimkNdfr7uZvPG2na5x+EoJWYd+V0wrPY8o8nIACzeI7S3sbMZRTqCEdxNzkcOKRQ
 2XLAhgDOp9DfflAYziyavKpxhuByd0q6V0vxT2FK8JIlLjHJYvwA50mxZ0iUr/k/CsD6
 /Nnq2vNchA9z9ebZGyYo5aG/Stm6b7AwhLJpeVYlm66KwAdajYrcnzNJTE4uFPsuTAMA
 LsOx72L1KgEF/uG4TiKUPajk5r0UVX1ARRUBYFFSixTARshIqIQu+G/d9gylRR4fIYA/
 SuYVl2zAAAikfBUJ2JHygrCdS5ota5laSXWuBBCPxV/N8WghuX+cnfpenT3yTDioQJba
 s3Zw==
X-Gm-Message-State: AC+VfDzUDsiFH92hv3esxRR0leVP73YoytdFr8/8isxgJNKWu2KYzCv+
 FEZ4FSYkJwatfeFmPH1pBn7CBQ==
X-Google-Smtp-Source: ACHHUZ7gso66GswZQzRdwkBxhPHy8dF+hDyY3E5igQeeRkryD5Z8PdVLm3wZiLHQrt8jcyd9D99PGw==
X-Received: by 2002:a2e:9097:0:b0:2a8:d1cd:a04 with SMTP id
 l23-20020a2e9097000000b002a8d1cd0a04mr982650ljg.48.1684521627511; 
 Fri, 19 May 2023 11:40:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a2e96d6000000b002ab59a09d75sm932493ljj.120.2023.05.19.11.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 11:40:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 3/3] drm/bridge: display-connector: handle hdmi-pwr supply
Date: Fri, 19 May 2023 21:40:23 +0300
Message-Id: <20230519184023.3943362-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519184023.3943362-1-dmitry.baryshkov@linaro.org>
References: <20230519184023.3943362-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some devices the +5V Power pin of the HDMI connector and/or the ESD
protection logic is powered on by a separate regulator. Instead of
declaring this regulator as always-on, make hdmi-connector support the
additional hdmi-pwr supply.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/display-connector.c | 55 ++++++++++++----------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 1d37e57242dd..d6a9aa589d17 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -191,6 +191,18 @@ static irqreturn_t display_connector_hpd_irq(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static int display_connector_get_supply(struct platform_device *pdev,
+					struct display_connector *conn,
+					const char *name)
+{
+	conn->supply = devm_regulator_get_optional(&pdev->dev, "dp-pwr");
+
+	if (conn->supply == ERR_PTR(-ENODEV))
+		conn->supply = NULL;
+
+	return PTR_ERR_OR_ZERO(conn->supply);
+}
+
 static int display_connector_probe(struct platform_device *pdev)
 {
 	struct display_connector *conn;
@@ -319,36 +331,15 @@ static int display_connector_probe(struct platform_device *pdev)
 	if (type == DRM_MODE_CONNECTOR_DisplayPort) {
 		int ret;
 
-		conn->supply = devm_regulator_get_optional(&pdev->dev, "dp-pwr");
-
-		if (IS_ERR(conn->supply)) {
-			ret = PTR_ERR(conn->supply);
-
-			switch (ret) {
-			case -ENODEV:
-				conn->supply = NULL;
-				break;
-
-			case -EPROBE_DEFER:
-				return -EPROBE_DEFER;
-
-			default:
-				dev_err(&pdev->dev, "failed to get DP PWR regulator: %d\n", ret);
-				return ret;
-			}
-		}
-
-		if (conn->supply) {
-			ret = regulator_enable(conn->supply);
-			if (ret) {
-				dev_err(&pdev->dev, "failed to enable DP PWR regulator: %d\n", ret);
-				return ret;
-			}
-		}
+		ret = display_connector_get_supply(pdev, conn, "dp-pwr");
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret, "failed to get DP PWR regulator\n");
 	}
 
 	/* enable DDC */
 	if (type == DRM_MODE_CONNECTOR_HDMIA) {
+		int ret;
+
 		conn->ddc_en = devm_gpiod_get_optional(&pdev->dev, "ddc-en",
 						       GPIOD_OUT_HIGH);
 
@@ -356,6 +347,18 @@ static int display_connector_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Couldn't get ddc-en gpio\n");
 			return PTR_ERR(conn->ddc_en);
 		}
+
+		ret = display_connector_get_supply(pdev, conn, "hdmi-pwr");
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret, "failed to get HDMI +5V Power regulator\n");
+	}
+
+	if (conn->supply) {
+		ret = regulator_enable(conn->supply);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to enable DP PWR regulator: %d\n", ret);
+			return ret;
+		}
 	}
 
 	conn->bridge.funcs = &display_connector_bridge_funcs;
-- 
2.39.2

