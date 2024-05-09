Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 808628C0F3D
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 14:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA2F10E793;
	Thu,  9 May 2024 12:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="edbeEeMc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2F210E298
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 12:07:26 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2dfb4ea2bbfso8074621fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 05:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715256444; x=1715861244; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lAJ0ir3EvsiOixSkrLpbfd6IrLvM1qhtQ0lJENdLIss=;
 b=edbeEeMclk9FcA3/bttYrrs4nplabeq6pXkrRl55Llepy9H2LT+jC2sCGdQXWn6baI
 KRDukVtMjFTL+caFsdVaIdeLfGtjd+tlAQOOHTOvmTycidVrFKaDWvposaRZCr3DwBk8
 bK1Te4Pmnj80CUQ7U0O+mX9S0kGYWSECnAPUVLUebsuAz27cxtY+OEi2oFlsDMMHvcSK
 YRXzzY7H8tjP5NQXs2zyYuy9QALYJeG9tFTN+oGHewNNqYDAwQqQtIvlMLHiRjgLztLU
 4G5bapKsW7oxl8l8cjdcRCQtqPNALSIR9/+kpKsDtN0kQWldIpAOcVt4wRH6Ywq7NthV
 P1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715256444; x=1715861244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lAJ0ir3EvsiOixSkrLpbfd6IrLvM1qhtQ0lJENdLIss=;
 b=ri6VgJR/0Q7jpEztW6c/OacXlo90lCZAVh7Nu4Z9P9R0AHAqgHla6GmMwNHgnmJY0o
 sjsFBLsIGPljDrAgCX+FZlpLrIi0Nde3Y8XJ1x/jpXCg4jWVZ+qVkwL9AUiGjmrty6WD
 FHenlPpfTv5Uw7S/tLJC38n9k5A7kNDy4w5dPusPR94HnatOyokmIp/02lNEtEqb7T4T
 EKOJSTYQL6ubqceTw7JuBu7ouGABbBOCMMP23VS9v/YjwRXhfVBtkU9F28FDHXL7m7o7
 ki2jEcYFQVn6HkozgX3kC7rbCPhU9R3eQKwcQm8qr7PuhclD+umKYoJWewCTRyOJ0LqN
 p/EQ==
X-Gm-Message-State: AOJu0YzGkFiruKkASuGgUo1oPGXOxjsC7i0WoyykJ2sVLR6BcZh91Sf8
 nMQw7ek2SchAtVBCPfjQAWiK4UcRSrqsJ+3nx587btZIp2FDqTQ=
X-Google-Smtp-Source: AGHT+IFUYRwayrG45zhDJt6ESVgR9RDCoOYAoZNv9N+U2t+cQ8R6nC8DmHzJhqkPB1HbzzA7y03QZQ==
X-Received: by 2002:a2e:9005:0:b0:2df:dae1:b2c0 with SMTP id
 38308e7fff4ca-2e4473a9373mr34950901fa.13.1715256444099; 
 Thu, 09 May 2024 05:07:24 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce1912sm24112005e9.11.2024.05.09.05.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 05:07:23 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Alex Bee <knaerzche@gmail.com>
Subject: [PATCH v2 3/7] clk: rockchip: rk3128: Export PCLK_MIPIPHY
Date: Thu,  9 May 2024 14:07:11 +0200
Message-ID: <20240509120715.86694-4-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240509120715.86694-1-knaerzche@gmail.com>
References: <20240509120715.86694-1-knaerzche@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export the D-DHY's APB clock for usage in the DT. Also drop the
CLK_IGNORE_UNUSED-flag, as the clock will be enabled on demand.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes since v1:
 - reword commit message

 drivers/clk/rockchip/clk-rk3128.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3128.c b/drivers/clk/rockchip/clk-rk3128.c
index 75071e0cd321..a20d1fd25e2a 100644
--- a/drivers/clk/rockchip/clk-rk3128.c
+++ b/drivers/clk/rockchip/clk-rk3128.c
@@ -526,7 +526,7 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
 	GATE(PCLK_ACODEC, "pclk_acodec", "pclk_cpu", 0, RK2928_CLKGATE_CON(5), 14, GFLAGS),
 	GATE(0, "pclk_ddrupctl", "pclk_cpu", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(5), 7, GFLAGS),
 	GATE(0, "pclk_grf", "pclk_cpu", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(5), 4, GFLAGS),
-	GATE(0, "pclk_mipiphy", "pclk_cpu", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(5), 0, GFLAGS),
+	GATE(PCLK_MIPIPHY, "pclk_mipiphy", "pclk_cpu", 0, RK2928_CLKGATE_CON(5), 0, GFLAGS),
 
 	GATE(0, "pclk_pmu", "pclk_pmu_pre", 0, RK2928_CLKGATE_CON(9), 2, GFLAGS),
 	GATE(0, "pclk_pmu_niu", "pclk_pmu_pre", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(9), 3, GFLAGS),
-- 
2.43.2

