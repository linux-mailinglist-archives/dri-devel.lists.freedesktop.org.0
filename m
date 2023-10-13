Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE107C81CC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 11:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B86610E5D2;
	Fri, 13 Oct 2023 09:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE7D10E5CD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 09:19:03 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c9c5a1b87bso15150925ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 02:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1697188743; x=1697793543; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kqA9WASf0rt1GODGT89PWw2CZu5GCXUQdsFwPZ6SIJ0=;
 b=cACKw8/g4LsLZ3Wt2TrWK+qleCoJvCLrZFWVzxGB3Ux7aJU4HPzP1TuV8jO3IB06tm
 BCFNIXqVSQMCY+7ENaS+kwhTwOW1hg/3SvtDqBA2xEsx2X9aqLmWtSgUDSWnGVtTpRZq
 oG2K1+DWK+Mog+GHwp7X2KBbAxkVyQOaDxEFr78P52eDPve63aSloQ0gk+tP4JR9UWwi
 En6qEmabsEeBlhxINb/qYdAPm/IxbMiuLURrQgMwUY4cyJdoRMByXcW5M9RNwaDufAzk
 7PLhsB6TJn5gYpzjhj/rErq4jE0Wmoy1uG9pvcXdciO6k9SGg5yiu354E1Cwxq6E0L0F
 yprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697188743; x=1697793543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kqA9WASf0rt1GODGT89PWw2CZu5GCXUQdsFwPZ6SIJ0=;
 b=a+NgC11zB7iV9Df+Nmz3q8LreRVYdP1E+mypHLU+gIQEmf4VPNQshr9R2Mk9FnZM+G
 7vnjybGTQgjZG3EJxy/ek1p43iSqb/bUEmCSJ1nUKJIbP0iUzlWppOlHEoZVL9UtsNob
 5WOtr338O1FQiSfAEaIYpu4oz+rfIurUozAeXszBJgmQb8LzxTayw+BNNyzsxu4NVI1M
 hl3wKnOLHuY8Y1jMIrPpw4CmZrxy5P8ACwKpzac9HFfIo8o+1fG1hRwmqN6p2fAkNn+9
 /suPwf5bamVeqq/JGe1d4vhbiwxMXUc7lqOZVjy7SF+VepdJms/Qx4g3yjET4YqWjzCr
 w0Qg==
X-Gm-Message-State: AOJu0Yw6I6chg9KzYDxEFZyUSh8u163elBtrYgs4lhLmZ++DunKWWRmM
 AeqsUZ2JrpWrMG1mw2pGaVs1qQ==
X-Google-Smtp-Source: AGHT+IEc87RjQARm55jvLdd75qCIeY35w7Xa1klLLldOHDqoZf9VOBjCfBWwOXYG2IhIQ8U66ZVP+A==
X-Received: by 2002:a17:902:8b8c:b0:1b5:561a:5ca9 with SMTP id
 ay12-20020a1709028b8c00b001b5561a5ca9mr19841350plb.50.1697188742960; 
 Fri, 13 Oct 2023 02:19:02 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 jw22-20020a170903279600b001b8a3e2c241sm3427168plb.14.2023.10.13.02.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 02:19:02 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, linus.walleij@linaro.org,
 swboyd@chromium.org, airlied@gmail.com, catalin.marinas@arm.com,
 will@kernel.org
Subject: [v4 3/3] arm64: defconfig: Enable ILITEK_ILI9882T panel
Date: Fri, 13 Oct 2023 17:18:44 +0800
Message-Id: <20231013091844.804310-4-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231013091844.804310-1-yangcong5@huaqin.corp-partner.google.com>
References: <20231013091844.804310-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM_PANEL_ILITEK_ILI9882T is being split out from
DRM_PANEL_BOE_TV101WUM_NL6. Since the arm64 defconfig had the BOE
panel driver enabled, let's also enable the Ilitek driver.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0777bcae9104..c3453dcbad3e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -813,6 +813,7 @@ CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_SIMPLE=m
 CONFIG_DRM_PANEL_EDP=m
+CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
-- 
2.25.1

