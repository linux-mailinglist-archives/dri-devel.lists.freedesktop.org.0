Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C0884878E
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 17:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FC510E9FF;
	Sat,  3 Feb 2024 16:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nWpdMUtl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC42F10E9FF
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 16:53:58 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7bfd5eeffefso126456439f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 08:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706979238; x=1707584038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=taDwADqgs/vXZTWtQL/uIsBG3gMoUnf1EEy+EC/Jro4=;
 b=nWpdMUtlKcO8RyUoR8O1yRiNMEfP1ZivgzkS4xQNb+MfWOVWfza3EZqvUhQ1pZq0TR
 nSCMTWCaLqXOFLZE8qRH3Mw0vzpfn4muRd3u1+YInWVzBre6BZUpObaeB/eljFxgUQJA
 gbduqp92Sx3GBfyCrj54Sk/c4LHOTh709nIanO5EfvFQOp10c4eM9ghBaTB0NCsbET15
 YY2nMbvnj31WVK89llJ7UR+HruM1L90TCdnXzrhXqDthhV5FlsydN3FTqy4kZCfa43rd
 I9opONfblkL99sTKkFWeRNr8GSIFL3QYvgLEE/hPs1RuODMWNac+s7VMVsW5ifzsIicO
 veXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706979238; x=1707584038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=taDwADqgs/vXZTWtQL/uIsBG3gMoUnf1EEy+EC/Jro4=;
 b=Ctk3qi6zhLiqPRlsvcJabILN7yLPp2DiB8noEhfQKcklW561kCS/Z1PKJSx4dVEIdA
 f0JaPxiwpFaB2Hkff8vOH9Ta8cQgmxEnEcZHO//PToN7FbUFFj44gEqiUiXD7SH8HZS8
 NtQf/0cpSG46KRYAitPGXNCOXhgJMTQ2SGj3U75nh9o4Kjlm78/yAByqlxzOLOpQmxOr
 CklHbumFnF+pF43QBWVywoxBXst/1tj8UA0Dlj+kLnOJrL4aaGVP9puAOxQP7B/63Hbz
 MHsFoHSz1ifI5XWhSBticjb7Mj/Hv6UY1gDvS8cAKZLy15yKJboUlP4259ND2eGDjsCj
 gCNA==
X-Gm-Message-State: AOJu0Yw5MUMalbiL2OFJzHGACBURiT765M54PFFD5xFgsaluQEGrZZvf
 yK2d8TjLOye/JR5AoHzlLVdhiuezU7+ibtLixOtKWVQEcY6/eHo8
X-Google-Smtp-Source: AGHT+IGSIrWbB8jR5uaJBwAlIfAilmzMPT34+qSqtn8M+K3ASa98MtXlrgLootz9nRYzgIf22ww9/A==
X-Received: by 2002:a05:6602:2806:b0:7c0:3e72:998c with SMTP id
 d6-20020a056602280600b007c03e72998cmr6003233ioe.9.1706979238133; 
 Sat, 03 Feb 2024 08:53:58 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUD62zg8tJ7qMwNwxmrNMP/+OYqlFBEhICF5gxfVobVJ4LnXerUR5pumG2PtuG5+Cmz7Qfs6PkvZNFzjWFg6HopgDfdIH+CrhJFHbAwLVkYFE1Gky5g76gmocMJz7rKSZSFH0wz0PGpn+QujBSeWaW1bTd4givdDsdoFza+0pxjcv6yKGy7rEu1/s7iTfuXWHEMSK1g8YxlUZ4ksVEg9YAVZdvygkgS04Ukez64aJpKQb5+2v2XodxFNH/1cAABEgBKWMPLLzszvggkQTSHX1GIolk8NFkZPPeLGYeYiUkpbeoRwsEhdm91rZxvI2XOpmQOT3rUKclMKk6QdMrzukJVrFFPyjXfvG//tBYVoSxIwE0BlykyOEbpyG+4FQFGigvg4XfwpnyZMSC9GgupXhY5d+t8AFac/q1sF2IdQXbISCSiY4ZAAaQI5dXDRVcf5BbfkjTrnoErFj1kkAX0sAKCdiLjVXD45OcGOIwrmReYBeajeQ9mV18gnX4UKlvr+uguAgY1PxVQ3g+CAAvwSlD8PdWuun7nmhBAM0+PBzXyteqCNHXeiswiDUcbqMyv9vhmmzJSJJP9iU07weq0Ne/emI/B35nszR/mec2Vw6qhN2F7u7TA22yJ61oR0pGna47Zv3k+AwHQdQ2z1JcP/od3janjHDB1aTzX9NNnYpC/WvYklUCj757VfqhEfzsVwqOTqRvRQcbYSS6bjs695FEGfS+gTqoI9XaRfw/wVyQvzSz0pCKN+ybkBc8UrWX3nt1CEdOw0keAF86Jp6Og8hwRbADGnVhU80JfhgEPIiVyzk4gWlVMOGMPHgDd00CbvE1A5M2HCUJrRackwYDqHSvO/JLky9AjE2C+/u1wQaqiRVngv6pYBgBUAzCqqqEK7X680hK1IciJbH63FpWpnoSS4FSoDH6zlB7rzbllUnyRFzEN8lftCtU9vmNGp84/0bO6zC
 tPc+kBpnmgA8VI5bKu/CBQBhxIXDGMbduBGf5zFg/mUqGiqIRi/nukYaNl5I8AcS2jy5e2zjr3Jfer0jAAOV7PBb7frc24lvmLSilFIjuj+0MkhPhuOWv5cvogwrsDLXMJ75BPLDJ3j54uiLyFRUhAmNX80hkWwe4o9O3vAKH/wFiBgsUin1KJr7WD0JtKOfNhxluLTZcCpooyc1EfcgOYrHNZNWHp8A==
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:d9b2:bb4f:5531:6aa9])
 by smtp.gmail.com with ESMTPSA id
 t30-20020a05663836de00b00470b29b82b1sm1086256jau.154.2024.02.03.08.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 08:53:56 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: marex@denx.de, alexander.stein@ew.tq-group.com,
 frieder.schrempf@kontron.de, Lucas Stach <l.stach@pengutronix.de>,
 Adam Ford <aford173@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: [PATCH V8 05/12] arm64: dts: imx8mp: add HDMI power-domains
