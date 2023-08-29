Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E18F78CA99
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A107D10E458;
	Tue, 29 Aug 2023 17:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD4210E450
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:42 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99cdb0fd093so612662866b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329461; x=1693934261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ilnrPdFJtUf7kFovTN/fYGCIN4J3UZgI+cSnZSR/2yQ=;
 b=CojAhc332OPw8G4b1MSX2JQIfQDCWoVAGTFpYoYl0/vT085fGy4ePtubR/tl/ZlsIA
 l0uDDPewODZRXUPwQabgplzdC4JNc4myOQVV6TKtNZzHR/zTCdmDxbWrYTQ913Ug93dE
 Ljr8rF4aJIPgyle1ezaRXAKcCZkTsru1CJ6/LLnQPkaX9LMtCAx5R9bEMXBX7q51ItgT
 0PKjUs7ecYytckB82/OClp4+JYvRuR7KQWln7xSZiha8hHm+Z6Wsm4jgAPRIziHgSxMb
 QrTk4sU11HDveeQ1zL7bqYeR/6WYcSm4kFKKf6s8v0QQbLee2Jbv0SA/0k8j+1waMlo6
 r0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329461; x=1693934261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ilnrPdFJtUf7kFovTN/fYGCIN4J3UZgI+cSnZSR/2yQ=;
 b=Ei892DDUWhIbj/Je4zinpEPwBgYXcoEJANOQJjO1EJXrlW/nsE1/IK96GY9g+vxQfW
 z3nt/m43HyrTz/pI3nPHkr6+34fCwvhFGqHccR47yTsSgtsEREjmDMcxeBw3s5+GnqB+
 9c0v3Ld/wu/Im5VX2sP1DvQyND6jCMOtMagWEVwuJ2hQXQWlR1DYaabsL7ff5h3YOvvC
 RDzwxGY2FjDEyO/NSptHNYsWkNWoQuK6WXt+pm7FaqrRUYVGWTyJpkAtQw3XwF0PjAO7
 iRP4YRqckz2zk4of9iibIgG+t8vzhK8moGbl0EIX2/88fqgWwZNcIa+JlJNR4SynrbMo
 wq5g==
X-Gm-Message-State: AOJu0Yzna4mB3pBipONg/aGEaprc3gEF0VFWvRY7VOcvwMYUztT2vJeO
 apRyZSh3NeKr4V5laBWoVQ==
X-Google-Smtp-Source: AGHT+IFOS5fuKXmCLh8kzU0y1GLYjtXxy7bOhVtFki5w2Fgr+bDQyC2qYgPIiQH2f3gYvZC+LV/EnQ==
X-Received: by 2002:a17:906:3d29:b0:99d:f29b:f2e4 with SMTP id
 l9-20020a1709063d2900b0099df29bf2e4mr21968075ejf.29.1693329461237; 
 Tue, 29 Aug 2023 10:17:41 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:40 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 17/31] ARM: dts: rockchip: Add CPU resets for RK312x
Date: Tue, 29 Aug 2023 19:16:33 +0200
Message-ID: <20230829171647.187787-18-knaerzche@gmail.com>
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

Add the reset controls for all 4 cpu cores.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index 7aba97b2c990..b195ac525c37 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -34,6 +34,7 @@ cpu0: cpu@f00 {
 			reg = <0xf00>;
 			clock-latency = <40000>;
 			clocks = <&cru ARMCLK>;
+			resets = <&cru SRST_CORE0>;
 			operating-points = <
 				/* KHz    uV */
 				 816000 1000000
@@ -45,18 +46,21 @@ cpu1: cpu@f01 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0xf01>;
+			resets = <&cru SRST_CORE1>;
 		};
 
 		cpu2: cpu@f02 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0xf02>;
+			resets = <&cru SRST_CORE2>;
 		};
 
 		cpu3: cpu@f03 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0xf03>;
+			resets = <&cru SRST_CORE3>;
 		};
 	};
 
-- 
2.42.0

