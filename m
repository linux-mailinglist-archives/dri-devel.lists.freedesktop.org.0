Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E546F4642A7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D106E826;
	Tue, 30 Nov 2021 23:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331E26E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:35 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bu18so58016791lfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ops+ixvINP38o4nA4ikQm5GyykwXVWsU0qQPTLJ2ovo=;
 b=YMJPx1WkfQ4OtvgoHiEOjNWPEVjmn3npVavgDBfRcNtJDkNDsT+oIhWmoM6O2vWsFz
 kDfpD5FcITyBnC2WuMVLxKEi13AvMRCTzq0ziSJJ3GMHqJ1GZeh8mmMiENZw293W3hoh
 mbjG8N3cb1e8+k4AUPL9nxcldnvXDRrUQDXPA3FfG9zQRX7TFmzQA3LU3Pn+zelGrqP8
 fv2bDd75irm5uKgrOxMJjI+jzBDGrK+24gXvFS/BW4cpb9k9r83dMlJxIcZqWCHapD78
 iKuBfdBjVqeMBg+gCfa2Vok8CbbEsYlGoOkCBJ4lOIKW2mr0wPEl0jmVvU8ud2k8B4w1
 eM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ops+ixvINP38o4nA4ikQm5GyykwXVWsU0qQPTLJ2ovo=;
 b=H6eYUR61D5kKu9oBxuSowMfajKEmPsB4dboi3f3uyabsIkLyUWd7YDHR6I9n5jthul
 hApIZFdLGBn9QfASapiwo7/4jNPi7bjhU3bPCkrQPcdFBQlCntyP+mqmBlqSFwpet2gg
 F2+Njb0HUmtJoTiiwopvvIaRiAFO6no1zVFqCNSiPXkqohhd3hvLgn/KUtZdfg5yOTX3
 g7SY/N5iFsWe2SmyLoBSbGsVULkK/LtJ/wZPOvBOuZWU00jh8G5V9zTHp+EFdC6SgRL3
 e+quOL7k+2liHod4/1nCT01nNOBe/5BIoYtbVqgKAoBg5+i7EYt2RlUdy+JWSyfJ3uCR
 CtUQ==
X-Gm-Message-State: AOAM5314deOl++9MGPoy7YLdbGAgmPXmZ9NKS9NuSVULJYx/fBXjgg/c
 +u+18FxOHkOjGNw8FplERyc=
X-Google-Smtp-Source: ABdhPJwYhMt2gMhwNZLB8J5sGborl43HOmKpzseUac+5sucFsKDv4qipP1jfRU2yxx/VOb5FtiCQaA==
X-Received: by 2002:ac2:491e:: with SMTP id n30mr2284370lfi.97.1638314673603; 
 Tue, 30 Nov 2021 15:24:33 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:33 -0800 (PST)
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
Subject: [PATCH v16 40/40] ARM: tegra20/30: Disable unused host1x hardware
Date: Wed,  1 Dec 2021 02:23:47 +0300
Message-Id: <20211130232347.950-41-digetx@gmail.com>
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
index 7b69ffc57abe..8010b40d7377 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -59,6 +59,7 @@ mpe@54040000 {
 			reset-names = "mpe";
 			power-domains = <&pd_mpe>;
 			operating-points-v2 = <&mpe_dvfs_opp_table>;
+			status = "disabled";
 		};
 
 		vi@54080000 {
@@ -70,6 +71,7 @@ vi@54080000 {
 			reset-names = "vi";
 			power-domains = <&pd_venc>;
 			operating-points-v2 = <&vi_dvfs_opp_table>;
+			status = "disabled";
 		};
 
 		epp@540c0000 {
@@ -81,6 +83,7 @@ epp@540c0000 {
 			reset-names = "epp";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&epp_dvfs_opp_table>;
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
index 96d1c5688248..c8b22ec30ef0 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -145,6 +145,8 @@ mpe@54040000 {
 			operating-points-v2 = <&mpe_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_MPE>;
+
+			status = "disabled";
 		};
 
 		vi@54080000 {
@@ -158,6 +160,8 @@ vi@54080000 {
 			operating-points-v2 = <&vi_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_VI>;
+
+			status = "disabled";
 		};
 
 		epp@540c0000 {
@@ -171,6 +175,8 @@ epp@540c0000 {
 			operating-points-v2 = <&epp_dvfs_opp_table>;
 
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
2.33.1

