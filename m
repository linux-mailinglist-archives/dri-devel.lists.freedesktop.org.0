Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7278C10E0
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 16:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F9E10EAA2;
	Thu,  9 May 2024 14:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vi5FQc14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E831C10EA96
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 14:07:06 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-51f60817e34so1124288e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 07:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715263625; x=1715868425; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BojjtcE4PW8Jg2RRLDbuh20R8FtUvCT6KeHyvo0GHNo=;
 b=Vi5FQc14RvL3sOQumPYaqUTk48s0ehcZNymanTToRY/V/s3eImrZlTb9AzMtUTDNzQ
 XPsZfKN7JQVEDR2LLJ3Dq6KZ2TiXiumFN+qNLyILHxE2CXUU8LKZJlrFyWRYqGWP/6Cj
 7+n6lwVZSKIZhvDYSX7jpNg4QaL2E9cDnArrwkehRBAaKmY49C/sUOGzZ+z+SRG4jzwX
 KfRbzvsbcG60ey4f/DD1btVQ4QYqHpJ9b7e4wJWEbpupSKMX7TYjXFLjnOTDBpTz/VAC
 V8Ovbv+fY9zqxZ8i+CUncG3uG5WjLvUo0Ddop8KJQuoz20KmW/vnObXRzPTVwgB47dno
 Oe5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715263625; x=1715868425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BojjtcE4PW8Jg2RRLDbuh20R8FtUvCT6KeHyvo0GHNo=;
 b=EIQ40PLqrbRU9M49bAVF6MJrA9tpFQjviCDg827qwJgjfcFyZQLNBJwwZKrPCvCdZ+
 ah+xPg+s28ITUZ8grdq881Vl0VTW10FFCm1YhqZy+lxmhJsVavzFphw6nOD0Ch81TVql
 SmisA02kZDMQmYyN6nHjtVDFvnsiF2B47SHT9m5qL10GkYwa9r8MD0lCFzX2FJFZYMw+
 Rw6AawpDfZQQRfPKCkt8DeUq6kIVv1LzzwjW9PWw4Uc6I/DtxDevaHFBljHFRCjUhAux
 EuDjMQp9++teJ93STdmgBjN6QWtfbO/NP2s/AzyGXYgXgL1NC5fh9gP8d2PfOcRrzTDh
 o33Q==
X-Gm-Message-State: AOJu0YxLg73+oeKsjmxl0rbN/nX2jjcn/IFt+peWS0D85o49ZuMa+T90
 VUgrM7aTOtcJs9jHJrprQmGqfp4mDcX8RUeXfb/CJg0f4pozpOo=
X-Google-Smtp-Source: AGHT+IHh+dso5MhBn431TAWM/uD/cNhYOwNyyWPRjGSzNSz1xBMrETqF5hbahKDBfppAyPHSKftcWQ==
X-Received: by 2002:a05:6512:40a:b0:51c:c1a3:a4f9 with SMTP id
 2adb3069b0e04-5217cd48861mr3707317e87.64.1715263624613; 
 Thu, 09 May 2024 07:07:04 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baad058sm1793311f8f.66.2024.05.09.07.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 07:07:03 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Alex Bee <knaerzche@gmail.com>
Subject: [PATCH v3 6/7] ARM: dts: rockchip: Add D-PHY for RK3128
Date: Thu,  9 May 2024 16:06:52 +0200
Message-ID: <20240509140653.168591-7-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240509140653.168591-1-knaerzche@gmail.com>
References: <20240509140653.168591-1-knaerzche@gmail.com>
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

The InnoSilicon D-PHY found in RK3128 SoCs supports DSI/LVDS/TTL with a
maximum transfer rate of 1 Gbps per lane. While adding it, also add it's
clocks to RK3128_PD_VIO powerdomain as the phy is part of it.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes since v1:
 - also added SCLK_MIPI_24M to powerdomain
 - reword commit message

 arch/arm/boot/dts/rockchip/rk3128.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index fb98873fd94e..fbd95bb08cd3 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -216,6 +216,8 @@ power-domain@RK3128_PD_VIO {
 					 <&cru ACLK_LCDC0>,
 					 <&cru HCLK_LCDC0>,
 					 <&cru PCLK_MIPI>,
+					 <&cru PCLK_MIPIPHY>,
+					 <&cru SCLK_MIPI_24M>,
 					 <&cru ACLK_RGA>,
 					 <&cru HCLK_RGA>,
 					 <&cru ACLK_VIO0>,
@@ -496,6 +498,18 @@ hdmi_out: port@1 {
 		};
 	};
 
+	dphy: phy@20038000 {
+		compatible = "rockchip,rk3128-dsi-dphy";
+		reg = <0x20038000 0x4000>;
+		clocks = <&cru SCLK_MIPI_24M>, <&cru PCLK_MIPIPHY>;
+		clock-names = "ref", "pclk";
+		resets = <&cru SRST_MIPIPHY_P>;
+		reset-names = "apb";
+		power-domains = <&power RK3128_PD_VIO>;
+		#phy-cells = <0>;
+		status = "disabled";
+	};
+
 	timer0: timer@20044000 {
 		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
 		reg = <0x20044000 0x20>;
-- 
2.43.2

