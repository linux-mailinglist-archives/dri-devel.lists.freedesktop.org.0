Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F205E412258
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 20:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6856F6E7D1;
	Mon, 20 Sep 2021 18:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0BE6E7D1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 18:12:45 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id x27so71302046lfu.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 11:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bHV0bQfFsqKEqBYRxEIpvsDc8HNhAwowLE0FplFjNDU=;
 b=jhLz4xJJJl3o4CnHV/WWFHveesLRTYHP/y51fodUc6bAFZeehkqTwpgxUWNB/+AkGl
 NWqpxXlXP79XwEvP+M0FC3+zznHJAC2xsB9laQ9/+dJ7O4zAV+yEDB7HmUHt0FmXNWFw
 70tr/z8wfOPyuMZIu7Hbi4b/YveaSRil95gm5EhLWrP7iktkDJUkAIBCUyOfF7rP+JOb
 Wf56BF+S67tVtnVTAGOCvqBBICz8AiqkiQ+f9aisWd9Su93dOwHb/QPr05caXlTE2w5i
 Tnc+93odYgQjUzp8zpOim0INAF2uVkAeeZl98pTJOu10T5/RiHjv1M5hF0L0we5/cF9D
 6GdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bHV0bQfFsqKEqBYRxEIpvsDc8HNhAwowLE0FplFjNDU=;
 b=uJH4j2x/i0sbTDRDsRwVw5p010MOjYDHh6bB8OEhwwNSfbpAGxrxN3GD2sOh1vewXk
 CL8cGoD7tSauchRdf6PLJ6gwWdDppBWr9aTnnX7JJ1smuOXeIy0GaJIR81CjlGFTjWtg
 QOqLwSNfbw3VwJjO5tzjy5FloYb2x3QsR5LHursawbhgUoYa3raK3jGnTIvvfJth789T
 8CnkDW4YIRrubKo/vcoxJgJHAyq/Ovjjc8Q+mBFcI808yyFWQtE5p9+2p2vxYh0wwtGY
 jFysONpheYh3jKYd8XbJB5E3rKkX5nJz2THJQiaNwz0bA8qrDC4adKRNg7SajOmlAkJr
 zcIA==
X-Gm-Message-State: AOAM530SS+Zi2vNP1XE6bQM5s5BOyiAO798bve2eg4Jpa9G4aIX/l/zn
 4LvbdtNeRIJYN3kytjjtgwM=
X-Google-Smtp-Source: ABdhPJwTyaGYqlfvaTEz6scN32KAKYSEpXA0rZGM7IsqAJ/oOZlQM/8o9VVgFKeh99CV9X35abqZAw==
X-Received: by 2002:a05:6512:3d0a:: with SMTP id
 d10mr19891828lfv.481.1632161562304; 
 Mon, 20 Sep 2021 11:12:42 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru.
 [46.138.151.206])
 by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 11:12:41 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Subject: [PATCH v12 33/35] ARM: tegra: Add Memory Client resets to Tegra20
 GR2D, GR3D and Host1x
Date: Mon, 20 Sep 2021 21:11:43 +0300
Message-Id: <20210920181145.19543-34-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920181145.19543-1-digetx@gmail.com>
References: <20210920181145.19543-1-digetx@gmail.com>
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

Memory access must be blocked before hardware reset is asserted and before
power is gated, otherwise a serious hardware fault is inevitable. Add
reset for memory clients to the GR2D, GR3D and Host1x nodes.

Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index ce38055a8952..eb6e5518fb5f 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -40,8 +40,8 @@ host1x@50000000 {
 		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
 		clock-names = "host1x";
-		resets = <&tegra_car 28>;
-		reset-names = "host1x";
+		resets = <&tegra_car 28>, <&mc TEGRA20_MC_RESET_HC>;
+		reset-names = "host1x", "mc";
 		operating-points-v2 = <&host1x_dvfs_opp_table>;
 		power-domains = <&pd_core>;
 
@@ -98,8 +98,8 @@ gr2d@54140000 {
 			reg = <0x54140000 0x00040000>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA20_CLK_GR2D>;
-			resets = <&tegra_car 21>;
-			reset-names = "2d";
+			resets = <&tegra_car 21>, <&mc TEGRA20_MC_RESET_2D>;
+			reset-names = "2d", "mc";
 			operating-points-v2 = <&gr2d_dvfs_opp_table>;
 			power-domains = <&pd_core>;
 		};
@@ -108,8 +108,8 @@ gr3d@54180000 {
 			compatible = "nvidia,tegra20-gr3d";
 			reg = <0x54180000 0x00040000>;
 			clocks = <&tegra_car TEGRA20_CLK_GR3D>;
-			resets = <&tegra_car 24>;
-			reset-names = "3d";
+			resets = <&tegra_car 24>, <&mc TEGRA20_MC_RESET_3D>;
+			reset-names = "3d", "mc";
 			operating-points-v2 = <&gr3d_dvfs_opp_table>;
 			power-domains = <&pd_3d>;
 		};
-- 
2.32.0

