Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3DC78CA91
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B9F10E451;
	Tue, 29 Aug 2023 17:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5B910E3FB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:37 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so599021266b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329456; x=1693934256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0OQ0uMxvObgSXiZXc7XOlyouI6S5o18+qbYKi7xXiJU=;
 b=s6TtVUA4v+M9p7voV9EqzvUO+K5WnHhoucMfikXrOctuv0npQViR9s2C9ZYl8QZg3C
 ha9NhlM5TlfZrKtOKhpdHZuZsg6tAfKrWJUjSQ0TzuuO9FJQK++7NdyOLroBXGGnWFI1
 r3HCGu0t7PYsICfeek6yu93Oic3IKLo3RLzu0aEoV/jip2b+Q/gs2wdc5nvo1NIY/WTq
 5M1n6EdqA3HneC+0V4wldGuWurwlrST09o5836u/s61IX3BEGDbeZj9iMssE8vLrN8tF
 nc1i8u/7WNu8cTuShuhNVGz7xRw3j8scGML0r67kSDE2DNOGjY4nUEdUcuisLn+oEiyv
 v/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329456; x=1693934256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0OQ0uMxvObgSXiZXc7XOlyouI6S5o18+qbYKi7xXiJU=;
 b=ZHKlabyPOoVoPrIYbgBWblm9KzPXM0H++c2WgP1x89EV9u0EpGF3ULWdAmb9+95iNk
 FVDZpBWmsh5oMY1TRwbOethMc3wLvP8iP3FXnrrt2mveVEGXR6maR1hcfj6OAdORO2bn
 SoXL32e3jGtpETd7a3CikjmNSNUGt6M22hgvzw8WOr8lUzqMBTSW2tiRx5PYKccu0O7h
 wSjXAucpleOyVmFC59PBk9y1cTdeJUaK8QONULG9ATsc75kdFgLpd86hLqPOmXyoUW1g
 BH8nZGvCq+CJNehhs+Q4sgrfjpnFpe/Pq5c+QnrtjtUWZ2ZsGjR/7byRTDSIcJwG5YWa
 /6Fw==
X-Gm-Message-State: AOJu0Yy6gZUsBB1cHyE7km7v3DCxtT+wneeypBjDVl0B8OT4H6n5t9Jy
 JjLnsyPTs9DHrL2Yvox5wxNceBAsOQ==
X-Google-Smtp-Source: AGHT+IH0+bHTepjEA8hR54kf7EM9Nb5uT+O5JhoqwdO0nyAn5FMjZRDBmEfIMY/Ri8mcEWEggh+wbA==
X-Received: by 2002:a17:906:76d2:b0:9a1:7919:d3d5 with SMTP id
 q18-20020a17090676d200b009a17919d3d5mr21742168ejn.43.1693329456174; 
 Tue, 29 Aug 2023 10:17:36 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:35 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 12/31] ARM: dts: rockchip: Add missing quirk for RK3128's dma
 engine
Date: Tue, 29 Aug 2023 19:16:28 +0200
Message-ID: <20230829171647.187787-13-knaerzche@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Johan Jonker <jbx6244@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Like most other Rockchip ARM SoCs, the PL330 needs the
arm,pl330-periph-burst quirk in order to work as expected.
Add it.

Fixes: a0201bff6259 ("ARM: dts: rockchip: add rk3128 soc dtsi")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index bf55d4575311..9125bf22e971 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -459,6 +459,7 @@ pdma: dma-controller@20078000 {
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 		arm,pl330-broken-no-flushp;
+		arm,pl330-periph-burst;
 		clocks = <&cru ACLK_DMAC>;
 		clock-names = "apb_pclk";
 		#dma-cells = <1>;
-- 
2.42.0

