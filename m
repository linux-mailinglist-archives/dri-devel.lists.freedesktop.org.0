Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 525102DDFAB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A9389ADC;
	Fri, 18 Dec 2020 08:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE6A6E1F2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:08:13 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id s26so25139218lfc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DnMa2cBERwNvCshkcZIGtYzUizYdSDwH8+FlINjZS+o=;
 b=nGBDtC0LssrkA/xgl49FxWqeuomEM/+ArFanzMzMEGA7xk46eJqVrlO5N6wN2JQXgx
 ASIENxqpmVpFuK7ESxAwjXOiTyJkEmnG6qv7SDFaU0BynG17CnhPdmVlEPOoqGl4mm6N
 +MxaC6pdEu65jWYzV6zRgWGYFLns79jXe8fGVRmiXJ9lvisZbWIOaptqSP35tbVTuqjZ
 GWnXCIBG32kJYzpS4w5GOp74lTeeLOFOgS+Ce4ahS6jgn0biV+2+7pT7nYpr3vOR20Mo
 SEpvYMg9qqttuOc5EiuBgetb2icZ++FBfLBVG1YoVBG/OymCXngPlGOmB/uUD5M+spu4
 VeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DnMa2cBERwNvCshkcZIGtYzUizYdSDwH8+FlINjZS+o=;
 b=t2U39dRRm0W477MdimABqjbdaMx2QUH613jZCCGt46dUr91fYxTRLUPETCw/tJsOdc
 af1IHBp6lPP1/lG+05wbo4YUdmTHhCqFOYYEqG7wlFql0rwJEBY+o/HPc6P34klPvT23
 yapM1wrtyGP7IPUHQGqeUi2OzURirdMutZfGm022rgCoKC+iTYwMuFq8BT3PZvSKzjtl
 6RPzrmyu9XEEyR3dnZ1i68BrGyOungpT2oIygXJ5OB/5icqK9M3j1JfzJKIjGKnW9FFH
 S79CYEe1CrolWTnYXCSKOX6lwdQ5dsneTw9J1FAFf+/l2uJtIXqaQk4nOBnqwOXk9h76
 OwQw==
X-Gm-Message-State: AOAM531rWUHQnY811VCG3++LYTXSwOAReXx/757hAVjCI6AjK5DJKbv5
 pBdK/9aQoWlouQpx+bR1Gcw=
X-Google-Smtp-Source: ABdhPJxK1jf/bwqucZvsz55FDatdpoVwAeTBPQ/w/sO44sRzQ468CuHtA9cdQUMcur4nHvtg9vjUgA==
X-Received: by 2002:a05:651c:120f:: with SMTP id
 i15mr214039lja.339.1608228492131; 
 Thu, 17 Dec 2020 10:08:12 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:08:11 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 45/48] ARM: tegra: acer-a500: Enable core voltage scaling
Date: Thu, 17 Dec 2020 21:06:35 +0300
Message-Id: <20201217180638.22748-46-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow lower core voltages on Acer A500.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 78b307370a46..6b851cab0efa 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -578,7 +578,7 @@ sys_reg: sys {
 
 				vdd_core: sm0 {
 					regulator-name = "vdd_sm0,vdd_core";
-					regulator-min-microvolt = <1200000>;
+					regulator-min-microvolt = <950000>;
 					regulator-max-microvolt = <1300000>;
 					regulator-coupled-with = <&rtc_vdd &vdd_cpu>;
 					regulator-coupled-max-spread = <170000 550000>;
@@ -619,7 +619,7 @@ ldo1 {
 
 				rtc_vdd: ldo2 {
 					regulator-name = "vdd_ldo2,vdd_rtc";
-					regulator-min-microvolt = <1200000>;
+					regulator-min-microvolt = <950000>;
 					regulator-max-microvolt = <1300000>;
 					regulator-coupled-with = <&vdd_core &vdd_cpu>;
 					regulator-coupled-max-spread = <170000 550000>;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