Date: Sat,  3 Feb 2024 10:52:45 -0600
Message-ID: <20240203165307.7806-6-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240203165307.7806-1-aford173@gmail.com>
References: <20240203165307.7806-1-aford173@gmail.com>
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

From: Lucas Stach <l.stach@pengutronix.de>

This adds the PGC and HDMI blk-ctrl nodes providing power control for
HDMI subsystem peripherals.

Signed-off-by: Adam Ford <aford173@gmail.com>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
V2:  Add missing power-domains hdcp and hrv
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 76c73daf546b..5c54073de615 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -836,6 +836,23 @@ pgc_mediamix: power-domain@10 {
 							 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
 					};
 
+					pgc_hdmimix: power-domains@14 {
+						#power-domain-cells = <0>;
+						reg = <IMX8MP_POWER_DOMAIN_HDMIMIX>;
+						clocks = <&clk IMX8MP_CLK_HDMI_ROOT>,
+							 <&clk IMX8MP_CLK_HDMI_APB>;
+						assigned-clocks = <&clk IMX8MP_CLK_HDMI_AXI>,
+								  <&clk IMX8MP_CLK_HDMI_APB>;
+						assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>,
+									 <&clk IMX8MP_SYS_PLL1_133M>;
+						assigned-clock-rates = <500000000>, <133000000>;
+					};
+
+					pgc_hdmi_phy: power-domains@15 {
+						#power-domain-cells = <0>;
+						reg = <IMX8MP_POWER_DOMAIN_HDMI_PHY>;
+					};
+
 					pgc_mipi_phy2: power-domain@16 {
 						#power-domain-cells = <0>;
 						reg = <IMX8MP_POWER_DOMAIN_MIPI_PHY2>;
@@ -1361,6 +1378,27 @@ eqos: ethernet@30bf0000 {
 				intf_mode = <&gpr 0x4>;
 				status = "disabled";
 			};
+
+			hdmi_blk_ctrl: blk-ctrl@32fc0000 {
+				compatible = "fsl,imx8mp-hdmi-blk-ctrl", "syscon";
+				reg = <0x32fc0000 0x23c>;
+				clocks = <&clk IMX8MP_CLK_HDMI_APB>,
+					 <&clk IMX8MP_CLK_HDMI_ROOT>,
+					 <&clk IMX8MP_CLK_HDMI_REF_266M>,
+					 <&clk IMX8MP_CLK_HDMI_24M>,
+					 <&clk IMX8MP_CLK_HDMI_FDCC_TST>;
+				clock-names = "apb", "axi", "ref_266m", "ref_24m", "fdcc";
+				power-domains = <&pgc_hdmimix>, <&pgc_hdmimix>,
+						<&pgc_hdmimix>, <&pgc_hdmimix>,
+						<&pgc_hdmimix>, <&pgc_hdmimix>,
+						<&pgc_hdmimix>, <&pgc_hdmi_phy>,
+						<&pgc_hdmimix>, <&pgc_hdmimix>;
+				power-domain-names = "bus", "irqsteer", "lcdif",
+						     "pai", "pvi", "trng",
+						     "hdmi-tx", "hdmi-tx-phy",
+						     "hdcp", "hrv";
+				#power-domain-cells = <1>;
+			};
 		};
 
 		aips5: bus@30c00000 {
-- 
2.43.0

