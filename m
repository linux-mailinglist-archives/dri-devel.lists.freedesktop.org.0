Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5165B78CA8D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9131B10E3FB;
	Tue, 29 Aug 2023 17:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C252310E3F3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:35 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-52a40cf952dso6177273a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329454; x=1693934254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R9DunujICwW+FdyG9ifMFQMXRh/n/3eNMexEB6m+XBc=;
 b=px2WocHwCMwjM675wD1bA1eXGHHv/R0rc7/GX6NGiX/OBlTqMyRnCDGc1uHsgku1sr
 G9rYQKPxprXZVpBGprwZm/C1f5qoDFg7KX5I/JxK4fvDG/kHaDBkBRxeheaI3QKeuZWE
 b50Gkg1HsF/3mn9w/IkH+vaEzdeSdwvdItZaDUy7tTxaZ866AleSX46/6MxQjT3LQ2cV
 UjX9eF48i0xUFo7p0kA7WbqSxQWbgvpfuTM5l8VNPmlDvMkdduEnZHvz3nbv9HkQuSG+
 oVeE+UuxPm3zGhNAUqbsJx77wJbbtm5NJgbuIgPWEmDiRNhO2V29qqX6GcIpTJKMkWbk
 0XkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329454; x=1693934254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R9DunujICwW+FdyG9ifMFQMXRh/n/3eNMexEB6m+XBc=;
 b=AJshiOZUd09IqPpI3uNI1ACZMNhijPd5ifVp2GmDm3HOhjeaSfvSw1bcOutv2kNs9j
 bquz4JTQOVgjC4karz9WPp13oICOzd0CbPPHs/YqBBMhrSdMqjOwcoEj/W7nEfuuRMe1
 PqZh6s4zoghZ/L/xYYuKeGhpWg1ESQLUuIuOcR7fW6x8VffPor61GzA7fYzm3V0TN4SF
 uRtxmEAjDXO8/9z2ZxbYiVCSpRWPUT+EsrZO3SuPyvjb8M8C8wMVPDXT6NnOGWIDLG2Q
 AAjo/u9Znd7fXFqAtWBSNiToiwcylSs2vXhPq3SJhdWTZPIazr0die2Iz97TpqwPXFgl
 8Duw==
X-Gm-Message-State: AOJu0YwoemrVIY021kToXUHfoooiJUEZS6sV3M/b0jb+gzCRdA7nhXHd
 ODNqi1zS5D3F2p+6zSFNWw==
X-Google-Smtp-Source: AGHT+IHrpTiL0i8g4E5q2Q0OjRcmwKFC2fgt4+QDBkipBm6SYXUm13m4URpgLyUReqBKRY8pMjjrIg==
X-Received: by 2002:a17:907:2bee:b0:9a1:b950:abab with SMTP id
 gv46-20020a1709072bee00b009a1b950ababmr16022437ejc.32.1693329454190; 
 Tue, 29 Aug 2023 10:17:34 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:33 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 10/31] ARM: dts: rockchip: Fix i2c0 register address for RK3128
Date: Tue, 29 Aug 2023 19:16:26 +0200
Message-ID: <20230829171647.187787-11-knaerzche@gmail.com>
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

The register address for i2c0 is missing a 0x to mark it as hex.

Fixes: a0201bff6259 ("ARM: dts: rockchip: add rk3128 soc dtsi")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index b63bd4ad3143..2e345097b9bd 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -426,7 +426,7 @@ saradc: saradc@2006c000 {
 
 	i2c0: i2c@20072000 {
 		compatible = "rockchip,rk3128-i2c", "rockchip,rk3288-i2c";
-		reg = <20072000 0x1000>;
+		reg = <0x20072000 0x1000>;
 		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 		clock-names = "i2c";
 		clocks = <&cru PCLK_I2C0>;
-- 
2.42.0

