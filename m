Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 885472AEA74
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDE289F35;
	Wed, 11 Nov 2020 07:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD3789E0E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:15:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j7so748417wrp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D4xxkreIJbgC8EFiVFdpV6nY5vDKa+iyrBL3x6vFvF8=;
 b=g6gOJh1jjwealV3mKR/Dun5EQuRfa9WTYNQboVg1HmRA95s8fLDxATpNPx24sO7yka
 VNvQOplH4O9C1z2tSR+y1xu6V030ys92UvcK61Q2Vc3N/m9TPKxO8LaP9rhr3+u6tkB6
 fl2VQdV5vTPjBwcLIBqmMYGHMAzUWuQ14kVlS7bTc6ZF48HOU5QGrDM446i6ga8Fb1N1
 +iZdZAXljIzSYmTYyXrqnDsv/FLKLI5hf4tTnPILoUKuNTfu+7iMVXGA3gq0aJ/CyDVP
 Mq+dlGPasi2/eiHm/Xq1byDEoK5ubpxeWsEoeg9GIwsrss9nd/y+jkrhoiqupmeOMGf6
 ATnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D4xxkreIJbgC8EFiVFdpV6nY5vDKa+iyrBL3x6vFvF8=;
 b=pLRqZmKBXHqd4wG8vDMtzkBiJj+B2c9RAwweiQ8R4DsIldTPNLmXV9+qcARXgCJTWg
 HvYpsBqL10OMA1Hl6ST1Z6R5I5+6Q/eSoqIvjCWEqb493/4mt7EzbA1FXlHtd+ZU0Dwv
 BT4DTjJ5hi9iB2YT6XFsYwLGsXb5mM0LyI1j+TdPkfZGbzKDHjtNOCxOzjLw9HT3POvp
 sc2aM9tjmeqbYb0lDD7G7NDtUYmEndqbQhhMRYIJgyw1x0ucSLgNkRqT6Q2OwQiBnqYp
 UPp0JFVFZqTxdZceJNr+Kvlin33alA9HVG4g8r6fklO+rNd+w4M0SAXq9YQInk6Y4zvO
 qKLg==
X-Gm-Message-State: AOAM5332kjXl66QAfuZ/ZgZJgypDpXsLaBB+UPT1C9vLKF9FkshXb4qr
 vMNCg8itYbW3h+hgojHxm6Y=
X-Google-Smtp-Source: ABdhPJyIORm7fmfi7Ia+QnzhJraA0tEtiN8zTgAl81vfBixVs8x/NMoUEkntPyu2M9dyBYnduNiQ4g==
X-Received: by 2002:adf:f245:: with SMTP id b5mr27020581wrp.389.1605057341880; 
 Tue, 10 Nov 2020 17:15:41 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id g131sm564329wma.35.2020.11.10.17.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 17:15:41 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v8 19/26] ARM: tegra: Correct EMC registers size in Tegra20
 device-tree
Date: Wed, 11 Nov 2020 04:14:49 +0300
Message-Id: <20201111011456.7875-20-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111011456.7875-1-digetx@gmail.com>
References: <20201111011456.7875-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the size of Tegra20 EMC registers, which should be twice bigger.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 72a4211a618f..9347f7789245 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -634,7 +634,7 @@ mc: memory-controller@7000f000 {
 
 	memory-controller@7000f400 {
 		compatible = "nvidia,tegra20-emc";
-		reg = <0x7000f400 0x200>;
+		reg = <0x7000f400 0x400>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 		#address-cells = <1>;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
