Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81AFAA4C3C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B131610E79F;
	Wed, 30 Apr 2025 13:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LQcLpycI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EFE10E79F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:25 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43cf861f936so12552935e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018081; x=1746622881; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hIYbRlauLJ+HBkfmmmxeYe7riwQD6vu+qiBT5eLd3s4=;
 b=LQcLpycIsVMx++Hl8i2eBahpz1I9ZUGUwLqTgetbo3RXrjmwRXy6wNp1mlT+WdQ82R
 OCduH2mmtWOAEaP33128ISE0uvPm/OOFbUU1rppJ4JtmalOKQlDql/AahYwqeoBsem7h
 xPrVxhgHeVdgR+1utRoz6TAZMUxEDyfj8BZm847gtXvYM2hURPMz3OwAPKWTepLYiJMg
 VL91ntOZ0erpK73lDGBNe8PCxAcM23bb6gZN3l3Hinn72CSSP/rnvB+SKDOG3Vn2KZbH
 Ov0u6LrOkhXeWl20XCrMLw58I4RrHdE0l0asUQXO6BYEiP97W+R2LQJw1AneixkQann4
 rSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018081; x=1746622881;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hIYbRlauLJ+HBkfmmmxeYe7riwQD6vu+qiBT5eLd3s4=;
 b=TWBt9/+ERwlkFjkG6XpBOxoAWmIOPWU9FcCDtvkt0V8/ySjaOB6DLpOCL51sZBxYX0
 ZlJ6BZg1ilkCjcSkHzUBqD894WlYa8hMm1NguKfJNcfmFZqczNjIGWhnlHKtv0Lom+YL
 5JA9XBwqBW+Gcl54GEmZkmPMTebZ4sc5WFR/yX8CGuTH0FXV9sp/EkSZvpZqEcMuk3ss
 hcTmDVCf5KxpNaeQLanzHjapXe1uGEn9n+qzmn1T+M39vGkHpgTzyxEbgxwcUTiFsyU4
 37QMj9UiXNq3GfaLal3hB9yrsE1DtkuhA7k9q1vJ5ezIujz3rT24XsjbJgvB/zqehY1b
 fAPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0h5xGUhDK4oJo4V6HpWPrBfgJOkXtzkdOQB4TcGOmE4BgpglE+JFkDx4EnPZquOn/vydLkd2u0IM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzW78to6GoR2P+XrFn3c9epLxNyTW1z+vZQKKJZ1Ai9kVpA4p5N
 HuHWg3vHz8BqoHPFNFOMg4G8ohF7BHbAdKHMTJaQ+wq7dIq7XB9GK4paTS4Mcl8=
X-Gm-Gg: ASbGncvubQthlhhU9eiAfQxpAl1WrSRmbwANceP/PF6vLYiyaEsJijqeJB6ybAXd61F
 NRqr8WY6T2i+e+0lbPLgtdhhQzOoabTbWlOr5fQjfOC6oD2+lDq+QdPaEjKoc2PVwqPXWgR02DT
 OitxgS2AvEGSGBjnma6+zrDD1+IOlVkbAOvdXVTWunp9oNYi/OYkgcoYm92RF3+58TRn/jZxl2C
 h6VnNsf7wLzZ8m0gHKqm0ZCacLSsuHTSzJ6key7qtpJjlzmeZUHypUQgzOGt1ZVsP8rmt0h4LTy
 260RLRdZU3AaibuVN3EcE31I3PIM8djMwDhhR2/g755SneG+J9iDtCWOo+c=
X-Google-Smtp-Source: AGHT+IGy0iGND4CwDZaIUFykzdWsI+BN8WeV0wSy847evjGpU0JOHr+Ib1tzikoVHW3i7zcwk/UBUw==
X-Received: by 2002:a5d:64ee:0:b0:39f:6ca:9250 with SMTP id
 ffacd0b85a97d-3a09007e507mr674529f8f.12.1746018080066; 
 Wed, 30 Apr 2025 06:01:20 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:36 +0200
Subject: [PATCH v5 06/24] clk: qcom: dispcc-sm8750: Fix setting rate byte
 and pixel clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-6-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1649;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nfV/7RmHoNigN+etRFO22PUSZ15tfZ13Ey5db/FH8m8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh75XYczpa1XRjEYY76w1vQNfkUN4i5qCoYTp
 HwwGkhur1iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe+QAKCRDBN2bmhouD
 17sxD/kBPOjHuljMicN8MnivmvbeOMOG6jLOk89d/9dap4GTebCFuxFDorsrNL91hdES4O7aiby
 rT/Qxv6qCxnvvkM0FVnggnSTY5gNWYcxiVD1e1wn0y+3Z03Ng9saCC1GUhyhAKTAYVZf/fjBrnU
 XHanIHAgdXPXvVbxXFipCdZHtywQr+QEpoqdBTADtnFSlTogSRmq6yOG8o15VVm9LjR2zHiS9OF
 x/lWqKJFtvGyW3ZGP8Sf9dN8RUlMD27cTAk+7dJwIlWPOUGLElzppd05ShKS9MYOzpBOWPc16q4
 t6u1+Il04mXUL2US421holVpBfFTXQU+ESXesex90exg6lMsdULKxaEJ+FuV1bFuz929ELzXykz
 y1Ssqlvl6WFuSVrkZuMisxRlELabMiGxrxs2P7Q7tJZdYqr5wxtMOaXIksAyFlleZ4oRcLGooZx
 lSBTijG+fe8L5DJxiASGKKKoxa9OwyKDSnJbU//ucnKKOauzQ6mDw+B5DoAeIHHVYYYkvqqWTL7
 p0hmMDcQYYA5RzuXWjCLUomf+HiTzN6dpdNJ7h4cYiFlCTV8DGosQ1JXRnxNTN+DiWZVIvZyx0E
 Jh0QkVO+1KaEFiJels4h0qJKL7Lyn5k7zLp/t2JJTTlDsDiVOY7cJr52yZUrPlXKwwMhrargwS5
 tbbp/QQ3V8KjjkQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

On SM8750 the setting rate of pixel and byte clocks, while the parent
DSI PHY PLL, fails with:

  disp_cc_mdss_byte0_clk_src: rcg didn't update its configuration.

DSI PHY PLL has to be unprepared and its "PLL Power Down" bits in
CMN_CTRL_0 asserted.

Mark these clocks with CLK_OPS_PARENT_ENABLE to ensure the parent is
enabled during rate changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patch is independent and can go via separate tree. Including here for
complete picture of clock debugging issues.

Changes in v5:
1. New patch
---
 drivers/clk/qcom/dispcc-sm8750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
index 877b40d50e6ff5501df16edcffb6cf3322c65977..d86f3def6dd06b6f6f7a25018a856dcc86fc48eb 100644
--- a/drivers/clk/qcom/dispcc-sm8750.c
+++ b/drivers/clk/qcom/dispcc-sm8750.c
@@ -393,7 +393,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
 		.name = "disp_cc_mdss_byte0_clk_src",
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_byte2_ops,
 	},
 };
@@ -712,7 +712,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
 		.name = "disp_cc_mdss_pclk0_clk_src",
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_pixel_ops,
 	},
 };

-- 
2.45.2

