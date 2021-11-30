Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 482834642CF
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC2B6E850;
	Tue, 30 Nov 2021 23:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570626E81D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:30 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id l7so44273195lja.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nDfKTCKLqf9G6JM8mpqxRAZhh67bMGPfUrf1PMFZnmE=;
 b=fhpWDE/W8BPbpYc6LrT3Sd3tL3GRIqLrzCk59WClqm4rHNchu4CExjdl/yfsM6OXDi
 GW7PMw8GvZh5/M28Qh7yeE/PnCVnvTBw3xoaNaJ/bUDC8GUNstcex8ucbctDFUPhlg96
 XbROgohEdgTo8uryBLF23Ou2EqYu7n22+wkAFeSCbBfCaZX0LHMcTfXnfnm5vkG5Asnk
 itNiMnbDj7fRLFLdUlH8U5icIUkUeCio2KfDYw4BNJBeIgeatjNLCUU5bcONLTxWLIQb
 k5IzhApWb39vbgOAeeYilHZa1gM9hjZTLN1R0uYknT/wM2DSquHyZiZBVwYBcS1QhFJx
 0Uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nDfKTCKLqf9G6JM8mpqxRAZhh67bMGPfUrf1PMFZnmE=;
 b=lIYqxxF+XTHcCssLlgt091BWw3DX7xoqDjtN/Edklw/5RNsAa9E6QFhvSZ0b9Mu1qO
 3sZxEh0l7qGeDIA3e+j1d+nsKsRQ3AUkAbjupnbhsKAi4UtxY/JYr7oN1PUBcDsUemBC
 7iUcYIs8J7t7WdajLZJZRWZcTjSvd/7b6WrBW5DTlch6Z6vA623qO+79oV/qvc8ttHHv
 YtPB9lwICfNgq+wfkerqUoSDRG3L5RtxIfJO7acetrGutP2jCEBtLZKT3XgACyAgkMVX
 1CIGfElbtzr2L+tvW/FzeF2zprjEgwodEmbmlryQngJj1YB7BK5vbr1+u4Rd7+kEyu/z
 WZ2w==
X-Gm-Message-State: AOAM531jn3PSO89WJH5Awl2QOdQvXypJktUXVA5jw45pleJPtL51JqUx
 aJ3Jfd6n6xyqkGdEaO9EgmM=
X-Google-Smtp-Source: ABdhPJxFExIlRTXbP3roDYpHOtAksUcXMnHB8sB6CKOzUF0kjCrj0HK7HUUphnePINzZFTW2y05wyw==
X-Received: by 2002:a2e:9b17:: with SMTP id u23mr1975761lji.258.1638314668747; 
 Tue, 30 Nov 2021 15:24:28 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:28 -0800 (PST)
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
Subject: [PATCH v16 35/40] ARM: tegra: Add 500MHz entry to Tegra30 memory OPP
 table
Date: Wed,  1 Dec 2021 02:23:42 +0300
Message-Id: <20211130232347.950-36-digetx@gmail.com>
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

Extend memory OPPs with 500MHz entry. This clock rate is used by ASUS
Transformer tablets.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
index ff25350869b3..af9640401402 100644
--- a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
@@ -216,6 +216,18 @@ opp-450000000-1250 {
 			opp-supported-hw = <0x0008>;
 		};
 
+		opp-500000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <500000000>;
+			opp-supported-hw = <0x0007>;
+		};
+
+		opp-500000000-1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <500000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
 		opp-533000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <533000000>;
@@ -347,6 +359,12 @@ opp-450000000 {
 			opp-peak-kBps = <3600000>;
 		};
 
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <4000000>;
+		};
+
 		opp-533000000 {
 			opp-hz = /bits/ 64 <533000000>;
 			opp-supported-hw = <0x000F>;
-- 
2.33.1

