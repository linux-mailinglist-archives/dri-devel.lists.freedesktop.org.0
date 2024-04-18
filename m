Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019578A9C88
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D1A113CE4;
	Thu, 18 Apr 2024 14:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DCxlb+wk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46967113CDB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:17:31 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-418c979ddd2so6561965e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449850; x=1714054650;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=h3otSZuiUA0RBdwKSB/5nO1/TIttSyxWSp9sd21V3FQ=;
 b=DCxlb+wk6sf5uzOVazJhxAfWBz9ycNU3kNE2xrJywuqUQOVaeXOQqsQlDC6hpdtsvt
 Ysf4f48TtWe6BNFB7dpKUmwTioHUGkdZgIUKfhOkYu3Cc/Ta3BOPOx8DOXMMsI5whjI4
 rOVjIxqOtA2K5MzoboKoqwS4XxbPERfm6ONJaJkNEhU0tBe/6F4HSBwv9ItUeM9ZRxFH
 X59UMxjWVfhfS9r3HuStMjL7fb0Svc+Y4VZfxDRnm8q1uZzFT+gEE8b8vNg6BbCvhx44
 Wv7ujFGx96LmnzJ8/vTy9UpNXXmEuL8C/dqGDP+uIxCqF/fh8W6pp5OeNMs1DK8GCnT/
 RTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713449850; x=1714054650;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h3otSZuiUA0RBdwKSB/5nO1/TIttSyxWSp9sd21V3FQ=;
 b=uFELcXY0jcrSQo1SxjdqXoZUfrfHSjQI7hESwyGa+tKS9UZsOSZydwac1Cfrv0lX/W
 hNEp6wWIB3mpMhFygu0kjEIDuJPnQzcPURF+yuzfm/uWbUOmIh5oa6AWV7QXBb3ruLGT
 5/sTk6umIeSOlR8PoqrLCay5YzluNYzllGINi+xbHlgsXvYXQvSbuLp9m2grbPDB7Ta5
 ww6Qv9NPsEfTNCYznikKvc5mLCPSveGkgLDuyFPj3SHgm/IKclquEgme5ZtGpkUIbQ0N
 ZS+E7L05Uz45FrPxWGkGEDzFo8FPd4B0CEvdUOweVY2G9ZnQEVhQbr0bprEGpIjZHR5K
 AMyw==
X-Gm-Message-State: AOJu0YzbfjpBNMnglw5+MJBionULk7tmFzEH0199cscYdLxS+MbxSO6S
 on3xV1j63Z4Awev87hkDvyQieQbhmr3B1nM2Xd2scIcEeuIgLRZhQMgFzvOZQv0=
X-Google-Smtp-Source: AGHT+IEiQUufXTv7FJcYkp/QB82CY+QyZl0A6G8qICn/+gCfoWDUcq8617KoBHtq/0X/7mU0hAwvqg==
X-Received: by 2002:a05:600c:4ed1:b0:418:d2c5:5c65 with SMTP id
 g17-20020a05600c4ed100b00418d2c55c65mr2438790wmq.37.1713449849699; 
 Thu, 18 Apr 2024 07:17:29 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 07:17:29 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:17:00 +0200
Subject: [PATCH v3 12/17] clk: mediatek: mt8365-mm: fix DPI0 parent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-12-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=CxkLUlifqvxz1G/Eho8b8T4Is6DgFjTZfGPXl6VYPH4=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStjTlVje5tb59O8ee6DHe2YEYRuzYS3qUOt1aEr
 ArPtZJaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHURQqNEA
 CYVXzwd+84f6xIO7EyRZqTIThqTCaSd0BOLeBN/VzpJk8gHezkxoYZHgiCRin94aHkjaR7VSMB/Quk
 qBq+TiWTMhA1/zaXb41ylAI+Dyew3JUPmpZ2M5T8yDYNnbEjiOAmGrAM9/+9bsp18Y72CDZgcRkkT3
 +VyS01NGZZsojIayz9SpoHYeJfa/MUxZ3tUyle4MMHJYbvkMs9MNQ619sgiQTWiE2+Q41Fv9dY9VoF
 mbVjtEs7R3f79z7ueli540F92j2WQZ4oJZ6LuQ0fGsXezsTGv/qfuoTmBHIVXRVY8p/9ciqrrnl8BP
 LVfYA2WXi8SJBZxYMYEOspJ2EYlIQyIZ03FG/bPJsvB7CYsuC0f4yqlwA8ARd2T6uoG0xHT3VeKS6Q
 sLNan3y/BScJLyDClVjWhMQXRW2CjNcSRVeM32pj6Ja37+B3RfnaAE9k4jf5pfbRkWxvsk7QPDCrCu
 IvPTDwRJhuyrC7BFmfac8T3JAUirPF00v1tjMXILiYfeA3K+Gm2K4SVmd+9EWgjEJcbf6ucCjlQU/p
 Mz7gTttZFPwcSGfcOzz67IGjCR6OlEXErvSLeC7em/u4Sq1gQIleQ5ecPpwKcZ2V5k4TcHwQn1/IyQ
 AREJ37OCcknpY2fMYZGW6FkM6el89Lz6S94SzjFiEJxeyBPQeCxEds2+saJg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

To have a working display through DPI, a workaround has been
implemented downstream to add "mm_dpi0_dpi0" and "dpi0_sel" to
the DPI node. Shortly, that add an extra clock.

It seems consistent to have the "dpi0_sel" as parent.
Additionnaly, "vpll_dpix" isn't used/managed.

Then, set the "mm_dpi0_dpi0" parent clock to "dpi0_sel".

The new clock tree is:

clk26m
  lvdspll
    lvdspll_X (2, 4, 8, 16)
      dpi0_sel
        mm_dpi0_dpi0

Fixes: d46adccb7966 ("clk: mediatek: add driver for MT8365 SoC")
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/mediatek/clk-mt8365-mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8365-mm.c b/drivers/clk/mediatek/clk-mt8365-mm.c
index 01a2ef8f594e..3f62ec750733 100644
--- a/drivers/clk/mediatek/clk-mt8365-mm.c
+++ b/drivers/clk/mediatek/clk-mt8365-mm.c
@@ -53,7 +53,7 @@ static const struct mtk_gate mm_clks[] = {
 	GATE_MM0(CLK_MM_MM_DSI0, "mm_dsi0", "mm_sel", 17),
 	GATE_MM0(CLK_MM_MM_DISP_RDMA1, "mm_disp_rdma1", "mm_sel", 18),
 	GATE_MM0(CLK_MM_MM_MDP_RDMA1, "mm_mdp_rdma1", "mm_sel", 19),
-	GATE_MM0(CLK_MM_DPI0_DPI0, "mm_dpi0_dpi0", "vpll_dpix", 20),
+	GATE_MM0(CLK_MM_DPI0_DPI0, "mm_dpi0_dpi0", "dpi0_sel", 20),
 	GATE_MM0(CLK_MM_MM_FAKE, "mm_fake", "mm_sel", 21),
 	GATE_MM0(CLK_MM_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 22),
 	GATE_MM0(CLK_MM_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 23),

-- 
2.25.1

