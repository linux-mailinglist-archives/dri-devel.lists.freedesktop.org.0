Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BAE1F7DA1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 21:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D796E1B3;
	Fri, 12 Jun 2020 19:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6FE6E1B6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 19:31:02 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id t7so4149648plr.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 12:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/JLcL+eXskupadvzRPr0KYY4jNSs8dr6KFn31X50BKA=;
 b=NXzPbPlf441w11iFHGJ9W+Y5ontYOUwpkp86hqoqbgJR2zRFsLy6IrP6O+bPWiagdK
 qiSa5hgegSw3yVsSvyzmUrpNdQUnheUeuSEjk17lEob7A95e3T0oJdW1NpS0aaPSyQzE
 Qox/wJm24EvNxtf14X0Upc72JOgNWu4E4/u/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/JLcL+eXskupadvzRPr0KYY4jNSs8dr6KFn31X50BKA=;
 b=rlNTfgP/F/w3Mrm91YJxJswB/tmQu86Svto1iEferyZeD5plSB2rUunSlw+YiSaPYw
 UkFZT1KWeapW+N6p3HpmuLWrpFRCuU6zqWOaPxQDCZ89bVsBNUZrDqxGRJZYc0irlGyp
 W4IB5YMsp9UnRWI/BJ9SJ/Qny8W+OZvQklq305i0tySciMKwsAO+PkiqbdO+LYQ5GGWK
 3SpApan6ojv7V3Wjne+3jc5v+CQEZPhgypne+6bRhDsVgbxIU4bXplhlW+wAhU7aG8vr
 rx+1tPdllZ37U8QCG2m2ZXJgqU9imkU4XqMxOXPkXlZGBbjC08c0zLa25VU5ut4E5ZYK
 tpGw==
X-Gm-Message-State: AOAM530ilXWl/GjIeBwqI4UTRHecODK4UqVsaP5lhYnQ3NnCz6JNY+yO
 PcMfnmyLAU0kmA2kq9wlUuC1vQ==
X-Google-Smtp-Source: ABdhPJzOVu00ZU0TwmAIoVI0f6eQMllaYaWPr850VAglM8s0JUILuRPjAG0K84Sfcu8Qs1SEo2VMNA==
X-Received: by 2002:a17:902:507:: with SMTP id
 7mr12495042plf.115.1591990262080; 
 Fri, 12 Jun 2020 12:31:02 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id n69sm6966934pjc.25.2020.06.12.12.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 12:31:01 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: a.hajda@samsung.com,
	narmstrong@baylibre.com,
	sam@ravnborg.org
Subject: [PATCH v2 4/4] drm/bridge: ti-sn65dsi86: Check the regmap return
 value when setting a GPIO
Date: Fri, 12 Jun 2020 12:30:50 -0700
Message-Id: <20200612123003.v2.4.Ia4376fd88cdc6e8f8b43c65548458305f82f1d61@changeid>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
In-Reply-To: <20200612123003.v2.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
References: <20200612123003.v2.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
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
 spanda@codeaurora.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, swboyd@chromium.org
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

Changes in v2:
- GPIO %u because it's unsigned.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 1080e4f9df96..bd3eb0a09732 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -999,6 +999,9 @@ static void ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	ret = regmap_update_bits(pdata->regmap, SN_GPIO_IO_REG,
 				 BIT(SN_GPIO_OUTPUT_SHIFT + offset),
 				 val << (SN_GPIO_OUTPUT_SHIFT + offset));
+	if (ret)
+		dev_warn(pdata->dev,
+			 "Failed to set bridge GPIO %u: %d\n", offset, ret);
 }
 
 static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
-- 
2.27.0.290.gba653c62da-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
