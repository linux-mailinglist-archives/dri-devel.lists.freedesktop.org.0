Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C44B2C2EA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA10D10E5BD;
	Tue, 19 Aug 2025 12:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jeRWvqNT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1803E10E153
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:16:45 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-afcb7af30a5so863764766b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605803; x=1756210603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o/oKOTJz58St1gTwh/bBKNgiqYHP+xMc0H1/D5ORgpY=;
 b=jeRWvqNTA99NOxDupTsPbcKJ9p7fWcYneDz/2j2Kn9A7gIGdDgew+SB3aXIRktxjvg
 HyLiQ/cfr1m0zDDEqSGDc8OQdWpOWmCtm2tWlgV++mjP/mHadAxIiyoyGz/xvFRNL3JI
 qu2MlTCyWIQ1cS1oeGVTOy3ME757Id21vMRGLMXotR03eWt6bl8MSmgBuxxUoeQk2dLQ
 BiUUF67t9q4pMDJ58zATnErAIw9Ezwd4VpizWIZYjUJAvqqiGXLZEFcG/PwWuzYGoipq
 yLBDEVHLcw1N3BfgHd6XazOKyFm0vk6jJZAP300QpL/xypIx/w+uDV/DqfraLWOvMM1N
 Jgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605803; x=1756210603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o/oKOTJz58St1gTwh/bBKNgiqYHP+xMc0H1/D5ORgpY=;
 b=jyIRCZALZvHrqbl5p9kps7Pzzd1Bihb1ERFPw7gW2Sevu7/HbCy/WrPB8aMwPnwqUQ
 IT2FO6+8pgG7da3l+ckohfHHeOrK2DK1ghz3ZUL9ZdrFV+9qaQepMdA7W/op0sDJGSsR
 039EVVgBb07da+oMVGA/O64VjSmPoClyY2RU4MextcdJjNPr239lbSTqlNzl+7qfzT1w
 XHuHzdibzKBOm0h8v1qW+2/F11BtDXdr0tgR2/KMk6qUe2tMNe5fY73/5mzDEbVZRCQT
 5nK4SBSRq6AeLlli6vVe169uG2srU7PN5qfaAIXC2UaWlGKB6ELq/B1KDx5uF3D6pJij
 g+QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWcgSS+XTIFXrJQTrkD5o1k+KJiuw8dLLqwmXJtlSmbOtEIwn8PkmgUwFUVCRpYDoHYtEnMxpR/YI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwK8LM7IUHjwkMTcnv+lpgzUmnXlJ5PHPd6wSl7q3Jl3mqAq2DY
 Fce4B9a6G4ZS1zu4flsQ36LcBjrZSYRD75zEWfICdMRz+AZBbzw54Y+A
X-Gm-Gg: ASbGncvFaGoxrlhz5amYNbrNuGLo6QmxeJHZTReX6wVm/2W/xuFkaS4YiIP8lPVYMYO
 E3GvHE5LgABHe6P9K0Z/Q6UL+cYmEUTKwBPsh2HSPaWyG80Iuz4ekcJLO1iigvruAn5M47MLfGy
 NJaGhwfLLL2J0S9O3IPLGjGnoqNu9Ay+QXLraLtEjxgIMHYT8SWZ7ij1BWjy6FpT4xBZhqhJk06
 uSBnx3yVWcUuhA0tyjHFjvjF7TCKggxSse6Lc2TwgfpqSee/G1HvmdNdMrDJ8uwy4Z+dCDky3IG
 Oj+ouDKycRqozTQoDztrAfMBwVk6YI/hmXCd4IMRK1su3AJRtwE12z6iAo2tNjIHceKBqnAcIgj
 X81apYTWApnMYRg==
X-Google-Smtp-Source: AGHT+IH6gI4Wt9MTamNQRuZI3BgyK+3myche9xoYOBrZQHy1Q90e/zgSuCy2a+6/nFauZvLKfIttEw==
X-Received: by 2002:a17:907:6d27:b0:af9:71fc:726 with SMTP id
 a640c23a62f3a-afddcbad953mr235796566b.17.1755605803433; 
 Tue, 19 Aug 2025 05:16:43 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:16:43 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v1 01/19] clk: tegra: init CSUS clock for Tegra20 and Tegra30
Date: Tue, 19 Aug 2025 15:16:13 +0300
Message-ID: <20250819121631.84280-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
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

CSUS clock is required to be enabled on camera device configuration or
else camera module refuses to initiate properly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 1 +
 drivers/clk/tegra/clk-tegra30.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 551ef0cf0c9a..42f8150c6110 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1043,6 +1043,7 @@ static struct tegra_clk_init_table init_table[] = {
 	{ TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
+	{ TEGRA20_CLK_CSUS, TEGRA20_CLK_CLK_MAX, 6000000, 1 },
 	/* must be the last entry */
 	{ TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
 };
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 82a8cb9545eb..70e85e2949e0 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table init_table[] = {
 	{ TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
 	{ TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
 	{ TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
+	{ TEGRA30_CLK_CSUS, TEGRA30_CLK_CLK_MAX, 6000000, 1 },
 	/* must be the last entry */
 	{ TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
 };
-- 
2.48.1

