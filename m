Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7C178CA9C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA36F10E45A;
	Tue, 29 Aug 2023 17:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B7010E455
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:41 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-99c1f6f3884so583774766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329460; x=1693934260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HORfKlZ4SywXOGQyingnsT/g0xzmPt7r0h5GBjv1Y2o=;
 b=VUixQxnYtqHbxNxKsf0ASLykcCTVDBNkGoP6Rm38KMc6AILysWa8b+lFKAXuD5qslG
 UyjCBLmFLidSKQ0RY7WXdCaq6jbPDDNTkPudF2VqWSQyI8Jia9045Tr7UoVbpy0vadyi
 9I6hOEzja2RK9gkAfFgcBIrsuoCw0g17m2Dt7ih9TXDbMk7/TUdsAaZ/iWM7ntqpdij6
 psUVG0D77RiEOIT04TFhtm/3QirUtJ+5sT5JehV7cPLhkUdT7cql53AtvV0XhVAiaG8R
 +Glt9LWtL2p7QnoIAZznkypP6rY57aC9Sy3a5iDARmcIanhYxdE2wGgn9IpZf9eoxiA8
 aNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329460; x=1693934260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HORfKlZ4SywXOGQyingnsT/g0xzmPt7r0h5GBjv1Y2o=;
 b=ZyzIVoWaMTSTKaCVFFVK8vGahRlcPTbEQuR+gijHHCuSE7BZvnE/lPy5cc9zXznPC0
 X+XIRhebal01jdh5fWTiUdTOmFW4TD+DawgdFsa6d3cL8Hxk/w513GP8CGRIp3178YNq
 q62h7gX1IV7Ofjd3SR7GQFqt/l5hFV2VIcDeaLkrPJJsF2eGayua5lc9M/PZbybotDci
 AfYBNoUyx2pxgALgruPgVzXslCFg+iq5/LNZh7LbM4q0+eey6KYeCV48NofSY5WjWdmc
 LHFdD9dd2xaBsNUV22lBlMXr5WmI1LHGJvMIJ8ukdpxoyBZRhIMKLxdW1cCsLXRoPg05
 ljcQ==
X-Gm-Message-State: AOJu0YzfsW0KcZz0Lof+7MHKSaKtB6qilfJ9CXnX2pYkf91Ug0BTxyX8
 Vdv6xEbXdF5p5KrilNlpfw==
X-Google-Smtp-Source: AGHT+IG2fXAH6X9U8J0RtkYi3Dw+VWCQIj6fcYHWOgIhpDrIwSbMG6tADEykLLjvIrFhPYjoUswF6g==
X-Received: by 2002:a17:907:2cc8:b0:9a5:c9a4:ba1a with SMTP id
 hg8-20020a1709072cc800b009a5c9a4ba1amr1965327ejc.59.1693329460328; 
 Tue, 29 Aug 2023 10:17:40 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:39 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 16/31] ARM: dts: rockchip: Add SRAM node for RK312x
Date: Tue, 29 Aug 2023 19:16:32 +0200
Message-ID: <20230829171647.187787-17-knaerzche@gmail.com>
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

RK312x SoCs have 8KB of SRAM.
Add the respective device tree node for it.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index 4d3422abf008..7aba97b2c990 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -77,6 +77,14 @@ xin24m: oscillator {
 		#clock-cells = <0>;
 	};
 
+	imem: sram@10080000 {
+		compatible = "mmio-sram";
+		reg = <0x10080000 0x2000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x10080000 0x2000>;
+	};
+
 	pmu: syscon@100a0000 {
 		compatible = "rockchip,rk3128-pmu", "syscon", "simple-mfd";
 		reg = <0x100a0000 0x1000>;
-- 
2.42.0

