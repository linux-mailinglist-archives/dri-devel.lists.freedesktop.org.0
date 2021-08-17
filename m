Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA293EE300
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 03:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782F86E0DC;
	Tue, 17 Aug 2021 01:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09926E0AF
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:30:43 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id q21so8675374ljj.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 18:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iOx0CWJJWTap5wEALtflt5TD5too2w66bm1HP4jwmAM=;
 b=dreUCBMrVhYah6QEsUyRd1PPgDd5hIy+DesXjyoqwsziCnPgxwHOO3/ccoapjG7aZi
 gdOB9YWHykn9CBHVoMbolMqh3iE0EhyvsLH+qGOvgVt03Deot8AtFfdcyWSVoXnQ1eVU
 UwnBkCAe+2Tdsf1MZCRe5vcw/RW+uiM52YnRIY+ENijj5tE+Yemi7r9GgE89BUMAmAUM
 jsAI1v0kF23+iatkXiKJaiEtA3oBFi0ltiMZfhH9/3bz05xizmamYpTc+zUn/W5V1sbL
 UBn+LlIxSaB1dLLVkfigh8u7UEPw4trFV1Yo47xqq5JHzpNLRZYYxHJ4WQuJ3EDJfhHi
 RPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iOx0CWJJWTap5wEALtflt5TD5too2w66bm1HP4jwmAM=;
 b=fiFeQM8lKpc/JIaZ/yiGJhAtepp0KlsVXAeKJ3OguNa719ZEkh8gItFIIx6pRpVUFs
 Nqt3c+aqC14WaNcI3JXUmktP9Bca5w4IVTidASH8y57pJDsGluxhJHAzNmXTVc10TPae
 MjC+/2661K6HfoOaqdk7W2tfr8OjEKyYvkpN3lhSPuO+WQT296Yi0mekmKYuTySBBubB
 /OMIdai5oJ1FIBbPEUNunuc35RokmU8QK5F200szA8kNnke35kjBH537IxrzqFD8j4ln
 59Z8o1scLSvdCJr1WzMozZ+TqrEDxvgudkIeDsKZcvPkMq69ljLN3j2Kw2KbMHxPBLI1
 /Qqg==
X-Gm-Message-State: AOAM531M8waK6zwoE9xIgeVqkvFSf2Kg3m2bhGZs7xMpuSL/XC0ikNqe
 45ZpkkfGASfUKQHwNnbjxKM=
X-Google-Smtp-Source: ABdhPJyJWT1KmD0sqd2sSotoMjtfPR5X64L14svV6ntEW3IdWZmW/kCpAtqR9QrK1vxFDyAhpmSYDQ==
X-Received: by 2002:a05:651c:39c:: with SMTP id
 e28mr864074ljp.498.1629163841949; 
 Mon, 16 Aug 2021 18:30:41 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:41 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v8 34/34] ARM: tegra20/30: Disable unused host1x hardware
Date: Tue, 17 Aug 2021 04:27:54 +0300
Message-Id: <20210817012754.8710-35-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
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

MPE, VI, EPP and ISP were never used and we don't have drivers for them.
Since these modules are enabled by default in a device-tree, a device is
created for them, blocking voltage scaling because there is no driver to
bind, and thus, state of PMC driver is never synced. Disable them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 4 ++++
 arch/arm/boot/dts/tegra30.dtsi | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 2cb31bdd9eea..32abe559645f 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -59,6 +59,7 @@ mpe@54040000 {
 			reset-names = "mpe";
 			operating-points-v2 = <&mpe_dvfs_opp_table>;
 			power-domains = <&pd_mpe>;
+			status = "disabled";
 		};
 
 		vi@54080000 {
@@ -70,6 +71,7 @@ vi@54080000 {
 			reset-names = "vi";
 			operating-points-v2 = <&vi_dvfs_opp_table>;
 			power-domains = <&pd_venc>;
+			status = "disabled";
 		};
 
 		epp@540c0000 {
@@ -81,6 +83,7 @@ epp@540c0000 {
 			reset-names = "epp";
 			operating-points-v2 = <&epp_dvfs_opp_table>;
 			power-domains = <&pd_core>;
+			status = "disabled";
 		};
 
 		isp@54100000 {
@@ -91,6 +94,7 @@ isp@54100000 {
 			resets = <&tegra_car 23>;
 			reset-names = "isp";
 			power-domains = <&pd_venc>;
+			status = "disabled";
 		};
 
 		gr2d@54140000 {
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index be6fd700838c..55718e44ca98 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -145,6 +145,8 @@ mpe@54040000 {
 			power-domains = <&pd_mpe>;
 
 			iommus = <&mc TEGRA_SWGROUP_MPE>;
+
+			status = "disabled";
 		};
 
 		vi@54080000 {
@@ -158,6 +160,8 @@ vi@54080000 {
 			power-domains = <&pd_venc>;
 
 			iommus = <&mc TEGRA_SWGROUP_VI>;
+
+			status = "disabled";
 		};
 
 		epp@540c0000 {
@@ -171,6 +175,8 @@ epp@540c0000 {
 			power-domains = <&pd_heg>;
 
 			iommus = <&mc TEGRA_SWGROUP_EPP>;
+
+			status = "disabled";
 		};
 
 		isp@54100000 {
@@ -183,6 +189,8 @@ isp@54100000 {
 			power-domains = <&pd_venc>;
 
 			iommus = <&mc TEGRA_SWGROUP_ISP>;
+
+			status = "disabled";
 		};
 
 		gr2d@54140000 {
-- 
2.32.0

