Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03302DDFC8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B80689BA5;
	Fri, 18 Dec 2020 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF48A6E1ED
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:08:14 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id s26so25139381lfc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QFKBoMDmOqL8VObNYiHW98GY/43naCkUJTj2RaTjBwA=;
 b=EobUySb5wv0B0upIN1NN5TWI3KJftrGAf0Dm89wMk4DobyH++fkeLE/z4h3pNAcmwY
 KJ0WyZw4eFyiwmPCEsxQUzZGsbOrjN2IQwG4M/O1kofOoZN5ByAbWWJdTOQBwPBsKoBS
 YWDmsu9jKqeAS2WVyjZ49QrGJ+9mhSEykEG07zlXTiht8LdlM6QIE/SS0XcrFyc1CgBa
 jao0lrSsTovwf/7miAArkiYN8XUNvonCojQlxztCu49KZPY0cIP0kfEEMVPakCOynJac
 Egr1ECabTVoznsrygkF3dCm0pKBtmXQtZj19tIv6sdQ+mDaLeG5ndg67V1Zl58HCo4Zw
 i7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QFKBoMDmOqL8VObNYiHW98GY/43naCkUJTj2RaTjBwA=;
 b=gCQOd6CaD1vM3YBcM17nC3B145hrCWYbNvoq2jMvk6S2v9qvXaTCtqPptzznT2J9Wa
 68H9ol281MjwwnPOvpu2tOLEkZy+lvrCXxL4BdbPbm1w/qOxghFY5/9z4scvgEILKYaF
 /RzyYwe2hkfJvFuvkPz7RnbR09e8AYjhSFxagTbmH9CB0CIMbV6oCCzpJzxexnizwH+y
 DNfD7ziIVD8t/ZqNTLP4PIIpVJJAdnIn5bbAxfFlHas7Hez+ysqAvZ+47x+XzoEQYPt/
 7WyDP73SkWYNsQtqaeErc9ezUi4baYqEXUBtU7Z1fNDjlNcKtFWm0K5Pvq628cxSBk0z
 6QzQ==
X-Gm-Message-State: AOAM533xTbwO8l6VlXmMwdT+8hkfvneXCuu5InyNKRf4UMwgxVh5W6gY
 mHaFf+yb7uCEgotWeOiv6is=
X-Google-Smtp-Source: ABdhPJx3Hj4S995ls6nZE7TDU17yudwFXp26p9mve2ah5isvg97LWmTDZ/u3MbGlnXb8+MoIICA0Yw==
X-Received: by 2002:a2e:9195:: with SMTP id f21mr210825ljg.191.1608228493416; 
 Thu, 17 Dec 2020 10:08:13 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:08:12 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 46/48] ARM: tegra: ventana: Enable core voltage scaling
Date: Thu, 17 Dec 2020 21:06:36 +0300
Message-Id: <20201217180638.22748-47-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow lower core voltages on Ventana board.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-ventana.dts | 32 ++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index 0b03b3b0fd0c..14ace2ef749c 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -422,16 +422,26 @@ sys_reg: sys {
 
 				vdd_core: sm0 {
 					regulator-name = "vdd_sm0,vdd_core";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt = <1300000>;
+					regulator-coupled-with = <&rtc_vdd &vdd_cpu>;
+					regulator-coupled-max-spread = <170000 550000>;
 					regulator-always-on;
+					regulator-boot-on;
+
+					nvidia,tegra-core-regulator;
 				};
 
-				sm1 {
+				vdd_cpu: sm1 {
 					regulator-name = "vdd_sm1,vdd_cpu";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
+					regulator-min-microvolt = <750000>;
+					regulator-max-microvolt = <1125000>;
+					regulator-coupled-with = <&vdd_core &rtc_vdd>;
+					regulator-coupled-max-spread = <550000 550000>;
 					regulator-always-on;
+					regulator-boot-on;
+
+					nvidia,tegra-cpu-regulator;
 				};
 
 				sm2_reg: sm2 {
@@ -450,10 +460,16 @@ ldo1 {
 					regulator-always-on;
 				};
 
-				ldo2 {
+				rtc_vdd: ldo2 {
 					regulator-name = "vdd_ldo2,vdd_rtc";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt = <1300000>;
+					regulator-coupled-with = <&vdd_core &vdd_cpu>;
+					regulator-coupled-max-spread = <170000 550000>;
+					regulator-always-on;
+					regulator-boot-on;
+
+					nvidia,tegra-rtc-regulator;
 				};
 
 				ldo3 {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
