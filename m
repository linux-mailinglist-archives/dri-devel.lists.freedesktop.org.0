Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9FE249C57
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6218D6E28B;
	Wed, 19 Aug 2020 11:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D4F6E14B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:24 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A66812312B;
 Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837583;
 bh=KR3x17k71nv+WZsdM0NYFQMSokf99W1AI+fOHiCMtjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RdLMUM5Xi0M4wIe5eMeYRspaUaTagbNp3+Uu62CwqGQPWf8JjCegMi5LugjYO3zCF
 KalT+ThEuqx3+7rcbxyYXE9e33yLI2Q4izRGfHmxqwvnUETV97KsnkrgS+IlhWkrCN
 0dmmb0hjrfOi15lbpcWXhj50V7rrObFuZWYIHchs=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXt-00Euc5-JA; Wed, 19 Aug 2020 13:46:21 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 44/49] dts: hisilicon: hi3670.dtsi: add I2C settings
Date: Wed, 19 Aug 2020 13:46:12 +0200
Message-Id: <577acc4d4de8f812d4f58de167a731bfc6d1d32e.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
 mauro.chehab@huawei.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The I2C buses are not declared at the device tree. As this will
be needed by further patches, add them, keeping all in
disabled state. Per-board settings can override it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 71 +++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
index b1acb4fb1d1c..416f69c782d7 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
@@ -723,5 +723,76 @@ dwmmc2: dwmmc2@fc183000 {
 			card-detect-delay = <200>;
 			status = "disabled";
 		};
+
+		/* I2C */
+		i2c0: i2c@ffd71000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0xffd71000 0x0 0x1000>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <400000>;
+			clocks = <&iomcu HI3670_CLK_GATE_I2C0>;
+			resets = <&iomcu_rst 0x20 3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_pmx_func &i2c0_cfg_func>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@ffd72000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0xffd72000 0x0 0x1000>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <400000>;
+			clocks = <&iomcu HI3670_CLK_GATE_I2C1>;
+			resets = <&iomcu_rst 0x20 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c1_pmx_func &i2c1_cfg_func>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@ffd73000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0xffd73000 0x0 0x1000>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <400000>;
+			clocks = <&iomcu HI3670_CLK_GATE_I2C2>;
+			resets = <&iomcu_rst 0x20 5>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c2_pmx_func &i2c2_cfg_func>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@fdf0c000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0xfdf0c000 0x0 0x1000>;
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <400000>;
+			clocks = <&crg_ctrl HI3670_CLK_GATE_I2C3>;
+			resets = <&crg_rst 0x78 7>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c3_pmx_func &i2c3_cfg_func>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@fdf0d000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0xfdf0d000 0x0 0x1000>;
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <400000>;
+			clocks = <&crg_ctrl HI3670_CLK_GATE_I2C4>;
+			resets = <&crg_rst 0x78 27>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c4_pmx_func &i2c4_cfg_func>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
