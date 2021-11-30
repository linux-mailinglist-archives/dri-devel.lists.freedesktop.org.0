Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4CE4642F8
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B6A6E86B;
	Tue, 30 Nov 2021 23:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474926E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:34 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id 207so44222638ljf.10
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1V/UFpas9dR6RAsIe/6wp+AuQdWLTUAavRrmb8F89vE=;
 b=MwLkQ6y/frw8oUgS8oo/4Md25aV5Ayz94lDl9OvFvysZrqXXX1tNtK69gkkj/hgvot
 x/vadNhpiWIr5r1uN0JnAN1KOUNtkSA5LJluU7Pv/LD3rYUf+CkFobE2oFwn6X6YBk2V
 PINflefJEkY4aAt1MFYK9zRRH6puIXSxzcJQuxpoJXtuu2B5OqaSlaBFNZFz4fkO9bFF
 VY+9n4uFh2Vef8di06UQJWDThIDieAKv/5JdzHba71EtT4Q2B98fvTkC/pV+wllsoakh
 erMXQzYLbgmXcJvxDmneBj9byZTdtGlkL3fjhUnUNy/zIDNCOtqmmAuIqVA6Bwt8BZ5s
 n2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1V/UFpas9dR6RAsIe/6wp+AuQdWLTUAavRrmb8F89vE=;
 b=VcdQ+LcKvdgJYHhMoEto/lNHSSavXejNhvoBMP6/FnQyXeq3NKN+wy+QKUGkv+zlGD
 sx8c6EUkCvUo5ABiEAkK6gnOB39FCTcgpk92EqWtzhdUDCsTZrA8oaDdzgN0uMOrgkZu
 8RCF9Pykif6fNhE0vtxjEOB6ec7Gbn238X09uM6e4Tpke1U4IrY1VFuHCnNFiG+F2oAl
 0Yi5ZzeEudER0N6VW2OfiG8PXo9FWlM9HwJ2tqRWKONfNBm5XJgKyO+E3KynnADCVgue
 qNbfUvws+vB5d3h6n6JYVCHptDbmz/Gv5F2zdcboJPsio6vz1EePfmzSGbRZNvf14sym
 0Wxw==
X-Gm-Message-State: AOAM5337gTxK9d9XsPn2RKsS6ENJl3ozecCcZPWtEQlAZm4Khhi2somj
 RislCNlB7AfK+lltYViR48iqqb6ilpg=
X-Google-Smtp-Source: ABdhPJz0sWleOmyioOFnT7nxYKFSRhyGAHaWvEEJs/ucrK8wCAckUXGadtrKT8aAS/x2ZR+Jd6y4kA==
X-Received: by 2002:a2e:9b41:: with SMTP id o1mr1927573ljj.499.1638314672683; 
 Tue, 30 Nov 2021 15:24:32 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:32 -0800 (PST)
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
Subject: [PATCH v16 39/40] ARM: tegra: Add Memory Client resets to Tegra30
 GR2D, GR3D and Host1x
Date: Wed,  1 Dec 2021 02:23:46 +0300
Message-Id: <20211130232347.950-40-digetx@gmail.com>
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

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30.dtsi | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 0ac6cb315e8d..96d1c5688248 100644
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
 		power-domains = <&pd_heg>;
 		operating-points-v2 = <&host1x_dvfs_opp_table>;
@@ -190,8 +190,8 @@ gr2d@54140000 {
 			reg = <0x54140000 0x00040000>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_GR2D>;
-			resets = <&tegra_car 21>;
-			reset-names = "2d";
+			resets = <&tegra_car 21>, <&mc TEGRA30_MC_RESET_2D>;
+			reset-names = "2d", "mc";
 			power-domains = <&pd_heg>;
 			operating-points-v2 = <&gr2d_dvfs_opp_table>;
 
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
 			power-domains = <&pd_3d0>, <&pd_3d1>;
 			power-domain-names = "3d0", "3d1";
 			operating-points-v2 = <&gr3d_dvfs_opp_table>;
-- 
2.33.1

