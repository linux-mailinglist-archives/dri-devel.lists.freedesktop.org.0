Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 504C944FAB5
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B8F6E8B7;
	Sun, 14 Nov 2021 19:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D966E89D
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:33 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b1so31690492lfs.13
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EhlDIlIDsNVFTr5Q8VNTSCXABzQ4ZRHMvuz4cuElJaI=;
 b=fvPbU0lnddcP8BFznT9aoP6LB98aatbQN85UNKzAx0J3neP/A29eByuYK+khAg7jcF
 6azFevrcLEtAftGRnTSAwrEocaXs7GwiF+rzp7/OSMUCcoy68sBV8bEPr1n/naCOo3PC
 gzQSVV4en41WhpUsRKOhyRmNtrp2ru58ur9cu0dMBB0rBdoEtW1jvy9Sl0R510gMn/GN
 BxU4YarT80PjjaJ3ZJ3MgUuzPqxXdJrfEFFae6iSKTgHIMUNYU6c1tieRlOFkh04vVR8
 elnssrWX9s1Tw9kje42xU7FRJInVOiNzZAUGnt/KIb+N7fD9YvD5P7oxQYWq6IJFz4lx
 LPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EhlDIlIDsNVFTr5Q8VNTSCXABzQ4ZRHMvuz4cuElJaI=;
 b=lac80CCtjnbt297kzfYmwa1rMa7LqAM1bgI7X2k6M2hHCI5aTfiO3wSoI6EKsqdxdq
 Ok+gLP1JsLUThLD8YElNdZueCHIrHClb80rzaLJS2VYvTcMWfNS90BdXWv+m8xxxOnin
 KdqfSSkG+b3T5Qjz4dOY161ziQyx9WlL7vdyTJ8udHlLjjdF3Q+tQOaLTX3AOQQGjFsl
 aeaf3yjD1LKce273kd0HLCbPX6GTs3VqO5taeSyoCB27LcUKCdaI46yb4rM1j/PRKSe8
 Jt7bsdrhL9R1nY8ioltolAv9dNKsZkQ9LYFDfmX1Lh/ncR8YdOBaNr6lvBgVjU7zzP3s
 jubQ==
X-Gm-Message-State: AOAM531sgUsF9h3Zh1i18uyO0+UkHWHalZHXE5XrYW0vnaYk+oPGBi7i
 A0B8Eu/zZUiZ4VYK/P+TXNY=
X-Google-Smtp-Source: ABdhPJybzjiG5ezNwZo+1UrlwTm5fqBhHgak7N6BxqQKny+t1/FnuyK4o+Sb6FlfSiA1SEovhzTasQ==
X-Received: by 2002:a05:6512:691:: with SMTP id
 t17mr29401950lfe.220.1636918591894; 
 Sun, 14 Nov 2021 11:36:31 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:36:31 -0800 (PST)
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
Subject: [PATCH v15 37/39] ARM: tegra: Add Memory Client resets to Tegra20
 GR2D, GR3D and Host1x
Date: Sun, 14 Nov 2021 22:34:33 +0300
Message-Id: <20211114193435.7705-38-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114193435.7705-1-digetx@gmail.com>
References: <20211114193435.7705-1-digetx@gmail.com>
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

