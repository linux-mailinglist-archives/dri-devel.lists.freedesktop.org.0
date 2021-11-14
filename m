Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C0B44FABA
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D196E8B9;
	Sun, 14 Nov 2021 19:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7AF56E898
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:30 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id m27so13152828lfj.12
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nDfKTCKLqf9G6JM8mpqxRAZhh67bMGPfUrf1PMFZnmE=;
 b=U9lUXFzw+LhuaWEaxuUA4cjMsEa9q1fstmVYcSlHgJO8iH26U05+9jbVKkp1qKcKVj
 4GJu/hfHsAGvCSsQ1elS4Kmp1ZoKQlyblBEOVfwWxbRPGN8QubcTFqbt2m46InfpV8Ty
 apF40BJJS7LmsL1g0T5auPLBCrNUkWildIoaOKVVxn3LQmWIis5wWRArJwTVqUIAkXFK
 5arqBOR+gLRgN8IqK8Q61mEo0IhlqfvXZfnzzjWQMWkRu1cp+QhQVcQbe4FUFVBhTkNj
 xX2gnkkHvapCra28ehcOYyQ7XpI2UHcoQtUgdicJtWLysRSU3K3EM4DLSjCUPuSEFoL0
 9gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nDfKTCKLqf9G6JM8mpqxRAZhh67bMGPfUrf1PMFZnmE=;
 b=RW+4kIfko0XPfpb4/qq74k1MN8/axjm56s3uGFhLmpmtCpyC8PqFqBEK3UKnUYoj00
 xSQ1P1iQgAwwjpucUQFt3eEMd3VcnHWJ1cm80AZQBATVQNNrlLqYWqASIFm01rVuOeWW
 jLavvw4Wo8f7G0hQ0AqzOA1Urk8OtJwWNSWMC9q8XwF4nRrmSRmsngmgwUPXxautldHy
 GJoEX/qKhj/vRS/SRQzUXTr/Q+qc5jbhgUJxe6cO+UDyreZXFvzV+qHU3+6djvgjxuKH
 k6uVDK1cC7Nv7m9gbjxEMxkGGmi9yhnKQr33Oe1asVNzBLaTWRpDP/OxrOP2JsXkT0kT
 9+qw==
X-Gm-Message-State: AOAM530ygCdZ+qONypPfs5aG5uZuzn3ung5/p76eXejO54ObHcJEyh0E
 YLohGfQMNMIQcaqTz6nBtQk=
X-Google-Smtp-Source: ABdhPJyusqVEM1bFGp/6ppX2dZiMhlD13GgviJ+ZpifWluNIUU5CQmBC6K8SfWpu+U2byKbaOvV4Hw==
X-Received: by 2002:a05:6512:152a:: with SMTP id
 bq42mr29718650lfb.109.1636918588958; 
 Sun, 14 Nov 2021 11:36:28 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:36:28 -0800 (PST)
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
Subject: [PATCH v15 34/39] ARM: tegra: Add 500MHz entry to Tegra30 memory OPP
 table
Date: Sun, 14 Nov 2021 22:34:30 +0300
Message-Id: <20211114193435.7705-35-digetx@gmail.com>
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

