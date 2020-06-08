Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6AA1F1E81
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 19:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A91E6E993;
	Mon,  8 Jun 2020 17:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5379A6E991
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 17:49:00 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t7so6951459plr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 10:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YIwI7n7N4VQPufeFuOMvSL/7+RKCUZGC7cYkecAGvXw=;
 b=ZL/xMo+emwIGJJDYKlUTWBSUaZLy53IDoh4ECTHldAYzsEhYULXTfHE17Ihg5yS9s/
 GknxH8a1g7MMdbLIncWs0UnD5Gyu0da/rncun2hoJCW3QuwBCypNjBMBCWjKXEjxQnKY
 1Ua9dWh3ALilAaZBwqBXOw+Ql0STZFO8QKaB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YIwI7n7N4VQPufeFuOMvSL/7+RKCUZGC7cYkecAGvXw=;
 b=dRUlot1nsQ7IohGbJyZLMSfiVL3Phb7srNOTK1i4aQMcqeXsJsv2bLZDgusRkA67Uf
 JGS2jcBDdaP/kH+EjXWMcwBJYcG1qvseR/ruS//drHVrxhrsFMAV7KdL/Q60afHYO403
 HAb6s3nHvd3kw6+GZzOUgyRciZnN43XB7ZF4qKytiGUoHAZBbtjkI+c/g2UdjhIyH7Vl
 AdqZGidcGbSljMoTyT5CxQ7KcGiQa9H2tCWkba4fWnsnWT1DqhdC08C1NLe+QxshqHgN
 Y0DvnNB7xZtQ8TnnrXSPsdgMP1SLjZ4XzHh7tG4AG9TJWoi2250sCcxohlJ8r5kD+FEI
 slXQ==
X-Gm-Message-State: AOAM532urg6QLXsQ6hXXAdgY8foCVI+E3LsnMkJVtTAZyaVK9b/WWmbH
 ITQ+e4h9whG245LpbGw72i/xng==
X-Google-Smtp-Source: ABdhPJzg/YUFjJB0n58ZSRa8E0eiVaoklc/4+kOj1C57x3OTuyE0OCpKhKcw+Hm/Y+pNC49YSXIRyw==
X-Received: by 2002:a17:90a:9f81:: with SMTP id
 o1mr431427pjp.139.1591638539924; 
 Mon, 08 Jun 2020 10:48:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id n7sm162682pjq.22.2020.06.08.10.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 10:48:59 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: a.hajda@samsung.com,
	narmstrong@baylibre.com,
	sam@ravnborg.org
Subject: [PATCH 4/4] drm/bridge: ti-sn65dsi86: Check the regmap return value
 when setting a GPIO
Date: Mon,  8 Jun 2020 10:48:35 -0700
Message-Id: <20200608104832.4.Ia4376fd88cdc6e8f8b43c65548458305f82f1d61@changeid>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200608104832.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
References: <20200608104832.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Douglas Anderson <dianders@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 spanda@codeaurora.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 bjorn.andersson@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ti_sn_bridge_gpio_set() got the return value of
regmap_update_bits() but didn't check it.  The function can't return
an error value, but we should at least print a warning if it didn't
work.

This fixes a compiler warning about setting "ret" but not using it.

Fixes: 27ed2b3f22ed ("drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 1080e4f9df96..526add27dc03 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -999,6 +999,9 @@ static void ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	ret = regmap_update_bits(pdata->regmap, SN_GPIO_IO_REG,
 				 BIT(SN_GPIO_OUTPUT_SHIFT + offset),
 				 val << (SN_GPIO_OUTPUT_SHIFT + offset));
+	if (ret)
+		dev_warn(pdata->dev,
+			 "Failed to set bridge GPIO %d: %d\n", offset, ret);
 }
 
 static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
-- 
2.27.0.278.ge193c7cf3a9-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
