Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A968BD597
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 21:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CFC10F094;
	Mon,  6 May 2024 19:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eLNQC5g2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A73510F094
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 19:44:02 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a59b178b75bso370852566b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 12:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715024640; x=1715629440; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PLmJpQfp0i8fR/OZHQc7F6SpjNiFbXRgibuQG4wYtJE=;
 b=eLNQC5g26G9+EWGVtXmrDj0ukfudRl8idryNQnjkq2PLRtAuuZoNvMCM1Sc7xlU9Bf
 ejf49n5yd/7MQTkXcb8Qbhp/XZvVd11glshYJe7Bu3+lSimFuvlRK09hW7xRas2HtxsS
 dZe/4Fq9C9eViYmq88quGmvtqcYN6hgb1d3aVl/wQ8ec82JyPHKjBL5kHU3o3aNOWZ5w
 osE1EZvYoXxThjdnbDigMgWHoMBew/ecsGWxrQPzmMSADXum2tg5LZfepEZ5kTMmWGjh
 7MARWvE7Gwk8GkvzGrJ9+XWzqqtQ7qbimm3SUpCqWucE3bNBZtD2/yeH/7fAf7ccEkOt
 nXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715024640; x=1715629440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PLmJpQfp0i8fR/OZHQc7F6SpjNiFbXRgibuQG4wYtJE=;
 b=Kucy2yvKwurhZGxofuAaqoySiOWZKUVAT/ghh3NptHtvUuZkWHWksB62slg6+C2lhq
 02b89noM2kh7OI3alWnp3cSrIi/eU+Hso9yk5BR2VC2TyL7oSWVxDrY4xb1nR+Xa/P3J
 InN/CD57RnKOyjZ6Yrau+Zr0v+bB3zbhd/vGBwdCreVqMdZsTVFjGNAI7QUvw7F1uew0
 HbdSHdaye3hUDeRpHKi/00H+0Tg5xfsnu5obMdBzQsHTR6ZH659wccjDFuWGgISgClCc
 jJT2F1XSA5sUG36LbAnMQSFm2O3VihyfhFwo8mgax9lJH2RPWnctyt/3eMPUJW998Oij
 +XLw==
X-Gm-Message-State: AOJu0YyyYo1TYXx6gG6/363Ql8SW97g9m9J/owcBx+O/FxW+if1QUAsY
 yHgZJJzSwLS9MdgKbVF0nnTHwCsjpIkpP+EYESNsioPz7sr2zFc=
X-Google-Smtp-Source: AGHT+IGDj+tvzGciAi1r06OdYCZHDNbAHnwx7wQTTzXXKYnWB5EWtuUN/+YC062uYGlKprlYMawinA==
X-Received: by 2002:a17:906:65d2:b0:a59:a727:1e8a with SMTP id
 z18-20020a17090665d200b00a59a7271e8amr4215668ejn.8.1715024640454; 
 Mon, 06 May 2024 12:44:00 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:1c62:e77:6753:5729])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a1709067f8d00b00a59d146f034sm1367321ejr.132.2024.05.06.12.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 12:44:00 -0700 (PDT)
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
Subject: [PATCH 3/7] clk: rockchip: rk3128: Export PCLK_MIPIPHY
Date: Mon,  6 May 2024 21:43:38 +0200
Message-ID: <20240506194343.282119-4-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506194343.282119-1-knaerzche@gmail.com>
References: <20240506194343.282119-1-knaerzche@gmail.com>
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

The DPHY driver requires to specify a pclk so it gets exported here. I also
dropped the CLK_IGNORE_UNUSED-flag as we will enable the clock on demand.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
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

