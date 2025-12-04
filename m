Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E241CA27CB
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E2D10E847;
	Thu,  4 Dec 2025 06:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="btqLtVZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115D210E847
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:17:14 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-640c6577120so838057a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 22:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764829032; x=1765433832; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wDV4ueJ5OUHwsY4jMIVfrhYRT+0a4XHLxBIh9+KCo7E=;
 b=btqLtVZmQUvExQtunD3lSIwakfD5A/roQZVu/R0+KPYaSdOgZis4xQwbvWg6U/Q3ht
 vaOgYO5FpIOcDzs8Um/Jevf+j+G0gpVZMEwrOs6FK3RcOvpa7qkzFGfmw4YygjClZ7b1
 XHHOL0Cvag6+vTmfzSzStFFX3ZB/PJEhR63kwKt7MUQPWLFLa2vn4kWdL97rVOO2RKYi
 AFRJ1Mp5XqjrzuVdlu6lYIJlOxQpJnIQquiYgrLwu/mpyhj+Qo6Trn96sZpq+7QNmFG6
 RtQ7wAmfled1TDErHyoNcqvP9Uf1oh8Vmyymh+vq5yftH/Ll/DLJ5UIQPDRBvtI6nU5Q
 4BHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764829032; x=1765433832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wDV4ueJ5OUHwsY4jMIVfrhYRT+0a4XHLxBIh9+KCo7E=;
 b=SK3NRgSvS2UOq8+2jQGmANM6zUiwG0gMy/fAsf+EIytIJNlteUjImzkll0byrB3hGx
 SiZIo5ywqk2x3xaT3VGKgYE2jOzIwshzMMA5MYHMJvjVpxAjaSiwua2ci6hv3pLcn56t
 C85wPTlMO7NExFVprIBdCI4N8IfZUgUE9M37XeN+AJWW9KN6JgBYXJKtX4f2aSjwqq0q
 dYM4vPuat5PvvlQAa+ZZ0X9wkqzYFWF74LU9HIDNUlGJe4DcUKcD5lftuBhwHP79wkx+
 zNTarXSM610gkldfbAd5JqFvQG2Hm8wIqfcAVJtT5r4fNmP+FTijYxv95kFNhe0o5Z8i
 tIHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC4YwTwzLo/kTXaZG+1xKc9bztIqhwpBQhAJphLM/A5pSGzk4yN6fWg5vrAYhhzAOdfT5gwrmmbbs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgC3Y/rlPZmYPzDoLhBVm51TPs4xKgHmVS5rJBEOr2jiZZAI28
 xjWbLfuoqjNzuuZxYZ1WvbnJgnW9n2WHdIGWnQPfPEqYvYNv3JxSsr35
X-Gm-Gg: ASbGncu/bPw+ngWENh60HZxQEvllqDFB1ZuMiKH6bmKN3JVHL4eSDScURXZZAGaGLtN
 X295f+xPqXVfjaCIeLVNe+BTEhQApBuu/gdxTzMM1yQpJ+g0ds2JppQyxsfZOBlH0JQ52WVq9v/
 P6TeaqJ8pu01p6G67LKbD1naSvUJpDsBtYhWAR3SigjxgxXyANUZzkaH0oJ9pRcBhhqW2nIrKt4
 VX/QZgC1Mvrxh3hYjwEACcMINlexig5RBRL1UhlCg3OobRTrw9jrb3yGrnZiEX/ykmp7/NlofO9
 bXRLCcj9QmBC2+wU6a1TWYw01kFGBKoqf0fistFm2n7fgssh+sFjKCKZ6k6/oj5mMV6a7yaEV/6
 AcL8ZrrlS+dhJzI42SEHe7oszZHQQeGGsDaxq9hXyPV8m2/v0VKdNGh4aHPT0QLrIHrdVPcITIk
 s=
X-Google-Smtp-Source: AGHT+IHjjOps7OFhIOvLIknNQvKPCH2qAuahzZ5Rpu+KEg83rMQ1MpF/A+ajRn484dw3CkB2Jg5bjA==
X-Received: by 2002:a05:6402:1eca:b0:640:cdad:d2c0 with SMTP id
 4fb4d7f45d1cf-6479c49b919mr4308385a12.25.1764829032448; 
 Wed, 03 Dec 2025 22:17:12 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2ec2d8csm490159a12.5.2025.12.03.22.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 22:17:12 -0800 (PST)
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
Subject: [PATCH v2 1/4 RESEND] clk: tegra20: reparent dsi clock to pll_d_out0
Date: Thu,  4 Dec 2025 08:17:00 +0200
Message-ID: <20251204061703.5579-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204061703.5579-1-clamor95@gmail.com>
References: <20251204061703.5579-1-clamor95@gmail.com>
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
Acked-by: Stephen Boyd <sboyd@kernel.org>
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

