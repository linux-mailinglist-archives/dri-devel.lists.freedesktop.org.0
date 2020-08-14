Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8373D245D30
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720796E49C;
	Mon, 17 Aug 2020 07:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18216EAC2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:31 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m22so8091507ljj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Ppkj+RIlaEU3Zu2q0tCXAcFcQlT6qlxYEcEES4iGaE=;
 b=BB3KPQU7JeQ0tqGoKIPs4Y6zvE8d5MGvvct73+HhLFFXmP1t37pSydMO9RqQ1ZmrAg
 /rJ+g25PAN9s76EfX/wLWfA6S+y54Djp3AKdTlmlwPBalx3jFgb07ROTmTGBxR4g7JCh
 NZhoicVBwsir3e13/oEhJE5w9Wqje2f+ps0ePbNQyyZWe3E4uQQLoVO59OSobzJb6F00
 uVm9QJk9J/kJvKYWYaN507EGhynvnjL0TMHBbrN1w357RgjiJe/rx26DhebG0kjsjccu
 a+8n/FUznFJKr/ercQ/d2erwNy8KcXGAhouco7p1sZQ3AllvhGUilbFSwSO4mNPZdyJQ
 7H6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Ppkj+RIlaEU3Zu2q0tCXAcFcQlT6qlxYEcEES4iGaE=;
 b=fzNP6bcPg1BJjQSH8sTwFg+3w0pp7aDJRpliYDYelvbUtyciXWKtjCe25PYbU7kVVf
 PXkkZfOSnrEOgZN0bLr6EsVLv9l5pKh1zeC5EvpW5qqFC13h/NsNhFr2fLyS5tt9bWj9
 kdpSzp1yTXf1Ia6ZxbkhR3Pzq/AuhevkC9E9TXa2LXIR/4YAxX+KxM7MF1tf1qxHcCfn
 O94eoX70uS/uaNJVAewMDXb4ziL1o33If88MOMeHEzKjb93OCAZz9DkQtmsgH8rwkgKB
 Gny1h6XcrWZNU4UjVH2ExtLeFURipYUgisICqsVqBkffX+Du05vtFzhnDTNzQNkRxMHU
 Sj1w==
X-Gm-Message-State: AOAM531DgE3xqUzakMXdbjyTSY3nO0/nGFFTVcCfV9EAwu5NdSeUVM2s
 eyoY3jLjgxIDOaO8pBLw/SUMzpQh
X-Google-Smtp-Source: ABdhPJwKJRI45dHuv3qf37mXXTOArzIZ2jEK6i1mUDWkeZJB2xD0qRl+5lpZW3otxUBpW9yJG4VQ8g==
X-Received: by 2002:a2e:9792:: with SMTP id y18mr105828lji.187.1597363650081; 
 Thu, 13 Aug 2020 17:07:30 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:29 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v5 26/36] ARM: tegra: Add interconnect properties to Tegra30
 device-tree
Date: Fri, 14 Aug 2020 03:06:11 +0300
Message-Id: <20200814000621.8415-27-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814000621.8415-1-digetx@gmail.com>
References: <20200814000621.8415-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add interconnect properties to the memory controller, external memory
controller and the display controller nodes in order to describe hardware
interconnection.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30.dtsi | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index aeae8c092d41..b28360d3c039 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -210,6 +210,15 @@ dc@54200000 {
 
 			nvidia,head = <0>;
 
+			interconnects = <&mc TEGRA30_MC_DISPLAY0A &emc>,
+					<&mc TEGRA30_MC_DISPLAY0B &emc>,
+					<&mc TEGRA30_MC_DISPLAY0C &emc>,
+					<&mc TEGRA30_MC_DISPLAY1B &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
@@ -229,6 +238,15 @@ dc@54240000 {
 
 			nvidia,head = <1>;
 
+			interconnects = <&mc TEGRA30_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA30_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA30_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA30_MC_DISPLAY1BB &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
@@ -748,15 +766,18 @@ mc: memory-controller@7000f000 {
 
 		#iommu-cells = <1>;
 		#reset-cells = <1>;
+		#interconnect-cells = <1>;
 	};
 
-	memory-controller@7000f400 {
+	emc: memory-controller@7000f400 {
 		compatible = "nvidia,tegra30-emc";
 		reg = <0x7000f400 0x400>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_EMC>;
 
 		nvidia,memory-controller = <&mc>;
+
+		#interconnect-cells = <0>;
 	};
 
 	fuse@7000f800 {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
