Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CF2B46DB0
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F72B10E377;
	Sat,  6 Sep 2025 13:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XkCfEvvW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F78010E0F9
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:17:17 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5608d792558so3470104e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757164636; x=1757769436; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4wpKL/VW2mP4lPVTNMBZP3xn93sk8skKfMbrLSoiJVc=;
 b=XkCfEvvW6W83mEJH0X/o5GThlOfbddeGXDIL10jwjCccIf2O88WBwyvjtuf0XTEOB8
 /Vokbbb2pHS+KYPHCj7DAH9WUrJQFoq3+mngqkJVb2/0uyaUdxgpLpWdGKdlpZGGvR4n
 jppl8QXpx/PsBlzNrUSM30s0k3r6GSiE9c+v2H3hOWDugYknJEDP0kSi7Z6KG6MB/JaK
 W+OYuv2IRY5Xs+mKAdpcPm10W2vtQbvGLLty3LJujuOa3iax1Ta38RnSr4sef9e1FVMw
 oZIz776UD7eX8200O4OvcJjWhlHxpO+xMFHAJTvVtnm3Q898XNT+gmPYsuQvAEP3wiY/
 oiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757164636; x=1757769436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4wpKL/VW2mP4lPVTNMBZP3xn93sk8skKfMbrLSoiJVc=;
 b=F9+nz3GJICrCMKkuGqWx3lfySEUMj2mpBHCM1vatOouOL5qCrMebZdZetq/Saihbjm
 p5hj4SvlhoRUPGwU8xa9qMqbJ/8B7AIS9hFmi8h3JPgyjfKPepXintUJvPjT59VYqs8Y
 B2xmwbVwEPomTchvIepB12y1UHnY3vhIf4wQplJALKq4BFgpjGY5h1xOUPMLoLXtEEBI
 JlikmN4v5MCqpzTDQbXROVT4zFBd+8LMsiT7zoibOeUXsBsJeq44K9uz4L0g+ceindDz
 yTSMSuB7aPPuf6eZCP4lHBRBqXxypBOWnzpLzgRO52B5EEbBdibJMkxqqR0vrRo2uMSK
 E6qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDAnZ+A/C7VslsWQAthOhkchWgf2MMh3aYOdj2L5dRjIEIPAMWvhih3bUL3aUVHG4XlcF/fqsSu78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBCHal9E7fPn5N6Z7ymH+SAVLOHDn4YjcvYyzrzpnU34bkhc7B
 12lfhQ5j8I+/3iCt6NhIQmh9vuKwVUIlyn3rUdu/vEEPI668sMQK46+W
X-Gm-Gg: ASbGncvF4wx/1Nav++Lwcr4GbpGAMlQBuFPYO1bc6Z83BkdlSVgT01Uz8C/9khhbZIs
 fOjU/hBr35JF2L9UeZ6gEF2yL+q+OyTQa9vLPPmHjKAh/PqMrkuNNEyS0++L8/c2zN9/VNRC2tH
 Dys7Zi2NO2doTbB0w4gY5ksqIVSeLGS88GhUDr2I7IyEgG4tbDw8rQopQWLfZFwmpytgl9Qj1EL
 WTzXECv4kYx6WS0PChiaGq9UmE/V4nO7DVsxG4Zpd1DaXveR2z0p/wLIu2IJnwHuCH4w1d+uPY/
 oVHdoimsIegreLByBmBmjQ+yP0Y31CkzS3oHrIamVwj9+BQBzkyzwN2ADCN/y5/y6YUS1QTrN/Q
 Xdy2UFlGvhzPLVdd9Uss4HuHKzF/iLQxlgfg=
X-Google-Smtp-Source: AGHT+IF4vcK+yMCzXEsm/lgvHaUClNHtNWTSnCt3HxCxB3oDHp+2TiZa9QXeqNeqFvnHYqhQnPQXSw==
X-Received: by 2002:a05:6512:ea0:b0:55f:4b12:755b with SMTP id
 2adb3069b0e04-5625f53609amr549635e87.20.1757164635374; 
 Sat, 06 Sep 2025 06:17:15 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad44f8fsm2312647e87.137.2025.09.06.06.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:17:15 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] clk: tegra20: reparent dsi clock to pll_d_out0
Date: Sat,  6 Sep 2025 16:16:52 +0300
Message-ID: <20250906131655.239340-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906131655.239340-1-clamor95@gmail.com>
References: <20250906131655.239340-1-clamor95@gmail.com>
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

Reparent DSI clock to PLLD_OUT0 instead of directly descend from PLLD.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index bf9a9f8ddf62..9160f27a6cf0 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -801,9 +801,9 @@ static void __init tegra20_periph_clk_init(void)
 	clks[TEGRA20_CLK_MC] = clk;
 
 	/* dsi */
-	clk = tegra_clk_register_periph_gate("dsi", "pll_d", 0, clk_base, 0,
-				    48, periph_clk_enb_refcnt);
-	clk_register_clkdev(clk, NULL, "dsi");
+	clk = tegra_clk_register_periph_gate("dsi", "pll_d_out0", 0,
+					     clk_base, 0, TEGRA20_CLK_DSI,
+					     periph_clk_enb_refcnt);
 	clks[TEGRA20_CLK_DSI] = clk;
 
 	/* csus */
-- 
2.48.1

