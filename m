Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 294AA408073
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 22:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8276E096;
	Sun, 12 Sep 2021 20:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B836E090
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 20:10:55 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b6so11292857wrh.10
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 13:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oC7v5kGj1L+6JTSC+Cwvgt7c3a5VSA/RJX3RsTPWnXQ=;
 b=F6GtrWyCicJgiQylpOOjf8FlSYHNkPVPEAGjVpNxwr3knDW6GqnOvy88kgiAEhxGVw
 IRxqbweFvZZpB/P12/DJGwR9/frL8wvT0/QPZrkvnCLzo1hDTGggF5H1Mqb0Unzo6CWR
 SI3xlCjV/vac0w0MHgMhAQPAhr5XyJXKYA+rjWoXboxIC2wZzPuVRoPaDZhdways9X6k
 widTcOt+ZSCQf9isIV1sWy89Ao5uDR+bq7tlFn1UbO1Fov70KyGKzU8y7pGUPLTToJoa
 waJui1b+5ijH/fKDGZJbbWjS7CMcYkEpM2vHAEOjBhxvlPySVEzV7OKonU6Sx1x8mIoe
 VCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oC7v5kGj1L+6JTSC+Cwvgt7c3a5VSA/RJX3RsTPWnXQ=;
 b=IjENgqUbSd0KQZPDyjSo4fHVS2WgcG/JncOBExbIDpxgn/iUYK3q9VslSD/B84j81f
 9JO3I4U3l/QOUI7VNXIQC5omw5N/bueISFIfjTEQPzmUjgd/LIICGCUyTZJmcNTEpu+w
 IByFSqiKDNFASAPXm3N3aELIopZOs+8+NSZdg1P9mS+c7Qrz4BfC3ekemvhZZBQMrDyS
 NE5tEIbPXHN1JxoLBc/sVU3BhyQGYcGm9KEOhsSEoJUgiMuE4eaUkcw1r1TONYc0e4om
 ZPq703vB/mHS9m4NMcLnBY0BGNS1C3xYqRv2+QUu+zIsHCSEfcHRFcz6ibHZ3na+J6iR
 0GBg==
X-Gm-Message-State: AOAM532tpnhGB4+KI3OY/G39Tl7vdEv4hGGb93LP5t8bgSyXDgB26I94
 Ylmg2RY44cJw5mv6ZfDfWUk=
X-Google-Smtp-Source: ABdhPJxGB0fMGTHyAAtKYSiZJWMsjTJYbdgbPGK6F9fGz3Mt92VtlxkgjtKioNd43H6Mhm9LpnI78A==
X-Received: by 2002:adf:902b:: with SMTP id h40mr8677461wrh.342.1631477454125; 
 Sun, 12 Sep 2021 13:10:54 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:10:53 -0700 (PDT)
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
Subject: [PATCH v11 33/34] ARM: tegra: Add Memory Client resets to Tegra30
 GR2D, GR3D and Host1x
Date: Sun, 12 Sep 2021 23:08:31 +0300
Message-Id: <20210912200832.12312-34-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
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

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30.dtsi | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 9c7616abaa2e..58ef4983e511 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -123,8 +123,8 @@ host1x@50000000 {
 		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA30_CLK_HOST1X>;
 		clock-names = "host1x";
-		resets = <&tegra_car 28>;
-		reset-names = "host1x";
+		resets = <&tegra_car 28>, <&mc TEGRA30_MC_RESET_HC>;
+		reset-names = "host1x", "mc";
 		iommus = <&mc TEGRA_SWGROUP_HC>;
 		operating-points-v2 = <&host1x_dvfs_opp_table>;
 		power-domains = <&pd_heg>;
@@ -190,8 +190,8 @@ gr2d@54140000 {
 			reg = <0x54140000 0x00040000>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_GR2D>;
-			resets = <&tegra_car 21>;
-			reset-names = "2d";
+			resets = <&tegra_car 21>, <&mc TEGRA30_MC_RESET_2D>;
+			reset-names = "2d", "mc";
 			operating-points-v2 = <&gr2d_dvfs_opp_table>;
 			power-domains = <&pd_heg>;
 
@@ -205,8 +205,10 @@ gr3d@54180000 {
 				 <&tegra_car TEGRA30_CLK_GR3D2>;
 			clock-names = "3d", "3d2";
 			resets = <&tegra_car 24>,
-				 <&tegra_car 98>;
-			reset-names = "3d", "3d2";
+				 <&tegra_car 98>,
+				 <&mc TEGRA30_MC_RESET_3D>,
+				 <&mc TEGRA30_MC_RESET_3D2>;
+			reset-names = "3d", "3d2", "mc", "mc2";
 			operating-points-v2 = <&gr3d_dvfs_opp_table>;
 			power-domains = <&pd_3d0>, <&pd_3d1>;
 			power-domain-names = "3d0", "3d1";
-- 
2.32.0

