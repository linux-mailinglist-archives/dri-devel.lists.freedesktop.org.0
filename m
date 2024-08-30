Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41667966C11
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 00:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB1410E814;
	Fri, 30 Aug 2024 22:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KdmWd91f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9B210E21F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 15:29:24 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-82a316f8ae1so11489939f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725031763; x=1725636563; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cTbfsd8NvXwzdBfTnE3JqlL7neYrWLzy9hOrmppNIdI=;
 b=KdmWd91f0rhCGXW+QYihJsgRD2+KQPOOqs86vTAXPA9HkYbP/hRk4Cle7eydpXny0r
 R/5+NpBmTNwg9MSvohQ+LO65JWvEdEc4aBNKBt2T3tuaauyiUf/awIyKj08IFqDEspcv
 Xnz9zd0tk9kzuZ28cvQeO/Nv4esGsqGOHLGnPRxGM1Z5SPn6SpGxicGNCYCsJTkZvmr5
 o/3S+wQItsbdfigqeAjEfxwczVXrpo+Ofy90ItzWQnnH/BRbV1BMO3EDvYzlX6pRmBK6
 yQ2YTfcOB+8Zn/K4OgLK1nixGgySHyom+lY/EMPQI6NMx2zhgM0jH9+E68rUtY1KH7Io
 6dEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725031763; x=1725636563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cTbfsd8NvXwzdBfTnE3JqlL7neYrWLzy9hOrmppNIdI=;
 b=blwzuPL6I773ARYD/VoofSuIK48eDHjJej9Ie0AHb6YkRupP0tJDOT6vE0w9lUMSCy
 cpX1JXSm5kyrAKJvW0lXKkfyCxN20mKbEOWWKAuLC7908AfTkdVCG9SXfKk/X8FEkqn5
 zN1LIyNhC4i+E3TVQXYSzQgCH/xZMDP80SXObbB2G/Wdhtb/R/f8L0V0ob/zfURmPgHH
 SeS2rf/HHhU1DiElR4s50Vx7uejL6TWzIj4sCIKKKBJRL6nSWvwiLefW62OMB3h1tBzP
 Vs4QHPHitAlBwDwKC4d8WxszTeCjqFs+jw6EXF7vHVBTFK0VxCTeVR6+0AQOTkh9NSmp
 /Mog==
X-Forwarded-Encrypted: i=1;
 AJvYcCW26zUlVfBuwAki49Y4/p1qFcquy9oMV2dwBtyLV5sKT+yYdcerfGLzM8zKbHSdWa0JKHkU+DH7pAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxRiymfCMeKNMtO0qK1ypVZwA5X/7W804NHoPKIdGDdlEfTH/p
 A1+bfLy/HhTjjG4kDctUbdTpUomSK/bkEFFnQFP7n52Z3fC+GEbV
X-Google-Smtp-Source: AGHT+IEXGRlQ5gn33om3VWyG+YHGotjBlsNvFVFeEDYCIhlYkI3wne4qPmIsXyn/6trLmn+Wp0F5NA==
X-Received: by 2002:a05:6602:160c:b0:82a:2385:74a6 with SMTP id
 ca18e2360f4ac-82a238575c7mr412786839f.5.1725031763161; 
 Fri, 30 Aug 2024 08:29:23 -0700 (PDT)
Received: from localhost.localdomain (174-20-195-90.mpls.qwest.net.
 [174.20.195.90]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ced2eaa1e7sm778553173.132.2024.08.30.08.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 08:29:22 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: shimrrashai@gmail.com
Cc: Laurent.pinchart@ideasonboard.com, aarnoud@me.com, airlied@gmail.com,
 algea.cao@rock-chips.com, andrzej.hajda@intel.com, andy.yan@rock-chips.com,
 conor+dt@kernel.org, cristian.ciocaltea@collabora.com, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, hjc@rock-chips.com, jernej.skrabec@gmail.com,
 jonas@kwiboo.se, krzk+dt@kernel.org, ldearquer@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 markyao0591@gmail.com, mripard@kernel.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
 tzimmermann@suse.de
Subject: [PATCH v5? 6/6] dts: rockchip: add HDMI0 entry for RK3588 and change
 VO0/1 GRF compatibles
Date: Fri, 30 Aug 2024 10:29:12 -0500
Message-ID: <20240830152912.9092-1-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240830152132.8894-1-shimrrashai@gmail.com>
References: <20240830152132.8894-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 30 Aug 2024 22:08:56 +0000
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

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index b6e4df180..76cb0f7f7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -582,13 +582,13 @@ vop_grf: syscon@fd5a4000 {
 	};

 	vo0_grf: syscon@fd5a6000 {
-		compatible = "rockchip,rk3588-vo-grf", "syscon";
+		compatible = "rockchip,rk3588-vo0-grf", "syscon";
 		reg = <0x0 0xfd5a6000 0x0 0x2000>;
 		clocks = <&cru PCLK_VO0GRF>;
 	};

 	vo1_grf: syscon@fd5a8000 {
-		compatible = "rockchip,rk3588-vo-grf", "syscon";
+		compatible = "rockchip,rk3588-vo1-grf", "syscon";
 		reg = <0x0 0xfd5a8000 0x0 0x100>;
 		clocks = <&cru PCLK_VO1GRF>;
 	};
@@ -1254,6 +1254,46 @@ i2s9_8ch: i2s@fddfc000 {
 		status = "disabled";
 	};

+	hdmi0: hdmi@fde80000 {
+		compatible = "rockchip,rk3588-dw-hdmi-qp";
+		reg = <0x0 0xfde80000 0x0 0x20000>;
+		clocks = <&cru PCLK_HDMITX0>,
+			 <&cru CLK_HDMITX0_EARC>,
+			 <&cru CLK_HDMITX0_REF>,
+			 <&cru MCLK_I2S5_8CH_TX>,
+			 <&cru CLK_HDMIHDP0>,
+			 <&cru HCLK_VO1>;
+		clock-names = "pclk", "earc", "ref", "aud", "hdp", "hclk_vo1";
+		interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "avp", "cec", "earc", "main", "hpd";
+		phys = <&hdptxphy_hdmi0>;
+		phy-names = "hdmi";
+		power-domains = <&power RK3588_PD_VO1>;
+		resets = <&cru SRST_HDMITX0_REF>, <&cru SRST_HDMIHDP0>;
+		reset-names = "ref", "hdp";
+		rockchip,grf = <&sys_grf>;
+		rockchip,vo1-grf = <&vo1_grf>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hdmi0_in: port@0 {
+				reg = <0>;
+			};
+
+			hdmi0_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	qos_gpu_m0: qos@fdf35000 {
 		compatible = "rockchip,rk3588-qos", "syscon";
 		reg = <0x0 0xfdf35000 0x0 0x20>;
