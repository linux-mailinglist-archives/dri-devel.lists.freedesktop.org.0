Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA91745D03
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 15:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B564610E0F3;
	Mon,  3 Jul 2023 13:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A64890BE
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 13:21:59 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b6b98ac328so65738671fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 06:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688390517; x=1690982517;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Dmkv6C+3q0OhDNXDylTCb+3rSuoihy22b5khGTWPfYY=;
 b=x56IXe8RIxnYL1+6pw4NtYfv1qktWK03Hq4LtRYerU8753MlMMPlbfiYQu112xui2F
 Yat4bSpDBts7bX0CwkfuEbJTpa2E8QqxQrFYOdq43hC913JaII1dpWGPB+y+9exS0KoC
 XeLezG/yqBg/w1SzEhw69RYK7Az1UoFjzGVJkiyp669P2tn5iX99KvLDYM7vIECcswcP
 duATm8LgyLut7Yp1B9HJOb+yGUo24OVNgeLnh/U8b9CkRzmv4XLrjS7nacIM9fGBtOd1
 PJdMHZg87m4VXTNWl5bNYOijkYnVOikgDKxRSofwGAwPyrjV2UyA5ZZ83VJRwLKPNdVG
 qyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688390517; x=1690982517;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dmkv6C+3q0OhDNXDylTCb+3rSuoihy22b5khGTWPfYY=;
 b=AJMcH47btnkg1LOWJ66XzBmQuWJJFCNFLnyhUYaIbMou+IAlSJsTV57VEPIr6Et9NU
 i661IhXxVDWGcENoqls7Yoc9+kgHCdnFPoGJzsUX6gNOdAvV8SLi/yb/VKaCjcGY17ex
 kjjtuIUYkyzlzEH4tFRIJWEh96+SJeajB4XTXQX4K4JAkkPy3wA5ig/mbG8ctoM4hJmg
 IhwHaA17yX5dIDv3x6aEavHSYNXs98vAC1Ceg0T+lnYC1cCpU3rD5+nQKvzlFZ0ZDbQA
 OvpCJFBulXGxl13ORCmUcNTeSEemsIXWYYHK1rQhbYABSvWbDAy/1NwaJ9PNw3VkAxhm
 pkjw==
X-Gm-Message-State: ABy/qLZLbHNkniWMLxUrzAaYnQ/RE2arxhnFzobNJ9PZVaUPw4SI7BiB
 f2h4zMm2RkyDr9ExEmz/wgCJ3w==
X-Google-Smtp-Source: APBJJlEJ9liFnDdgt5zlbz3HnNnpx+fVn7iFxhT8RwbTd+Zf3sz9814lDIWRJDoGqZPUxu6XwYc2gQ==
X-Received: by 2002:a2e:9f4d:0:b0:2b6:bd09:4d64 with SMTP id
 v13-20020a2e9f4d000000b002b6bd094d64mr6888676ljk.34.1688390517732; 
 Mon, 03 Jul 2023 06:21:57 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 u10-20020a2e9f0a000000b002b6b7a98c4bsm3535238ljk.77.2023.07.03.06.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 06:21:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Jul 2023 15:21:50 +0200
Subject: [PATCH v3 2/4] drm/panel: boe-tv101wum-nl6: Drop surplus prepare
 tracking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230703-fix-boe-tv101wum-nl6-v3-2-bd6e9432c755@linaro.org>
References: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
In-Reply-To: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
To: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>, 
 Stephen Boyd <swboyd@chromium.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.3
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM panel core already keeps track of if the panel is already
prepared so do not reimplement this.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 6fd4c9507c88..358918e0f03f 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -51,8 +51,6 @@ struct boe_panel {
 	struct regulator *avee;
 	struct regulator *avdd;
 	struct gpio_desc *enable_gpio;
-
-	bool prepared;
 };
 
 static int boe_tv110c9m_init(struct mipi_dsi_device *dsi)
@@ -1748,9 +1746,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 {
 	struct boe_panel *boe = to_boe_panel(panel);
 
-	if (!boe->prepared)
-		return 0;
-
 	if (boe->desc->discharge_on_disable) {
 		regulator_disable(boe->avee);
 		regulator_disable(boe->avdd);
@@ -1769,8 +1764,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 		regulator_disable(boe->pp3300);
 	}
 
-	boe->prepared = false;
-
 	return 0;
 }
 
@@ -1779,9 +1772,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	struct boe_panel *boe = to_boe_panel(panel);
 	int ret;
 
-	if (boe->prepared)
-		return 0;
-
 	gpiod_set_value(boe->enable_gpio, 0);
 	usleep_range(1000, 1500);
 
@@ -1823,8 +1813,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 		}
 	}
 
-	boe->prepared = true;
-
 	return 0;
 
 poweroff:

-- 
2.34.1

