Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A61F4642DB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619A86E84D;
	Tue, 30 Nov 2021 23:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620776E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:33 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bu18so58016625lfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EhlDIlIDsNVFTr5Q8VNTSCXABzQ4ZRHMvuz4cuElJaI=;
 b=HLwwtuno+q8YKVRyLlVnn0SkXeK/ld2EqLBtsYo4WOBg/C9VmHifYp5q2qBZ8rcmGr
 h5byPqdi5UlOX05T0WftQ43Q3ZUKYPKvpHtbHlEsSqC0Bssbi5nkxQ4mIsffrVIO/DPw
 FEgPrjgelY5JzUQHjjxgqi/U3DXhT39/N09rNaBxyYN1P3ZJuoWyEphcsgWVg5H8JyN7
 Tp8wX4bPDDXpLzpEWDbYwrdbjhnvFw4JuXMPzL6JH0yLFsxtmNHQoHfUry9J4KyE3fXE
 KpWLpRFseMp1zSrsSnq0dIa6l3YMyk+7PvnZUU0N8KLlNp7iNiv50EBuUWTCMLcfOLk+
 rSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EhlDIlIDsNVFTr5Q8VNTSCXABzQ4ZRHMvuz4cuElJaI=;
 b=Q4ZtMGFFc5mgGpPOwMxTWEEW3XBF8aOHQF7XL1doel6ARiku/Bjq6BsxbOwMNIIhyP
 Ff/vLtmqMFqX9VsAIfrTElEdGG2kEkJp0QPGBRzJL7PRrv4Li2udxNzknCdpUqAvBy1t
 lyXdSSrKDbj0rFAK2YHzU+V+aVoNoVbaSgKEKqQGRckRNbQCBLV1m3pyI2UIoWA1MCz3
 hCXnmHLJzpki1TbcpM1q0fD+1XEcul1k3VI/m72tV6f1WN0GswvIpyB+79HuLWGf8J6Y
 bWQfTneCXBAKgEh5BO2tmarqLIKI6X5A3n2VyyNKoGe6kfQ0+rXP60onQf/ItnAlwZVh
 lvzQ==
X-Gm-Message-State: AOAM5312c6grPVXA+nb2cqxhggqUlTgAHO2tP0Vv9CEq+UGUxXwPU7Ji
 8NJubtDOoIctc67y4GtLfc8=
X-Google-Smtp-Source: ABdhPJwgBmpTPWGoE5wlmkHA8FC4JwHuGKMd4RYMtWxSY8P0RGVDESESrvpM8Hf6GRLRF59dpUnlJg==
X-Received: by 2002:a05:6512:118e:: with SMTP id
 g14mr2237268lfr.561.1638314671809; 
 Tue, 30 Nov 2021 15:24:31 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:31 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v16 38/40] ARM: tegra: Add Memory Client resets to Tegra20
 GR2D, GR3D and Host1x
Date: Wed,  1 Dec 2021 02:23:45 +0300
Message-Id: <20211130232347.950-39-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130232347.950-1-digetx@gmail.com>
References: <20211130232347.950-1-digetx@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
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
index 1898351a099f..7b69ffc57abe 100644
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
 		power-domains = <&pd_core>;
 		operating-points-v2 = <&host1x_dvfs_opp_table>;
 
@@ -98,8 +98,8 @@ gr2d@54140000 {
 			reg = <0x54140000 0x00040000>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA20_CLK_GR2D>;
-			resets = <&tegra_car 21>;
-			reset-names = "2d";
+			resets = <&tegra_car 21>, <&mc TEGRA20_MC_RESET_2D>;
+			reset-names = "2d", "mc";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&gr2d_dvfs_opp_table>;
 		};
@@ -108,8 +108,8 @@ gr3d@54180000 {
 			compatible = "nvidia,tegra20-gr3d";
 			reg = <0x54180000 0x00040000>;
 			clocks = <&tegra_car TEGRA20_CLK_GR3D>;
-			resets = <&tegra_car 24>;
-			reset-names = "3d";
+			resets = <&tegra_car 24>, <&mc TEGRA20_MC_RESET_3D>;
+			reset-names = "3d", "mc";
 			power-domains = <&pd_3d>;
 			operating-points-v2 = <&gr3d_dvfs_opp_table>;
 		};
-- 
2.33.1

